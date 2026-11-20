Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178062;
	b=HBHSqV9XPrrtJm3GZqZbHBnJsEeCV41uXNY0bMgiF30FQopcdK2tiRyAch2t5NBxbBwP
	 /DSWcjCW25gfeADO8ddtehVV6N7oMEYGOVSOxHlS96igxPj3lotymTJzyfv3TDGSJsFSh
	 X3ocJlKdF+5fYotg3DSzrxbo515aQ00Yf4XJoYZFBpH2PgZlDdl+lqTKWz7yqnZkz3KW5
	 Tb33ih1mQ9uzl48mY9gxe9D01Dqamp4Ag1EFw+iv31fCJ0dCF8Nc4XtKkLJAO7fBi8Faj
	 9o0kPkzDBvFRP9uSZWj/M9tA8jjkJ3gXgx3yRqFFgCumnU+hw/nby3UDz+3qGW/UePw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178062;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YWnQyvp1ofVudiIRTGCekODcflgzblekvVaT5iNbL2Y=;
	b=2ebHg+8eWciZ7Q9kWX0mUKwzBkwTTDG316SlD+yvE0aTNtJjkRg14FzlBTo6BP27XsAT
	 lhmx/OFIgQoFzLmtZC1x4JItjS6Oqk01db35Fsy6WEFc+v+CUgPXcI4XVLZlNrucJKfoT
	 qH4ez135d5iqgzX2cl+nz5bPfqYPiCa9qcayzbbKpJeHT3gr/WawGfdGKhABF9gK/uRTY
	 pCo8Uv/EKJyjLGahL5xqhxk6MLxSZqbfgS5vpknoRe4Dv4OmwFiXP6rQOZiips6yR2LPn
	 7pEwWk273tJwoRHBPctToZIAB6J3reV1kG+tMZTDLHaHz4JP7RkvS0bUMXN5wB0hdzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EOq8Rewc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C146F606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EOq8Rewc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99EC81F000C4;
	Fri, 20 Nov 2026 12:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795178061;
	bh=YWnQyvp1ofVudiIRTGCekODcflgzblekvVaT5iNbL2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EOq8Rewc/F2+MFU8zl1GDpSQqC8odrxnayevGQMM4bfnWLhK1h4ATCWhLU5NGPgfs
	 xHCh3TEmQcEDOirQ5T/A9cRpzAv0ATkqNpcKRj1VUH9rMLl1rFbYfMD9+/ozdlyZoG
	 5XYMa3oWp9Q4lOm/XMH+6QBO6XiYAe4MrLtab6KOusJCjQahDhY4313YFajPYj4Gvr
	 C4+xEr4oXi8HxqIYxU0676tJkunAe7T96wIjjn6m7MKW/NfYApox5VkkHk23wvYoDV
	 lOPaECX053a1NYYiD5LUtThlSIvhxYuOcZ/kQmhT+vTGlcj/EDqWsBU+6XgWwZyu5N
	 fNxU4pznXtL/Q==
Message-ID: <sashiko-outbox-225147@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] iio: adc: rohm-bd79112: Support ROHM BD79111
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <4be17e339f768da93db2f42abd3cc5a21fea01ad.1795176984.git.mazziesaccount@gmail.com>
References: <cover.1795176984.git.mazziesaccount@gmail.com>
 <4be17e339f768da93db2f42abd3cc5a21fea01ad.1795176984.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 12:34:21 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] iio: adc: rohm-bd79112: double semicolon in bd79112_probe()
- [Low] iio: adc: rohm-bd79112: unused BD79112_MAX_NUM_CHANNELS macro
--

commit d2b6757018d5ccee4c939ad0350d93a29d26239d
Author: Matti Vaittinen <mazziesaccount@gmail.com>

iio: adc: rohm-bd79112: Support ROHM BD79111

This commit adds support for the 16-channel ROHM BD79111 SAR ADC and GPIO
device to the rohm-bd79112 driver.

> diff --git a/drivers/iio/adc/rohm-bd79112.c b/drivers/iio/adc/rohm-bd7911=
2.c
> index 04084e88984a5..8bbb86098ff5a 100644
> --- a/drivers/iio/adc/rohm-bd79112.c
> +++ b/drivers/iio/adc/rohm-bd79112.c

[ ... ]

> @@ -431,8 +458,17 @@ static const char * const bd79112_chan_names[] =3D {
>  	"AGIO12B", "AGIO13B", "AGIO14B", "AGIO15B",	/* 28 - 31 */
>  };
> =20
> +static const struct bd7911x_chip_data bd79111_chip_data =3D {
> +	.name =3D "bd79111",
> +	.chan_names =3D bd79111_chan_names,
> +	.num_max_channels =3D 16,
> +	.init_disable_gpios =3D bd79111_disable_gpios,
> +};
> +
>  static const struct bd7911x_chip_data bd79112_chip_data =3D {
> +	.name =3D "bd79112",
>  	.chan_names =3D bd79112_chan_names,
> +	.num_max_channels =3D 32,
>  	.init_disable_gpios =3D bd79112_disable_gpios,
>  };

[Severity: Low]
This isn't a bug, but replacing the remaining uses of
BD79112_MAX_NUM_CHANNELS in bd79112_probe() with
data->cd->num_max_channels leaves the BD79112_MAX_NUM_CHANNELS macro
unused.

[ ... ]

> @@ -509,7 +545,7 @@ static int bd79112_probe(struct spi_device *spi)
>  		cs[i].datasheet_name =3D data->cd->chan_names[cs[i].channel];
> =20
>  	iio_dev->info =3D &bd79112_info;
> -	iio_dev->name =3D "bd79112";
> +	iio_dev->name =3D data->cd->name;;
>  	iio_dev->modes =3D INDIO_DIRECT_MODE;

[Severity: Low]
This isn't a bug, but there is a double semicolon at the end of this
assignment.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795176984.gi=
t.mazziesaccount@gmail.com?part=3D3
