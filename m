Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847E8283CB5
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609622; cv=none; b=dXPQtOg4F55ddjuJLuk8PRvpZpy0Tbrjpn9ey5Gq3vJ62BHQ8eMjWR5DUNdAVrL8ldkeJto82AQCkkg+LWhSjlwX/BlDuvQrpEufYFjZJDX/Tm+RTG2bRZ3wpG7Z6hkJhCDq7Z2ldPgfBNk49ECj2YpTbMXEIowpNXCQjEWlngg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609622; c=relaxed/simple;
	bh=QugmcpjBlAIdRdc9PJ2ewa5H4mA2esonGiBolixXaDc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nm2bAqYFjzHm6/Fu2e58eCjZqxUvXwUmgFfBJGm86RjMUVlSLurZdj8VmM03xXYcNqSfrFw2yG6yl2vCN0fKy/Ut8QVZwiA5nJpWyVTKFA2YHtQFGyQMZ1y62wWBgSdqeEoKCbUDl44gg7td87z6XZbSgsDujIZn+TsoKV6rfdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LlxLGFYm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LlxLGFYm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0301F000E9;
	Thu,  9 Jul 2026 15:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783609619;
	bh=/VJs97blzsqmmwlpVLCysRWeFjeCYGmhYUplljqOOwY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LlxLGFYm93x3jLlhQiMdrn1J3tDZ94vLh3ZAVTyiHNn6sg2FkwUnDcqAj9+YO0FAQ
	 gZCeS5OAJ0TejRG1l4epXSclxs4exeVafa5G8p5NiDCakA6sNzMUa5ZUCdqt/DPKCW
	 TD/Qa0GHdC1osZPy80vU4CRMk/AHBtgpRlbmLBxJ0Eo/mMphoQrWicVnTrKj7o8kHS
	 6cEMjbbTe2kyKe/9zjirAAXnbfYp4L3wnEbnp+XOv9e7WVdtPkgPdnwu1OwLIp2G2W
	 1uH8IVvHSDCqtwqU+mlb93EToGm593ijouDzCDh+ooPRhVQ6RkwYNu6KU7MkBhEkPR
	 R8jbuv6uovBmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] phy: qcom: qmp-usb: Add support for SA8255P
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mattijs Korpershoek" <mkorpershoek@kernel.org>
Cc: robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260709-phy-qcom-qmp-usb-8255-v2-2-3b6c26a45788@kernel.org>
References: <20260709-phy-qcom-qmp-usb-8255-v2-0-3b6c26a45788@kernel.org>
 <20260709-phy-qcom-qmp-usb-8255-v2-2-3b6c26a45788@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 15:06:58 +0000
Message-Id: <20260709150659.6E0301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect power domain sequencing during d0/d3 transitions risks N=
oC errors and bus hangs.
--

--- Patch [2]: [PATCH v2 2/2] phy: qcom: qmp-usb: Add support for SA8255P -=
--
commit c32bbfd817c3f9fca4d2982ea37be36354501cc7
Author: Sriram Dash <quic_sriramd@quicinc.com>
Subject: phy: qcom: qmp-usb: Add support for SA8255P

This commit adds support for the SA8255P SoC to the QMP USB PHY driver.=20
It introduces firmware-managed resources via SCMI using power protocols,
managing state transitions (d0, d1, d3) through the "usb_core" and
"usb_transfer" power domains.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualco=
mm/phy-qcom-qmp-usb.c
> index c5507168e1354..d085c1ad7fb5c 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c

[ ... ]

> @@ -1865,6 +1890,77 @@ static const struct qmp_phy_cfg glymur_usb3_uniphy=
_cfg =3D {
>  	.regs			=3D qmp_v7_usb3phy_regs_layout,
>  };

[ ... ]

> +/* d3_to_d0 transition by turning on all the suppliers */
> +static int qmp_usb_d3_to_d0(struct qmp_usb *qmp)
> +{
> +	int ret;
> +
> +	if (!qmp->pd_list)
> +		return 0;
> +
> +	ret =3D pm_runtime_resume_and_get(qmp->pd_list->pd_devs[0]);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D pm_runtime_resume_and_get(qmp->pd_list->pd_devs[1]);
> +	if (ret)
> +		pm_runtime_put_sync(qmp->pd_list->pd_devs[0]);
> +
> +	return ret;
> +}

[Severity: High]
Does this sequence power up the domains in the wrong order?

The commit message notes that "usb_core" (which maps to pd_devs[1] based on=
=20
the qmp_usb_domain_attach order) controls the GDSC, while "usb_transfer"=20
(pd_devs[0]) controls clocks and interconnects.

Enabling clocks before the GDSC foundational power domain is enabled typica=
lly
results in unpowered register access on Qualcomm SoCs, which could trigger a
Network-on-Chip (NoC) error and bus hang. Should pd_devs[1] be resumed befo=
re
pd_devs[0]?

> +
> +/* d0_to_d3 transition by turning off all the suppliers */
> +static void qmp_usb_d0_to_d3(struct qmp_usb *qmp)
> +{
> +	if (!qmp->pd_list)
> +		return;
> +
> +	pm_runtime_put_sync(qmp->pd_list->pd_devs[1]);
> +	pm_runtime_put_sync(qmp->pd_list->pd_devs[0]);
> +}

[Severity: High]
Similarly, could this cause a bus hang during the d0 to d3 transition?

Putting "usb_core" (pd_devs[1]) before "usb_transfer" (pd_devs[0]) disables=
=20
the GDSC before the clocks. Shouldn't the GDSC be disabled last to prevent=
=20
unpowered hardware clock access?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-phy-qcom-q=
mp-usb-8255-v2-0-3b6c26a45788@kernel.org?part=3D2
