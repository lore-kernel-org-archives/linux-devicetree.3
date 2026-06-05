Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F123603DD
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780674279; cv=none; b=XM0aJHg6b5vE2+iUmRZNWdBqaK+zrsdjOi6NMWCXHtH4hzKEsnp24ES9Mzl4obbZ7fEGo7sOy/Te/m1VXp/1+IIEXoI3JTOzTCAYCZR3laE+3bv3VOD9S0mtnLl9n5CvlRPGRB5tmG8SeaKUay1dCaB2EZnHku+AFuBlRFG4bjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780674279; c=relaxed/simple;
	bh=QTha33AcsGXLqeJoB7ThtoiTamYthYSeoS5Y5QadO/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPR+F5NeXbma3WIJuRs7t9VUg6nkUGfuljNYv0hIYQQ8fRhpYrq0yghpJQwPp6wI5VydMwU5HZ4+gfF09Bnk7C8N44GcAWmx+4RwP2qTl+0iYTBg87PMOICBWY4JqcTEJAxVgXJSVZgBtW84m/Occd6xdTR2FsCG7p2uz6jqHBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R9nw5l46; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R9nw5l46"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9639fa0636bso1683170241.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 08:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780674277; x=1781279077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZktE3L5rKfoN1/el6TuB/5aSd1JOfP8XWyiHhYJAdA=;
        b=R9nw5l46H+BQQonVeXJJRK/O9oZZ3tUL4d3XDdxUCDgcOMGlq+6dxiswq3hGQEl/36
         7MJXwahoPO4W/HMoLWRw27eGeALHWCaRb8JZTz5l+0b97RTl4TebknOdX9HAxWK9SMrX
         2jXKhEm64NgcaAruxBmhFq5LUJSgo9jxyP3Uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780674277; x=1781279077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CZktE3L5rKfoN1/el6TuB/5aSd1JOfP8XWyiHhYJAdA=;
        b=RY5JpKIJEPuWBvoJhi73IxGsj01kEmUqYTrZ331U7AyPRMufmy8FUxNz43lgVEgAfe
         zRG4SjprpNFf+E5WpMqZDOq//9FNUdL4emkaxw7Bd9lZjydXrlbnSsj8IgBfjiQdWcPt
         JQEytuXGroq4ozodu1haIFZrynGIzkV9LJ6DYUGP735S0NZKIYR4ZL78LbEcHBqBIpsx
         2Lc7uQ857JCiNWkjtDEsve63+vm3u+GrMI9Oao5gGajinO1p1E2jBZGEvqu9h+FRhu3N
         YchAPxnD+fpHyr5WJFKl075u7vmPy0O53BZswv8mApUOzhMP5VNarQVbI8gx79EL5lvH
         meww==
X-Forwarded-Encrypted: i=1; AFNElJ84ul14uOb+MnjtBSBprGbMKKr9ssIFCNYUWypiJgHZ6krGIRQflIDxLdUK05fx3VDZNRM4VE2LDjEB@vger.kernel.org
X-Gm-Message-State: AOJu0YyC7mh0E1jGBxOV9idTwKDE9UQLVsnaXQugNe1AR1LVbqCiudru
	ZWTju2nvlCDWAgTP8P0F2xd6rQn0Y1UIF9BBeIHCF0dsytOKBu1zdipROOxMPGVRYdH04XvoIHN
	41ik=
X-Gm-Gg: Acq92OHWC26iy2Prfn/Oy/NR8IGelS6+kKAXs4ZJRTJxF3xpT7KMvaIlIUZRk2x+7JC
	PdYStJh/zqBJXArQiF1vtAdibPbSYRfrUdLg/7KZproE08HQHb+S9RNbAej5wlQvq9jQF3ky/JJ
	a8+GD7CCEutz5jwYDr5SG1oFYxB/C+0RHheql6BnX7hh8KuZp+Ww2h3KFI2Dr4csRJan+hDIJJv
	V3ORk8/AUFtvAxZ7xPBCPmiglgdMot6q6qSqXXVqR5G+deGndVxF93sbTCMtObz155y6jxz9dwt
	vTR3Dv6vPv1462cRsrCSwaJgus6EWG1bMf6oTKlgqaxzRz0NFb3tYuMMZ22x5GD/+bvpk60EH7C
	BhqCvvDQswGSpgkPOvPapFuBJDBloyfT+q2AOmEx+0lv7hQL3riSJCTQoMUja+p/zLKr/oxgnsr
	FhGOdq6KANqKBNeJQ/a6sJVDJyYAilx9S7bOjYqN1NSDSg70IJazI6idgXI2oZ/otewth+A9kl
X-Received: by 2002:a05:6102:688f:b0:634:2450:7998 with SMTP id ada2fe7eead31-7002e27166amr1149533137.4.1780674277585;
        Fri, 05 Jun 2026 08:44:37 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb5745d325sm7978547137.4.2026.06.05.08.44.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 08:44:35 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9639fa0636bso1683152241.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 08:44:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+IsbQm1gt8Er3R9IwHRyg0UHTsGLkBC9ov7/Jqk+zlaXQvFg/EMMzC8mDgwI6zZxTasXYDTpOaKijE@vger.kernel.org
X-Received: by 2002:a05:6102:8347:10b0:6b4:d9ba:d9d2 with SMTP id
 ada2fe7eead31-7002d6be5e9mr1035796137.6.1780674274409; Fri, 05 Jun 2026
 08:44:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-1-57c70c23d0d6@oss.qualcomm.com>
 <CAD=FV=UaPKiGSL6mhVdywp67skSr2B7977f3kZ23FFHaD=95RQ@mail.gmail.com> <20260605152825.GA3740391-robh@kernel.org>
In-Reply-To: <20260605152825.GA3740391-robh@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Jun 2026 08:44:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U7jz-xwA+-Fic2thZaK6eCDhc-PZ1fqpCMAUmy3V3Y+Q@mail.gmail.com>
X-Gm-Features: AVVi8CdDy3XFBVBoorpIXJgEbshGHoXa78jsg55oeGuqaaVdEdPTZn0YzBf-fxQ
Message-ID: <CAD=FV=U7jz-xwA+-Fic2thZaK6eCDhc-PZ1fqpCMAUmy3V3Y+Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: samsung,atna33xc20: Add ATNA40HQ08-0
To: Rob Herring <robh@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 5, 2026 at 8:28=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> > > --- a/Documentation/devicetree/bindings/display/panel/samsung,atna33x=
c20.yaml
> > > +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33x=
c20.yaml
> > > @@ -25,6 +25,8 @@ properties:
> > >                - samsung,atna40ct06
> > >                # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED pan=
el
> > >                - samsung,atna40cu11
> > > +              # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED pan=
el
> > > +              - samsung,atna40hq08
> >
> > Sure. I'll repeat the same comment I made the last time someone landed
> > a change to this file [1] in the hopes that maybe someone will post a
> > patch one day:
> >
> > <repeat>
> > Given how many of these we're up to now, I'm starting to wonder if we
> > should come up with a generic compatible like we did with "edp-panel"
> > and then we can stop having to merge CLs like this. All of these
> > Samsung OLED eDP panels have the same power up sequence and once we do
> > that then we can read them via EDID or via DP AUX bus to identify
> > which specific panel we have and if they need additional tweaking,
> > just like we do with "edp-panel". Do DT folks have any opinion about
> > that? Coming up with a name would be a pain since I wouldn't want to
> > assert that all future Samsung OLED eDP panels will have the same
> > powerup sequence. Maybe "samsung,amoled-edp-panel-v1" even though that
> > sounds terrible and there's no known need for a "-v2"?
> > </repeat>
>
> If things are the same, then perhaps there should be a fallback
> compatible. Or just reuse an existing compatible.

Right, there already is a fallback comparible. This patch is just
adding a string to the enum that has the fallback compatible
"samsung,atna33xc20". So someone using this new panel will use:

compatible =3D "samsung,atna40hq08", "samsung,atna33xc20"

My point was that listing specific panel isn't really valuable here.
Though the "samsung" power sequence isn't completely compatible with
the generic "eDP panel" power sequence (which is why they have
separate drivers), just like generic "eDP panel"s we can query the
panel ID if there are any per-panel quirks.

So the question is: should we stop adding specific panels and just
always list "samsung,atna33xc20" for all Samsung panels with a
compatible power sequence, is it worth it to add a more generic name,
or should we really keep listing all these individual panels for no
real gain.


> I can in no way
> prevent someone from using 'foo-panel' in their DT when the h/w is
> actually a foobar panel if the differences are transparent to s/w. (But
> I will reject a quirk property later on when foobar turns out to be
> different than foo.)

It's more a question of what guidance we tell people. Here, Konrad is
trying to do "the right thing" by listing his specific panel and then
using the fallback. I'm saying "listing the specific panel isn't
gaining you anything" and I'd rather not have to review / apply these
pointless additions to the bindings.

...but I can imagine people will be upset if I tell them to list
"samsung,atna33xc20" for all compatible Samsung AMOLED panels. It
would be nicer to come up with some sort of generic name?

-Doug
