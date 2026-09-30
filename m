Received: from mail-dy2-f16.google.com (mail-dy2-f16.google.com [74.125.229.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44803CB57D
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764474; cv=pass; b=cLhYVVUrZdCyFbi95Nmun32Z/LOeFDmlAJZTfyYotWn2PmqXfcsfm0w53p1VHDlGK6TUslr5ngLpo4VK+CQHoBkmarLSBX68ZHc7tmqsjZMPDw2w1tqFqQP5vAkbWWKIGqglfaZFtVZEcIxfCEfeysQilQed8eF0f3XVR1zwcPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764474; c=relaxed/simple;
	bh=Jgl2MM4xT4vjtYr00D2lGwtIPFBPkBNmNvFUfSxZsvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dwX8/ioKE6c4+qGvzLI0bfyrw85pLBnjh7QojdVyYuOZ0I69h7IAIwwswqCq1Jxr3Li554Z2/I3Qr5GsMtPhDoYEXmSy5wA3Bce3+II/Y0lyboFtU4fwhVTauW7rsraPOAOBCDCy3BhIKFfkjLsRmlcdRYrISOhqJf+mYfCUmr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qPEkw3dg; arc=pass smtp.client-ip=74.125.229.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qPEkw3dg"
Received: by mail-dy2-f16.google.com with SMTP id 5a478bee46e88-34b3a9cd8edso814143eec.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 03:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790764472; cv=none;
        d=google.com; s=arc-20260327;
        b=OiI9vmJH8kOZ7HzEN49gT2Tfp3xLo6L0gHqZu5YSIng8njfocfsNw2V985UnaA47AF
         OkVzOYnCetY27Aohy6i8qZEJEE1ITxQxmY1lb6swg9WZKOeiJvWKvu+keUoffbJ4ZrU0
         VPJcAPlIDrlrn76QE3HbMY3JQbuDa+esXZGAXpWwE1ivKq/lIssUg1+w5rp074hpJL/J
         VR3Kzxf8DD3HkCVz/Aob+jm7jjO2xv9WEaXGk36THhEjFKFFYo/CK/xwpwFp+dlvGqxN
         UlounsuHBaR/lDdYmqWLFyupFTGBFZvALttIXSTa68nnQEyL/sVDZUIHJvPpqu68lGzr
         NF7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o3Nzxky31E5PRv1JQth+E+SJrslWGDTCiHFn65qWNg4=;
        fh=lRbK9rEo8w9LHShYgdwh3NJ0/l1CqfXN4Da8CuNtV5M=;
        b=VoJ8ZJmHb9ZiqhcAj77+l2COBCqTRmWIJJ1Vv4dyCtgLhX2tSAJaKtRMkutz0xJqDE
         hxsSeWiy/74KfVV7z8G8EpLAwD9Uzys0vPZf1mxg7OI0DMkEhe6ROlaJIZj62ZoYfiXL
         lU+vlQYZef1DIVlPzKXEanGR0Y0MGeJ5b+MKhGLcM5iNAwgJBw3LKTPErAjxdO/tclwe
         1Qk2IUDlKrQE/GGNQQx034u9heFyVZADbHVCtiRHT7FpIKX22yer92AxiQsSS46NQAJy
         19UGowoHP+DJlyJkA9a7o2olGNgf/TXSMcsfL7GxAxOVFrX5uKlTiKmcNootdMDPMu9J
         7ekA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790764472; x=1791369272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o3Nzxky31E5PRv1JQth+E+SJrslWGDTCiHFn65qWNg4=;
        b=qPEkw3dglTjNzw0HlyCIzGBpo2CjjVahjiWF+piW77HhGnKI4v3LQR9mVIfNdzhzR0
         Ci4EAj9e9Dx7sAqbPLTdlBaSIC2s07klwMHi6jOh7X9XPgSyou7f25VE+x0OrhVdc7w4
         DZEUXqKSRMTAT+6culknnvmGXb5apK709JsdLsNR13XNkuMkJppTyNruFh8ntGiP2fjY
         szpd2E6Fp1A50P2XRHSz2+SVQfiF/rYQA7TGb+MjMNpXss0NXu1N9DVd+SZkCbEpOdch
         a5F9wMGkFM+8zZhRnJLT8FrmR9aMUT9kZoTG433zfkt9NfePWKavXVLlRNIEioV5DNZ+
         Tl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764472; x=1791369272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o3Nzxky31E5PRv1JQth+E+SJrslWGDTCiHFn65qWNg4=;
        b=uOELwNS7E6RvaU6I1MGb536sKSn9V5Nmr3+GOf3m3r72vuQVhrXIf6VA/94oJfV12m
         2WvOGRPB3WxRsY5n+17/fU+SM13gSy8150jHHHlR9aHaIjE+k+41lCe1HWgqZ2iz7mWy
         zHBoyJS3gWppaArKTCuyEPRNe0fJBC78cnWau4qpknUQE1fmQpKGJeIUVSYZDITMYX0T
         78DhDpmCKKtQGSG5zaOpu0LT10sEqB9oomaycvwUdzrsXm//XkkfxPLUvZu7emzI5zJA
         GPsNKf7dCwOurazRCFVScbUSa0/4LmuX0CmOqzPUsonbzRZukMSwBZjfgkISUcrPBD5i
         lnVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmR2HVSMWZ2TTdcbI1orOWRWlZNzwiqSE2NqoDBReLTqiGeCjmkNIZQxOnhc0atDpjh6mQBcLQFSdp@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8rZEb9UYlk91W/me+SVVadca2WINKrT7NZ1lPsCiBwo/M92rd
	SrMrxfNTSvKXvvSHzAD1eSakqHpO+rFanEptKNovbUkPp81VB7+i1p8Q2rwe5LjxfU6/AtLGNUB
	U/dUgn/E+mDHYw51MvHvbKPl4XFAcL64=
X-Gm-Gg: AYBFou2CH9JjKyIcdZ2nzz4wcmwb97tL8tjPlXCPVX6ZSDuwL4RYtdv2H9y6NpkkhZq
	36PdEyQHpv5tfW8QKme1cALnd7yiKnUbuwP27mYUqT47E4b8Cxy2nDZ3GzFfmpCbOZpi4oj/1WS
	asPcGC30hommXL4HEAAhD43K8d7KwOD8crHLFbFPPUKlP+OXVfH6x62zK81rmTCwUV+dvGEzezL
	DaIjCgxSawWxcS0eJbedHfbcg8J8uZW8qvsH3oDRTu0h0AyPfFEYbfk0re0aV9FipSc+vRCrC2M
	ZtyTCSk8dBMyem9OrkxLCLBfp0jopLn70OpArprrlWuYMy3RimtqI9UdEdcGp8velOD0Zvizl5h
	U99ytYhed17ga43HFc5edKM8=
X-Received: by 2002:a05:693c:4092:b0:332:94e9:a732 with SMTP id
 5a478bee46e88-34ce4683bf7mr1420176eec.13.1790764471845; Wed, 30 Sep 2026
 03:34:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-7-clamor95@gmail.com>
 <arzNgbx465QIKYdX@orome> <CAPVz0n2QdSWL8=KBXnsQQkdNEJ9m6HSQ0+6mJji_RHZ8QgXN-g@mail.gmail.com>
 <arzilGz4akKvRF1K@orome>
In-Reply-To: <arzilGz4akKvRF1K@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 13:34:19 +0300
X-Gm-Features: AclHuK9nWzYGgxYyAeFQUOiXDBSTKrGnZ3E_AfgUmTUKQbpwZQYV_7ChXtWTs0A
Message-ID: <CAPVz0n0-baCzHOXjWLOCLjv8fb5GbE9a2v=8tBYr3RgHkEu+qg@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] drm/panel: Add Hitachi TX10D07VM0BAA and LG
 LH400WV3-SD04 MIPI DBI panel driver
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:23 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 12:08:41PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12:02 =
Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Wed, Sep 30, 2026 at 10:05:35AM +0300, Svyatoslav Ryhel wrote:
> [...]
> > > > +static const struct of_device_id panel_dbi_of_match[] =3D {
> > > > +     { .compatible =3D "hit,tx10d07vm0baa", .data =3D (void *)PANE=
L_DBI_TX10D07VM0BAA },
> > > > +     { .compatible =3D "lg,lh400wv3-sd04", .data =3D (void *)PANEL=
_DBI_LH400WV3 },
> > >
> > > Why the detour through that PANEL_DB_* enum? You could just pass the
> > > panel funcs pointers directly via .data here.
> > >
> >
> > Passing API/OPS via .data is discouraged.
>
> No it's not. We do it all the time.
>

I have had some controversial experience with MFD, with passing cell
composition. If DRM subsystem allows this, I am more then happy to
pass panel ops directly.

> > > Also, looking at the enable/disable sequences these are in fact two
> > > different drivers, with the only commonality being that they happen t=
o
> > > be used in the same device. Rolling them both into one driver seems a
> > > bit odd.
> >
> > I did this to simplify maintainance. Both panels are used in the LG
> > Optimus 2X. My assumption is that LG switched one to another at some
> > point, hence they share same timings, controls and supplies, but
> > differ in en/disable sequence. Additionally, these are the the only
> > DBI Type B-only panels in the kernel, from what I can see.
>
> That's just one more reason to put them into more of a generic driver,
> which would allow people to find it and extend/improve it as needed.
>

This driver cannot be "generic". Both panels don't fall into any
category of being "generic". They are grouped solely cause they share
same timings, controls and supplies (only these 2 panels, other will
definitely differ) and are used in the same device. I have no problems
in splitting them into 2 distinct drivers.

> > > If you really want to avoid duplication, maybe they should go
> > > into some kind of "simple" or "generic" DBI driver.
> >
> > DBI Type B is not well supported in the kernel.
>
> Well, you always start somewhere.
>

I don't think that DBI Type B needs some deep and fundamental support.
Even for its time it does not seem to be common, not saying today.
More a curiosity.

> Thierry
