Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80473C942B
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769286; cv=none; b=HNh05topsd6N55D8UavxImoLYbwJn32VM9sG2HmMhyjvhB8g3zZnubZ4gvm8cUu4cVtMxTkih8ODTo5EbR1YTFimpS7xPj3o4px8x3q770KPjF4umM0pNG9G11dyLHK0hfru+Q1kv9vcBpjdSa/QbJ4bY1EGeI05SPIP8AuLv00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769286; c=relaxed/simple;
	bh=tHBvNdQUrZBKfZtpH3uB5y+nnXugzskyI6HpuNdyqok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EenoLgS9Xmi/UtiqS52C9g0dIYn0cuW6AbY4lIIT3eJ8eXLBdCpDMmg3r7edjMLMABHQsCllzqSgX5x+0AGaJ4nfjF97Fw9MKUXWSa+/BqtQjGf2jF8cM4fInY8FlxpFOeKRZ0kn7rQ8g8qOJA+cVPzkZmXKljWoi2XEmDTl+wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A7AlnvSp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A7AlnvSp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389E11F000E9;
	Thu, 18 Jun 2026 07:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781769285;
	bh=SWyrw0vlr7eqU/59XAoQf1TIp8svsMNE84YRRR+4RxI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A7AlnvSpcAzH4RSlMM5+C+BmqKIIERraaTX2wrqtz3bruqK01fdV5el/DfOzLUm6o
	 VEGPLGCgWl4kDSelH8MFHZFfTa//WDwd5v9LXjH2mlNwx1ouzfgJzYj3rYU+v1owHc
	 /kj6swSe1XHiGMg7H7q3uStk8q1F6WUuiBkUkYTj4a3ZIdMa+fR71JKsH8pJTIoJvz
	 Sqre7NF+GfWoFQjvfmBAUS7Vg/9qq8nM1B8A0Lfv3XlhCMVta+u1Ncrmu1g4PdSCZ1
	 /twYpVfLdQXz7ryIBc8yii4HloLTFX9y6qum2lMvXsOr1WsL3DqHy8vVLm6Z7Tof/Q
	 5oblPytJlHHag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/16] spi: parse spi-max-post-config-frequency into
 post_config_max_speed_hz
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260618073725.84733-4-s-k6@ti.com>
References: <20260618073725.84733-1-s-k6@ti.com>
 <20260618073725.84733-4-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 07:54:44 +0000
Message-Id: <20260618075445.389E11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] spi->post_config_max_speed_hz is not capped by the SPI controlle=
r's maximum speed in spi_setup().
--

commit 7b33747ab555fad6b7ce057a971c3935bb2ff311
Author: Santhosh Kumar K <s-k6@ti.com>

spi: parse spi-max-post-config-frequency into post_config_max_speed_hz

This patch adds post_config_max_speed_hz to struct spi_device and parses
it from the spi-max-post-config-frequency device tree property. It allows
SPI devices to operate at a conservative speed initially and a higher speed
after controller-side configuration like PHY tuning.

> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 104279858f567..c423d5c9af202 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -2601,6 +2601,8 @@ static int of_spi_parse_dt(struct spi_controller *c=
tlr, struct spi_device *spi,
>  	/* Device speed */
>  	if (!of_property_read_u32(nc, "spi-max-frequency", &value))
>  		spi->max_speed_hz =3D value;
> +	if (!of_property_read_u32(nc, "spi-max-post-config-frequency", &value))
> +		spi->post_config_max_speed_hz =3D value;

[Severity: Medium]
Does post_config_max_speed_hz also need to be capped against the SPI
controller's maximum speed limits?

Currently in __spi_setup(), max_speed_hz is explicitly checked and capped
against spi->controller->max_speed_hz:

drivers/spi/spi.c:__spi_setup() {
    ...
	if (spi->controller->max_speed_hz &&
	    (!spi->max_speed_hz ||
	     spi->max_speed_hz > spi->controller->max_speed_hz))
		spi->max_speed_hz =3D spi->controller->max_speed_hz;
    ...
}

However, post_config_max_speed_hz skips this validation. This allows an
uncapped, out-of-bounds frequency from the device tree to be passed down
to controller drivers. For instance, an excessively high frequency could la=
ter
cause a divisor calculation underflow in drivers like cqspi_config_baudrate=
_div()
when the frequency bypasses the max_speed_hz cap.

> =20
>  	/* Device CS delays */
>  	of_spi_parse_dt_cs_delay(nc, &spi->cs_setup, "spi-cs-setup-delay-ns");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618073725.8473=
3-1-s-k6@ti.com?part=3D3
