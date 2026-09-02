Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D873F472762
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346694; cv=none; b=eNHFqknhZVIzThIoZB0K9Bv+1S/6xx1ACzl0AfXC2K69ZOp5Bky2V4th2SIMeHDHnYpm6DTNtjocIqSH2/5iCdRyTGneyFrL6V07N/jqA5kFT1j/d1nDyW789dO5UDSgr6aH9XiUm84VIEoxJfvS63lRtX6u7jVThzKvBTj08qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346694; c=relaxed/simple;
	bh=GRy552bji0PEYmvft1nuR4bxVtyp4KKr+LMKi1OeVTU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nuNk83vanevCKmFUJen9TgRTWvMhgKQVm/jhOI0slEmGFfi3Xa4AkXJgvgKLErNnoFfUaE4U4S8qPHCml/3PX2kYQJVmzeYjulnGL/FSCd/Do5GaxpMV9evjbwCK5Vt8ZhCnM6uQrthXZUvrbO+YwOI6SOkWQKn+PyfiM04VBNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eF/nh0cF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eF/nh0cF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535191F000E9;
	Wed,  2 Sep 2026 10:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788346692;
	bh=kgOQTfIcv86oqAlV8OnMDqUFUFItzBfaN+KFYFEtPnk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eF/nh0cFS8ZqJoTyJdHFJ2TaxoiV9KAwH8guazXr5PSc+taVrIz99aeSZlXdupoYE
	 h6NR1nGQiryiHkwFQxZHbMfGmj4+t+cFb5S+0l9DYvS0AWOlcLxnr2d6YImzdxxoz4
	 CTtkHAHPJPaxLZxNXRHa9eYJJD+1lj9v1R6izBrIb3BjImplU4iL/17NGMZemKR3Nj
	 qgjT1c4i+saVvpTVETO2Op7ODyKNyUA2+Xk9QcbaWjAyt5tCV3lT0RQWP1YS6i1c1v
	 CSF83RknlSf/ghcdETlonYa40jT0aMrHEmdEXW0AmEwT+zqvm/gTwOhbKVncT/Ld4j
	 kuW5CSvqosjew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm: dts: sunplus: add peripheral device nodes to
 sp7021.dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gaylard" <ag@ffroot.co.za>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902104545.67794-2-ag@ffroot.co.za>
References: <20260902104545.67794-1-ag@ffroot.co.za>
 <20260902104545.67794-2-ag@ffroot.co.za>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 10:58:11 +0000
Message-Id: <20260902105812.535191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The Ethernet switch node ('l2sw') specifies multiple clocks and =
a 'clock-names' property, which violate the sunplus,sp7021-emac binding sch=
ema.
- [Medium] The PWM node defines a 'resets' property which is undocumented a=
nd forbidden by the sunplus,sp7021-pwm.yaml binding schema.
- [Medium] The Ethernet controller node ('l2sw') unconditionally omits requ=
ired properties in the .dtsi.
--

commit 7acbbeff4684bdd9972c059005ca817139e446fa
Author: Andrew Gaylard <ag@ffroot.co.za>

arm: dts: sunplus: add peripheral device nodes to sp7021.dtsi

This patch adds device tree nodes for the PWM controller, watchdog, eMMC
controller, and Ethernet switch to the SP7021 device tree include file.

> diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi b/arch/arm/boo=
t/dts/sunplus/sunplus-sp7021.dtsi
> index ae9bbe0320b8d..9bb349a5542a4 100644
> --- a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
> +++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
> @@ -291,6 +291,54 @@ uart4: serial@8780 {
[ ... ]
> +		pwm: pwm@7a00 {
> +			#pwm-cells =3D <2>;
> +			compatible =3D "sunplus,sp7021-pwm";
> +			reg =3D <0x7a00 0x80>;
> +			clocks =3D <&clkc CLK_DISP_PWM>;
> +			resets =3D <&rstc RST_DISP_PWM>;

[Severity: Medium]
Does the sunplus,sp7021-pwm.yaml binding schema support the resets property?

The schema appears to lack a definition for resets and specifies
unevaluatedProperties: false, which causes a schema validation error when
compiling the device tree with dtbs_check.

> +			status =3D "disabled";
> +		};
[ ... ]
> +		l2sw: ethernet@108000 {
> +			compatible =3D "sunplus,sp7021-emac";
> +			reg =3D <0x108000 0x400>;

[Severity: Medium]
Will this node cause dtbs_check validation to fail because it omits several
required properties?

The sunplus,sp7021-emac.yaml schema lists pinctrl-0, pinctrl-names,
ethernet-ports, and mdio as required. Including this include file in a board
device tree without overriding the node to supply these properties triggers
validation errors, as setting status =3D "disabled" does not bypass schema
requirements.

> +			interrupts =3D <66 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clkc CLK_L2SW>, <&clkc PLL_E_25>,
> +				 <&clkc PLL_E_2P5>, <&clkc PLL_E_112P5>;
> +			clock-names =3D "l2sw", "plle_25", "plle_2p5", "plle_112p5";

[Severity: Medium]
Do these properties conflict with the constraints defined in the EMAC YAML
schema?

The sunplus,sp7021-emac.yaml schema explicitly restricts clocks to a
maximum of one item and enforces additionalProperties: false, making the
clock-names property invalid.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902104545.6779=
4-1-ag@ffroot.co.za?part=3D1
