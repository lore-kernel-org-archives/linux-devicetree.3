Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC1442DA53
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 21:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785188535; cv=none; b=g7TJ3h6BP6gdnWExEFGA4ZBOgN7cPgBi3BLjaWDXYKDqDmE9CIzmGV1ZDtdwCYfaGSl+MP/C5JNuDdKbegVdsCE8/zyMzVAbMpVFO0hUvP9Wgq9HFGgNLRMdSvls/6LF8X71SkUlP8+7zHlA+jf/s/ACzI4SoG3IQqXVscpfK+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785188535; c=relaxed/simple;
	bh=ossh8VTXWKeK6wkfT0Oj3d7O+zveco4TqnWeADjsyyE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gp9z2YDyZ4johui9/g0rq8v/ydM3bWhIb8bCaTJUnbKa3HQBz3RGumowOmEJMf6KCavDwN5ZCN4Y4Fa60RpGsHGyFWX+uLTWP3UQpQ+z1duIzU6dlRW0/ARdjaA9tIlBuhNkiWJYHrwoL4UpM7mDQbf3c/PdhzcvvRkOOgz8OMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXvaMuiJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXvaMuiJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D377F1F000E9;
	Mon, 27 Jul 2026 21:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785188534;
	bh=oXfelWwd6SrHqU0HR8fpeZ0z/iYr3UokgM1fO1i70GA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nXvaMuiJ6PefM37tyZbzTkDJgEEn3LGZf+/rBTHIYL/ZH0O258GhILYW6qp9EUBhv
	 UGmaHDqWjIjCNHhhdkNIngtUzeKCJhf5mGg63YIp18GfZcZ1Gcg8BtCIBWCJ2+7+ZK
	 FPAh2ZoFIQF2UEyzp3F05xwr8ZTtG9LOUKangH8lOymNHAXjTlmijtb5PEJwn2qybR
	 EFH8E39DJfU2Ux2sqD2nrEwbDoWHfReePWrP95XLTkpcrydVPdLvu8ItEPtOXpyJEw
	 N7w4drfPDdhLYfE32jXMXapEkvXF0/jD1CKreDd/j+xLl7R3/qlhkM0ouF/rt1ByRP
	 GNZ2kal8xZcAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/6] iio: adc: ltc2378: Add support for LTC2378-20
 and similar ADCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <6cf0b5541cce4816877ebe754ef7fc2f0e30039c.1785186980.git.marcelo.schmitt@analog.com>
References: <cover.1785186980.git.marcelo.schmitt@analog.com>
 <6cf0b5541cce4816877ebe754ef7fc2f0e30039c.1785186980.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:42:13 +0000
Message-Id: <20260727214213.D377F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Holding CNV high during SPI transfer breaks 3-wire SPI wiring mode.
--

--- Patch [2]: [PATCH v9 2/6] iio: adc: ltc2378: Add support for LTC2378-20=
 and similar ADCs ---
commit 4d4231cee28f9742280dd61ed84f85cf3b4e0386
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ltc2378: Add support for LTC2378-20 and similar ADCs

This commit adds support for the Analog Devices LTC2378-20 and similar
analog-to-digital converters.

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2378.c
[ ... ]
> +static int ltc2378_convert_and_acquire(struct ltc2378_state *st)
> +{
> +	int ret;
> +
> +	/* Cause a rising edge of CNV to initiate a new ADC conversion */
> +	gpiod_set_value_cansleep(st->cnv_gpio, 1);
> +	fsleep(LTC2378_MAX_DATA_WAIT_US);
> +	ret =3D spi_sync_transfer(st->spi, &st->xfer, 1);

[Severity: High]
Does holding CNV high during the SPI transfer break 3-wire SPI wiring mode?
In 3-wire mode (where SDI is tied to GND), the SDO pin of the ADC remains in
a high-impedance state as long as the CNV pin is held high.

Since the CNV pin remains high throughout the SPI transfer, could the SPI
controller clock in garbage data from a floating bus?

Would lowering CNV after the fsleep() wait and before calling
spi_sync_transfer() correctly enable SDO for 3-wire mode while remaining
compatible with 4-wire (CS) mode?

> +	gpiod_set_value_cansleep(st->cnv_gpio, 0);
> +
> +	return ret;
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785186980.gi=
t.marcelo.schmitt@analog.com?part=3D2
