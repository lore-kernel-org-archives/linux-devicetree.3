Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624847;
	b=J0VgmKFVaxG6BMGF7YDvjrAg4YKKp8af+L9AtYV9Cx4p6v1/2cnI09npfuQdc7QAawWj
	 2G0TU1C14HN/oOpmvWGrnBA4LTZu/aiVRS44j3lZuKT4WXHyc8EBnOkGlVk2RWeTVa0NA
	 spZMqscS6myYn862J9oBcqUenhA0ZKz0vWGRKxxb/aiy7Mph3fA0BcYBun0PMr2PnId08
	 L5Arn/Y1CSP9kU7rkkvMoXqaH23sxLBtGIC/xxHa+2iEqhMNZVL+DkS1fEbZyjSyZWqhn
	 Y8zDufL+6frF228xWWhWhIOhZoQyyi1pUs/kpcL1qQ5ONSjsrqKWHoOzMsUowQtx1ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624847;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=M9DOp1qSa3Ibk87SzKGrTsovuwywdiXspR7koE+lIIk=;
	b=I2af+s2Q6X6BfbCyzfOqIYTJglM6H5BzfJOoZt1zLO++as22yOuSkbOS7sBwMF1qwLd1
	 yuGvBFnEqb5Q29PUCZAoCkq4d0t2vsISwm2E/w+de+2nrh+nv2SDGMkWB/mxAvgKxzTbe
	 lA4tFEYm0TsPdVq5Gq+qTYAc2SCCxP2AhAb1zB8VpgkHOZRjvTVz1xloqOC0R9WLUaHQ1
	 s3KZWMG/A3PRPM+hCPs3p3VgS5AZrscrfstV/B4lnaT9MgS6v3EObEUayxQeJX51TemXc
	 Gcc4bz+3WHWVD4vR2cQVOR136jmw4y98FcI0JZbnf6BEtLfEvmM6PViBFXWGQUKv9Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zfBb4wf6;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38BD606A332
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E38BD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zfBb4wf6
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5F7F71A1410;
	Mon,  2 Nov 2026 13:07:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2BB9960750;
	Mon,  2 Nov 2026 13:07:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD30A10328C5E;
	Mon,  2 Nov 2026 14:07:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793624838; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=M9DOp1qSa3Ibk87SzKGrTsovuwywdiXspR7koE+lIIk=;
	b=zfBb4wf6CXGlHDQhCsB/HC8xM0uHQ2unP8ECRuwMLZ9SnNNl3dlojIN9KSv1DuLYY3BLe+
	vAnb/r3C88tAM/eAixYQM6Fyl4QY5hj6hpn/B7IfgwNdcGt7jLFsKXDCkpYQYALfBEinMe
	Ga39+iW87hx2bZY9qERfxxT/YMb5fg8tWCLXOR5m3T9AxFYucW0YDkXohsg8CJwXzWvezn
	zcqwNTd0dvY+MlkJWX0EZ5fcWTAeoFJLAnwasnDUEKvw745f+yCQLx4pK4JS4Hs78+fprQ
	1+lAAzmA/wbLY05/6+9YzRf7H1kS4bpUwMnnGKOFDPaP3vc7aGBj1jM50k7kjA==
From: Herve Codina <herve.codina@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH 0/3] rtc: pcf2127: Add support for output clock and disable the pcf2131 100th counter
Date: Mon,  2 Nov 2026 14:07:08 +0100
Message-ID: <20261102130712.25104-1-herve.codina@bootlin.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

PCF2127, PCF2129, PCA2129 and PCF2131 provide a configurable output
clock. The first two patches in this series add support for this output
clock.

The third patch of the series disables the 100th counter available in
the PCF2131. This counter is enabled by default in the hardware but
100th seconds are not used by the RTC subsystem. Fully disabling it
allows to save energy when the RTC is powered by its battery without
any functional changes.

Best regards,
Hervé

Herve Codina (3):
  dt-bindings: rtc: pcf2127: Add support for clkout clock
  rtc: pcf2127: Add support for the clkout clock
  rtc: pcf2127: Disable the 100th counter for PCF2131

 .../devicetree/bindings/rtc/nxp,pcf2127.yaml  |   6 +
 drivers/rtc/rtc-pcf2127.c                     | 201 ++++++++++++++++++
 2 files changed, 207 insertions(+)

-- 
2.56.0

