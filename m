Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366A23B840E;
	Wed, 15 Jul 2026 08:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102873; cv=none; b=hMXXAzRF/R+eXnkKO8CHjq2DyMA5aJjx5ZncVNX85nruzy6YZcct63ejUJO2JNs+wPFLDw5x47F33+z7Hil9GZ3TYerPnRY+FUHD5ctxRfy3fOlA6/0Ec9h3bPLkHsORs8VAH8kxPqUw01enqmibPiqFrmbSm3voTTDX8MLdRvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102873; c=relaxed/simple;
	bh=1fpr8AtMJXKT9efIsQAg18BMxxtX0BL6Ea/AaaiZu/4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BCoA/i5WiPDDQPtfiP8TAPcirSklM0qqilB3ew5bqhWoehMcVOw2y13WEAueWhVEl96wuOkp/jzrXTh4ipMejangMfoB8QIT7+izS6lPu3W/L5qkkaVh+A4ozazHSu7YNeZjQPgGN0ZQwoP4+8fjWGw+DzdUV5HtyOzU/W9t4Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=VL0GY8eF; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="VL0GY8eF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail3; t=1784102865; x=1784362065;
	bh=F9KNvHokOnjzXB2tsPw05VMRFK/X762wrH2nvki6fTw=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VL0GY8eF8z3QiH7wCs2AVhxbAKCygqGBbLwKe9FfwtCJaJ+KdWhwMGETTJGFG/uQr
	 sASxBLgQJl81p333BKI8xgh1VVpY8rMTKmbB0zK3egZbCfRV6aSS0ALY0zyUAXhFwt
	 rmsQS7Y77YHW3Ichy81Jmi/JvS+VAI18PxdZOhVUK5w9yOOmFqhfcNHxkMk4ERBpFx
	 uCmd4ipUTH6RlLWMPZSRecATnWvxyVKcoveHAmm4G5q/BXy0Q3N4onLaD8UfhelZMi
	 qvmV2lLjFptAwy+N+6xSJAHorDPeWlpMcUhrBCnCCob47KxngRAKH9FqIWzvWyei8L
	 IklZXjsCMLPiw==
X-Pm-Submission-Id: 4h0TLS0FkLz1DDrP
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH 0/2] io: accel: mma8452: Allow open drain interrupt pin
 configuration
Date: Wed, 15 Jul 2026 10:07:37 +0200
Message-Id: <20260715-mma8452-open-drain-v1-0-b1dd2a440c60@geanix.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBtQU5SuEi3EpppFGgoRiHdPW
 r7F/xUKZaYC81Ah08OFU+yQ4wDh9PEg5K0blFBGaCHxurzTRmG6KeKWPUd00lgbtJysCdDDO9P
 O7z9d1tY+Uj9VjWQAAAA=
X-Change-ID: 20250401-mma8452-open-drain-81577c41375c
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Martin Kepplinger <martink@posteo.de>, 
 Sean Nyekjaer <sean@geanix.com>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Martin Kepplinger <martin.kepplinger@theobroma-systems.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784102863; l=917;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=1fpr8AtMJXKT9efIsQAg18BMxxtX0BL6Ea/AaaiZu/4=;
 b=a79cjrT5qa69rUkYqt53VPeV6nxEWRF5VZJohn0QjbGdvg0LO+hi5K0ff45afLK7BE9TxwFUz
 sebEqlH6OWYCguNVdDRrlc81+agiAFeXCHTnEql8TxWmDlPG+rDwye9
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

Extend the mma8452 driver with support for configuration of the
interrupt line in open-drain mode, which is needed for hardware designs
where the interrupt line is shared with other chips.

Adding drive-open-drain property to mma8452 device-tree node for such
designs to enable switching pin configuration to open-drain mode.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Esben Haabendal (2):
      dt-bindings: iio: accel: mma8452: Add drive-open-drain
      iio: accel: mma8452: Allow open drain interrupt pin configuration

 .../devicetree/bindings/iio/accel/fsl,mma8452.yaml |  6 +++++
 drivers/iio/accel/mma8452.c                        | 29 +++++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20250401-mma8452-open-drain-81577c41375c

Best regards,
--  
Esben Haabendal <esben@geanix.com>

