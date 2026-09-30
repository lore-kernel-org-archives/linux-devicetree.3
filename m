Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71494E322A
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776397; cv=pass; b=Kjb6ey1g/Oc+zTKp0pvE5fC2UiJcJ1YcOFGP4KDQmu3BmLXTODu4Fv2cBUCwiq99NRhP+zadFKwDmMmjg/Heo6ybkz4bDc61+3u9O4fcvPGccCyXs14cPwL+XPKQki7LOwK+0h4545hGKVDS3pgRnnX8z/3U6S02myKLESJd7A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776397; c=relaxed/simple;
	bh=7tXfNmQFPthqRgnD+N2jwL6JcbsMYPl/OeD0b/XvCME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMJmnz900q+IvYAeh2XF4ZKvyIAqXyRON20zMWs7jJ6Mt95LDT4WG0+Y5SVavTJyIrpSEqiaflBEr6GeSBpEW7RgDiDmTuXsJ+cq31xLB0vv/HwmCGDfI78ERjC6MLa0h9y4RrNpzNtRvBLTImCbxi3SM4yF8tlNKCuYhLiwrsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZsBKmqyR; arc=pass smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZsBKmqyR"
Received: by mail-yx2-f38.google.com with SMTP id 956f58d0204a3-675617094f5so1846053d50.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:53:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790776379; cv=none;
        d=google.com; s=arc-20260327;
        b=LoTRP6X68bEitgFgkfAJWsyfYzMdciGyfAsMopGv2H1nAm2hEc8GzLzCDLFBB4/b+Z
         yQEwn9E0d7i+oxlTja9+XFnZ21Ob0oKy78Vj9kiWcs4i8LoPEm7ef4t1FTXI1BRSpSnr
         w2UPoVRQYuh6ooRKhNigZuiBE3lcKv/6F8kD4qsYulnix9UvEoNmd63/zJzJ7SkU15wt
         wfdX6Pot+8vtCRcPJnorOgQl+hAXB1iq5Uo/8u+DdDdfVH2Fvugghef07W/u1ZknS5lE
         h6wf6dSaiqeUJ9UIi8eO04uHqo1STyCK4a7m7n4gsezOyRa7xoht9kU5aVNTH+YdE08f
         E/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RpNeLRajldsJyb03io5TqUKkBsu82dkOKDvxIHvX4/4=;
        fh=ob6eDskMEkRIFMSOOiB8DMX7b4/4vslVLoeSTmSi73k=;
        b=Zc5cBBONHeetFpebyOY7RB/mtSWqvxg0W6oizulH/flqOXp8GREsbi/NGn0UjaJfZc
         fMY/nMLbs7iIQeCgXrmiSd9dkNsV5jpI236ZptCawiHmnxnujMJAtBcz8D+u4JnPx8qO
         URfD5GR06VckCth5sMugZxwGRnGwtcM4i/0HWyH/v7NRih2UddY+E2oUUzzM4nIDVyDT
         DPbQ5b66BM5mjqDs4pkoZNESpycN4TxN5O8urWjGTBr4J3ODEvUG8Y/sAa6jztjCE6So
         yYrWod4ENITF9wAHWkrSWPB3KjNk8jZYBo5B4me67PSg4iAvgITvmgiRap/F+QbwnPQZ
         016w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790776379; x=1791381179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RpNeLRajldsJyb03io5TqUKkBsu82dkOKDvxIHvX4/4=;
        b=ZsBKmqyRZ6rJ942Mdt4RDpu8ZY8T6cScQSRSFJjTOrrywHu7nAnAYLEe2mzTzFTlHM
         Z61ZlhY/Tz8Yv+w0h2HhaFmPnOxWBLZYXLhCrMwxdJsrVAoCIlLuedrXcqH+B0LrhJgq
         O7kXEordVRtnlc5hsNHT5BIWQokOsmymI4M5RCab07maYZ+65l7T3b7DDsz6mCkuU76s
         o5CcfvouevvKQcIGUQlSpBDP5a3PKJwe5aJT+V25PtCGZXI5fEx7btFyD26NNLx7idir
         dMv1+aqzU51eBhEeydcVbFgaFMYqXRhP6TxaX8qADSWrX+D1L2OA42VOJCE7FDEJeeZ6
         akgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776379; x=1791381179;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RpNeLRajldsJyb03io5TqUKkBsu82dkOKDvxIHvX4/4=;
        b=SyckoQ7u1pVwFtPMoHvZZHUEm5gZOm4Fuh+DKLoCzlseRKeyg2MzzqyIFhVcgtVasd
         cdP0YJQjHqxzZS4X0OLLcoYYA7NYvk0eCCXTPUXS2XHdUrd22ZR9A7wYQT9sOA/InLzN
         AkrlYMKsDds31+3ue1NGVIZpgVTDS/DV7g3TJ/8ePd8l9DcaNXQh0YfZDTC1ZWr1CwlJ
         y5f47prFD3v8IRsl/5OrVtCjUlN0p+9mnIpwTuC2GDSgnQSF8D1VebTYa6CTdM9uCyC9
         VotiE/UxMkBxzcEZwlgDVPktWrmyOWkYZy2rnBH3Hqph+Mzi/SALa5AegyAcquL2KngQ
         7PNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYe6czyQBK4Jmnlevleq0aGjTukNxj9QcIO+mG3hT9T6VPVIrmxG/EAIDk79U8pJ4hK/8OqAiinTRi@vger.kernel.org
X-Gm-Message-State: AFq9FYIEmw6+z2weLIsi1M36uR4PII+O+HKw0RwpSXQwLpCionRieoiE
	QfMI7jlSF92KxwB+V41tCAnU3bLXcDZro4t2TuKeTZJ7a5TgaZcIm184f3RYi/ND8pn+AaLfyDO
	kO17U/5sZIWLzskSijxe7uCpenqvTbmYYAteW5SdsCw==
X-Gm-Gg: AYBFou0uFMW1+eobiQK5T6dXkTIlgNhH+lVDdcFzB3USbq3dhibMFCQIbZJbpgHN/9i
	rdBxnMd0be0975nAKuU2OWnmr2NpN/aN0sexwRP5rF0o8Xn4Bb6p/0LIP2qz8Mbp6yp9JYygflm
	dWFpZAr25rRYyDNvzh7ecOQAJk+biopUoEVObQ/uC8qziA/0kZung5OTMuwfcT5RzZQMLrx/076
	oalUqTEdyMq86LlhBVJLU4rVHLSbtP51GHxzCOf8h1ASt/D5JPqXjLyAAX6C0yPO5UF2Gwryffc
	jajR+cWnsPnnAMfkr2Pgx0gI36niB3CQFp80hnzx63kUGgAUBHVJQRGWFo6RrO1D
X-Received: by 2002:a53:bc0b:0:b0:676:24e2:c67e with SMTP id
 956f58d0204a3-6768351ba5fmr612451d50.89.1790776379376; Wed, 30 Sep 2026
 06:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-3-c042266b9eeb@linaro.org> <gu22hz3dnttzyu2eewpalgzxtocmlbfvnpwore36ufmyr3xtag@r5bbhafsn562>
In-Reply-To: <gu22hz3dnttzyu2eewpalgzxtocmlbfvnpwore36ufmyr3xtag@r5bbhafsn562>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 30 Sep 2026 21:52:48 +0800
X-Gm-Features: AclHuK_VxnR8JOsc80IMzuEQ7RuAU15Ps6hnH2uLVe_uy8XWpyeHRK9yzrHieFo
Message-ID: <CABymUCNtcgbcRNXdMUjVdnH_ybOxjFB31gd6AW-0HCFDSn9w4g@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/mipi-dsi: Add flag to support dual-panel configurations
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
9=E6=9C=8830=E6=97=A5=E5=91=A8=E4=B8=89 00:05=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jul 27, 2026 at 04:08:42PM +0800, Jun Nie wrote:
> > Some devices treat two independent physical DSI panels as a single
> > logical panel from the CRTC's perspective. However, two separate DSI
> > hosts are still required to drive the panels individually.
> >
> > Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> > allows a panel driver to inform the DSI host that it is part of a
> > dual-panel setup, enabling the host to coordinate both physical
> > displays as one.
> >
> > This change does not force individual panel driver to manage
> > system-level display topology if the driver does not intended to
> > support dual panel topology. Only the driver that set the flag to
> > true need to take care of panel topology.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  include/drm/drm_mipi_dsi.h | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Do you have a single MIPI DSI device, or are there two independent MIPI
> DSI devices? In the latter case, the flag is wrongly placed.

Yes, there are 2 mipi devices, and 2 mipi hosts. This flag is used for
mipi device
to notify host they are one of dual panels, so that horizontal
configuration(width)
in mipi host can be handled correctly. Where do you suggest to put this fla=
g?
Thanks!

Jun
>
> >
> > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > index 2ab651a36115d..889ef1421207a 100644
> > --- a/include/drm/drm_mipi_dsi.h
> > +++ b/include/drm/drm_mipi_dsi.h
> > @@ -169,6 +169,7 @@ struct mipi_dsi_device_info {
> >   * @host: DSI host for this peripheral
> >   * @dev: driver model device node for this peripheral
> >   * @attached: the DSI device has been successfully attached
> > + * @dual_panel: the DSI device is one instance of dual panel
> >   * @name: DSI peripheral chip type
> >   * @channel: virtual channel assigned to the peripheral
> >   * @format: pixel format for video mode
> > @@ -186,6 +187,7 @@ struct mipi_dsi_device {
> >       struct mipi_dsi_host *host;
> >       struct device dev;
> >       bool attached;
> > +     bool dual_panel;
> >
> >       char name[DSI_DEV_NAME_SIZE];
> >       unsigned int channel;
> >
> > --
> > 2.43.0
> >
>
> --
> With best wishes
> Dmitry
