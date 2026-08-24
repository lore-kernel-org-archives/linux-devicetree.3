Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AE441F5DF
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576705; cv=none; b=lDsW5Bka+vMy6xu1ZQ6s4fJR1hPbNIvu/zF+T5kLvdUA31rMBqXIXhbkxHWZ87clEasMcY58UT7zTPDLUu/gXP7zhFy7C451uz+ca25DxSRy5DCq5ElJZK3OwY1gBUy9CoWlMyxPf1uCMXfAFOagiMtiVjk197yxQplKEzdQ7cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576705; c=relaxed/simple;
	bh=SVpSKFDlh/11hNX2wJMUN8AwLuw2O6TG3W3AVr79XvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CPKI3fW8f8xx76n/eeILY0ETQzEO98FmhgeYJDqDL37ghSU73X1q0JbLJrLqKPFn9ETYw3/y9L2Oa9rqS4Yd93qPvmWIgHvs/uyqDhONdlCWmxZqvXBQFjzG4nw92b52JRW3JS1XEVk0O9kfLcz1ZBQuKSCtWnTSJWfpRvoboeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=riWvp0Rs; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="riWvp0Rs"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f42ef0b693so2199349a34.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576700; x=1788181500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pq5ixhwB2MORXAzPKKL6ytvUwFETGYzF+l8Xr0Gosh8=;
        b=riWvp0Rst9WKHYeleHAZZuBDphWiE3D5L+Z/AIpgbxoFnr/dSpaViEXtPHUIk19zIb
         WUufyhqTQywfPh7MmQUoqvlWu4kP38BN0tCth7So2XGNAfuSF6TBjEKg/Y/J2Wxs8ylj
         QOIMvDyiRLhIwoauapdw4c3oecqlVivwSeNBeMyGEkARPFgp1ls5Ddxulcwf27hX8l3i
         tfXUyT2adaMj8Ics9gjXzskUyXZNem+OStvt6geIcNOlUfwTQQZ3aMPWcrIzF0vB/vVb
         BML0Jq9NyOFlPNSkRsJVfyLsjYTucZzd+yLcLuTKLGCx0ylNIwS9kHtt+Pfr38yxINj9
         LZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576700; x=1788181500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pq5ixhwB2MORXAzPKKL6ytvUwFETGYzF+l8Xr0Gosh8=;
        b=WEkvs3jwlSKRAv07f+1gHWalYQ9jqBnI2wGSmFGJbN85lsnzRc92JWIQ1Z/rlDNlmg
         /6grSiDPzQvIglZY+2rcZmqA6wWLRzBfnMtKtQ++GX/sG/zy2lfh5brgfW+1zni5Bx/a
         kJfUfnkQmiL5bsKGmC0yGFCvb3jl/AUhfR+LNj+LIUD/dZgw2nsegEA2RaAr3ZG74RIh
         1nrMSZFzPGlwVtSsZcx3jHvb/ooCZqhTM32RjUm8r8il8YRJJcAXyUYQ8TX0z8DO05n/
         gvXlcbn/o79occrTJCn4FrI/6zDmo0h9MeNqm1sAJNOfL0VDM9LmCpfzwf8/A05UdXrO
         JGPg==
X-Forwarded-Encrypted: i=1; AHgh+RrukSAI9AYbEzNteILY00XUJ3lWaSpcw08J+X6hFRfrXid7VkdcTouNR17/L8yjJhGm8zObmrGHTpfe@vger.kernel.org
X-Gm-Message-State: AFuF++lR16peD5nGyWTICG6Ml2ZujmZkHQc91i+8WLvWzqJy5bwGab8y
	lM9n3t7hop2jvzc9wK4d1ixheeWGqTcHls5Gt8KmmUBEuy9rfQVC9Bjw
X-Gm-Gg: AR+sD10Z65ZDDdCfFt+dzm8GK2WMUBZlu915EnYyYo4ukoP4doqenGEc2xWGAbAr1H8
	+0WXZnD0KtofA7YH65sViN3QYb4P22tTaHXJu62tfvdULLij8XqWpHYa11c+XeV5JcpZFRsc+Nl
	fqQNlMJKAVFdvl1hhpdETVqWKhOB+CbHmbV76gQunllf+EVkLYa9jAf7G4Qjjg+2MLwB0lTdn5p
	mKcdDg1zCdX+Sw3XygzDpemgiGVjIq8DywN9nKEXv+E1UKFteQ3aVxZXk9uZfr5yha4t+1Se3bT
	MMHkSjcJAtpU4A8E4vh7mR1ZB+TiBkfS9x/ujhxhI54VSQdot/1cxlMH4ofHU2MvXTOdIIpPHRm
	WP3urd8TbgvOFd+wm7HPJGqN6DHlHt8TpV9F/Zcigz0onKpcrpacz8QwJieB9XAwTqjNL5PvnK3
	v8Enpbuj0GXgKK22EpS7XWR8diI4Ig2LdMX0NQVo0lfXy4cxEv9UT1v1ZtCiXdWjHKxiGntMpKk
	cvvvk2RHB40
X-Received: by 2002:a05:6820:4b96:b0:6b1:24ce:6264 with SMTP id 006d021491bc7-6b16b46732dmr16538509eaf.30.1787576700505;
        Mon, 24 Aug 2026 06:05:00 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm26409711eec.27.2026.08.24.06.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:04:59 -0700 (PDT)
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
Subject: [PATCH v5 00/13] Add initial support for Qualcomm SM7250 SoC
Date: Mon, 24 Aug 2026 13:04:24 +0000
Message-ID: <20260824130437.2771-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset introduces foundational upstream support for the
Qualcomm SM7250 SoC (internally codenamed Lito).

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
Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t

[PATCH v4] Link: https://lore.kernel.org/linux-arm-msm/20260821154030.2514-1-sreeshankar0910@gmail.com/T/#t

Changes in [PATCH v5]:
[PATCH v5 13/13]: arm64: dts: qcom: Add SM7250 devicetree file
> Reformat multi-entry phandle lists (domain-idle-states) to '<&a>, <&b>'.
> Reformat multi-entry tuples and string lists (qcom,pdc-ranges, qcom,tcs-config, reg-names)
to one item per line.
> Enable QUPv3 wrapper globally by dropping 'status = "disabled"'.
> Move compatible property to first.
> Remove clock-frequency property for timer.

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

