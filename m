Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B90494A0E
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785333281; cv=none; b=lSpD3B9SYWUdGpbjmSVcOhvzVKFzZXLvJheZM/gY2FDrr8suDMwzEX36I5Z6M+7AEX3JNqpWACZzaNSrMT/K18vPDaKZXiQVxZfBGnIhsRX3wnfNOVc5lptYiPeDkqH4t5AioqAH9P4QgN6FK6SYph5uRUkdloL4cZmrSoM1hD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785333281; c=relaxed/simple;
	bh=S3R6xsj2pI+OTPfgGbUJLd4m/DkCuwefRYcAAk89T8o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jLBn6tGvxWneZ4OnFBoljytCeYRQvxMPl1jvTVs0CviA9Aut8fnLW0VjX6MsXa7iyB1zHDMQtvLobf4Y3yxl3nJlfMzOLwNF9nEsCaLv3+3Ouqk+L23en8dvMRupjAPrFuX5/1W9ugp3Rz9yfDg6axxXkC3vx8v1KXenSXhqB3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+gW0QCT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+gW0QCT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25DC1F00A3D;
	Wed, 29 Jul 2026 13:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785333268;
	bh=nsd22BZSjfQ+O8lndOAPdG00sane6ITLvn/PhEwHaxs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S+gW0QCTaRXUIlOzXWit0mkuhjyCAIi5I9bKTaEZs4f/tKFPNX95d3OtJq3Siv8f/
	 cnk002cDepqHGLDZRobdjlxIxqHZkuD3pL/aHZqMPAHrSFSLCdrZfFdG9un9ZifV51
	 eLKKpNSuPBKiv5XnhBSWbEmB1JX45SHfHSEbfw9vmoi2cTh6eAbicwBfmyI2CpHLos
	 e8/gx+IW8UD54zTS/CeopnT17Hi0PBygYMjmbvPzH3SJX+/r79miV8DHNcVUKBsxvk
	 EbQNfgoKUIBxFJLe0hEUATLgAivRv7I+Hr3nBi0yPtPlIl/pHwQhp4lCYW7UcanUSf
	 w2XNxBGePqG3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/6] clk: rockchip: Add clock controller for the
 RV1106
Reply-To: sashiko-reviews@lists.linux.dev
To: "Simon Glass" <sjg@chromium.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260729133609.3465563-3-sjg@chromium.org>
References: <20260729133609.3465563-1-sjg@chromium.org>
 <20260729133609.3465563-3-sjg@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 13:54:27 +0000
Message-Id: <20260729135427.A25DC1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Register configuration overlap between `CLK_RTC_32K` and `CLK_I2C1=
` multiplexers.
- [High] Missing reset controller implementation.
--

--- Patch [2]: [PATCH v3 2/6] clk: rockchip: Add clock controller for the R=
V1106 ---
commit fb3401adaaf1111eb7763ba91184635eca1fea67
Author: Simon Glass <sjg@chromium.org>

clk: rockchip: Add clock controller for the RV1106

Add the clock and reset controller driver for the Rockchip RV1106,
based on the vendor kernel from the Luckfox Pico SDK.

> diff --git a/drivers/clk/rockchip/clk-rv1106.c b/drivers/clk/rockchip/clk=
-rv1106.c
> new file mode 100644
> index 0000000000000..3f26573e6cb70
> --- /dev/null
> +++ b/drivers/clk/rockchip/clk-rv1106.c
> @@ -0,0 +1,1099 @@
[ ... ]
> +static struct rockchip_clk_branch rv1106_rtc32k_pmu_fracmux __initdata =
=3D
> +	MUX(CLK_RTC_32K, "clk_rtc_32k", clk_rtc32k_pmu_p, CLK_SET_RATE_PARENT |=
 CLK_SET_RATE_NO_REPARENT,
> +			RV1106_PMUCLKSEL_CON(0), 6, 2, MFLAGS);
[ ... ]
> +	GATE(PCLK_I2C1, "pclk_i2c1", "pclk_pmu_root", 0,
> +			RV1106_PMUCLKGATE_CON(0), 3, GFLAGS),
> +	COMPOSITE_NODIV(CLK_I2C1, "clk_i2c1", mux_200m_100m_24m_32k_p, 0,
> +			RV1106_PMUCLKSEL_CON(0), 6, 2, MFLAGS,
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does this code introduce a regression by assigning the same configuration
bits for both the RTC_32K and I2C1 clocks?

The multiplexer for clk_rtc32k_pmu_fracmux is defined at
RV1106_PMUCLKSEL_CON(0) shift 6 width 2. Here in rv1106_clk_branches, CLK_I=
2C1
is defined at the exact same register, shift, and width.

Will reparenting or setting the rate for one of these clocks inadvertently
overwrite the configuration of the other?

[ ... ]
> +	/*
> +	 * The MMC drive and sample phase clocks have their control
> +	 * registers in the GRF region, so they can only be provided when
> +	 * the rockchip,grf property points at a valid syscon.
> +	 */
> +	if (!IS_ERR(ctx->grf)) {
> +		ret =3D rockchip_clk_add_grf(ctx, ctx->grf, grf_type_sys);
> +		if (ret)
> +			dev_err(dev, "failed to add grf: %d\n", ret);
> +		else
> +			rockchip_clk_register_branches(ctx,
> +					rv1106_grf_clk_branches,
> +					ARRAY_SIZE(rv1106_grf_clk_branches));
> +	}
> +
> +	rockchip_register_restart_notifier(ctx, RV1106_GLB_SRST_FST, NULL);
> +
> +	rockchip_clk_of_add_provider(np, ctx);
> +
> +	return 0;
> +}

[Severity: High]
Does this driver omit the reset controller registration?

The commit message states that this patch adds the clock and reset controll=
er
driver, but rockchip_register_softrst() is not called in clk_rv1106_probe().
Will this regression cause peripheral drivers on this SoC to fail to probe
with -ENOENT or -EPROBE_DEFER if they request a reset from this CRU node in
their devicetree?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729133609.3465=
563-1-sjg@chromium.org?part=3D2
