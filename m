Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A565EEA8
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 14:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776350563; cv=none; b=uSOpvYK9TVxGCVjb5diXLgkCGnIm3+ZoxTM966e2ta5cecyf53kEFO6kNn0lO2wMUr21XsNgHw64LiTTSnxhKAFcTes6/r8+VomEk8LSQQ7RCUCjD1TnqiFJXFsiQe+EZ14iBh43EELm4SXdpWAvcNkQaWOXukaFgqvIQNzl6zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776350563; c=relaxed/simple;
	bh=o7RjQadYHL/375cjm6XwoIOguUQh3DPk4SGVbAOcCPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iCGh/hQ+CwjdwLp7emo0uT0hxb5T4SkriJSrfSAh3ZEMN/2Iyh5+h7Az+5ECgExtK2/hZx+DuEGbXkVUTWX1zBsT2qsfaRrgeomjSXi9reCo739BpAFiGAujwzt/+1DFgN5sBwLPxwhgds38eTSxVMT+2weuem/cX+X7FA9C378=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHdggSbA; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHdggSbA"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b982b0889d8so1198112866b.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 07:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776350560; x=1776955360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kV10FdcC3w13UCLKuFTzhb2hnSCEpOxDvfqK3oc2E8s=;
        b=JHdggSbA57Iie/Fxx3IzNvDlAMC/JIZ8T4unXqLV4Nl+uJ7MWwV9PrErGXsUkavglV
         YIBmcFapRtot16rfq0ZQfr2KFibEYEOcJa9rx1eNveKNSO3656s7uyoIKSZV3DQ5UvON
         iyoJIkYd06Z+HoIHmHrYENWx0XdoPG1m8N3XMAFqpptzqKIVp9S3kh6vGfpdkBCzI4MU
         BI+aKgwRq+EkS3Gqh6yB9Zpdq+YUYf1HGCzdtHdaKyjyviFHSLke2XG2CTJBttQxdlID
         TvWQChDq4mM5PiLFzlLMt4zD8BvUAkJyTJR2J0T+hh3fElzAKqlnSuirwE16IYfVaaZ0
         Al+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776350560; x=1776955360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kV10FdcC3w13UCLKuFTzhb2hnSCEpOxDvfqK3oc2E8s=;
        b=Ins5xtfj3cPZACa2HBUsgrhQ+sc/33ETaV2j6qG6L/AMInGTM0x3YFcnWTKQpg0Axc
         0I8Hq/pzJhfY6THztWrecQGUq7y0Ke/OUzmTk0qBK4tJD2gjqFRVwTROPFaBil13NT4t
         0xGaVouZ5DiduKlrORAeDsxo3JRsb2AYoPAkStJ+deLTYc6HJbjJV6m0mjL0ZzQap9cK
         hLFKL56O+1k3AssVMtJjOwxecRHrMbQPesvwRoIOQFLxg4pYSUCztfNcW9UsiaKo4Khv
         8vlEmWxaWSWpvhE/yhbsQfHGNvyHuT8TmjSsDRgtqrH6UoUhlmro3fo7DjNgaOfQKg8A
         yMZg==
X-Forwarded-Encrypted: i=1; AFNElJ/IHHM5YCVRsZJs96VT6+NrmkZRQziP15QvCu36LDXYwESQLaAyMesNeUY2tG6c4AXWF9HbgzAEZGuS@vger.kernel.org
X-Gm-Message-State: AOJu0YxC89y3Dj0ZiBaRWq5iiOfR1RsGO52kxslvTNNzDQhQRG0e98/n
	EHCJfLXhQjd+pl1H4TMFn3xjfg9FwLA7uAvEVlRSz1Q0ZBYcgH7LKdRM
X-Gm-Gg: AeBDieuT8RaUX+MEf26Hi0PKfEs8edeK5iW2JYACQ9mElWHzAAMuqa1gXP9I53bWnpe
	DMhePJdhQtvg6xp2lkKq0ey569JkhpXhufFU0QGt3r0vbaKH/xcBxWoozhKwWlZ1oi1EWke3BTH
	WtPifBd1E0CyKIldt7kOQC9Pe56GC6AyKVq1dkA99Om0CYJjIe+fID/GuJClXGJZLOaTT8M68FZ
	mWEDFhQFhkZs6syhYzjOqTeDlqZnK6GtpeSyuztAE2LMFultnnZyJ8juf7L/3xcAKzCGSy3gj1c
	zNOQgluT6JZthhDlOym457fCsNDk95FG+zny8PgF7Mi5GbCBilwd0zJz9WemlmcN7wIWBM1S2X6
	mgqQDogPIKqYrvCiU4d25DxeEl283h88WvpsP5zEbv8BUZw3VKRdfesShpGBfakyJIr5pQHt9NV
	iWgYCXPYRqkH/+ooWED+2ATMcpy6UteUYN62l9
X-Received: by 2002:a17:907:782:b0:b9b:1cad:fe93 with SMTP id a640c23a62f3a-b9d7266157amr1436656866b.24.1776350560042;
        Thu, 16 Apr 2026 07:42:40 -0700 (PDT)
Received: from iris-Ian.. ([2a00:20:636a:3838:3bf9:3a9b:8000:4975])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba2a112cc9csm90502766b.40.2026.04.16.07.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:42:39 -0700 (PDT)
From: iansdannapel@gmail.com
To: linux-fpga@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mdf@kernel.org,
	yilun.xu@intel.com,
	trix@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	marex@nabladev.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	dev@kael-k.io,
	Ian Dannapel <iansdannapel@gmail.com>
Subject: [PATCH v7 0/3] Add Efinix FPGA configuration support
Date: Thu, 16 Apr 2026 16:42:33 +0200
Message-ID: <20260416144237.373852-1-iansdannapel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ian Dannapel <iansdannapel@gmail.com>

Hi all,

This is v7 of the series adding support for programming Efinix FPGAs
over SPI using the fpga-mgr subsystem.

The series adds DT bindings for the Efinix SPI configuration interface
and a new FPGA manager driver implementing passive SPI configuration.

Testing:
- Verified on a custom board with an Efinix Trion T13 FPGA
- Tested full bitstream configuration over SPI at 25 MHz

Changes since v6:

dt-bindings: fpga: Add Efinix SPI programming bindings
- Require spi-cpha and spi-cpol in the binding to match the driver’s probe-time requirement
- Dropped review tag

fpga-mgr: Add Efinix SPI programming driver
- moved Makefile entry to the end of the FPGA manager section
- moved "keep asserted CS" comment to first appeareance
- removed unnecessary variable struct device *dev = &mgr->dev; in fpga mgr callbacks
- trimmed unused spi_device_id's

Ian Dannapel (3):
  dt-bindings: vendor-prefix: Add prefix for Efinix, Inc.
  dt-bindings: fpga: Add Efinix SPI programming bindings
  fpga-mgr: Add Efinix SPI programming driver

 .../bindings/fpga/efinix,trion-config.yaml    |  98 +++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/fpga/Kconfig                          |   7 +
 drivers/fpga/Makefile                         |   1 +
 drivers/fpga/efinix-spi.c                     | 260 ++++++++++++++++++
 5 files changed, 368 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/efinix,trion-config.yaml
 create mode 100644 drivers/fpga/efinix-spi.c

-- 
2.43.0

