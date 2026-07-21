Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B494372684
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641478; cv=none; b=AIaOUJp6F/zX8/GaCCjN9l+4zTtPr3cqjIpkar0NyoOxHwgcEzXWkgu82VZTElZlBLirk0FWDRPVjt7MhQrJxMeZGuHncAjkypN0Ho6xVJ+bXV+yMK4HFkJZ+6c7lafY/Xwn33aAFrxZJi52L08BSQ/6JPQD7e35VZcJ/PAK5n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641478; c=relaxed/simple;
	bh=g22GYcQfMSnSgPwFJPemjeP90rc3I9ctIKwxRPRyy+A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XB+6JJjFk98M6DnY02cOFS0SnyhwBgVOpKBxbO4QcRl0BcVLIyqzFUQFGOWZ/1TvHYBsLVV9LNW2YZGccuTBE6WJiGz71jUhlcFlEQQJhGyM+p04uifzwF5afJN+LoZO6tV1M+63CiYryNFQIiBgoGCjtc8bqR88AK5cEnc4KeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nsfbpD/V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nsfbpD/V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 205E91F00A3D;
	Tue, 21 Jul 2026 13:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641477;
	bh=DRRCfViTuyU7vxGDaVonDJ4EaAPBYvlfPR51Ot+q168=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nsfbpD/Vgzt/BNHEuGcZEXljZnY5dsyElGrz9OPGy4RZJvXDlF2GrfWLuPbAQ6YTW
	 t8EmHArFAG5ZOzv5/IUN6qumXdO7JbagijCr719jCm7IQmy2PE4AZRb3pXGUysc3Uq
	 72noi9oY7TfMPX+57l4/7A1KANB/lNNh1/3my0CRXHxlBi4oUrqD6/NrOhzEveeGPE
	 z4Et81pwm3FKFDSLN+upvXeiFXsbOBQ0HdrvYpqsb578a1F4whAZXI473c2mPI8UDp
	 W5p70cRzTHhfZBVraDTmawsA6NXQDTMgxiMFrk58TckC52zXeNTfQdVi1pYJHW0kw0
	 zS5pD4+NgEU0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (sheng)
Reply-To: sashiko-reviews@lists.linux.dev
To: code_0002@163.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721133204.902-1-code_0002@163.com>
References: <20260721133204.902-1-code_0002@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 13:44:36 +0000
Message-Id: <20260721134437.205E91F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Medium] Usage of undocumented out-of-tree bindings and non-standard prop=
erties.
- [Medium] The second ktz8866 backlight driver will fail to probe due to a =
shared exclusive GPIO and is orphaned by the display panel.
- [Medium] Redefinition of rmtfs_mem for the modem subsystem despite the mo=
dem being disabled.
- [Low] Invalid magic number used in GPIO specifier flags for the touchscre=
en node.
- [Low] Invalid interrupt trigger type (IRQ_TYPE_NONE) used in the fingerpr=
int node.
- [Low] The vreg_l8b_1p8 regulator is forced always-on for an undocumented =
device.
--

--- Patch [1]: [PATCH] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (she=
ng) ---
commit d0e6714197ea1b708f0af6021943e85e81c2c897
Author: map220v <map220v300@gmail.com>

arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (sheng)

Add device tree for Xiaomi Pad 6S Pro (sheng) based on SM8550.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts b/arch/arm6=
4/boot/dts/qcom/sm8550-xiaomi-sheng.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts

[ ... ]

> +	fingerprint_fpc {
> +		compatible =3D "fpc,fpc1020";
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <40 0>;

[Severity: Low]
Should this interrupt trigger type be explicitly defined as an edge or level
instead of 0 (IRQ_TYPE_NONE)? Hardware interrupt triggers generally need to
be explicitly defined to pass dtbs_check validation.

> +		fpc,gpio_rst =3D <&tlmm 41 GPIO_ACTIVE_HIGH>;
> +		fpc,gpio_irq =3D <&tlmm 40 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Are the fpc,fpc1020 compatible string, along with the fpc,gpio_rst and
fpc,gpio_irq properties, documented in the upstream bindings? Using
undocumented vendor bindings usually triggers dtbs_check validation errors.

[ ... ]

> +		rmtfs_mem: rmtfs-region@ccd00000 {
> +			compatible =3D "qcom,rmtfs-mem";
> +			reg =3D <0x0 0xccd00000 0x0 0x280000>;
> +			no-map;
> +
> +			qcom,client-id =3D <1>;
> +			qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA>;
> +		};

[Severity: Medium]
Since the modem subsystem nodes are explicitly deleted because the SM8550P
lacks a modem DSP, is it necessary to recreate the rmtfs_mem reservation
and assign it to the modem VMID?=20

Could this cause SCM assignment errors on hardware lacking the modem DSP,
or unnecessarily reserve 2.5MB of RAM?

[ ... ]

> +		/* Xiaomi change for Semtech SX9371 */
> +		vreg_l8b_1p8: ldo8 {
> +			regulator-name =3D "vreg_l8b_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};

[Severity: Low]
Is it intentional to force this regulator always-on when there doesn't
appear to be a Semtech SX9371 consumer node defined in the device tree?
Could this circumvent runtime power management for this regulator?

[ ... ]

> +&i2c1 {
> +	status =3D "okay";
> +
> +	backlight: backlight@11 {
> +		compatible =3D "kinetic,ktz8866a";
> +		reg =3D <0x11>;
> +		vin-supply =3D <&vph_pwr>;
> +		enable-gpios =3D <&tlmm 128 GPIO_ACTIVE_HIGH>;

[ ... ]

> +&i2c9 {
> +	status =3D "okay";
> +
> +	nanosic_mcu@4c {
> +		compatible =3D "nanosic,wn8030-sheng";

[Severity: Medium]
Is the nanosic,wn8030-sheng compatible string documented upstream?

[ ... ]

> +&i2c_hub_2 {
> +	status =3D "okay";
> +
> +	backlight@11 {
> +		compatible =3D "kinetic,ktz8866b";
> +		reg =3D <0x11>;
> +		vin-supply =3D <&vph_pwr>;
> +		enable-gpios =3D <&tlmm 128 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Will this second backlight driver fail to probe with -EBUSY since both
instances request the same exclusive GPIO from tlmm?=20

Also, since the display panel node only holds a phandle to the first
backlight, will this second instance remain orphaned and uncontrolled?

[ ... ]

> +&spi4 {
> +	status =3D "okay";
> +
> +	touchscreen@0 {
> +		compatible =3D "novatek,NVT-ts-spi";
> +		reg =3D <0>;
> +
> +		spi-max-frequency =3D <19200000>;
> +		novatek,irq-gpio =3D <&tlmm 25 0x2001>;

[Severity: Low]
Does the GPIO specifier flag 0x2001 contain an undocumented downstream bit?
Standard dt-bindings define GPIO_ACTIVE_LOW as 1, so 0x2000 might cause
validation warnings upstream.

[Severity: Medium]
Are the novatek,NVT-ts-spi compatible and novatek,irq-gpio property
documented upstream?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721133204.902-=
1-code_0002@163.com?part=3D1
