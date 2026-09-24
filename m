Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714D5446053
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790241310; cv=none; b=XfYVsmJMox7x4iWsGg6lWM+Ibc7t/QZmMqCdyEDRfOMeVMYeEkuRYLqfZAZu+lYHBhcXQDDDRgio29a2SzrX98iKtTjY85ZxWTS/+ut8pTfDN3Mew+751C6Z6aYl9Q6CPIiSzZLh0D2HkE6Z+6icj1uzZWAAX6fe3LKvOH1HgoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790241310; c=relaxed/simple;
	bh=Ck1Z/T3gP6aul5ElqB1BGjob7Y24xo3hfyzJGlPgwBM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NaAU3eBZuRvJlqwlgjxZjIgXVKSkufO/U80N5s3es3bN5ZxCqaZ03h/QUSoQMpLXeYb8nXzYKQJSESVIuw1vnz4fLfjXhVncWzq0vjPjv1jLmuvbjFvq8hYyEn135UI8bIP/tFZ5iToScnrhbIjg4w/Sh/nYXKZ/eAWqYRNhbf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izz6cBwj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izz6cBwj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83E81F000FF;
	Thu, 24 Sep 2026 09:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790241309;
	bh=fmDJfFI0lF48CCcNrKbgdI6Fu8xEpIFtC4lYA5ntwyo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=izz6cBwj9q3Pm++tjAO+wdy9wBCyYGpv7By1CknIRgcqcH9dBCG/UDR0Zu8G76F0W
	 QMR2H2o55diCiW7kV0+Xs9jlErL7i8jfMM8rTAFqX5ugugzlu1yJg6przbGUCmsAJ1
	 rb30W2efJ1V15fwXHWdYI/OCvzpYWI2dyu7JtfwAriSDeEuuW58FyvWDB3zOQ4Yylv
	 cSv4gAmCU480inPCSkR11xnECMm960YrRRUmEzhyeMP3w41bMa6orPT2P0rx5I8uGn
	 KLAC4DTGB4grbGfRmFJ6Zl+eap9M0X7tFCf0OKEk5L4micqbGzqcMEHiz70LjwtwXZ
	 Lhn9+Xgd029dw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/7] ARM: tegra: lg-x3: Add light sensor node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260924090608.28734-5-clamor95@gmail.com>
References: <20260924090608.28734-1-clamor95@gmail.com>
 <20260924090608.28734-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 09:15:08 +0000
Message-Id: <20260924091508.E83E81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt: incorrect interrupt polarity for apds9900 sensor
--

commit 373b2db230a91414c156f1ebbe3d13fb896ef4ef
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: lg-x3: Add light sensor node

This commit adds a device tree node for the Avago APDS9900 ambient light
and proximity sensor to the Tegra30 LG X3 device tree.

> diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/=
dts/nvidia/tegra30-lg-x3.dtsi
> index 9e720512e7962..74583eb07aa84 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
[ ... ]
> @@ -1106,6 +1106,19 @@ nfc@28 {
>  			firmware-gpios =3D <&gpio TEGRA_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
>  		};
> =20
> +		light-sensor@39 {
> +			compatible =3D "avago,apds9900";
> +			reg =3D <0x39>;
> +
> +			interrupt-parent =3D <&gpio>;
> +			interrupts =3D <TEGRA_GPIO(K, 2) IRQ_TYPE_EDGE_RISING>;

[Severity: Medium]
Is the interrupt trigger type correct for this sensor?

The interrupt trigger type is defined as a rising edge, which appears to
conflict with the active-low (falling edge) hardware signal and driver
expectations.=20

The tsl2772 driver expects to use IRQF_TRIGGER_FALLING when it calls
devm_request_threaded_irq() during probe.

Could this mismatch cause the sensor's interrupt request to fail during pro=
be,
or cause the interrupt to trigger on the wrong edge and miss events?

> +
> +			vdd-supply =3D <&vdd_3v0_proxi>;
> +			vddio-supply =3D <&vdd_1v8_sen>;
> +
> +			led-max-microamp =3D <100000>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924090608.2873=
4-1-clamor95@gmail.com?part=3D4
