Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DC24BC00F;
	Fri,  5 Jun 2026 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780650110; cv=none; b=CwRctcLYcUCzRFlRxfJLjW6Ic7up2qK/pdlnea0PkiGRSjvliVMufiFYnJSyKFMQuLzd9UfY77FalW9pM2MuVVEzL0fKhruNhIWdm4lyEa69DOaRtu2BReak1B8w8ckXt1U6wyfj/ZtWNqcV85Bl7zx6JZsEWDvAjwClko1k9JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780650110; c=relaxed/simple;
	bh=wSQ084P/0nUSf95mq5aigSd7cQQngvpR33H/qqVc3LE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hBgUcLUg489nT94Ad+eoeEsOPFG4vgHy8ALT1JhLSF54940NHFYI9N7MAgVEKoNKcIG3yrMwl8DTH9pPvg8bzMSoISOjmjavAkhhk3cDZAmxjWibsidbMdrj3a5vuk5/K9TwoUgEOGtqVDtmzuSCqWxnMzDmluVLCQOks88XdgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=y6HQyc14; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="y6HQyc14"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 153841A0970;
	Fri,  5 Jun 2026 09:01:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D65915FED1;
	Fri,  5 Jun 2026 09:01:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B77C106A2028;
	Fri,  5 Jun 2026 11:01:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780650105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=UJEJK0/P1A9x4+6/Zd/TWjjAZyiz0JZ6SI/8O8uicq4=;
	b=y6HQyc149mTVEFwL2MIRSyZ9L1RTIB3vgtMGI+bMRPpu5RbGssjaGlDQpu2lKHYFO2bAq7
	SvrYQs5IYkrG9Du2d/hh1QQrZZpX0yLLnj/4KvU9CR91FuXmj07VdcjSJmOb4dZh51Ulgj
	InCbgcXkIZZ5ejnusxEJVNRFOt69RSLlUuuMFIV9yjD3ei0EvUsDawnZBuQF/fY8/uysw8
	lfsop+GV76zjQDMsaSeBVCeOeeQEvXsVEQu+mowdEacl7McQ9Q5iuU9GSPxrISEPV3dod9
	5X3q0KjMEgxZx0q2yeA8zfE3gSqs4Dxu262voWEtjCJ/83WZsTWlvKzxsiuRAg==
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH 0/2] iio: temperature: tmp117: Support the TMP119 sensor
Date: Fri, 05 Jun 2026 11:01:34 +0200
Message-Id: <20260605-tmp119-v1-0-349f45f17d12@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwNT3ZLcAkNDS10zM6MUI8NUkxRjQ3MloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0A9Z2BQGoAAAA=
X-Change-ID: 20260605-tmp119-662d21e4d317
To: Puranjay Mohan <puranjay@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Wil Stark <wil_stark@keysight.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

Hello everyone,

This series adds support for the TMP119, which has an identical programming
model to the TMP117, but slightly different specs and electrical
characteristics.

Best Regards,

Romain

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
Romain Gantois (1):
      dt-bindings: iio: ti,tmp117: add binding for the TMP119

Wil Stark (1):
      iio: temperature: tmp117: add TI TMP119 support

 Documentation/devicetree/bindings/iio/temperature/ti,tmp117.yaml | 6 ++++--
 drivers/iio/temperature/tmp117.c                                 | 4 ++++
 2 files changed, 8 insertions(+), 2 deletions(-)
---
base-commit: ddd664bbff63e09e7a7f9acae9c43605d4cf185f
change-id: 20260605-tmp119-662d21e4d317

Best regards,
--  
Romain Gantois <romain.gantois@bootlin.com>

