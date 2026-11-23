Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422015;
	b=1rDcKePgB0MRmu/dYQCA+1SqHvoaNRtjIcKl7Ey5w7e8/TqVJfYPRT0fH8FkI0SzmFpI
	 PmVqzcoNnsYL9CRe39KnhMr8TOGnK6ZJxatx/KwRqddwXDgyfm2WYkLU7CTR8SDioi8bG
	 R3+feCLCfw+w6VBBna7ALvAywMaqIeD1EsqSRIvCwUwJPC21WIS921ET5HYdzd0kFsICZ
	 EZ2KvUS8N/rFFzTpxT1nzsnUZJrQMf03NjPV4PhaE7GdKWMsc4e3gpUzHRVTRq2Qo93I6
	 bpFoRgastFgeT4WuBRGYWqT7IZbbg8yak3MkveKs8gwg09+cHtAbXRuRwiaVac0seZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422015;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=fb/njpTtb1ZywkUnC8d/cXgN+awweSXHIUFuREfcpy8=;
	b=S6Qwh+stZQEmMmCjiUHxS5Z/fC/dKSbLGGn0+oe46bt5LScI5R7wU98W2vMgHo/PkymW
	 lpZ8mOO7Q0UAFxtuodCCb5/q+C0xYJPxQXhiyVnz91HActNzlccJuhmF6qYFryMiKC8X/
	 eZhz5IZDDHnIVScXioMQsmqBjcTFdrDTlQEkrjXFDWciJf7mMkMda7LSVIND8YwVu8sRe
	 lRDuXbziYZOYhG5YgKKrBNh0cX8OjX+3YCXCyaMwWYOml9L6BWszHbKa1Q/EgY0SdjgZ1
	 YwinSqBJ3MVPP0qGbMsyUGnvvGAKvt52mvNAoxmnEt9ttGELOZi5G0tlfeU8/udZBgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TfmOnI+C;
	arc=none smtp.remote-ip=95.215.58.74
Received: from mta1.migadu.com (out-74.mta1.migadu.com [95.215.58.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2028606A331
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2028606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TfmOnI+C
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6zhnkZC61j5bMXTxA6fSPzvDG0S1AFbpj+t49wNu+OE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795422012; v=1; x=1796026812;
 b=TfmOnI+CPoqwAXKCrXIhHMYvW911qul+QByBHkPlzmCJ8F1PLInQ1iG4vDJhuZMi+Olt8DYS
 wFMuJncgV2WbSmAF4/FhQCfCcXNzjqzctG4A5a9MXjhqAb7VCIVI7J4jr/0CXI+Vj+dHZPpCKRH
 TFhPEE61YHU23d3xMl6Ul1fc=
X-Envelope-To: devicetree@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id a934698e28d2e513;
	Mon, 23 Nov 2026 08:20:09 +0000
X-Mizu-Trace-ID: a934698e28d2e513
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 10:20:05 +0200
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
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jakub Szczudlo <jakubszczudlo40@gmail.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] iio: adc: rohm-bd79112: Add chip info structure
Message-ID: <463d027c4f21e07c7418df3b3092d2093a8b5331.1795421473.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1795421473.git.mazziesaccount@gmail.com>
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
	protocol="application/pgp-signature"; boundary="zfBzbsEVIha9YNDY"
Content-Disposition: inline
In-Reply-To: <cover.1795421473.git.mazziesaccount@gmail.com>

--zfBzbsEVIha9YNDY
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

---
Revision history:
v2 =3D> v3:
 - Use return -ENODATA if SPI match data is not available
v1 =3D> v2:
 - Split the chip-ID introduction into own patch as suggested by Andy.
---
 drivers/iio/adc/rohm-bd79112.c | 45 +++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/rohm-bd79112.c b/drivers/iio/adc/rohm-bd79112.c
index 2506fec7be84..638ba161bba8 100644
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
+		return -ENODATA;
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


--zfBzbsEVIha9YNDY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmsD9zUACgkQeFA3/03a
ocVXOgf+O1WrJ46EPUUYAkE1VO/phxRyPeh5Gt/hjQmtJz58JgoIQGm4h7U3oQUk
gqcLOxFGXZc3RrWUtSh65v6w2UPs7fCpE1khJ1kBLXjpOOPSh3Fs7dCByjStVxIS
4EDKVkM6x0rM5vmGO+q2hDf7uqcpfvz0FiMpSsuG0jmjXJAp5P0DaVNsMr4O2MHD
UO1ZtEsRPJXqRSYHIm9cg057zsLjhlLNq+7jfcImH3wmi38AzTVsKCSCFeQPi5s0
SZuowG4g9U/PiLsfyvznhsDuJI7ene+/U0KQRfJyUlg7wOENGFcm6B9WwZ7CjGdp
1Ai12spKawkvJnQ5JuGgY5QyqLiSbA==
=mijw
-----END PGP SIGNATURE-----

--zfBzbsEVIha9YNDY--
