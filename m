Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1815D3769EF
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 17:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705400; cv=none; b=gVuVumbrx2Z5+pNpmr2Ay1eomNGwmAnm88dz2GBDB2xnajueGUnYGGh8FKKsoNoXC0Un/QPnqanmEXItPST3lRZGr6j3E7DaMVjzDj5vbp3DiH5S8Cl+A1tRAXsGcbD/wIBSGXrPPSrtf2qLIBh5rBu+3lB3WgO9mn1iVQNMv3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705400; c=relaxed/simple;
	bh=KJPTUJzhlbeD9LlHd0oNOz5mq5P5fVmXjF0iQMF1Jp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LTXTrKXoEive8FPDDPEeWtRrH7Xzah42eXAC9mBOSt1tTZNx52bWETI+yzk6j3cLF3sbzlJZoeyzuOGNnvO2WKmolM37WxIeDsDrFlluxTEvEd1x674F9MG/g9/tCvlNik9OkdIvCexEWbwqiqpuP67QIPgBuU2/hjHmIXsyI/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCVXGJPT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCVXGJPT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493e4cccd8dso5177575e9.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783705397; x=1784310197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8OEOROS/ylUhCcTkJLvcG8rNXSrm9rHJ6h2jWRJDiRI=;
        b=rCVXGJPTOja6KqCHIafk3ncJXU9x9LLpGiig9EIwpRZgVMNHErrC6Y7FJAdkHpCc17
         7lLZbCHAUb5mNrdZP9Q4RBsnotV4h5ksHSYc0PTAWYI2FYcBUGGR0NmgAqAiAiHPNZDW
         d3ID7SsZ4H704LB1zG6vUap2abJNgB5PeQ9MJiP1PSxsAWYDIl2vEdUM9EljiDbQOz16
         lqtiTAochzfIigW3VSaZFgH2ak3+4XDiDDdwg6f9pxLzVsV4GRqVJLNAVM7vwiC0b+1Y
         iQFQHqVm7fFvqTdE8H9g31R62BtYwsdvKpr+ce04IQASbHPdfhys617W9aCMLyeOeM5V
         yb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783705397; x=1784310197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OEOROS/ylUhCcTkJLvcG8rNXSrm9rHJ6h2jWRJDiRI=;
        b=ST+cIuEe46TLmR8CRtNYOtY3QqUHyTSXxhZvgRJYp8lvSJWqEAjoq+o/AHiiXMLhQH
         1EVCpMCTStdgMm9/4H+cSwuZevj0ST7YRTyREmmsl6+S28QXik2mdg5YVyqnWoXylenQ
         7kDHQ1MBjIeQd0WQciv1V3PRhR4niuMHj2/yCxvKV0EbESPtbeycUsJqPbTMmfAY88t5
         cx5rGDHTsLYIMzwoNR6bZnuKuchAbeEorXH22zf3ZlUqUEv7YAM7iLZ5n2BvlupTZP/E
         B17+f0fcUwK7Y5u5bLyQNwaIKFjCBbFT6XCcpPjpx8izOB2/SXEJ2/JF715fBeDz0n2P
         7hYA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2+YMFI0IoKm0Os6res0bFyMd49iGGVQ6aKDkopMdN/pveSBwsbRzIQimF7twwaHoMxbb6g5vTgiW2@vger.kernel.org
X-Gm-Message-State: AOJu0YzAvE0UDX+BFoVJ7cd8PzGi0MTp//tnQarwuWcDzdbR4WvQE0Gw
	yW5TICRlCql95uPQU+WwplGaIn1o+XitJKf7MinVyUAnEwh1uJAK7ODj
X-Gm-Gg: AfdE7cnr3hh8u3Ii8L3AjVpnt3NW/7mHavCQxO3XsG2yjMBV9rgAmUJ1APN/DMbjOgb
	4aK1YiIrS2JVCcvtfScTnvRma35FMX0rZVGxw9t+XeNeUvon4lVaa82uIiQSXK6SmMLD5bGwslF
	d5e1YRplpPc1bBi4tRGTiYx+UpWdrECPiVHxoLFzmBswPh8BoDQoLau7HcIW7vUycN20zZhME0j
	awYn+YV7dVxwbl987bcOUTi8/V/okCc2TBW0ch6MV695KWIA07x0X26Z/TAn+XDGMBuRt9PQpQl
	3gvnOSLq++yF9RETl9zH/FbEMxHnB7b8gbnRlDUIZSUA34PQFUSUWWzt9y5Kz+boaEz4SOAy8yF
	nco0IZ+hDLiCTy49FJ21fZwbH1KYAnd8KzLXpi7trZTRYvEKJYzHLoGGJuCZO+SmCRgkta2ABJL
	VklZAGIqhj9AcKdBrQSsQyHFX/QsnkfHbplZrNdVcyNX/JCldoG3kw
X-Received: by 2002:a05:600c:b90:b0:493:e97c:10e0 with SMTP id 5b1f17b1804b1-493e97c10f4mr90835345e9.35.1783705397221;
        Fri, 10 Jul 2026 10:43:17 -0700 (PDT)
Received: from GLaDOS.station ([185.81.127.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d91bsm67170201f8f.4.2026.07.10.10.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:43:16 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH v3 0/3] Add support for Variscite VAR-SOM-AM62 and Symphony board
Date: Fri, 10 Jul 2026 19:43:06 +0200
Message-ID: <cover.1783689915.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series includes:
- Device tree bindings documentation
- SOM device tree with common peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v2->v3:
 - Add audio_refclk1 clock
 - Removed pinctrl_vdd_mmc2
 - Fix reg_sdhc1_vmmc regulator
 - Add missing properties on pca9534 node

v1->v2:
 - Fix AM62X_MCU_IOPAD macro
 - Fix OPP table comment
 - Remove reg_vdd_mmc2 regulator
 - Fix reg_sdhc1_vmmc pinctrl
 - Add reg_ov5640_buf_en pinctrl

Stefano Radaelli (3):
  dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62
  arm64: dts: ti: Add support for Variscite VAR-SOM-AM62
  arm64: dts: ti: var-som-am62: Add support for Variscite Symphony Board

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am625-var-som-symphony.dts | 555 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi  | 483 +++++++++++++++
 4 files changed, 1045 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi


base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
-- 
2.47.3

