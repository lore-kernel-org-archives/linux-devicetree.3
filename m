Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C831429802
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 13:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688634; cv=none; b=u5QKgEqoRHFWu2eFJp7ewfPngEPwlMGTQzy7AXAPqGs+WbeRP2FV4GAhU+DCkhn0XH/5SRFwowbKM7DhUNwIvxMNmZJeJNpneT462PL1srI3me3XO/cMfluU5WZy1W82g5vOgxSwj3s0PUlDp6FHpLoA35Pxf/QHRJOoMsYdX7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688634; c=relaxed/simple;
	bh=48pPPLnHJkfceGuLUN1w/yO8PXyZfuStdMsIr1HD8S4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GmX06HVOrySXrrO780lseNBDXIbFrMq2+qKgqpzmadrzl6Pr2l871guRmLLJfOqVAfUtkPl5aDrxXwkN0+0xHHMIjpLWQsbtr5O/eRO4UhMqPoj/93D8sOlB5ZPSLoGpylbQHk9DtqUVhCwwvjj1pGp7vnr1Bb4eCxBDCodSzIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUh/rr6r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUh/rr6r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC081F000E9;
	Fri, 10 Jul 2026 13:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783688633;
	bh=mHbqPUzGneKmQUScV6rPdI7R0jLfcmxJIdExcBh2OW0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UUh/rr6r0VBFU++oUBCRkalfkBW7TCmJPQMHtH+clyXD2morJhwOfby5qczrPpVq0
	 wzDcfuy2IiW/ZL5RJi1eNyYgQVuGsC+ARhrbufc4eiomqph4k/N18zg8uhsD0eOSY9
	 iHN51a933NnzHFZlnB3Jya0v0xKZ2SGGHclp9n2wcUlUjLrAcmhiBR19LMfgHHxTxC
	 OXSMTSTkrQDZcb4Tlue0DMyo9rPplN4pKBwBbimGZClp+wa5heiMiP+IKLUnYqxh7p
	 8JAZzQJYa+h9WqqMFSsuizJlFpjMseBASFJw8X0Go36DFIfF+f8UWV/FOaExe/fJ3+
	 FVEjleWzACs4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: ti: Add support for Variscite
 VAR-SOM-AM62
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <5101905e5f99332557500447b0b7ad40e75c15f9.1783687321.git.stefano.r@variscite.com>
References: <cover.1783687321.git.stefano.r@variscite.com>
 <5101905e5f99332557500447b0b7ad40e75c15f9.1783687321.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 13:03:52 +0000
Message-Id: <20260710130352.BEC081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Missing clock rate assignment for `audio_refclk1` will cause a=
 divide-by-zero panic in the `wm8904` codec driver.
- [Medium] Missing Bluetooth device node despite being advertised in the co=
mmit message.
- [Low] Unused pinctrl node `pinctrl_vdd_mmc2` left over from v1 regulator =
removal.
--

--- Patch [2]: [PATCH v2 2/3] arm64: dts: ti: Add support for Variscite VAR=
-SOM-AM62 ---
commit 6f8bdf4ac0be91ef53a90c5674c70f3e23423f8b
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: ti: Add support for Variscite VAR-SOM-AM62

Add device tree support for the Variscite VAR-SOM-AM62 system on module.
This SOM is designed to be used with various carrier boards.

Link: https://variscite.com/system-on-module-som/ti-sitara-am62x/var-som-am=
62/

> diff --git a/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi b/arch/arm64/bo=
ot/dts/ti/k3-am625-var-som.dtsi
> new file mode 100644
> index 0000000000000..08afe751e4d6c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi

[ ... ]

> +&main_i2c2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c2>;
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";
> +
> +	wm8904: audio-codec@1a {
> +		compatible =3D "wlf,wm8904";
> +		reg =3D <0x1a>;
> +		#sound-dai-cells =3D <0>;
> +		clocks =3D <&audio_refclk1>;
> +		clock-names =3D "mclk";

[Severity: Critical]
Is a clock rate assignment missing for audio_refclk1 here?

If the DT does not specify assigned-clock-rates for audio_refclk1,
clk_get_rate() will return 0. When a userspace program opens the ALSA PCM
device and triggers hardware parameters configuration, simple-audio-card
calls snd_soc_dai_set_sysclk().

This falls back to wm8904_set_fll() which will execute Ndiv =3D target / Fr=
ef
with Fref =3D 0, causing a kernel panic from a divide-by-zero.

[ ... ]

> +	pinctrl_uart5: main-uart5-default-pins {
> +		pinctrl-single,pins =3D <
> +			AM62X_IOPAD(0x00ec, PIN_INPUT, 4) /* (AA24) VOUT0_DATA13.UART5_CTSn */
> +			AM62X_IOPAD(0x00e8, PIN_OUTPUT, 4) /* (AB25) VOUT0_DATA12.UART5_RTSn =
*/
> +			AM62X_IOPAD(0x00d0, PIN_INPUT, 4) /* (Y23) VOUT0_DATA6.UART5_RXD */
> +			AM62X_IOPAD(0x00d4, PIN_OUTPUT, 4) /* (AA25) VOUT0_DATA7.UART5_TXD */
> +		>;
> +	};
> +
> +	pinctrl_vdd_mmc2: main-vdd-mmc2-default-pins {
> +		pinctrl-single,pins =3D <
> +			AM62X_IOPAD(0x00d8, PIN_INPUT, 7) /* (V21) VOUT0_DATA8.GPIO0_53 */
> +			AM62X_IOPAD(0x00dc, PIN_INPUT, 7) /* (W21) VOUT0_DATA9.GPIO0_54 */
> +			AM62X_IOPAD(0x00f0, PIN_INPUT, 7) /* (Y22) VOUT0_DATA14.GPIO0_59 */
> +			AM62X_IOPAD(0x00f4, PIN_INPUT, 7) /* (AA21) VOUT0_DATA15.GPIO0_60 */
> +		>;
> +	};
> +};

[Severity: Low]
Is this pinctrl group still used?

It appears to be left over from the v1 removal of the reg_vdd_mmc2
regulator. The node is unreferenced, leaving dead code in the device tree.

If these GPIOs were previously used to sequence power for the wireless
modules, does removing the regulator without migrating them to an mmc-pwrseq
or shutdown-gpios cause issues with powering up the wireless modules?

[ ... ]

> +&main_uart5 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_uart5>;
> +	uart-has-rtscts;
> +	status =3D "okay";
> +};

[Severity: Medium]
Is the bluetooth child node missing from this UART interface?

The commit message mentions Bluetooth 5.2 support. Without a bluetooth
child node defined here, the serdev bus scan during boot won't find it,
the hci_bcm driver will not bind, and the required Broadcom firmware won't
be loaded.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783687321.gi=
t.stefano.r@variscite.com?part=3D2
