Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004E227F19F
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 01:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777514218; cv=none; b=bPFHfytyCz6FsVvf5eLXThgBj9z4iXZuTcjU3HWRp0I7sdHWY8jIXb591hu7VZTQlb+Pgzii9hrWsRremW8Jq/GvIblb97TOEPyiBF9eNUa9GGL5sh/dYl6RCph/d/9lrubIaSWBMjoBhQt/NbvUJp2Of0PxMs1W0wcxoKWuilk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777514218; c=relaxed/simple;
	bh=b1RV9hlHEGUHSyYNI037uhCnb4KGfhqJ//wbofEsy/U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oX8wCb+ribFto4GqDLSOTa5otvCWKlc6+UOMl60LOvSP9BK4evtwoibBa0iU5/0Lv2GfnuGCAldUY29duYAK/6qpCx0RfcIbUHMms7zcEuUnnUa6YSins8KADYAvUzLfP2njyxwYWjXsmSej54St5UCab42odNP1vDH9j3ogyLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ontBuCmI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ontBuCmI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so6283925e9.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 18:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777514214; x=1778119014; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=craaEuxmon/gIzz7VmLF3Map/SNQR796d++hsKvx9NM=;
        b=ontBuCmI7Vl7MxnUoXnzm2zra7QVSV1OeKeppLWWNe3wXqDoUsqHTs5OLiDPPO7vLS
         YLP1jrANZdG+cvJTyuf0qOfR89n+ATTFQ8T3KlnK0hsF3FzNjwFv+TU2HQ8Bx7ODrPeC
         s+C83FkckD5v5cKDjVWjaMkDOD9Dzs9V+Xiu+A1iv7Ndv4in7N8Vl8VmztuvcO6MJY7d
         Q8iLbkjjEaxnz82yMCOCIHr4WoTbCNeV9UXrabDeMftEhDt2xTxV84mSy+1/ae+iFBGw
         8P674fwUQ1M+LYx/Bj7m5Gf7Ft5BNyphtJxaDzr7a8IgLQXeJS86KEdHewVh4LIPIHo5
         X3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777514214; x=1778119014;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=craaEuxmon/gIzz7VmLF3Map/SNQR796d++hsKvx9NM=;
        b=ZvH4zTJ4RhGlMRM6WuIFpemGTbsF4qbRABHbUpvOzBjMjACdui8wnhlbD1H6qKMYSF
         QHWmjkuJDok4fyHUiLTyobVsKjKYP6sponIxNC6VYItuJp1yiXdbPgBt3JPYOnsgGwJj
         46c4gcZGTpL8N/wnMtbURHz4FQb1p2D9Q5otlzEeKh/hv4UeEA5DmLqjUFSLSeJEFGfL
         UQk7WZmYAC6kq3JofCPPHU/6aSZJU8+qqNL1vUbUuswUla4lA8M1j+2vyqxmQcC/pyW2
         fDJaWDWdYiSmXxdeEozechfUHNb20dlf1jgnH7iPgBf9MinE4scR+kAqyp/ZTJFFdIuy
         z7Mg==
X-Forwarded-Encrypted: i=1; AFNElJ/dy7zQP3iCPmf3Ys0NgdJeWoyLjhltJO4lsEuRp7eNpsp17lwzEDKNcO+OxtDGEA/fa95JuuPjEdVY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyytgl6FGh+RRHExXopxdNucDiDlJWYB+RJjyqpaf+gOpup8NiU
	GiM4bI2ttFohov4D/kPlq9vQr0PP7h9RTw5TKCNjMEQ5Mu0pHscjHN3T8GVf5a42rBg=
X-Gm-Gg: AeBDiesXLeF+5gVMIMSHyiuBkNr1EiPf2oRmDTgKpqx33bB3slRsHBF3BtaXZmBZRIj
	5tSRdgaiGqGK1ZThWjNTGvvtlxWIDBjrbJ4Ku8HpJnZTl39vSJNUkaAbbAbrRQv4rLQJFPXZuiP
	9fceuqS5Fd/lqKr5szqwPUY/NbLN5HOhBOV4a6x8HTvRrI6FxlpMMRjVKfdKOgoa2/ee41X9/iC
	R+oPLigO8gRGsXYIbBlg6KtJTp1bXiY9ziDMlEf+IXmj5RnV1vp9aUng1aNlgcp9h/Xrn9Up1rh
	DeKqjSTVocuzwSeIA33aXLqy7LfVB2sEga6kfWdxRXnVyHzrIF43Pc7/cLYVacGcMQ12OhQ1SiK
	b4YB1Sw3nlKURc/Btqfcq/VeTFOxEWGqvAZ4ds6JnkJk6jtGsbiBE0PpBYsBPP/Lxr4RxJu9GkB
	4uZoPZIJVT1PkFUAZpvy9IejDQj+GJXFew45yxu2psjQ7ocluUKEx9bBZtim7GvCCCb/CxdhezI
	an/HodL/mrSosa3Y3KxtzhnRGw=
X-Received: by 2002:a05:6000:2211:b0:43f:de5a:eb63 with SMTP id ffacd0b85a97d-4493d02ac54mr1206548f8f.11.1777514214225;
        Wed, 29 Apr 2026 18:56:54 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm9915013f8f.27.2026.04.29.18.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 18:56:53 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v3 0/6] Exynos-pmu: Generalise cpu{hotplug,idle},PMU intr
 gen and add Exynos850 CPU hotplug
Date: Thu, 30 Apr 2026 02:56:50 +0100
Message-Id: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOK28mkC/4XNQQ6DIBCF4asY1qWBQUG76j2aLgiOStKAASUa4
 92Lbpoumi7/l8w3G4kYLEZyKzYSMNlovcshLgUxg3Y9UtvmJsBAMgBJcVmdj3XFqBnnwU/ja+6
 pbDreKInY6Zrk0zFgZ5eTfTxzDzZOPqznl8SP9Q+YOGVU8VaZkkkhari/rNPBX33oySEm+Cgl4
 z8UyIqptJJMC4Sq+VL2fX8D/BlZb/8AAAA=
X-Change-ID: 20260226-exynos850-cpuhotplug-69f1976eefa8
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Series generalises the GS101-specific cpuhotplug, cpuidle and PMU interrupt
generation block support, which is currently implemented specifically for
the google GS101 SoC, to make it reusable by other Samsung Exynos SoCs.

The PMU interrupt generation IP block introduced for google GS101 is a
standard Samsung Exynos block found in other SoCs, including Exynos850,
and it is not strictly exclusive to google Exynos-based platforms.
Access to this block is required to implement and enable cpuhotplug
on Exynos850-based boards.

As a next steps it will be possible to enable idle states on top of it.

First patches work on DT bindings to reflect that Exynos850 SoC predates
gs101 one and adding mandatory property 'google,pmu-intr-gen-syscon'
for exynos850-pmu.
Then series generalises ("Exynosizes") cpuhotplug/cpuidle routines by
deferring platform-specific PMU and PMU-intr-gen updates to platform-
specific callbacks and then finally introduces new file exynos850-pmu.c
where such callbacks are implemented for Exynos850. Last commit adds
pmu_intr_gen DT node to exynos850.dtsi.

This series was tested on Exynos850 WinLink E850-96 board:
-- by spinning "chcpu -d 1-7; chcpu -e 1-7" in a loop for a few hours;
-- by running script [1] that randomly offlines or onlines random cpus
   for a few hours.

I tried to implement it in way to not break anything for gs101, but
testing from others is highly appreciated.

Thanks,
Alexey

[1]: https://github.com/laklimov/xlam/blob/main/e850_cpuhotplug_random.sh

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v3:
- dropped two commits where samsung,pmu-intr-gen phandle is introduced and
  where google,pmu-intr-gen-syscon is deprecated (as suggested by Rob Herring);
- addtion to maintainers file was moved to separate entry, change commit message;
- commit message in "generalise gs101-specific cpu{idle,hotplug} for Exynos SoCs"
  was updated since it no longer touches samsung,pmu-intr-gen-syscon;
- added missing asm/cputype.h header to exynos850-pmu.h
  (reported by Henrik Grimler);
- new commit "dt-bindings: soc: samsung: exynos-pmu: Require
  pmu-intr-gen-syscon for Exynos850";
- Link to v2: https://lore.kernel.org/r/20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org

Changes in v2:
- moved gs101 cpu {offline,online} callbacks to gs101-pmu.c, updated MAINTAINERS;
- added new file exynos850-pmu.c with cpu {offline,online} callbacks and
  exynos850 pmu data;
- new patch that adds exynos850-pmu.c to MAINTAINERS;
- moved pmu_intr_gen to right after pmu_system_controller@11860000;
- merged two patches that update google,gs101-pmu-intr-gen.yaml together,
  now rename and adding exynos850 entry goes in a single patch;
- commits 5 and 6 from RFC series are merged together and reworked,
  cpu_pmu_{offline,online} callbacks are moved into pmu_data struct, and
  callbacks now need pmu_context as an argument, exynos_pmu_context and
  CPU_INFORM defines are moved to exynos-pmu.h, gs101 callbacks
  renamed. It is really better to check commit description.
- Link to RFC (v1 from b4 point of view):
  https://lore.kernel.org/r/20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org

---
Alexey Klimov (6):
      dt-bindings: soc: move,rename google,gs101-pmu-intr-gen and add exynos850
      dt-bindings: soc: samsung: exynos-pmu: Require pmu-intr-gen-syscon for Exynos850
      soc: samsung: exynos-pmu: generalise gs101-specific cpu{idle,hotplug} for Exynos SoCs
      soc: samsung: exynos-pmu: add Exynos850 CPU hotplug support
      MAINTAINERS: add Exynos850 PMU entry
      arm64: dts: exynos850: add PMU interrupt generation node

 .../bindings/soc/samsung/exynos-pmu.yaml           |   1 +
 .../samsung,exynos850-pmu-intr-gen.yaml}           |   8 +-
 MAINTAINERS                                        |   9 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   6 ++
 drivers/soc/samsung/Makefile                       |   2 +-
 drivers/soc/samsung/exynos-pmu.c                   | 119 ++++-----------------
 drivers/soc/samsung/exynos-pmu.h                   |  32 ++++++
 drivers/soc/samsung/exynos850-pmu.c                |  79 ++++++++++++++
 drivers/soc/samsung/gs101-pmu.c                    |  57 ++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  15 ++-
 10 files changed, 222 insertions(+), 106 deletions(-)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260226-exynos850-cpuhotplug-69f1976eefa8

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

