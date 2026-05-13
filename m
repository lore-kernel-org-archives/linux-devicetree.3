Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AD63B5E08
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651817; cv=none; b=cQg4wHTcXsarKtQgj/BuU2FFZNluOjGA/v6eoYEjBU52VGe8OzzH9azfcGV5rXK4qSFuqd9teYNu4CL6QPO2cib7A77zgRS3+5xLYfWklEtBbrsYM6exsMmzjmmcTcQzbGL3ultdOSGE792svdtJE2/pUNC+Q4oCtnTxW9Caplw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651817; c=relaxed/simple;
	bh=RXMBxSOHhv9tNJLVaSrhLlPCAgc/dzgbAOOReX4hnw8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SZlBSHqgChAP8WkU0qF2cNNziZyr+LNp/l3VRk4RIBDZ4QatfiJPbLnCOXBjE21E1Kc6Jtx/oVGcqhJaNbYW1sEk/48ex7d4smRlInJ+SgCpm6DD8YkQnk8ZJSDIO1lKhlTNPTSVqHSur9p5XqqvJm7J2B+qDNQ2ViMf1a5l2Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5YEzvHu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5YEzvHu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBA2C2BCB7;
	Wed, 13 May 2026 05:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778651817;
	bh=RXMBxSOHhv9tNJLVaSrhLlPCAgc/dzgbAOOReX4hnw8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=U5YEzvHurmpfA3AU6gC/Zb1vYc/VQxmjOZ97C0Ip77CtXqNizBgpUgpSHb7031b7D
	 xub651Yg9ut6mBI/0EMZegH9o3g3XM2QSIHrDCxbS+80eKbNChf02X8YAqnwbbpxp7
	 xCzYCm6uEQnO2p+EMBWSU4E3PWJLNLmyLVWZRRe5oW9wMFd1lX4YfyL4iNIdfYmB+7
	 2Y30AlsGYeO0WvTR3478nNNaA8tpjyAP7NGTReTOpMfzyF8MBRWxIeViwgLNKxhlVE
	 mTikz14tnjgy0ctNKkwSk9ZOd7FP62lq1KwTKr+NpXBeno2vzR/b8ejDpQuEs95DS1
	 dLp3vsgLwqNEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] hwrng: starfive: Update clk and reset sequence
Reply-To: sashiko-reviews@lists.linux.dev
To: lianfeng.ouyang <lianfeng.ouyang@starfivetech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260512062404.4540-3-lianfeng.ouyang@starfivetech.com>
References: <20260512062404.4540-3-lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 05:56:56 +0000
Message-Id: <20260513055657.4DBA2C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The patch fails to guarantee that clocks are physically gated befo=
re asserting reset in cleanup(), rendering the glitch prevention ineffectiv=
e when the device is active.
- [High] Misuse of hwrng cleanup and init callbacks leads to system crashes=
 on RNG toggle.
- [High] Unsafe IRQ handler execution after clocks are gated in cleanup() c=
auses bus faults.
- [High] Broken Runtime PM state initialization causes permanent clock leak=
age.
--

commit 097b8dfdf62a7320bf5e3edd8a668729f1364217
Author: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>

hwrng: starfive: Update clk and reset sequence

For jhb100, this conducts clock gating before asserting reset to prevent
generating glitches that propagate to downstream IP.

> diff --git a/drivers/char/hw_random/jh7110-trng.c b/drivers/char/hw_rando=
m/jh7110-trng.c
> --- a/drivers/char/hw_random/jh7110-trng.c
> +++ b/drivers/char/hw_random/jh7110-trng.c
> @@ -234,12 +234,18 @@ static irqreturn_t starfive_trng_irq(int irq, void =
*priv)
>  static void starfive_trng_cleanup(struct hwrng *rng)
>  {
>  	struct starfive_trng *trng =3D to_trng(rng);
> +	bool is_jhb100 =3D device_is_compatible(trng->dev, "starfive,jhb100-trn=
g");
> =20
>  	writel(0, trng->base + STARFIVE_CTRL);
> =20
> -	reset_control_assert(trng->rst);
> +	if (!is_jhb100)
> +		reset_control_assert(trng->rst);
> +
>  	clk_disable_unprepare(trng->hclk);
>  	clk_disable_unprepare(trng->ahb);
> +
> +	if (is_jhb100)
> +		reset_control_assert(trng->rst);
>  }

Does this sequence guarantee the clocks are physically gated before asserti=
ng
the reset?

Because the probe function manually enables the clocks without calling
pm_runtime_set_active(), the physical clock count starts at 1. If the RNG is
deselected while the device is still active (for example, within the 100ms
autosuspend window after a read), the clk_disable_unprepare() calls here
will only decrement the clock count to 1.

Could the physical clocks remain running when reset_control_assert() is
executed, generating the exact downstream glitch this patch intends to
prevent? The driver may need to synchronize with Runtime PM first.

This isn't a bug introduced by this patch, but does managing hardware states
this way in cleanup() lead to a crash if the RNG is re-selected? The hwrng
core invokes cleanup() when the RNG is deselected via sysfs, which drops the
clock count.

If the user subsequently re-selects the RNG, the core invokes
starfive_trng_init(). Since init() does not re-enable the clocks or call
pm_runtime_get_sync(), wouldn't its immediate writel() to the
STARFIVE_AUTO_AGE register trigger a synchronous external abort?

Also pre-existing, but does gating the clocks here leave the device
vulnerable to a bus fault? The interrupt handler remains fully active
because cleanup() can be executed at runtime via sysfs without unbinding the
driver.

If a spurious interrupt or delayed lockup interrupt fires while the RNG is
deselected, wouldn't starfive_trng_irq() attempt to read registers with the
clocks gated? Should the driver clear the interrupt enable register and
synchronize IRQs before gating the clocks?

[ ... ]

> @@ -337,12 +343,19 @@ static int starfive_trng_probe(struct platform_devi=
ce *pdev)
> =20
>  	ret =3D devm_hwrng_register(&pdev->dev, &trng->rng);
>  	if (ret) {
> +		bool is_jhb100 =3D device_is_compatible(trng->dev, "starfive,jhb100-tr=
ng");
> +
>  		pm_runtime_disable(&pdev->dev);
> =20
> -		reset_control_assert(trng->rst);
> +		if (!is_jhb100)
> +			reset_control_assert(trng->rst);
> +
>  		clk_disable_unprepare(trng->ahb);
>  		clk_disable_unprepare(trng->hclk);
> =20
> +		if (is_jhb100)
> +			reset_control_assert(trng->rst);
> +
>  		return dev_err_probe(&pdev->dev, ret, "Failed to register hwrng\n");
>  	}

This isn't a bug in the new error handling, but earlier in the probe sequen=
ce,
the driver manually invokes clk_prepare_enable() for both clocks, initializ=
ing
their enable counts to 1, but fails to call pm_runtime_set_active().

Doesn't the PM core therefore default the runtime status to RPM_SUSPENDED?

Every time starfive_trng_read() executes, pm_runtime_get_sync() transitions
the device to RPM_ACTIVE, calling starfive_trng_resume() which increments
the clock counts to 2. When the autosuspend timer invokes
starfive_trng_suspend(), it decrements the counts back to 1.

Does this mean the clocks are never physically turned off during normal
operation, completely preventing the hardware from powering down?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512062404.4540=
-1-lianfeng.ouyang@starfivetech.com?part=3D2
