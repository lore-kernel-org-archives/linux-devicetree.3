Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117A53C109F
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 08:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509212; cv=none; b=pevIIe5Q6u0/1WEX4bbw+b1npTjpXdgORKO7MvTEtLgXDbl1LPaCU4H0e7NwzgKIW8ICo2N5N5hR6O44JILNBgpt9FqaCJehNKaw6XRG327weABnMulMWdQl3f0cIbCO9MaMsUJkPAYDelYNBPtvHvJYYGGFATwtGR8aYNGvMUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509212; c=relaxed/simple;
	bh=H71n+v/6agsubzL1dDLhfil76iXRnOVH8OAauR6hr14=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cZPnWCT1Bdyk+ws3t5uYMrbDYfX5c5R1RUzUDYlU6M3I23PnQ5H/Nrb/BDpjXULDssINoavQqOSN7nopBrK39kpEy563ZOSIByTFmy7QCd4MV+tmWewolmBO5Ba7VO6i1xRCw6oFYKCD5lLC/ulNwgLYqVd9mWKQj6J6paH5NcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIR8hbNX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIR8hbNX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B2541F00A3D;
	Fri,  4 Sep 2026 08:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788509210;
	bh=rqJB+RFVMX7Y3T+dKP0VQD3Lc4cC6K594Jivb5WgAfE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OIR8hbNXQvQMLnp4nN5kts5UPDLhDPVlpu8r3mERGLW1jCjrl5AyydacCCRvC0NkS
	 rV/+i2Vf8AzrDYDNsmXqyBIc4ReJkSD6sJ7G2+uUM1EbdZFSYCwDx71nGVZ7kQXPpD
	 2b/rdcKBv6YV4rL1DAcv0SZWRbzVB3B2t4F/YdGcYB8/vuPuqteyxqErqT+LzVSiJU
	 HHvBCVoDqbv826fbXBaRcBLIUQJGCunCa25uBrFon0jbjorkl9e0MYv/1QabfK/O2v
	 yV7lHImgzOIZmWocaKqMp5h37kIc7QlvP87Isxpxr9qW0M107LF+E77wPOH93bpIuX
	 Sk5HZrClHPj3A==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] arm64: dts: rockchip: add mipi csi-2 receiver nodes
 for the dcphys on rk3588
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Yang" <jason98166@gmail.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com
In-Reply-To: <20260904075534.574037-1-jason98166@gmail.com>
References: <8e10a8c0-3648-47b5-9131-a1abdd7eb8c5@kernel.org>
 <20260904075534.574037-1-jason98166@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 08:06:49 +0000
Message-Id: <20260904080650.2B2541F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Increasing `#phy-cells` to 2 breaks the existing PHY driver and vi=
olates the device tree binding schema.
- [Low] Undeclared macros `PHY_TYPE_CSI` and `PHY_TYPE_DSI` cause Device Tr=
ee Compiler (DTC) syntax errors and build failures.
--

commit 743d097de341070ad41811abb0840d431932cb63
Author: Jason Yang <jason98166@gmail.com>

arm64: dts: rockchip: add mipi csi-2 receiver nodes for the dcphys on rk3588
   =20
This is test patch, contains the following 3 changes:
  - raise #phy-cells to 2
  - add PHY_TYPE_DSI to the dsi nodes
  - add mipi csi0 and csi1

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3588-base.dtsi
> index 376ad04e07869..bcb2704037c86 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi

[ ... ]

> @@ -1568,6 +1576,66 @@ vicap_mmu: iommu@fdce0800 {
>  		status =3D "disabled";
>  	};
> =20
> +	csi0: csi@fdd10000 {
> +		compatible =3D "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2=
";
> +		reg =3D <0x0 0xfdd10000 0x0 0x10000>;
> +		interrupts =3D <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names =3D "err1", "err2";
> +		clocks =3D <&cru PCLK_CSI_HOST_0>;
> +		phys =3D <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_CSI>;

[Severity: Low]
Will this compile correctly? PHY_TYPE_CSI does not appear to be defined
in include/dt-bindings/phy/phy.h or any included header, which could
cause device tree compiler syntax errors and build failures due to
raw string tokens left by the C preprocessor.

> +		power-domains =3D <&power RK3588_PD_VI>;
> +		resets =3D <&cru SRST_P_CSI_HOST_0>;
> +		status =3D "disabled";

[ ... ]

> @@ -1788,7 +1856,7 @@ dsi0: dsi@fde20000 {
>  		resets =3D <&cru SRST_P_DSIHOST0>;
>  		reset-names =3D "apb";
>  		power-domains =3D <&power RK3588_PD_VOP>;
> -		phys =3D <&mipidcphy0 PHY_TYPE_DPHY>;
> +		phys =3D <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_DSI>;

[Severity: Low]
Is PHY_TYPE_DSI defined? Similar to PHY_TYPE_CSI, this undeclared macro
can lead to syntax errors when compiling the arm64 dtbs.

>  		phy-names =3D "dcphy";
>  		rockchip,grf =3D <&vop_grf>;
>  		status =3D "disabled";

[ ... ]

> @@ -3429,7 +3497,7 @@ mipidcphy0: phy@feda0000 {
>  			 <&cru SRST_P_MIPI_DCPHY0_GRF>,
>  			 <&cru SRST_S_MIPI_DCPHY0>;
>  		reset-names =3D "m_phy", "apb", "grf", "s_phy";
> -		#phy-cells =3D <1>;
> +		#phy-cells =3D <2>;

[Severity: High]
Does this change break the existing PHY driver?

The rockchip samsung dcphy binding schema currently restricts #phy-cells
to 1 (Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml=
).

Additionally, the driver explicitly rejects any request with more than 1
argument:

drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c:samsung_mipi_dcphy_xlate(=
) {
	if (args->args_count !=3D 1) {
		dev_err(dev, "invalid number of arguments\n");
		return ERR_PTR(-EINVAL);
	}
}

Will increasing this to 2 cause the driver to return -EINVAL during probe,
breaking display and camera initialization on this platform?

>  		status =3D "disabled";
>  	};
> =20
> @@ -3445,7 +3513,7 @@ mipidcphy1: phy@fedb0000 {
>  			 <&cru SRST_P_MIPI_DCPHY1_GRF>,
>  			 <&cru SRST_S_MIPI_DCPHY1>;
>  		reset-names =3D "m_phy", "apb", "grf", "s_phy";
> -		#phy-cells =3D <1>;
> +		#phy-cells =3D <2>;

[Severity: High]
Can this also cause the same probe failure for the second PHY instance
due to the driver's strict args_count check?

>  		status =3D "disabled";
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904075534.5740=
37-1-jason98166@gmail.com?part=3D1
