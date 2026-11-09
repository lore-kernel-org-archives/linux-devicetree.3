Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264458;
	b=bLRiiQls9Fji7qKQpDXXaUk0iI+rqLxF3N76crfa5wdCdzq3geQpwWORPQGmUEQ+Nx8U
	 MiobDcQyGwvuRfbZ6xYT9cBsKPXZt7YsDZJTjzQdDD/hPHo623Uwj467B8NvknnMzuRvR
	 EjyV8j0FB4KsUSrxQBY+nraVN8LXqQzOarkQ1w3OqjcFuBrf7KvzwiZ/CdPz6GqwOTulH
	 UG7xOgCIsLlIVkfOAeny/PVa7ZM5TKouFOyKw28K33yZRr2HPxKD+dSJz+WmbmdCaaO/t
	 bR2Pn0C61lUHREFSbRX6zXiZJaODauHaNKz6wbz3MMozJowS+gcpdm0rEf2YoTdusSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264458;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ePwDUiHHMzH+Db44X/dlidd3kv0dT8TmIM1sIlQUe+M=;
	b=y/+vadiATq0wYna+9yVzlRg36z6lxKsfIaOZtYrC3Kc3Qu+KF5OeEBvgo8eSsjRxgLVz
	 40bvMdAqqpJvJyIK0C1/qwKvYOOPekwj3hzYJhQcomLQw0w1eSiOi3lbCcA3JJRPcX69W
	 99Km8jiIv0rfzXXTUYE5opKWRiP9vlWZfbkreF1w39AXmJh1EdCgxgPCO8wW/8q4/pxDn
	 oHkemhNmoKLUqTxdFqBMZTnU5o6N6q2tZDcyPbmWvHuPCW7UwLGFNjcSeyGYmNVyAahO1
	 Y45QYOPT1IIeBZiLZsIoJtapkMzoIU0p+WalaNT1+ye9h1PiaZt5K3Bs5XVzYq1C0xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DGooPSxD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4B2606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 22:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DGooPSxD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFDF1F008A1;
	Mon,  9 Nov 2026 22:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794264457;
	bh=ePwDUiHHMzH+Db44X/dlidd3kv0dT8TmIM1sIlQUe+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DGooPSxDjsWT5j7XXAp/iIB7+yujmltg6LOBJIHymr8511fk+wpnDZ5rBOaTZ1v5T
	 XnLj3plC1Tg3K9V3mD0MnV2zrBzahgh46wObz8xFUHANDI2+Ai/SqHjS3JIssWR2Bd
	 G2CoXkAJAJB81COqZy4UJfZ+awfx3CUr745C2e2oeSVAWeAA1K5Fkp4yGnACsIsZNG
	 t0Zjq15batTNuPBT02cSmRD9Er7bzGtCfOsV768XvSrhYptxXfflVPjBaG9lvIQ4ay
	 5YSAwlc1QIzcD1LIGzLH0qQ8YUF+F0eco5ibnhJEqwTT4NG2U0j+7iiA8DZ3iHEIWQ
	 gcxlosA9xcjrw==
Message-ID: <sashiko-outbox-205769@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: Add sm6115-motorola-common
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109221453.658316-5-val@packett.cool>
References: <20261109221453.658316-1-val@packett.cool>
 <20261109221453.658316-5-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 22:47:37 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] arm64: dts: qcom: undefined vreg_l9a phandle in framebuffer0
  vddio-supply
- [High] arm64: dts: qcom: sm6115-motorola-common: unbound pmi632_lcdb
  panel supplies
- [Medium] arm64: dts: qcom: missing pinctrl-0 on uart3 breaks
  pinctrl_dt_to_map()
- [Low] arm64: dts: qcom: framebuffer@5c000000 has unit address without
  reg property
--

commit 2b899e84d3b2843d96896aa9d295e59ce527c5e2
Author: Val Packett <val@packett.cool>

arm64: dts: qcom: Add sm6115-motorola-common

This commit adds the shared devicetree include for SM6115/SM4250-based
Motorola smartphones, configuring common regulators, storage, connectivity,
buttons, USB Type-C, and display nodes.

> diff --git a/arch/arm64/boot/dts/qcom/sm6115-motorola-common.dtsi b/arch/=
arm64/boot/dts/qcom/sm6115-motorola-common.dtsi
> new file mode 100644
> index 0000000000000..6a5110319bc3d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6115-motorola-common.dtsi
> @@ -0,0 +1,541 @@

[ ... ]

> +	chosen {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@5c000000 {
> +			compatible =3D "simple-framebuffer";
> +			memory-region =3D <&cont_splash_memory>;

[Severity: Low]
Does framebuffer@5c000000 trigger a dtc unit_address_vs_reg warning?  The
node has a unit address in its name, but uses memory-region without a reg
property.  Dropping @5c000000 (along with #address-cells, #size-cells, and
ranges in /chosen) or providing a reg property avoids the warning.

> +			width =3D <720>;
> +			height =3D <1600>;
> +			stride =3D <(720 * 4)>;
> +			format =3D "a8r8g8b8";
> +
> +			clocks =3D <&gcc GCC_DISP_AHB_CLK>,
> +				 <&gcc GCC_DISP_HF_AXI_CLK>;
> +			vddio-supply =3D <&vreg_l9a>;
> +		};
> +	};

[Severity: High]
Should vddio-supply reference &pm6125_l9a instead of &vreg_l9a?  No
vreg_l9a label exists in this file or the included dtsi files (LDO9 is
defined below as pm6125_l9a: l9), so dtc fails to build any board DTB that
includes sm6115-motorola-common.dtsi.

[ ... ]

> +&mdss {
> +	status =3D "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply =3D <&pm6125_l18a>;
> +
> +	pinctrl-0 =3D <&mdss_dsi_active &mdss_te_active_sleep>;
> +	pinctrl-1 =3D <&mdss_dsi_sleep &mdss_te_active_sleep>;
> +	pinctrl-names =3D "default", "sleep";
> +
> +	status =3D "okay";
> +
> +	panel: panel@0 {
> +		reg =3D <0>;
> +
> +		avdd-supply =3D <&pmi632_lcdb_ldo>;
> +		avee-supply =3D <&pmi632_lcdb_ncp>;
> +
> +		status =3D "disabled";

[Severity: High]
Will wiring avdd-supply and avee-supply to &pmi632_lcdb_ldo and
&pmi632_lcdb_ncp cause panel@0 to defer probe forever?

pmi632_lcdb (added in commit "arm64: dts: qcom: pmi632: Add LCDB regulator
node" with compatible "qcom,pmi632-lcdb", "qcom,pm8150l-lcdb") has no
driver in the kernel tree.  When a board enables &panel and &pmi632_lcdb
(as in commit "arm64: dts: qcom: sm6115: Add Motorola Moto G9 Play
(guamp)"), both fw_devlink and devm_regulator_get() return -EPROBE_DEFER
permanently because the supplier node exists but never registers a
regulator_dev.  Meanwhile, mdss_probe() -> msm_mdss_init() ->
msm_mdss_reset() tears down the bootloader simple-framebuffer splash, and
because the DSI panel never attaches, the msm_drm component master never
binds either the display or the Adreno GPU component.

Additionally, enabling &mdss, &mdss_dsi0, and &mdss_dsi0_phy unconditionally
in this common dtsi breaks boards that disable &dispcc to keep
simple-framebuffer working (such as commit "arm64: dts: qcom: sm6115: Add
Motorola Moto G9 Power (cebu)"), since &mdss cannot attach its disabled
&dispcc MDSS_GDSC power domain and prevents the Adreno GPU from binding.

[ ... ]

> +&uart3 {
> +	status =3D "okay";
> +
> +	interrupts-extended =3D <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> +				<&tlmm 11 IRQ_TYPE_EDGE_FALLING>;
> +
> +	pinctrl-names =3D "default", "sleep";
> +	pinctrl-1 =3D <&qup_uart3_sleep>;

[Severity: Medium]
Does &uart3 fail to bind its pin states because pinctrl-0 is missing?

Neither this node nor the base uart3 node in sm6115.dtsi defines pinctrl-0.
When uart3 probes, pinctrl_dt_to_map() checks state 0 first and aborts with
-ENODEV when pinctrl-0 is absent, so neither the active qup3 pinmux nor
qup_uart3_sleep is applied.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109221453.6583=
16-1-val@packett.cool?part=3D4
