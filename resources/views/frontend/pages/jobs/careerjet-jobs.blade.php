@extends('frontend.layouts.app')

@section('title')
    {{ __('careerjet_jobs') }}
@endsection

@section('main')
    <div class="joblist-content">
        <div class="container">
            <div class="row">
                {{-- Careerjet jobs --}}
                @if (isset($careerjet_jobs) && isset($careerjet_jobs->jobs) && count($careerjet_jobs->jobs))
                <div class="col-12 mt-5 pt-5">
                    <h4 class="tw-text-center">
                        {{ __('latest_jobs_from') }}
                        <a href="https://www.careerjet.com/">
                            <svg height="25" width="80" xmlns="http://www.w3.org/2000/svg"
                                viewBox="0 0 148 46">
                                <path
                                    d="M115 12V38c0 1.1 0 2.6-.2 3.5L114 43a6.2 6.2 0 0 1-1.2 1.4c-.8.6-1.6 1-2.6 1.3a6.3 6.3 0 0 1-1.6.2h-1.8v-5.7a2.7 2.7 0 0 0 1.6-.6 2.6 2.6 0 0 0 1-2V12h5.6zm-83.5-.5a8 8 0 0 1 3.8 2 7.9 7.9 0 0 1 2.3 5v15.3s-2.6.5-5.6.7c-2.9.2-5.4.2-6 .2-.6 0-2.6-.1-4.2-1.1a7.3 7.3 0 0 1-3.3-6c0-.6 0-3.2 2-5.3 2-2 4.4-2.1 5-2.1h.3a55.1 55.1 0 0 1 2.8 0l3.3.3v-.9c0-.6-.1-1.5-.8-2.1-.7-.6-1.8-.9-3.5-.9a13.8 13.8 0 0 0-4.6.8l-2-4.7c1-.5 2.7-.8 5-1.1a17 17 0 0 1 5.5-.1zM11 11.3c2.5 0 4.9 1 6.7 2.5a710.3 710.3 0 0 1-3.5 4.2c-.8-.7-1.9-1-3.2-1-2.1 0-5.3 1.8-5.3 6s3.2 6 5.3 6c1.2 0 2.2-.3 3-.9l.2-.1 3.5 4.2c-1 .8-2 1.4-3.1 1.9-1 .3-2 .5-3.2.6h-.7c-2.9-.1-5.4-1.3-7.3-3.2A12 12 0 0 1 0 23c0-6.4 5-11.7 11-11.7zM144.8 0v12h3.2v5.7h-3.2v8.6c0 .3 0 .7.2 1.2a2.6 2.6 0 0 0 1.3 1.2l.8.3H148v5.7h-1.8c-.8 0-1.4 0-2.3-.2-1-.3-1.8-.7-2.5-1.4a6.2 6.2 0 0 1-1.2-1.3c-.4-.6-.6-.9-.8-1.7-.3-.8-.3-2.2-.3-3.3V3.2l5.7-3.2zM62.1 11.3c1.5 0 4.7.6 7 3.3 2.2 2.6 2.2 6.3 2.2 7.7 0 1 0 1.9-.3 2.8H57.5c0 1.3.9 2.5 1.7 3.2 1 .7 3 1 4.2 1a15.5 15.5 0 0 0 4.9-.7l2.1 4.7a12.7 12.7 0 0 1-3.1 1 27.7 27.7 0 0 1-4.5.4c-.8 0-5.5-.2-8.4-3.5-2.9-3.3-3-7.2-3-7.8 0-1.2.2-2.4.5-3.9.2-.8.9-2.7 2.2-4.4a10 10 0 0 1 8-3.8zm21.7 0c1.5 0 4.6.6 6.9 3.3 2.2 2.6 2.3 6.3 2.3 7.7 0 1-.1 1.9-.4 2.8H79.1c0 1.3 1 2.5 1.8 3.2.9.7 2.9 1 4.1 1a15.5 15.5 0 0 0 4.9-.7l2.2 4.7a12.6 12.6 0 0 1-3.2 1 28 28 0 0 1-4.4.4c-.9 0-5.6-.2-8.5-3.5-2.8-3.3-2.9-7.2-2.9-7.8 0-1.2.1-2.4.5-3.9.2-.8.8-2.7 2.2-4.4a10 10 0 0 1 4-3c1.3-.6 2.4-.8 4-.8zm44 0c1.5 0 4.6.6 6.9 3.3 2.3 2.6 2.3 6.3 2.3 7.7 0 1-.1 1.9-.4 2.8h-13.4c0 1.3.8 2.5 1.7 3.2.9.7 2.9 1 4.1 1a15.5 15.5 0 0 0 5-.7l2 4.7a12.6 12.6 0 0 1-3 1 27.8 27.8 0 0 1-4.5.4c-.9 0-5.6-.2-8.4-3.5-3-3.3-3-7.2-3-7.8 0-1.2.1-2.4.5-3.9.2-.8.8-2.7 2.2-4.4a10 10 0 0 1 8-3.8zm-80.2 0a29.8 29.8 0 0 1 4.2.4l-2.1 5.5a5.3 5.3 0 0 0-.5-.1 5.2 5.2 0 0 0-1-.1 4 4 0 0 0-2 .7V34h-5.7V12.4l3.2-.8a22.9 22.9 0 0 1 3.9-.3zm55 0a29.8 29.8 0 0 1 4.2.4l-2.1 5.5a5.3 5.3 0 0 0-.5-.1 5.2 5.2 0 0 0-1-.1 4 4 0 0 0-2 .7V34h-5.7V12.4l3.2-.8a22.9 22.9 0 0 1 3.9-.3zM27 24.8c-1.8 0-3.2 1.2-3.2 2.6s1.4 2.7 3.2 2.7l1.7-.1 3.2-.3v-4.6a384 384 0 0 1-3.2-.3H27zm34.4-8.2a4 4 0 0 0-1.8.4 3.7 3.7 0 0 0-1.2 1 4.2 4.2 0 0 0-.7 1.3c-.2.5-.2 1-.2 1.6h7.8l-.1-1.6a3.8 3.8 0 0 0-.7-1.3 3.7 3.7 0 0 0-1.2-1c-.5-.2-1.2-.4-1.9-.4zm21.6 0a4 4 0 0 0-1.7.4 3.7 3.7 0 0 0-1.2 1 4.2 4.2 0 0 0-.8 1.3c-.2.5-.2 1-.2 1.6H87v-1.6A3.8 3.8 0 0 0 86 18a3.7 3.7 0 0 0-1.2-1c-.4-.2-1.1-.4-1.8-.4zm44 0a4 4 0 0 0-1.7.4 3.7 3.7 0 0 0-1.2 1 4.2 4.2 0 0 0-.8 1.3c-.2.5-.1 1-.1 1.6h7.8c0-.4 0-1.1-.2-1.6a3.8 3.8 0 0 0-.7-1.3 3.7 3.7 0 0 0-1.2-1c-.4-.2-1.1-.4-1.8-.4zM112.3 2.5c1 0 1.7.3 2.4 1 .8.6 1.1 1.4 1.1 2.5s-.3 2-1 2.6a3.6 3.6 0 0 1-2.5 1 3.6 3.6 0 0 1-2.5-1c-.7-.6-1.1-1.5-1.1-2.6 0-1 .4-2 1-2.6a3.6 3.6 0 0 1 2.6-1z">
                                </path>
                            </svg>
                        </a>
                    </h4>
                    {{-- Filter job --}}
                    @include('frontend.pages.jobs.job-history')
                    <hr>
                    <div class="row">
                        @forelse ($careerjet_jobs->jobs as $job)
                            <div class="col-lg-6 py-1">
                                <div class="card iconxl-size jobcardStyle1 ">
                                    <div class="card-body">
                                        <div class="rt-single-icon-box icb-clmn-lg ">
                                            <a target="_blank" href="{{ $job->url }}" class="iconbox-content">
                                                <div class="post-info2">
                                                    <div class="post-main-title">
                                                        {{ $job->title }}
                                                        @if ($job->company)
                                                            <span
                                                                class="badge rounded-pill bg-primary-50 text-primary-500">
                                                                {{ $job->company }}
                                                            </span>
                                                        @endif
                                                    </div>
                                                    <div class="body-font-4 text-gray-600 pt-2">
                                                        <p>{!! $job->description !!}</p>
                                                        <span class="info-tools">
                                                            <x-svg.location-icon/>
                                                            {{ $job->locations }}
                                                        </span>
                                                        <span class="info-tools">
                                                            <x-svg.calender-icon/>
                                                            <span>{{ $job->date }}</span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </a>
                                            <div class="iconbox-extra align-self-center">
                                                <div>
                                                    <a href="{{ $job->url }}" target="_blank"
                                                        class="btn btn-primary2-50">
                                                        <span class="button-content-wrapper ">
                                                            <span class="button-icon align-icon-right"><i
                                                                    class="ph-arrow-right"></i></span>
                                                            <span class="button-text">{{ __('details') }}</span>
                                                        </span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @empty
                            <div class="col-md-12">
                                <div class="card text-center">
                                    <x-not-found message="{{ __('no_data_found') }}" />
                                </div>
                            </div>
                        @endforelse
                    </div>
                </div>
                @endif
            </div>
        </div>
    </div>
    <div class="rt-spacer-100 rt-spacer-md-50"></div>

    {{-- Subscribe Newsletter --}}
    <x-website.subscribe-newsletter />

    <form action="{{ route('website.careerjet.job') }}" id="affiliate_form">
        <input type="hidden" name="keyword" value="{{ request('keyword') }}">
        <input type="hidden" name="category" value="{{ Route::current()->parameter('category') }}">
    </form>
@endsection

@push('frontend_scripts')
    <script>
        function keywordClose() {
            $('input[name="keyword"]').val('');
            $('#affiliate_form').submit();
        }

        function categoryClose() {
            $('input[name="category"]').val('');
            $('#affiliate_form').submit();
        }
    </script>
@endpush
