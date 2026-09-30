Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A22981ACD
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727194; cv=none; b=J2Qxufwry4p90bnmg+WrmJYE3JLIgdkuBzHzqMp5800qjgNByuNc4D/mH+d99ozyciZmDZSUN81imJm/aB0trLvOmAm223FxeQUGEtCzJPsF/2OkwMwKcsjeOfw8W/Sg1cJ4RCVQlz3Wh7opCBNscsCz0Zy/omB37KR1oDjMBII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727194; c=relaxed/simple;
	bh=wAKEXXGW5dVCAd3402N5Hwz5uEUwFSDhP6KQffQQSCc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DQlr4EJQfUpsCF314R1KkexPq4k+eJyuEODO6xzlaeSjJwWIrSs1BHwnkGsedKYltGGNVT5YOVQcnEeBJYlAFV5wRKnZK0AB0bPYsfEVyrlY4AxtMOI9YsDOhCfESKQW4NTsZV6b6RU+b3utJnjyqynVYm5+i3MwoEdTtbHqJm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n7HjRYpY; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n7HjRYpY"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so28610585e9.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 17:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727189; x=1791331989; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6opwUVOPGXBFiHif49iUV/cuGJwm1ECibxjiyMFNcWM=;
        b=n7HjRYpYip/WLp9sLYLotThPkjvkz2YLFpH4Y/CkcefNCdn0WxETsj0VPbJZ298z1/
         sxHZhshyghhpS2yGkEv/yvqpZUdEXSyZIj8SKmh0mH6x4S0zaUDc39Xow6PIJsxalGSy
         hXBY2JH5f+suVPumjElCKZpe6ZOXI/Vx3muY3NThcnK4p2y/NqImYf2ouKnvzc894kzC
         Po6uluzFUSZnkUyLnN6Ku/EuIPplgpxVm9XWxuTcvBGeweBlpj/IGUvC7VfJdGc+oxBR
         3MT2Y5H++Yu2Ao0tA4ze1gRuHH4tu01SkIp4G/f+fQOik9FWwI3e8NvjksKoMrEMWM1U
         N0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727189; x=1791331989;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6opwUVOPGXBFiHif49iUV/cuGJwm1ECibxjiyMFNcWM=;
        b=CNMCsQ7DeNqYOiv1ssF4ruZ/CVqgF79AUy5J5QJOMIr8jZ3mHSzFySINFn1cAL+KO8
         vJDdgySRKs+3nV6yewYDqWHebKGrxsEt1jVlCvdwXAmXomB03cV4/HHJDXasX9/xsjlf
         YbbmpdLduYtFoSws98ipJ5W4HoX/VtKW+C7PNaSt6ZjAf29KaEiPAJQX6DHF402E84i5
         c0LlxbjK7QrKYAz/MGZ9xCgjdjGLZeA5nCWXic5kj+cYlKqa8iBF6cAiZFUPnocpvB+u
         pgSpbquAYNto2Ika9ZaRzlBXisAwtdr8FUYQX0l+BsyEKtqd3Kjh3apuFW+QebTzjLUp
         9/Nw==
X-Forwarded-Encrypted: i=1; AKwUvBxzK4n6bE05TmoFQQQ6KgSYhkLtoK4DRXmGa7UTFWwPy9DJwmtswUQSNCLLACP10pb47bGDMascOzJJ@vger.kernel.org
X-Gm-Message-State: AFuF++lejWOGh3DeX3FoDRf1yWtdRvsd4Gm3dtc1Mxd7Zqy57SI0ORli
	INmr5UEuRsJknU4+jtzF22EwEK7+Hu4gSVWWDzpti0YQV6+x8bvHXAQtYVxt0HiQJNk=
X-Gm-Gg: AYBFou0dU0Mpna71G0C9ORSgm51Srsvp2aWJdpkt9qBmhE3dA4R6gjIOSkuoy/JT9uu
	6XihPi8hh8kiM5vmUoAigprXc88uxPvQYGWhvjYmXX6ZVWCRcMG/Hr6cdQsI5j4v/FUyu+PdoPO
	KwiLHpxkPFlX8FlyhFkWTkr7Wwxxdv23KqV2wovN0WsftxJyma9WcGYO3efRvJhmhGAalgbYPpW
	iXZ2oI9XdJEsoFZwZBg8Rbrs8HbBkht91j4lk0u1SJ5xvRN69OFlhC13Btirs/IbVg9Zvpzlz5S
	qVK/xUBbQmAyMpgMVoaBK/rQ+BfnYTTec7mDSnHcpupJgKiT9g37IwUzBPHQ/U154tmMxZLWh9k
	HdrmHUF3Ww2YR10Xj5GaaqsEepfo/G3lQ8E8ZM+Zn4TqWflxAD7V47XZg7dV/LLNAs0MI9GhIJY
	cbFdfkKpLTyDb7E6zeP0i4dz6cVyYilPARrMJgkWwN1lfgL/CeIOxO+ujLpLDgYW3Og6z1YSbCb
	1LMPGk9WsDqw0dHs1WGW7N6NqC36KBTHJibd5aggtadT0Kydajo15g9mFHSNg==
X-Received: by 2002:a05:600c:4744:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a014fd1fd1mr13203315e9.4.1790727188823;
        Tue, 29 Sep 2026 17:13:08 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:08 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v7 0/6] Exynos-pmu: Generalise cpu{hotplug,idle},PMU intr
 gen and add Exynos850 CPU hotplug
Date: Wed, 30 Sep 2026 01:12:55 +0100
Message-Id: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAdUvGoC/4XSzW7DIAwA4FeJOI+JXxN62ntMOxBiWqTmZyGJW
 lV999FUWlZF0Q4cDOKzsbmRhEPERA7FjQw4xxS7NgfmrSD+5Noj0ljnmAgmgAkBFC/XtkulZtT
 306kb+/N0pGADtwYQgytJvtoPGOJlYT+/cnyKaeyG65Jl5o/df8CZU0YNr41XDKQsxcc5tm7o3
 rvhSB7iLFZFMb6jiKx47QwwJ1Fou1HkH0WyHUVmJdQgNK+ZcNxsFLUqmssdRWVFq4BeB9ASti/
 SqwLM7ig6K6USwoeS1UpWGwVWxTKxo0BWXKmrSufFefmi3J8DHPB7yt9hfE6RNJiSW77DoXjqv
 /2ifTMtfJ9Pz0iX0T/axqkSYOtcr7bmJUlOUbmE1HdNE8dDAdJoBO4ZRytRakTjfC0lOCit8zw
 4VJVmNld3/wFgJaWAtAIAAA==
X-Change-ID: 20260226-exynos850-cpuhotplug-69f1976eefa8
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
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

As a next steps it will be possible to enable idle states on top of it
(if we get our hands on correct firmware).

First patches work on DT bindings to reflect that Exynos850 SoC predates
gs101 one and adding mandatory property 'google,pmu-intr-gen-syscon'
for exynos850-pmu.
Then series generalises ("Exynosizes") cpuhotplug/cpuidle routines by
deferring platform-specific PMU and PMU-intr-gen updates to platform-
specific callbacks and then finally introduces new file exynos850-pmu.c
where such callbacks are implemented for Exynos850. Last commit adds
pmu_intr_gen DT node to exynos850.dtsi.

This series depends on
[PATCH v3] soc: samsung: exynos-pmu: fix error paths in cpuhotplug/idle states setup
https://lore.kernel.org/linux-samsung-soc/20260930-exynos-pmu-cpuhp-idle-fixes-v3-1-4269d8425978@linaro.org/

Sashiko bot reported issues here:
https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=4

The are basically no updates in this v7 series, just a rebase on top of
an dependency patch.

This series was again re-tested on Exynos850 WinLink E850-96 board:
-- by spinning "chcpu -d 1-7; chcpu -e 1-7" in a loop for a few hours;
-- by running script [1] that randomly offlines or onlines random cpus
   for a few hours.

Thanks to Peter for testing!

Thanks,
Alexey

[1]: https://github.com/laklimov/xlam/blob/main/e850_cpuhotplug_random.sh

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v7:
- rebased on top of -next and patch (it is dependency):
  [PATCH v3] soc: samsung: exynos-pmu: fix error paths in cpuhotplug/idle states setup;
- retested;
- Link to v6: https://lore.kernel.org/r/20260902-exynos850-cpuhotplug-v6-0-a85bb55bb118@linaro.org

Changes in v6:
- rebase on top -next and "fixes" series, basically no other updates;
- Link to v5: https://lore.kernel.org/r/20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org

Changes in v5:
- updated the commit message of ("soc: samsung: exynos-pmu: add Exynos850
  CPU hotplug support");
- the if-check for the presense of pmu_data->cpu_pmu_{offline,online}
  callbacks in setup_cpuhp_and_cpuidle() was moved to before acquiring ref
  counter to intr_gen_node (the initial issue was reported by Sashiko);
- added pr_fmt to exynos850-pmu.c to have more meaningful error
  messages;
- added parentheses around the `cl` in `EXYNOS850_CLUSTER_CPU_OFFSET` macro
  (as suggested by Sashiko bot);
- custom syscon regmap with raw_spinlocks for pmu offline/online callbacks
  (the initial issue was reported by Sashiko);
- using topology_cluster_id() and topology_core_id() in exynos850-pmu.c
  (the initial issue was reported by Sashiko);
- removed smp_processor_id() usage fomr pmu offline/online callbacks
  (the initial issue was reported by Sashiko);
- added/resorted headers in exynos850-pmu.c;
- Link to v4: https://lore.kernel.org/r/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org

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
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   6 +
 drivers/soc/samsung/Makefile                       |   2 +-
 drivers/soc/samsung/exynos-pmu.c                   | 149 +++++++--------------
 drivers/soc/samsung/exynos-pmu.h                   |  34 +++++
 drivers/soc/samsung/exynos850-pmu.c                |  95 +++++++++++++
 drivers/soc/samsung/gs101-pmu.c                    |  51 +++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  15 ++-
 10 files changed, 260 insertions(+), 110 deletions(-)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260226-exynos850-cpuhotplug-69f1976eefa8
prerequisite-message-id: 20260930-exynos-pmu-cpuhp-idle-fixes-v3-1-4269d8425978@linaro.org
prerequisite-patch-id: d9ac215f16060e07e9cfe193e7c9af7c8913bdae

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

