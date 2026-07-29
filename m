Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1CD486E46
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 14:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785334870; cv=none; b=AzgW59W4Y1Tx7yXXjBbZc5lSQmKuzEyF93uykgJicPJotL+KK3CvcmLKIAVsnTwbKzjPCYQJmKUZwoS6JvLcT0pVoRuWYHe3z9YXJ7j3YrtwhKK+jRZiK5mub0o4804qYkhoLxU5ihmH7OWTOsHlYPEVyoXpx9fNW2cQM0pIrtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785334870; c=relaxed/simple;
	bh=HevzhXRa/wb8m6OJBd3W+FKsPBRAsSRgZAR2ghcsOVI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dko7GxOXmzWN0BpT2DD7XHWdUa+4PGMEvHyJ4q1KbMsLLH3P7kmjsYrwL88sYJVvhy4X4JXD2K3sPq+xlCQX04yN56PZS75OO4ZDPJJaqG/DZ9hGyIVirZbKSbdlIgWKqqq7nRqsCTD6oBHF8wowrjLoUyu5Jh0P+TNFO72OUJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1PGZVkE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1PGZVkE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DDF1F000E9;
	Wed, 29 Jul 2026 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785334868;
	bh=nNueIrEsSi3c9BAhVItDdB9b03ZyAuLnkKBHCRTmYyY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P1PGZVkEFVNuoLlJbIgq+wn/17GvotMNoKo+0A+d/Y4oXfk3qkY4XZYKjg0o/SUzB
	 4o/2FhA9jxm2LYbUIFlP+X/7m9IgxMK2TIVhA1DC9seae2UmEWostJZT/G6i/wVgcC
	 aCspKlSIxFxKsd2SzyzU7gpEbHERTlYGYG6QMgd5bWDwGYiQ3P3eI+GA18GsDDC4ed
	 a3cIxIckrdI8SkYut1nyneAPAgACo/zxuO4ujcGYYWMpmTeP7KVwitrjLP0uKycXQ3
	 xno+EELXjrzdF4bPFWLRFcK/9gzbAmNIteLdVr2jTLJFKaHVYQGfMVYhY+uo4EBFwl
	 V6vHc0Sjrb1Dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: amlogic: add support for Orbbec Zora
 P1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alberto Robazza" <robazzalberto@gmail.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729141234.65037-4-robazzalberto@gmail.com>
References: <20260729141234.65037-1-robazzalberto@gmail.com>
 <20260729141234.65037-4-robazzalberto@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 14:21:07 +0000
Message-Id: <20260729142108.65DDF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Hardware pin conflict on GPIOX_16, which is simultaneously assigne=
d as an SDIO reset GPIO and a PWM_E clock output.
- [Low] The overridden 'led-blue' node fails to delete the inherited 'label=
' property, causing the LED sysfs device name to incorrectly remain 'n2:blu=
e' and ignoring the new 'color' and 'function' properties.
--

--- Patch [3]: [PATCH v4 3/3] arm64: dts: amlogic: add support for Orbbec Z=
ora P1 ---
commit 42dd3ecbc89a1e42aabbfd5aa86b80cf4d5cb181
Author: Alberto Robazza <robazzalberto@gmail.com>

arm64: dts: amlogic: add support for Orbbec Zora P1

The Orbbec Zora P1 is an A311D board modded from the ODROID-N2. This commit
adds a new device tree that builds on meson-g12b-a311d.dtsi and
meson-g12b-odroid-n2.dtsi, adding board-specific GPIO wiring for Wi-Fi/BT
and modifying the LED configuration.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts b/arch/ar=
m64/boot/dts/amlogic/meson-g12b-zora-p1.dts
> new file mode 100644
> index 0000000000000..6e696ddbcafea
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

[ ... ]

> +	leds {
> +		/* Status led on Zora is actually green, same pin as N2, but reversed =
polarity */
> +		led-blue {
> +			function =3D LED_FUNCTION_STATUS;
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			gpios =3D <&gpio_ao GPIOAO_11 GPIO_ACTIVE_LOW>;

[Severity: Low]
Will the LED subsystem ignore the new color and function properties here?

Since this node overrides led-blue from the base meson-g12b-odroid-n2.dtsi
(which sets label =3D "n2:blue"), not explicitly removing the label with
/delete-property/ label; means the original label is inherited.

In led_parse_fwnode_props(), if a label is present, it uses that exclusively
for the sysfs name and ignores the color and function properties.

> +		};
> +	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&gpio GPIOX_16 GPIO_ACTIVE_LOW>;
> +		clocks =3D <&clock_32768>;
> +		clock-names =3D "ext_clock";
> +	};

[ ... ]

> +&pwm_ef {
> +	status =3D "okay";
> +	pinctrl-0 =3D <&pwm_e_pins>;

[Severity: High]
Does this create a hardware pin conflict on GPIOX_16?

The sdio_pwrseq node explicitly requests GPIOX_16 as a reset GPIO. At the
same time, pwm_ef claims pwm_e_pins. On Amlogic G12A/G12B platforms, the
pwm_e_pins group maps directly to GPIOX_16.

This looks like the exact same pin is requested for two incompatible roles,
which might conflict between the GPIO and pinctrl subsystems and prevent the
Wi-Fi module from working.

> +	pinctrl-names =3D "default";
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729141234.6503=
7-1-robazzalberto@gmail.com?part=3D3
