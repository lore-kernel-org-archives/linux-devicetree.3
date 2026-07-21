Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6521F3769E8
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646103; cv=none; b=b8eI7rhp86HTCNTNAHN+zewn+WVciucwcTARMXyI5RpCSjSqTQubrMYcDqdGUrqaKDV06cyDH+Ie/6CZGJj/iG4OVypPHJOQaAay5bIXIZiOcWa2zgy4M9V/oGz3Xdhgvs4lZhgxOAj/pBFlNVeL+C/zcmLjEyhnFNjSbLl0W8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646103; c=relaxed/simple;
	bh=wz1DgpZKQWSWU2wjJDkHGbGFLfjWdV/o3+yViWp0JDE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pCFUb3kuL6epaqdQtHFEiskkf78PvutVd6gPE6DnclSMB+iaTBJ/q1Kp+spJxNuKAOFG5av9bXcNk4jYX/jesPf6HQYUWvwwOlBkPzSqIS4BXJQCGyJuBeGki8CWAq1Gk11tsWrHcODgPy6T4sGxBlinvic37oBqa/tM4rGUe8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwcBuH6F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwcBuH6F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68E91F000E9;
	Tue, 21 Jul 2026 15:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784646102;
	bh=x5c3JzqlnVrdGmSd9fKJswBq+TK/xIq/RkNkEbcsYsM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mwcBuH6F4gsXuBseQunS2OM3y1hiCTtjeuA7BW0Q647ywPoBq/LHWWBfR2HaS96+9
	 icBM4VEV6B8lv8LCOkx7zFoOT354RbbzfWh/ZkrfGung08HWJdCycwZKjQiDd3KLM1
	 S1LqEmvcQmBbb9pWffZiimeUSxBclYwnlsQpmUd4rvbsmO4XLJKIvIjwVkuAm5L7pC
	 lB4XiwVPY/s03Fs/rbm3yO5ZSU2Xcod5NMO7c/NRJiJZeT092ju117pg9mgXG6Nrp6
	 YM6Rct7uLaXAd7v+3JYc4hZ2LOC2tV93T9+McThnZMeZz9bzPnlWEop4pow2PQ42Pj
	 ZdEW+kLhq1QPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro
 (sheng)
Reply-To: sashiko-reviews@lists.linux.dev
To: code_0002@163.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260721144557.1455-1-code_0002@163.com>
References: <20260721133204.902-1-code_0002@163.com>
 <20260721144557.1455-1-code_0002@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 15:01:41 +0000
Message-Id: <20260721150141.C68E91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing `assigned-clocks` property in `mdss_dsi1` causes `assigned=
-clock-parents` to be silently ignored.
- [High] The device tree hardcodes a specific Bluetooth MAC address, leakin=
g the author's device MAC and causing network collisions for all users.
- [Medium] Introduction of downstream-specific, undocumented bindings and s=
tructurally invalid node placement.
- [Medium] The patch retains `output-high` in the `i2s1_default` pinctrl st=
ate despite the commit message claiming its removal.
--

--- Patch [1]: [PATCH v3] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (=
sheng) ---
commit a32cafba2cc54395e026266ce89446c6ffa392e4
Author: map220v <map220v300@gmail.com>

arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (sheng)
   =20
Add device tree for Xiaomi Pad 6S Pro (sheng) based on SM8550.

> ---
> v3: address review comments from Konrad Dybcio
> - SM8550P has no modem; confirmed on device (dmesg shows no mpss)
> - Rename fingerprint_fpc -> fingerprint-reader, use interrupts-extended
> - pmic-glink compatibles: one per line
> - Sort DAI link subnodes alphabetically (codec before cpu)
> - Reorder root-level nodes by name
> - Place pinctrl-n properties before pinctrl-names
> - Remove msm-id, board-id, Xiaomi-specific comments
> - Remove output-low/output-high from TLMM pinctrl

[Severity: Medium]
Is this description accurate? The output-high property is still present in
the i2s1_default pinctrl state below.

> - Remove udmabuf bootargs (confirmed not in use on device)
> - Add "xiaomi-" prefix to firmware paths
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../boot/dts/qcom/sm8550-xiaomi-sheng.dts     | 1763 +++++++++++++++++
>  2 files changed, 1764 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts

[ ... ]

> +	bl_vddpos_5p8: bl-vddpos-regulator {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "bl_vddpos_5p8";
> +		regulator-min-microvolt =3D <5800000>;
> +		regulator-max-microvolt =3D <5800000>;
> +		regulator-enable-ramp-delay =3D <233>;
> +		gpio =3D <&tlmm 30 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	fingerprint-reader {
> +		compatible =3D "fpc,fpc1020";
> +		interrupts-extended =3D <&tlmm 40 IRQ_TYPE_EDGE_RISING>;

[Severity: Medium]
Should this node be placed under its corresponding hardware bus instead of =
at
the root level? Also, does this use an undocumented downstream compatible?

> +		fpc,gpio_rst =3D <&tlmm 41 GPIO_ACTIVE_HIGH>;
> +		fpc,gpio_irq =3D <&tlmm 40 GPIO_ACTIVE_HIGH>;

[ ... ]

> +&mdss_dsi1 {
> +	vdda-supply =3D <&vreg_l3e_1p2>;
> +	qcom,dual-dsi-mode;
> +	qcom,sync-dual-dsi;
> +	/* DSI1 is slave, so use DSI0 clocks */
> +	assigned-clock-parents =3D <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;

[Severity: High]
Will assigned-clock-parents be silently ignored here without an
assigned-clocks property to specify which clocks should receive the new
parents?

> +	status =3D "okay";
> +};

[ ... ]

> +&i2c9 {
> +	status =3D "okay";
> +
> +	nanosic_mcu@4c {
> +		compatible =3D "nanosic,wn8030-sheng";

[Severity: Medium]
Is this an upstream-supported compatible string, or does this use an
undocumented downstream binding?

> +		reg =3D <0x4c>;
> +
> +		pinctrl-0 =3D <&nanosic_mcu_default>;

[ ... ]

> +&spi4 {
> +	status =3D "okay";
> +
> +	touchscreen@0 {
> +		compatible =3D "novatek,NVT-ts-spi";

[Severity: Medium]
Does this use an undocumented downstream compatible for the touchscreen?

> +		reg =3D <0>;
> +
> +		spi-max-frequency =3D <19200000>;

[ ... ]

> +	wcd_default: wcd-reset-n-active-state {
> +		pins =3D "gpio108";
> +		function =3D "gpio";
> +		drive-strength =3D <16>;
> +		bias-disable;
> +	};
> +
> +	i2s1_default: i2s1-default-state {
> +		sck-pins {
> +			pins =3D "gpio121";
> +			function =3D "i2s1_sck";
> +			drive-strength =3D <8>;
> +			bias-disable;
> +			output-high;
> +		};

[Severity: Medium]
Is the output-high property intended here? The commit message mentions this
was removed, and setting an output level on a pin configured for an alterna=
te
function like i2s1_sck might be invalid.

> +
> +		data0-pins {
> +			pins =3D "gpio122";

[ ... ]

> +&uart14 {
> +	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "qcom,wcn7850-bt";
> +
> +		local-bd-address =3D [ 24 00 00 00 5a ad ];

[Severity: High]
Does hardcoding local-bd-address cause all users of this device tree to
broadcast the same Bluetooth MAC address? This could cause network collisio=
ns
if multiple devices are nearby. Should this be zeroed out or removed so the
bootloader can populate it?

> +
> +		vddrfacmn-supply =3D <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply =3D <&vreg_pmu_aon_0p59>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721144557.1455=
-1-code_0002@163.com?part=3D1
