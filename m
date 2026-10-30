Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378840;
	b=gLbpKvTHc65AvKwL9EC2Ic5i5ORhCQOjBCSTqLT1Yo0SfSRQpNCfP06IFH8BlLn939zr
	 vQD58h8Lcb0sPTqe2HeDeY0VyP49VTHy2oyTVsxECfESOB2vsW404qoqGNfeGqQOA7s35
	 787oT+KH2EC3bz7R4cq94Q0SjeE8j0Dl6N5376xix36+jShIICauriifZbHwLSNVZLIQH
	 O9j7LXgQHsjQoOE8DSNmfGwN9nLW/7NixeIYEGYoeHPQFRJNtSDbMtqqRVwTa6cuQ3KkI
	 lU3I/Gy8pngHLOXfXi70veGbsve/Jq+YN9heKs12hn2YFZ33AVYZVLi6DOApi8basvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378840;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=1JNCQP+uPHSWlFQ9/h+R6elRqx5vlsNj2kueH8DsSN4=;
	b=UjWasuQ5hZ9A510fVdDTinKAauYW6oOUefYuAPVdioWDJwvI+mWO9mXpEUviq/k394u4
	 07dta70uRh/G7a3yjb3n6UDmtQAkrZYaNPwM68orSaiznMhlP1bApaAB6FKr58TycsZwy
	 6NBTvPFrnai5zWJ1RtRjDb2a33OGCGmM2If4DiZBbRN0b4E+3i3zzaaj5H9Ww7XYxrpLj
	 zdO+IgzzscXATuom2B7nBiVPAWDW7smpEtfGdZY71aA6HNTQDhkrPTggyUWsLrAUvy6RS
	 xUIVjp9mZekhI8YJn6jy1ClpuMSD7mcq41RJOa/aL5Gmf1VZPkui5O3njEVRIFIk1eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EKDUZOLb;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8B3606A31E
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D8B3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EKDUZOLb
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 67934C49F64;
	Fri, 30 Oct 2026 16:48:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80907603C2;
	Fri, 30 Oct 2026 16:47:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69A7E103290EE;
	Fri, 30 Oct 2026 17:47:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793378833; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=1JNCQP+uPHSWlFQ9/h+R6elRqx5vlsNj2kueH8DsSN4=;
	b=EKDUZOLbUJClzt52D4WlwvQnQ2r+Exo4KVJO5/fzACzfQCNKZQMfowQ8jdFA5EwEwNCxv8
	W9r2D6Zx4fl1N1KrJMdVoqb1zZwEZyX88qY9BjuCZeq+etsIVFUAJTmACvctuDWWU5j62r
	ncsnVb51UTUv+aRGAuT7kPhgyU2bMfRyuwPOXmh9+7JhSDW3shUoI7mlVAM7y0M5duh5nm
	aiWPmZwgjYoZ7T2MJMh5S7rAdCpbf3j5OK4UdlrszYVPkDktify4HV2C9UCeJpzaoT7VCL
	+JvXtwvQSJaEhLMBYwEQ4v6motTUEz9nYG+KulU1wzTKsrcGsJLrbFRIfbI0YA==
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
	herve.codina@bootlin.com,
	thomas.petazzoni@bootlin.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add driver for the TI TLA2528 i2c ADC
Date: Fri, 30 Oct 2026 17:47:02 +0100
Message-ID: <20261030164705.297354-1-maxime.chevallier@bootlin.com>
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

This is V2 for the TLA2528 ADC support, V1 was sent almost a year ago
and was already resurecting yet another older series from Rodolfo
Giometti [1]. Sorry for the slow iteration.

This V2 addresses the various comments that were made on V1, thanks
again to everyone involved in the first review round (Jonathan, Andy,
Matti and David)

This was tested on a custom board based on imx93, with a 3v3 ref supply.

Maxime  

[1] : https://lore.kernel.org/linux-iio/20210802130441.972978-1-giometti@enneenne.com/

V2:
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

 .../bindings/iio/adc/ti,tla2528.yaml          |  91 +++++++
 MAINTAINERS                                   |   7 +
 drivers/iio/adc/Kconfig                       |  12 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ti-tla2528.c                  | 245 ++++++++++++++++++
 5 files changed, 356 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti,tla2528.yaml
 create mode 100644 drivers/iio/adc/ti-tla2528.c

-- 
2.56.0

