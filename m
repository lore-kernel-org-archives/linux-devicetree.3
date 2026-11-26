Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681241;
	b=RmXFJvUsQ/2NYlVn//JyH/d6oOzFI2k5fBMcAVHL2aWb2cY3vWbMu8o4Eom81/7n+Fjq
	 wXgvnxdP0cPidlDhx8GXhD/9GWY6d/q0m9rdZVQMDEJeQvmImoFu+0h5UUNvqCEJm1Q0X
	 rFW81bKCkHXMbZ0Q7bNMllbB86LI0+Hv1JFAlXRSoQTVGtkq/at2thXc5djazEqPF9vLw
	 /ZJ0p7dkvKywPdOQizGpLqYrCR9eg0Y2CPK0txnxta+ItE/BeAbeunvm7XtY48aKrFP77
	 Pz7Gb31NdTV6U0KsyIjitfR4QivIWltoFNzba1q31tKJ15gQE+KbYfHxa2EJXGIJreA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681241;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8MoXfeh2bUbLcRuSGlWlZVMBQdNfhhNdGTmnZ5ziRsA=;
	b=2R92qcc8awO5BUpgOEtbjr+P0ep0UGGaZJUcdkIRWtR0BsrXSQUpCFTG4ELtIiprcBG+
	 wZLHNGbjEtB6dlRzPPUkqukQi5wE7N4kdYx4GTbXgxWk+X8FPYF5AlGebm9enH1izQzej
	 ZM46Nl/rdY5cDDJ2hVcOxCRcXdTj+/Lv6mfxAiCOAUYC4LcVGpa6BHKZadCaFfYnP78dT
	 yH27bY2w1fwpf+clHh9QrI3TVW4XWd6z6HiaZY7sz3IlkOPdRFvJtIiXXNFORzKHnr8YW
	 /nABOQaSknRDZDxfU/P6/LzFiCNf2F6hBL9a3PVgTBL2xsoMY2TZxXn1RwLeWWBnVmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JUGHEypB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EB7606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JUGHEypB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A4A1F000CA;
	Thu, 26 Nov 2026 08:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795681240;
	bh=8MoXfeh2bUbLcRuSGlWlZVMBQdNfhhNdGTmnZ5ziRsA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JUGHEypB2glrp4DtYShZVDUebix8+M/pIyShyKsQzakB+VQZKxjlDIYR5+WkvgLJ4
	 Nc+dMIi15CsYxh2pxpOR5DEbvlQAU3LN7uwWr+mhGfABEM5OuOldhNsap4S5GZXs8S
	 xZjehZZ2Hoss48dAhz7uOOQjCoUrALPIWt5nCPpZTaLN2OnclgJPAot+QYzBeok4iE
	 En775HnvMeMbZ7Am3Wy+gyDHgLy25bZOxXLdklyTO/rDsC/x4+PExm9oXx04AslIIW
	 CTQMAfur+4T9VwItYprP4KzBH6jkOtDdaybBj84FkkwMr2jTqno2V5KyIt8pfkvfMm
	 z5F8ByrJKGwDQ==
Message-ID: <sashiko-outbox-235000@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iio: light: add ams OSRAM TCS3430 XYZ and
 ambient light sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Ijtsma" <robertijtsma@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-iio-tcs3430-v2-2-6c5329d20919@gmail.com>
References: <20261126-iio-tcs3430-v2-0-6c5329d20919@gmail.com>
 <20261126-iio-tcs3430-v2-2-6c5329d20919@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 08:20:40 +0000
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
- [High] iio: light: tcs3430: missing MODULE_IMPORT_NS() for
  IIO_GTS_HELPER
--

commit 9c9099b900a36ddd44ef9f19ed6ed7bc1729939f
Author: Robert Ijtsma <robertijtsma@gmail.com>

iio: light: add ams OSRAM TCS3430 XYZ and ambient light sensor driver

This commit adds an IIO driver for the ams OSRAM TCS3430 ambient light
and CIE 1931 XYZ tristimulus color sensor.

> diff --git a/drivers/iio/light/tcs3430.c b/drivers/iio/light/tcs3430.c
> new file mode 100644
> index 0000000000000..226568c95e8da
> --- /dev/null
> +++ b/drivers/iio/light/tcs3430.c
> @@ -0,0 +1,489 @@

[ ... ]

> +MODULE_AUTHOR("Robert Ijtsma <robertijtsma@gmail.com>");
> +MODULE_DESCRIPTION("ams OSRAM TCS3430 Ambient Light and XYZ Color Sensor=
 Driver");
> +MODULE_LICENSE("GPL");

[Severity: High]
Does building with CONFIG_TCS3430=3Dm fail in modpost without
MODULE_IMPORT_NS("IIO_GTS_HELPER")?  devm_iio_init_iio_gts() and the
other iio_gts_*() helpers called by this driver are exported with
EXPORT_SYMBOL_NS_GPL(..., "IIO_GTS_HELPER").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-iio-tcs343=
0-v2-0-6c5329d20919@gmail.com?part=3D2
