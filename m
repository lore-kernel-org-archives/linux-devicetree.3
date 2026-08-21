Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C550641F5D7
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 08:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299915; cv=none; b=dIYJP2/pDZh9mSP4lyKViLQeacj7NJWu5ZQ/lvf+hW8JAwYx9THtBB0v+CV6DXx+0zoG9NZP2LxGhcwy5p0Nlc99yU4jTxrlS98j5WLUOHNO483/p80HKx033diwXlCmsBuDu8GwUD4LJd2YIJxP9lSyy4RrCrohiZGW4oD8Zoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299915; c=relaxed/simple;
	bh=SYh8JVjyrgiYGMhi3isk6b1wRA3skDP673AgZxWg3b8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ftAaspBSpigGz6xlJ1HwLuz6LIZKjR1Oz+99hViHL55pSgPucRcMgaefOv8vS1pAa41t6L/OPz4JOaPD4ppJLlTsjWQ1dweu4wMTm7CEFx/M35XEf0dQiTk+iPkQpLh7eXIStu9CreHFHeQoaAWPoOAsSEvvWbuggDYSF7XVF0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DngY1SOK; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DngY1SOK"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso511720a91.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 01:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299913; x=1787904713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hgK4vPUxcbiUBUoyhR1t55G5/yt5ox/a4is866kaVjE=;
        b=DngY1SOK9yu7crPzhG0VC5Q5i+bxpDrZIKRT+2E/QrvdtqQo8aMY+07EOZ4WBvEs9z
         QXvWV5qjkndiSpsr+8IEb7LogdmroOMTT2ZKPixuDTWjDwKeYvA7VnheEveJvEcY2o0v
         h4m0qIzhDr7TNQ1nRuWbpVUSr/jMdzAhm+sZju0lsnFw+3+8UvGdGNCjQQsTK+DnPqkk
         rzzx9/BWx75aGvdyTyQtKB43hunD9+zuMzjInmU8zu1/UFi85icg6ZTPPfm3ZcmpfAfm
         gvZ4mNYi205PmZkVgdLynOCk0iWJjRI9xwa3qvm3cxub5hlL1W+izniL3srFCuA2d+Rl
         vl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299913; x=1787904713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgK4vPUxcbiUBUoyhR1t55G5/yt5ox/a4is866kaVjE=;
        b=Zlzm1IvmrAUkXiMp6rkwCdIy0ErZT9NLmMMF8gpJA+M01GJVCb0SjbREI3Il3f8+bG
         MVB2g6OOu2hoDop8l3o+AgMoXYrqnvmDDh1Ut6Ma2h1XQSFXk6f4xxb2tX7jPYqynofO
         775LrUDe+wzzRsrv1cykg1HladM2wnHpu2mIAP2FuwN8Pu5fysXPMRlO1rRaaHAFvSMe
         jFBDnwhdSuYsfy7mpWeHZQ9REatd34rQApotmIcDO0V9nPD4wN1eB1zyNZueCUsddyIS
         Nhq046qvb8JwXhOSs2fPFJJmMQgOfIa2l5AXufuAdw5Pvj7zE5hoboGPs5EyMAuVUH3D
         FNoA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9/5tHjiY9tGD/+Sx7LxsQEQ0rj/aAsSViGuwINpj+Jam41Zu5RpNtm7Xx/ZkJzEoW+iG3hGGFIM0k@vger.kernel.org
X-Gm-Message-State: AFuF++nH3e3uluncZUsrezQTSFEekxjDTZj1KbLMTkj9pAm+S+Do5OOA
	kFiw7ALrQ9SdJeLUnT+JPuEnR7Pf1FgpzbzOKFwsgnzL+UUUO8uHWjQD
X-Gm-Gg: AR+sD11hWDDi0VAk2y1QuX1vlgihONPpy62Rz2xOiFceiZwJVppfcd1CpbB/5eTjIuq
	y0S6IpJJL7U7SwZDmo22QbWs+shftSxoADTjYbE9EE/Agl+FgHVk577xN8ZiTOFPDp0ImWznFZs
	Dw9vbCj6ttKCoRgfVcgtoLS+73b9opxxkFaWyufm6QntKyEtiwKjW03zJo1D+DAyONyJp8luw+7
	xvxP6fum7lwIdVLVcjvaePJNpc+mH5jYiHYQ+59rLjlbAnMW23mapwKhHJXfmbzqYjMtd4I1pGm
	/TvFQNkAXdIymrCUPDXk90Mkb3PkDL1vRFhdfyMRbnKkc4A+jxWoSG9MyLFkjbz4KlRfInvVC8J
	pLNC46lTvhg0s4gE042nCIek1xOB5mhVwUO1CHjN+RqtOCdNqaVvxdHw4Yy+wFuzPQFmpUGdSwl
	O9evEwlVVnVIuawfWew1X1v1uyEKC7ovGjiWrOd3+dZttYULxO9ZtO72M7vnPnYT4C5MjRkosCK
	Hwv1t0z/HaM
X-Received: by 2002:a17:90b:33c2:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-395c3597c56mr7524714a91.5.1787299912888;
        Fri, 21 Aug 2026 01:11:52 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:11:52 -0700 (PDT)
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
	quic_tdas@quicinc.com,
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
Subject: [PATCH v3 00/13] Add initial support for Qualcomm SM7250 SoC
Date: Fri, 21 Aug 2026 08:11:12 +0000
Message-ID: <20260821081125.4522-1-sreeshankar0910@gmail.com>
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
RPMh clocks/power domains, GCC and cpufreq hardware).
> Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
interrupt controllers, clock providers, power domains, and reserved memory.

Dependencies:
This patchset depends on the following patch:
> [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com

[PATCH v2] Link: https://lore.kernel.org/linux-arm-msm/20260819152545.3934-1-sreeshankar0910@gmail.com

Changes in [PATCH v3]:
1. Updated the way of registering critical clocks.
2. Made some more clock critical.
	GCC_VIDEO_XO_CLK
	GCC_CAMERA_XO_CLK
	GCC_DISP_XO_CLK
	GCC_NPU_CFG_AHB_CLK
	GCC_CPUSS_AHB_CLK
	GCC_NPU_BWMON_CFG_AHB_CLK
These clocks are flagged as critical in gcc-lito.c

Sreeshankar K (13):
  dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
  soc: qcom: socinfo: Add SM7250 SoC ID
  dt-bindings: clock: Add SM7250 global clock controller
  clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
  dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
  clk: qcom: rpmh: Add SM7250 rpmh clocks
  dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
  pmdomain: qcom: rpmhpd: Add RMPh power domains for SM7250
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
 arch/arm64/boot/dts/qcom/sm7250.dtsi          |  612 +++++
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-rpmh.c                   |   24 +
 drivers/clk/qcom/gcc-sm7250.c                 | 2269 +++++++++++++++++
 drivers/pmdomain/qcom/rpmhpd.c                |   19 +
 drivers/soc/qcom/socinfo.c                    |    1 +
 include/dt-bindings/arm/qcom,ids.h            |    1 +
 include/dt-bindings/clock/qcom,sm7250-gcc.h   |  163 ++
 16 files changed, 3108 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi
 create mode 100644 drivers/clk/qcom/gcc-sm7250.c
 create mode 100644 include/dt-bindings/clock/qcom,sm7250-gcc.h

-- 
2.43.0

