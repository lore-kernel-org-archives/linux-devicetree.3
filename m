Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4036738D417
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126218; cv=none; b=m+Y//PNDNj5mIjtvXeunqHDfHO6kuObkbD3wcYw2LQLl/BN6wjguuOnztYBW7oKUSs71sllaR14gvoehROd0+tXRZ22RQvQTRNW2pPUTXWZ9nit4q0bjkTWElwyg57Xy6jv/f7Ch56xgIu8x2YKutB4Jl4tN42MPIrbhMa3ZeWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126218; c=relaxed/simple;
	bh=XwMHUbCRkp1Lv/VksMXKJQRuUD2lrFpEJv9Zrl8kXQo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=swRElt+vU0CPudVgHuZznQYqcgtqSzcMTuCLDDhxJevE6cNC2rxwMjQDIjCpF4eF7G/nfnSvzlbr7qpYuXRzzsskVa0VhHgTuzqwP/HQRqTjIoiDQMh6cdAUX18IcE0eNP3fL85Rzq+Eopua5B7YsgA3OYDhLIKaKFguIyHsSuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBtVitlj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBtVitlj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5C71F00A3F;
	Wed, 15 Jul 2026 14:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784126216;
	bh=GgpbuK+9j0Z2fPhlpTQ4L7aLWLdBJIxaV6XFh4gT6Dc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VBtVitlj1DUJWg1vEkJFrQFOYXhpIcvZLtBEwsTSOCr4X3uXL8Ko/UE/f9nSS6vY6
	 +huTdKeK7yw0HoAc2MITox9ixiWPVbpQcaEyP5tPhjubk9sqygXPpluCaMEchXkdAU
	 rBRYUL2nZm9icgoYwWjJepe6QARBflk3p2CPqAdRsL592iKlXqI50mSulWpdBYqc8z
	 XtZphXxi71ukB3wrUTRFJey+uP8EQf55uRq8D6q9l3QKjPVSmaUoJQEofPmV+g6e0S
	 Bcz67XL3EXcxgpi4YAecwsQuuHiyfGusnCGw/lFrnFG/0pW69b4JxzSfpxSCrlDVRK
	 QrBh2c8q8YroA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 08/14] media: iris: Add power sequence for glymur
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715-glymur-v9-8-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-8-8cf2cbe12a07@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 14:36:55 +0000
Message-Id: <20260715143656.7A5C71F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] If the NOC LPI handshake times out during readl_poll_timeout, the =
PREP bit is left asserted in the AON register, permanently hanging the NOC =
on the next boot.
--

--- Patch [8]: [PATCH v9 08/14] media: iris: Add power sequence for glymur =
---
commit d6ece601b7cdb53f3a84fa94a79400eb75a5853d
Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

media: iris: Add power sequence for glymur

This commit introduces power sequencing for the Glymur platform, which has
two video codec cores. It ensures that clock and power rail voting is
coordinated since both cores share the same power rails and clock source.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu3x.c
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c

[ ... ]

> +static void iris_vpu36_power_off_vcodec(struct iris_core *core, u32 core=
_id)
> +{

[ ... ]

> +	do {
> +		writel(power_down_prep[core_id], core->reg_base + AON_WRAPPER_MVP_NOC_=
LPI_CONTROL);
> +		usleep_range(15, 20);
> +		value =3D readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
> +
> +		handshake_done =3D value & lpi_status_done[core_id];
> +		handshake_busy =3D value & (lpi_status_deny[core_id] | lpi_status_acti=
ve[core_id]);
> +
> +		if (handshake_done || !handshake_busy)
> +			break;
> +
> +		writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +		usleep_range(15, 20);
> +	} while (++count < 1000);
> +
> +	if (!handshake_done && handshake_busy)
> +		goto disable_power;
> +
> +	ret =3D readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STA=
TUS, value,
> +				 value & lpi_status_done[core_id], 200, 2000);
> +	if (ret)
> +		goto disable_power;

[Severity: High]
If this readl_poll_timeout() fails and returns an error, the code jumps
directly to disable_power, skipping the zeroing of the control register bel=
ow.
Since the AON_WRAPPER_MVP_NOC_LPI_CONTROL register is in the Always-On (AON)
domain, won't this leave the power_down_prep bit asserted across power cycl=
es
and permanently hang the NOC on the next boot?

Should writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL) be called
before jumping to disable_power on timeout?

> +
> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	writel(bridge_sw_reset[core_id] | bridge_hw_reset[core_id],
> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(bridge_hw_reset[core_id], core->reg_base + CPU_CS_AHB_BRIDGE_SYN=
C_RESET);
> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +
> +disable_power:
> +	iris_genpd_set_hwmode(&core->vcodec[core_id], false);
> +	iris_disable_power_domain_and_clocks(core, &core->vcodec[core_id]);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-glymur-v9-=
0-8cf2cbe12a07@oss.qualcomm.com?part=3D8
