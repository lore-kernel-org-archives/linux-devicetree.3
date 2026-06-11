Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02EC29ACDD
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169211; cv=none; b=bQEJ0sXjOQtC0+MqtpoihrFYnTpJxLe0d5cTub9cDNCHHu4cpnqeY9GNtvPJmc0C5v5Zb8iVoZ8SYnUliZrfT/boqdmQ7jm/j51PMJ6s6q+1MbJE49nTKu7Y8nE+yr0gv8J0LmCzsYZr+hZW4A4suTWH9A+y9nrWpfVt/t3xsMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169211; c=relaxed/simple;
	bh=T7XryxoFPGMT4dHct0/mm5jUu/6vwSFpJtBOscR5LKY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I+5EHKGzB9W5S7melfJJw6NzbNP1EHMv3eGG8ycfhXjEf/hGrB4Lx10dTxsdTWtBfbZcaX1FeIUmuT6btJ3VlB3eM1tuh3q0fu5b48q9BjryJK141fVq9LC2T01XhWsGC5J/JgOESLN1BIp18aPDKu2YAe9C6OdZllgN7xDEzqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nm7yjAci; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nm7yjAci"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84231305a80so4337456b3a.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 02:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781169209; x=1781774009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hizbOWzAp2GvHnkKmoXoB4flLKn0ZG1pSO3As3FJvhg=;
        b=nm7yjAciTBQ9QEdYri4eIl0GPW/KXPhlfJos4Ba6c74u4cWAbG17bl/eP8lqpld4HB
         Vrh/gVv8LgWKrxaMDR7SiGGDFN1TQKVWs1rKXOdIZNTi1bVvAAwl1GrFVE+cGSGQtXe8
         ADn0/6MXt7k+6tzi8KpK5ZkVtTlNyWZ7hdIME4VrCiy82ZF8fYadEOsqVlgCuQcfQrD3
         rulrcpsCKeV9T2WbfLJzCDJA5hEQ41SZ2XnZEhi3VAcF2vMK8p3Af1Iq0BmgepE2D/zC
         LJcGRs6YTtSIiHaE+7tshoxDpHNyXbS2yk45o93QYe4JO4eGpgBqGw2gr+r9naNlyN/P
         XG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781169209; x=1781774009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hizbOWzAp2GvHnkKmoXoB4flLKn0ZG1pSO3As3FJvhg=;
        b=gdOl1hO7VV0B3V4OY628zqvRhzVzgee1djf32y8zWncri/KUMPyAkB/Szbc4juuY8M
         WUsZ9G4eEXfoSxv1/yT3vMtImue+jvBwF9lXlUkgLqUQR2lMGFiVIxhhNHrfRjlDejRE
         IibMe2cc/4RCXP+jGvGn9XOWAlXD7TIDab5HWHiKOCGqtWHQRJOYzCXrc1n4VbaFY6FG
         Bgs0C0nECGcrYx2X0825+b40ZpIMSpZUCveWPR+ew5tKni6p7PzhQnkMh34zQXcTnzIR
         pQUgBWDHrwpTE4VJHLw7rtpX2HrlbW2vez3dhAmeNt/GxlZjLJGpJxjv62Bv30PaEOZk
         pzcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9u+rR4RnZxlot9XQ+DoNqU+COIqU+rd4z2u03Xt8hrcx4cavhiTlmCZMTY4y4UbR561jX6ebPOKruW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw99ehap6tJqSSFfrIpMDDqUQgWoq0RHqJV0HhfbLRe1g4KIE3D
	/KhYFLKb1jPZr3ZuE1DeQno2xXyGxDAV/gn+UJ7n2NFA0ANnehT6hpx6
X-Gm-Gg: Acq92OHGC+P4aMYlYW/QRi26J/t/kUZKoPOd8lGb/uMoqfHZ9YRh3nYa4wxjqzGUHwn
	LjG2fbvwLGnRj3BXHBz9PsPqt3O0vXjBB0y4yKKwH/PzCyUsRZHNjTBJRfRqZvAylPKzvXqKQOo
	5VZ++1c3OZMb6m8fNau3lbgyAwB/q+md7XJVea2LNlqnBXpZnPolV2lfIFVuNy+t/TCZUphjg9d
	MEvrjVrsE9FJ7b6Lm/4ipD7H5/eDCgatcCGvn6TLjbP6E1gmikPnpWCdinTuYYTmJZX+rMD+GEB
	zbkIhyc634F415qeqhOtVpX30CCaTZi2nJsadyjOuOCG/X4a/s9/ZLdm3ezdvqf2MmlVZ4cd3MV
	Uoqez8H2vJ9ljUkNAGOnpHe/lMRl7BZhDqkFr2oaiiY4iFksiRc9nj0+0QddBvSAboo/LekN+wv
	h8885sc2UkDLs6LnOeMs04PmjVxTKEOdK1buSivwCsIW/E7gwhR0ne+BO4cpOvifST7/iLCpuvV
	rMJeFGWNoQnBfhtTXnoXUwz
X-Received: by 2002:a05:6a00:4512:b0:82c:b808:4c59 with SMTP id d2e1a72fcca58-84336bde6aamr2276246b3a.46.1781169208999;
        Thu, 11 Jun 2026 02:13:28 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84338319d4esm1417446b3a.51.2026.06.11.02.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:13:28 -0700 (PDT)
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
Subject: [PATCH v3 0/2] spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller
Date: Thu, 11 Jun 2026 17:12:44 +0800
Message-Id: <20260611091246.2070485-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add devicetree binding and SPI controller driver support for the
Nuvoton MA35D1 Quad SPI controller.

The MA35D1 QSPI controller supports SPI memory devices such as SPI NOR
and SPI NAND flashes in single, dual and quad I/O modes. This initial
driver implements a conservative PIO-based transfer path and spi-mem
operation support.

Changes in v3:
- Fixed DCO mismatch by using a consistent author and Signed-off-by
  address.
- Added spi_controller_mem_caps and set per_op_freq for spi-mem
  operations.
- Added SPI_CS_HIGH to controller mode_bits.
- Added a short delay after requesting FIFO reset before polling reset
  completion.
- Documented that the MA35D1 QSPI controller pushes one RX FIFO entry for
  each TX word in single, dual-output and quad-output modes, so TX-only
  transfers intentionally drain and discard RX data.
- Added missing linux/delay.h include for udelay().
- Cleaned up unused register bit definitions.

Changes in v2:
- Updated patch subject lines to match SPI subsystem style.
- Added commit message to the dt-bindings patch.
- Added ARCH_MA35 || COMPILE_TEST dependency to Kconfig.
- Expanded Kconfig help text.
- Converted the driver file header to // comments.
- Added reset control handling to the driver.
- Added resets property to the binding.
- Added num-cs constraint to the binding.
- Dropped the flash child node from the binding example.
- Used op->max_freq for spi-mem operations.
- Split low-level CS register handling from the SPI core .set_cs()
  callback.
- Handled SPI_CS_HIGH explicitly for the spi-mem direct CS path.
- Fixed spi-mem opcode transfer to use a u8 buffer.
- Limited spi-mem command opcode length to one byte.
- Forced spi-mem operations to 8-bit word size.
- Avoided driving bidirectional data pins during dummy cycles.
- Drained RX FIFO during TX-only transfers.
- Rejected invalid chip-select numbers instead of mapping them to SS1.
- Rejected unsupported dual/quad full-duplex generic SPI transfers.
- Fixed checkpatch style issues.

Chi-Wen Weng (2):
  dt-bindings: spi: nuvoton,ma35d1-qspi: Add Nuvoton MA35D1 QSPI
  spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller support

 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     |  62 ++
 drivers/spi/Kconfig                           |  10 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-ma35d1-qspi.c                 | 633 ++++++++++++++++++
 4 files changed, 706 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
 create mode 100644 drivers/spi/spi-ma35d1-qspi.c

-- 
2.25.1

