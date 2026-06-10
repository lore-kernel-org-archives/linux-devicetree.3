Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2753AFD08
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093905; cv=none; b=D2i1ME7Dkq+cOekzO0ECxayvfo89fa2XL+jOjHqeEzsK88uMxO29n1kO3ZFRjIb9w453U2pSqOcqk5d6gDqr0hAfeF9Cvw3FCvQAPxvKj6qZ/b/cgSkQfoFuD6q2O+mD2PsemP+MrK9NVOZMtYrjrPmxN7PuSXSVeeCDtf/uxqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093905; c=relaxed/simple;
	bh=BlDSP6Bs2iRj9J9QAfqQw2733nlKCiTxFINluU/KZUg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y9CIObWwRebIAhNgS+7u33r+ZU6TefMNLv3s2ibfG3Be2WWZgxLfOlXQrXPYym8YWnqeNq6DpanmNwPNRLO6rDC+8HlsGw1/FZABUDZJ2W9heFCea48DZlFniivPdf/cztyRnnB2VOGhp5/8UbuT7BHte7FMAcHnkJdef/Bvf28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCCOFGer; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCCOFGer"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111631F00893;
	Wed, 10 Jun 2026 12:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781093904;
	bh=lmexZrCeU9+HbvwvfuRt3zc3yavo3Y5jIZGJuSHvWJk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DCCOFGerpZT4/5t0XFPU+bxutUTEZIrxuV8k0+1lezWxaMM2uKTp30g9ztP0SuzM1
	 +qQe549k8TqPSoSQ2tvBo6MB0lGWFT7hlBR9aE4+RoZBVUbxK4c8TzsYVA7TZt0nZc
	 qJh2axSsA5lnjubpG7hkE4DpblnFzyBYtCIQ/wxkBYfHLVcdC8sywCGQdGN38cRiD0
	 MHfehvh5ZRjbanAa2z/qBaPnc8x3pdhYkQMxcQ4F60rX+OENPZHKc1UOrjAMJocGiE
	 OPsGAMyr9Ec0EgDGGz/bNDIl+2r1I1OjxiQyjuNj1MP0hWxd59IoEFf4CvdLDJioAb
	 DJDGmkCS4KWvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610-topic-8996_61x5_qusb2phy-v1-3-d7135980e78f@oss.qualcomm.com>
References: <20260610-topic-8996_61x5_qusb2phy-v1-3-d7135980e78f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 12:18:23 +0000
Message-Id: <20260610121824.111631F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding the VDD_MX power domain interacts brokenly with the PHY dri=
ver's runtime PM implementation, permanently pinning the VDD_MX power rail =
and causing a severe battery drain regression during system idle.
--

commit f3735b6dfcc42f0f55443d0f81c7b256532b0e25
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs

This commit adds the VDD_MX power rail description to the QUSB2 PHYs in the
msm8996 device tree. It explicitly sets the power domain and required OPPs
for both primary and secondary PHY nodes.

> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/=
qcom/msm8996.dtsi
> index 2f67e665996f3..b7cd1928335c8 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -3192,7 +3192,12 @@ hsusb_phy1: phy@7411000 {
>  			clock-names =3D "cfg_ahb", "ref";
> =20
>  			resets =3D <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +			power-domains =3D <&rpmpd MSM8996_VDDMX>;
> +			required-opps =3D <&rpmpd_opp4>;

[Severity: High]
Does adding this power domain permanently pin the VDD_MX rail?

Looking at the driver in drivers/phy/qualcomm/phy-qcom-qusb2.c,
qusb2_phy_probe() sets up runtime PM like this:

	pm_runtime_set_active(dev);
	pm_runtime_forbid(dev);
	ret =3D devm_pm_runtime_enable(dev);

Because the driver forbids runtime suspend by default, the device stays
permanently active.=20

If we attach the PM domain and require an OPP here, won't the generic PM
domain framework apply the OPP4 performance state permanently, preventing t=
he
SoC from scaling down its logic voltage during system idle?

> +
>  			nvmem-cells =3D <&qusb2p_hstx_trim>;
> +
>  			status =3D "disabled";
>  		};
> =20
> @@ -3206,7 +3211,12 @@ hsusb_phy2: phy@7412000 {
>  			clock-names =3D "cfg_ahb", "ref";
> =20
>  			resets =3D <&gcc GCC_QUSB2PHY_SEC_BCR>;
> +
> +			power-domains =3D <&rpmpd MSM8996_VDDMX>;
> +			required-opps =3D <&rpmpd_opp4>;
> +
>  			nvmem-cells =3D <&qusb2s_hstx_trim>;
> +
>  			status =3D "disabled";
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-topic-8996=
_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com?part=3D3
