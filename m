Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476353C7E13
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 12:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789908811; cv=none; b=OISdsBLmeXFdSI3xtSILoPbVHbjW47j3AzNMVrMMAo9TR0y/XloBW4PNflcGwFzcIake5PkRgzHvYEruD7+gncKGsEVL9gM11360vSq4Via08cItQookox/1X2p2J5s09cafLSXcG4JptGV49pGEeC9nvs/giyBCMTcmxQsAyVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789908811; c=relaxed/simple;
	bh=o/nawfiFQd0CrN22pkrA9T38n/2uRgQwZLAoqnoq18g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e8qEIiBfE4fylRz6U/6qJAyNYvCH6RfSrboS4eXN560yTCyOtNrBJ3lSmfDaw0uAPTHlM0oO4hY0nvDM8XfV5as+8Y7mvONj5ViLNFNmUQ8u4guBwhpmU+kEcwOpWrPArz2Quc0DhD6Q12GZeSyH0IAXfvRy+legZh/WmJfD66c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7AFOpYf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7AFOpYf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E5A31F000FF;
	Sun, 20 Sep 2026 12:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789908799;
	bh=SKBPvnCf0OrqkCEig86J9amZCxAny2+66nIYZiBwcRU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z7AFOpYfDl18uLmg37eRWXBNETtHO64gLkt7XG3mO5Qpfkcjum4YYJSGCDGJrhAfL
	 Ix/3ksXSTSKWdUxF7+lroyi6u2atLcVAnhLQUfw4QqjSWKtrtfKFqnbh7nU1lzSYFC
	 n582MSgLw8kPafE0pUBdjZx99TKNyj9nC6qE17hIiYxBr04SF2Ec3zbAfvblqMcOFJ
	 Mm9Q5LLRsv4HZKqIo8agLFDDdZl/0FVlTrnG3L+rou6+Xyju3OWHtkU3z88zxuCYZf
	 4+I50uNogKdwW+Vbi7lk5lVf4mdV3+cXuS8J8eHd7LW5GsNP7HxNCQN6D/Z4l7Qf5A
	 FMuX5mofhXEHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 05/11] arm64: dts: rockchip: rk3568: add
 XPCS and fixed-clock nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260919125119.2107089-6-coiaprant@gmail.com>
References: <20260919125119.2107089-1-coiaprant@gmail.com>
 <20260919125119.2107089-6-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 12:53:18 +0000
Message-Id: <20260920125318.9E5A31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] devicetree: fixed-clock anti-pattern for internal XPCS clocks
- [Low] devicetree: missing required phys property in xpcs node
--

commit 752959013e963f31a1ffc2b59a8a556bc481a7c3
Author: Coia Prant <coiaprant@gmail.com>
arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes

This commit adds the XPCS device node and associated fixed-clock nodes to
the RK3568 SoC device tree to support 1000BASE-X, SGMII, and QSGMII
interfaces. The XPCS node requires board-level activation and PHY
assignments, while the fixed-clock nodes are introduced to provide a
static 125 MHz reference.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3568.dtsi
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> @@ -110,6 +110,51 @@ sata0: sata@fc000000 {
>  		status =3D "disabled";
>  	};
> =20
> +	xpcs: ethernet-pcs@fda00000 {
> +		compatible =3D "rockchip,rk3568-xpcs";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		reg =3D <0x0 0xfda00000 0x0 0x200000>;
> +		clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
> +		clock-names =3D "csr", "eee";
> +		power-domains =3D <&power RK3568_PD_PIPE>;
> +		status =3D "disabled";

[Severity: Low]
The commit message states that "dtbs_check only validates required properti=
es
for enabled nodes, so the SoC dtsi does not provide phys/phy-names". Is this
assumption accurate?

dt-schema evaluates all nodes against the required list regardless of the
status property, unless the schema explicitly conditions the requirement. W=
ill
this omission cause make dtbs_check to throw validation errors for all RK35=
68
boards that leave the XPCS node disabled?

[ ... ]

> +	clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "clk_gmac0_xpcs_mii";
> +		#clock-cells =3D <0>;
> +	};

[Severity: Low]
Does using a fixed-clock here accurately model the hardware?

Since the 125 MHz reference clock is generated internally by the XPCS or
Combo PHY, representing it as a fixed root oscillator appears to violate
devicetree hardware modeling principles.

Should the IP block that actually generates this clock act as the clock
provider, instead of injecting a dummy fixed-clock node into the device tre=
e?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919125119.2107=
089-1-coiaprant@gmail.com?part=3D5
