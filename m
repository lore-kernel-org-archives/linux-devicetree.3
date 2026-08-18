Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D251641A909
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040505; cv=none; b=UNK10wDPcwYZCkooFJIShatts5SEmjNWWG48c139xcygRAB6G5roT7BnkAP9R7bKuHtjvJL+lMTfUYwc3X8Iuy/BUp94+VCDeIDs8QlHsWDzy14yZjMzErEqyWBitBu8BXMwoNEUD0S/QZTqC5dw810aYJq9r0Cb2U0PetA0Hm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040505; c=relaxed/simple;
	bh=0H1l5ai2bzbV4VB1a/jhyZoEvATFbEu45/aKE1f24Lw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lJryg0P8JtWo472RAS3ptBXfNaJ2zVkjDxNTRbs4tFj9p82ndd54lI/EDVAqcNDF7uiPQoZ5TzOPL+fIsK4XBH1O+EIX2WiF8IlSAQuoajqZCPm2HtoAmCILYb4i4Y5kNHeQRtVQWsEghTyad/pOLwgY1HEQKlLNMUgP4Jrrq78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaODIvos; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaODIvos"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d5cad1a6baso8670425ad.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040503; x=1787645303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+D1J/9ZlL6m18wtBnsr3GqvUcikepsKuBSpWqZkiPic=;
        b=WaODIvosd1D/y6qkw8lmf+dOVZq81xhYnwZMouDL7WVKHQjcTCIuvOnGYKKxEE1bEe
         zGyyDxhieTwjScQ9RVqg/L2dgIOqI6qRNcaR8/iok8a+0XTlW50RCKJ1N1zLaGVaAay9
         Y3kA3UjmeY7q2ZBPKg10tJjE156m9STKk988z0KxiYEY8CVvykCHet4ZERDg5MRuG8lc
         vwKTURN7PEF1YY6Gfj52I7/s4nTYu2GyWldGr+wpCa1yTX+gUB9XvD9KZ203YNAK7LHs
         Teo038VGzFqxMTnIGjEa5nAtDAR1wwOHNJsyrrQGzwCg5cxx9TtFlNGDzjSt+tBJokDB
         xUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040503; x=1787645303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+D1J/9ZlL6m18wtBnsr3GqvUcikepsKuBSpWqZkiPic=;
        b=OCXYzxNDrfdr+tRQgU2DsW1bIELoFTaCj3OSQkfgKiSRVvwfTy3L+Kq5QcKc7ZaRMP
         S3hG2c79YlLRogVyM0SuAB984MntlVwQSP4GGzyvWNYHZbpYWYomAfqX4b9UhpNKrpFy
         9mUfEOVtzTtmX4zSNFa0RTXfP2KdIuRwE6YS1QADGIgXmsb7MWtV11HALEyfDFexplia
         nzBXdgkMv9UzSojYO47zEgoDU1MEa28hBKvQvX3hl5QdOcxRMSSMcsRoqHDNrVI5YOF5
         TDQXGRUrwo7jyhAIe0zxE+hwouf26X7tXfVzkogSBp7B1osH8k8OQjdgwoxuf74Dvb9i
         6F+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpMRB1o6ge6VdjpB9n99tjVXCc751nF7SRzqVBKwbZwMnVrOFk+u51lknVwBA9k+w4K5GdZK2p/CUcu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0d+SwJCliyjrbNWmh+G0PXg1AT/4X8B/uj35H/qD8TKcC89Bn
	hVW/Q6LarxPJxM6czRzZ63ucsOHjdwCzrFh4LTw3pMzd3i9vQDaJyqEn
X-Gm-Gg: AR+sD10rQAVhnjxAGlr5PTgxtaIru3QB8P4ZFDDuknlbPT9BLIQhv07K/wNVkp9Rlo7
	TbnBM3OiHUUtGglGe6sw7VD66ppsTGHfA/tDJm01MDxWdkPlYJRAwcT+9+zOj4go4BydqZTEqhd
	YgVI1eicRG6nL7fQbE8TwEhiorX5Ctsm66VvodOt9M18qENh2/CMpH8gpUOVcnpNthmOYRd9BLY
	BRBXkG5g2A7i9lMIPk/3EAEZB4Sh2+7r7WivIsriM+faghnbiJ59bzKxQtpbjXai0ErkJ9Fg98O
	UA9KHSdMDP+aiE3tFfSMu4P9XPcJ+L0qb8ULRYmit6YH2HtTxJMGWl5xG8LeH/Z9X5bx1tSY92N
	BhXOewW+roTbx2pQUgiRIOpiACZxV6gL914WQkgPL7LvZfiGVZSIFVKbN3OEq4xrNZRnM0rECrM
	oZaEDvLw7BbOdJAU+ZTTtQ1MshPwtuqKPVV/2eQBwWyE+8RxZdqedBnhwGgUD2TYAJlmKRVrV/S
	oG38tnXH0fGMgP1GfoFfA==
X-Received: by 2002:a17:902:d482:b0:2d0:cc92:f7ac with SMTP id d9443c01a7336-2d5c514d4cdmr67117435ad.14.1787040503171;
        Tue, 18 Aug 2026 01:08:23 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:08:22 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 00/12] Add initial support for Qualcomm SM7250 SoC
Date: Tue, 18 Aug 2026 08:07:42 +0000
Message-ID: <20260818080754.4362-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset introduces foundational upstream support for the Qualcomm SM7250
SoC (internally codenamed Lito).

SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
octa-core Kryo 475 CPU configuration (1x Prime Cortex-A77, 1x Gold Cortex-A77,
and 6x Silver Cortex-A55) and Adreno 620 GPU.

This patchset is organized as follows:
> Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
RPMh clocks/power domains, and GCC).
> Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
interrupt controllers, clock providers, power domains, and reserved memory.

Dependencies:
This series is based on and depends on the following patch:
> [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com

Sreeshankar K (12):
  dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
  soc: qcom: socinfo: Add SM7250 SoC ID
  dt-bindings: clock: Add GCC clock bindings for SM7250
  clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
  dt-bindings: clock: qcom,rpmhcc: Document RPMHCC bindings for SM7250
  clk: qcom: rpmh: Add SM7250 rpmh clocks
  dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
  pmdomain: qcom: rpmhpd: Add RMPh power domains for SM7250
  dt-bindings: arm: cpus: Document Kryo 475 CPUs
  dt-bindings: firmware: qcom,scm: Document SM7250 SCM
  dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
  arm64: dts: qcom: Add SM7250 devicetree file

 .../devicetree/bindings/arm/cpus.yaml         |    1 +
 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 .../bindings/clock/qcom,sm6375-gcc.yaml       |    4 +-
 .../bindings/firmware/qcom,scm.yaml           |    1 +
 .../interrupt-controller/qcom,pdc.yaml        |    1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml |    1 +
 arch/arm64/boot/dts/qcom/sm7250.dtsi          |  556 ++++
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-rpmh.c                   |   24 +
 drivers/clk/qcom/gcc-sm7250.c                 | 2347 +++++++++++++++++
 drivers/pmdomain/qcom/rpmhpd.c                |   19 +
 drivers/soc/qcom/socinfo.c                    |    1 +
 include/dt-bindings/arm/qcom,ids.h            |    1 +
 include/dt-bindings/clock/qcom,sm7250-gcc.h   |  163 ++
 15 files changed, 3129 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi
 create mode 100644 drivers/clk/qcom/gcc-sm7250.c
 create mode 100644 include/dt-bindings/clock/qcom,sm7250-gcc.h

-- 
2.43.0

