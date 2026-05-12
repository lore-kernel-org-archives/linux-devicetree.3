Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F39D41754
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778563707; cv=none; b=Gr/2lswMu6vMAzAAOIFWmTuNWy5xRoyE+Hp+b5JzxB/xFCLe6wjrS6QTsv9JPyvL9XqWrLFYZj2Se+GdIA2wU+jc3/Bjq+EJkLYj6V3xFAe9VQpLCIrOkvtJXdJzoyDOAOMN3ueut5z5QZzVRA4AacAe3J85AQ+XNm+NEYJazFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778563707; c=relaxed/simple;
	bh=eLHYURQNBw/J5YdxpDvHywMM6ThKXwOgJdIpFRWeyHY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DM5l8L5ojbgXhDbPovyEg1pLEr2h3e+84YuPmIp4JZo9Zqv7gCNUb65xf1R76+cnZAm6YaQiBQLXzb12AgQYNxkSpC8US3lneBUhYweiz5z6bJKfqiatCpwAgLhVrfhVgGBys8d7qSQC69E3w3IwMWPRZf4/Gl4+RF6i7mjK1Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpVOOFLI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpVOOFLI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A0AC2BCB0;
	Tue, 12 May 2026 05:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778563706;
	bh=eLHYURQNBw/J5YdxpDvHywMM6ThKXwOgJdIpFRWeyHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=SpVOOFLI5d19jpoQ5ASS7B4BNCgBHBT9dDVDXL1cVRZVEGfawqU+cd9Qh/T6cOymh
	 HUJWq+dUHZH+ZaH4gQhFLkPD3Lqk3l194NJp3BdOhdjK0b2MpJ5k4SV8sKplnJ44PW
	 Oqf5cKxKyUlGwUZMXQwGKpy0fmOJvNxI3hjKSzh2NEKxp76j0fj3Jesitygw5sFhri
	 vKlxVaJvcWu2rbm/EXYoBs/oFhIGmb923JWfEJadaAwLYrBLbX4MXbc8rchNesq4LD
	 pZOnlBpfttmGyknKfwK/Mfq0yvYJWedYH4OUTJxXKR8xz5q+svqZ1TCIMt4KBNO7Ak
	 9EwyKATDWzs2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Enable wifi on the BeagleV-Ahead
Reply-To: sashiko@lists.linux.dev
To: "Thomas Gerner" <thomas.gerner@muenchen-mail.de>
Cc: krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511141119.155369-1-thomas.gerner@muenchen-mail.de>
References: <20260511141119.155369-1-thomas.gerner@muenchen-mail.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 05:28:25 +0000
Message-Id: <20260512052826.71A0AC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Missing `keep-power-in-suspend` property breaks WoWLAN functionali=
ty.
- [Medium] Contradictory pull-up configuration on WiFi GPIOs causes power l=
eakage.
- [Medium] Incorrect hardware-specific compatible string misrepresents the =
device.
- [Low] The `brcm,sd_head_align` and `brcm,sd_sgentry_align` properties are=
 undocumented and ignored.
- [Low] The devicetree node name `brcmf_pwrseq` uses an underscore instead =
of a hyphen.
- [Low] Mixed space and tab indentation within the `wifi_pins` node.
--

commit 927889c06368228ec05bf0df849cea905cfb5d42
Author: Thomas Gerner <thomas.gerner@muenchen-mail.de>

Enable wifi on the BeagleV-Ahead

The BeagleV-Ahead board uses an AP6203BM WiFi chip from AMPAK Technology
Inc. connected to SDIO1. The chip is compatible to the broadcom wireless
driver.

> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/ri=
scv/boot/dts/thead/th1520-beaglev-ahead.dts
> index 91f3f9b987bc3..5e0dc47d263c9 100644
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
[ ... ]
> @@ -86,6 +86,11 @@ hdmi_con_in: endpoint {
>  			};
>  		};
>  	};
> +
> +	brcmf_pwrseq: brcmf_pwrseq {

This isn't a bug, but does the node name violate the devicetree specificati=
on?
Section 2.2.1 and kernel conventions dictate using hyphens to separate word=
s.
Using an underscore here will trigger a node_name_chars_strict warning from
the dtc compiler. Should it be renamed to brcmf-pwrseq or wifi-pwrseq?

> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&gpio2 31 GPIO_ACTIVE_LOW>;	/* WL-REG-ON */
> +	};
>  };
[ ... ]
> @@ -239,6 +244,28 @@ rx-pins {
>  			slew-rate =3D <0>;
>  		};
>  	};
> +
> +	wifi_pins: wifi-pins {
> +	    host-wake-wl {

This isn't a bug, but are these lines indented with 4 spaces? The Linux
kernel coding style requires the exclusive use of tabs for indentation in
device tree sources.

> +			pins =3D "GPIO2_25";
> +			function =3D "gpio";
> +			bias-pull-up;

Since the host-wake interrupt is configured below as IRQ_TYPE_EDGE_RISING,
it implies the signal idles low. Does pulling up a signal that idles low
cause continuous power leakage? Should this be configured with bias-disable
or bias-pull-down instead?

> +			drive-strength =3D <1>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate =3D <0>;
> +		};
> +
> +	    reg-on-wl {
> +		    pins =3D "GPIO2_31";
> +		    function =3D "gpio";
> +			bias-pull-up;

The mmc-pwrseq-simple configuration uses this pin as an active-low reset
and actively drives it low to power off the WiFi chip during sleep or
suspend. Could pulling up this pin while it is driven low cause continuous
current leakage to ground?

> +			drive-strength =3D <3>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate =3D <0>;
> +	    };
> +	};
>  };
[ ... ]
> +&sdio1 {
> +	bus-width =3D <4>;
> +	max-frequency =3D <198000000>;
> +	status =3D "okay";
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	non-removable;

Will Wake-on-WLAN (WoWLAN) fail to function without the
keep-power-in-suspend property here?

The wifi@1 node below configures an Out-Of-Band host-wake interrupt to
support WoWLAN. However, without keep-power-in-suspend on the sdio1 node,
the MMC core will not set the MMC_PM_KEEP_POWER flag and will assert the
reset GPIO to cut power to the WiFi chip during system suspend.

This would cause the WiFi module to lose its firmware state, rendering the
configured OOB interrupt useless.

> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&wifi_pins>;
> +	mmc-pwrseq =3D <&brcmf_pwrseq>;
> +
> +	wifi@1 {
> +		compatible =3D "cypress,cyw43012-fmac", "brcm,bcm4329-fmac";

Does this compatible string misrepresent the underlying hardware?=20

The commit message states the board uses an AMPAK AP6203BM WiFi chip,
which is based on Broadcom BCM43436 silicon. However, this compatible
string corresponds to a dual-band Cypress chip architecture. Should it use
an appropriate BCM4343x compatible string (e.g., brcm,bcm43430-fmac)
instead?

> +		reg =3D <1>;
> +		brcm,sd_head_align =3D <4>;
> +		brcm,sd_sgentry_align =3D <512>;

Are these properties used by the kernel?

They do not appear to be defined in the brcm,bcm4329-fmac.yaml binding
schema, which strictly enforces unevaluatedProperties: false, and their
presence will cause make dtbs_check validation to fail.

A review of the brcmfmac driver also shows these properties are only used
for legacy C platform data structs and are never parsed from the device
tree.

> +		interrupt-parent =3D <&gpio2>;
> +		interrupts =3D <25 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names =3D "host-wake";
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511141119.1553=
69-1-thomas.gerner@muenchen-mail.de?part=3D1
