Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5AE33A9CF
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784789685; cv=none; b=bOtgnoL/ePGs8UCtrQmZYoJ9Fv3kw/TNlTS0R5cExEfSWYyFV+F9dZ8dHGQguuosd39MNfonhE7ks+2rMVaMZQcciy5UlJfamPPbEjXkEzNGeOjOtrPlNFiBNKzbugfGaYFCFH/GU1X2bspkardm2xiBbtKttOUMF46VRNk/Eq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784789685; c=relaxed/simple;
	bh=yzdiHJgkXO6xrqPTOlCbRJQ6g8KEoNTSAX40T0OC+Hs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u2i1NCU7NZaEXWRXGnSzWtsDNGry5r38BOTuWtZfYiQn/LDcD6VVJTdzZkVstb7OqcfQCnTwFhGXYs/nMXQGAL9bSJI9SD3d6LNgHhHevtNXXV2/csBp3OZIck6e9XzPUfe+jULnKwlUNpmHZ4FhrsafXUSI6SncKCTDu/Qqrus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIp2WnaN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIp2WnaN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD251F000E9;
	Thu, 23 Jul 2026 06:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784789684;
	bh=uWTUteCAp9ImnES4vlmlMYvMe9mjMxfM6NVOj07EfW4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SIp2WnaNB+mL7P/dc1hRNO0nVuFAeBsjO0tJU330sclGNxG+tUpPFuIXWtKMEfsPU
	 SIhSM0OIIoQeJBMGGGaXRYi1l6Y2YcwfS9gGIZtv/6ChRTMH4vEu1Gdwikq9LVSiBC
	 BLY0sRrcAZ5WRw9kIxSrb8aBtwmexN4Rzu026aIYgB1ckX+61K+QuZsd+CNeouPVgi
	 0N71f9DfBchJTkTXANSKx5GlsQErtmmFl+4rDfRZXCaNAT4HMu5ZrzsNK7GAv8vAvV
	 wAmUg5a0CRz+fHnfAihjk8Ter8wKi5UuRBQ/2kGFywnPAIB2BV2xMH5YnKODV+qHwH
	 XjyfiPY3lY8OA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] spi: amlogic: spisg: Fix the incorrect keep_ss
 of the last descriptor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260723-a9-spisg-v2-3-9fc39106b7e2@amlogic.com>
References: <20260723-a9-spisg-v2-0-9fc39106b7e2@amlogic.com>
 <20260723-a9-spisg-v2-3-9fc39106b7e2@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 06:54:43 +0000
Message-Id: <20260723065443.8DD251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing pm_runtime_disable() and pm_runtime_put() in probe error p=
ath and remove().
- [High] Double-disable of clocks managed by devm_clk_get_enabled().
- [High] Race condition causing spurious -EBUSY transfer failures.
- [High] Target abort incorrectly signals successful transfer completion.
--

--- Patch [3]: [PATCH v2 3/4] spi: amlogic: spisg: Fix the incorrect keep_s=
s of the last descriptor ---
commit c9f43474b4fa19eea599df7045d868e70af19bd8
Author: Sunny Luo <sunny.luo@amlogic.com>
spi: amlogic: spisg: Fix the incorrect keep_ss of the last descriptor

This commit fixes the incorrect handling of the keep_ss state for the last
descriptor in the Amlogic SPISG driver. It ensures the CFG_KEEP_SS bit is
properly set based on the final transfer's cs_change value, ensuring the
chip select behaves correctly even when a cs-hold delay is present.

> diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-sp=
isg.c
> index a6123975a37cf..2d66f00dccd45 100644
> --- a/drivers/spi/spi-amlogic-spisg.c
> +++ b/drivers/spi/spi-amlogic-spisg.c

[ ... ]

> @@ -539,13 +542,17 @@ static int aml_spisg_transfer_one_message(struct sp=
i_controller *ctlr,
>  				       xfer->effective_speed_hz);
>  	}
> =20
> -	if (cs_hold_in_sclk)
> +	if (cs_hold_in_sclk) {
>  		/* additional null-descriptor to achieve the cs-hold delay */
>  		aml_spisg_setup_null_desc(spisg, desc, cs_hold_in_sclk);
> -	else
>  		desc--;
> +		desc->cfg_bus |=3D FIELD_PREP(CFG_KEEP_SS, 1);
> +		desc++;
> +	} else {
> +		desc--;
> +	}
> =20
> -	desc->cfg_bus |=3D FIELD_PREP(CFG_KEEP_SS, 0);
> +	FIELD_MODIFY(CFG_KEEP_SS, &desc->cfg_bus, last_xfer_keep_ss);
>  	desc->cfg_start |=3D FIELD_PREP(CFG_EOC, 1);
> =20
>  	/* some tolerances */

[Severity: High]
This is a pre-existing issue, but does calling spi_finalize_current_message=
()
before releasing the hardware lock open a race window for the next transfer?

In aml_spisg_transfer_one_message(), we have:

	msg->status =3D ret;
	spi_finalize_current_message(ctlr);
	aml_spisg_sem_up_write(spisg);

Since spi_finalize_current_message() signals the SPI core that the controll=
er
is ready, could the SPI core immediately dispatch the next transfer on anot=
her
CPU, which then fails aml_spisg_sem_down_read() and aborts with -EBUSY?

[Severity: High]
This isn't a bug introduced by this patch, but does the target abort handler
incorrectly signal a successful transfer?

In aml_spisg_target_abort():

	spisg->status =3D 0;
	regmap_write(spisg->map, SPISG_REG_DESC_LIST_H, 0);
	complete(&spisg->completion);

And in aml_spisg_transfer_one_message():

	if (wait_for_completion_timeout(&spisg->completion,
					spi_controller_is_target(spisg->controller) ?
					MAX_SCHEDULE_TIMEOUT : msecs_to_jiffies(ms))) {
		ret =3D spisg->status ? -EIO : 0;

If a transfer is aborted, status is set to 0 and the wait completes. Does
this cause the SPI client to incorrectly interpret an aborted transfer as
fully successful?

[Severity: High]
This is a pre-existing issue, but do the probe error path and remove
functions leak PM runtime references?

In aml_spisg_probe(), the out_clk error path exits without disabling
PM runtime:

out_clk:
	if (spisg->core)
		clk_disable_unprepare(spisg->core);
	clk_disable_unprepare(spisg->pclk);

	return ret;

Additionally, aml_spisg_remove() does not call pm_runtime_disable():

static void aml_spisg_remove(struct platform_device *pdev)
{
...
	if (!pm_runtime_suspended(&pdev->dev)) {

Does this prevent the device's power domain from suspending and cause
a kernel warning when rebinding?

[Severity: High]
This isn't a bug introduced by this patch, but are the devm-managed clocks
being double-disabled?

In aml_spisg_clk_init(), pclk is explicitly disabled:

	clk_set_min_rate(spisg->pclk, SPISG_PCLK_RATE_MIN);

	clk_disable_unprepare(spisg->pclk);

In the aml_spisg_probe() error path, both clocks are manually disabled:

out_clk:
	if (spisg->core)
		clk_disable_unprepare(spisg->core);
	clk_disable_unprepare(spisg->pclk);

And in aml_spisg_remove(), they are disabled again:

		clk_disable_unprepare(spisg->core);
		clk_disable_unprepare(spisg->pclk);

Since these clocks are acquired using devm_clk_get_enabled(), which
automatically registers a cleanup action, will manually disabling them
underflow the clock enable count and trigger warnings from the clock
framework?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-a9-spisg-v=
2-0-9fc39106b7e2@amlogic.com?part=3D3
