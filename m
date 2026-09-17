Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8E24ABBB0
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660016; cv=none; b=eENkvSq/FFcQi+a3eDuy04gD6muz3k0GPqgt3VilJQJUPbYcMBUz/osrE37UJ5V4ZXrWqYsjKQE+iQYymYGoUpCPR0B+UZPA/pcqdVBSZ3KonFIe5wXDVOVW3ZZYfmeIjflO7x+kc2JDvvDgdSXJDMhJLKRROeGMe53jazrzcBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660016; c=relaxed/simple;
	bh=sr8H9GZGOnliSox7FomxpwHs5OMD/0Nc5of0YgMQl8I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cIr+WEf71kxPw9zXYAUmYE6+42kxA+XJOzjet9j/4b9n5O66/0BwcRHzeG6MEN7khlV+V/QVQ1aUk5BWFJoluVhI4gtpLeeEz8kIpJpInTvn0Ymsxzv9oUFKyAb/+f4edC5D2JOA9PnHzApAQlVq+m+1Nbg86s/VVicJ1PsUSIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWgVugYk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWgVugYk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CEAE1F00899;
	Thu, 17 Sep 2026 15:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789660007;
	bh=dDzTXKmJWnogvHbKdb5OW9MKOPuliVETZo2YEkZhAac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RWgVugYkH0XmFaxwH0uPxIrNtaTWzP5MRhZYWUY3CyMEJYaEGGh/Umh47AetAvETD
	 LdK/+IW2GmzzsAxfX33S19UfqoWOTooISg/uIBTNV7HcBt157o0Snm549l3qA6r1Az
	 2LrQwd52OMaIJB9GLqrkqf4v1XcJDqKqQ3g2GiVjffYW8QJjWbR3HCYxXxy3/SR4bY
	 C6fRa8lmB3m8OfSLenkDu5KftRmIYpUQJdHhTmUO6PoUKAz7JRg267FM8E1dle9PQa
	 9o++OAnyxtMmjmu8oZ/VfCoLKgfGPJT9SjPnUDzVRt/Tl4Iwcv8d/riJCSy/IpTkzg
	 /91N6HGOOBgYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] spi: dw: Use the rx-sample-delay-ns value parsed by
 the core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frieder Schrempf" <frieder@fris.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260917-spi-sample-delay-cleanup-v1-3-0e4eddbfb1ce@kontron.de>
References: <20260917-spi-sample-delay-cleanup-v1-0-0e4eddbfb1ce@kontron.de>
 <20260917-spi-sample-delay-cleanup-v1-3-0e4eddbfb1ce@kontron.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 15:46:46 +0000
Message-Id: <20260917154647.4CEAE1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] spi: dw: unable to override controller rx-sample-delay-ns to 0
--

commit 32c003f916e2933421d0880f812a21d5785775b7
Author: Frieder Schrempf <frieder.schrempf@kontron.de>

spi: dw: Use the rx-sample-delay-ns value parsed by the core

This commit drops the private parsing of the rx-sample-delay-ns property
and uses the value parsed by the core into spi_device.rx_sample_delay_ns.
It falls back to the controller-wide default when the device does not ask
for a delay of its own.

> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index 206d3f9dd83d4..b86b607cc8179 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
> @@ -1104,12 +1104,13 @@ static int dw_spi_setup(struct spi_device *spi)
[ ... ]
> -		/* Get specific / default rx-sample-delay */
> -		if (device_property_read_u32(&spi->dev,
> -					     "rx-sample-delay-ns",
> -					     &rx_sample_dly_ns) !=3D 0)
> -			/* Use default controller value */
> -			rx_sample_dly_ns =3D dws->def_rx_sample_dly_ns;
> +		/*
> +		 * Use the per-device value the core parsed from the peripheral
> +		 * node, and fall back to the controller-wide default when the
> +		 * device does not ask for a delay of its own.
> +		 */
> +		rx_sample_dly_ns =3D spi->rx_sample_delay_ns ?:
> +				   dws->def_rx_sample_dly_ns;

[Severity: Medium]
Does this ?: operator prevent configuring an explicit 0 ns delay?

The previous code used device_property_read_u32() in dw_spi_setup(),
which allowed an explicit value of 0 to override the controller default:

    if (device_property_read_u32(...) !=3D 0)
        rx_sample_dly_ns =3D dws->def_rx_sample_dly_ns;

By using the ?: operator, a parsed value of 0 is treated as falsy,
meaning an explicit rx-sample-delay-ns =3D <0> in the device tree will
now fall back to the controller's default instead of overriding it to 0.

Although the commit message states there are no in-tree users relying
on this behavior, Device Tree is a stable ABI. Does ignoring the explicit
override of <0> break backward compatibility for out-of-tree configurations,
potentially causing SPI RX data corruption on boards that require a 0 ns
delay?

>  		chip->rx_sample_dly =3D DIV_ROUND_CLOSEST(rx_sample_dly_ns,
>  							NSEC_PER_SEC /
>  							dws->max_freq);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-spi-sample=
-delay-cleanup-v1-0-0e4eddbfb1ce@kontron.de?part=3D3
