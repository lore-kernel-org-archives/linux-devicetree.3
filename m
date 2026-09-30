Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD5D2BE655
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762141; cv=none; b=BGkJHkMit0Vr0i7Nj3L9jM1p/1rxfjdwlxb7Xm4w5+eZGqwlL2Cfeh1Xuwl7YsceuGLldVnq/1CohbxFOhNEOax8eoFTY/8aHDLl+4FLCOlEoK9jPawOk3NHAPmEQ8VlrK1e0aUSnjPco3fXvx88Ht0OFRKuJ9fI0Q614Jy4CwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762141; c=relaxed/simple;
	bh=nRS8D+P/pYlYdh/xGzIxpkoh4WXx0++qntMaidLDj/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ozmd5Xfa2u9OosIABxymSlMlopzJQ+1WtwpyD6J5IvUcR9fKYERqmTzSs1qFlUv560beNtETn7qCwsRUHUS3f46RF7XlrEfFZNd5hF3Zjdy0FWwl+m144BbNq1pcKDJRBUZczPScvaCfsW5FKZzy7lIkuDg2Dk8PZ+hjJ+u5HF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFopaa/g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFopaa/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297011F000FF;
	Wed, 30 Sep 2026 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762139;
	bh=8Zlori9dyIXAFre1eaqGoNXivn0S1xaEQCRffXNeDBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YFopaa/gt83Ur4lLWip6GsBeaM8W5zwxFuzdwj/pd4yL/p2Q9rANDt5lYLyDgAxiW
	 f0uO8PYihLN3do/g+Q1vkTFJAD15y8ueLL5F+pN28oMNuKI4fKCdm2MExduosRcpLe
	 uPKBupZ4CF5Xn/SmLxvj+l3JpfjAKKe0hlWpWEm1QYThwSIhFo6QcKf0sFXI/tDyMb
	 bbo1Q5isYiFmJRjQmugZSAfdlvGQ28uWyYkv/RyhFaGSRw5RYZIkzaD49SOd+gghE8
	 OFPijZYjxqM0KMGeAii8aPqLF1hHcdRAYLQYQtL2NCL41ee+zF9A53XdNIGkdXziMx
	 FkpQZuB1BgZXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: add Forlinx OK3568-C
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Yashin" <dmt.yashin@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260930-ok3568-c-v1-3-a0ffd55f5c95@gmail.com>
References: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
 <20260930-ok3568-c-v1-3-a0ffd55f5c95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 09:55:38 +0000
Message-Id: <20260930095539.297011F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dts: missing device-wakeup, interrupt, and reset properties in b=
luetooth node
- [Medium] dts: orphaned modem_5g_reset pinctrl leaves 5G modem reset unhan=
dled
- [Medium] dts: orphaned wifi_host_wake pinctrl disables out-of-band WiFi w=
ake
--

commit ebd497a35c265bc281369082ab62727d0e435e1b
Author: Dmitry Yashin <dmt.yashin@gmail.com>

arm64: dts: rockchip: add Forlinx OK3568-C

This commit adds support for the Forlinx OK3568-C board, which is the
carrier board for the FET3568-C System on Module. It maps the peripherals
and components for the board including connectivity modules like 5G, WiFi,
and Bluetooth.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts b/arch/arm6=
4/boot/dts/rockchip/rk3568-ok3568-c.dts
> new file mode 100644
> index 0000000000000..d292df546d419
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts
[ ... ]
> +&pinctrl {
[ ... ]
> +	modem {
> +		modem_5g_pwr: modem-5g-pwr {
> +			rockchip,pins =3D <1 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		modem_5g_reset: modem-5g-reset {
> +			rockchip,pins =3D <1 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};

[Severity: Medium]
The modem_5g_reset pinctrl node is defined here but does not appear to be
referenced in any pinctrl-0 property or assigned to a device node,
regulator, or gpio-hog.

Without being actively driven, could this prevent the 5G modem from
initializing and enumerating properly if it requires this reset signal?

[ ... ]
> +	wifi {
> +		wifi_reg_on: wifi-reg-on {
> +			rockchip,pins =3D <3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		wifi_host_wake: wifi-host-wake {
> +			rockchip,pins =3D <0 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};

[Severity: Medium]
Similar to the modem reset, the wifi_host_wake pinctrl group configures
a GPIO for handling out-of-band host wake interrupts from the WiFi
module, but it is completely isolated. It isn't referenced by the
sdmmc2 node's pinctrl-0, and the corresponding interrupts property is
missing.

Does this missing configuration break Wake-on-WLAN and sleep power
management for the WiFi module during system suspend?

[ ... ]
> +/* BT part of the AW-CM358SM connected with UART */
> +&uart8 {
> +	dma-names =3D "tx", "rx";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart8m0_xfer &uart8m0_ctsn &uart8m0_rtsn>;
> +	uart-has-rtscts;
> +	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "nxp,88w8987-bt";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&bt_reg_on &bt_wake_host &host_wake_bt>;
> +		vcc-supply =3D <&vcc1v8>;
> +		wakeup-source;
> +	};
> +};

[Severity: Medium]
While pinctrl-0 sets up the hardware pins as GPIOs, the corresponding DT
properties (device-wakeup-gpios, interrupts, reset-gpios) required by
the nxp,88w8987-bt binding are missing from this node.

Without device-wakeup-gpios and the wakeup interrupt, will the
btnxpuart driver be unable to perform power management signaling and
break sleep/wake functionality? Also, without a driver managing the
bt_reg_on GPIO, could the chip remain in reset and fail to initialize?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-ok3568-c-v=
1-0-a0ffd55f5c95@gmail.com?part=3D3
