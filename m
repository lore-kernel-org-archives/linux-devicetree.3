Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAB251A14A
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902976; cv=none; b=k75BqPfT7OgzZNAQCK73NZ8OnaCnPOJE6JimuNud1LI92c6Tpunq1BO6ads+CEP8Xi7tQF9QZIemEODI0JnieCuybKNVmGisfn7RtUh8EskSbLRmh/7UR9NH+TnVtQWC6pIr2s9Id+XKdFDdggCpvBMm9FpSxKi1mvDy7LIf/sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902976; c=relaxed/simple;
	bh=4shNFslN/2vm+UbR7hXkck3vWhQGQ0XGUbraVpHrNto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFBOjhOt/UKTHbwpvIBsm/5odmHtWuZKoCIuR1avIn4W5rNgtrcDVPX8K4bQ42nR460QSGPep2tLuzc5YyVyI8VHrhOrgVY43iT/vUxZM4YA1M3eydEuzC6EOlNf/rNc+lpI0Ns7LGc73S1aRnJRulUyliZX2JdoiguSdWMxpR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CBRnzOnK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CBRnzOnK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso22347435e9.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791902973; x=1792507773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PIfoOZUaMPo6S3doq93G1Tv0En9Cid2ywRGemat7sLE=;
        b=CBRnzOnKCaTVvpE93/PJ1W8brRdcAkS8D3vjclbv+3UnOwtH/FNazRk6bwqy5Wckwo
         /EtJ5+ecUKygzSmrqYa88Hx4ysTUwVrmlzztR6Q7vhrYTDsJlObzRLdfWnNvp865r7vH
         6E0DNijkZTQfKER/+MjgU1v18rgaJUf2X9cCANMJeeNTTwUVIObOj2ViC90k4pzBQiav
         vtYdvIbuBpVbDJkhFz4M8KqlOFFJ83Ax6AJxGZadNTNLGO2My+L3EWIyuGzCYBqcCVoi
         0ALSt2xWPIkIWFC+RoyGGj5Ul2IJAdtdQi5gF9oybJX/BwaKPou1ECWcYI+YBWWFRVP5
         Ofqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902973; x=1792507773;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PIfoOZUaMPo6S3doq93G1Tv0En9Cid2ywRGemat7sLE=;
        b=Kn6/KI3KWMhSz7djbwhBVAaBxDhR+sXaSjQRGLuPhMmIOhkLbomTtl7xvCxTMWu8TK
         MbdkFDA4nbebgWeFm9N4Z1wJppxU7SlnOsh7Wom9af3xvPZFprr4OISQUpz5bMe2qjIE
         ScYe41Apsl8dvr/PMplSgcmdT6fsVAxLRPAkH6luN/qlJd7AjhrkQSdMdersmaifHY31
         chPZuv2piNfbh/uCuXfvNzeOWwhoYjoVyXrURYZcV9jCIXtohiH9pZUw0suXy9U1/dCM
         tX/zNG8e991SX9ngAtvMOYY7IJRsl2noEdOVa6Tema3mesA5b/4cx3LaEe0KBPQdPRS1
         1ksw==
X-Forwarded-Encrypted: i=1; AKwUvBxTPRFoZJ005CZQxhToUJGyux4fTDbLmrmnp27tgBW/Ke9RaVC+ccGmGs3zE85X8gtaWeiQukEZpPeR@vger.kernel.org
X-Gm-Message-State: AFq9FYL1JbL0l/g13F9W7KjEf2R09BXJ0WZ9Xp2Vq1elOzo/nKzv/nIv
	q7phL+HjQkfh1MsxFLnWIoV2Awd2+WPJRAyp9SYWAgOtaU3qRWbD6M7TO4SKWhejdlE=
X-Gm-Gg: AYBFou3CXk/PQWZQhgF2qLKrpBF9ktr1M6T23Qu7SOrOecz4SDEw5BZUuN+De1ArA1x
	+5iTLEW0lgmk4Qlj/ryK4GR6VzBVAhWtrMcCRU5ECwiUXp6S+NMRhlgV+cx35Gos1Pbveiz7R5E
	v0Y5hRFw2W/neN5jdcOvCYXYvNmgQ8fCgjIlY5AVijQqwEMHYZ5afHfbJIdgA+OIsq38+oThdtV
	hAYw5t6P7/EnxHiJ7qUl1JmHRpg6W6IDyXg52XX//TXEu+ecSBBvp1cnwWCgWwpAtRe/9ydFHnL
	iRDNcdR1Vu4CyK4hLeHplAMxLuvKA3TFxv2V7UftfVXG3XFWJrLBrYkww4aO23fVhafG4DhbmWy
	0INkOYURkZyvOf4dh/mL/BzPK0xB+CmbJwLYmoolov404PVU35AAAI9j3vRCxD0UsZePRPi8l17
	y1NqrvPahZENxe5WIt+UH8UXq79AMaA3lTQR2SFmcGYUaGNB3iagvhdZYU9Z1XqctmGMX+Ef/sG
	fR4
X-Received: by 2002:a05:600c:8b78:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a18e47acf5mr286180385e9.11.1791902972584;
        Tue, 13 Oct 2026 07:49:32 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a19c71a1d7sm183592355e9.5.2026.10.13.07.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:49:31 -0700 (PDT)
Date: Tue, 13 Oct 2026 16:49:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rupesh Majhi <zoone.rupert@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] iio: pressure: dps310: add Zilltek ZTS8032 support
Message-ID: <as5EOfOqsF5iEHct@monoceros>
References: <20261012114550.1680054-1-paulius.zaleckas@ui.com>
 <20261012114550.1680054-5-paulius.zaleckas@ui.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wvuvco4nogl7rfck"
Content-Disposition: inline
In-Reply-To: <20261012114550.1680054-5-paulius.zaleckas@ui.com>


--wvuvco4nogl7rfck
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/4] iio: pressure: dps310: add Zilltek ZTS8032 support
MIME-Version: 1.0

On Mon, Oct 12, 2026 at 02:45:50PM +0300, Paulius Zaleckas wrote:
> From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
>=20
> The Zilltek ZTS8032 has the DPS310 register map, scale factors and
> compensation, with these differences:
>=20
> - two more pressure coefficients, c31 and c40 at 0x22-0x25, adding
>   c40 * Praw_sc^4 + c31 * Traw_sc * Praw_sc^3 to the polynomial
> - TMP_EXT is MEAS_CFG bit 3, and the temperature coefficients are for
>   the internal sensor (COEF_SRCE reads 0x06). TMP_CFG bit 7 is the top
>   bit of a 4-bit TMP_RATE, so the DPS310 TMP_EXT write would select a
>   25/16 Hz background rate instead of the external sensor.
> - product ID 0x11 instead of 0x10, the driver does not check it
>=20
> Add a per-chip table holding the coefficient count and the TMP_CFG
> startup value, and an OF match table to select it.
>=20
> Tested on a ZTS8032 at 0x76 over I2C: in_pressure_input is within 1 Pa
> of the datasheet formula evaluated from the raw and coefficient
> registers at every oversampling rate from 1 to 128, and TMP_CFG reads
> 0x00 after probe.
>=20
> Assisted-by: LLM
> Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
> ---
>  drivers/iio/pressure/Kconfig  |  4 +--
>  drivers/iio/pressure/dps310.c | 66 ++++++++++++++++++++++++++++++-----
>  2 files changed, 60 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/iio/pressure/Kconfig b/drivers/iio/pressure/Kconfig
> index cef8b90b9ae7..e407243e131c 100644
> --- a/drivers/iio/pressure/Kconfig
> +++ b/drivers/iio/pressure/Kconfig
> @@ -115,8 +115,8 @@ config DPS310
>  	select IIO_BUFFER
>  	select IIO_TRIGGERED_BUFFER
>  	help
> -	  Support for the Infineon DPS310 digital barometric pressure sensor.
> -	  It can be accessed over I2C bus.
> +	  Support for the Infineon DPS310 and Zilltek ZTS8032 digital
> +	  barometric pressure sensors. They can be accessed over I2C bus.
> =20
>  	  This driver can also be built as a module.  If so, the module will be
>  	  called dps310.
> diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
> index 3bc690cc8609..3b0f6d344409 100644
> --- a/drivers/iio/pressure/dps310.c
> +++ b/drivers/iio/pressure/dps310.c
> @@ -7,6 +7,10 @@
>   *
>   * https://www.infineon.com/dgdl/?fileId=3D5546d462576f34750157750826c42=
242
>   *
> + * The Zilltek ZTS8032 is register compatible, with two more pressure
> + * calibration coefficients (c31, c40) and temperature calibrated against
> + * the internal sensor.
> + *
>   * Temperature calculation:
>   *   c0 * 0.5 + c1 * T_raw / kT =B0C
>   *
> @@ -18,6 +22,7 @@
>  #include <linux/i2c.h>
>  #include <linux/limits.h>
>  #include <linux/math64.h>
> +#include <linux/mod_devicetable.h>

Adding that header mainly results in pulling in many unneeded
dependencies, so please don't.

of_device_id is already provided by <linux/i2c.h>, so you can just drop
the #include.

>  static const struct acpi_device_id dps310_acpi_match[] =3D {
> -	{ "IFX3100" },
> +	{ "IFX3100", (kernel_ulong_t)&dps310_chip_info },
>  	{ }
>  };

While touching that struct, please make this:

	{ .id =3D "IFX3100", .driver_data =3D (kernel_ulong_t)&dps310_chip_info },

Best regards
Uwe

--wvuvco4nogl7rfck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrOROwACgkQj4D7WH0S
/k7wVwf+Ont9281p5OIPzkHrOql/yBXJItCWMp58XtyibFpc3rlNGmaenj029PMM
qTuPIiOben02yMTKVJO6D/HSeWlynTqxekqGABABKERhjZ5uLTuv6jVaMWAJFC1P
xPGeFxfDlRQk2WK/QG/iwUwdM3sL3GmDK2Uxz1ZfUDwsk5b24WynLydHJCR8qQmE
+bs3a6Bze5ORCtjvZPXgcsU1EsWZyYmBH3YxFeditn4ANM7bs5WrV+LmmenffWKU
sx01Iu3ITwRoLSratszOJC3R56tDK+qFJ19MnkclyT2KPQs0iAZj6ukk5T5FNiwY
oiWHYppEVw9nolSDk+74pWu9NpixUQ==
=90IN
-----END PGP SIGNATURE-----

--wvuvco4nogl7rfck--
