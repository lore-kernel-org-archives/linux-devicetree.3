Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ECD392802
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 10:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780308979; cv=none; b=RNeC14uTN4mAVoWyvzkmtPpptFcEGk0m55ZWO+GE5EombZjXRx+weYGbtN3BO/68JOnNIPtFaIBO1Cr0VymbnCWRxKMk2VKBiBjohW9WKp2MdzCVliI7JXj5iE+TSVvJ3d82DQwYB0n4Rtvih2fxQo6Y965EV4R6pSZV2FTgV38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780308979; c=relaxed/simple;
	bh=MNXRUvgQk2m5yeMrYSK66Qp6vdpo/a6XdL764Rlx5nQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K6SiLucieDCvgjVHXURaKvyi9gH/Vfnuun2Qg38XHTxG9mC+YQnRVQ4cTG0YF2isupTCs5c3eV1/MLtGoNANPy8/BwNJ0z8TMs0bH6tUfCZ7KqkOc8/IVGjLYvU0fMbFulXW0XwJc1Tb+Yk4s520prUN5RWvZc6+a9EEDjp+dAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOOim+03; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOOim+03"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BCF1F00893;
	Mon,  1 Jun 2026 10:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780308975;
	bh=PIN2va5E5CZobxmkTnk8yAigc0g8TzGN6+gWeBLiYfU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VOOim+03DGjjdsqYAUZ5cT+ix6UHWpB+Xb3jTRdYL5LdMGpp27xEQ2asMRHmDcs6J
	 pgqyL7LNSOFVQ36g+qWBi/zmrm++kwUQiJjW7y7meO4CeayIlcdy9mogZPfFpPnT93
	 DS+8Yl7dqhfBlRRQdmTvujNjunwXiyvPVOP4T9i0eXtMIBRG9QoovLTQOKZak35jUv
	 N4nH/ttSqffeWpH8M9Kxx5uxIVJkW4pww2QnZcFzl3hbMRfp3pRr1U00Sssw/iPTs8
	 /JSw/oZnKjbuG0HcT46ANSpNdXvh28JJkrZVdcT/cAp7+nOvs5j2g4n17rYF99Dg03
	 4AeMs9wQsLUJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwrng: starfive: rework clk/reset teardown order
 for JHB100 & fix RPM
Reply-To: sashiko-reviews@lists.linux.dev
To: lianfeng.ouyang <lianfeng.ouyang@starfivetech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601093744.84210-3-lianfeng.ouyang@starfivetech.com>
References: <20260601093744.84210-3-lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 10:16:14 +0000
Message-Id: <20260601101615.26BCF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] IRQ handler incorrectly evaluates pm_runtime_get_if_active() retur=
n value, leading to PM usage counter underflow and fatal unclocked hardware=
 access.

Pre-existing issues:
- [High] Missing return value checks for clk_prepare_enable() leads to pote=
ntial kernel panics on resource activation failure.
--

commit b2fbed65d08f91e4f7234550dff66d9c5c318e6a
Author: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>

hwrng: starfive: rework clk/reset teardown order for JHB100 & fix RPM
   =20
JHB100: to avoid RDC glitch, assert reset only after clocks are gated.
Introduce a per-compatible seq_rst_clk flag (RST_FIRST/CLK_FIRST)
selected via of_device_get_match_data().

> diff --git a/drivers/char/hw_random/jh7110-trng.c b/drivers/char/hw_rando=
m/jh7110-trng.c
> index 9776f4daa0445..9c164a0011ae6 100644
> --- a/drivers/char/hw_random/jh7110-trng.c
> +++ b/drivers/char/hw_random/jh7110-trng.c

[ ... ]

> @@ -209,16 +265,17 @@ static irqreturn_t starfive_trng_irq(int irq, void =
*priv)
>  	u32 status;
>  	struct starfive_trng *trng =3D (struct starfive_trng *)priv;
> =20
> +	if (!pm_runtime_get_if_active(trng->dev)) {

[Severity: High]
Does this evaluation properly handle negative error codes?

If pm_runtime_get_if_active() returns -EINVAL when Runtime PM is disabled
(for example, during probe before pm_runtime_enable() is called), the
!(-EINVAL) check evaluates to false.

Since devm_request_irq() is called before clocks are enabled in probe, a
pending interrupt from a previous boot stage could trigger this handler. It
would bypass the early return and perform an MMIO read on STARFIVE_ISTAT
while clocks are off, which might cause a synchronous external abort.

Could we check for ret <=3D 0 instead?

> +		dev_err_ratelimited(trng->dev, "pm is inactive in irq\n");
> +		return IRQ_NONE;
> +	}

[ ... ]

> @@ -228,18 +285,37 @@ static irqreturn_t starfive_trng_irq(int irq, void =
*priv)
>  		spin_unlock(&trng->write_lock);
>  	}
> =20
> +	if (status & STARFIVE_ISTAT_RAND_RDY)
> +		complete(&trng->random_done);
> +
> +	if (status & STARFIVE_ISTAT_SEED_DONE)
> +		complete(&trng->reseed_done);
> +
> +	pm_runtime_put_noidle(trng->dev);

[Severity: High]
Could this lead to a PM usage counter underflow?

If pm_runtime_get_if_active() returned -EINVAL earlier, we didn't increment
the usage counter, but we unconditionally decrement it here. This might ste=
al
the reference held by the driver core during probe.

> +
>  	return IRQ_HANDLED;
>  }

[ ... ]

> @@ -333,18 +429,16 @@ static int starfive_trng_probe(struct platform_devi=
ce *pdev)
> =20
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> +	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> =20
> -	ret =3D devm_hwrng_register(&pdev->dev, &trng->rng);
> -	if (ret) {
> -		pm_runtime_disable(&pdev->dev);
> -
> -		reset_control_assert(trng->rst);
> -		clk_disable_unprepare(trng->ahb);
> -		clk_disable_unprepare(trng->hclk);

[Severity: High]
This isn't a bug introduced by this patch, but should the return values of
the clock enable calls be verified?

In starfive_trng_probe() and starfive_trng_resume(), clk_prepare_enable()
is called for both the hclk and ahb clocks without checking for failure:

clk_prepare_enable(trng->hclk);
clk_prepare_enable(trng->ahb);

If clock activation fails under resource pressure, the driver will proceed =
as
if the hardware is powered. Subsequent MMIO accesses might trigger a
fatal bus error.

> +	ret =3D devm_add_action_or_reset(&pdev->dev, starfive_trng_release, trn=
g);
> +	if (ret)
> +		return ret;
> =20
> +	ret =3D devm_hwrng_register(&pdev->dev, &trng->rng);
> +	if (ret)
>  		return dev_err_probe(&pdev->dev, ret, "Failed to register hwrng\n");
> -	}
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601093744.8421=
0-1-lianfeng.ouyang@starfivetech.com?part=3D2
