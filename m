Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7554DA528
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786046813; cv=none; b=bKGblUBYBza4axjTonRTitFmQzKYupk70si/xwrMqtgQi+KWGtAXz5dowSu8/r2cG5b3vcCy131iKDGmy27ELqfuz0fbOKT9uWimNalJxAXXGqy9YmCG711LoZmeNXePF3fxs4QXzbYPTMyY08p8MW3IJMSPyr0ta6LcvXdUVLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786046813; c=relaxed/simple;
	bh=vFZPKNs2dl6VZZjgQFQ8qk9/Wk/ihKsiXb9wColFe9I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PIkG0YVQjTyS+0YLuhIA42slkdlJlS9O1MUnPJsThZMV4/PW3lTjwoZEvYF0WgSo96z/R5kcvB3yhqZi9/oAHZkOjH9DSIsYzJop+nbc0GpKsTJ3G19OSMAdvcn6CN/VGYoEsomtuma+HBAixtRmNH+lLzM31kkkn3s3Txr+i3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1lN9SF4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1lN9SF4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB60D1F000E9;
	Thu,  6 Aug 2026 20:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786046802;
	bh=gfYydA0ckdJVE2ssQsTstUJRYAANnT4legrYNlIQj/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e1lN9SF49XjmVQKU5uMkLDc4FmTAwlILfQpfXuDwoxVZSTlS1Y+5tcWM18t1ll4zV
	 wLUv+7TEEKAbZFGq+5qsvW5KAa5sO0+iv4+5RubJZhrcmR3/Y7dD26kJxHsLxEd6+q
	 Stb3pGANNOkQJ4KTQ7daZyeME5/LSCvcN0ju3hzs2TneLbHaXbGTTZcirZafXA7HyN
	 A/75gd3lDAWkEmTRsUMLLpYtRPcCH+MeSUh+u9eNy3atDVfvgPz9oNSUs4xzTlXA0E
	 Bwvfl/T/YQHlvA53DnwAQSp4OteTMKhomYKpry47o7SrOZh7Y+KmdqtXJXAWYLMfma
	 wiT5BuF8Qb9uA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: exynos7870-j6lte: add Sharp
 GP2AP070S proximity sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807-gp2ap070s-v4-3-74f6a67b6272@disroot.org>
References: <20260807-gp2ap070s-v4-0-74f6a67b6272@disroot.org>
 <20260807-gp2ap070s-v4-3-74f6a67b6272@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:06:41 +0000
Message-Id: <20260806200641.EB60D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The devicetree node `i2c-proximity` uses the software bit-banged=
 `i2c-gpio` driver, but its pinctrl node `i2c_proxm_bus` explicitly configu=
res the pins to the hardware I2C controller's alternate function instead of=
 GPIO mode.
--

--- Patch [3]: [PATCH v4 3/3] arm64: dts: exynos7870-j6lte: add Sharp GP2AP=
070S proximity sensor ---
commit c0b785824301e0a2b3734b066c904e45cdad7f77
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

arm64: dts: exynos7870-j6lte: add Sharp GP2AP070S proximity sensor

The commit adds a Sharp GP2AP070S proximity sensor to the exynos7870-j6lte
device tree. It connects the sensor via a GPIO-driven I2C bus and provides
necessary regulator supplies.

> diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64=
/boot/dts/exynos/exynos7870-j6lte.dts
> index de30d0970336f..dd493138fed6e 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
> @@ -73,6 +73,35 @@ key-volup {
>  		};
>  	};
> =20
> +	i2c-proximity {
> +		compatible =3D "i2c-gpio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&i2c_proxm_bus>;
> +
> +		sda-gpios =3D <&gpf4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios =3D <&gpf4 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

[ ... ]

> @@ -579,6 +624,12 @@ bt_enable: bt-enable-pins {
>  		samsung,pin-pud =3D <EXYNOS_PIN_PULL_DOWN>;
>  	};
> =20
> +	i2c_proxm_bus: i2c-proxm-bus-pins {
> +		samsung,pins =3D "gpf4-3", "gpf4-2";
> +		samsung,pin-function =3D <EXYNOS_PIN_FUNC_3>;

[Severity: Medium]
Is it intentional to configure these pins to the hardware I2C controller
alternate function (EXYNOS_PIN_FUNC_3) while using the software bit-banged
i2c-gpio driver?

During device probe, the pinctrl framework will route the pins to the hardw=
are
I2C controller.

This contradicts the bit-banged I2C design and creates a window where the p=
ins
are driven by the hardware controller before the GPIO framework eventually
overrides the pin multiplexing.

If the hardware controller isn't powered or properly initialized, could this
cause the pins to float or drive the bus incorrectly, leading to I2C bus
glitches?

> +		samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
> +	};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-gp2ap070s-=
v4-0-74f6a67b6272@disroot.org?part=3D3
