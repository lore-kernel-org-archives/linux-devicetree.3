Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AEC377A8B
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 02:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202744; cv=none; b=BW4UHRKanwmqqsm5r06S1yhaVJCeTh2/vHd9leIlOIA9u6c1q5UmgPgwDqa7acbEUX5/NWYX7ADyYBjQ0sQX2etG2g/2TKiJKI//wUjR283OXPa0sFlew1wD+yatziQXAc3Ad7ow4uj2P+SpGOcdstt2FioMJh7UA0XSUSpAGec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202744; c=relaxed/simple;
	bh=+GLX94vcP3yOdU+8OKnyqUaiXWl224Go6iv10tZ7q+U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hoReh4HXzOU8HYAr6V4y8HfOV5Zbtl7ssRIFvWTFfFyn6lDNz4apGSloK4AjOnwIs/VcXnGWxlm8VDWLxoMLvai8IeZ57CNBfvlz7ewHJxKCRth8NOK7iNGFmudvA9kYcCD/g/8tsoExiBIETr0OhXVOJ3rKVKmWYcPUtcMn0tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTgEynFG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTgEynFG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0CE1F000C4;
	Sat, 17 Oct 2026 02:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792202743;
	bh=PxTNUrvpf5bFU4wIghy2KWDH6xsBe7KFl4xUGFzcyFo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CTgEynFGSNXwdCdiS+C0oQOIB2xYhAtHb0O1NvWs9yVPDGZj2V/J9v54LnS6hdnGX
	 jhV1fRoskwykTH8y2TCoa1ZjkUwXfq5Na19GRhi7Dw37xZJqPEV3+/YnDlIb+4PdGz
	 r1jFHnpIuEGyma+4+NgOmNXLgIn8MBQTALNHtqMm6W48ufe9q0ZB1uxI9C2Qf9Z4j3
	 JaMOsCi57fcjMSA+M2N3uyEOf8iqaPtnt95WT/AM3WKZpIexhhi/Bt0tz4ClocUBbv
	 Y8li6cTR+OSXA9givRypCbg5WftOICKLIE8qmCYkPR2Ivl2ZOxW7JhKfIoTgwE0ICy
	 Rat+fu3s6167g==
Message-ID: <sashiko-outbox-175185@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/15] iio: adc: ad4134: Apply reset recovery wait
 time
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <9f6d78d607b2f9a896513535fefa3329d52c4464.1792200021.git.marcelo.schmitt@analog.com>
References: <cover.1792200021.git.marcelo.schmitt@analog.com>
 <9f6d78d607b2f9a896513535fefa3329d52c4464.1792200021.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 02:05:42 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: adc: ad4134: 10-second sleep in ad4134_probe() due to USEC_=
PER_SEC
--

commit 3488776492f80838a5517d1bec747527ca957473
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Apply reset recovery wait time

This commit adds an fsleep() call after deasserting reset in ad4134_probe()
to wait for reset recovery before starting SPI transfers.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 40b27b01f1260..d555874b49597 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c
> @@ -442,6 +442,7 @@ static int ad4134_probe(struct spi_device *spi)
>  		return dev_err_probe(dev, PTR_ERR(rst),
>  				     "failed to get and deassert reset\n");
> =20
> +	fsleep(AD4134_RESET_TIME_US);
>  	crc8_populate_msb(ad4134_spi_crc_table, AD4134_SPI_CRC_POLYNOM);
> =20
>  	st->regmap =3D devm_regmap_init(dev, NULL, st, &ad4134_regmap_config);

[Severity: Medium]
Does calling fsleep(AD4134_RESET_TIME_US) here in ad4134_probe() cause the
probe path to stall for 10 seconds?

Earlier in drivers/iio/adc/ad4134.c, AD4134_RESET_TIME_US is defined using
USEC_PER_SEC:

    #define AD4134_RESET_TIME_US			(10 * USEC_PER_SEC)

This evaluates to 10,000,000 microseconds (10 seconds), causing fsleep() to
invoke msleep(10000) every time devm_reset_control_get_optional_exclusive_d=
easserted()
succeeds during probe. Should AD4134_RESET_TIME_US be defined with
USEC_PER_MSEC for a 10 millisecond recovery delay instead?

=D1=82=D0=B8=D1=82=D1=8C=D1=81=D1=8F

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792200021.gi=
t.marcelo.schmitt@analog.com?part=3D3
