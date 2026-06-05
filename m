Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE5A3AA4F1
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 22:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780699296; cv=none; b=hObOsvLsDG7ZYKFtw+qHyTTfC13WeocG66S0/EuAgBYjTrIepiRISdvjkbGVYelSaiygJsXrjdfNwwBUMnUfZPfGI8TgcWI16joiuWvbR8bdQJfY5GTg9U6Z5esG5rBxEeFj9L6MnuZOycrPlzhxLr6V0YSqpL1XeEt9xs6VsC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780699296; c=relaxed/simple;
	bh=vd87ERGQaAaVnp5r0xsmMemPbzxqn7ja49VXv/zUKXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tlXZ0VchlwL7UNiL7duJq822PDupDHNP1uViEOZPpm/7MjMPvnefDtPi0HfYorH2smXJWK2y9INpV7LHrhtIUq4sYqqh9abaD9OXVP8RmDggO+M32C5psZUI8SkXVkzoQWRtdkgLJ9/n4dkdEDhcNaxFqE/yf3J0/GCtdjkzpso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vt5RWUbs; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vt5RWUbs"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-59eb501bcf0so861894e0c.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 15:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780699293; x=1781304093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxdAlMFBxvqeWetf2Jzav1he/6QnRjj7psD01yf0r3E=;
        b=Vt5RWUbsds7VrASfxODSqTtlgCvZkbtxsled4trkhUU8+ppe12YAJA7sm1aiwl9TEj
         mBuoFh4yplRRu7VdQ/VlnCmSJ8/vqaZGy3OO+mok35g8vtpmwTArjyeZinTsF81ZpbWK
         nTSmBueGlEWdkMPLqa/8/Qq6Hx7YHIKNl+Oh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780699293; x=1781304093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NxdAlMFBxvqeWetf2Jzav1he/6QnRjj7psD01yf0r3E=;
        b=RHqe7iuwiKeal1BYTeI7/3zqxADAuZvORwPv5ST1YFf/U7sBX8APqInCJcqPQecUft
         YY3vRTUFypODXnDN8rbc8aWoBLiscOHWtqaQxgUcF1+4yA0znfDYCfVnUEk9a3owVuto
         wyUF93MbyMuxbTiHvyR+fPmKhdCASeSbkFknC8wbn9lS6doMRnVCtd9Dy31DAd8mAWz5
         9RzIiGqgLHX+oFYU9cwRe22ypHQfzCAT+hakffXLz6UcIetOw1v1z9SesehX0M5FukEo
         al725iv0ez3QH4/nBzmbReeOmqLODRjN0AaC1Hx7QFfAa5Lv+fCohaWMx7VfeCCvWvy1
         scvw==
X-Forwarded-Encrypted: i=1; AFNElJ+JKWsu5xM9nvYtfPWmN+WsM33Wu7ZLOq2RLyvqpGGefiajkijZNq9yvsU6bRTzP42qA8ptquPcLzwo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4swNgeRXZK9aw9GPsPk44lID4VHoHV8EuPEKjW9/HpubiUYyW
	NtSaOmHwElx53TxL9x3S8XpKLk2UwGtVjVu6PiEemhxAWAz3OIXdrWQVPvh4kWMv9sS7uGfAvIa
	dvWI=
X-Gm-Gg: Acq92OG4siLWjvxrAFVFm7fZj2v2xZDHb+fvT0SOc3nqU0C4B92YZmzwyOOtFhhz07I
	gRkCrdEmkddG8Pyi+piuGH0JgXaw3tVJMlSLNjEWI8rbz5RQTEEIZJteS00p2N3FNvdv5rrNfjl
	d4FviLIw2f/NzvKvCp9fnGaZCPAwbZDtUlbt9IXU/+JTaEK3GjqkmX9khe6erLKMpnWwImVn2Mj
	jGxVtCRa3PlC/QX+mgHnjGRkBn5onMKVJ4Q2P0hVNQI059AzBnmN30+k3zu3fQ3iqtUA56F/kLV
	7l6bkiBNexUJ/SFqsSjduH2Xsb2UXYEe6miCF234vKVE9h9wcaOi+EG04n8EfPkMRWkt8/A5iSh
	cNDxNJoOMH2FSvJGSwiPPf0XGOzwzyu3x6rP77yEwxXPYSGCBr0fwam2c/X0rMDCDxJDozYJgSU
	0FdkG5G90d3xOANKRRarJRqQwzjV4AWLTHKtd12VdCYtx0W/3O5ygtCJTxVsr1OP6yD7pu23lhl
	a06f+xLk6A=
X-Received: by 2002:a05:6122:6606:b0:5a3:5938:6935 with SMTP id 71dfb90a1353d-5ac4dcf10e2mr3017381e0c.6.1780699292704;
        Fri, 05 Jun 2026 15:41:32 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d64139fcsm8952460e0c.4.2026.06.05.15.41.31
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 15:41:31 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9618b8bdc51so715987241.1
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 15:41:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/TGKMr9EOtOSKk4fOuREZhWylAziPPQWcWNnTS5Rz+XrJ789/bQ0pcazgdnIQW3hepFmTS3N6K1vuq@vger.kernel.org
X-Received: by 2002:a05:6102:2922:b0:635:1bc8:3568 with SMTP id
 ada2fe7eead31-6fefe98bb4amr3098337137.23.1780699290556; Fri, 05 Jun 2026
 15:41:30 -0700 (PDT)
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
 <CAL_JsqK6u=x=ScTnW1jJCPZpCUb3mT0NZpsKqe6PqZmrNEKZiQ@mail.gmail.com>
In-Reply-To: <CAL_JsqK6u=x=ScTnW1jJCPZpCUb3mT0NZpsKqe6PqZmrNEKZiQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Jun 2026 15:41:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XBn78eOC_zG0S2U-W3whrVYEpghKF_WgX+3zpUJ82-5g@mail.gmail.com>
X-Gm-Features: AVVi8CfhuBhdP6-5vH6s542O1z5nb76ugorEAmoG2LM_DR_IrP8yU98AI3rZB0M
Message-ID: <CAD=FV=XBn78eOC_zG0S2U-W3whrVYEpghKF_WgX+3zpUJ82-5g@mail.gmail.com>
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

On Fri, Jun 5, 2026 at 10:14=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Jun 5, 2026 at 10:44=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Fri, Jun 5, 2026 at 8:28=E2=80=AFAM Rob Herring <robh@kernel.org> wr=
ote:
> > >
> > > > > --- a/Documentation/devicetree/bindings/display/panel/samsung,atn=
a33xc20.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/panel/samsung,atn=
a33xc20.yaml
> > > > > @@ -25,6 +25,8 @@ properties:
> > > > >                - samsung,atna40ct06
> > > > >                # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED=
 panel
> > > > >                - samsung,atna40cu11
> > > > > +              # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED=
 panel
> > > > > +              - samsung,atna40hq08
> > > >
> > > > Sure. I'll repeat the same comment I made the last time someone lan=
ded
> > > > a change to this file [1] in the hopes that maybe someone will post=
 a
> > > > patch one day:
> > > >
> > > > <repeat>
> > > > Given how many of these we're up to now, I'm starting to wonder if =
we
> > > > should come up with a generic compatible like we did with "edp-pane=
l"
> > > > and then we can stop having to merge CLs like this. All of these
> > > > Samsung OLED eDP panels have the same power up sequence and once we=
 do
> > > > that then we can read them via EDID or via DP AUX bus to identify
> > > > which specific panel we have and if they need additional tweaking,
> > > > just like we do with "edp-panel". Do DT folks have any opinion abou=
t
> > > > that? Coming up with a name would be a pain since I wouldn't want t=
o
> > > > assert that all future Samsung OLED eDP panels will have the same
> > > > powerup sequence. Maybe "samsung,amoled-edp-panel-v1" even though t=
hat
> > > > sounds terrible and there's no known need for a "-v2"?
> > > > </repeat>
> > >
> > > If things are the same, then perhaps there should be a fallback
> > > compatible. Or just reuse an existing compatible.
> >
> > Right, there already is a fallback comparible. This patch is just
> > adding a string to the enum that has the fallback compatible
> > "samsung,atna33xc20". So someone using this new panel will use:
> >
> > compatible =3D "samsung,atna40hq08", "samsung,atna33xc20"
> >
> > My point was that listing specific panel isn't really valuable here.
> > Though the "samsung" power sequence isn't completely compatible with
> > the generic "eDP panel" power sequence (which is why they have
> > separate drivers), just like generic "eDP panel"s we can query the
> > panel ID if there are any per-panel quirks.
>
> Unless the quirk is how to power on/off the panel...

Well, only if the quirk is how to power "on" the panel. ;-)

If a panel does need different power-on processing, then I'd expect a
new compatible string unless we end up in the situation we had with
eDP panels where there is a ton of second-sourcing going on and the
quirk is relatively benign (like the "hpd-reliable-delay-ms" and
"hpd-absent-delay-ms" properties for "edp-panel").


> > So the question is: should we stop adding specific panels and just
> > always list "samsung,atna33xc20" for all Samsung panels with a
> > compatible power sequence, is it worth it to add a more generic name,
> > or should we really keep listing all these individual panels for no
> > real gain.
> >
> >
> > > I can in no way
> > > prevent someone from using 'foo-panel' in their DT when the h/w is
> > > actually a foobar panel if the differences are transparent to s/w. (B=
ut
> > > I will reject a quirk property later on when foobar turns out to be
> > > different than foo.)
> >
> > It's more a question of what guidance we tell people. Here, Konrad is
> > trying to do "the right thing" by listing his specific panel and then
> > using the fallback. I'm saying "listing the specific panel isn't
> > gaining you anything" and I'd rather not have to review / apply these
> > pointless additions to the bindings.
>
> I think the guidance is clear. Overall, doing something special here
> because Samsung panels are special just muddies what the right thing
> is for everyone else.
>
> > ...but I can imagine people will be upset if I tell them to list
> > "samsung,atna33xc20" for all compatible Samsung AMOLED panels. It
> > would be nicer to come up with some sort of generic name?
>
> Well yes, people have a hard time using compatible strings that don't
> sound generic. That's too bad for them.

OK, so sounds like going forward I should NAK changes to this file and
tell people to just use:

compatible =3D "samsung,atna33xc20";

...to mean "Generic Samsung AMOLED panel with power sequencing that
matches atna33xc20"

Yes, it means that if we find quirks with a specific panel later, it
could possibly be harder to work around them. However, since we have
several ways to identify the panel (via EDID and via DDC) this seems
fairly low risk. You can't perfectly predict the future anyway.


-Doug
