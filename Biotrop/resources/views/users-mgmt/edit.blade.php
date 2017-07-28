@extends('users-mgmt.base')

@section('action-content')
<section class="content">
    <div class="box">
        <div class="box-header">
            <div class="row">
                <div class="col-md-8">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-11">
                                <div class="box-title">
                                    <h4>Update user</h4>
                                </div>
                                    <div class="box">
                                        <form class="form-horizontal" role="form" method="POST" action="{{ route('user-management.update', ['id' => $user->id]) }}" style="margin-top:10px">
                                            <input type="hidden" name="_method" value="PATCH">
                                            <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                        
                                            <div class="form-group{{ $errors->has('user_type') ? ' has-error' : '' }}">
                                                <label for="user_type" class="col-md-2 col-md-offset-1">User Type</label>

                                                <div class="col-md-6">
                                                    <select id="user_type" type="text" class="form-control" name="user_type" value="{{ $user->user_type }}" required>
                                                        <option>-- Select --</option>
                                                        <option value="{{ $user->user_type }}">Operator</option>
                                                        <option value="{{ $user->user_type }}">Verifikator</option>
                                                    </select>
                                                    @if ($errors->has('user_type'))
                                                        <span class="help-block">
                                                            <strong>{{ $errors->first('user_type') }}</strong>
                                                        </span>
                                                    @endif
                                                </div>
                                            </div>

                                            <div class="form-group{{ $errors->has('username') ? ' has-error' : '' }}">
                                                <label for="username" class="col-md-2 col-md-offset-1">Username</label>

                                                <div class="col-md-6">
                                                    <input id="username" type="text" class="form-control" name="username" value="{{ $user->username }}" required autofocus>

                                                    @if ($errors->has('username'))
                                                        <span class="help-block">
                                                            <strong>{{ $errors->first('username') }}</strong>
                                                        </span>
                                                    @endif
                                                </div>
                                            </div>
                                        
                                            <div class="form-group{{ $errors->has('firstname') ? ' has-error' : '' }}">
                                                <label for="firstname" class="col-md-2 col-md-offset-1">First Name</label>

                                                <div class="col-md-6">
                                                    <input id="firstname" type="text" class="form-control" name="firstname" value="{{ $user->firstname }}" required>

                                                    @if ($errors->has('firstname'))
                                                        <span class="help-block">
                                                            <strong>{{ $errors->first('firstname') }}</strong>
                                                        </span>
                                                    @endif
                                                </div>
                                            </div>
                                        
                                            <div class="form-group{{ $errors->has('lastname') ? ' has-error' : '' }}">
                                                <label for="lastname" class="col-md-2 col-md-offset-1">Last Name</label>

                                                <div class="col-md-6">
                                                    <input id="lastname" type="text" class="form-control" name="lastname" value="{{ $user->lastname }}" >

                                                    @if ($errors->has('lastname'))
                                                        <span class="help-block">
                                                            <strong>{{ $errors->first('lastname') }}</strong>
                                                        </span>
                                                    @endif
                                                </div>
                                            </div>
                                        
                                            <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                                                <label for="password" class="col-md-2 col-md-offset-1">New Password</label>

                                                <div class="col-md-6">
                                                    <input id="password" type="password" class="form-control" name="password">

                                                    @if ($errors->has('password'))
                                                        <span class="help-block">
                                                            <strong>{{ $errors->first('password') }}</strong>
                                                        </span>
                                                    @endif
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="password-confirm" class="col-md-2 col-md-offset-1">Confirm Password</label>

                                                <div class="col-md-6">
                                                    <input id="password-confirm" type="password" class="form-control" name="password_confirmation">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-md-6 col-md-offset-4 text-right">
                                                    <button type="submit" class="btn btn-primary">Update</button>
                                                    <button type="submit" class="btn btn-secondary" style="margin-left:10px" onclick="window.location='{{url("user-management")}}'">Cancel</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
