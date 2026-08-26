Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C98A3EEAE2
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 12:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787748310; cv=none; b=ZKGk3vsPQJ5zF+UHC9yJsiTh0nSlBowmk8q9ZOtg07kCLfIyTw2orEV8ZIzEZnYHv1h96lJOmkq3qdQ9ljZrVsLmAxW5Bb/G9lraQTqBDhywMQsVFIgSe35w1wEC2FNqXi3cVCW6TzgorSSFP7D7LLPkGjj8ceseXcjHov/ijWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787748310; c=relaxed/simple;
	bh=tK+knyg/FV6Yl9yfpQfVL625ZqiYhDcimbgLsSFLWGg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y9kEcaeEwpwBU5wUIcEqAfMkfAGe/Y+gNjMIcTUpQ3pp6f081m8BIZGp9BofRmDbjY8ZVvdBFu9JfA63xzQpDDKmGld4ZR9RurLPcjvJXv85NFB9sJw4j7BmxV44vFn4RuIqxt2vLjPeCxzb4zZAMh0rdDdiMp6DjRGuSJ3WuR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKkXm4u/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKkXm4u/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED3F1F000E9;
	Wed, 26 Aug 2026 12:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787748309;
	bh=PuluVGo6gG951h7B8eeudYK4dgTzehgb6k4NU2/t+hk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BKkXm4u/pFzR7IyxRL38hkiRDb6wfMvpmxChYcmZY9Vrd67VHC9ns57QRI3oyKYjP
	 9ZAEmZ2H/ZO+jD8230xnFamzL/AKdZsDVHxwOVMS5hphhF0IB0RmGRAPlBRZY1Ezau
	 TZE1Jw/sHuz5G3rzS/bxUQdVuxDbRJKlqO9wAVaGtBSg5JR/HP2xQib9z9aT8YLT1p
	 P4g1UD+gVt2p4Fg1V/Hx+ddSuo4ihuQTOkwworYfEPC8EMP9JFa5KcyT17Et6CAqaM
	 ov8v5EjiuXYFbjgjJfeG0E+OpzHOXjL1CIEEndVfa3nCNrddANEzRCPT02tO4vSEJi
	 fpipXAydPt/DA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: add mipi csi-2 receiver nodes
 to rk3576
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amin Gattout" <amin.gattout@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260826-csi-2-rcv-dts-v1-2-bcd8d459684d@gmail.com>
References: <20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com>
 <20260826-csi-2-rcv-dts-v1-2-bcd8d459684d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 12:45:08 +0000
Message-Id: <20260826124508.DED3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree nodes `csi1` and `csi3` reference undefined phandle=
s `&csi_dphy0` and `&csi_dphy1`, which will cause `dtc` compilation failure=
s.
--

commit 2763e4828ff081f08fc3dbfa496335676826e8a1
Author: Amin Gattout <amin.gattout@gmail.com>

arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3576

This commit adds device tree nodes for the MIPI1 and MIPI3 CSI-2 receiver
units on the Rockchip RK3576. It intentionally omits other MIPI units
which are either unsupported DCPHYs or split-mode DPHY lanes.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3576.dtsi
> index b0c0d3c8b1b14..adec5c762673b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1314,6 +1314,58 @@ vdec_mmu: iommu@27b00800 {
>  			#iommu-cells =3D <0>;
>  		};
> =20
> +		csi1: csi@27c90000 {
> +			compatible =3D "rockchip,rk3576-mipi-csi2", "rockchip,rk3568-mipi-csi=
2";
> +			reg =3D <0x0 0x27c90000 0x0 0x10000>;
> +			interrupts =3D <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "err1", "err2";
> +			clocks =3D <&cru PCLK_CSI_HOST_1>;
> +			phys =3D <&csi_dphy0>;

[Severity: Low]
Does this introduce a regression by causing a dtc compilation failure? The
csi_dphy0 phandle does not appear to be defined anywhere in rk3576.dtsi or
its included headers.

> +			power-domains =3D <&power RK3576_PD_VI>;
> +			resets =3D <&cru SRST_P_CSI_HOST_1>;
> +			status =3D "disabled";

[ ... ]

> +		csi3: csi@27cb0000 {
> +			compatible =3D "rockchip,rk3576-mipi-csi2", "rockchip,rk3568-mipi-csi=
2";
> +			reg =3D <0x0 0x27cb0000 0x0 0x10000>;
> +			interrupts =3D <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "err1", "err2";
> +			clocks =3D <&cru PCLK_CSI_HOST_3>;
> +			phys =3D <&csi_dphy1>;

[Severity: Low]
Will this also cause a dtc compilation error for boards including this file?
Similar to the csi1 node, the csi_dphy1 phandle appears to be undefined at
this point.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-csi-2-rcv-=
dts-v1-0-bcd8d459684d@gmail.com?part=3D2
