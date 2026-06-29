Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68683B9927
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729286; cv=none; b=mNk5tWZs/opTihkwj5ytsswChkj1ZV54saKjc7DJ38x2xReCUoqLrnIYk6x2MokjvQjEByO6TUc7DuZYFKR31N657gnI/Bu8YxepauJWWEKMR3F4K+R5xS30CtP1frbKQInsMki81r/BRU+5OQxVU3Zc1r4NATycaZWDePtiOKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729286; c=relaxed/simple;
	bh=od7NFIkBg96zs/oe2Wh17/x3UlwpPOBVPggrNSbkvX0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lJiwF/bKmXApBrgWOm194L0nieTfJmOIkeWQjLwQcNA0V8ROTg6hqxwGvUwUo9D1hQQ4BMnWRi5gj7wwSyMVqty3pd9T8ZU6WekZ/6Y0WPiHtwy8EK8ETMoM7X9j0QZV8y6Ak6P612vojwEOMYZGwYAOGaXRAXXjJsHDAEzJTX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmbnpmPc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmbnpmPc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134A11F00A3A;
	Mon, 29 Jun 2026 10:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782729285;
	bh=I2CvbvsAAJd3pHJEJfKrE9eyRKg5gMWgnhJAf+kd/Yc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fmbnpmPc1fW/a+VjULJNv0W+0DFb4JEehVv3a6T+PknZQoelo0FafQjWcn2cMuKs6
	 xRVfkd8kr8ibYyV9qh6mPEhsZZBd2oQa8mHlW6ocAbyv7sda2PUDE7nN39RiIDoLTY
	 Tg73PThzA2F+3PVNE57jY3cn0J2ETt6bJ0yneZr1MfyBjjOi12anM8VkORMn5r9SFu
	 wrWyHq2EUpLlaqGiC6yDrftDnMss88Yo66067uutIKUpgW9FX0AY7K1NLE0cAw45GT
	 CvTfON9wtcCEE7avw5Dm2euj9GJp2bR3BFZmtzgMtDqtwp9YKgpWpGh3kbbp30Lr7i
	 KpwVmYXMSqA5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: ti: k3-j784s4: Add overlay for dual
 port USXGMII+SGMII mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gokul Praveen" <g-praveen@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629102308.56616-4-g-praveen@ti.com>
References: <20260629102308.56616-1-g-praveen@ti.com>
 <20260629102308.56616-4-g-praveen@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 10:34:44 +0000
Message-Id: <20260629103445.134A11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Array length mismatch between `assigned-clocks` and `assigned-cl=
ock-parents` in `&serdes_wiz2`.
- [Low] Mismatch between node unit-address and 'reg' property in SerDes PHY=
 links.
- [Low] Dangling continuation backslash on the last item of a Makefile list=
 immediately preceding a comment.
--

commit bc5648306dcc07a1bc8095cecaf3da3724e52d5d
Author: Gokul Praveen <g-praveen@ti.com>

arm64: dts: ti: k3-j784s4: Add overlay for dual port USXGMII+SGMII mode

The CPSW9G instance of the CPSW Ethernet Switch supports SGMII and
USXGMII mode with MAC Ports 1 and 2 of the instance, which are
connected to ENET Expansion 1 and ENET Expansion 2 slots on
the EVM respectively, through the Serdes2 instance of the SERDES.
Enable CPSW9G MAC Ports 1 and 2 in fixed-link configuration
SGMII and USXGMII mode at 1Gbps and 5 Gbps each.

> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Mak=
efile
> index 5269c9619b65c..72c91f8f7814d 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
[ ... ]
> @@ -337,7 +343,8 @@ dtb- +=3D k3-am625-beagleplay-csi2-ov5640.dtb \
>  	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
>  	k3-j784s4-evm-quad-port-eth-exp1.dtb \
>  	k3-j784s4-evm-usb0-type-a.dtb \
> -	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
> -
> +	k3-j784s4-evm-usxgmii-exp1-exp2.dtb \
> +	k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2.dtb \
> +	k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1.dtb \
>  # Enable support for device-tree overlays
>  DTC_FLAGS :=3D -@

[Severity: Low]
Does this trailing backslash escape the newline before the comment? Since
Make processes continuations before comments, this merges the comment onto
the dtb- line. If the comment is ever removed, DTC_FLAGS :=3D -@ would be
mistakenly pulled into the dtb- variable.

> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2=
_board1.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2=
_board1.dtso
> new file mode 100644
> index 0000000000000..4ceb99c5c8088
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1=
.dtso
[ ... ]
> +&serdes_wiz2 {
> +	assigned-clocks =3D <&k3_clks 406 6>,  <&k3_clks 406 5>;
> +	status =3D "okay";
> +};

[Severity: Medium]
Will this 2-element assigned-clocks array work correctly without overriding
the assigned-clock-parents array as well? Since assigned-clock-parents has
only 1 element in the base device tree, the clock framework evaluates
num_parents based on that length and ignores the second clock here, leaving
it unparented.

[ ... ]
> +&serdes2 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";
> +
> +	assigned-clock-parents =3D <&k3_clks 406 5>,
> +						 <&k3_clks 406 6>,
> +						 <&k3_clks 406 5>;
> +
> +	serdes2_sgmii2_link: phy@1 {
> +		reg =3D <2>;
> +		cdns,num-lanes =3D <1>;
> +		#phy-cells =3D <0>;
> +		cdns,phy-type =3D <PHY_TYPE_SGMII>;
> +		resets =3D <&serdes_wiz2 3>;
> +	};

[Severity: Low]
Does this node name phy@1 violate the standard device tree schema when the
reg property is set to 2? This mismatch will trigger a unit_address_vs_reg
dtc compiler warning.

> +	serdes2_usxgmii_link: phy@0 {
> +		reg =3D <3>;
> +		cdns,num-lanes =3D <1>;
> +		#phy-cells =3D <0>;
> +		cdns,phy-type =3D <PHY_TYPE_USXGMII>;
> +		resets =3D <&serdes_wiz2 4>;
> +	};

[Severity: Low]
Similarly here, shouldn't the unit-address in phy@0 match the reg property
of 3?

> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2=
_board2.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2=
_board2.dtso
> new file mode 100644
> index 0000000000000..ef4ebb5515469
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2=
.dtso
[ ... ]
> +&serdes_wiz2 {
> +	assigned-clocks =3D <&k3_clks 406 6>,  <&k3_clks 406 5>;
> +	status =3D "okay";
> +};

[Severity: Medium]
Like in board1, will this assigned-clocks override fail to assign the second
clock because it doesn't also update assigned-clock-parents to be a
2-element array?

[ ... ]
> +	serdes2_sgmii2_link: phy@1 {
> +		reg =3D <3>;
> +		cdns,num-lanes =3D <1>;
> +		#phy-cells =3D <0>;
> +		cdns,phy-type =3D <PHY_TYPE_SGMII>;
> +		resets =3D <&serdes_wiz2 4>;
> +	};

[Severity: Low]
Does this unit-address phy@1 need to be updated to phy@3 to match the reg
property?

> +	serdes2_usxgmii_link: phy@0 {
> +		reg =3D <2>;
> +		cdns,num-lanes =3D <1>;
> +		#phy-cells =3D <0>;
> +		cdns,phy-type =3D <PHY_TYPE_USXGMII>;
> +		resets =3D <&serdes_wiz2 3>;
> +	};

[Severity: Low]
Does this unit-address phy@0 need to be updated to phy@2 to match the reg
property?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629102308.5661=
6-1-g-praveen@ti.com?part=3D3
