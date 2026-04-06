Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5FE33262F
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 12:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478757; cv=pass; b=alA5o+HCiWSaaK364e1Xo8QOdJCcNzvTIGVt/D2MhLC+XUoja1G2evbIKj+ThjZmydi9sPkqB/Sd1r1sU3GgAulGRA2xPQpo/9d0w/opwBrNSWGixJA5KeagrPD2PrkNrlGAp/JM0ITqIEtS72aiEoVpXFzUZb/67x5WQFxbINQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478757; c=relaxed/simple;
	bh=NnYpzCjbOPa23Fsh/bL9Mp8xGA8K8foKfgmggy1BxJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=flKKli7/AgqVUcWRXYcx13CdvnvjgUI/CCI+SZpdlVXgnLYBFak7D94svNyfjr0GeBN3rl8mN/q/+0zte58cw7HwVSWrEsnsGFs6/0Oi5wa068zC1zx/zpbBwhIW0h9qzq1QyvRfrRvus98SMZqBFQENMv/Nskwexjbs2CK7C3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+gwmV90; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+gwmV90"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c76b6f9a50eso1175845a12.2
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 05:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775478756; cv=none;
        d=google.com; s=arc-20240605;
        b=J3vWmOhyGpl0XqceO/uliVFax1jvKuZ9CJWoDCrpNNkc3M0+bJHCJTiXoA11dFQblt
         RbMjQerQow4xNar4OpDYvYzclUCG0vQBAh40R20O3a3XYECyMaHA6+CRtQ0rsHkcpxaz
         +SodfrCjECXBvsBndiGEJD6h6Ub0ObfxAmfd0JsTQeImSGD+K6DmqEuYY2f7mulF+I1l
         NwCmTM55Z9P2vZXLiXBiDigtUVnOQxVYWH6Y5memdxGGSwogF94uZ7CAGg/h87a9EaTA
         MCHX0OBCMzxJP2sLBmi2F4OXho8DAp73eZlAWvLyy3feYhEjYlGFXwvXTTzjCP/6DSlS
         HYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BpJLMv/PN8ttKmYeWwPZWYWOIWYBgFzlU3AGL8Sjwio=;
        fh=tQ0e291tplF/R2k0o+eUzRNwFgGto6rysg3CTw5VH4s=;
        b=YJ1v1q5oyFQ8ChEl5UvpZQ9hS9XKj6myqSHQZvyhfmcu58J92iYVQgaT+DXXoWniIn
         uqDrykuIRsueUkYUqXyCxZZUvBkwd33OohUAM7bsGImDN0ZigFsq6wvJ0XeU8eLDhRZx
         i6EHj0/uEXNIlReBX4cYIoBRkohO3Ho2vQra2nlzrVVZR1wVg9oHUd2rvCeYURvTi4zZ
         9hUlOWGH/ORIvShGtwKdEvK+QAfCzU7T/FeN4O2jZFt6v/UdumXppax2JhgesvdVFeZ7
         eavky3ayi61WDmNsI8Mp4PnbAYisMKN3MC2ANzNuSxeKXPuoGAUQBVHp+KWw4eIHP0xB
         B+tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775478756; x=1776083556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpJLMv/PN8ttKmYeWwPZWYWOIWYBgFzlU3AGL8Sjwio=;
        b=O+gwmV90EhAzTgPuoR/DsXbd+e9m+urrblot0oqEfepq1stiHBFtmLgYMfWsY5Ou69
         qZZfLKBS3BHQm3uksntzh3Qlw8OWhlulDCefBzcsfX9Petd2uoNDNyN1EpdhXQKd0cMU
         frffudik7CBD0hNmH78A1KVPwJ2BEdVkJwo5fWUcNFYRCUwL+FblB8EDUXLfbh21o7rJ
         gu9A48ydiN4oerKVEmWNRPGqYqhER/tydRxGqxdF4gSVSbl+Qyz14BNHC11MHqOEJdZV
         +q22SqbktD/uAGNqCqM4xn4gYL6w9/osCCfksKprAI1KYwRliuhuIt1T4e2LWN8K5+Zd
         LRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775478756; x=1776083556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BpJLMv/PN8ttKmYeWwPZWYWOIWYBgFzlU3AGL8Sjwio=;
        b=rnAgUlIbQvSZO15rAjeQcrhRSVyNheWKfVeOymj25+CDC1l7EnOlrjAcSed47oEBB+
         jck0gE7gpkLECoWkOgkZJe+MhpZUFw9lkLTYhCPbzeTuGWRmVK9YR0oh/8RcTwRMmLlb
         m5LxN6WYvP/AUU9+rZuxfBAiNQ9tjZs7AMS1bMR2vt0LBlz8zHoAR5pJM2V5WURkylRh
         jb4cWJnxV5jz1oWYj30r4FNhtft7EUIfxNiCZ9Zn1aTQs0MLpM/lUTGVZU15PAtw5hVu
         z6RuYANlX2zScH9yITbGdXgfdfWe2nyVdcC6BWSZaVVGlheuX2CohvhQ0Q75eR6N+OAs
         n/NA==
X-Forwarded-Encrypted: i=1; AJvYcCVeG/611jDJHFTNPrtKmWrtkmXOVB+3GPhqcSlnZipHwdPs5/e4h74qqi2+KtzGMZoxe4Qn0rtkxVZ+@vger.kernel.org
X-Gm-Message-State: AOJu0YxzO73PbCwcP2rumG1UplXiArTOj3WFTSSm3w58EnwZ0FT9opO2
	tfmHfZDvbKpetBjBqGVVm9Y7gzEi1hso3IiYwBCWKmo2hFrGf4BlZpntDe32DIpFJ8dsBHtQz4l
	8oi2WmEE3GZ6vwO6lMFx82aUqTzUqYok=
X-Gm-Gg: AeBDiev/Bk/QAMJHkDf9jcKtfMQzZBQy7VUCBazvVMqzTm956P47uxXtZgj7ZJfzOHN
	aGJ3nYue7/cmhe3VB5/tQsKxyFUcwRiSSnpXNJ5p7hH6DXkKZcythxldgQS5VDnfx/GvntCE+FD
	38QjDpHUT6B/JtfosPTvg/niYDZDmVTHCRQo2XPVSG4S4GUVWYg+8QTVwGPsyGPpEAN8R0nszvq
	5UsbJ2mh+NIuw9ThdzYnJb6TJHZVt9EiGSiHm133Jyz1BosRIiQ0k1B3su+680GJx0Jd1b5zE3i
	0PU3ysZeSp7QDutrCXvljxKHyDKVMDLG13EUbA==
X-Received: by 2002:a17:903:2c04:b0:2b0:5075:96d1 with SMTP id
 d9443c01a7336-2b28176a618mr133938205ad.24.1775478755494; Mon, 06 Apr 2026
 05:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
 <20260403112655.167593-4-phucduc.bui@gmail.com> <87v7e5t16l.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v7e5t16l.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Apr 2026 19:32:22 +0700
X-Gm-Features: AQROBzA0_93mm2t7r0WlUl14fX7SUBUPYxStZohF-_IJd-zBH4HmuI7FuU4RnJY
Message-ID: <CAABR9nGUyTkDmB0SgKAuM1Pp75L=m1q4bLSfhobm98TswDnt8w@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san, Mark,

Thank you for your review.

> If it is needed for register access,

Yes, enabling this clock is essential as it functions as a bus bridge clock=
.
Currently, the SPU clock is still enabled by the bootloader. In legacy
kernels (v4.2 and earlier) using the Armadillo board-file/defconfig, this
clock remained active after boot, allowing the FSI to function correctly.
However, after migrating to a full Device Tree (DTS) implementation,
the kernel's unused clock cleanup mechanism disables the SPU clock
because it isn't explicitly claimed. This leads to a system hang every
time aplay is executed, as the FSI registers become inaccessible
without this clock.

> you need to call it on
> fsi_hw_startup/shutdown() which cares suspend/resume too.

I previously attempted to manage the clock within fsi_hw_startup/
shutdown, but the system would hang when stopping aplay
(e.g., via Ctrl+C). This happens because certain cleanup operations,
such as fsi_irq_disable(), are performed after fsi_hw_shutdown()
finishes. These operations require register access, which triggers a
system hang if the SPU clock has already been disabled. Therefore,
I moved the clock management to fsi_dai_startup/shutdown to ensure
the clock remains active throughout the entire lifecycle of the stream.

Furthermore, my testing shows that using dai_startup/shutdown
eliminates the need for explicit Suspend/Resume handling for this clock.
Since the ALSA framework typically invokes the hw_ callbacks during
power management transitions rather than the dai_ ones, the SPU clock
state remains stable, preventing any illegal register access during
these transitions.

> As Mark mentioned, it should be optional.
> Otherwise it breaks compatibility.

You are right. I will implement it this way in v2.

> And we already have fsi_clk_init() for clock initialize.
> spu should be handled in it.

> Now, it is called if clock master (A.

> (A)     if (fsi_is_clk_master(fsi)) {
>                 if (fsi->clk_cpg)
>                         fsi_clk_init(dev, fsi, 0, 1, 1,
>                                      fsi_clk_set_rate_cpg);
>                 else
>                         fsi_clk_init(dev, fsi, 1, 1, 0,
>                                      fsi_clk_set_rate_external);
>         }

You are right. Currently, our FSIA is configured as a slave,
so it never executes the clk_init() function.

> I think it (A) can be checked inside fsi_clk_init().
> fsi_clk_init() is now called when .set_fmt, but it can be called
> at _probe() timing ?

Yes. I can handle the implementation/coding side of this.

> Should we also be managing the clock during system suspend, or if the
> power consumption doesn't really matter should we just keep it enabled
> all the time and not worry about starting and stopping it?

Regarding the SPU clock management, I haven't measured the exact
power consumption of this block yet. However, to keep the code simple
and ensure maximum stability for register access (avoiding system
hangs during cleanup), I am open to enabling it once in fsi_probe()
if you find the dynamic management in dai_startup/shutdown
unnecessary.

> This is going to unconditionally require a clock called "spu" on all
> devices using this driver, not just the one SoC you mentioned as
> requiring it.  Presumably this worked at least somewhere (possibly the
> clock is always on, or they're just lucky that something else enables
> it) and this will cause regressions for those platforms?
> This should either (ideally) be conditional, or use _optional.

Thank you for your suggestion. I will switch to using
devm_clk_get_optional() in the v2

Best regards,
Phuc

On Mon, Apr 6, 2026 at 6:52=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi
>
> Thank you for the patch
>
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > The FSI on r8a7740 requires the SPU clock to be enabled
> > before accessing its registers.
> > Without this clock, register access may lead to a system
> > hang.
> > Retrieve the "spu" clock in probe and enable it during
> > DAI startup. Disable the clock on shutdown to match the
> > audio stream lifecycle.
> > This ensures safe register access and prevents system
> > hangs during audio playback.
> > This is required even if the FSI functional clock is
> > enabled, as internal units depend on the SPU clock.
> >
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> (snip)
> > @@ -1554,6 +1555,11 @@ static int fsi_dai_startup(struct snd_pcm_substr=
eam *substream,
> >                            struct snd_soc_dai *dai)
> >  {
> >         struct fsi_priv *fsi =3D fsi_get_priv(substream);
> > +       int ret;
> > +
> > +       ret =3D clk_prepare_enable(fsi->master->clk_spu);
> > +       if (ret)
> > +               return ret;
> >
> >         fsi_clk_invalid(fsi);
>
> If it is needed for register access, you need to call it on
> fsi_hw_startup/shutdown() which cares suspend/resume too.
>
> And I guess it need to count user, because we have FSI-A / FSI-B ?
>
> > @@ -1963,6 +1970,13 @@ static int fsi_probe(struct platform_device *pde=
v)
> >         master->core            =3D core;
> >         spin_lock_init(&master->lock);
> >
> > +       /* SPU clock is required for FSI register access */
> > +       master->clk_spu =3D devm_clk_get(&pdev->dev, "spu");
> > +       if (IS_ERR(master->clk_spu)) {
> > +               dev_err(&pdev->dev, "Failed to get spu clock\n");
> > +               return PTR_ERR(master->clk_spu);
> > +       }
>
> As Mark mentioned, it should be optional. Otherwise it breaks compatibili=
ty.
> And we already have fsi_clk_init() for clock initialize.
> spu should be handled in it.
>
> Now, it is called if clock master (A.
>
> (A)     if (fsi_is_clk_master(fsi)) {
>                 if (fsi->clk_cpg)
>                         fsi_clk_init(dev, fsi, 0, 1, 1,
>                                      fsi_clk_set_rate_cpg);
>                 else
>                         fsi_clk_init(dev, fsi, 1, 1, 0,
>                                      fsi_clk_set_rate_external);
>         }
>
> I think it (A) can be checked inside fsi_clk_init().
> fsi_clk_init() is now called when .set_fmt, but it can be called
> at _probe() timing ?
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
