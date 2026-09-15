Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623794BD0F1
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473982; cv=none; b=a9C4a7xf2HGpmyRkwS98TmxLR04XzFWdeXO6t2T24T8HovydkUKRpbNt/54TwIyr+pkA0ic0jOKcbwOCZmKH9CWCXl4tni2E2Q0MSYObZNRh8h2a988IiBWs8uuoF8MjEdwHbPGk23mOMwG5QDDZ9kPiJZUNJpLevv28GG8NcbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473982; c=relaxed/simple;
	bh=Hj2Zin5J2VO9IXv9nBhZkSjQQgD0njm7cQx7g69Yb+k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WBAciMI8NrzHJKr8ZOxZz7+9fW2LG1DOnCIn9z+KSjamZadkKibWpyzSkvEeaT11fHjZl2a88DLfIBjjyAZH3frze2TWpuXYxnE2aaOa2ZGlpVMbJl7TBLDJ463zLZGuyX8ylF1hyFoQbD0upfQVyTS5a4GKivG22H3brdEVtic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HV99G+zP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HV99G+zP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8DE1F000FF;
	Tue, 15 Sep 2026 12:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789473981;
	bh=HlwP1awgTjMmTzD3AP9AbrCEvv7z9ImkzPsYVftxlFg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HV99G+zPk5X8XYbH5rC22+Pz8/OBfE4tP9TFU7XRyrzHzCHYHECKz3wqnqhw4O30m
	 Mz0+BOmyCRfhndQ0CDQE6DZzCZU8xz+3AWuOk2bCk75T+bw842WoVAapW7dDXDNjfW
	 OjOUNiWJ/abxWvaGK+7dw2HkrHrYCeME2Rt8IRzNJL6I7oA6vjiuao6FoXLm0Jilmz
	 nxHJpJ88NFRFXj5A80AaV7WFmOCwUzy2Xiu5UeOfeoFKA3FJBoZzree8iKvX2w1Yuf
	 hLqrX+4478aWhi/Mq5gMvC/lTHxr12NurSFtB+x2xEYhDBzexJl0Cxhr3N+9nxryRA
	 neSn36/sB7TQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: add mipi csi-2 receiver
 nodes to rk3576
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amin Gattout" <amin.gattout@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260915-csi-2-rcv-dts-v2-2-bdaf8141616a@gmail.com>
References: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
 <20260915-csi-2-rcv-dts-v2-2-bdaf8141616a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:06:20 +0000
Message-Id: <20260915120620.EC8DE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: rockchip: rk3576: unresolved phandles to csi_dphy0 and csi_dph=
y1
--

commit 74283d225fb35bb3bcff8713830fbb589c7d7648
Author: Amin Gattout <amin.gattout@gmail.com>

arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3576

This commit adds MIPI CSI-2 receiver nodes for MIPI1 and MIPI3 units to the
RK3576 device tree. It omits the remaining units because MIPI DCPHY and
split DPHY modes are not yet supported.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3576.dtsi
> index b0c0d3c8b1b14..adec5c762673b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1314,6 +1314,58 @@ vdec_mmu: iommu@27b00800 {
[ ... ]
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
Does this introduce an undefined phandle reference to csi_dphy0?

The label csi_dphy0 does not appear to be defined anywhere in rk3576.dtsi or
its included files, which causes a dtc build failure with a reference to
non-existent node or label error during make dtbs.

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
Does this introduce an undefined phandle reference to csi_dphy1?

Similar to csi_dphy0 above, the label csi_dphy1 is missing from the device
tree sources, causing dtc to fail with an unresolved reference when building
the device tree binaries.

> +			power-domains =3D <&power RK3576_PD_VI>;
> +			resets =3D <&cru SRST_P_CSI_HOST_3>;
> +			status =3D "disabled";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-csi-2-rcv-=
dts-v2-0-bdaf8141616a@gmail.com?part=3D2
