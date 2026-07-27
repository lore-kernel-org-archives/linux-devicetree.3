Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D8625B0BE
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785177110; cv=none; b=ie/LadfzbS/SndE8ruUK6cf+XmA1xFnqLLQSZbpyp0RgkZPQXETgUlGIQap1u73qtjHGOFsIEd65/zhjVcjrYgAGhpio03Qc1ZYvZK4Ljb4XoK2ihS39y7F3A4p7Bp1ikZ/rBK7Lhdty5wAj8yvkUTpyszw9y5OteLQIzCqRMlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785177110; c=relaxed/simple;
	bh=XcLu/pnyI5tANXTm5SFHad+zcyS/kPl/xXh7gOq7SU8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fSSH0dIlw6Nzscfdd3DflDcyhZj/vOzTacF+g4w6AbSHGCMZS52ck2AngbdmGsepyiA8JqV5mppBiaaj4NDnZgDMzi6udXK2q3Mwr9LXbmRtXIoFJ6HfyJeVJSma5sRzMwhSATOa5j0FDFcaVUgQ28krTRR5WC9QClnlYt8Ubpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERuDPbRI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERuDPbRI"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49548e01d02so15386265e9.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 11:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785177107; x=1785781907; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OgA/08mBhQoOORx8DgJpJSYoUaMJULrVPsxZxzMgDI8=;
        b=ERuDPbRIqNSaOOjXP7/F8IN3ek/mAKixU4QknXb8H8IgnGFqTGeXP0iC2xB6Qze2Nw
         V4jUnQQJojkTjzIHq148dsXFREatImg4bg7gMHcQUVjbPZFhvKXRiJ9Pb6utdmi3LF4v
         Iezx5BSNnAiuZTJr3DvnSkyKtziXoXgsnXZ9nLbvY4qmT5+3huoTllMk1mCOOCQxSSSw
         noXnCGOpblvI0eHuC5F/owO8TESSQpjq213ynL1/KDy/rbZ6N9uaHhmaxGC/nZibV0Xl
         sszxr5/lAeZS55PdrzGAxEvogsnTMES6TyfU2jQuiqpEKKmyo3ci/CY8AT3sLTu1tP60
         W8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785177107; x=1785781907;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OgA/08mBhQoOORx8DgJpJSYoUaMJULrVPsxZxzMgDI8=;
        b=VmgZjte7EpZMERUaz1EgFJE0rGoHRaB/vfnScqkl3SCbiIdmq4khN/9f+vIlFvlUPM
         gW2zwlNSZ3VRl8NpW/Zpo4Feg7cfdg32CU9q6+DKnIH8nX4XWGdbzYt2dhq7M/6g1CDA
         nu7b59XVGU0FE3X/5eD8STE+PZaRi2cwXQgYfaeq5Vdv0hwbvagpyhjUe3YXPytyMp+S
         6878VyMfXn1tx3yPDTNKf+QlSYrLAjNaFj4oOvI02NfDQ8XkCUzn+GIJa875Ruv5XvUt
         ZQAbzs1/JCz2uP7Ygr3DS+B7owVPoD6sCmRRZYm5j/vUW8IdWbgFVzR8c4PKfiVY8gnT
         WA2Q==
X-Forwarded-Encrypted: i=1; AHgh+RpJKHsrWfUv8Ztt/5iNzJ/uk+BKe/nb8H3VywM+pMf47vTTWgcSEuHnhIp2z0rjs68owf0qds8eALJ3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy+0BgM1wUySQg/Nq+bGOI9WghSa8MbJNrZ6VLOwLSCQMe5IO7
	qVmHkeOZLD0zM2ivoaqXAiwCLHVKcKPDMRiJOE0lkXMXjeX/zfhQWwKS
X-Gm-Gg: AR+sD13ZWsM9Os+gUiNOF94Qu7FJsenW9N5X7svfEyaGbi34utoxTsBhI840Xv+be7d
	Dpr/2rlwF7CSLWj8RswUlrN8D40F8ouyCIhepTgJTB56PZoSUOmaK9JcM/QEULQG/KnRy0dVkzP
	vkEn6jqV6ihZwmlmgxmvqCClipr683Tx5C2h1A/qRtdR1FfPgV1NCSCXdf1HsMQPUGNviu1Si58
	l7UZoJsLGHHyYwZyLrJfrVUJIvvypaxVKf/43fIECwr7OEkfDSSU4d2ZJROihFkJJdGwUfkmk+z
	Zs3/NX1cvFZ/rWwxXNcVJwEI90AVFwMQo8hw6aR44/xEUCOLnkQ8oCjS3j78cipoZ726SAEKtDf
	tPC/Aq8hRHE2/tU7ZFYmRFR8EPiAEfc3Qj2Xij8sd9MKw+Qd80bfWwKyTlzZ4CP47wJZNsVy6rW
	Mv434kE0WNlmUZ1F0v12sdcMLKbmFCtacWyFoF23UoFomdB25KjHiR7gIhnalgcbywqzfzvQ+Rc
	uWlhUiR5l9c0c/9SqIHn9nPnWmgq+H/5+F7gePCNhyuwFKWHXe9xgHjDX16fiCd/oXG7CS+uR9p
	Gf4Um3LWYtfanef/psBp3fIqtbnZQc3K/I2iOSi14UkNarHb/dW36cd2DE6UhX/1qfgLzZPIvjm
	zvGETG/TKjql9vrk=
X-Received: by 2002:a05:600c:3113:b0:495:39aa:1359 with SMTP id 5b1f17b1804b1-496b570fb1bmr109057365e9.3.1785177106190;
        Mon, 27 Jul 2026 11:31:46 -0700 (PDT)
Received: from [192.168.1.187] (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44b84edsm17800535e9.5.2026.07.27.11.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:31:45 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v2 0/2] iio: dac: mcp47a1: add support for new device
Date: Mon, 27 Jul 2026 20:31:23 +0200
Message-Id: <20260727-mcp47a1-add-support-v2-0-d4591a2ce69e@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NywrCMBBFf6XM2pFM+hJX/od0MTRpO2CbkNSgl
 P67sbh0eQ7cczeINoiNcC02CDZJFLdk0KcC+omX0aKYzKCVblRLhHPvq5YJ2RiMT+9dWLHkgXR
 1GajkGvLSBzvI66jeu8yTxNWF93GS6Gt/Pf2/lwgVGlZVzbpuWlvexpnlce7dDN2+7x+gpQozt
 gAAAA==
X-Change-ID: 20260711-mcp47a1-add-support-3af1248f13a5
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Crofts <joshua.crofts1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785177105; l=2028;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=XcLu/pnyI5tANXTm5SFHad+zcyS/kPl/xXh7gOq7SU8=;
 b=d0zcvUdDEcgYPMvpvWack5mjo2zmYNiUr3kRUoW1qaTf+FSZJmLomIRC4nBgzDLmvHWywPYXE
 GrXjqP4161jB2qEV7jdorMuAMqUUNQhkpgtq/AKvYlWaY6DtgcW3t42
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
Changes in v2:
- dt-bindings: add slave address enum to dt-binding
- dt-bindings: remove unnecessary example
- move driver from regmap to i2c_smbus_* functions to reduce overhead
- remove read test on probe as it's too unstable
- add 20us delay on startup
- style changes
- remove excess mailing list entry from MAINTAINERS
- Link to v1: https://lore.kernel.org/r/20260721-mcp47a1-add-support-v1-0-da045a2567e3@gmail.com

---
Joshua Crofts (2):
      dt-bindings: iio: dac: add support for mcp47a1
      iio: dac: mcp47a1: add support for new device

 .../bindings/iio/dac/microchip,mcp47a1.yaml        |  50 ++++++
 MAINTAINERS                                        |   6 +
 drivers/iio/dac/Kconfig                            |  10 ++
 drivers/iio/dac/Makefile                           |   1 +
 drivers/iio/dac/mcp47a1.c                          | 169 +++++++++++++++++++++
 5 files changed, 236 insertions(+)
---
base-commit: 0506462caaecb179708657142575823177c83783
change-id: 20260711-mcp47a1-add-support-3af1248f13a5

Best regards,
-- 
Kind regards,
Joshua Crofts

