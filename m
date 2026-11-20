Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177688;
	b=ct3cWVbB0h40nhsBK3T1685zaDSYRjGBwEvGJqwjpFOElwpDJZCCzNXJ6nhtj9JBLeX0
	 jVS81eWc+h4WxcQ1lhMvhamRTsX/5FbhuEh5mA068flafgICyCOB1nTQ/68ZC+RdNwTpE
	 1yRc0VbzbJx9aJU/rlveg0Kjw8nWmo9QbKBchzztoJixUtGjfOjfqeP5ys9ICElUWY0tb
	 hm0bqdGDNHq+1JsdhQj4COIwM5jCGOmevshYZjCg+roYwBdA6bMvvYNUHbIXST5G/tC8T
	 X5C71l1kgV1BakTOPvBZcJBoVPovTRb1cTxjXsOA8itzqWEJzpL9NZ7OeE8SZEO/WGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177688;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=/il6za5gRc4ULppi4IkmLWvEHHZDavGu5YBPS5tffs4=;
	b=O+frBYp3tJPc9WMxSN6hquEe3uh9O3hYMj/Fwi946hHkhwMmryCkx4Nh4RRH76eCOdjL
	 5d81LjkyflBgZjiR+Mdqfk/iD0t50LWAYpeucJ5LMK8nYmUNmmsAu2cDE72asFTljcGIO
	 jcIXzS9ckuUXUuw63a5D/ZTm16ZDWs3rCkenCldInVHO98A/3Oa6cHxGbak9BDhmYajM1
	 1/a76SNTQpaJjUSAAsapiq8Snrl7K7dTyaCqqC6P0pjFLKFxGT3iyRpTkM272fcsP8nxv
	 LK9THsEdf9vxsIaxfUsLoPqW1ocbikfX1L/RK9W4TJV13qK+rDQzlDbqqW0uT4UpQCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JnU2oebn;
	arc=none smtp.remote-ip=91.218.175.26
Received: from mta0.migadu.com (out-26.mta0.migadu.com [91.218.175.26])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E28606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E28606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JnU2oebn
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Dt0fNSTmkJH6G0hJCBAiS9klrkZLJnz6ms5cInhYWvo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795177686; v=1; x=1795782486;
 b=JnU2oebnUt4KVO+GsKJ+N5/ZZSawvCvFn0xy7A2c2yuPQvfGkI81HzAxTTHDWjWhvVSvGZXj
 3xozkjuyHmTs2bQCmbEs4wHNqoasqo/ZwdIOE8u9DsVWoMH9t4V5eRcxt9gKS2Xz5OcJFpy2CQs
 W6KDTrsqVkj8O0j2/7FBNkOk=
X-Envelope-To: devicetree@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 3ef8b2aaaaf2dce0;
	Fri, 20 Nov 2026 12:28:06 +0000
X-Mizu-Trace-ID: 3ef8b2aaaaf2dce0
X-Migadu-Flow: FLOW_OUT
Date: Fri, 20 Nov 2026 14:28:00 +0200
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Radu Sabau <radu.sabau@analog.com>,
	Janani Sunil <janani.sunil@analog.com>,
	Salih Erim <salih.erim@amd.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jakub Szczudlo <jakubszczudlo40@gmail.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] iio: adc: rohm-bd79112: Add chip info structure
Message-ID: <42cb719e8da3b07e3c5b9bc6347e95ea7a30511f.1795176984.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1795176984.git.mazziesaccount@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sxHNcw6A6fZUjLGZ"
Content-Disposition: inline
In-Reply-To: <cover.1795176984.git.mazziesaccount@gmail.com>

--sxHNcw6A6fZUjLGZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

A new ADC variant, ROHM BD79111 is going to be supported by this same
driver. As a preparatory step, introduce chip-specific data and pick it
at probe time based on the spi-match data. This allows describing the
necessary hardware differencies in data structures, which tends to
result cleaner solution than some CHIP_ID specific switch-case blocks.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v1 =3D> v2:
 - Split the chip-ID introduction into own patch as suggested by Andy.
---
 drivers/iio/adc/rohm-bd79112.c | 45 +++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/rohm-bd79112.c b/drivers/iio/adc/rohm-bd79112.c
index 2506fec7be84..04084e88984a 100644
--- a/drivers/iio/adc/rohm-bd79112.c
+++ b/drivers/iio/adc/rohm-bd79112.c
@@ -26,7 +26,15 @@
=20
 #define BD79112_MAX_NUM_CHANNELS 32
=20
+struct bd79112_data;
+
+struct bd7911x_chip_data {
+	const char * const *chan_names;
+	int (*init_disable_gpios)(struct bd79112_data *data);
+};
+
 struct bd79112_data {
+	const struct bd7911x_chip_data *cd;
 	struct spi_device *spi;
 	struct regmap *map;
 	struct device *dev;
@@ -398,6 +406,19 @@ static unsigned int bd79112_get_gpio_pins(const struct=
 iio_chan_spec *cs, int nu
 	return gpio_channels;
 }
=20
+static int bd79112_disable_gpios(struct bd79112_data *data)
+{
+	int ret;
+
+	for (unsigned int i =3D 0; i < BD79112_NUM_GPIO_EN_REGS; i++) {
+		ret =3D regmap_write(data->map, BD79112_FIRST_GPIO_EN_REG + i, 0);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /* ADC channels as named in the data-sheet */
 static const char * const bd79112_chan_names[] =3D {
 	"AGIO0A", "AGIO1A", "AGIO2A", "AGIO3A",		/* 0 - 3 */
@@ -410,6 +431,11 @@ static const char * const bd79112_chan_names[] =3D {
 	"AGIO12B", "AGIO13B", "AGIO14B", "AGIO15B",	/* 28 - 31 */
 };
=20
+static const struct bd7911x_chip_data bd79112_chip_data =3D {
+	.chan_names =3D bd79112_chan_names,
+	.init_disable_gpios =3D bd79112_disable_gpios,
+};
+
 static int bd79112_probe(struct spi_device *spi)
 {
 	struct bd79112_data *data;
@@ -425,6 +451,10 @@ static int bd79112_probe(struct spi_device *spi)
 		return -ENOMEM;
=20
 	data =3D iio_priv(iio_dev);
+	data->cd =3D spi_get_device_match_data(spi);
+	if (!data->cd)
+		return -ENODEV;
+
 	data->spi =3D spi;
 	data->dev =3D dev;
 	data->map =3D devm_regmap_init(dev, NULL, data, &bd79112_regmap);
@@ -476,7 +506,7 @@ static int bd79112_probe(struct spi_device *spi)
 	iio_dev->channels =3D cs;
=20
 	for (i =3D 0; i < iio_dev->num_channels; i++)
-		cs[i].datasheet_name =3D bd79112_chan_names[cs[i].channel];
+		cs[i].datasheet_name =3D data->cd->chan_names[cs[i].channel];
=20
 	iio_dev->info =3D &bd79112_info;
 	iio_dev->name =3D "bd79112";
@@ -488,12 +518,9 @@ static int bd79112_probe(struct spi_device *spi)
 	 * without having to worry about some pins being initially used for
 	 * GPIO.
 	 */
-	for (i =3D 0; i < BD79112_NUM_GPIO_EN_REGS; i++) {
-		ret =3D regmap_write(data->map, BD79112_FIRST_GPIO_EN_REG + i, 0);
-		if (ret)
-			return dev_err_probe(dev, ret,
-					     "Failed to initialize channels\n");
-	}
+	ret =3D data->cd->init_disable_gpios(data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize channels\n");
=20
 	ret =3D devm_iio_device_register(data->dev, iio_dev);
 	if (ret)
@@ -523,13 +550,13 @@ static int bd79112_probe(struct spi_device *spi)
 }
=20
 static const struct of_device_id bd79112_of_match[] =3D {
-	{ .compatible =3D "rohm,bd79112" },
+	{ .compatible =3D "rohm,bd79112", .data =3D &bd79112_chip_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bd79112_of_match);
=20
 static const struct spi_device_id bd79112_id[] =3D {
-	{ .name =3D "bd79112" },
+	{ .name =3D "bd79112", .driver_data =3D (kernel_ulong_t)&bd79112_chip_dat=
a },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, bd79112_id);
--=20
2.56.1


--sxHNcw6A6fZUjLGZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmsAPNAACgkQeFA3/03a
ocWzUggA1QZSMoed1H362YNjRjmPqj9SeYdnYU00WNEfdWOrsnivYTLC7kdocEDr
9e0UcamjBHuGNqrnipj3dzoQ3WgSpPpNKtHxU9OXJOadpkjLrp/CmpxLnCjpphbF
hQFuA7gnamV25q5DgV7gFJeqIbadwuInXKElJUGzArxNilNHTpzXOIiiUAnMFxhW
vZKSRpzLiNAiX2tQ6TaKMwcfChV454roLNIo58Dfxu6C533vSjNmgTwmiIRj8tJy
jPPLb0tC+/liWEftHqEi0OvJeh5lMINxkolxEj2ZijMVL5Zhq04E/Q5F85JqKYMt
6wmZUEy7NUs6A/LPG1LBga5f83VTdA==
=Gxh1
-----END PGP SIGNATURE-----

--sxHNcw6A6fZUjLGZ--
