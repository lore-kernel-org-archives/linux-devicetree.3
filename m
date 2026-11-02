Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638805;
	b=HZLn/LOK2tqrzNptw54pbTOJOk21hN1hmEZ5wjaDeflh6O9ulXfp2vDt1e5+vtODO99r
	 +mkw55Wdyn38W4if/IqaTpjiSG3tcXfrYvZFgivZ1SmhK5v9WsadIIovbuMjDzwbuhzx+
	 kfGeMWOSZx+s5564f3zMKsRRpB5O3974YikC1/ZJglLyVm7uBUY6UAHpI5FrGbLZ4YwAB
	 6AUDwaxE8YZBLLBg7bWJD7iS6ODP0c/lRnb3vwtiNUFWI0u8dLm00mQi9h6VVtqOA7Dvv
	 SsY/DsDVKcVg1MrwxC00XhKiDwwgOT785xd0YLk4HpCnFB+VuTlov1Lv8mPFmbtiNqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638805;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ll34wH9DV7WHiH0GgXFQJxf0ZMlRgrgif8Ri267VGdQ=;
	b=altxVYWMHNCT6SQ78H7fxrF76b1S8cdBMBl6KOGhochkd6/i15ltOkGOHp/OUOU14DgE
	 VH8JSaVNbDttbIRTOvU9QfmVTidnanpbJeHrlCoES7BJm8zQfy0hjGI+mNX/4OIZCCSn9
	 LbzgIfsHbF2X+AKNurI9/+F8lcMA+D/4ijW2vZf8Clp8YocBdxk8VjGAqhG12js+JzUZZ
	 vqa0909fC2syqVslIcHaRpquNJsNzZrOe1cc7pfFOHnr9uBICU6hWzHiAgVIOq2kcGsVY
	 XHrUEdYyBgMKV1B9dyM8/2UNT4zi18n0ebUeKgXC+QOpFk9zuQ7Ydvx10n4BTxwteAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TtPR94DH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3740360752A8
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TtPR94DH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51231F00A16;
	Mon,  2 Nov 2026 17:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793638805;
	bh=ll34wH9DV7WHiH0GgXFQJxf0ZMlRgrgif8Ri267VGdQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TtPR94DHhtxihrl9cbW/gKtK8TS4U7njJ7lD27oKaCwWUkeLnXcTdCbG0R1L8ZPKn
	 uCCBiLth6LLPe+RiuGO8VTZeNxb1O8GNPcMZF33gX2WZeGwJjL70eROq6+PdALrWE0
	 ZW2VvFggi0ohvxVN3mrqmJ5Z0euG7BQuDL586N4xlusbvRGgc95YWFcmqqzFZGMFIE
	 KbG142pKWHVKMJ0eC7JnrlbKwXEtd5H3foOYIs4j4KAwAXqF//0gkwluOKIgNxiLEZ
	 DJjMAB5Egap/Lp4E/s7D7v80vh6rtW8ADKgtvbUKjvJbjPMOLskzr1tAo6aD9e2BoA
	 hzipPp3Vcbcwg==
Message-ID: <sashiko-outbox-193791@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add P1 PMIC regulator tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sandie Cao" <sandie.cao@deepcomputing.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102060105.100645-1-sandie.cao@deepcomputing.io>
References: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
 <20261102060105.100645-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 17:00:04 +0000
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
- [High] riscv: dts: spacemit: missing regulator-always-on on dldo4 in fml1=
3v05
- [Low] riscv: dts: spacemit: unused reg_aux_vcc3v3 regulator node in fml13=
v05
--

commit 4ce9192349ccaa9cafe27a0ab82d02be78ea635e
Author: Sandie Cao <sandie.cao@deepcomputing.io>

riscv: dts: spacemit: k3-deepcomputing-fml13v05: add P1 PMIC regulator tree

This commit adds the P1 PMIC node and regulator topology to the
DeepComputing FML13V05 board device tree.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b=
/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> index b5d5112de3581..804abc85602ab 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -22,6 +22,161 @@ memory@100000000 {
>  		device_type =3D "memory";
>  		reg =3D <0x1 0x00000000 0x4 0x00000000>;
>  	};
> +
> +	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "AUX_VCC3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_aux_vcc5v: regulator-aux-vcc5v {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "AUX_VCC5V";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&i2c8 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c8_cfg>;
> +	status =3D "okay";
> +
> +	p1@41 {
> +		compatible =3D "spacemit,p1";
> +		reg =3D <0x41>;
> +		interrupts =3D <64 IRQ_TYPE_LEVEL_HIGH>;
> +		vin1-supply =3D <&reg_aux_vcc5v>;
> +		vin2-supply =3D <&reg_aux_vcc5v>;
> +		vin3-supply =3D <&reg_aux_vcc5v>;
> +		vin4-supply =3D <&reg_aux_vcc5v>;
> +		vin5-supply =3D <&reg_aux_vcc5v>;
> +		vin6-supply =3D <&reg_aux_vcc5v>;
> +		aldoin-supply =3D <&reg_aux_vcc5v>;
> +		dldoin1-supply =3D <&buck4>;
> +		dldoin2-supply =3D <&buck4>;

[Severity: Low]
Is reg_aux_vcc3v3 needed in this patch?

In p1@41, vin1-supply through vin6-supply and aldoin-supply all reference
reg_aux_vcc5v, while dldoin1-supply and dldoin2-supply reference buck4.
The reg_aux_vcc3v3 fixed regulator node has no GPIO control and no
consumers in k3-deepcomputing-fml13v05.dts, including after the subsequent
USB and SD card patches in the series (where hub@1 uses compatible
usb5e3,608, which forbids vdd-supply in
Documentation/devicetree/bindings/usb/genesys,gl850g.yaml, and sdhci0 only
references aldo1).

[ ... ]

> +			dldo3: dldo3 {
> +				regulator-min-microvolt =3D <800000>;
> +				regulator-max-microvolt =3D <800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			dldo4: dldo4 {
> +				regulator-min-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-boot-on;
> +			};

[Severity: High]
Should dldo4 also have regulator-always-on?

When p1_regulator_probe() registers dldo4 with regulator-boot-on and
without regulator-always-on, of_get_regulation_constraints() sets
constraints->boot_on =3D true, constraints->always_on =3D false, and sets
REGULATOR_CHANGE_STATUS in constraints->valid_ops_mask. During
set_machine_constraints(), _regulator_do_enable(rdev) enables dldo4 in
hardware, while rdev->use_count stays at 0 because no node in k3.dtsi or
k3-deepcomputing-fml13v05.dts references &dldo4 as a supply.

Thirty seconds after late_initcall_sync(regulator_init_complete),
regulator_init_complete_work_function() calls regulator_late_cleanup() in
drivers/regulator/core.c:

	if (c && c->always_on)
		return 0;

	if (!regulator_ops_is_valid(rdev, REGULATOR_CHANGE_STATUS))
		return 0;

	regulator_lock(rdev);

	if (rdev->use_count)
		goto unlock;

	/* If reading the status failed, assume that it's off. */
	if (_regulator_is_enabled(rdev) <=3D 0)
		goto unlock;

	if (have_full_constraints()) {
		/* We log since this may kill the system if it goes
		 * wrong.
		 */
		rdev_info(rdev, "disabling\n");
		ret =3D _regulator_do_disable(rdev);

This disables the 1.8V dldo4 rail at boot. All other fixed boot-on LDO
rails in p1@41 (aldo1, aldo2, aldo4, dldo1..dldo3, dldo5..dldo7), as well
as dldo4 in arch/riscv/boot/dts/spacemit/k3-com260.dtsi (fixed in commit
f314c98807c1 ("riscv: dts: spacemit: k3-com260: keep dldo4 enabled") to
prevent a CPU hard-lockup), specify regulator-always-on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102060012.1006=
23-1-sandie.cao@deepcomputing.io?part=3D1
