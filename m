Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D1E3655CA
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 15:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583744; cv=none; b=ODAntlOmVDeJN/Am+Lq5ylMSa46ZPV7AFD6xO8/YECLtoC2osMgcIZ8t0NGinblOk5aQlP28sW2BMS7Mu9VcT1c4Mr8YPZ14NzggcagcyypORwc8OHK+s4THhppF7RQOHDu+YFtBQ63Pc26UqEhlHS9KdNAXH4dVBnF6P22dDso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583744; c=relaxed/simple;
	bh=Ty0g4P4F7c+Qc5dUbLKGZwOoXgVcOPCAOWMPRmFgvFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e/fPKJOo8pVuPUwGTIbgQ2hQUBlV9/G5g8J6P4wlTNJLHlS5RUPn8IsNFAoVzFVK3F9Z9VcNd8KJvcVQUKNhVjqo8g4VATWhS8aYpD2ydWR1o5hn51U5LwZVoTJ3YLGk/3qkomkNl0Kib3nvi+RS3IbKd5zFrkPsAxOXCgPXVMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ji5eJioI; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ji5eJioI"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-45837e52d8aso3296312fac.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583741; x=1788188541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DuO7/PraFPSbHMi7EyxWPZg5tO+DugLz4X8jMJoOXHs=;
        b=Ji5eJioI1+hfuihFbTVgwTol6EiFI51s/ShUsegWUUmbBtO7QqVnYLTQNRIStXghcy
         W7B0XSj1nFOxlOVLn+Zagj05GrcxmkCjxqVu0Ch59oecSGRXHOpe6M+dQmj/8Vh/MCvY
         LUN09uySSmXpgIlkL7raFwhXWf/JrevHCCF725srAUbP5nPVKDwCVGSuN0bRJ9pzv2qR
         S8cizALTtfVztnu+Ksnn8JRbfYsVM51gs17JoYN7WQegwXqgawRKgHCRA2FeL2hbcRJe
         IIokaULSW6wA1pQgKfeAB1tgnShmiIEEYjaxwRA+305usgd4Dko4CAduBEFSmqCk3FdN
         NMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583741; x=1788188541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DuO7/PraFPSbHMi7EyxWPZg5tO+DugLz4X8jMJoOXHs=;
        b=EY/SFbZGlx4+JEXtA+PYBIw3sWo52rnNYUCSJimMIHXjDEiEnepPTZZV7Z9AVReMbY
         eKp0Y6AZ7v8BUKegxax1PNTk6S+rHqfYZZBFel3FNEOPbMKyPAwyMdJ4DbI2DKdIjVkW
         pJMNE4FgeDixxVi9XX3ZUSdA0S1tkBIxeCtMP53UaA6MG+sk5oehWm615Z+Q7Cgo9vyC
         Y3WzVBLOuNAXAj9Xy4Mkn6FZdAa1YORXuHDAEEd7cxI5oSY6ciyVN1Ei/fQ2bik7a4C7
         eKqLgyAvnwcHmG3MkawCKHyKQH6TAlMSGCA1AxAx3BKGzXcSRNCSnap92/KKW+WUQBgj
         XMtw==
X-Forwarded-Encrypted: i=1; AHgh+RqUrnl4KbG5kUilbl2fsXsWwuln0J62odWSSSKBvabIgD73IsUyAc2zw1WJ4Hrfp7V9dyZYydeEKUel@vger.kernel.org
X-Gm-Message-State: AFuF++kuT6uSqANXlMIHO4Og6CemUZcx1bFkgi2EzH7uxzOowfv23Tjf
	56PMwn3WHx2h0YY0LOEIJbYUPDw2Fd15xYIopnjExn7+tmp3gHmnY5yw
X-Gm-Gg: AR+sD10ZgYimh/h4uXE/lBqjLbv6VTr/FIy4RDRAyDW3NMoR4OaAQWZZx1PQTEIzVBa
	XsgClQPi1hvGxl7nvaFVEKZ1pb//N62K6vMg3COI+ZCq0CKHxt8z/NAhyUQgjGYtr6qcHNTQEMI
	pUk9wjNksWlYmqHvdmD0MK/snGC1fHWj8Ya0UYyFkN1Gam3xb+gLRJS56t1AgETLHug+eC6S6ty
	uwOsgZi2s8xdkTWVI9B3EnSCd9/H9Q0wclVzh6/6ACGpuFxrkfVoGh83L5y67K7YWNGyQnFv8VF
	RovjZ0Syo/WHKpmPJuTtaCXUW7cZYMTgIinUYuGK+uNyM6niLZ/qzxXgQ82LGvTgJqjNmL4sBs8
	8AAbvMleFHEhJPWRJ6n2NXuGws2W8JhrR1bejdpRPHiiTL6OiUHUxIb0PWNa4cyPocZygxo+1ih
	papk+YcEtW4m5vZJyY1GpI0TwY4bOeWvpSK37yUXYZZXMgYJoS8w1cvfBHVAMIWQjAo9Ts5PI19
	nVDieMtQ7kK
X-Received: by 2002:a05:6820:151a:b0:6a1:47ad:d18e with SMTP id 006d021491bc7-6b159199686mr26114840eaf.2.1787583740856;
        Mon, 24 Aug 2026 08:02:20 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d381csm30035247eec.19.2026.08.24.08.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:02:18 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v6 00/13] Add initial support for Qualcomm SM7250 SoC
Date: Mon, 24 Aug 2026 15:01:43 +0000
Message-ID: <20260824150156.1310-1-sreeshankar0910@gmail.com>
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
octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
and 6x Silver Cortex-A55) and Adreno 620 GPU.

This patchset is organized as follows:
> Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
RPMh clocks/power domains, GCC and cpufreq hardware).
> Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
interrupt controllers, clock providers, power domains, and reserved memory.

Dependencies:
This patchset depends on the following patch:
> [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t

[PATCH v5] Link: https://lore.kernel.org/linux-arm-msm/20260824130437.2771-1-sreeshankar0910@gmail.com/T/#t

Changes in [PATCH v6]:
[PATCH v6 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Make all clk_init_data instances const across the driver.

Sreeshankar K (13):
  dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
  soc: qcom: socinfo: Add SM7250 SoC ID
  dt-bindings: clock: Add SM7250 global clock controller
  clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
  dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
  clk: qcom: rpmh: Add SM7250 rpmh clocks
  dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
  pmdomain: qcom: rpmhpd: Add RPMh power domains for SM7250
  dt-bindings: arm: cpus: Document Kryo 475 CPUs
  dt-bindings: firmware: qcom,scm: Document SM7250 SCM
  dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
  dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
  arm64: dts: qcom: Add SM7250 devicetree file

 .../devicetree/bindings/arm/cpus.yaml         |    1 +
 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 .../bindings/clock/qcom,sm6375-gcc.yaml       |    4 +-
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml     |    1 +
 .../bindings/firmware/qcom,scm.yaml           |    1 +
 .../interrupt-controller/qcom,pdc.yaml        |    1 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml |    1 +
 arch/arm64/boot/dts/qcom/sm7250.dtsi          |  771 ++++++
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-rpmh.c                   |   24 +
 drivers/clk/qcom/gcc-sm7250.c                 | 2275 +++++++++++++++++
 drivers/pmdomain/qcom/rpmhpd.c                |   19 +
 drivers/soc/qcom/socinfo.c                    |    1 +
 include/dt-bindings/arm/qcom,ids.h            |    1 +
 include/dt-bindings/clock/qcom,sm7250-gcc.h   |  163 ++
 16 files changed, 3273 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi
 create mode 100644 drivers/clk/qcom/gcc-sm7250.c
 create mode 100644 include/dt-bindings/clock/qcom,sm7250-gcc.h

-- 
2.43.0

