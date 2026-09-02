Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576D742255C
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 09:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341950; cv=none; b=F1j6AWw+bN9OGu4M+ruZFOeFh/nVNlYlRruT1pvjS9MwKDbatGglt0Se33LrtX4YDGUGfphLVUJF2XeNJf4A9xfuEvQsmH9A0j2omZHDjGWj3uWS0ncphKprBG/3W5OehKY3l4pKsifRDxltxYqqluz1YcRrBmZMEpCEz/dDH5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341950; c=relaxed/simple;
	bh=GKrj19cmMqpK8lE3xDcFK5i0QStnLV54GCVcA8nbY9M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bLnDjn51lrB9jXWsFWp8MHnmKDJoWRy6Ai9BEbZWvxWPrC3Ln0Y6LSkGPbKFUc0+LtSodBiq1HavCAcRCX2OIZrbk201GAtlYAWB6BXMGuqMtnQnYuulcbGdfHiYzoZQVaIfG1+FGB9DJr3yebDy8MjCd9ChHyXJoLPt3CrEJSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9WGh6f8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9WGh6f8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DF51F00A3A;
	Wed,  2 Sep 2026 09:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788341948;
	bh=RDs8AvdQ2lqW70J6D5KmqXxyj1ifHxG5Uu+3WUC81qk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b9WGh6f8651PUkngXxuaX1V+Cka6CEugfhRNlsdiJTL8JlZMZe8iPqiyMBT0bygxr
	 /zKAaFk4W2QnjJu+0ZBZ7TT4GVKNbqNfkf1Bi0xrFjwnT0pdJv2dmyLDyJY97rXF11
	 a9A+9VExoJpA3iUGixcl8OJMC1/lqDiwvOd5sqtWtG5MplbyAK6tKXJ8CAtUqxSlj5
	 AMTObg2VxdSK9MCZCiMSlIEsOm25WPB4l01Te5cw8E+ANseWugIZm9JUVOnuAEbviH
	 A92VSmN1Ob5y3hk0JnDwY6GDMPpU8M6NSMMLHrfoShwHKgezqRxxPjE6k6Y09k4DE3
	 c395nVk4uV6sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/3] iio: dac: Add AD5529R DAC driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902-ad5529r-driver-v11-3-301c491a0719@analog.com>
References: <20260902-ad5529r-driver-v11-0-301c491a0719@analog.com>
 <20260902-ad5529r-driver-v11-3-301c491a0719@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 09:39:08 +0000
Message-Id: <20260902093908.A1DF51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Selecting REGMAP_SPI without inheriting its dependency on SPI cause=
s unmet direct dependency warnings.
--

commit 4f95e4db1e621b9be7d174948b61e89bec2d8d32
Author: Janani Sunil <janani.sunil@analog.com>

iio: dac: Add AD5529R DAC driver support

This commit adds support for the Analog Devices AD5529R 16-channel, 12/16 b=
it DAC.
The device communicates over SPI and supports per-channel output range
configuration and an optional external reference.

> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
[ ... ]
> +config AD5529R
> +	tristate "Analog Devices AD5529R High Voltage DAC driver"
> +	depends on SPI_MASTER
> +	select REGMAP_SPI

[Severity: Low]
Will this cause Kconfig unmet direct dependency warnings and subsequent
linker errors if a user configures SPI=3Dm?

When SPI=3Dm, the boolean SPI_MASTER evaluates to y. This allows AD5529R to
be configured as y, which in turn forces REGMAP_SPI to y.

Since REGMAP_SPI depends on the SPI tristate symbol, selecting it without
inheriting its dependency on SPI can lead to undefined references to SPI
core functions during the vmlinux linking stage.

> +	help
> +	  Say yes here to build support for Analog Devices AD5529R 16-Channel,
> +	  12-Bit/16-Bit, 40V High Voltage Precision Digital to Analog Converter.
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-ad5529r-dr=
iver-v11-0-301c491a0719@analog.com?part=3D3
