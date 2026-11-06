Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794003677;
	b=iPz1zwO/9NDRe5ig9ex/Tb4n8H3MC4eDq6lRNw3Y4YxMEbBbK3GUKob+7C1hqfjdNPJ1
	 JwJjBouNqpmt4vByB6T/yfKY4e5CnheMXk69b9oKL5DWZDALIXhJ0pJR5un/Rz9KNcKDi
	 gkxIhjKn8hUZwRZQza7hNKBoZRU8xWJicuNpz5gZf3s2L/0tYlqte0pazYhki6H3km9tF
	 G3kRSGHD5I1mIpZ/g81kRocCcjaj5bF+/UgfQx8aCzlGQlPZ7DlnvnNRAZKB3TVK0p7WO
	 URL3XUiKBuzEWPHbDKSxAHAsjHCUHijU6GYQNZgruyyJzW/+7lkMNvnuzQY9Mfi2XlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794003677;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ptrcrbsHpZ+HqGplGzOyzsXuGESyrMf4p+/EFVcTmbU=;
	b=hZPJbuF2AOvxxJkpQMey/6x2+x3lGcKTe4PSfiKvSPt8vQiYvOuqgkP6GbRKpg4E62aW
	 aAWc59qcDPiIKGMGhWWjQkyKRbEO7fwgXf45BNAGZJdZHm86vjNZ9pRi7s3bgu6a1erA0
	 i45N/2qeY5RYlHIC9L3WPrybTed0QM+DwfFuFnhOEaA7IUsWdOQFJnRPMl7CSELNpTKbr
	 Yf7hhwE0tX0wuJ5R0eAX/gwT+QPX5Yr2u24jw8QiXSNmP/iN2KBWzAHmfmu8N9qQM7Pxm
	 gDzZ/CqqTe5LNoJY0vCXt7rQBHy3xSMs+a03b6v9tFovgAwbGZtbecCdKutlx5pZEbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V7VQOUqu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60397606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 22:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V7VQOUqu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985031F0089F;
	Fri,  6 Nov 2026 22:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794003676;
	bh=ptrcrbsHpZ+HqGplGzOyzsXuGESyrMf4p+/EFVcTmbU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V7VQOUqulCCgEcaIY1q88N19LFohNbf6LMv3xg8leGFBaPpLz7gUzJM48ZmasA8yg
	 D1sDv4Y0brm+WXOOFxVoeyhfeEIR57Vu9lFWk/VXwlfMjUmUCKOQ50ZipkD+diJaKI
	 BMsrMMJgW+J69I7fucxTImO+X3bqxqR0ZGjjaCZESqAeSNkbb+27Y3zpiVVGwqVUFd
	 MiXnSVngaYNyMhD/y7vRor6P0yXktnnVy3ereWh3oVK2ObMI7ugjvDLqdbs+yT90r+
	 vRuEo0Ii+F5U6Hu7DAaNd41sg01s5Sz6ieZbLVXphDi4Ti/wTTTGdbUmgRA7EGPJIM
	 oDRHdO7kaAjhQ==
Message-ID: <sashiko-outbox-202325@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-rk3588-evb1-dt-updates-v1-4-bdbe16223589@collabora.com>
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
 <20261106-rk3588-evb1-dt-updates-v1-4-bdbe16223589@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 22:21:16 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: rockchip: missing irq-gpios in rk3588-evb1 gt1x
  node
--

commit 835c4b16ada6b31743a047c67f574eb288523de2
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

arm64: dts: rockchip: Add DSI panel to RK3588 EVB1

This commit adds Device Tree nodes for the Wanchanglong W552793BAA DSI
panel and Goodix GT1158 touchscreen on the RK3588 EVB1 board.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm6=
4/boot/dts/rockchip/rk3588-evb1-v10.dts
> index 6a95a8bb6fb80..327ca13b60f09 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts

[ ... ]

> @@ -495,6 +541,22 @@ hym8563: rtc@51 {
>  	};
>  };
> =20
> +&i2c6 {
> +	status =3D "okay";
> +
> +	gt1x: touchscreen@14 {
> +		compatible =3D "goodix,gt1158";
> +		reg =3D <0x14>;
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&touchscreen_pins>;
> +		reset-gpios =3D <&gpio0 RK_PD2 GPIO_ACTIVE_HIGH>;
> +		AVDD28-supply =3D <&vcc3v3_lcd_mipi>;
> +		VDDIO-supply =3D <&vcc3v3_lcd_mipi>;
> +	};
> +};

[Severity: Medium]
Should gt1x also specify irq-gpios =3D <&gpio0 RK_PD3 GPIO_ACTIVE_HIGH>?

In drivers/input/touchscreen/goodix.c:goodix_get_gpio_config(), the driver
requires both irq-gpios and reset-gpios to enable GPIO pin control:

drivers/input/touchscreen/goodix.c:goodix_get_gpio_config() {
	...
	default:
		if (ts->gpiod_int && ts->gpiod_rst) {
			ts->reset_controller_at_probe =3D true;
			ts->load_cfg_from_disk =3D true;
			ts->irq_pin_access_method =3D IRQ_PIN_ACCESS_GPIO;
		}
	}
}

Without irq-gpios, ts->gpiod_rst is left in GPIOD_ASIS and never used,
preventing goodix_reset_no_int_sync() from resetting the controller and
strapping the INT pin to select I2C address 0x14, and leaving
ts->irq_pin_access_method as IRQ_PIN_ACCESS_NONE so goodix_suspend() and
goodix_resume() become no-ops.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-rk3588-evb=
1-dt-updates-v1-0-bdbe16223589@collabora.com?part=3D4
