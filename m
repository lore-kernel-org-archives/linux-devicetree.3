Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7793440B6DE
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675839; cv=none; b=hGlZus3xCyHNF6+6ZPLZRnqDkFjyziKSel0k7st9dOE2q9fCidmeFXbfPqK87QxP6SkF7gifG1HMRDmtMK33ZK7lXPrsno42QpKe3iHEi0VlGjuUEGCeNwoQ+PhMoHVjP5qUmr3PyTju4vsmAKpOSwpq8cpCg5Fs9VNhsoedHWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675839; c=relaxed/simple;
	bh=qaMjX67uKPDfXDnO/LCCgTdIWlzQ4rkUOtx7OIc5AY0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EhR1VjYyAPoYNOQWE5GyAL3NLqrTn+dAOk2osg1nvHfSqZUhNi9O6swbVBrXlKCIok3riQCB0kCCFHbTGZQD6+GYt7IDMSxVkFeDHqjQGHvYehrw+yigKLfFACbzKNhyp9OOdekbnJTHfTdOBhHS7w7LUEFKmDZow7Jg8diEI6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hN2mcUaS; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hN2mcUaS"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so6254449f8f.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675836; x=1779280636; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KimBNnvZIExu9m7Gn6O/J5U055DSJkXcv1Df4OGtexA=;
        b=hN2mcUaSMevix5t8h6GFo2ess1QGpQEMeKo7b6AmeCInrki5BcGefeGFyiVR3SWwII
         VDs7Q+DZCtDZwZXTdRvFpiPOFXMEpVqgGErJ4c9iQC73AlP1YPhVnF3MACIFLfjKkGaZ
         VNvZvEEqak/SUbyF9dxpVanCYKZjwguRlmoKBcwl3ZdLFMU5FyuTEqJn3e95mCmNuIb3
         oo9k06iCg9u0/aERJpGughpkwRJ2QLIB3lk9nawQwSSum3u5bAQkJODbVi0zePsYQGaU
         RP/jxo+ggy/keTiXnvG9S58fD5HId+XOSc11YuEnbWt8o2zvBt2+Wuf24Go4nDKhQ5sa
         /SUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675836; x=1779280636;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KimBNnvZIExu9m7Gn6O/J5U055DSJkXcv1Df4OGtexA=;
        b=I11b6mVfPdtDGDUZuopvYyUjeuK7VjodgoRAgwZQbGA5mNK+ev7vX/AFr38i9itUcm
         Nyt1D3+5dzQwz39ryITzbp6x+0shTHUWahSJP+AiYfKqXc5HVtblwDV/VeqoGO0UWdLp
         J0byypSbd3d9jrErcGdvXGa60KLPXbvuJ8c6q93CyUvfhYXsEcS06ueHQShTMLlop2Ua
         VAjHTGfUVBmh8rKrrXtVPYTRmmxb4LBVhazSTSqTbvGoX9DPuJLdd9wFB1sH0tllRrUP
         l6mZwI29/NGd6VLCH7v+Tekr67c2phYOVTKLHmFb75/2oglXGK0ZXZNux3duAAN08TgU
         3DaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nlgvLandlb3/VMsfhwsgi5CKGlsROHc8qNojuFFmQnH4KDkBumGkE55FLMhZWExPHBovD8uLy5UTB@vger.kernel.org
X-Gm-Message-State: AOJu0YzX5DZ6M4+SMIIY2H7U6k29BJbT+PreKp5WM59IuM0pFpKuKLM5
	WkNLwBMUCMk1udRQIYOcRHecclC1uO5nNM+bFaSqj/0ZdsNK5EQGXA1hA2WBwYSyKMw=
X-Gm-Gg: Acq92OFm4HUOu2nO6IOPqUfNIHG5/Ybhp1juVOZBgx+n6PEXEMrtNSALo/7x7felO+R
	drSRoOvUpvZm32VOiXqg363MVCMB8fZAiN9mJvPTSySCjKZh367JbV7bEGR+ndUCwmP6m2gy8IH
	P2hjkwriRdTuuER32W+s87VBcqjYB3GB0OblZild9w3UxrH+4rtoVdl6OMyMceXpfnBaqMSIi72
	AI5q7+uIgvBVihRUTw8KPZfeP6UhTe/kYjKOi8V4TC7mQU7P+6LdztRgfHSo/7jzuatGov5tCPC
	a2ooMRdSQcW1CYXE0R9hOfyXg5uiBj/bOCdI/L2s82NRwrOsB0cBIrkMNtGtYupBNm2LP2p0Evg
	nxtDx4SzoS0g4NNRaXdLa1ideu1YPFFjYdfx+dy55AnRBNdMKvFidtgyvTNQRfibxA37f/PNqbw
	aYYPH/etTNWa4wrdH8+os4FAgy7YOAAYXttCBaq8X4VLqwVFhuNzNgo9HNVrimSHEK+cN8eIVoT
	ei2J0Zzuc6/j/puW721ZywXNRY=
X-Received: by 2002:a05:6000:3101:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-45c57edf73amr5082318f8f.9.1778675835858;
        Wed, 13 May 2026 05:37:15 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm38899725f8f.2.2026.05.13.05.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:15 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v4 0/6] Exynos-pmu: Generalise cpu{hotplug,idle},PMU intr
 gen and add Exynos850 CPU hotplug
Date: Wed, 13 May 2026 13:37:12 +0100
Message-Id: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHhwBGoC/4XNQQqDMBCF4atI1k2ZTDTRrnqP0kXQUQNiJNGgF
 O/etJu2lNLl/2C+ubFA3lJgp+zGPEUbrBtT5IeM1b0ZO+K2Sc0QUAGi4rRuowtlAbyelt7N07B
 0XFWtqLQiak3J0unkqbXrk71cU/c2zM5vzy9RPNY/YBQcuBaNrnNQUpZ4HuxovDs637GHGPGl5
 CB+KJiUujBagZGERfWlyDdFwg9FJqVtFBaiATRCfyj7vt8BDJDUD0UBAAA=
X-Change-ID: 20260226-exynos850-cpuhotplug-69f1976eefa8
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

I tried to implement it in way to not break anything for gs101, thanks to
Peter for testing.

Thanks,
Alexey

[1]: https://github.com/laklimov/xlam/blob/main/e850_cpuhotplug_random.sh

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v4:
- remove blank line in file exynos850-pmu.c, commit (as suggested by Krzysztof);
- only update trailers/tags in commit messages;
- Link to v3: https://lore.kernel.org/r/20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org

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
 drivers/soc/samsung/exynos850-pmu.c                |  78 ++++++++++++++
 drivers/soc/samsung/gs101-pmu.c                    |  57 ++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  15 ++-
 10 files changed, 221 insertions(+), 106 deletions(-)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260226-exynos850-cpuhotplug-69f1976eefa8

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

