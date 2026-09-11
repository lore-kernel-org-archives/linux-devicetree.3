Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702AD3EB0E8
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126620; cv=pass; b=YHO+wHLz9YtInudZHZVzceO5DR79yRF/8Wj6C7FZqeR8FDuNSFL4cBs+iUkktsNVvNVoduIGwOkvS1PL1OooIe8QRdm3OkptHWxP1RGedWrev1/stI8YifwSqQHBkwOSYLNh2oT5mBKazqRJAm3lQZrUrvamOgKyYN4gRgjrzfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126620; c=relaxed/simple;
	bh=VP4BlcnfUZVr3/+zomIB7ojpIUneSSNJHRIVnHGfdr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gc15fgy3LuYyw7VveGtOxxW1crmM5eafCr5gricND4PDE/9SdVzIks06RLaXT1//RR6ZkzdZdlDKYhGAE/kWPjejhubnLLIEJ7cBzfV+awQn+W0f8GxuMv38QE0I9UF3dVwaN307qkVl8EsMdXDXcN4uD0D43BXSZYA3JPHOIZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HeR2pStX; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeR2pStX"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4843e9c5960so740298f8f.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789126616; cv=none;
        d=google.com; s=arc-20260327;
        b=JSxl1d2Zs1cwZRRIUHzAKbbesDjQFW9lPuadskyl/0XfcbcBhswuChg4vAkHU3vmwY
         jPshNOWqo7BG00cJzGiEy8KFEo+C0+nOkqVFCH5qWxGXu88u27b8A0/I9ashaDpui6DI
         VBkQoApiu4q4xVWrvMbNWdlOlNxzqVh38Q0MAup5YgzqydfEa14efbOqo7lvLAE3u1qO
         LDEGZJJ0rHMF2RN3AOMDl6idB8d3PC/logO4vB7fH3MFsAGEfNfUmo1lwinJCr9skAiV
         op3riK1X091JlvYYEWyBl9hIjXEUXJ++FD78q0tNwyd2tKdYlNA0eC8JKIRjFAUeceId
         RKDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LIgt75iQmZv2IR1V0VMxqaMEjC44FA+M0gjq3T1j3yE=;
        fh=fICIIN8HnwPFRLTBqJFRfGG1dnrd8mkvYubWlX4K2ag=;
        b=OJDEPk3FQoLvasWO6w9If0WuIV+6gLwn6WQM5Q96xbeMZpK8GlhxoMyEAb+CJsehr1
         rdnx9ulLF0RhS4Rb+nWt80RAXp+S2kFPsOh2inzK39s9voy0r3r0pJzJOvht/vzdqrqQ
         H1JJn8RP9awUj4P/4Bja6hQWR2SzpIqhrZ+iLoUAcicGiUIPdv9ob3IsKzs1QeAaYBbB
         7dEjWaeL797Y4P+7eK0MhWAKqlLUyQldQSuJwbM8Ys2uOftHy/Q/YJ7kWWonb14SfGrp
         OGkZMUiq3EQb2ZU6E5gdHmxlMMe61wa3lZR63AVwhqymanFBLHFdzQhky/vmJZOAU4g3
         dVZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789126616; x=1789731416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LIgt75iQmZv2IR1V0VMxqaMEjC44FA+M0gjq3T1j3yE=;
        b=HeR2pStXmqottZaQS4HHHd7cIOZMQQ2qsO84RCoJZscAB74ww0boi7Oc2iSRtQQtVj
         tO2Y6CTUQg19O5Vufdurc/R+G7DF2YFJDwfT5mniWw6CvDdH/+zE6yWynYGZYrFFrnWd
         nZ1bJNge2hD4z95o9Gtb2a9SuwsFkS9XCXs5YmPBMY3CPZ818OlbalrQi48k2qxqzcC2
         IebsxWm88P/sabWLTU4uLLsfs/IjcC66xB34DRA6E87jGNQX6yoxLtytJJjs6y6QS6Dp
         cldGCw/ez6o/9lABv/3GCxV68sn1J7t7M4yPoPSh7WSjy6+9OF3ECwgM5ncpm+LycPlp
         BB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789126616; x=1789731416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIgt75iQmZv2IR1V0VMxqaMEjC44FA+M0gjq3T1j3yE=;
        b=feoA+SIjkue69/tBlqqJEWEijCyl+cPGQ6wQV+f4U1GdNkCljfwLaHUgSXwUL5UKXB
         8xqDp9oylqKp3veVCeHYNKYTYKh76CM5rumYS5+yDKLW+pyW5qVyZIXp9ZOxCbj2sQWb
         nxtzNLcL7li9RVxEA5+RrS32Q/MQQkxlS20sAXwICXwmOOs5TYgYsBl1PkPFx7eAU2nW
         1C8k4veU7aFP/L3kzQm5ijHqliKLiyk0sOHubkoWbd1TZZO/i4HQr8ls+67AU4BepGQ0
         mjwPvynCmU3V/ZHQ/NHvvZ0bkGfTkGtcBG8X70egwFAv5T4k1twdTvSnM0xL65YLwOLQ
         Z8fg==
X-Forwarded-Encrypted: i=1; AKwUvBzDqB144HsHCvDxd73zM+cCbgsyysPhHUx2dZO+9/zW4j+ZSFn09MXFHDKRErw/jr+N8Jx0d9gHAXeG@vger.kernel.org
X-Gm-Message-State: AFuF++ntPcgZbnUNFWJuH+lb/Ml/Sobs5lMLkYI+CO5ja3l6wffE2ZAw
	Uocb6ogVNO8c9P6b4HuZmOu2c3ZLPcPcux6nlQIKHbfSXkWgbw7GWxq2+GM+/wM9G/81ludZ8qT
	wlWIy6WkQtyJgLaUw0p5lfdtRev5fGjE=
X-Gm-Gg: AYBFou0E1ujAw4cc/GXodJ3jqER/GBAERQaEzWnCpiqfmM8GBeAOW369SLYpHgh1pZF
	LX1djzll5P0HZwqB4FakuJyeGjDFfdXEQP5tjKumvol10uP5x1YV34Z1hjqVloXiKnvnrL7B3zV
	nRZ5twdUgSGPSFg3cPniDIay9q5+g6/NE2+ClGpRZOCUIVZvOdZAgFN3xzd/fJw6Df1YjTR6kfn
	3SWzL8nBrw1HnCir81fTFM2pONazd25h5FHHzllJgOywhqId4QjGsqp++9GaTud35v85VAhB+SA
	0fy+S5SElfy3xWhFXuB4UDBbKtGD/c2GX8C+udoE+ZoDcdK87FlsNhYr+Hj3nmntRDUyInedbGK
	Xk51ZSri8yqH3Q4LAeh8nCP6O7MQh9Guf3Trt3hd1BQUpG8wOkGw2LvLbLPRObEfcqR7VIMCzpA
	==
X-Received: by 2002:a05:6000:2311:b0:485:8c16:5ef5 with SMTP id
 ffacd0b85a97d-486eb30a9ffmr4061062f8f.47.1789126616471; Fri, 11 Sep 2026
 04:36:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260911111731.3404308-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260911113217.0178F1F00899@smtp.kernel.org>
In-Reply-To: <20260911113217.0178F1F00899@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 11 Sep 2026 12:36:29 +0100
X-Gm-Features: AcwNN1WsWnutDhTfem_mFFkR3R6OacHy1RxvsrgccYae_oUqrtA6rSmNdVdNO54
Message-ID: <CA+V-a8vCd7n1BBzoxL6XB6iiB8fyakT-bDgu6cX5GjnpoREzbg@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] watchdog: rzv2h: Drop enabling clocks in the
 restart handler
To: sashiko-reviews@lists.linux.dev
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi sashiko,

On Fri, Sep 11, 2026 at 12:32=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Unchecked division by zero during probe if the optional 'oscclk'=
 is missing from the device tree.
> --
>
> commit e61522c3f4f781e0b8cf17bd6e22135a7d714358
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> watchdog: rzv2h: Drop enabling clocks in the restart handler
>
> The watchdog restart handler runs from do_kernel_restart() with
> interrupts disabled and after smp_send_stop() has halted the other CPUs.
> Calling clk_enable() from the !watchdog_active() path takes the clock
> framework's global enable_lock, which can cause a spin if another CPU hol=
ds it.
> This commit keeps pclk and oscclk enabled for the lifetime of the watchdo=
g
> device by using devm_clk_get_enabled() and devm_clk_get_optional_enabled(=
).
>
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index 3b6abb66a1da0..bd86da71b0eb8 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
>
> [ ... ]
>
> > @@ -290,11 +277,11 @@ static int rzv2h_wdt_probe(struct platform_device=
 *pdev)
> >       if (IS_ERR(priv->base))
> >               return PTR_ERR(priv->base);
> >
> > -     priv->pclk =3D devm_clk_get_prepared(dev, "pclk");
> > +     priv->pclk =3D devm_clk_get_enabled(dev, "pclk");
> >       if (IS_ERR(priv->pclk))
> >               return dev_err_probe(dev, PTR_ERR(priv->pclk), "Failed to=
 get pclk\n");
> >
> > -     priv->oscclk =3D devm_clk_get_optional_prepared(dev, "oscclk");
> > +     priv->oscclk =3D devm_clk_get_optional_enabled(dev, "oscclk");
>
> [Severity: High]
> This is a pre-existing issue, but can this optional clock fetch result in=
 a
> divide by zero oops?
>
> If the optional "oscclk" is legitimately omitted from the device tree (or=
 the
> device tree is malformed), priv->oscclk will be successfully returned as =
NULL.
>
> Later in rzv2h_wdt_probe(), if the chip variant uses COUNT_SOURCE_LOCO, t=
his
> NULL pointer is assigned to count_clk and evaluated:
>
>         switch (priv->of_data->count_source) {
>         case COUNT_SOURCE_LOCO:
>                 count_clk =3D priv->oscclk;
>                 break;
>         ...
>
>         priv->wdev.max_hw_heartbeat_ms =3D (MILLI * priv->of_data->timeou=
t_cycles *
>                                           priv->of_data->cks_div) / clk_g=
et_rate(count_clk);
>
> Because clk_get_rate(NULL) safely returns 0, the unchecked division will
> cause a divide error exception during device probe. Should this verify
> count_clk or its rate before the division?
>
oscclk is optional for T2H SoCs and is handled in the DT binding, to
be fully proof, I'll add a check for this case.

Cheers,
Prabhakar
