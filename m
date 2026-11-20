Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177589;
	b=WlK9JRePrqTWUfR75nSvkamrB2uDk4egVKNqUjgvGyrUxo8jNKp2WyozLNbD0BeXdEuC
	 9bMroLk68Vb89FjWw8bUEqckIysLDfbJut02z3HCN2FiLQozHhvJbO5hLq+lr4HO101RG
	 edh4NyT617MMe0d6H1/F/2bDH+CXAV/WZlG+N+I1kZgiKaRXpsOCpLAabI4OD7Tbh+WDU
	 /NEYkAS/hAj6IJb/OJy0z4uBC9iHaDtS947jhWqGhD6MM2jp0e2gYTk//MT9d5PKnD0bD
	 MQv3gXJODwmQpAPd9Qp/hUZn/FuZZugGpoD6hjjIVd6I0D9nz/m5jIM2MqyCgT/Avbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177589;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:MIME-Version:Content-Type:Content-Disposition;
	bh=+HH7gi0yfMPztn37065eA+37h3DOW9VaQBnJwrLQVfA=;
	b=T3QrGWS2EXxTO+9lq5yKI5Kf8UO1Rsh5Db4IB8RePQ73QBos9FzFBZg4tpcxfdwpc2C0
	 I0yOy4Gms8100s9X5O5TpWshQSq7veuNH1eh+4GsGzCcBIrE2S4PgLPtUgmFUzQ5C/fQf
	 FBIU5y+onmj6IArviPSouu18FY+xAZBTQ97aPyVMD2r+uO/mqIwMyRtO1pjGzAa3SkSNe
	 xbfdBzmKtIOnAp6tAr65wVzIfZ0DPGHLIRpoGTMm8jQHygvrT6EQhx4o+OYS0lSC/aDJt
	 6e0gvqbNjDH20q5cBdtMPzdSsbi25GWA+Hrscfdd99QdEnDF8LH4JcfERe9qNo8tdXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="l3FSCO/W";
	arc=none smtp.remote-ip=95.215.58.236
Received: from mta1.migadu.com (out-236.mta1.migadu.com [95.215.58.236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D50606A32A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71D50606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l3FSCO/W
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ez1RQL5NworJu9CWx+UmwiOgtLYQW5cBqtLbCyEA2f0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795177586; v=1; x=1795782386;
 b=l3FSCO/WPCG6oPOH5dcGurkHL56k1dnh4Cp9tvvErYOok1b7qixuv8kgyyYqQi+5iduc4sV0
 0S8Fyv2WKJqBDFDttH3baU2nPMxvlzF3cdpqdH5ii07PfHaFccfsT48+k+W3OSYsosJWHMfgVpv
 fH7yPl15eVdWwIhtqgK5cdqM=
X-Envelope-To: devicetree@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 5fe399ac5fab81d2;
	Fri, 20 Nov 2026 12:26:26 +0000
X-Mizu-Trace-ID: 5fe399ac5fab81d2
X-Migadu-Flow: FLOW_OUT
Date: Fri, 20 Nov 2026 14:26:20 +0200
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
Subject: [PATCH v2 0/3] Support ROHM BD79111 ADC/GPIO
Message-ID: <cover.1795176984.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
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
	protocol="application/pgp-signature"; boundary="JUTYPu/IdrS5Phws"
Content-Disposition: inline

--JUTYPu/IdrS5Phws
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Support ROHM BD79111 ADC/GPIO

The ROHM BD79111 is a 12-bit, 16 channel SAR ADC / GPIO IC. Or, a "Signal
Monitor Hub IC" as data-sheet describes it. The key difference compared
to already supported BD79112 is the reduced number of channels (16,
BD79112 had 32) and halved sampling rate (500 KSPS when BD79112
data-sheet stated 1 MSPS).

Revision history:
 v1 =3D> v2:
  dt-bindings:
   - Don't drop the 'root-level' additionalProperties: false
  driver + Kconfig:
   - Styling as suggested by Andy / Jonathan
   - Split to two patches as suggested by Andy
   - Return -ENODATA instead of -ENODEV when no SPI match data is found

Matti Vaittinen (3):
  dt-bindings: iio: Support ROHM BD79111
  iio: adc: rohm-bd79112: Add chip info structure
  iio: adc: rohm-bd79112: Support ROHM BD79111

 .../bindings/iio/adc/rohm,bd79112.yaml        |  29 ++++-
 drivers/iio/adc/Kconfig                       |  10 +-
 drivers/iio/adc/rohm-bd79112.c                | 112 ++++++++++++++----
 3 files changed, 121 insertions(+), 30 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
--=20
2.56.1


--JUTYPu/IdrS5Phws
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmsAPGwACgkQeFA3/03a
ocVW6Qf7BO0yz0aB0nC6Rge45+70gIK6iVugWXA9uPjwP93NkVY1b4JhP9wzsb30
LDADT6zV+LzZ8IniB7lI8oFTDzjVKg66ol/8lTC+4LfLy5qH6uznHhzW0DG2ZrC1
6NdsIeBU4OzsNYQV3HiCAWEPsF4ZCvDfWPx/4g66zqgm2cpBMhS/v55J5xwEMgnK
dz5UYM27B9ZteWHYxLlRv1I90PurrMUEVWBjdbcmlJ8UNsfZ/UmLxEDgISUysat2
Wg4HLugx4O313k054X2TEaxa1CBgAd6xfT9NnAr41g8PCsqw1BcIcntFyBGi3gjd
ZCEbloQja15PpiGLVM1lgs7DFar/vw==
=eJ/L
-----END PGP SIGNATURE-----

--JUTYPu/IdrS5Phws--
