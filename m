Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582958;
	b=Dx59/YkgLuH8mnIw2mZssm5dUnulTOxI9KTi8a1dbwhNkNxwWuolWfVxR2Z/V3h7lmbl
	 OvCGSwOsRFxvIYY8vmfY7lao/N8z+QpDn9TeCSCP4xUtFelXCkXZyW2HkzuAl8qjqMcvs
	 1DebEb6wKuH44n4OoYUIZcv9PEUh/i1FcCBXXo8igtoYZgfVeBs+/1unhtWaS2SGosrKh
	 LzUVZ8YQWlzCS9QNFz99mAkQ/MCm3zIF5+o3kGkp6YAIT3BPKVtTL2ofFrbc84VS+VJ4e
	 imLQ3k8EUn3hDQ3HnO0GRfBPoi+fU0QStQm7+1qYCKws7m9wgfLWjSVbXN/75ch4qCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582958;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=lEK8nUBi0jVe9yX+WITeGcdHbn0xNGCiuHof4jLotTQ=;
	b=RW0D9nRVEZ9pt+tZyEYCKJLP6U7IwAKHcpHTl4c5f3ovrfTFMykyRFsXWoZdp+dFSiWk
	 hNO3DoDKEu9lPEWPv+4koWkVsWBTYXMm0iY/qqGg6K5cZCe9OvkP13pHbY6kwl93VKLEU
	 W9aq9FF5gyLsX9RSHKfzcSSqRHQC/PiharNUtY7E8OxE8oly3b5LzSTYcHhxAKFM/Tor5
	 97jOTd47K5VfaaOFrrpMyTqBzq9jhs2N+IXjRMu2rSoTVwf2nQfMcpJw8VBsvuI5H323o
	 qIRTsKQQmTEWq/K0Mwns+4TBnlxK0YJsR2y4D+V67ugNVgtYac1VdVb+sBRv8g/aAFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wBcQKjQh;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F188606A32E
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F188606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wBcQKjQh
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9E98D4E415A7;
	Fri, 13 Nov 2026 15:15:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6A50E60015;
	Fri, 13 Nov 2026 15:15:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A94E611BC16F7;
	Fri, 13 Nov 2026 16:15:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794582954; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=lEK8nUBi0jVe9yX+WITeGcdHbn0xNGCiuHof4jLotTQ=;
	b=wBcQKjQha5kRC2ZJsMhTWDfUu2moG31bAk+T/0Ckg2P/WmUsk7GbmC8AzhDVmJSejs6VJr
	AwVUTSC2mt0tRT18jis20nSjXVMpqQcYd2mN6b3TnUwZwUAq0fRnqr55HJTZT7jsHWOhDu
	Z+Ffh8OH/k/C0J0kGV+JhEO9kkHVkuPdnd7DHZXll8WzbmgZEP9etIuQwm69T4OWjz6L3P
	E5AYKDAod3BGCbCNa1POjznGimiOvyO3nj6qX+MLbyT+QEqxMIM7oKSV3VSW5v4fTxvl3g
	mATGi6gZQ7ON33+qdSyUFaUGjvEpDJTE73yfDbc6Rj+rwjkwsEP9sAaLeasUhw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Angelo Dureghello <adureghello@baylibre.com>,
	Tobias Sperling <tobias.sperling@softing.com>,
	Eason Yang <j2anfernee@gmail.com>,
	Marilene Andrade Garcia <marilene.agarcia@gmail.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	duje@dujemihanovic.xyz,
	Joshua Crofts <crofts@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Victor Chernyakin <chernyakin.victor.j@outlook.com>,
	herve.codina@bootlin.com,
	thomas.petazzoni@bootlin.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] iio: adc: add driver for Texas Instruments TLA2528 adc
Date: Fri, 13 Nov 2026 16:15:40 +0100
Message-ID: <20261113151543.2241604-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi everyone,

This is V4 for the TI TLA2528 driver, for the ADC part. This new
revision contains a small amount of changes, after the reviews from
Joshua, Andy, Jonathan, and sashiko.

Thanks everyone for the quick feedback,

Maxime

V4:
  - Return -EIO on a short read in tla2528_read(), from Joshua
  - Drop mod_devicetable.h, include asm/byteorder.h
  - Rename vref_mv to vref_mV
  - Drop the L: entry in MAINTAINERS

V3: https://lore.kernel.org/r/20261104125726.1754980-1-maxime.chevallier@bootlin.com
  - Require channels to be described
  - Use guard()
  - Add Datasheet link
  - Drop the unused registers
  - Use named initializers in the id table
  - Collect Conor's Ack

V2: https://lore.kernel.org/r/20261030164705.297354-1-maxime.chevallier@bootlin.com
  - Describe AVDD and DVDD in the bindings instead of vref.
  - Add gpio-controller
  - Allow describing individual ADC channels
  - Switch to regmap with caching
  - Reset the chip at probe time
  - Small cleanups following all the reviews
  - Moved MAINTAINERS to patch 1

V1: https://lore.kernel.org/linux-iio/20251223155534.220504-1-maxime.chevallier@bootlin.com/

Maxime Chevallier (2):
  dt-bindings: iio: adc: add Texas Instruments TLA2528
  iio: adc: add driver for Texas Instruments TLA2528 adc

 .../bindings/iio/adc/ti,tla2528.yaml          |  91 ++++++++
 MAINTAINERS                                   |   6 +
 drivers/iio/adc/Kconfig                       |  12 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ti-tla2528.c                  | 218 ++++++++++++++++++
 5 files changed, 328 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti,tla2528.yaml
 create mode 100644 drivers/iio/adc/ti-tla2528.c

-- 
2.56.0

