Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456A4440A2B
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737483; cv=none; b=qMx/bbMHJAWZQAAF8am2xg4F0eej6gNUaYzZqwz2h9GtouTRrboETwjLILc76pa+atcqFTGDIbCbkqZmk3HfD/NCbARg0srh6b5C/gnVIQ5xJJAKVZgkV01bS6h1RDKcxXQCQ+/a7NgxLnHZs8uC7JHuyqj7Yqalm+zygnOhJeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737483; c=relaxed/simple;
	bh=F3trAcSBLIpPlnZvU0eilHB217Zaytq3x/j+rwuQGf0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HlDxVH6s29w+3IBwkzIk1+aCfBYkOODp0K8l2h8QNtirWpqB/KYxkgf/hiZKZ65gY7mcJn0AtFGwFlsZIy3+JH+dVkOINwquPee2uXO6xkQ8qQplpFIvPoSr6DhCDin7Li6QRurnwXloOyxJKq+nSTJylnibV9jGQPmGxkqOn54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOlji2Nn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOlji2Nn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7F21F000E9;
	Wed, 22 Jul 2026 16:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784737480;
	bh=fPY03BIWb5jmLxMWdPCiSnMop+wicZGuseavKVOVjug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kOlji2NnO+FIuWWbONRasfv3UnmbMLGWohU3GNSYkk3FM2WA/umjDxbXpvRxGx1V5
	 E/8VPXmHUsNbmDAMgmum4j1hFP1Orun8vJTkTXyMIgWIzbrL+dwO7nbgal4KPbjmnf
	 70Yh5fpOxIAL97gT04MPlFVpnnUjX42JZBM0gSleK5suG2cP0txSTnT1DNnMeKmJ8I
	 N14Gz2gJpkM3NajNvJtQ1m1U45k7YtYheut8PoxqlFrLybzmZCcvT9NTyblZ8AX2Pl
	 6dL5tF6xFXNZ/tQa0HjCRiRfxY2T8dmLl9j7OTy7IKaJRJ1tHgJMWU7wlId/l2DWWY
	 ozj9wvh9kCc1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 10/17] iio: frequency: ad9910: initial driver
 implementation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-ad9910-iio-driver-v9-10-459d1df5ac56@analog.com>
References: <20260722-ad9910-iio-driver-v9-0-459d1df5ac56@analog.com>
 <20260722-ad9910-iio-driver-v9-10-459d1df5ac56@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 16:24:40 +0000
Message-Id: <20260722162440.8A7F21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `adi,refclk-out-drive-strength` device tree property is sile=
ntly ignored when the internal PLL is disabled.
--

--- Patch [10]: [PATCH v9 10/17] iio: frequency: ad9910: initial driver imp=
lementation ---
commit 82b3fbe21cfa117c3a6f9b7b61ab5f4eb04cb69b
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: ad9910: initial driver implementation

Add the core AD9910 DDS driver infrastructure with single tone mode support.
This includes SPI register access, profile management via GPIO pins, PLL/DAC
configuration from firmware properties, and single tone
frequency/phase/amplitude control through IIO attributes.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> new file mode 100644
> index 0000000000000..b41b011af2812
> --- /dev/null
> +++ b/drivers/iio/frequency/ad9910.c
[ ... ]
> +static int ad9910_parse_fw(struct ad9910_state *st)
> +{
[ ... ]
> +	st->data.pll_enabled =3D device_property_read_bool(dev, "adi,pll-enable=
");
> +	if (st->data.pll_enabled) {
> +		prop =3D "adi,charge-pump-current-microamp";
[ ... ]
> +		st->data.pll_charge_pump_current =3D tmp;
> +
> +		prop =3D "adi,refclk-out-drive-strength";
> +		if (device_property_present(dev, prop)) {
> +			ret =3D device_property_match_property_string(dev, prop,
> +								    refclk_out_drv0,
> +								    ARRAY_SIZE(refclk_out_drv0));
> +			if (ret < 0)
> +				return dev_err_probe(dev, ret, "property read: %s\n", prop);
> +
> +			st->data.refclk_out_drv =3D ret;
> +		}
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Does this inadvertently ignore the "adi,refclk-out-drive-strength" property
when the internal PLL is disabled?

Because this property is parsed inside the if (st->data.pll_enabled) block,
the reference clock output drive strength cannot be configured if the PLL
is disabled. This occurs even though the hardware supports outputting the
reference clock independently of the PLL state.

Should the parsing of "adi,refclk-out-drive-strength" be moved outside of
this conditional so it can be utilized in all cases?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-ad9910-iio=
-driver-v9-0-459d1df5ac56@analog.com?part=3D10
