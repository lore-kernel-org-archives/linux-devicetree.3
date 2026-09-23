Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509A528373
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790137183; cv=none; b=sBrpDFQLigtsKIensKoufiQ0N+NITofYddfHTMi3XOKDR9FIGhcnz0/+nc+pWYjTGgxDKEtIvtMCCTAookfWNaigcKn9lsLNywOGfQ/CBQp081i2cqU2YP0sh+6hLweW6mKNN7rK6x6R+PzA89HOMHTh3uGk+QRteVyvwWpRks0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790137183; c=relaxed/simple;
	bh=VnTRhCYz56QFEIHWtX5iIOB/v8A6bH/AwJdTUOxoN3U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qSLZlXr5eVXYGS18C5rqa1Ki9/PyFj3t8FF6t3tsl5tmQfB+xUpejo4c/7TQZCyok6bVner4xB5CEAAZOpXJJiyi7bjQGBrjoxll41TfI5Js1o/tj7/jKSHAhnkhGk4fu72UfsFK8GrkOTUW6da7rDXDftwj3Fte7fquuXpaeuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/Moyymj; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/Moyymj"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so410083a91.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 21:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790137182; x=1790741982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSBnzQPFA3sp+acWAbZYd7ni8m80ai0yOy1PIw/qr5E=;
        b=J/MoyymjonJKMIs5WM1NpcySHATUaZ5my5vof7PHmXCW1Z7o1l2UjqB8mnxa8trDh3
         3SB1lumrDy21oaYuMsKpqiZGG1IIKbwRRCf/YyOCydiqIjlFqx14nH3HbzNCowpqIvZo
         PkIDswAetUU2TsXLiUWexIJ3yYKlkzB5INhNuurEGFNR/XkGAj8uSHHKx+JxsU5Qf53u
         SBltOGi8kQsgEGxas+7O8ncFdDw1LeU2uJtVVxfRPNB/WSFL/TULJZxi+uzVoirBRD9E
         5E/Aq9jVNYxsTDvmv4xQQGvPwPG1zkrPmxvUQkgI7ftgcJODRYL/dHq1XI+5G1rV3aLw
         PPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790137182; x=1790741982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSBnzQPFA3sp+acWAbZYd7ni8m80ai0yOy1PIw/qr5E=;
        b=cuaccjp1RyzIJtqjIO9FEEwXvh5+2qZjEiXqqgzV1f8heEgWCyDODYgB66v/PL/N7+
         GxvG729qMeXomKDySDlMuTGKyAPMtCSYe9yOcr/dQlPzI3M75eBdwGD0DebPnLu21LyD
         Y450extNayTQK/BlM8XJlgRGKKZMxUw2MEQl8qORX0pQtVUbqw0y0KtPUdTTYBFE1jtJ
         nSsYalrM71reCB5Dj4O6zjp2PGbJVQ+7VzZDa8KI1TYnSnW9fBstc1c7PXPOB2ZLpmbB
         0BwdT5+9K/PugbNdV1C175WR6YWjLlhIC13Ha/+hA3k9Erg49LS8ZkFaczo7tGxPANx1
         dztg==
X-Forwarded-Encrypted: i=1; AKwUvByl9zP2lJgmiAYN+bszB6QIBoIx5ZzjNwVUShkuu8O6nDKlGxGCqNHk2Lr/ikm8gWc22/wUNlVgGoEt@vger.kernel.org
X-Gm-Message-State: AFuF++mAjaeA8zG/t32LpIPbp2giZsGYK6Ujat3wbKTXiINV7+JG+Enn
	Ra7DTpLV1WQmRyPkrU8YWe2VIOt2lJXL0d5LYq+dxKUqjnJvgmX6FbUI
X-Gm-Gg: AYBFou1RLRt0GML4E2TZHPa21rCA/DGDfhSVvSbrU+X6hENsTMtgpGVkQ7VyeZOrEiQ
	yCA/EsabyDfXnEzEEjgpOFZP6/iTN03t0bW4UaNtV09Y1/DTarmJwfBXgDZXfVA6KREsx/tO56H
	3B2DToJ/Z6grxSm/Ar9Tm6yIjtayQ1kdEQ9xaiMepGdhbKa/ZgoQ25jMaDHgcYezbj5lCkHkwfb
	c/sGr/FqGCuEYm2tGacMNe2x8VcVoleN0v2BxInAjE/bNXNEu24mLxzQbRBYqUgvKj37hY95U6C
	edLK9M0l9KYPs7+c+OnzOSWYMBShQmyq5tfnoHxjGuRtWKrez59CPti74FJkkk/vCH78WBRCPVU
	hwv86K5MwJNYsf2YK7Hj8n/ko7n8yf71OWx8hPPzQRrEkvpIRFmfNsKOnf+CHGF9snaVKvP3SG2
	5l8gSI9yMGSf6AIWQtzafTvwZtQlci7s4RH8v0t30BnF0w/6a21qqXK5gcZAQNNSmht2Nw5z4/I
	Z9ZbXt/Tw2AHbeGXSOYYB4RuvjsO1gEJI9JEOChHgoDsnKOEHPoC8nF29UcHtyAM+4Mauk=
X-Received: by 2002:a17:90b:3843:b0:3a0:50bf:d497 with SMTP id 98e67ed59e1d1-3a07e4a2525mr1289494a91.3.1790137181650;
        Tue, 22 Sep 2026 21:19:41 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddae723sm2510243a91.5.2026.09.22.21.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:19:41 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH 0/2] spi: ma35d1: Add Nuvoton MA35D1 SPI controller support
Date: Wed, 23 Sep 2026 12:19:24 +0800
Message-Id: <20260923041926.425551-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

This series adds Devicetree binding and driver support for the SPI
controller found in the Nuvoton MA35D1 SoC.

The driver implements SPI host mode using polling-based PIO transfers.
It supports SPI modes 0 through 3, LSB-first operation, and word sizes
from 8 to 32 bits.

The controller provides two native chip-select outputs. GPIO chip
selects are also supported through the SPI core GPIO descriptor
infrastructure.

The driver programs the clock divider according to the hardware
requirement that only odd CLKDIV register values are valid, and rounds
the divisor so that the generated SPI clock does not exceed the
requested transfer frequency.

DMA, target mode, half-duplex, 3-wire operation, FIFO threshold
interrupt transfers, and the I2S function sharing the same hardware
block are not included in this initial version.

Patch 1 adds the Devicetree binding.
Patch 2 adds the MA35D1 SPI controller driver.

Chi-Wen Weng (2):
  dt-bindings: spi: nuvoton,ma35d1-spi: Add Nuvoton MA35D1 SPI
    controller
  spi: ma35d1: Add Nuvoton MA35D1 SPI controller support

 .../bindings/spi/nuvoton,ma35d1-spi.yaml      |  70 ++
 drivers/spi/Kconfig                           |  11 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-ma35d1.c                      | 701 ++++++++++++++++++
 4 files changed, 783 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-spi.yaml
 create mode 100644 drivers/spi/spi-ma35d1.c

-- 
2.25.1

