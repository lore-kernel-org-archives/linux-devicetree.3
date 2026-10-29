Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250837;
	b=pxgHhWsxtLyYp2yx63omfWwH0eceEzfomMLh9ZPVovUDjY/3sM6wj5vPxKeJd1qAUCIP
	 GPdFS9nYOPxLR/o/AnRvtaEiJadTwDtB9+j3ywZa9lcuB/ogTWXKDb+mSZIQZm7VoeHU3
	 xQQUqqrWRIuPNrpTvJkP0NXmisLzkLnrAdcfAh/OERvobX4oH8V9EbWCj4baHIywa7qre
	 wQq6RcvlyrhpVxnfeV5t1xwI6LmttAaljBEGL4GdT3d3je+CWeD64K7OYMj8JoKxfbp58
	 DzfsNdUmhTkjcIT/2Z2JtLrIMM5xwAG3diZCOICx5b/zhQhiU4jxWDYE1eenursdJ2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250837;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=r7Yq/cyeGDHkqedXI7pjcS3z2MC3ikKBjzXtb939PF8=;
	b=Qepk4s8vCt9qPvkc/XlvIgTIX/LRbdWbJ5AKhbk6sB/sdfFk1gHB6UPU8n7LUq80zULU
	 qfnpd3r+Rzd4V0F6Me+ySug9hHFWy4ojf1sih+FjDwYuHgAZH5qm6yp4RyxqIJdwyVYUw
	 kyKtjDFPNLEuhuCLyzBGL3Hzt7nzJyO1uNxFlxWiqCeXcK4XWNxiSEzQ4xvPDVmz5boqE
	 lFDEi+AGLeTyYEMxlmZc9TW7GdfrWdYOi9ME3hyrhUWLVriwNwQSMcpjSALHiFB7AA3iv
	 ZnJhup1jLwCBmggXUUKfzGrzr3SL2kwDkrwo4/lk5u049/8qUHHZf9fY/4b4CUf9LrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UaU0wgEV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21067606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 05:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UaU0wgEV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BA61F01825;
	Thu, 29 Oct 2026 05:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793250836;
	bh=r7Yq/cyeGDHkqedXI7pjcS3z2MC3ikKBjzXtb939PF8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UaU0wgEV1GFiLZh9OZOH5Xvv8LBltRBfRMbDMdzHXCpZuQuFnWsOGvaVAw0RFn/Gu
	 9Tuu6DT4lEY7aOh5RSFEsqYsf/eXdaRD0tWy7u/aMqmsDLeOWK/uLtCIPzZSXfMWts
	 8oh/zuAJIa/sKMn0usmshQsOL8+3DgROsgLwmGR8iYX4coBz6yR8se8KeRMzzOgfdR
	 KrMxBxc6S0hwDF/oNjA6dCX8FbZWMUQ9i5+6U2tef7kNxI7jeFj3uOpeudWFA9PHpE
	 e/i5mOTu1KaMz7Xy+gyaBCnqlFMRVLhYQ0OU1V2anbzPHJm8mkDKoRIl0LeDO+KNzs
	 2Kh5hvC8rZWsQ==
Message-ID: <sashiko-outbox-188742@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Huang" <jackyhuang@nvidia.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <0d221cbd11c8b582d43b21e4156dfb7c83b121b3.1793243187.git.jackyhuang@nvidia.com>
References: <cover.1793243187.git.jackyhuang@nvidia.com>
 <0d221cbd11c8b582d43b21e4156dfb7c83b121b3.1793243187.git.jackyhuang@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 05:13:56 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ARM: dts: aspeed: vr-c2: missing i2c-mux-idle-disconnect on i2c4 m=
uxes
- [Medium] ARM: dts: aspeed: duplicate gpio-line-names in vr-c2-bmc
--

commit a1ef1efffcf5e5e21a0a7edd3526a31cbe156f2d
Author: Jacky Huang <jackyhuang@nvidia.com>

ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC

This commit adds the device tree for the NVIDIA MGX Vera C2 BMC platform
based on the ASPEED AST2600 SoC.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts
> new file mode 100644
> index 0000000000000..7e8ae8afea088
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts
> @@ -0,0 +1,1321 @@

[ ... ]

> +&gpio0 {
> +	gpio-line-names =3D

[ ... ]

> +	/*V0-V7*/
> +	"AP_EROT_REQ-O",
> +	"EROT_AP_GNT-I",
> +	"",
> +	"",
> +	"PCB_TEMP_ALERT-I",
> +	"", "", "",

[ ... ]

> +};
> +
> +&gpio1 {
> +	gpio-line-names =3D
> +	/*A0-A7*/
> +	"", "", "", "", "", "", "", "",
> +
> +	/*B0-B7*/
> +	"", "", "", "",
> +	"AP_EROT_REQ-O",
> +	"EROT_AP_GNT-I",
> +	"IO_EXPANDER_INT_L-I",
> +	"",
> +
> +	/*C0-C7*/
> +	"", "", "", "", "", "", "", "",
> +
> +	/*D0-D7*/
> +	"", "", "", "", "", "", "",
> +	"I2C_SSIF_ALERT_L-I",
> +
> +	/*E0-E7*/
> +	"", "", "", "", "", "", "", "";
> +};

[Severity: Medium]
Are "AP_EROT_REQ-O" and "EROT_AP_GNT-I" intentionally defined on both &gpio0
(pins V0-V1) and &gpio1 (pins B4-B5)?

Because both AST2600 GPIO controllers are active at the same time and &gpio0
probes before &gpio1, name-based GPIO lookups via gpio_name_to_desc() or
libgpiod will always resolve to &gpio0 and shadow the lines on &gpio1.

Similarly, further down in this file, the pca6408@20 expanders on
&i2c_mcio_c0_south0 and &i2c_mcio_c1_south0 define identical "GPU1_*"
gpio-line-names, and the pca6408@20 expanders on &i2c_mcio_c0c1_north3 and
&i2c_mcio_c0c1_north6 define identical "E1S_*" gpio-line-names. Should those
line names be disambiguated (for example with C1/C2 prefixes) so that
consumers can address both instances by name?

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

> +	};
> +
> +	i2c-mux@71 {
> +		compatible =3D "nxp,pca9548";
> +		reg =3D <0x71>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		vdd-supply =3D <&standby_power_regulator>;

[ ... ]

> +	};
> +
> +	i2c-mux@75 {
> +		compatible =3D "nxp,pca9548";
> +		reg =3D <0x75>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		vdd-supply =3D <&standby_power_regulator>;

[ ... ]

> +	};
> +};

[ ... ]

> +/* GPU1 GPIO expander (C1) */
> +&i2c_mcio_c0_south0 {
> +	/* GPU 1, Expander @0x20 */
> +	pca6408@20 {
> +		compatible =3D "nxp,pca6408";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		vcc-supply =3D <&standby_power_regulator>;
> +		gpio-line-names =3D
> +		"GPU1_GLOBAL_WP-O",
> +		"GPU1_OOB_RST_N-O",
> +		"GPU1_OOB_RECOVERY-O",
> +		"GPU1_MCU_RECOVERY_N-O",
> +		"GPU1_MCU_RST_N-O",
> +		"GPU1_MCU_BYPASS_N-O",
> +		"GPU1_SMBUS_FRU_EEPROM_WP-O",
> +		"";
> +	};
> +};
> +
> +/* GPU0 GPIO expander */
> +&i2c_mcio_c0_south2 {
> +	/* GPU 0, Expander @0x20 */
> +	pca6408@20 {
> +		compatible =3D "nxp,pca6408";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		vcc-supply =3D <&standby_power_regulator>;
> +		gpio-line-names =3D
> +		"GPU0_GLOBAL_WP-O",
> +		"GPU0_OOB_RST_N-O",
> +		"GPU0_OOB_RECOVERY-O",
> +		"GPU0_MCU_RECOVERY_N-O",
> +		"GPU0_MCU_RST_N-O",
> +		"GPU0_MCU_BYPASS_N-O",
> +		"GPU0_SMBUS_FRU_EEPROM_WP-O",
> +		"";
> +	};
> +};
> +
> +/* E1.S backplane GPIO expander (C1) */
> +&i2c_mcio_c0c1_north3 {
> +	/* E1S Backplane, Expander @0x20 */
> +	pca6408@20 {
> +		compatible =3D "nxp,pca6408";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		vcc-supply =3D <&standby_power_regulator>;
> +		gpio-line-names =3D
> +		"E1S_MCU_RESET_L-O",
> +		"E1S_MCU_RECOVERY_L-O",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"E1S_LOWER_PERST-O",
> +		"E1S_UPPER_PERST-O";
> +	};
> +};
> +
> +/* E1.S backplane GPIO expander (C2) */
> +&i2c_mcio_c0c1_north6 {
> +	/* E1S Backplane, Expander @0x20 */
> +	pca6408@20 {
> +		compatible =3D "nxp,pca6408";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		vcc-supply =3D <&standby_power_regulator>;
> +		gpio-line-names =3D
> +		"E1S_MCU_RESET_L-O",
> +		"E1S_MCU_RECOVERY_L-O",
> +		"",
> +		"",
> +		"",
> +		"",
> +		"E1S_LOWER_PERST-O",
> +		"E1S_UPPER_PERST-O";
> +	};
> +};
> +
> +/* GPU1 GPIO expander (C2) */
> +&i2c_mcio_c1_south0 {
> +	/* GPU 1, Expander @0x20 */
> +	pca6408@20 {
> +		compatible =3D "nxp,pca6408";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		vcc-supply =3D <&standby_power_regulator>;
> +		gpio-line-names =3D
> +		"GPU1_GLOBAL_WP-O",
> +		"GPU1_OOB_RST_N-O",
> +		"GPU1_OOB_RECOVERY-O",
> +		"GPU1_MCU_RECOVERY_N-O",
> +		"GPU1_MCU_RST_N-O",
> +		"GPU1_MCU_BYPASS_N-O",
> +		"GPU1_SMBUS_FRU_EEPROM_WP-O",
> +		"";
> +	};
> +};

[Severity: High]
Should i2c-mux@70, i2c-mux@71, and i2c-mux@75 on &i2c4 include the
i2c-mux-idle-disconnect property (like the pca9546 muxes on &i2c6 and &i2c9=
)?

In pca954x_probe() and pca954x_deselect_mux(), when neither idle-state nor
i2c-mux-idle-disconnect is specified, data->idle_state defaults to
MUX_IDLE_AS_IS and each PCA9548 leaves its last selected downstream channel
connected to &i2c4 after transfers complete.

Because five pca6408@20 GPIO expanders sit behind these three switches on
&i2c4 (&i2c_mcio_c0_south0, &i2c_mcio_c0_south2, &i2c_mcio_c0c1_north3,
&i2c_mcio_c0c1_north6, and &i2c_mcio_c1_south0) at the same slave address
0x20, leaving channels connected across the three switches bridges multiple
pca6408@20 devices onto &i2c4 simultaneously. Wouldn't this cause I2C addre=
ss
contention at 0x20, false-positive probing of unpopulated C1/C2 expanders,
and cross-writes to the wrong GPU or E1.S reset/recovery/PERST GPIOs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793243187.gi=
t.jackyhuang@nvidia.com?part=3D2
