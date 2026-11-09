Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243903;
	b=moQ7qtrdy7Dbfy3IkI29OrV6XbYBN4mkXp6vQOKTS2cyxwDRUC2jCbkGy7OvhBlRabWr
	 AkvpZy6AS97wPoVoT4GozUe1uxrfINNlbcS1bJ0egeZJdyk3dMOD6F9FHB6MAR0csisOK
	 8W77eVa8NWpJGViQ+04RhJlCbjAkIUy2/xp16h3ohdSfUNUhoJZzOxNqOi5NXF3/XrhGn
	 cHqdFTpzukZaih+Yh/BPduB8T3PuPt5Y+7V/zxBAz/B+BsLufm8gL6A59vDMvcqr1yiE/
	 3KeMVmu2kfffLMg7PcF6WVPqAFM04wCDi2RKKTSvIQfEA3bYQ0N7EPA1lZCWrZJJJRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243903;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FyuaGXAAU/xaY+Az36aBHl3tKemlUj6VHeWOnpQAG98=;
	b=oTrmLTSXE/qquJqzwN3MLO2FMfe/7fT9GtEKtlmqlKAb7KjtyCOOsCchrGzMRpllOwHf
	 +JSYHqV/u8w8GmCJDZ0gkKY31rXZGUQ9aqA472HGvbqmWuIrfpYmS7JWzYkimPpMGa0E5
	 l1VvPG12z2PNg1GTzHQ3QdZCdHoEMP8x1hJ1wx9x3psunj9o3+ITQ4gdq4nyI1AFPgQv4
	 xKtntdu3ZmFd2IY2hed9CbxaNDEaf4bjTmSxdyS2Yw3fUzvG2Vcop0NXrPpCB5Qg2EvI7
	 p+/1+/XDC5rkVighnj7+qs345ylIFDjC5+O8mmTovyD+4aY1aud8ziV6Gi3guxb2swg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NxRdpyVs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA50606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 17:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NxRdpyVs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC261F008A2;
	Mon,  9 Nov 2026 17:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794243903;
	bh=FyuaGXAAU/xaY+Az36aBHl3tKemlUj6VHeWOnpQAG98=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NxRdpyVsCHb8lCbQS59WALcDu9X3MYYAStJ99a9+I+czBYLxVUqls7xHHxMVaaeva
	 vU2Bofs16d0DJ9bUmn9cOBusuNtvn4aXlMPifQip8EVQgoAj2VS5emfCn3cGYQfTKn
	 n1R3CvGBT/tXcjY/1xdG7KP0ZHChtgcYBDMT1tZSBFaH9MbJyqBzfwT2ivTqrJR5HN
	 eV9b8Q2S8qglFF9+SBAzkZi0bXKtiDU7WmAC+VRx0RNR1cgCGtWuG7Zuk2wP5TnEiv
	 Rb+x85cSItI/kkc8preVlhoxxSYAXj1YE4ydux1FBQMK31sZyU6njc1oUu11TgEh//
	 so7e/k4GGtrNg==
Message-ID: <sashiko-outbox-205268@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] ARM: dts: aspeed: Add Intel AVCRP BMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawid Glazik" <dawid.glazik@linux.intel.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <ee6958ba4b93cde4719fbac89c4027964c2236bc.1794242015.git.dawid.glazik@linux.intel.com>
References: <cover.1794242015.git.dawid.glazik@linux.intel.com>
 <ee6958ba4b93cde4719fbac89c4027964c2236bc.1794242015.git.dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 17:05:02 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] ARM: dts: aspeed: avcrp: uart3/4 pinmux conflicts and pinctrl
  GPIO names
- [Low] ARM: dts: aspeed: avcrp: unnecessary RMII RCLK clock specified
  on RGMII mac1
--

commit 60b4388d543f21749b3a54e80fb2aad89bf0d6d7
Author: Dawid Glazik <dawid.glazik@linux.intel.com>

ARM: dts: aspeed: Add Intel AVCRP BMC

This commit adds the device tree for the Intel AVCRP BMC platform based on
the ASPEED AST2600 SoC.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts b/arch/a=
rm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> new file mode 100644
> index 0000000000000..eb73d64412228
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
[ ... ]
> +&gpio0 {
> +	gpio-line-names =3D
> +		/*A0-A7*/ "", "", "", "", "SMB_CPU_PIROM_SCL", "SMB_CPU_PIROM_SDA",
> +				"SMB_IPMB_STBY_LVC3_SCL", "SMB_IPMB_STBY_LVC3_SDA",
> +		/*B0-B7*/ "", "", "", "FM_CPU1_ERR2_LVT3_N", "", "",
> +				"FM_BMC_BMCINIT_R", "FP_ID_LED_N",
[ ... ]
> +		/*L0-L7*/ "", "", "", "", "PREQ_N", "TCK_MUX_SEL", "", "",
> +		/*M0-M7*/ "", "", "", "", "", "", "SPA_SOUT", "SPA_SIN",
[ ... ]
> +&mac1 {
> +	clocks =3D <&syscon ASPEED_CLK_GATE_MAC2CLK>,
> +		 <&syscon ASPEED_CLK_MAC2RCLK>;
> +	clock-names =3D "MACCLK", "RCLK";
> +	phy-handle =3D <&ethphy1>;
> +	phy-mode =3D "rgmii-id";
> +	pinctrl-0 =3D <&pinctrl_rgmii2_default>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};

[Severity: Low]
Does &mac1 need the second clock entry here?  In aspeed-g6.dtsi, &mac1
already sets clocks to ASPEED_CLK_GATE_MAC2CLK, and the optional second
clock (ASPEED_CLK_MAC2RCLK) gates the 50MHz reference clock output for
rmii mode, which is unused when phy-mode is "rgmii-id".

[ ... ]

> +&uart1 {
> +	status =3D "okay";
> +};
> +
> +&uart3 {
> +	status =3D "okay";
> +};
> +
> +&uart4 {
> +	status =3D "okay";
> +};
> +
> +&uart5 {
> +	status =3D "okay";
> +};
> +
> +&uart_routing {
> +	status =3D "okay";
> +};

[Severity: High]
Should &uart3 and &uart4 override pinctrl-0 =3D <>; when used with
&uart_routing on this board?

In aspeed-g6.dtsi, &uart3 defaults to pinctrl_txd3_default and
pinctrl_rxd3_default (pins L4 and L5), and &uart4 defaults to
pinctrl_txd4_default and pinctrl_rxd4_default (pins B6 and B7).  Without
clearing pinctrl-0, probing &uart3 and &uart4 muxes those balls away from
&gpio0, driving serial tx onto the board lines named in gpio-line-names on
B6 and L4 and causing gpio requests on B6, B7, L4 and L5 to fail with
-EINVAL under strict pinmux.

In addition, &gpio0 still sets gpio-line-names on pins A4-A7 and M6-M7,
which are claimed by the default pinctrl of &i2c12, &i2c13 and &uart1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794242015.gi=
t.dawid.glazik@linux.intel.com?part=3D2
