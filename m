Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084194;
	b=W1ogEC+AOeYBz9oB5nNYteq1C6wm1ZtDh7uJqqQEFNGW53UdcDJs0xFkw0wRl12sVFTN
	 m7dn09qNPadIQXLlUYhmY/L9sxVI1kohMJ/0WyGVUqH4RNseodfzH+9F35HwJkqbRZO5n
	 0nVldEgnbvIUTZTxrcfwxn9ZF4OqTJzTp1ykTMr4/6YOjsZCHpfFaSdR4UQARAKt/62PE
	 YlcK5wV2MGGR7RLy7Y7DMDm4ohePEIXFtFZrHd5wsCwXb/XA4Sfh12n/cEDS1E9mP0Rb4
	 abBnVUisScavdK44xRQUvtFWh9Jsb18bZ0JBCfXRJgo2hKBrBx/MMhUOF3ynEy+Kdtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084194;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Nx/LxkVaglxlKnpLdpBhFIM526PrStsU8QuvvSN/PLc=;
	b=KAfS/rNrQT04wNWrbkTKsHH4GjCrGZb/WHqKMz3mqz6l5BrwkVOHlCHiTYoXx0wa22XY
	 B1wCBLpsS6qFpjQXD033aWfeS9QCg9hxAHcP3dtbc8vlX/IuBXc1toMpyWH66BB3XGGQf
	 8YvQ6qbyW0WHnFVYu0JJYCnArwoDOpblvZR1qla3LUuSpTjkyZh7JBjLX4ijOT0EHKwzz
	 TlTAnspxv8uiZ3FEMW+clqSH9X2Az7REpWtubnwN5CY0jpAsAtMNIqlku7USsPV6X80zB
	 QUSPctnOtxZx6I7iDiydhkmatfRLUW4tM3IJWDegqin1aSg3vr4UZbiDd27SIWS3lRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X+L3s53A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E66606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X+L3s53A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFF11F000C9;
	Thu, 19 Nov 2026 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795084193;
	bh=Nx/LxkVaglxlKnpLdpBhFIM526PrStsU8QuvvSN/PLc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X+L3s53AsIjuIOcfTWwSVh63Rp/BuujFgSTMFeSd+hpaHckF9Y3qYfo1I7P+Ros/d
	 1K9P4UwpUORNfPJAxNgR8iqiZwpVMG0RLGnJ7W+a8KJ8J2xlxY9UvDrdHGJL4vJ2G3
	 JFr95K/tvJ72X16DtCyZiGXoQTWZbGhTWdDa9IyvZxXF3Bv2zuA6iiWj4aDr8/btEa
	 krsHQ+pW3dUnGO5yVkoBIqamm+aLO5kqvD1++rk0kLYhl1I2cW6VmnPiR38/q0tTMD
	 7jTxacjfSGsMm3HEcg5m55BL6YKDP9WteGf8BO5G44VGkOcQTm5/INlwaeR5Kd0ZcT
	 g5CNPRKkMClig==
Message-ID: <sashiko-outbox-222955@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Huang" <jackyhuang@nvidia.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <dc78c9c1aea306be5a3c4b06a9a85969b2ee6913.1795081735.git.jackyhuang@nvidia.com>
References: <cover.1795081735.git.jackyhuang@nvidia.com>
 <dc78c9c1aea306be5a3c4b06a9a85969b2ee6913.1795081735.git.jackyhuang@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:29:53 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] ARM: dts: aspeed: address 0x20 collision across i2c4 sibling
  pca9548 muxes
--

commit 6911a14b6d0cba62b8d23c81ced73b37efb2136f
Author: Jacky Huang <jackyhuang@nvidia.com>

ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC

This commit adds the device tree for the ASPEED AST2600 BMC on the
NVIDIA MGX Vera C2 server reference platform.

Link: https://www.nvidia.com/en-us/data-center/products/mgx/
Link: https://www.nvidia.com/en-us/data-center/vera-cpu/

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts
> new file mode 100644
> index 0000000000000..ecbcff048f5cd
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts

[ ... ]

> +/* MCIO expansion muxes */
> +&i2c4 {
> +	multi-master;
> +
> +	status =3D "okay";
> +
> +	mctp@18 {
> +		compatible =3D "mctp-i2c-controller";
> +		reg =3D <(0x18 | I2C_OWN_SLAVE_ADDRESS)>;
> +	};
> +
> +	i2c-mux@70 {
> +		compatible =3D "nxp,pca9548";
> +		reg =3D <0x70>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		vdd-supply =3D <&standby_power_regulator>;

[ ... ]

> +	i2c-mux@71 {
> +		compatible =3D "nxp,pca9548";
> +		reg =3D <0x71>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		vdd-supply =3D <&standby_power_regulator>;

[ ... ]

> +	i2c-mux@75 {
> +		compatible =3D "nxp,pca9548";
> +		reg =3D <0x75>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		vdd-supply =3D <&standby_power_regulator>;

[ ... ]

> +/* GPU0 GPIO expander */
> +&i2c_mcio_c0_south2 {
> +	/* GPU 0, Expander @0x20 */
> +	gpio@20 {
> +		compatible =3D "nxp,pca6408";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		vcc-supply =3D <&standby_power_regulator>;
> +		gpio-line-names =3D
> +			"GPU0_GLOBAL_WP-O",
> +			"GPU0_OOB_RST_N-O",
> +			"GPU0_OOB_RECOVERY-O",
> +			"GPU0_MCU_RECOVERY_N-O",
> +			"GPU0_MCU_RST_N-O",
> +			"GPU0_MCU_BYPASS_N-O",
> +			"GPU0_SMBUS_FRU_EEPROM_WP-O",
> +			"";
> +	};
> +};
> +
> +/* E1.S backplane GPIO expander (C2) */
> +&i2c_mcio_c0c1_north6 {
> +	/* E1S Backplane, Expander @0x20 */
> +	gpio@20 {
> +		compatible =3D "nxp,pca6408";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		vcc-supply =3D <&standby_power_regulator>;
> +		gpio-line-names =3D
> +			"E1S_MCU_RESET_L-O",
> +			"E1S_MCU_RECOVERY_L-O",
> +			"",
> +			"",
> +			"",
> +			"",
> +			"E1S_LOWER_PERST-O",
> +			"E1S_UPPER_PERST-O";
> +	};
> +};
> +
> +/* GPU1 GPIO expander (C2) */
> +&i2c_mcio_c1_south0 {
> +	/* GPU 1, Expander @0x20 */
> +	gpio@20 {
> +		compatible =3D "nxp,pca6408";
> +		reg =3D <0x20>;

[Severity: High]
Will the three pca6408 expanders at 0x20 collide on i2c4 because
i2c-mux@70, i2c-mux@71 and i2c-mux@75 lack i2c-mux-idle-disconnect?

Without i2c-mux-idle-disconnect, pca954x leaves each switch's last
selected channel connected after a transfer, and selecting a channel on
one switch does not deselect the sibling switches on i2c4.  Once the
three gpio@20 expanders on i2c_mcio_c0_south2, i2c_mcio_c0c1_north6 and
i2c_mcio_c1_south0 have been accessed, all three remain bridged onto
i2c4 at address 0x20 simultaneously, causing bus contention and making
writes to one expander drive the other two as well.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795081735.gi=
t.jackyhuang@nvidia.com?part=3D2
