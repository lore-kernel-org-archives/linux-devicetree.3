Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9C4386564
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 17:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780679690; cv=none; b=JLQjY0OVkou+gS1x7GaeE0kkHYy1NSB5Hl2WFx+IHrDz+9q75lTt4VtYAr1S4GQmzXOW5myZ1ikfwYBimRhmoUr07XeItUCySQ0AQ/8uRA7Ucbg64GYUULCgGwL3KB96O+8vcGdqLsTtRDR8oqOchVO8Gx1nYDbw3nDdjFwCRRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780679690; c=relaxed/simple;
	bh=etcX7CEbD7K5sg+x4SMZnN+iKLow2nvlCQUFEC7JeJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e+eeGW1Zk9XeG5BmhUpySOihTms6T/rkPbUnCFhC1GYaCRpjq++GouCCIKEvRQZU98P0prDnqjEvCEX6tReRsjQNTyTYWSV9ftVqHG2BCSB/pM0ODuQc18jioRBNjmnqnERnT1JzPXUqps/nNA5Mi19l5F7dWNWxY8BDbj9F/fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBo9s2kO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBo9s2kO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4971F008A1
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780679683;
	bh=IcRm456QdtU6z5KIdxsLtZziLg7NX4skuuvLNBIybyw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XBo9s2kO9HPWcWLQQgb/4VfXrAud77BeQaoESzvh6Rz+HE7dm/YAsque+CvthiLnr
	 YApuGQtEjiHlm+//dNbwwyAWjSz4rSaGHJM5oMKXjMvRD2JSnZ8IeoLN8BJAecmZo2
	 XJ85yq/AF4znfTA7DTWNigfLHjSgPj5/0yOX03i6LGt9M6CWCCFAGZHRZa5OIWIpt3
	 4vsFJyHfHdPGPgjgb3fYGXpssGechEfYFhdsLcqf3BDtkg4MKo9mZc/TMUVRIUXHGr
	 q7mV6YzVxGwRyKWnAYjV50Un7aIe3q0GbEGP2HcZ3sEI4fP1vngLCJgqdJ/wGSqr3p
	 OUemj2letzkaw==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bebde89cfd3so262106866b.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 10:14:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+2v+jOphIHgH63sXStUiKXymi5cZvZAm8chKLS+3XNLtHTZYmBJLbC9ddz+XnAjR3OcpX7lg5FA9SX@vger.kernel.org
X-Gm-Message-State: AOJu0YxwJgpE+YEzfTjQVpYQgbk0Bi8KCT1BtnKBnOGfsd6In50qplNB
	c388LpXJ2MUnXCZq5FGSJgR+Uzi4feWo47vbF1HZLRWLF+hXMKhBlMBiMOjKua+u1vmgx/+spDH
	Qai9QCEhjKIXtRaq/ejAFxIJpkPKsZg==
X-Received: by 2002:a17:907:c70f:b0:beb:2de3:1ba3 with SMTP id
 a640c23a62f3a-bf370379589mr241934066b.2.1780679681461; Fri, 05 Jun 2026
 10:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-1-57c70c23d0d6@oss.qualcomm.com>
 <CAD=FV=UaPKiGSL6mhVdywp67skSr2B7977f3kZ23FFHaD=95RQ@mail.gmail.com>
 <20260605152825.GA3740391-robh@kernel.org> <CAD=FV=U7jz-xwA+-Fic2thZaK6eCDhc-PZ1fqpCMAUmy3V3Y+Q@mail.gmail.com>
In-Reply-To: <CAD=FV=U7jz-xwA+-Fic2thZaK6eCDhc-PZ1fqpCMAUmy3V3Y+Q@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 5 Jun 2026 12:14:29 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK6u=x=ScTnW1jJCPZpCUb3mT0NZpsKqe6PqZmrNEKZiQ@mail.gmail.com>
X-Gm-Features: AVVi8Cf3FUFFsPi6lWnAyjgHAqmELGslnJKlwX5WVRthEjFEy8iH_Hc4jJmXkXI
Message-ID: <CAL_JsqK6u=x=ScTnW1jJCPZpCUb3mT0NZpsKqe6PqZmrNEKZiQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: samsung,atna33xc20: Add ATNA40HQ08-0
To: Doug Anderson <dianders@chromium.org>
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

On Fri, Jun 5, 2026 at 10:44=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Jun 5, 2026 at 8:28=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
> >
> > > > --- a/Documentation/devicetree/bindings/display/panel/samsung,atna3=
3xc20.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna3=
3xc20.yaml
> > > > @@ -25,6 +25,8 @@ properties:
> > > >                - samsung,atna40ct06
> > > >                # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED p=
anel
> > > >                - samsung,atna40cu11
> > > > +              # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED p=
anel
> > > > +              - samsung,atna40hq08
> > >
> > > Sure. I'll repeat the same comment I made the last time someone lande=
d
> > > a change to this file [1] in the hopes that maybe someone will post a
> > > patch one day:
> > >
> > > <repeat>
> > > Given how many of these we're up to now, I'm starting to wonder if we
> > > should come up with a generic compatible like we did with "edp-panel"
> > > and then we can stop having to merge CLs like this. All of these
> > > Samsung OLED eDP panels have the same power up sequence and once we d=
o
> > > that then we can read them via EDID or via DP AUX bus to identify
> > > which specific panel we have and if they need additional tweaking,
> > > just like we do with "edp-panel". Do DT folks have any opinion about
> > > that? Coming up with a name would be a pain since I wouldn't want to
> > > assert that all future Samsung OLED eDP panels will have the same
> > > powerup sequence. Maybe "samsung,amoled-edp-panel-v1" even though tha=
t
> > > sounds terrible and there's no known need for a "-v2"?
> > > </repeat>
> >
> > If things are the same, then perhaps there should be a fallback
> > compatible. Or just reuse an existing compatible.
>
> Right, there already is a fallback comparible. This patch is just
> adding a string to the enum that has the fallback compatible
> "samsung,atna33xc20". So someone using this new panel will use:
>
> compatible =3D "samsung,atna40hq08", "samsung,atna33xc20"
>
> My point was that listing specific panel isn't really valuable here.
> Though the "samsung" power sequence isn't completely compatible with
> the generic "eDP panel" power sequence (which is why they have
> separate drivers), just like generic "eDP panel"s we can query the
> panel ID if there are any per-panel quirks.

Unless the quirk is how to power on/off the panel...

> So the question is: should we stop adding specific panels and just
> always list "samsung,atna33xc20" for all Samsung panels with a
> compatible power sequence, is it worth it to add a more generic name,
> or should we really keep listing all these individual panels for no
> real gain.
>
>
> > I can in no way
> > prevent someone from using 'foo-panel' in their DT when the h/w is
> > actually a foobar panel if the differences are transparent to s/w. (But
> > I will reject a quirk property later on when foobar turns out to be
> > different than foo.)
>
> It's more a question of what guidance we tell people. Here, Konrad is
> trying to do "the right thing" by listing his specific panel and then
> using the fallback. I'm saying "listing the specific panel isn't
> gaining you anything" and I'd rather not have to review / apply these
> pointless additions to the bindings.

I think the guidance is clear. Overall, doing something special here
because Samsung panels are special just muddies what the right thing
is for everyone else.

> ...but I can imagine people will be upset if I tell them to list
> "samsung,atna33xc20" for all compatible Samsung AMOLED panels. It
> would be nicer to come up with some sort of generic name?

Well yes, people have a hard time using compatible strings that don't
sound generic. That's too bad for them.

Rob
