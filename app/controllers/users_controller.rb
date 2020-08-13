class UsersController < ApplicationController
    def login
        @user = User.new
    end

    def check
        parameters = params.require(:user).permit(:email, :password)
        if (parameters[:email].empty? || parameters[:password].empty?)
            session[:error] = "Missing email or password"
            redirect_to login_path
        else
            named = User.find_by({name: parameters[:email], password: parameters[:password]})
            emailed = User.find_by({email: parameters[:email], password: parameters[:password]})
            if (!named.nil?)
                session[:user_id] = named.id
                redirect_to root_path
            elsif (!emailed.nil?)
                session[:user_id] = emailed.id
                redirect_to root_path
            else
                session[:error] = "Invalid email or password"
                redirect_to login_path
            end
        end
    end

    def logout
        session.delete(:user_id)
        redirect_to login_path
    end

    def register
        @user = User.new
    end

    def create
        parameters = params.require(:user).permit(:email, :password, :name)
        if (parameters[:email].empty? || parameters[:email].empty? || parameters[:email].empty?)
            session[:error] = "Invalid or missing email, password or name"
            redirect_to register_path
        else
            user = User.create(parameters)
            session[:user_id] = user.id
            redirect_to root_path
        end
    end

    def show
        @user = User.find_or_initialize_by(id: params[:id])
        if (@user.email.nil?)
            redirect_to root_path
        end
        @picture = Picture.find_or_initialize_by(userId: params[:id])
        @cv = Cv.find_or_initialize_by(userId: params[:id])
    end

    def edit
        if (session[:user_id] == params[:id])
            redirect_to user_path(params[:id])
        end
        @user = User.find(params[:id])
        @picture = Picture.find_or_initialize_by(userId: params[:id])
        @cv = Cv.find_or_initialize_by(userId: params[:id])
    end

    def update
        parameters = params.require(:user).permit(:description)
        user = User.find(session[:user_id])
        user.description = parameters[:description]
        user.save
        redirect_to user_path(session[:user_id])
    end

end