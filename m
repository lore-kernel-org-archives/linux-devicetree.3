Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BBF386C31
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803983; cv=none; b=ROJQ6UTbSlT4lPKOnItAwqAXQLEWIKzIvD3YB4Q02HmeG+dc66km9FHF0kEca7k8Yc74R3SwgJfNpDpMxSr0n5t20ujTO+IMGx4+5ExweUnTe+j9h1I70C09PLbYxtKQRYj1zv1RBhqCu1uVDeQ2cgdlKsbKptZ78D604wseCXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803983; c=relaxed/simple;
	bh=QFOao14LXJtAodilipzjjKx5htSEXbFHWHXZaej3ePw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aGRfskovlmlMIEOCvmG0N0Xxg5c2Qwu8t4yVrriHW/3pjE0w/Lf6kRELbExul17Am7oocdL3yVHUr5jMoXNLg2w3hTfsbNIbE7kJri9Dr1vmgP7mZVturS19er8Skv77KODBH6tSiPjsiyjovLO4XDdpjHeOGgOw/g0vYp3nAt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEPiAZWR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEPiAZWR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDBA1F000E9;
	Thu, 23 Jul 2026 10:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784803977;
	bh=zM4d1YWvSA7LMb5Ojb/5xsA/wpJa1Wp/Xkz/CICY0bY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jEPiAZWRq8vVHmAjkeSId8aI03/oi4AHQ2Rsq8q2zJPyno7XBAJtmUqLRIKpXoIPZ
	 LQIQT7dqERMiLZdEr7mluQjVqP5KpYE7v092Te5xgsrXFv0hWFRefsF4wAN7bbWWhT
	 +zhn1re7bfzcXtxFj/v6SddPYXNhgPBxZ6D2/j9SodGs4Qk/cyzIclHHoENvkY2UTy
	 pSPQ8CurvH3SspA+oCLzaMNhwAqAALtL5eJnsCSBBk7+PifTIBpJz2JwZs4CXBbJLl
	 +YA5LkWEZ/dIgcNuJQ8QDsVlPIHnx6CMMwDb1CTbhPT+eTtlD6oXocrYLF4HPXzjsv
	 T9DmSpirvmHnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: ti: k3-am62l3-evm: Add HDMI support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Swamil Jain" <s-jain1@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723102519.3581762-3-s-jain1@ti.com>
References: <20260723102519.3581762-1-s-jain1@ti.com>
 <20260723102519.3581762-3-s-jain1@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 10:52:55 +0000
Message-Id: <20260723105257.8FDBA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The DSS display output pins (VOUT0) are incorrectly assigned to =
the external HDMI bridge's pinctrl instead of the Display Subsystem (DSS).
- [Medium] The `VOUT0_EXTPCLKIN` pad is incorrectly configured as `PIN_OUTP=
UT`.
- [Medium] The HDMI bridge configuration lacks critical physical state cont=
rols (reset GPIO and FET routing switch).
--

--- Patch [2]: [PATCH v3 2/2] arm64: dts: ti: k3-am62l3-evm: Add HDMI suppo=
rt ---
commit a0fd4c63c267b044d2bd1cd9570eb64898918cf9
Author: Devarsh Thakkar <devarsht@ti.com>

arm64: dts: ti: k3-am62l3-evm: Add HDMI support

This patch adds the SII9022 HDMI bridge and HDMI connector nodes, along with
the DPI pinmux configuration connecting VOUT0 to the bridge. It also enables
the DSS and hooks up its DPI output port to the SII9022 bridge input.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/d=
ts/ti/k3-am62l3-evm.dts
> index a1af4571a815d..dd16a73e581ec 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
[ ... ]
> @@ -192,6 +204,38 @@ exp2: gpio@23 {
>  		bootph-all;
>  	};
> =20
> +	sii9022: bridge-hdmi@3b {
> +		compatible =3D "sil,sii9022";
> +		reg =3D <0x3b>;
> +		interrupt-parent =3D <&exp1>;
> +		interrupts =3D <20 IRQ_TYPE_EDGE_FALLING>;
> +		#sound-dai-cells =3D <0>;
> +		sil,i2s-data-lanes =3D < 0 >;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&dpi_pins_default>;

[Severity: Medium]
Should the dpi_pins_default pinctrl be assigned to the &dss node instead of
the sii9022 bridge?

The SoC's display subsystem (DSS) physically drives these output pins. If t=
he
sii9022 bridge unbinds, fails to probe, or suspends independently of the DS=
S,
it will release the DSS's physical output pins. Conversely, if the DSS is
running, it will not have its pins configured unless the bridge is bound.

Also, shouldn't the sii9022 node have a reset-gpios property defined?

The board's IO expander (exp2) explicitly defines "GPIO_HDMI_RSTn" and
"VOUT0_FET_SEL0". Without the reset-gpios property, the driver cannot bring
the bridge out of reset or recover it from a bad state. Additionally, missi=
ng
control for VOUT0_FET_SEL0 could mean the DPI signals physically fail to
route to the HDMI bridge if the bootloader hasn't enabled the FET switch.

> +		bootph-all;
> +
> +		ports {
> +			#address-cells =3D <1>;
[ ... ]
> +			AM62LX_IOPAD(0x00d0, PIN_OUTPUT, 1) /* (P22) GPMC0_BE1n.VOUT0_DATA21 =
*/
> +			AM62LX_IOPAD(0x00d4, PIN_OUTPUT, 1) /* (N23) GPMC0_WAIT0.VOUT0_DATA22=
 */
> +			AM62LX_IOPAD(0x00d8, PIN_OUTPUT, 1) /* (N22) GPMC0_WAIT1.VOUT0_DATA23=
 */
> +			AM62LX_IOPAD(0x00ec, PIN_OUTPUT, 5) /* (M23) GPMC0_CSn2.VOUT0_EXTPCLK=
IN */

[Severity: Medium]
Is it intentional to configure VOUT0_EXTPCLKIN as PIN_OUTPUT?

Configuring an input pin as an output disables its receiver and actively
drives it. Since the sii9022 HDMI bridge receives the pixel clock from the
SoC (VOUT0_PCLK) and does not supply one, this pin appears to be unused for
this display pipeline and could probably be removed, or configured as
PIN_INPUT if genuinely needed.

> +		>;
> +		bootph-all;
> +	};
> +
[ ... ]
> +&dss {
> +	status =3D "okay";
> +	bootph-all;
> +};

[Severity: Medium]
As mentioned above, should this &dss node claim the pinctrl-0 assignment
for its own DPI output pins instead of the external HDMI bridge claiming th=
em?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723102519.3581=
762-1-s-jain1@ti.com?part=3D2
