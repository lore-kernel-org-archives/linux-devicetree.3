Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537916;
	b=T+ziMKv3yzg9w5SZswnS3bpA37Eacys8F7A4u/Pz0eOaCkamQwLc1YZgZuemsL5NF9/K
	 PHsumKocNmooRxC8cI6tCA4cctKIqgjjgvHhDu6HVBZvfJejtUeVkNMp3nQ80sHMJsFD/
	 Eh0p9sn+XBPZTOQ9vGRvDue064gg30aEw6WaJvNmnXzE9US9+aZG1/tckvRL7rJJ2JxX4
	 7/njUvSFUu0UCI43FCeJLhVP+occ/QPHQd7Tolg95/cQaae/8FgyghmJ/JstbKzyx4+A3
	 axY1e05zTO5E5ks7vjrLzCYydagCvKuh+eMfBa6sLUW4VwtM7Wc/JbupLOPe1trCuzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537916;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RlA5T19+Xby5RXh8fxBQUVReBBVqPdfurbWwd/XBWms=;
	b=a7Kfn5BeG6c/JgZBylBPyl3aDfSvSQ3VEbdlzFYkIfjKTAPtK1oMmsAwT/1ica86hwVD
	 1OJHh6p+cmbtNovdpkWfSpMrYNCcC8LTOtffJrc+ng8Igp7Y4XU+3C/ndo7y0DOQIFqHb
	 1tqKyk6C9tHE037LXINtxXWpF/WtvmT9L+Sl2ystwOHfnGUNujlJnVJEl5P8rfP0AXHlm
	 mA84vUgwpYl0NyNTFvbUNsjeY071x0nxFfP5OHpxreD9Bwhfb9Zd13CzZuUVhVSvoHcjs
	 GeFbhFYBIwSsdjNwl2VbEVG4RGf/jH91q9P0t7xF7Y1wUMlNwHQI/GuTJzyMLUK7dmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rk+hCXid;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DEC606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rk+hCXid
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4161F000EF
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795537915;
	bh=RlA5T19+Xby5RXh8fxBQUVReBBVqPdfurbWwd/XBWms=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Rk+hCXidLJ54hOz5TyxtnZIYMNIHHSSpyv4Mria4pl6hJ9i881a30w2+ru+YkCG2X
	 1ymT6l9nvuuNcsgxf7OnWgvj9hwSPSEBjO/U7dGvEI0jejGJS2EO7CyWmvy1+i/c3H
	 41LlRVq/ec+kMM6KZ2r05sCZBIP6FPCU2Q+wTKME0XEKjXzDGXk5ZoMK7xAMk6Pw8j
	 kEro7W68HqEoUt40FX4eLkA4IZYbS3O07b0uUm8q8jQ2x8YFLDf4pBUnTlU6Cpa0/O
	 77+jiKXqF0NuLHoKbq+K3IE4jXomlQvAI5AlCKr8eFwKgjMrW28zGQQFZ+ned/etiQ
	 sOth4y5lvdYrQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ada7d53082so52501731fa.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:31:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGbCxeFgbg9i1hR4X8JFDe0FCMD8xwN42NvPNFqipsQ5w+U9phX7byx4ZOdGWPCKnfUQBsMVts7kZ29@vger.kernel.org
X-Gm-Message-State: APuU4Z/hl7rLA28iZEMWaG6/ob1yKLQSGwRwcX/zWQMQtckzY/pi1g9w
	kgromiUpSKlUCMceMssYWsvfgcLqAB0C1dQRblilrQ2DMdzMe1Nw2NAtQQv7lkXSN++fjoSxNk6
	B/LkIMHwogGSmPNF36PtqddJ+i/CzuoQ=
X-Received: by 2002:a05:651c:160c:b0:3ad:ff5d:19b1 with SMTP id
 38308e7fff4ca-3ae7b7fbe41mr35855301fa.20.1795537913373; Tue, 24 Nov 2026
 08:31:53 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com> <20261121-a733-cubie-a7s-dt-v5-3@gmail.com>
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-3@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 25 Nov 2026 00:31:40 +0800
X-Gmail-Original-Message-ID: <CAGb2v64p4GvDMDKzDLfedDQCexD+=gu3+YxMAt=ARj4bZxR_eA@mail.gmail.com>
X-Gm-Features: Aa3M54r7lXB_mKHdPc87JTNzzlkdZlyoashA_S1I3V-H5P997JVbiiv9Wvw0TFg
Message-ID: <CAGb2v64p4GvDMDKzDLfedDQCexD+=gu3+YxMAt=ARj4bZxR_eA@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, 
	Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, 
	Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 1:42=E2=80=AFAM Enzo Adriano
<enzo.adriano.code@gmail.com> wrote:
>
> Enable the serial console, PMIC and microSD slot for initial Cubie A7S
> bring-up with vendor firmware. Describe the oscillator inputs and the
> power tree using the Radxa A7S v1.10 schematic, sheets 4, 7 and 8. Keep
> the boot-critical supplies enabled. Use the Radxa 5.15 BSP CPU and
> GPU OPP envelopes for DCDC3/5 and DCDC4. Use its regulator readback
> for DCDC2, BLDO1, DLDO1 and ELDO6, consistent with sheets 4 and 8
> and the VCC-MCSI entry in the A733 datasheet.
>
> Allow 0.50-0.60 V on DCDC6, covering the 0.50 V LPDDR5 and 0.60 V
> LPDDR4X VDDQ options on sheet 5. Allow 1.05-1.10 V on DCDC7,
> covering LPDDR5 VDD2H at 1.05 V and the 1.10 V DRAM rail shown on
> sheets 4 and 5. The BSP readback was 0.56 V and 1.08 V, respectively.
> Both fall inside the bounds, so those selector values can be kept
> after DRAM training. Set the LVDS0 supply to 1.8 V per the A733
> Datasheet v1.00, table 5-2, and leave its enable under consumer control.
> Omit the unused UFS and codec regulator nodes (schematic sheets 4 and 6).
>
> Use SWOUT2 for the card and the Port F VCC-IO path (sheets 4, 7 and 13).
> Firmware must select the 3.3 V PF path for use with MMC0. CLDO5
> supplies the separate 1.8 V input. The controller uses fixed signalling
> with no VQMMC regulator and advertises no UHS modes. Describe the
> active-high card-detect line on PF6 and its pull-down.
>
> Add the PM2 power and PJ26 status LEDs, and the BL24C16F on I2C0 as
> shown on sheets 7 and 16. The EEPROM is at 0x50 in Radxa's 5.15 DT.
> PC7 drives an inverter that pulls the EEPROM's write-protect pin low.
>
> Keep ALDO1 always on for Port L, which powers the PMIC's own bus.
> Omit the Port L supply phandle, as on the Cubie A5E: requesting
> it would require the PMIC regulator before the PMIC can be reached.
> The A733 pinctrl voltage-mode fix is required for the bank supply
> connections.
>
> Link: https://dl.radxa.com/cubie/a7s/hw/radxa_cubie_a7s_schematic_v1.10.p=
df
> Link: https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c=
38be8d3c1ee851019795/configs/cubie_a7s/linux-5.15/board.dts#L372-L384
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> ---
>
> v4 -> v5: Add GPIO LEDs and the I2C0 EEPROM. Drop the MMC alias,
> 50 MHz cap and vqmmc-supply, and describe MMC/SDIO high-speed and IRQ
> capabilities. Describe the 3.3 V PF supply. Name and order the fixed
> regulators, remove the UFS and codec rails, and document the
> remaining always-on supplies. Add the DCDC2-7, BLDO1/2, DLDO1
> and ELDO6 voltage constraints.
>
> Untested on v5: physical rail voltages, visible LED operation, EEPROM
> contents, writes and write protection, early and repeatable MMC reads,
> MMC ios, SD writes, hotplug and 1.8 V switching, stimulated PMIC/NMI
> interrupts, suspend, power-off and other boards.

Please actually test them. Otherwise you should mark your patches as RFT.
And then we wait for someone's Tested-by.

>  arch/arm64/boot/dts/allwinner/Makefile            |   1 +
>  .../boot/dts/allwinner/sun60i-a733-cubie-a7s.dts  | 331 ++++++++++++++++=
++++
>  2 files changed, 332 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.d=
ts
>
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index da39f02252d4..9d1e740ff19e 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -69,3 +69,4 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-a527-cubie-a5e.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-h728-x96qpro+.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-t527-avaota-a1.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-t527-orangepi-4a.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun60i-a733-cubie-a7s.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/ar=
ch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> new file mode 100644
> index 000000000000..7451c00570fb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/dts-v1/;
> +
> +#include "sun60i-a733.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +       model =3D "Radxa Cubie A7S";
> +       compatible =3D "radxa,cubie-a7s", "allwinner,sun60i-a733";
> +
> +       aliases {
> +               serial0 =3D &uart0;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0:115200n8";
> +       };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               power-led {
> +                       function =3D LED_FUNCTION_POWER;
> +                       color =3D <LED_COLOR_ID_GREEN>;
> +                       gpios =3D <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 *=
/
> +                       default-state =3D "on";
> +               };
> +
> +               status-led {
> +                       function =3D LED_FUNCTION_STATUS;
> +                       color =3D <LED_COLOR_ID_BLUE>;
> +                       gpios =3D <&pio 9 26 GPIO_ACTIVE_HIGH>; /* PJ26 *=
/
> +                       linux,default-trigger =3D "heartbeat";
> +               };
> +       };
> +
> +       osc32k: osc32k-clk {

This still needs to be changed to clock-osc32k. Then it needs to be moved
above "chosen" to be in the correct order.

> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               clock-frequency =3D <32768>;
> +       };
> +
> +       /* board wide 5V supply from the USB-C connector */
> +       reg_ps: regulator-5v {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "ps";

No. This is vcc5v0, or vcc5v0-sys, as fed from the type-c connector
through an over-current protection IC. It could also be back fed from
the GPIO connector. This matters later when we actually have switches
fed from vcc5v0-sys, not PS.

"PS" is a separate output from the PMIC's "PS" pins. It is fed from
the "DCIN" pins and has some internal resistance and a zener diode (if
the block diagram is to be believed) for some poor regulation. In
practice I would expect at least a little bit of voltage drop here.

And please name the regulator nodes the same way as the rail name. So
regulator-vcc5v0. Sure the preferred name is "-5v0", but it doesn't help
when there are three regulators/switches that give 5V. And using the name
from the schematics helps when people need to search for the name.

> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +               regulator-always-on;
> +       };
> +
> +       /* discrete ETA3521 DC/DC step-down regulator */
> +       reg_ldo_input: regulator-2v4 {

I know Andre asked for this to be second, but dts style says nodes without
addresses should be sorted alphabetically.

> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "ldo-input";

Please use the name from the schematics when the name at least makes sense.
That makes it easier to find / grep for.

> +               /* Hardwired BLDO/CLDO input: 0.6 V * (1 + RP298 / RP299)=
. */

Drop the comment. "regulator-fixed" says it all. But you could comment that
this is actually named "LDO2V5-INPUT" in the schematic. Who botched the
name...

> +               regulator-min-microvolt =3D <2400000>;
> +               regulator-max-microvolt =3D <2400000>;
> +               regulator-always-on;
> +               vin-supply =3D <&reg_ps>;
> +       };
> +};
> +
> +&cpu0 {
> +       cpu-supply =3D <&reg_dcdc5>;
> +};
> +
> +&cpu1 {
> +       cpu-supply =3D <&reg_dcdc5>;
> +};
> +
> +&cpu2 {
> +       cpu-supply =3D <&reg_dcdc5>;
> +};
> +
> +&cpu3 {
> +       cpu-supply =3D <&reg_dcdc5>;
> +};
> +
> +&cpu4 {
> +       cpu-supply =3D <&reg_dcdc5>;
> +};
> +
> +&cpu5 {
> +       cpu-supply =3D <&reg_dcdc5>;
> +};
> +
> +&cpu6 {
> +       cpu-supply =3D <&reg_dcdc3>;
> +};
> +
> +&cpu7 {
> +       cpu-supply =3D <&reg_dcdc3>;
> +};
> +
> +&hosc {
> +       clock-frequency =3D <26000000>;
> +};
> +
> +&i2c0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c0_pg_pins>;
> +

Drop the empty line.

> +       status =3D "okay";
> +
> +       eeprom@50 {
> +               compatible =3D "belling,bl24c16f", "atmel,24c16";
> +               reg =3D <0x50>;
> +               pagesize =3D <16>;
> +               vcc-supply =3D <&reg_aldo1>;
> +               wp-gpios =3D <&pio 2 7 GPIO_ACTIVE_LOW>; /* PC7 via Q2 */
> +       };
> +};
> +
> +&mmc0 {
> +       bus-width =3D <4>;
> +       cap-mmc-highspeed;
> +       cap-sd-highspeed;
> +       cap-sdio-irq;

There's probably no SDIO happening on this controller...

> +       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;

Please actually test this.

> +       disable-wp;
> +       no-1-8-v;
> +       vmmc-supply =3D <&reg_swout2>;
> +

Drop the empty line.

> +       status =3D "okay";
> +};
> +
> +&pio {
> +       vcc-pb-supply =3D <&reg_swout2>;  /* via VCC-IO */
> +       vcc-pc-supply =3D <&reg_cldo5>;
> +       vcc-pd-supply =3D <&reg_swout1>;
> +       vcc-pe-supply =3D <&reg_bldo1>;
> +       /* PF uses VCC-IO at 3.3 V, with CLDO5 as the 1.8 V input. */
> +       vcc-pf-supply =3D <&reg_swout2>;
> +       vcc-pg-supply =3D <&reg_aldo1>;
> +       vcc-ph-supply =3D <&reg_swout2>;
> +       vcc-pj-supply =3D <&reg_swout1>;
> +       vcc-pk-supply =3D <&reg_bldo1>;
> +};
> +
> +&r_i2c0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&r_i2c0_pl_pins>;
> +

Drop the empty line.

> +       status =3D "okay";
> +
> +       axp318w: pmic@36 {
> +               compatible =3D "x-powers,axp318w";

The series for this hasn't been merged yet. We will need to wait for it
before I can take this.

> +               reg =3D <0x36>;
> +               interrupt-parent =3D <&nmi_intc>;
> +               interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <1>;
> +
> +               aldo156in-supply =3D <&reg_ps>;
> +               aldo234in-supply =3D <&reg_aldo1>;
> +               bldoin-supply =3D <&reg_ldo_input>;
> +               cldoin-supply =3D <&reg_ldo_input>;
> +               dldoin-supply =3D <&reg_ps>;
> +               eldoin-supply =3D <&reg_dcdc9>;
> +               ips-supply =3D <&reg_ps>;
> +               vin19-supply =3D <&reg_ps>;
> +               vin23-supply =3D <&reg_ps>;
> +               vin45-supply =3D <&reg_ps>;
> +               vin678-supply =3D <&reg_ps>;
> +
> +               regulators {
> +                       reg_dcdc1: dcdc1 {
> +                               /* Board 3.3 V loads and the SWOUT1/2 inp=
ut. */
> +                               regulator-name =3D "vcc-3v3";
> +                               regulator-min-microvolt =3D <3300000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       reg_dcdc2: dcdc2 {
> +                               /* System and DRAM core/PHY supply. */
> +                               regulator-name =3D "vdd-sys";
> +                               regulator-min-microvolt =3D <800000>;
> +                               regulator-max-microvolt =3D <800000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       reg_dcdc3: dcdc3 {
> +                               /* Powers the running Cortex-A76 CPUs. */
> +                               regulator-name =3D "vdd-cpub";
> +                               regulator-min-microvolt =3D <800000>;
> +                               regulator-max-microvolt =3D <1050000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       reg_dcdc4: dcdc4 {
> +                               regulator-name =3D "vdd-gpu";
> +                               regulator-min-microvolt =3D <800000>;
> +                               regulator-max-microvolt =3D <960000>;
> +                       };
> +
> +                       reg_dcdc5: dcdc5 {
> +                               /* Powers the running Cortex-A55 CPUs. */
> +                               regulator-name =3D "vdd-cpul";
> +                               regulator-min-microvolt =3D <800000>;
> +                               regulator-max-microvolt =3D <1050000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       reg_dcdc6: dcdc6 {
> +                               /* DRAM PHY and LPDDR4X/LPDDR5 VDDQ (via =
RP15). */
> +                               regulator-name =3D "vcc-draml";
> +                               regulator-min-microvolt =3D <500000>;
> +                               regulator-max-microvolt =3D <600000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       reg_dcdc7: dcdc7 {
> +                               /* DRAM PHY and LPDDR5 VDD2H (VCC-DRAM). =
*/
> +                               regulator-name =3D "vcc-dram";
> +                               regulator-min-microvolt =3D <1050000>;
> +                               regulator-max-microvolt =3D <1100000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       reg_dcdc9: dcdc9 {
> +                               regulator-name =3D "eldo-input";

Missing voltage range.

> +                       };
> +
> +                       reg_swout1: swout1 {
> +                               regulator-name =3D "vcc33-lcd";
> +                       };
> +
> +                       reg_swout2: swout2 {
> +                               /* VCC-IO to the console and microSD. */
> +                               regulator-name =3D "vcc-io-card";
> +                               regulator-always-on;
> +                       };
> +
> +                       reg_aldo1: aldo1 {
> +                               /* Port L powers the PMIC's own I2C bus. =
*/
> +                               regulator-name =3D "vcc-pl";
> +                               regulator-min-microvolt =3D <3300000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       reg_bldo1: bldo1 {
> +                               regulator-name =3D "vcc-pe-pk-mcsi";
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                       };
> +
> +                       reg_bldo2: bldo2 {
> +                               regulator-name =3D "vcc-lvds0";
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                       };
> +
> +                       reg_cldo1: cldo1 {
> +                               regulator-name =3D "vdd18-lpddr";
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       reg_cldo2: cldo2 {
> +                               regulator-name =3D "vcc18-hdmi";
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                       };
> +
> +                       reg_cldo3: cldo3 {
> +                               regulator-name =3D "vcc-pll-dram";
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       reg_cldo5: cldo5 {
> +                               regulator-name =3D "vcc18-pc-comb0";
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                       };
> +
> +                       reg_dldo1: dldo1 {
> +                               /* SoC eFuse supply has no SID regulator =
consumer. */
> +                               regulator-name =3D "vcc-efuse";
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       reg_eldo1: eldo1 {
> +                               regulator-name =3D "vdd2l-lpddr";

Missing voltage range.

> +                               regulator-always-on;
> +                       };
> +
> +                       reg_eldo6: eldo6 {
> +                               /* Standby CPU and USB supply. */
> +                               regulator-name =3D "vdd-cpus";
> +                               regulator-min-microvolt =3D <800000>;
> +                               regulator-max-microvolt =3D <800000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       reg_rtc_ldo: rtc-ldo {
> +                               regulator-name =3D "vcc-rtc";
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-always-on;
> +                       };

Sort the regulator child nodes alphabetically. Yes I know we followed
the order for previous boards.

> +               };
> +       };
> +};
> +
> +&r_pio {
> +       /* PL powers the PMIC bus itself; firmware must keep ALDO1 enable=
d. */
> +       vcc-pm-supply =3D <&reg_aldo1>;
> +};
> +
> +&rtc {
> +       clocks =3D <&r_ccu CLK_BUS_R_RTC>, <&hosc>, <&r_ccu CLK_R_AHB>,
> +                <&osc32k>;
> +       clock-names =3D "bus", "hosc", "ahb", "ext-osc32k";
> +};
> +
> +&uart0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&uart0_pb_pins>;
> +

Drop the empty line.



> +       status =3D "okay";
> +};
> --
> 2.53.0
>
>
