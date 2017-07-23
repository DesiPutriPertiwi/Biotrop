@extends('profile-base')
@section('action-content')
<!-- Main content -->
<section class="content">
  <div class="box">
    <div class="box-header">
      <div class="row">
        <div class="col-sm-8">
          <div class="container">
            <div class="row">
              <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-default">
                  <div class="panel-heading"> Edit Profile </div>
                    <div class="panel-body">
                      <form class="form-horizontal" role="form" method="POST" action="[{Auth::user{}->username}]">
                        <input type="hidden" name="_method" value="PATCH">
                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                          <div class="form-group{{ $errors->has('username') ? ' has-error' : '' }}">
                              <label for="username" class="col-md-4 control-label">Username</label>

                              <div class="col-md-6">
                                  <input id="username" type="text" class="form-control" name="username" value="{{ Auth::user()->username }}" required autofocus>

                                  @if ($errors->has('username'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('username') }}</strong>
                                      </span>
                                  @endif
                              </div>
                          </div>

                          <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                              <label for="email" class="col-md-4 control-label">Email</label>

                              <div class="col-md-6">
                                  <input id="email" type="email" class="form-control" name="email" value="{{ Auth::user()->email }}" required>

                                  @if ($errors->has('email'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('email') }}</strong>
                                      </span>
                                  @endif
                              </div>
                          </div>
                          <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                              <label for="password" class="col-md-4 control-label">Current Password</label>

                              <div class="col-md-6">
                                  <input id="password" type="password" class="form-control" name="password" required>

                                  @if ($errors->has('password'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('password') }}</strong>
                                      </span>
                                  @endif
                              </div>
                          </div>
                          <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                              <label for="password" class="col-md-4 control-label">New Password</label>

                              <div class="col-md-6">
                                  <input id="password" type="password" class="form-control" name="password" required>

                                  @if ($errors->has('password'))
                                      <span class="help-block">
                                          <strong>{{ $errors->first('password') }}</strong>
                                      </span>
                                  @endif
                              </div>
                          </div>
                          <div class="form-group">
                              <label for="password-confirm" class="col-md-4 control-label">Confirm Password</label>

                              <div class="col-md-6">
                                  <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
                              </div>
                          </div>

                          <div class="form-group">
                              <div class="col-md-6 col-md-offset-4 text-right">
                                  <button type="submit" class="btn btn-primary">Edit Profile</button>
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
    </div>
  </div>
</section>

@endsection
