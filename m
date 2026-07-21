Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9A640587A
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658285; cv=none; b=O3mAEupUAP48BzedEZiE4nsgnoDrjdsf+gVNUa8Po/sOuGBDK5s7WQZuH1FIHz+FftnpxUoR3b6sYs4n/qtJFqN/ShUUdlK0WMnh+KlzFQBKQb15CFL13Gs2sQAGNAEY0M52hm1GXy7QQ/QgQJNu2OqSLM7fznBgt1X7axxrUos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658285; c=relaxed/simple;
	bh=vLiYXQMunhQUXt43pguNpMz7eu5LQxGsP/wx5H0+Rl8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W3YyZgBlvAKRvsokwYE4XFGhV2faFpJiUvvUnr0CfNNOMtM9Bl7AeTo2TOm/h/75NxcRiowk83N9Lp9WlWb+c022oULpYmWce+hMlvv/ujDHMqjgV/OKRCyFFyC+YzDLu2zUAuiWTpnWQMK0usvp2WN/p1kCbAfKwAd2Il43Q8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEzBX44C; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEzBX44C"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-472326ca506so9001255f8f.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784658281; x=1785263081; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hh0MQTlP1Z8TfVOfqEcGY4B0iK9G2tVmrKphyfkwPB8=;
        b=bEzBX44CeWZ85iopJRg1EPTJNz+5kGeMVxr9HnYITose7QTXlTqc9bWB+xDEt+zZ71
         oycCH3nWAEWW1Vx9QwMh1+71DoRD09VXAxj7LdWPFM8GBmGfZ7dQbf3Y4cbZ2m3vs+f+
         87btSOSzeWesG7asrw2zcW2CG4OmTcYATSM6h0zicPCykvybzUV4CgaWAihdEspL3oW3
         7MYpoIa9GOJLTu4/f6CPnSmU3GEThZuZJ1PMgt2JqiZ8ijIUQxfs+DFcBwRpv1RJlg5i
         tiwBNOa2PdLY7efGIb0i6P0y4ptPLVuQIqpcFFv58/i5dxrsYkcfD8t46bl54RmnFYCL
         2dEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658281; x=1785263081;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hh0MQTlP1Z8TfVOfqEcGY4B0iK9G2tVmrKphyfkwPB8=;
        b=EKz+Yxv1h/O80iju2JqwVQ14bnadk4qTM1/ZdHaXZ0cjV5Szd+XnY3ieFKEv6CauvE
         yyhxiXM2GBlprQt+JfVJTBKBPRWBqgKy15qsQSW+eQlfJy5BQ6pFklQOgs7aautKYyvg
         456yuaP+CSGaMdQemeE6Ij4yYl5YxxVX/kFqEddIdPhKrma1+Cqd3qrkD3yP7JkNas0Y
         +aJWAvmOmVN7P3dZTxWsVrYBXt9CtMxX2OXq6jFMZa80mBaQ2WZ1qgZ5EKFQ3ENaeD5c
         ZEz9Wj9IdHW+PTsm0zeUyEgMq//g5PKhTVUT3hZ1KNcUwL7FvTSQT598jd3EZxWGNs4s
         CSEw==
X-Forwarded-Encrypted: i=1; AHgh+Rprp6nNEa2JWH5i9RDMRyKUgmhwqKctZF35oE9jTm1LqWIt1j8nVQujIhPa6ddLYpoZ7JvJLOxrq/T0@vger.kernel.org
X-Gm-Message-State: AOJu0YzXfUL/KHueTan2l7qal8jdIoi3j30F5DlRBXMsrQTZ1z2DcKzg
	TElAN/VQSaPgOVsKTYSeolczCLBrNVx0E8EGrOwGG6T7hfzPpxVCgoVS
X-Gm-Gg: AR+sD13uyNmcy85bAV4KXysFU2Pzu5Z8oO/x43qFgfco4cXLj+DfQCkkgo9oRfZEFWl
	nuGeusVK5l0+I11suVMPvSUZCW5Svu9fc7FUQ+C9L1seGQTIOVWvSJV0ZA7h8s+5Z99LyTxfuw8
	UTdV07yFZ+uiRh9XYLzdainBoW9/FTTttHHN8K4ioGCFY/6YjDqm6p3rGIQY3WMuxt05rfEAiVL
	LIKnZyjKCyWfgrX4TIuj0QhSgYSJ06I87h/fny6zeqwWEaAVV/74mKEoAc+PNcI3wynJkVjkUJ7
	0k2vHkBJQqoIQSO/eJwRb998gqU5DxFX7RRJ0A29NsA9LhEk/gI97FlSGBRhqxrhzojeO83SuF9
	7dcee5MhgmVZtwpTMBsxJaDwKUEkf9eKqZpC7PQqYltU3LbJmv1/72RA7whuBvne8dEPNAPOwzu
	XZXQM0m1HDltNOXZhpHDP3xoVaElW3cPvZCWGJwpTip7/I2DNU5dMNC4rGCie8j+BCCdvvLk7EW
	wqI+sbX3ZGBBVXdIqwRi1CdZ5zDpYDSJ9OZgqJdj1mzjLsbtUVWK+lu9IzPDEY9G6MvPwr2zj3S
	y5HWRlJsKcusBXMM7klQlcFMA1N6nop7RSOUYmH29IpJonqiSN3qjIcAbFuxy7ABXb7cLRyuTrD
	8ZNpmATcGcU5Qz9jVHu1NwiAkgg==
X-Received: by 2002:a05:6000:4b1d:b0:462:ce05:c5e4 with SMTP id ffacd0b85a97d-47f62326d48mr25931401f8f.37.1784658281089;
        Tue, 21 Jul 2026 11:24:41 -0700 (PDT)
Received: from [192.168.1.187] (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eddd1csm40835081f8f.29.2026.07.21.11.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:24:40 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH 0/2] iio: dac: mcp47a1: add support for new device
Date: Tue, 21 Jul 2026 20:24:37 +0200
Message-Id: <20260721-mcp47a1-add-support-v1-0-da045a2567e3@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MPQqAMAxA4atIZgOm/uJVxCHYVDOopVURxLtbH
 L/hvQeiBJUIffZAkEuj7lsC5RlMC2+zoNpkMIVpipYI18lXLROytRhP7/dwYMmOTNU5KrmGVPo
 gTu//Oozv+wFbZzOCZQAAAA==
X-Change-ID: 20260711-mcp47a1-add-support-3af1248f13a5
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658280; l=1591;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=vLiYXQMunhQUXt43pguNpMz7eu5LQxGsP/wx5H0+Rl8=;
 b=Ne6gdv8oZksUl0mkhNWe49WW5pDjBvwiCOTS7rxG8wQs8QxMlzqjAsVj4IyIjHujznW1q1B2e
 3UNqBdX3aHJCvpXQMnhQccvjqXQ/D8JT28Zn85xWEKVl+v+QuS+h1RS
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

This patch series adds support for the MCP47A1 DAC.

The Microchip MCP47A1 is a volatile 6-bit Digital-to-Analog converter
which communicates via I2C. It is a low-power, low-cost DAC commonly
used in embedded systems.

Reasons for adding a new driver:
- Existing Microchip DACs use a more complicated set of commands
  whereas the MCP47A1 communicates via SMBus using only one command.
- The closest Microchip DAC already in the tree - the MCP4725 - uses
  an EEPROM while the MCP47A1 is volatile, meaning that altering
  the driver of the former would worsen the code flow.
- The MCP47A1 maps cleanly to a standard regmap.

The driver was tested on a Raspberry Pi 4 using a breakout board with
the MCP47A1.

The datasheet can be viewed here:
https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/25154A.pdf

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Joshua Crofts (2):
      dt-bindings: iio: dac: add support for mcp47a1
      iio: dac: mcp47a1: add support for new device

 .../bindings/iio/dac/microchip,mcp47a1.yaml        |  56 ++++++
 MAINTAINERS                                        |   7 +
 drivers/iio/dac/Kconfig                            |  11 ++
 drivers/iio/dac/Makefile                           |   1 +
 drivers/iio/dac/mcp47a1.c                          | 193 +++++++++++++++++++++
 5 files changed, 268 insertions(+)
---
base-commit: 036d96ceec6d966339aea34d034420991e24cfac
change-id: 20260711-mcp47a1-add-support-3af1248f13a5

Best regards,
-- 
Kind regards,
Joshua Crofts

