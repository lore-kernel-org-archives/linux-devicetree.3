Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CB23176E4
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195427; cv=none; b=uG2hRNxwz43UfvBnHOoV/c/Ozf6/FXw1Z04XkN1YG8Hanfn4BWnYc9kjG8FTO30iSyUreXxO0hXPhco74gvohF3PKJ68ontRID5mpcLZKBaVT4wdksNJxDygrP1KzkFKjtIp8DVttXIOGUjsNThohHBxORzrCMas3XmcQbMeKh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195427; c=relaxed/simple;
	bh=JSxBoC2uoLr6BLbqbSeKIFf7QHBtHs3aqqips2RK4jY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uFzpwXbeIsjwqR797MnMWwAhoI+wno9h13Uk0zr4BiF6Y0UfAPM86RP4rePUNKJClBgVWemmOVN3zV/QAO+bpb7NkKAV3TmAfCmAWTriYg0VcCiWqw9QwZEOZ0+6t39n+Hvzkr+jyUYv1w1pnWetRbCnZwPXSBDX510LoLCm9pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbIeHj7f; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbIeHj7f"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bab82d75fdso16174975ad.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 05:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779195425; x=1779800225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4KyP1NebRw4SwpgMMJ6Ldhqk+fU8RP5i9hw4k9Hf88k=;
        b=bbIeHj7fTIqHYKszvAeKqbfd/u5ltg/SZfRYWQE5itgNYAd7MR1MxsgRBIHp9541uD
         1cdITlrnt0EXB3y/wCP+471O3xRRfOlyG0D1nFRoLmQoPT5CiZjSYYFiEdVal3tDpPlP
         a8zacsG5SxbWal7eCgTo6e8nMFNquvdjwUDiu/9++BX8OrFQXSlWlI+b2E2AuTn8jUZ0
         pafrvXhXgZuQ9uCsH5v0o8exxLBI1rpEDGD/UZDS5NG6JRNwvY7Y+IfXSJPk+kEd4OoR
         9Fha4eTpozohom0DqzjPkFWgxYIzOfHuCIc93yP4pEY/E9FuzNkqxgMFeOa2Q2YnEbs7
         /wMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779195425; x=1779800225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KyP1NebRw4SwpgMMJ6Ldhqk+fU8RP5i9hw4k9Hf88k=;
        b=SqdvPVbBlkUgpmCWfkTa2HO4iQJ+g5uvUtOYT2KdC69PgTR9L/qpami3L3pp7hpaAf
         hOmz8NOvrKVdVmQU/DJOxN9+zbsrsvng3eaXfhDu6DGtHURKUulxU9SAtKGEtwWRKHAL
         QXeh4NisoYCcZ6ZzvQ2y5EvApLNIyJWMPotprJj3rY4AUcq6j4QU2qBROAd3ex+3O2zV
         YG9ZhDR1JID7ORfiiBy5CYHFb04vnBVu7Y68F5okhopLZ6hU4JEZ0qNJloBfTHfqIfZQ
         pGtMUxw2Ixiy3Kx8lGO0I6H+OKezz1s6rIAtrUNhX1YNnN7OUB9MgLRXWaF1IrYdrWZP
         SVkg==
X-Forwarded-Encrypted: i=1; AFNElJ86teER9qjuAefTEIuO/IfmnJvvliJ2iK0Amb+AzMgEgBomMW6VyeQ5yNLyifpfIKE2kuGH4iQbbYYK@vger.kernel.org
X-Gm-Message-State: AOJu0YzVDgCOM0BdCYuYCy2CT19xISbZIl4dcFPRx66CbH8nRXKTJxVV
	uIE1IU0FAHCJCm8gOXn9t63kdiD0BCnTrHDBXtZADVixZjkoaGMGGkpd
X-Gm-Gg: Acq92OFWBVPmNTxiQwtusk4AiZug0TOdrBUYNIH4AS4d7SWJuKuM4w3UVY7DdojEuid
	+9Pt2yYmKrDuA7KTwMx9QmKj8vinGRMQ8i24q4XAeTjdXv2SD2c29QZoaNkHjivh7SpiKjafm+e
	P9pR9djTqY+g0OQRErpRyySU8QgLKDL6wf//iTZoTuB8/HY8+qH+hQZ+WqfhVWzg0OqQNcO4FAj
	OavjeHdHbULiqcnGAoHoY8cC6NOAXXHAHXAXvbZNVCNCk8yN6BPwFsrsPZvG3WuRdCd8UhD56tF
	p5MBxapNbjYou6s/b6nJFNWZJ06+YmMWpxpZbeWxPBZzZviGAOpt/ng32IVFRh35X9xbmksTnP1
	/R/Yaiia75WQFQ8SfrQFwJ+8Mc+U1HLmYfZh6zH6CkgE2RksO2tbtT1pJoxgm0WHZZHUIIrvtR8
	jOvWH/4ADD6tA9Q9Gzsa6DXMpI2lUCL1t5ahNRgTQx6J9nY/PL+BxVjF3XLA==
X-Received: by 2002:a17:903:2ce:b0:2bd:6cab:85d with SMTP id d9443c01a7336-2bd7e782281mr204483575ad.3.1779195425227;
        Tue, 19 May 2026 05:57:05 -0700 (PDT)
Received: from localhost.localdomain ([2402:a00:163:2ce9:6421:6644:4454:28e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d2360e8sm194025965ad.82.2026.05.19.05.57.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 19 May 2026 05:57:04 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: Add Vicharak Axon Mini
Date: Tue, 19 May 2026 18:26:52 +0530
Message-ID: <20260519125655.23796-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Vicharak Axon Mini, a QCS6490-based
single-board computer.

This series adds the Vicharak vendor prefix, documents the board
compatible, and adds the initial board DTS.

Tested:
- debug UART
- eMMC
- UFS
- SDIO WLAN
- USB 2.0 host
- PCIe

Changes in v3:
- Dropped unused regulators.
- Pick up Acked-by tags for the binding patches.

Link to V2: https://lore.kernel.org/all/20260518173039.20592-1-blfizzyy@gmail.com/

Changes in v2:
- Drop unused Type-C VBUS regulator.
- Drop invalid camera thermal zone.
- Drop incorrect PM8350C thermal alarm override.
- Fix PCIe1 3.3 V regulator name.
- Drop redundant EUD disable override.
- Keep ICE disabled due to fatal SError during qcom_ice_create().
- Fix pinctrl property ordering.
- Sort top-level label references.
- Add blank lines before status properties.

Ajit Singh (3):
  dt-bindings: vendor-prefixes: Add prefix for Vicharak
  dt-bindings: arm: qcom: Add Vicharak Axon Mini
  arm64: dts: qcom: Add Vicharak Axon Mini

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../dts/qcom/qcs6490-vicharak-axon-mini.dts   | 1025 +++++++++++++++++
 4 files changed, 1029 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts

-- 
2.50.1 (Apple Git-155)

