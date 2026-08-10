Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD1E3B8BD9
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361839; cv=none; b=Iw28EvEtE8ujE+/lvNj6g47xneuZRxd7KsSZXhxjszZB0Qz3iZm9AsIaGDo5AeAHuNKgasRAemmVKCFFcgGhcRc0la2Qfo3B1okyK6ChK5/gMrOvaUgQNmojBknC8IJ+4G1XkwIhmBto09z8kXeVAVsWWI4PeB/BlwX0A28hgko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361839; c=relaxed/simple;
	bh=4h4DwEw4ozFQd2fxBim8P4Bib6IwNpYW2Fh/dywTcaQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kaoK0HKjZexm9BxClwMnP1fm1S1CaR1EnlP247BixcuKugkLVzF/BeK8xCGcT6hhdkDXU0IJKN9lh4GuOLXSFj8loeT2zYe26edQIn1VKhyafS6ULJN6sHiAC5tUP7z+sjC88PHDZNryjKpy1PKE2EH4D8tJqcWm4zlMSfJoKG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCCkybaL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCCkybaL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035C71F00A3A;
	Mon, 10 Aug 2026 11:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786361837;
	bh=ekalUsvr0ivp/k6TmzRdPzIekaPKxripUgwWNufhniY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HCCkybaLXLGUVL6roR4ZPKA7VWIW8JpSHaZjoziiV5NhOBhd6xWMf1q9+GfHzFnVC
	 RiCcndBGbN6DpmuVr7kxQAkQtuRdKa3d3qbUx/5uchXB0lKRhuyyMG3PYHiORUqjpI
	 /xV61gc3DBtmDdLWQnXnlEoRfUBQ/ATc5BZ83NeZ9izN3b+ovh6oTG4wZ3aDle+m8q
	 Uz/WykzEaM7s1+KxRJBkc9o0aSXRPRSmG0I8T+8IRw0wDnnUrmP+GoF+EClzizKE/h
	 s3l325Pi4ztCNH8ocKVr1VIq3tLU25/I9+72lg26RH8mvBeA2ocgD2BpZN2319Zw/+
	 2p8QgS+QnDUXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/4] phy: qcom: qmp-pcie: Add qref and refgen
 regulator vote for QCS8300 and SA8775p PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziyue Zhang" <ziyue.zhang@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org
In-Reply-To: <20260810112735.1326807-3-ziyue.zhang@oss.qualcomm.com>
References: <20260810112735.1326807-1-ziyue.zhang@oss.qualcomm.com>
 <20260810112735.1326807-3-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 11:37:16 +0000
Message-Id: <20260810113717.035C71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The patch mistakenly modifies `sm8450_qmp_gen4x2_pciephy_cfg` inst=
ead of `qcs8300_qmp_gen4x2_pciephy_cfg`, which breaks PCIe PHY probe on SM8=
450 and fails to apply the intended fix for QCS8300.
- [Medium] The driver unconditionally requires `refgen-supply` for SA8775P,=
 but the DT binding schema explicitly omits it from the required properties=
 for SA8775P.
--

--- Patch [2]: [PATCH v1 2/4] phy: qcom: qmp-pcie: Add qref and refgen regu=
lator vote for QCS8300 and SA8775p PHY ---
commit c5c33c8f1974732f049e9666bff7aa68ba984073
Author: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>

phy: qcom: qmp-pcie: Add qref and refgen regulator vote for QCS8300 and SA8=
775p PHY

This commit adds a new sa8775p_qmp_phy_vreg_l regulator list containing=20
additional supplies to support QCS8300 and SA8775p PCIe PHY configurations.=
=20
It updates the regulator lists for the relevant PHY configurations to apply=
=20
a hardware workaround without affecting SM8550.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualc=
omm/phy-qcom-qmp-pcie.c
> index d3effad7a074b..b60fee762dabe 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
[ ... ]
> @@ -4394,8 +4398,8 @@ static const struct qmp_phy_cfg sm8450_qmp_gen4x2_p=
ciephy_cfg =3D {
> =20
>  	.reset_list		=3D sdm845_pciephy_reset_l,
>  	.num_resets		=3D ARRAY_SIZE(sdm845_pciephy_reset_l),
> -	.vreg_list		=3D qmp_phy_vreg_l,
> -	.num_vregs		=3D ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		=3D sa8775p_qmp_phy_vreg_l,
> +	.num_vregs		=3D ARRAY_SIZE(sa8775p_qmp_phy_vreg_l),
>  	.regs			=3D pciephy_v5_regs_layout,

[Severity: High]
The commit message mentions updating the QCS8300 configuration, but this
modifies sm8450_qmp_gen4x2_pciephy_cfg instead.=20

Will this cause SM8450 platforms to fail probe since they will now request
5 regulators instead of the 2 normally provided by the DT?=20

Also, does this mean qcs8300_qmp_gen4x2_pciephy_cfg remains unmodified and
misses the intended hardware workaround?

[ ... ]
> @@ -4563,8 +4567,8 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x2_=
pciephy_cfg =3D {
> =20
>  	.reset_list		=3D sdm845_pciephy_reset_l,
>  	.num_resets		=3D ARRAY_SIZE(sdm845_pciephy_reset_l),
> -	.vreg_list		=3D qmp_phy_vreg_l,
> -	.num_vregs		=3D ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		=3D sa8775p_qmp_phy_vreg_l,
> +	.num_vregs		=3D ARRAY_SIZE(sa8775p_qmp_phy_vreg_l),
>  	.regs			=3D pciephy_v5_regs_layout,

[Severity: Medium]
This unconditionally requires the refgen supply for the SA8775P PHY, but
the DT binding schema explicitly omits refgen-supply from the required
properties for SA8775P.

If an SA8775P platform boots with a compliant device tree that omits the
optional refgen-supply, will the driver fail to probe here when fetching
the bulk regulators?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810112735.1326=
807-1-ziyue.zhang@oss.qualcomm.com?part=3D2
