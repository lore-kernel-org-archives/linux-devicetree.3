Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4518E158535
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 23:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778800483; cv=none; b=q6LQiyIYO80x6YY7uPQ4bvB9UzRndSr/K7CpizWPcZLIxPM69khktZlXbSYdykNnne0Qwolnt5CHbu2SesBht21OMesxhb9aWpbYR30FM+YN+IbUz/0RqD/9Zr4huveu0YfbpvbnDrpCStjtN+hO66/FpVWn5OKRfKRbVlzZR7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778800483; c=relaxed/simple;
	bh=KN2Gxvvbcp9Oq/RAKGg/79LB97Lr5mOfgYTiInu3FQQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N6bzEfZ+Gm5jbdmZmDIlyiUQxCV5H1r/C0yAYpLn8/HQoM3q2+vdtj2kE6illA6w+F6Y/56postm06624bTaw4di56h09zJE9h1WiDLxQ8gEKzaZrlbSviVFpVLfG9FAJLtWL9qJmxDSeBWFgvwYbFSaT3+BcKjgqWJIkofHPmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uogF4hIz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uogF4hIz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7206C2BCB3;
	Thu, 14 May 2026 23:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778800483;
	bh=KN2Gxvvbcp9Oq/RAKGg/79LB97Lr5mOfgYTiInu3FQQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uogF4hIzjl38jl2yTTqUrQ7XmDYOsnokRtVLceBW0ZcWy+Yas1F5b7RuK4GCFaT3x
	 7Y2KvxlD0Y+MLwCp1mBczufWpJTDB1VDnIXDKdL2lOcXCYwyWasdRm3I7ffMjeTKEX
	 IP2VIsWTxhk8pxCKDyLZWecvIlVYvhowmmgGVCdCqilconBKYsMgMRSWt8hhcxuuT7
	 lI2k5lLlkAuuji3bM8GlMrCsKcIDnFxXnTGS0haoFrbAVswUW/Ljci7uhYfwpBH+z7
	 06mGkgDNQHSfTh1iW82E8vF+WmUFR6tixlJ0+zLFPjuhsoQXx9M3ws5YUW77uzASQn
	 fQtpfCLrQKCuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay
 for AM625-BeaglePlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Swamil Jain" <s-jain1@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260514225502.2327771-1-s-jain1@ti.com>
References: <20260514225502.2327771-1-s-jain1@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 23:14:42 +0000
Message-Id: <20260514231442.D7206C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Overlay-specific pinmux configurations are placed in the base board=
 device tree instead of the overlay DTSO.
--

commit 02fc98142af9446899da0e37e4dddce6f799d0a0
Author: Aradhya Bhatia <a-bhatia1@ti.com>

arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for AM625-BeaglePlay

This commit adds a device tree overlay for the LincolnTech LCD185-101CT
OLDI panel on the AM625-BeaglePlay platform. It configures the panel,
touchscreen, backlight, and display subsystem nodes in a new overlay file.
The commit also adds pin multiplexing configurations to the base board
device tree and updates the Makefile to build the new overlay.

[ ... ]

> diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/=
boot/dts/ti/k3-am625-beagleplay.dts
> index c468b9c5fc09a..dc5b7f6217ad4 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
> @@ -510,6 +510,20 @@ AM62X_IOPAD(0x0074, PIN_OUTPUT, 1) /* (U25) GPMC0_AD=
14.VOUT0_DATA22 */
>  			AM62X_IOPAD(0x0078, PIN_OUTPUT, 1) /* (U24) GPMC0_AD15.VOUT0_DATA23 */
>  		>;
>  	};
> +
> +	touchscreen_pins_default: touchscreen-default-pins {
> +		pinctrl-single,pins =3D <
> +			AM62X_IOPAD(0x01b4, PIN_OUTPUT, 7) /* (A13) SPI0_CS0.GPIO1_15 */
> +			AM62X_IOPAD(0x00a0, PIN_INPUT, 7) /* (K25) GPMC0_WPn.GPIO0_39 */
> +		>;
> +	};
> +
> +	backlight_pins_default: bl-default-pins {
> +		pinctrl-single,pins =3D <
> +			AM62X_IOPAD(0x0000, PIN_OUTPUT, 7) /* (H24) OSPI0_CLK.GPIO0_0 */
> +			AM62X_IOPAD(0x01b8, PIN_OUTPUT, 2) /* (C13) SPI0_CS1.EHRPWM0_B */
> +		>;
> +	};
>  };
> =20
>  &mcu_pmx0 {

Should these overlay-specific pinmux configurations be placed in the base
board device tree?

Device tree overlays are typically self-contained descriptions of the add-on
hardware they enable. Adding overlay-specific pin multiplexing directly to
the base board's file adds configurations for an optional add-on into the
primary board description.

Could these pin groups be moved into a pin controller node fragment like
&main_pmx0 within the k3-am625-beagleplay-lincolntech-lcd185-panel.dtso
file instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514225502.2327=
771-1-s-jain1@ti.com?part=3D1
