Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011505;
	b=PWPy5JITj8gdSZUg0NUjTumUG2vua264RPMBlB69Imfn/E9PHP+9njwWCW2RExsyYXAi
	 9HOXV/19QiQu2flvHtrbX9y0vZj/9uu6LSauzfgGsdGJ9yKSXTUMDfYS22VdwqvFMe+aB
	 q6iuNJ0x7v5wuOfoHDgeTVLfs87D0mcms1oUNLITQJycjvi9mzjQGaGTm4TPjRzeKQphD
	 uS76BHrr1bpztqE6Ig67SvZvPZ5TR/Ue3Gkb88HBInyW1L65pt1tCeAWOSi+o5qlnN8jA
	 E8gAFW19JSkrsLxTe1iXE1vsUziCGHBrgt5J0cX+CTskcYivAYOwaSZQcXM515b/u4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011505;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:MIME-Version:Content-Type:Content-Disposition;
	bh=kofXl9sfPgdsXpZZh7yZNeD40yowoASdG4wWjI17JYE=;
	b=U/5hMfZhwachP8OHBdc01JagVQiYhV71mdfXjjtU0/VcsG0EMgZKLFSsIF4tgkwyUMpt
	 MLTe6kSzoQ/g0A0zdKDDqaDIbKtbvDryDk+xHwz55kRSv364n07yaT7RyIH3exeQMu1tt
	 Y+MRI5znOAKiGVArwOWhX/qm5r4lTY2Ye3BkHNTmiGRz1gUZtlO9wJ3v3irBBQolP3O4V
	 ZmXn6RXtrf3drCqqMX2PkGHDmTmGCPkmU747XCRs8dlwlAurn38QL76kYsrLPwFG8aAK/
	 eUoijJoCA9B5xd9Tytr8RI/xDFEe/iJN6Y4tyQ4TlfEGP9sc8XSVR1ehlNDvQTt7aoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wMZNvL2H;
	arc=none smtp.remote-ip=95.215.58.106
Received: from mta1.migadu.com (out-106.mta1.migadu.com [95.215.58.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF5760A2620
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 14:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FF5760A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wMZNvL2H
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=06NfiT2PWSzdUdLH0HbkzXx1yJzNQf3tCv9WaBw5u7s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795011502; v=1; x=1795616302;
 b=wMZNvL2HyVnyrMCVw0CUk6nA/1xti78MGBNNcO0ICMjpYXZtrcpav1pSz3MDcjgUnlVkHaBs
 T4ILoeHaBwyknR3JJomLKMET4n5te3R9Z/VYO8Xd+aGQdD3O9SZhaQ+hsKGeMlleTi+QJTPVDAM
 y2JszwnBophh5L8UaCRcctBE=
X-Envelope-To: devicetree@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id d8b0edf9b3c18121;
	Wed, 18 Nov 2026 14:18:21 +0000
X-Mizu-Trace-ID: d8b0edf9b3c18121
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 16:18:17 +0200
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
Subject: [PATCH 0/2] Support ROHM BD79111 ADC/GPIO
Message-ID: <cover.1795009599.git.mazziesaccount@gmail.com>
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
	protocol="application/pgp-signature"; boundary="TNVHFlqT3YsTnebr"
Content-Disposition: inline

--TNVHFlqT3YsTnebr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Support ROHM BD79111 ADC/GPIO

The ROHM BD79111 is a 12-bit, 16 channel SAR ADC / GPIO IC. Or, a "Signal
Monitor Hub IC" as data-sheet describes it. The key difference compared
to already supported BD79112 is the reduced number of channels (16,
BD79112 had 32) and halved sampling rate (500 KSPS when BD79112
data-sheet stated 1 MSPS).

Matti Vaittinen (2):
  dt-bindings: Support ROHM BD79111
  iio: adc: rohm-bd79112: Support ROHM BD79111

 .../bindings/iio/adc/rohm,bd79112.yaml        |  72 +++++++----
 drivers/iio/adc/Kconfig                       |   9 +-
 drivers/iio/adc/rohm-bd79112.c                | 113 ++++++++++++++----
 3 files changed, 148 insertions(+), 46 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
--=20
2.56.1


--TNVHFlqT3YsTnebr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmr9s6kACgkQeFA3/03a
ocW70wgAt9BuKdVVM1GiPi2QDGyuymxNiq0qDqLuzbDjYAtEU7I2QW7ld67yd408
cmIsgE3orhlxgrUse2/zh+TQbEYgIGYnG+4DxTqNfCTz1XFGSc1S0jp3Y8vrqzg0
p1cjrDmiQYYCzTbJcUWiCquG2jW90eianATptR/oEhTp6Q2O2tDgsMiNLhp1et41
vho8ZsZK4UfeJVESvBMjurh9gOJqPVe804mVGOfMfjbC1EAxaGXqeZHM1a8lEwLy
Ttzd1iOlWaTxFtoVX5PBm/UlWIkJf8Y5SJQ3iCkwxJqVsSOvVDb3hdb9jubM5zJ3
5/lIYhPUNFAV8taDKUMbPTArLjxGyw==
=hON0
-----END PGP SIGNATURE-----

--TNVHFlqT3YsTnebr--
