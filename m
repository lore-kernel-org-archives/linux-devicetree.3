Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789AD2DEA89
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 03:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780025301; cv=none; b=kIMCwLH+uzQuMaAeCoqbyrnjmD4r29YJdcXW/rBeKyZ6uF3OMgwxJDWu+PSa2Y7yu6zcA828hJBsEjlHxa+aPl9iqoJRZe4D++fNDZSfrJHhU21U/Jc9WLuGRIySkJodZItxOIaeA/s8vqbs6whV+LGpP6X8A6I/RX3QFkqYGic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780025301; c=relaxed/simple;
	bh=rHmx1Ha18wbSUNeJYY+d6YI+IZGuHr6obdWBie0vdyo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iZPCghrYr3m90GejX9//5X0d08DRnpOpKQ4b5ngXYz37Kbbw4yr+QK81MRTYjutfOJsR/ZHVQMymB2C7nXfXOb3gw8QPNJw0maLUuBqscR0+SZ6mJTxcKzkaWXhco6KT9q9GTLC08YU0KfhxpibTrk8yfhPYCe/CTGL1AHwCtiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGL2VCHy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGL2VCHy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C38631F000E9;
	Fri, 29 May 2026 03:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780025300;
	bh=pVbL9zXjulGwYLZoQIq6nE9jV70G1JkGS7lKud14iD4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oGL2VCHyBwRdS9CyKANfQuGvmN8+OMvaDNvUiY/39iJa+FgJ/zOPkmSVRGIl5Sg0U
	 LlJ3CsRV17CgIiPRUedBa8ysq69RZjWZeJ94wKIQ3kudoKfpa8x/RWRNBs7MuA1iqd
	 7zw6dK1SPrgiHoIBzTbWaZVSMbFRNsp2T1gYapHZCc2+IopdctzgSdbr3sjPSWlsg9
	 oiy53GGjCLHELvNNwdDEW/Qau+V7YjkRkAredvZtB7qN+GEDZXCsMAohKKe2+YA3c6
	 Cf0JSnGdNdG5qSCu0nKNpuXJy8TmZFQyDys971HwArGUEDT1+Xb55hit9Eq7oF9+xq
	 SpBN+ENTkxhMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/7] pwm: tegra: Avoid hard-coded max clock frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikko Perttunen" <mperttunen@nvidia.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260529-t264-pwm-v5-3-7bf9e405a96a@nvidia.com>
References: <20260529-t264-pwm-v5-3-7bf9e405a96a@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 03:28:19 +0000
Message-Id: <20260529032819.C38631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Potential division by zero during probe due to unvalidated dynamic=
ally fetched clock rate.
- [High] Logic error in `dev_pm_opp_set_rate()` usage causes probe failure =
on devices with OPP tables.
--

commit 74520499a078af31d704c76e29fb2e41b43c4ecc
Author: Yi-Wei Wang <yiweiw@nvidia.com>

pwm: tegra: Avoid hard-coded max clock frequency

This commit changes the Tegra PWM driver to dynamically fetch the max
clock rate from the current parent clock using dev_pm_opp_set_rate()
and removes the hard-coded maximum frequencies from the SoC data.

> diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
> index f8c5495a56a66..303e2720034d2 100644
> --- a/drivers/pwm/pwm-tegra.c
> +++ b/drivers/pwm/pwm-tegra.c
[ ... ]
> @@ -303,7 +300,7 @@ static int tegra_pwm_probe(struct platform_device *pd=
ev)
>  		return ret;
> =20
>  	/* Set maximum frequency of the IP */
> -	ret =3D dev_pm_opp_set_rate(&pdev->dev, pc->soc->max_frequency);
> +	ret =3D dev_pm_opp_set_rate(&pdev->dev, ULONG_MAX);

[Severity: High]
Does setting the target frequency to ULONG_MAX work safely with OPP tables?

dev_pm_opp_set_rate() will round ULONG_MAX to the clock driver's absolute
maximum frequency. If a platform (such as Tegra30) has an OPP table where
the highest defined OPP is lower than this absolute maximum,
dev_pm_opp_set_rate() will fail to find a matching OPP and return -ERANGE.

Could this failure inadvertently abort the driver probe on platforms with
such OPP tables?

>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "Failed to set max frequency: %d\n", ret);
>  		goto put_pm;
> @@ -318,7 +315,7 @@ static int tegra_pwm_probe(struct platform_device *pd=
ev)
> =20
>  	/* Set minimum limit of PWM period for the IP */
>  	pc->min_period_ns =3D
> -	    (NSEC_PER_SEC / (pc->soc->max_frequency >> TEGRA_PWM_DUTY_WIDTH)) +=
 1;
> +	    (NSEC_PER_SEC / (pc->clk_rate >> TEGRA_PWM_DUTY_WIDTH)) + 1;

[Severity: High]
Is it possible for pc->clk_rate to be less than 256 here?

If clk_get_rate() returns 0 (such as when the clock is unconfigured) or a
value less than 1 << TEGRA_PWM_DUTY_WIDTH, the right shift will evaluate to
0.

Could this lead to a division by zero panic during device probe?

> =20
>  	pc->rst =3D devm_reset_control_get_exclusive(&pdev->dev, "pwm");
>  	if (IS_ERR(pc->rst)) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-t264-pwm-v=
5-0-7bf9e405a96a@nvidia.com?part=3D3
