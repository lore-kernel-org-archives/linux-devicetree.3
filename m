Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6007395AE6
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348377; cv=pass; b=LtepvQGunUIveOHvsn7KaAYCL+IE613DU56wzcP4lNQGbaasi4+e/oi039tUMfq65/zexju9uZSrLTmgQcoTSaWaIvmtJ5MKnlz35XupJV10EyMWZCm72P1KnhZirifwIzp7srHtBOqiVrpAETir7WiXkG2T7wLpKVlcDEU2DZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348377; c=relaxed/simple;
	bh=YDcx1Y0+zlRN1nWyttwEdWnkWzDunYKkzU5UZ8ogEHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nxl353C1hzk1Sb9ntZLvA2DSEOYk0miPWB+yl8jr02uHtPLTnhaCBgtJDAvB9e2He/y3ebqT+9rJ55ZiOl+5bAEWgTnVpehz9sIGbdsxpCJhhlI/rIt2drEM+/0tw5kYkMA54gtaeSiEpwEl1ECKB1ee/vtC1P1aISDWhequzKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzYTUHDY; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzYTUHDY"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba856db1c0so42034775ad.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779348373; cv=none;
        d=google.com; s=arc-20240605;
        b=Hoe9SixxlEKSok5KbMgpay3hWBsIhKwFQASGbGn+F60Ax4+yVkpzqM1twW7xd/VPBv
         Pcf1JCLi/CAVGX2pRzeY5gwEq4GC3cojzNY+B2T+TXRF2eqKudQH5aRN6lGER/j4zqjq
         QDqpLs/HyhOfcDYC3soeEGVWvuUWPGKoybf5Pja8tn9NM5r2jm4ScNgtO4ZONhLiNwo/
         feWrGlxOP2wMYCaR4O06FKpJsI2uRGV/Q2FMGt3bKY94GY2SbZ2jngYsiJvbKPsvQR/2
         aqdZbv+AUOzYELvS886r6ekJ8rjMOicoYOZFAV7cuc/SeedCKD0yso5VV3nyOt+sXx24
         EbSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lXbPb+/1MyUml7SUP3O01YVktPIbQ8L41vVAOmxyw2c=;
        fh=Hyw0TbXx1RVElIDoL41SJffvA+oZR0lvJGf7l/E9wf0=;
        b=VyoyKkKvBUjCt1ecjffn3eV+pjHvoYeczG5AVYqnQRW3kgNo+rTOOT167ysew275X7
         P/gRPYIeaUYgZj12xgp7xNpM0BTb2W3E9vyqP0Tmvhu8DisKhVAifOvlPY2flMFEQp9l
         V9qnGEoebUUqTsF/Jo6bREyGj0/Rbh7ktu4EtAw9W+Ah+drrRnLt8P6nlE2/Kq/LxRf/
         jkEjAJq1I6wxC53IyUKDERpG42DStIWPaXUSNrkwQDuJNoOfzSOg74O7jjqU4mDhRJ8w
         U9QJ7EOG0nQtl/7HAT9L8cnXxBXwBW3EB1d2hEW/UrgtQf/HAcehbFz5jiNvF+YL1xat
         WONg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779348373; x=1779953173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXbPb+/1MyUml7SUP3O01YVktPIbQ8L41vVAOmxyw2c=;
        b=XzYTUHDYBLLf2kJqbQ+2bsnjW8d37U2b4YA6I8cXZ871zPjVb9bpxoJogC/QLRtiiA
         Xj1xoTHBIzu2S5w3ngutXFYXfcL4i0WDp9/seb+ioeqr5JrUcmq7R8UB4mDcYzRqG4vs
         Ciz8RW1f+s6uJ9nWCJJwOusons1mIlApG45JrQUa2rGkTSf0q46HWjF2G+yfRAb0JNQx
         r9KkpYsScVfi8QPKnVLOLzYQ2ktCru98X3EHKqK0i3UaqVEoFOvQyKVnQHPRakxFtUJU
         6YWzYG2E2XPyZ+1cjzQ6fyrlTPLl9FDrpw98gtBL1eZq3j/vQ16ZDeKqTfTC+cvumtuf
         pDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348373; x=1779953173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXbPb+/1MyUml7SUP3O01YVktPIbQ8L41vVAOmxyw2c=;
        b=UD/mZs98U7iSY0LXjsmV9XAG3J87b/9x/SpCdjGIqli7ztqjHmDGIGxumKij0GCXCB
         00T8KfmffsgUNdiqf0Y2FujcpqActwq+5awdtq5VahwcAttYc4jjsUXXR9DKLRMCbX+w
         4R29aVCTn9JFwEW/K8KrfytAtVFILiT4NxKCx1eViMgK0YdeKbfFm8CXqy+vN29vx6cT
         VaEcZaahTUg8qzTPrJP4LKW4Ta7tPSe0kkjewjJ7rUMKTT7UY7VhscgMaWs1tmCGTCnP
         Yu1Ce9rg1aRHpNrx4cXTL0D5AL3sRl//e787Q0buDDrpLdLVQ0OBik2uB1hn8Pa49Gk8
         ZT1w==
X-Forwarded-Encrypted: i=1; AFNElJ8x8ZQFFX7rb/4Jp15yJREd9eLtAGWsPwAV50AeU4gYG5C7l59gD4yLo6gVxnlA4wNl2ZUzE7y0X5i/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfy8rBefMLqh7wIoE0aG6oEEghg0xaXzfdpePaRYP/FAVZq8w0
	uGvJa9PsOSqbboN2Y3f9da0UZ/hWzGhn+EB0Z2AURx66el6v6WZoIArxRkPUKjZ727NfERNHryp
	w1A07adQFSqn7U1q/7rFOcMFITlm0QFo=
X-Gm-Gg: Acq92OELnHrn0vdZMNuchLsot2jpilnNexgGIZs3q0wMTeyAJ8AuO7RN5Ny00XOvC/F
	HsYGw8jk25Y6F0E6AHQ58E6LzWoo1ifACcdTyimgFf2eN+BEaunDSSLsw9ecZYqTUQI4BxhtZ7u
	32nxeKr+SD9S0uHDmoPWfD+Rs8Ba4Y82edQWofUrAN3KZ/VM3PNMfywbbTJ69q75/3hj4JSgTDC
	e2o5xGxNm4Fa+DYPBxvK4oDj/aExhAc3M7/cTrXgz0nviXRVnJXXbMZZLRlB1bc/WZob0JtW+jJ
	Z13SzaB1INEAYi6UESkOrQQc5/j6aJp0dJn5M3mTn1bAPwXY
X-Received: by 2002:a17:902:ce92:b0:2bc:eea4:83c3 with SMTP id
 d9443c01a7336-2bea337dcb9mr16838125ad.25.1779348373000; Thu, 21 May 2026
 00:26:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-8-phucduc.bui@gmail.com> <20260511234758.6C022C2BCB0@smtp.kernel.org>
In-Reply-To: <20260511234758.6C022C2BCB0@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 21 May 2026 14:26:00 +0700
X-Gm-Features: AVHnY4JVOeDnjezg1KYm702bCERj-oBsD-Y1fM4Qrg16PXkHjwRlY3W_TbeGcO8
Message-ID: <CAABR9nHH2D-StaU8hMEnPmtZGoSbk0tO4H5YU+qL-TVmsEov_g@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] ASoC: renesas: fsi: refactor clock initialization
To: sashiko@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

First of all, I appreciate receiving review comments from the AI bot.
I think it is quite helpful for learning and improving patches.

However, I have a few questions regarding the expected workflow:

1. I noticed that the bot reply only CCs a subset of the original recipient=
s.
    Is there a specific reason or convention behind that behavior?
2. When receiving review comments from the bot, is it generally
    expected that contributors reply to those comments?
3. If replying is recommended, should I keep the same CC list as the
    original patch submission, or only reply to the bot thread participants=
?

Sorry if these are basic questions. I just want to better understand the
usual mailing list workflow.

Best Regards,
Phuc

On Tue, May 12, 2026 at 6:47=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] The return value of `fsi_clk_init()` is ignored in `fsi_prob=
e()`, which breaks probe deferral and leads to a kernel panic from derefere=
ncing error pointers.
> --
>
> commit 055b3b167e655ece1592450b8baaea9abe771d10
> Author: bui duc phuc <phucduc.bui@gmail.com>
>
> ASoC: renesas: fsi: refactor clock initialization
>
> This commit moves fsi_clk_init() to probe and uses devm_clk_get_optional(=
)
> for optional clocks. It allows probe to succeed when optional clocks are
> missing, while set_rate() validates clock availability.
>
> > diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> > index 55a11f1fe8aa1..8c46d68069581 100644
> > --- a/sound/soc/renesas/fsi.c
> > +++ b/sound/soc/renesas/fsi.c
> [ ... ]
> > @@ -973,35 +983,42 @@ static int fsi_clk_set_rate_cpg(struct device *de=
v,
> >       return ret;
> >  }
> >
> > -static int fsi_clk_init(struct device *dev,
> > -                     struct fsi_priv *fsi,
> > -                     int xck,
> > -                     int ick,
> > -                     int div,
> > -                     int (*set_rate)(struct device *dev,
> > -                                     struct fsi_priv *fsi))
> > +static int fsi_clk_init(struct device *dev, struct fsi_priv *fsi)
> >  {
> [ ... ]
> >       clock->own =3D devm_clk_get(dev, NULL);
> >       if (IS_ERR(clock->own))
> >               return -EINVAL;
>
> Does returning -EINVAL here mask probe deferral? If devm_clk_get() return=
s
> -EPROBE_DEFER, returning -EINVAL will permanently fail the driver probe
> rather than deferring it.
>
> [ ... ]
> > @@ -1997,6 +2001,7 @@ static int fsi_probe(struct platform_device *pdev=
)
> >       fsi->running_streams =3D 0;
> >       fsi_port_info_init(fsi, &info.port_a);
> >       fsi_handler_init(fsi, &info.port_a);
> > +     fsi_clk_init(&pdev->dev, fsi);
>
> Is it safe to ignore the return value of fsi_clk_init() here?
>
> If devm_clk_get_optional() fails and returns an error pointer like
> -EPROBE_DEFER, those error pointers will be stored in the clock fields
> instead of NULL.
>
> Later, when fsi_clk_set_rate_external() checks if the clocks are missing:
>
>     if (!xck || !ick) {
>
> This check will pass because the error pointers are not NULL. The error
> pointers will then be passed to common clock framework APIs like
> clk_get_rate(), which will dereference them and cause a crash.
>
> Should the return value of fsi_clk_init() be checked and propagated?
>
> >       ret =3D fsi_stream_probe(fsi, &pdev->dev);
> >       if (ret < 0) {
> >               dev_err(&pdev->dev, "FSIA stream probe failed\n");
> > @@ -2011,6 +2016,7 @@ static int fsi_probe(struct platform_device *pdev=
)
> >       fsi->running_streams =3D 0;
> >       fsi_port_info_init(fsi, &info.port_b);
> >       fsi_handler_init(fsi, &info.port_b);
> > +     fsi_clk_init(&pdev->dev, fsi);
>
> Would the same return value check be needed here as well?
>
> >       ret =3D fsi_stream_probe(fsi, &pdev->dev);
> >       if (ret < 0) {
> >               dev_err(&pdev->dev, "FSIB stream probe failed\n");
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510084303.12=
2426-1-phucduc.bui@gmail.com?part=3D7
