Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874576;
	b=olxCPvRRhCstqZvAclGDtQushhnCO/tVrIZitQ1LeoLec7hai125Mu5gcWTSIuR8eRQI
	 CvcW2pGthdKfEjX72gH7R4Z4X+Ebccja1KAuAN8sr2Unqx+eO9EdMRZ3VJzp0WsZVkqdo
	 UamBLaT4CfLg4ltrXuoKkvxWTTEzsi9zN1iOYZEydlnGtd+7tP3k9d03KrcV1SBhT6Qpp
	 dv9ycQy+w/a3d4/b4uL0b9Ur7eED+B6NWQLU2n8quDp4gB2lTP2/l08DwWmq91UZ/NXdZ
	 clENtkEG+Cjf5H0Eol8FeBy2kkr1JyeC3NEX81QGao/XMF3O7qtsEhZ5iwWzFkkFq5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874576;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=f8gyo1rnSTEJbRSEUMtaQaoj7Qcvj5xdI6+EB+2GHqs=;
	b=bebJmTC3JPCvb0B4mR8poKCIkmPtCosaTM0POIykoN1Y67JFUKlvWrxbc2AbKsEHBJ8A
	 n37tpaEky4G/ZXcv2/p7ApSKs2VV9g2xM4IiWsEtjin94lr1FUpxrkJynEymN2MN6MgZA
	 fJnv/46SX/s8Ys1gQYe9zQrLwaQb/i5DTH6AYK17f7PY8J11sTlck5J7GsAnLPJF+JIHa
	 8CXc8dFX/vSGwvpQssNcXjIomE7s0HiiZvEg/4wpGQXKFYOKl96EPzm2o/XyjFOR+knmO
	 /dWpPnQTMQro0XnC4e5EH8vKVKxKmG0KEn/2V4GlCUmkGUBvah3fOOtkpffdpZhwNJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TPL+SJZs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43617606A31C;
	Sat, 28 Nov 2026 14:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TPL+SJZs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63631F000C1;
	Sat, 28 Nov 2026 14:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795874575;
	bh=f8gyo1rnSTEJbRSEUMtaQaoj7Qcvj5xdI6+EB+2GHqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TPL+SJZsDShoFUqDjuijbXH6CAPqfOhKu6hjw+/Ih7IDVKjp+myXMkJ0D8YyoeaAK
	 PhyBrKU7zB4DFQkheQLZfVII/jq17CedkmxjKgWz+VuSO9PH85FPukx6ZbJeQw2p6m
	 gISgYWyYT40gCU+ixfg0ZusG/zm3rKhpp42Szpp6t5xYdQ1hbOzp7/eCTiCtgaqZwt
	 sbGsFyus3mJPDSHoOTDi8Dy+Ty30IEecitm+OZHTfHm1is4Ce5vGXtgyREeV6/gTCH
	 IqYt0N882kNVmNd/CC1ZB8wjTrhktwE0Ssx27Q6hh+PfX1G3Y0wbyo2DjtF4GCbN3c
	 9RPVVYmPtYk8w==
Message-ID: <sashiko-outbox-238740@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: exynos: gs101-raven: add S6SY791
 touchscreen
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukas Timmermann" <foss@timmermann.space>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dmitry.torokhov@gmail.com
In-Reply-To: <20261128-lat3st-google-raven-touch-upstream-v2-6-1be5c1029087@timmermann.space>
References: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
 <20261128-lat3st-google-raven-touch-upstream-v2-6-1be5c1029087@timmermann.space>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 14:02:55 +0000
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
- [Low] arm64: dts: exynos: gs101-raven: ts-spi-sel-hog fails dtbs_check
  schema
--

commit 4956cc236c302ae7a7f06836c43a33f12e1e269f
Author: Lukas Timmermann <foss@timmermann.space>

arm64: dts: exynos: gs101-raven: add S6SY791 touchscreen

This commit configures USI11 in SPI mode, adds the Samsung S6SY791
touchscreen node, and hogs TS_SPI_SEL low on gpp26 so the AP owns the
touch SPI bus.

> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm=
64/boot/dts/exynos/google/gs101-raven.dts
> index 7c4273796a228..02b19e39055a6 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
> @@ -47,3 +47,53 @@ &framebuffer0 {
> =20
>  	status =3D "okay";
>  };
> +
> +&gpp26 {
> +	/* TS_SPI_SEL: low =3D AP owns the touch SPI bus, high =3D AOC */
> +	ts-spi-sel-hog {
> +		gpio-hog;
> +		gpios =3D <1 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name =3D "ts-spi-sel";
> +	};
> +};

[Severity: Low]
Does adding ts-spi-sel-hog under &gpp26 cause dtbs_check to fail on
gs101-raven.dtb?

gpp26 (gpp26-gpio-bank) is validated against
Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-gpio-bank.yaml,
which sets additionalProperties: false and does not define a
patternProperties entry allowing gpio-hog child nodes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128-lat3st-goo=
gle-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space?part=3D6
