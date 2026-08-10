Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ED13C1D43
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362039; cv=none; b=meMMEtluQSg8QahUnKF91Osa332wB4qHprU9luuyEwwUv1bdzKQIHr5QRWpLndRDt5Xt9AMGtrtjUpSXP0saJBqkhBWQYQzAo5CqJX758lr/JncqoLA6MW4h0loBYyW6J+jjCXSjz7THiMs38yWgvQ6bA1tuqZEXxWC1blQswpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362039; c=relaxed/simple;
	bh=h01MzVdQH7rJB1OugqF70gejkhz9XQVR0EFs3s6bdd8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c7dNZ2GTmFdtA+4ed3wU0FyozkFDFh+7HZrNXr6oiapDgMdEN0UHa6VNVa/pxji19eCToDX3lK4P17locoX9gZ8/2+p5RV/3bQ9myVBwkV0D+VGSR3dc3/AiqyN/HCPVLr3tE7skPVdhMMCpHi9JehdWeaDqqpiRqwDzaJn7suc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oio/pavw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oio/pavw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8B11F00A3A;
	Mon, 10 Aug 2026 11:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786362038;
	bh=+O3Mz64NYdCGkGFTEDaghfMSjZ1KuizAfk7MoRWHfhk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oio/pavwKsHxNJSgv6wbNpaA9jLvQY4KMBLKu9JQ/PuI0V9Y5iSdPx+fihKj/BeLc
	 LDaLKNfOTeqvxJS0pzZzs/bjTrdrjDhLwlOljiihYVuKCbNOdQ8z+guVPy3wQk0voj
	 lC1Ce4p7ub2vA2aHWeSq0t4yR9H42LhsRe2BOdSbCabdwPCsvoFuWQ9FVxUN/B9tIU
	 /3Ho8MoUhuKN7GNVh3KJ/FJp8eS4+Et3JeMw7gjjFt43/ZOrmEaqpiCGiU7PzFsgdN
	 HlFpB7H1324yx7kxGR8ycWw2vfaNY1OYlgdXFo/GyfQOdMQSfJ4NDVMI2xoceNSM4T
	 Svj03/ADwzYlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/4] arm64: dts: qcom: qcs8300: Add qref and refgen
 supply for PCIe PHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziyue Zhang" <ziyue.zhang@oss.qualcomm.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, olteanv@gmail.com
In-Reply-To: <20260810112735.1326807-4-ziyue.zhang@oss.qualcomm.com>
References: <20260810112735.1326807-1-ziyue.zhang@oss.qualcomm.com>
 <20260810112735.1326807-4-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 11:40:36 +0000
Message-Id: <20260810114037.5C8B11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added DTS regulator properties for QCS8300 are silently =
ignored by the PCIe PHY driver, while the SM8450 driver now erroneously req=
uires them, causing a severe probe regression.
--

--- Patch [3]: [PATCH v1 3/4] arm64: dts: qcom: qcs8300: Add qref and refge=
n supply for PCIe PHYs ---
commit 649091d8c2c2002b7f51183d74007a50f755b8db
Author: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>

arm64: dts: qcom: qcs8300: Add qref and refgen supply for PCIe PHYs
   =20
This commit adds vdda-qref-supply, vdda-refgen-supply, and refgen-supply to
various QCS8300 board and SoC device trees. These dedicated voltage supplies
are required by the QMP PCIe PHYs to prevent occasional system crashes.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dt=
s/qcom/monaco-evk.dts
> index 9d17ef7d2caf1..c1f63a4ee2438 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> @@ -623,6 +623,8 @@ &pcie0 {
>  &pcie0_phy {
>  	vdda-phy-supply =3D <&vreg_l6a>;
>  	vdda-pll-supply =3D <&vreg_l5a>;
> +	vdda-qref-supply =3D <&vreg_l4a>;
> +	vdda-refgen-supply =3D <&vreg_l7a>;

[Severity: High]
Will these new supplies actually be consumed by the QCS8300 PHY driver?

Looking at the driver changes presumably earlier in this series, it appears
the updated regulator list was mistakenly applied to the sm8450 configurati=
on
instead of the qcs8300 configuration:

drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:qcs8300_qmp_gen4x2_pciephy_cfg() {
    ...
    .vreg_list      =3D qmp_phy_vreg_l,
    .num_vregs      =3D ARRAY_SIZE(qmp_phy_vreg_l),
}

drivers/phy/qualcomm/phy-qcom-qmp-pcie.c:sm8450_qmp_gen4x2_pciephy_cfg() {
    ...
    .vreg_list      =3D sa8775p_qmp_phy_vreg_l,
    .num_vregs      =3D ARRAY_SIZE(sa8775p_qmp_phy_vreg_l),
}

Does this mean the driver will still ignore these newly added properties on
QCS8300, while causing a probe regression on SM8450 platforms due to the
missing regulators?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810112735.1326=
807-1-ziyue.zhang@oss.qualcomm.com?part=3D3
