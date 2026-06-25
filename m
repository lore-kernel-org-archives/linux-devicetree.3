Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5192F3E022B
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782390008; cv=none; b=LQ3zjYqy9XZmYs20WSDsSUwIkpG/ECaycTPYTnnRVcypN9ka36yYLbqO/JP1KZERBbsWO51ayAZYZWjFxzB4ZSCubF3ZGnRsaL0tMCvr5ewIDJOmxyez1orJdHyEU5FPPXepLKFvLJuQsmQ2nevFuC1++dwGIq8ndEYX6/Ex/9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782390008; c=relaxed/simple;
	bh=OJCmzFlkr7pJHKUvvUvTAs8iMCXjyWBIjLkN1D0ms/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pRG11U29N9HDIchm2pOrpTL8QTSs8DW4G39bM6s5wjW7z2s4qmKTb5CHhlbxljF5OKvb/OaTJHSeksUX8l0VsmVg+jGE+YrOhprdu+uVOwS3Jxnp1I+5yI9GHiMXdMPxcMaWhuaAgoyXyiIaYIVPTds2pMLb/nQGxrd5QKLzuWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3XZaZCm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3XZaZCm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13361F000E9;
	Thu, 25 Jun 2026 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782390006;
	bh=wVKUBAOc7aY5V56B0lcAw6Bgjk/IjFirKhKfJ9pNzH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l3XZaZCmz1flHWSSf01TP7p9FFnurSNU4iKlWC/7xz0XzFoIAvMfJ5rNCBfBrHt4q
	 rAA04RPqmayT+viKfw9nfVh1cUV2QpBzPSSq4zq9SyYiHn3iCHRuSzal64gnEueT5x
	 lrwKrkFoQOb8LZJFjrXtJQc8af0kn3Yt/vVR62WW6C8sMj4cXZx4X0i011H/NweVJ/
	 RTXZuWvfHPBhaBopECvHW2G2L9puhyCKtt9fl2scyWg08yrBR7yFt1B7CceS66lIuD
	 VTn426PUMkxg8/K8VLoqAYuxsMfOAT9cPycTMSFmlV/gZCkPAiFR+Sc/GniaEwSGnb
	 8W7o3IjN+okKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-j784s4: Add overlay for dual
 port USXGMII+SGMII mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gokul Praveen" <g-praveen@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625120805.28948-4-g-praveen@ti.com>
References: <20260625120805.28948-1-g-praveen@ti.com>
 <20260625120805.28948-4-g-praveen@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 12:20:06 +0000
Message-Id: <20260625122006.A13361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incomplete clock configuration in `&serdes_wiz2` leaves a dangli=
ng `assigned-clocks` element as dead code.
- [Low] The unit addresses in the PHY node names do not match their `reg` p=
roperty values.
--

commit ec16658036ad6f4bdcb6018a15184b9bd2b3c4aa
Author: Gokul Praveen <g-praveen@ti.com>

arm64: dts: ti: k3-j784s4: Add overlay for dual port USXGMII+SGMII mode

The CPSW9G instance of the CPSW Ethernet Switch supports SGMII and
USXGMII mode with MAC Ports 1 and 2 of the instance, which are
connected to ENET Expansion 1 and ENET Expansion 2 slots on
the EVM respectively, through the Serdes2 instance of the SERDES.

Enable CPSW9G MAC Ports 1 and 2 in fixed-link configuration
SGMII and USXGMII mode at 1Gbps and 5 Gbps each.

> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2=
_board1.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2=
_board1.dtso
> new file mode 100644
> index 0000000000000..553546b281a9e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm-sgmii-usxgmii-exp1-exp2_board1=
.dtso

[ ... ]

> +&serdes_wiz2 {
> +	assigned-clocks =3D <&k3_clks 406 6>,  <&k3_clks 406 5>;
> +	//assigned-clock-parents =3D <&k3_clks 406 9>; /* Use 100 MHz clock for=
 SGMII */
> +	status =3D "okay";
> +};

[Severity: Medium]
The assigned-clock-parents override is commented out here, but the
assigned-clocks array was expanded to two elements.

Because the base device tree only defines a single parent, the clock framew=
ork
will only process the first clock and silently ignore the second element.

Does this leave the second clock unconfigured, and should
assigned-clock-parents be uncommented to resolve this?

> +
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
> +	serdes2_usxgmii_link: phy@0 {
> +		reg =3D <3>;

[Severity: Low]
Do the unit addresses phy@1 and phy@0 need to match their reg property
values <2> and <3>?

The dtc compiler will generate unit_address_vs_reg warnings when the unit
address and reg property do not match.

[ ... ]

> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2=
_board2.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2=
_board2.dtso
> new file mode 100644
> index 0000000000000..c98be3bbf2c8b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm-usxgmii-sgmii-exp1-exp2_board2=
.dtso

[ ... ]

> +&serdes_wiz2 {
> +	assigned-clocks =3D <&k3_clks 406 6>,  <&k3_clks 406 5>;
> +	//assigned-clock-parents =3D <&k3_clks 406 9>; /* Use 156.25 MHz clock =
for USXGMII */
> +	status =3D "okay";
> +};

[Severity: Medium]
Similar to the first overlay, the assigned-clock-parents override is commen=
ted
out while assigned-clocks contains two elements.

Is the second clock intended to be left unconfigured here?

> +
> +&serdes2 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";
> +
> +	assigned-clock-parents =3D <&k3_clks 406 5>,
> +						 <&k3_clks 406 6>,
> +						 <&k3_clks 406 5>;
> +
> +
> +
> +	serdes2_sgmii2_link: phy@1 {
> +		reg =3D <3>;
> +		cdns,num-lanes =3D <1>;
> +		#phy-cells =3D <0>;
> +		cdns,phy-type =3D <PHY_TYPE_SGMII>;
> +		resets =3D <&serdes_wiz2 4>;
> +	};
> +	serdes2_usxgmii_link: phy@0 {
> +		reg =3D <2>;

[Severity: Low]
Are the unit addresses for these nodes correct?

They are named phy@1 and phy@0, but their reg properties are set to <3>
and <2>. Should they be updated to match the reg properties to prevent dtc
warnings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625120805.2894=
8-1-g-praveen@ti.com?part=3D3
