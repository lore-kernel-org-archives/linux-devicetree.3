Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322BD39FCE
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798765; cv=none; b=px9opiDyuEWTNGE9vpYdv83JtBijtrj+1KWdRYIeM+YfyB9gppVTxk+oMMto8k1xR6MFBklXAnLB2xoBgejaANmjVYCYdVrwBu7klcxyZU8uD2zKCa5/UGDdI320ONF/Dq2qloF0lzxCmi0vmbWak8oHGSgfKIcui0biZjmc+W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798765; c=relaxed/simple;
	bh=FPBVvhqLmfUrR88fb1vCikVjhNuqZ1705wlQyRwr3Pw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GCShT6iROjsoJBmL3kTqRFM3hn/73ixaxn44TwgWcbdRy6R1uCTfTh+l3HN9E6GhcQ0ffoQAvUg05cEBBxH2CxZdye8E5ojUKfcYTK9sjtH+oE47CXzldb1j8J+/2F/bnsEmeo7rXzlCvNXYqCNMpM/86iK336zJYNO6U4UjKqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJ98V74C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJ98V74C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8444B1F000E9;
	Thu, 23 Jul 2026 09:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784798763;
	bh=buPUpRWTXrfxQbOsXO2z5kqRNOzhxoIhLf2XWxs0t4o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HJ98V74CqYJ0Agwx25KXQgADauEfmsnUs8waSs1a+LKqt9vq/dowsExZfQrh6s1jP
	 eZcINhtbtvvalfV9f9KLDSOf46kC8hPc60s/H75Zmgp03OghTEYeH0JZ580OZI4RWx
	 zBLAA0MayqclNqmrrZL6UUzdhFQsUbzYcD1riiuiNPeTDH3PfaBBv5Diwft+ln+CT5
	 rCgJFchKcGgw7u8Sqb4GdjENZzRztgziEebWUNMRYtOIPMdWKX1S1Vy0+QKaV//Kl0
	 4gnpBrui8hMbGrMqRgh9whfl2aBIMEC+HyIe6WHdnniOckXdN7FFdE3/NefL/miYrK
	 RlOxdSxyMNDdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: ipq5210: Add nodes for
 multiple peripherals
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723-08-dts-v3-1-074eb131f382@oss.qualcomm.com>
References: <20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com>
 <20260723-08-dts-v3-1-074eb131f382@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 09:26:02 +0000
Message-Id: <20260723092603.8444B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing `#interconnect-cells` property in the `gcc` clock controll=
er node.
- [High] TSENS thermal sensor interrupt is incorrectly configured as edge-t=
riggered.
- [High] Missing fallback compatible string for `pcie0_phy`.
- [Low] Missing `<dt-bindings/thermal/thermal.h>` include for `THERMAL_NO_L=
IMIT` macro.
- [Low] Included interconnect bindings header file does not exist.
--

--- Patch [1]: [PATCH v3 1/3] arm64: dts: qcom: ipq5210: Add nodes for mult=
iple peripherals ---
commit b50b502c781c4dc3d469ed6c9eaf41d79df96251
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals

This commit describes common IPQ5210 SoC peripherals in the base DTSI so bo=
ard
DTS files can enable the hardware they use. It adds nodes for USB, PCIe, QP=
IC
NAND/BAM, QFPROM, TSENS, and thermal zones, as well as the CPU OPP table and
CPU cooling cells.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 2cdc10529c489..18e4a1dfa2682 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -4,7 +4,9 @@
>   */
> =20
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,apss-ipq.h>
>  #include <dt-bindings/clock/qcom,ipq5210-gcc.h>
> +#include <dt-bindings/interconnect/qcom,ipq5210.h>

[Severity: Low]
Does this dt-bindings interconnect header exist yet?

Including a non-existent header will cause a preprocessor fatal error during
the device tree build.

[ ... ]

> +		pcie0_phy: phy@84000 {
> +			compatible =3D "qcom,ipq5210-qmp-gen3x1-pcie-phy";

[Severity: High]
Is this missing a fallback compatible string?

Unlike pcie1_phy and the USB PHYs in this patch, pcie0_phy only lists the n=
ew
compatible string. Without a known fallback string, such as
"qcom,ipq9574-qmp-gen3x1-pcie-phy", will the existing QMP PCIe PHY driver f=
ail
to bind and permanently break the PCIe0 subsystem?

[ ... ]

> +		tsens: thermal-sensor@4a9000 {
> +			compatible =3D "qcom,ipq5210-tsens", "qcom,ipq5332-tsens";
> +			reg =3D <0x0 0x004a9000 0x0 0x1000>,
> +			      <0x0 0x004a8000 0x0 0x1000>;
[ ... ]
> +			interrupts =3D <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names =3D "combined";

[Severity: High]
Should this TSENS interrupt be configured as level-sensitive instead of
edge-triggered?

TSENS hardware typically emits active-high level-sensitive interrupts for
thermal thresholds. If configured as IRQ_TYPE_EDGE_RISING, a second thermal
threshold crossed while the interrupt line is already asserted will not
generate a new rising edge.=20

This could cause the interrupt controller to miss the event, silently break=
ing
thermal throttling and potentially causing hardware damage.

[ ... ]

> @@ -146,8 +358,8 @@ gcc: clock-controller@1800000 {
>  			reg =3D <0x0 0x01800000 0x0 0x40000>;
>  			clocks =3D <&xo_board>,
>  				 <&sleep_clk>,
> -				 <0>,
> -				 <0>,
> +				 <&pcie0_phy>,
> +				 <&pcie1_phy>,
>  				 <0>,
>  				 <0>;

[Severity: High]
Since the gcc node acts as an interconnect provider for the new pcie0 and p=
cie1
nodes, does it need an #interconnect-cells =3D <1>; property?

Without the #interconnect-cells property in the provider node, calls to
of_interconnect_get() from the PCIe drivers will fail with -EINVAL, causing
driver probe failures for all consumers.

[ ... ]

> +		cpu0-thermal {
> +			thermal-sensors =3D <&tsens 14>;
[ ... ]
> +			cooling-maps {
> +				map0 {
> +					trip =3D <&cpu0_thermal_alert>;
> +					/* Set maximum frequency as 816 MHz */
> +					cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,

[Severity: Low]
Can this cause a syntax error during the device tree compilation?

This line relies on THERMAL_NO_LIMIT being defined, but the required
<dt-bindings/thermal/thermal.h> header was not included in this file. The C
preprocessor will not expand the macro, leaving it as a string token, which
causes a dtc syntax error when evaluating the integer expressions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-08-dts-v3-=
0-074eb131f382@oss.qualcomm.com?part=3D1
