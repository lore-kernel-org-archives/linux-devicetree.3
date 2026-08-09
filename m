Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC70883F
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 09:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786267640; cv=none; b=q559hNyV2q+Aa+CQOd1PwAgtmtgUkt9N3nS4ZtCL4wnaXFHuM50sraBVKIWbxAKcaneYAEsvCgknHp9QMOvYfsX5ynFkWXnodLR8+ALS4vzn1L/9yIILYY6v8MCCMAfA0IUzk28z108ldpYoT3WpQoDcMvrcnYNxHpVnvZYob7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786267640; c=relaxed/simple;
	bh=iY+G3wEyxm6gicY1zU6hZN1Pqb7ohUrLpisDmP++mjA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sHxQmJsY//IDUhalzdgffxOtwW/15Qz8yYFY96hrzXyn85QX8cHyT208fMocA+oQ5uZ1Ux870ymZsN98eOYbEWzopJycaoAg5m86SVR1Pfsz57qvDwOwh9do98cEeJtobifmidjW9JGrzLlXAymGWbO5/rcn7ZBanzsGBEbC/fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UU6ONAlS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UU6ONAlS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCCCD1F000E9;
	Sun,  9 Aug 2026 09:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786267639;
	bh=LKoh8fIabU8WJMk81uNMwCXS2XMVr32ldrt6pQoYQX8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UU6ONAlSyctGCcNrWaWufkYhavT5r1ZX2k0/mY2ZveGqKexj0JjulvBs8XRY01DMA
	 QMmZf6NqmQHOM24Sp1rZ+GByP1C6vFQK56tfYyFVI2ctkj+P8hwv27l2HU55+aKEEH
	 eBzGXJp86RuocEImvX/1RBrucPm0zXFcm98aKqP7uKZ7SxuqToS0VT5lnY+Tc+WVFo
	 h5tViREe5/L5atTRtyipRkBHUyngwtlPn/QM68POPAhPIuQ7GB1Go3PVW4poxojxk1
	 7BmVmbs6GbOwTSiN408LKlSEpOuWIBFEua4OjL92jTFT35oqYVnresD6wuBM9VavrN
	 Cq1Xx/U3IiTkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/5] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260809-rzg2-sr-boards-v5-5-19c662358e36@solid-run.com>
References: <20260809-rzg2-sr-boards-v5-0-19c662358e36@solid-run.com>
 <20260809-rzg2-sr-boards-v5-5-19c662358e36@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 09:27:18 +0000
Message-Id: <20260809092718.BCCCD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] SD0_DATA4 through SD0_DATA7 are incorrectly included in the sd0_ct=
rl_dat03 pinctrl node, defeating the intended overvoltage protection for th=
e 1.8V eMMC.
- [Medium] The usb0_vbus_pins configuration is defined but never referenced=
, leaving the USB0 VBUS enable pin unconfigured.
- [Medium] The fixed regulator v_1_2 is named for 1.2V but configured for 1=
.8V, creating a mismatch for the Cypress HX3 USB hub.
--

--- Patch [5]: [PATCH v5 5/5] arm64: dts: renesas: add support for solidrun=
 rzg2lc som and hb-iiot evb ---
commit 99c1d6c6c90388a93caa65e01f5c690e6a6d45a2
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: renesas: add support for solidrun rzg2lc som and hb-iiot evb

Add support for the SolidRun RZ/G2LC SoM [1] on Hummingboard IIoT [2].
The RZ/G2LC SoM was designed to be pin compatible to G2L SoM, with
slightly reduced feature set.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-=
g2lc-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hum=
mingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dt=
s b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts
> new file mode 100644
> index 0000000000000..9cc21ae32ed4d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts
> @@ -0,0 +1,20 @@
[ ... ]
> +#include "r9a07g044c2.dtsi"
> +#include "rzg2lc-sr-som.dtsi"
> +#include "rzg2l-hummingboard-iiot-common.dtsi"

[Severity: Medium]
Is the v_1_2 regulator configured incorrectly in rzg2l-hummingboard-iiot-co=
mmon.dtsi?

The common file defines a regulator named "1v2" with 1.8V limits:

    v_1_2: regulator-1-2 {
        compatible =3D "regulator-fixed";
        regulator-name =3D "1v2";
        regulator-max-microvolt =3D <1800000>;
        regulator-min-microvolt =3D <1800000>;
    };

This regulator is consumed by the Cypress HX3 USB hub which requires 1.2V
on its vdd-supply. This creates a mismatch that either misrepresents the bo=
ard
wiring or provides an incorrect constraint to the regulator framework.

> diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi b/arch/arm64/=
boot/dts/renesas/rzg2lc-sr-som.dtsi
> new file mode 100644
> index 0000000000000..d98d544a0fdc9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
> @@ -0,0 +1,414 @@
[ ... ]
> +	sdhi0_4bit_pins: sdhi0-4bit {
> +		sd0_ctrl_dat03 {
> +			pins =3D "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
> +			       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7",
> +			       "SD0_CLK", "SD0_CMD";
> +			power-source =3D <3300>;
> +		};
> +
> +		/*
> +		 * Pins 4-7 are hard-wired to eMMC with 1.8V IO voltage,
> +		 * with all pins sharing a single voltage domain.
> +		 *
> +		 * Configure as input without pull to avoid overvoltage,
> +		 * and accidental use e.g. as gpio (default pin-function).
> +		 */
> +		sd0_dat47 {
> +			bias-disable;
> +			input-enable;
> +			pins =3D "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
> +			power-source =3D <3300>;
> +		};
> +	};

[Severity: High]
Does this configuration violate the 1.8V eMMC maximum ratings?

SD0_DATA4 through SD0_DATA7 are included in the sd0_ctrl_dat03 group along =
with
SD0_DATA0..3 and power-source =3D <3300>.

When the pinctrl driver processes these subnodes sequentially, it will
configure pins 4-7 without the protective bias-disable and input-enable
properties before proceeding to sd0_dat47. This creates a window during boot
where the SoC's internal pull-ups or output drivers may be active on the eM=
MC
pins at 3.3V.

[ ... ]
> +	sdhi0_4bit_uhs_pins: sdhi0-4bit-uhs {
> +		sd0_ctrl_dat03 {
> +			pins =3D "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
> +			       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7",
> +			       "SD0_CLK", "SD0_CMD";
> +			power-source =3D <1800>;
> +		};
> +
> +		/*
> +		 * Pins 4-7 are hard-wired to eMMC with 1.8V IO voltage,
> +		 * with all pins sharing a single voltage domain.
> +		 *
> +		 * Configure as input without pull to avoid accidental use,
> +		 * e.g. as gpio (default pin-function).
> +		 */
> +		sd0_dat47 {
> +			bias-disable;
> +			input-enable;
> +			pins =3D "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
> +			power-source =3D <1800>;
> +		};
> +	};

[Severity: High]
Does this node repeat the same configuration conflict?

SD0_DATA4 through SD0_DATA7 are also incorrectly included in the sd0_ctrl_d=
at03
pinctrl group here, which configures them before the intended sd0_dat47 nod=
e.

[ ... ]
> +	usb0_vbus_pins: usb0-vbus {
> +		pinmux =3D <RZG2L_PORT_PINMUX(4, 0, 1)>; /* USB0_VBUSEN */
> +	};
> +};

[ ... ]

> +&usb2_phy0 {
> +	vbus-supply =3D <&usb0_vbus_otg>;
> +	status =3D "okay";
> +};

[Severity: Medium]
Is usb0_vbus_pins unused dead code?

The USB PHY node relies on VBUS but fails to apply the corresponding pin
multiplexing via pinctrl-0 =3D <&usb0_vbus_pins>. This leaves the VBUS enab=
le
pin unconfigured and prevents the SoC from powering connected USB devices.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-rzg2-sr-bo=
ards-v5-0-19c662358e36@solid-run.com?part=3D5
