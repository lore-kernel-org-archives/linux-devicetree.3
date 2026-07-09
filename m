Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305BA3F44E2
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 11:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596019; cv=none; b=oS+dn4QyNSl8BO1b08S3EG6fuG/DkZhanGd7DVhG8MhPQUXLupnCalkhGt5tkkFB/x8aFnTMPsgc4jyMmUzf9/WPSE49p530xGEV1OhwChuW5Ppl4jSQwRCazMfwrMY1LXO2GJ3uvP0O8PsIdYkPSZ/z3CfX+F48cheAygT6t24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596019; c=relaxed/simple;
	bh=yJM4jWcMxQXlFmf6u49pKphL2b9lo3j4nSv9Sw/a6wk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d7eIQRpuTcYmoPSW2VhFvmHqKj/jO1lIWChsa8C+IsUcZoX+QwDtGc2sNtXUnz6dSUcCDREI0ts0buV/VFO8W7ICrPONGW49eNZTmrCQl6uBYXUXfp7n7JJiTA+0TdwNDUXUpRvmbRg0cOybYwRkah3yD44NxszQwUvCtXU7IsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=g9WA1Qu6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="g9WA1Qu6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so18370065e9.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 04:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783596016; x=1784200816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mY+40GHIsfUvxGoEyM3B4UK7YBXR4Zoh8ak0Z/sMJt0=;
        b=g9WA1Qu6eesZc72/oyDx6m592ueTGk2hbEgsJT/BTOJ14wNxehRfI70nbqpBC3GfUZ
         /MEgrQPtPB+N9ivrRj8i/ZGK9TJa6dPiXypoCyQWpZpJEDk9vY4lRVux8d1IBTOumyKO
         W3GVBYpEi0ECnqRpMDS5H4FP+Ld5qZgihR7uDjmfPQ6H2kDEk4y+40au7Swh7qFQpGxK
         NkXjS32eXS4MnDwtPWEIkhVSGonNuHwxm7XEc5vdZElzF4+piEiy7MVWuqcKM9FnbtuS
         c7I4UoW+Wqdh/vCo2g9CWv2uvKpxTEUJ1eXoZuyCmn10OmOzi/i0XmIoSz6+6yLxdQiL
         acCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596016; x=1784200816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY+40GHIsfUvxGoEyM3B4UK7YBXR4Zoh8ak0Z/sMJt0=;
        b=YATixS7L2+hT6XR2838ixHlWrZoZX7O+cO877C140f6fEK2HcUKzGxW5Q5/PqAjVVP
         rbBN8krpDgCk78IkOlQG7lnxMv6s1UCzOCKCzmLFbGX3egU4MDCrVFv47UpMy3wClEKy
         b+SyesbaqqVYEMt9kMMtfPtxe0490DA1zFPebZDfRv8vQr6fkoBSvDdL1UVLqbyEYFGl
         tFVA7WbKZXunwq73OIJnSay61ZRgLGoe94NUBjBwzGiBVcP9CVgayEQ5cmudeIqyo6ON
         TOeld7cyvRUuHdFxOFs7ZV2YvISlekN3GX5o/pkXnv3YSDoOD2BzHDquFfKBDQ/62lGR
         +zZw==
X-Forwarded-Encrypted: i=1; AHgh+RoIOivwGKQO3TeCJ8TzY0/gqqKC+KR/mu8UgMdiPWAJpCINoM2wQ11io2wMpSj4JGgPsQ+cEqOqN/25@vger.kernel.org
X-Gm-Message-State: AOJu0YwenVrZLjzc8PGGAjPn2Y9xPcYG9vt6DhLSzFdfcJZQsb/DWHzi
	B6xsWR8rnhY4FcZIQv0focw8e/ep6sb7nNCFolY39gA45SLlJD8M6vR8quVQrOrb6nc=
X-Gm-Gg: AfdE7cn0/zPs+uYs3Qgz8WP59Oo8gDx77DOlSiAiKncN7bY/qRNDv1U3IeBpGetmlZK
	KlNpfTJUmNhCn+I/8iAW10697DBz/iqYIOBlhW6oSixreZS9T914x/42BaKIpDApwW2Ko0qrL20
	AVEZTGxmVcRaFFS1jYZUj1ZRFBZ1hTOQJsmL78bCC/XiYwyiIAX18D/hPShW1modMlYtyxnyGg2
	32YvGyqjyyQJBLCCDohiONwyvy49dFKEcpHi5QhKonoQQrHQ1O7ZMV7icyF/L6ssjdc3FmWjpml
	DXWdcNvKAfNWZo4Vh3MqHBJzw5eYQlJrF4uMmKGPcvSU6cQVwjna38tlIW6CT0cNqJhEsV/IbTW
	UPHsQI/TqMUZQI/ITaULKjQ7EzcBoNENp7REjSKFRHGFCNrTa6ZbMM49FVyEKwlGq0/V99BeGr6
	bTGTr5PcfS9nWGpVc+GzcS3rnod6Rgn3BAYr9ZrqWd+264+Yvs8eUnOL3hJGydKDEaoSNCAd1i7
	cSfyz9+2HxqMzm7slkZU3kO/Pub+TT1kGg/j02Lhk0=
X-Received: by 2002:a05:600c:3491:b0:493:c59c:94f1 with SMTP id 5b1f17b1804b1-493e7e82e10mr58748345e9.2.1783596016565;
        Thu, 09 Jul 2026 04:20:16 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-57.xnet.hr. [88.207.15.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm53910475e9.1.2026.07.09.04.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 04:20:16 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 0/5] spi: atmel-quadspi: add support for LAN969x
Date: Thu,  9 Jul 2026 13:19:06 +0200
Message-ID: <20260709112006.390742-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds QSPI support for the Microchip LAN969x which has two QSPI
controllers based on SAMA7G5.

It requires pad calibration, supports DMA, and supports 100 MHz operation.

It requires a different init sequence to SAMA7G5 so support for custom
.init per controller caps is added, and existing controllers relying on
checking gclk are converted to it.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Changes in v2:
* Make the DTS nodes apply on top of next-20260708, as SDMMC is not yet upstream

Robert Marko (5):
  dt-bindings: spi: Document LAN969x QSPI
  spi: atmel-quadspi: add controller init callback
  spi: atmel-quadspi: use init callback for gclk variants
  spi: atmel-quadspi: add LAN969x QSPI support
  arm64: dts: microchip: lan969x: add QSPI nodes

 .../bindings/spi/atmel,quadspi.yaml           |  1 +
 arch/arm64/boot/dts/microchip/lan9691.dtsi    | 33 ++++++++
 drivers/spi/Kconfig                           |  2 +-
 drivers/spi/atmel-quadspi.c                   | 78 ++++++++++++++++++-
 4 files changed, 110 insertions(+), 4 deletions(-)

-- 
2.55.0

