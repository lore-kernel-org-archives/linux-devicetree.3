Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D6F388E4B
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090009; cv=none; b=Aspcw+P38l1Di5bd8Gk8UQg6HKg9FqAGzJnnUUmPVSd2WPO2Iosy8AQpMK/8YCWwGskCZGdYRP6b56G/6Z0KJ8J+TalBo/eYCiBQGfiKWOeZorD7yndaH7z0nY1+eoa3sMhBZr3eqiRDME6QgvHnWHoVvtgOhIMeabHAZCWttM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090009; c=relaxed/simple;
	bh=WF1zseLhLsruTsny6aNSVC5b1ByNQeKZ2WXlGjfpkSs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=plPGWTYTpWoB1dp3c21mzwKty7pOR+JPtDxjDKsYP0u+4kftAfP8Rm6DXAVD2wywCxGzJN1Xde+OxOdacHgPXjYpcewcKJ7/4zewzWBie7Ne1QJXjW5A4+vcS0xKMLDdpnouxixqK9OWaiYacrRjwhXxqJr/yFIuFTMpVXqsUj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IecTovIt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IecTovIt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09EBC2BCB7;
	Mon, 18 May 2026 07:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779090009;
	bh=WF1zseLhLsruTsny6aNSVC5b1ByNQeKZ2WXlGjfpkSs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=IecTovItEte7aTA2xDZvUQ9iHQnljJ11Une6HfCH6jffLfJn1pxS19/yC6Djtgx9c
	 hwWgu/TZ5Ss+gqe686JJAOsr1UKKfUSA3QWK67BdKlE+AAb8h/Hj27ZtgUNE7LEziZ
	 UnrcjH9HBbAdqdtEsQuS3FmnZaWrnPURo+nYLE9U3eyA16dDFj52WKHCm5dX9xO3Fw
	 z6F9t9HbffLmPn8hMWtulxlW8MwBbY6B+5YO9nt/l1hz5ZUZGhnnQFkmElEIU3jMrP
	 S7XEURmoUyjfeIkViEoFsIuWk3UJv8j3SENg1+xtLiGiRUHwG+mYT/CA9QilgaFjoK
	 BP6rIZTkQcMGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwrng: starfive: Update clk and reset sequence
Reply-To: sashiko-reviews@lists.linux.dev
To: lianfeng.ouyang <lianfeng.ouyang@starfivetech.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260518065243.20865-3-lianfeng.ouyang@starfivetech.com>
References: <20260518065243.20865-3-lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 07:40:08 +0000
Message-Id: <20260518074008.C09EBC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Unhandled error from `pm_runtime_get_sync()` leads to unsafe regis=
ter access.
- [High] `starfive_trng_release()` causes a clock double-disable and hardwa=
re sequence violation if the device is suspended.
- [High] Devres ordering creates a race condition where the IRQ handler rem=
ains active after clocks are disabled.
- [High] The IRQ handler accesses hardware registers without verifying the =
device's PM state.
- [High] The IRQ handler is registered before hardware clocks are enabled, =
creating a window for a fatal crash.
- [High] A stale IRQ completion race allows `starfive_trng_read()` to retur=
n non-random bytes prematurely.
--

commit 9fe8263576b446ca8c08d308b365ff7601cef468
Author: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: hwrng: starfive: Update clk and reset sequence

This commit updates the clock and reset sequencing for the StarFive TRNG
driver to prevent glitches on the jhb100 platform. It introduces a specific
release function and integrates runtime PM across initialization, reading,
and cleanup.

> diff --git a/drivers/char/hw_random/jh7110-trng.c b/drivers/char/hw_rando=
m/jh7110-trng.c
> --- a/drivers/char/hw_random/jh7110-trng.c
> +++ b/drivers/char/hw_random/jh7110-trng.c
> @@ -138,6 +143,23 @@ static inline void starfive_trng_irq_mask_clear(stru=
ct starfive_trng *trng)
>  	writel(data, trng->base + STARFIVE_ISTAT);
>  }
> =20
> +static void starfive_trng_release(void *data)
> +{
> +	struct starfive_trng *trng =3D data;
> +
> +	pm_runtime_disable(trng->dev);
> +	pm_runtime_dont_use_autosuspend(trng->dev);
> +
> +	if (trng->hw_seq =3D=3D HW_SEQ_RESET_FIRST_THEN_CLK)
> +		reset_control_assert(trng->rst);
> +
> +	clk_disable_unprepare(trng->ahb);
> +	clk_disable_unprepare(trng->hclk);

If the device is already runtime-suspended (e.g., autosuspend timer expired=
),
starfive_trng_suspend() would have already disabled these clocks. Since
pm_runtime_disable() does not wake up a suspended device, will calling
clk_disable_unprepare() here result in a clock enable count underflow?

Also, for the HW_SEQ_RESET_FIRST_THEN_CLK variant, could this assert the
hardware reset on a clock-gated IP block? Should the release function wake
the device (via pm_runtime_get_sync) before performing hardware teardown?

[ ... ]
> @@ -174,13 +196,16 @@ static int starfive_trng_init(struct hwrng *rng)
>  {
>  	struct starfive_trng *trng =3D to_trng(rng);
>  	u32 mode, intr =3D 0;
> +	int ret;
> +
> +	pm_runtime_get_sync(trng->dev);

Is it safe to ignore the return value of pm_runtime_get_sync() here? If the
device fails to resume, it returns a negative error code. Would the
subsequent register accesses (like writel/readl) occur on a device with
disabled clocks, potentially causing a synchronous external abort?

Does this same unhandled return value issue apply to the pm_runtime_get_syn=
c()
calls added in starfive_trng_read() and starfive_trng_cleanup() as well?

[ ... ]
> @@ -257,24 +292,26 @@ static int starfive_trng_read(struct hwrng *rng, vo=
id *buf, size_t max, bool wai
>  	if (wait) {
>  		ret =3D starfive_trng_wait_idle(trng);
>  		if (ret)
> -			return -ETIMEDOUT;
> +			goto end;
>  	}
> =20
>  	ret =3D starfive_trng_cmd(trng, STARFIVE_CTRL_GENE_RANDNUM, wait);

Even though starfive_trng_wait_idle() polls until the hardware is idle,
could there still be a pending IRQ from a previous operation that hasn't
been processed by the CPU yet?

If that pending IRQ is handled right after reinit_completion() is called
inside starfive_trng_cmd(), would it complete the random_done completion
early, causing this function to read from STARFIVE_RAND0 while the hardware
is still actively generating the new random number?

[ ... ]
> @@ -283,21 +320,22 @@ static int starfive_trng_probe(struct platform_devi=
ce *pdev)
[ ... ]
>  	init_completion(&trng->random_done);
>  	init_completion(&trng->reseed_done);
>  	spin_lock_init(&trng->write_lock);
> =20
> -	ret =3D devm_request_irq(&pdev->dev, irq, starfive_trng_irq, 0, pdev->n=
ame,
> +	ret =3D devm_request_irq(&pdev->dev, trng->irq, starfive_trng_irq, 0, p=
dev->name,
>  			       (void *)trng);

This registers the IRQ before the hardware clocks are enabled below. If an
interrupt is pending from a prior boot stage, will starfive_trng_irq()
fire immediately and attempt to read STARFIVE_ISTAT while clocks are still
gated off, potentially triggering a bus fault?

Additionally, does starfive_trng_irq() need to check the PM state using
pm_runtime_get_if_active() before accessing registers? If a spurious or
delayed interrupt fires while the device is runtime suspended, the handler
currently reads registers unconditionally.

[ ... ]
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
> +	ret =3D devm_add_action_or_reset(&pdev->dev, starfive_trng_release, trn=
g);

Devres actions execute in reverse order of creation. Since
devm_request_irq() is called before devm_add_action_or_reset(), won't
starfive_trng_release() run first during device unbind and disable the
clocks, leaving the IRQ active?

If an interrupt fires during this window, wouldn't it cause a bus fault
when the handler reads from a clock-gated IP?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518065243.2086=
5-1-lianfeng.ouyang@starfivetech.com?part=3D2
