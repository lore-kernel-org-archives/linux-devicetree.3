Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC69B17A2EA
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778787743; cv=none; b=ZzS199GvzltUkNt1iAxufxRT/MzVR2GW04B9dDl+HhFq5Cf4DsMqBf93KKtjt6ivFzeZ+HLLWLDK+BVfATfMwoXwAT3/bjPWFP9u+QPLm6g4zg5bWblQ8jveeIqFT7UkFQM2vjemTdL+lGGX0KmU/JhqbCiFtIiC+3wmWy8zyJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778787743; c=relaxed/simple;
	bh=pnUe/TYkLHByps+Q6dj/Jf0YL10cLTrsjqizzHwsQKc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=raY0k5XZgZ8o8X0x3otwNXamdZRFjbu9rckR30iTcAvUpiYjUZnkA5Kmc3ugO9chQHoD77CrBf4pTq/M6g1e7gYsehoOJPVTHVYoPqQeHQdovznVD11kw61s6mlQvTOPSi3c0GlXmSWA1JGdPFwYs3eJ28Yat2B6WYoMQvLKGZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHYPZN4M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHYPZN4M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F67CC2BCB7;
	Thu, 14 May 2026 19:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778787743;
	bh=pnUe/TYkLHByps+Q6dj/Jf0YL10cLTrsjqizzHwsQKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QHYPZN4MQdRspXaPFiGkqDvO9lbRxCNnkCbAUGUTMpMKcnwBgdf6Pil8Nv0h1XEw/
	 gkFupVlM8eDFgbugPZziyB6GLqQYitG8stBPPBFMM0sdcNflfdB9UaGgmhDPwphoYY
	 kwXlgwkQ98rNtthe3tMcdlCMEX7XaG8Uc7HR6ruT9FRyZQnVyKfNw52Auezdgc2nmv
	 Kxi4TljQgzjZwHXpk1cWjGvAFxJvtKBFHJACAJaKz8q8sTysFHVhmDcaVtNLWYvbig
	 0lxb6U1IjvbbvJwQ2l3pdBtyE7y6+mb87/jWOEk6QLPuY6suDzzdf4GkV3z4eZxGSh
	 rM+ytsB1hGOwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] Enable wifi on the BeagleV-Ahead
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thomas Gerner" <thomas.gerner@muenchen-mail.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260514144836.50101-1-thomas.gerner@muenchen-mail.de>
References: <20260514144836.50101-1-thomas.gerner@muenchen-mail.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 19:42:22 +0000
Message-Id: <20260514194223.2F67CC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The `host-wake` interrupt pin is configured with `input-schmitt-=
disable`, which makes it susceptible to noise and false interrupts.
- [Medium] The pinctrl for the Wi-Fi `reg-on` GPIO is incorrectly assigned =
to the SDIO host (`&sdio1`) instead of the power sequence provider (`brcmf_=
pwrseq`).
- [Low] The power sequence node uses a non-generic name (`brcmf-pwrseq`), v=
iolating Devicetree naming guidelines.
--

commit aef7ec6dc80f633bb4abb51e59f66c088fa8d55f
Author: Thomas Gerner <thomas.gerner@muenchen-mail.de>

Enable wifi on the BeagleV-Ahead

This commit enables the AP6203BM WiFi chip on the BeagleV-Ahead board by
adding the necessary device tree nodes. It sets up the SDIO interface,
pin configurations, and power sequence for the wireless module.

> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/ri=
scv/boot/dts/thead/th1520-beaglev-ahead.dts
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
[ ... ]
> @@ -86,6 +86,11 @@ hdmi_con_in: endpoint {
>  			};
>  		};
>  	};
> +
> +	brcmf_pwrseq: brcmf-pwrseq {

This isn't a bug, but should this node use a generic name like wifi-pwrseq
instead of the vendor-specific brcmf-pwrseq? Section 2.2.2 of the Devicetree
Specification suggests node names should reflect the function of the device.

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
> +	wifi_pins: wifi-0 {
> +		host-wake-pins {
> +			pins =3D "GPIO2_25";
> +			function =3D "gpio";
> +			bias-disable;
> +			drive-strength =3D <1>;
> +			input-enable;
> +			input-schmitt-disable;

Could disabling the Schmitt trigger here cause issues with false interrupts?

The host-wake pin is configured later in this patch as an external,
asynchronous signal triggering on a rising edge (IRQ_TYPE_EDGE_RISING).

Disabling hysteresis removes protection against signal noise and slow
transitions, which might lead to multiple false triggers or interrupt storms
on a single edge.

> +			slew-rate =3D <0>;
> +		};
> +
> +		reg-on-pins {
> +			pins =3D "GPIO2_31";
> +			function =3D "gpio";
> +			bias-disable;
> +			drive-strength =3D <3>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate =3D <0>;
> +		};
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
> +	keep-power-in-suspend;
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&wifi_pins>;

Does the reg-on-pins pinctrl configuration need to be assigned to the
brcmf_pwrseq node rather than the sdio1 node?

The mmc-pwrseq-simple device is an independent platform device that
requests and drives the reset-gpios (GPIO2_31) during its own probe
sequence.

By keeping the pinctrl assignment here in the sdio1 node, the power
sequencer might attempt to drive the GPIO before the SDIO host has
multiplexed the pin correctly.

> +	mmc-pwrseq =3D <&brcmf_pwrseq>;
> +
> +	wifi@1 {
> +		compatible =3D "cypress,cyw43012-fmac", "brcm,bcm4329-fmac";
> +		reg =3D <1>;
> +		interrupt-parent =3D <&gpio2>;
> +		interrupts =3D <25 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names =3D "host-wake";
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514144836.5010=
1-1-thomas.gerner@muenchen-mail.de?part=3D1
