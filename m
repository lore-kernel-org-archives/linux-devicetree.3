Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810809;
	b=IWTQiYLpFSF/XPOT+NgM2QK91fgVAxJUkbUrX5WdoMN812XVom2hxFq0nszUxO435F/j
	 8b/oQtz4rzGbdLcNlQZOG2D6lEZ+5O3x71xQC4SnHPy5uiu2FV8LF1S3YqkK35BNi2wR8
	 ohe4RY5yFHUdMe5UlomcdM5VVCNnFR2JlkB/YdFq1A5nz64+Jj3otrv8HU3TJLDF11CLa
	 gfMHhTaa1pannpi4U0hKCYrSn7f21Phz4APD0pNV+NVsoTmb0u0lXDGRglkUu4qOCXVlr
	 PlJhoSBXogCk/zmSty9XJXLLArShRy3jnMgSfWfh+MFQDiIoC9q2kjm+e4stVo37YqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gamzM6thtPz+m4PXUApFbSIz2cimDoEpil3OMLpoqEk=;
	b=P/8yqh65zPZFnoCnZy94CB/8IH3D8XkIoHQ5524IR5wWNdfksSyAeJlOxCFDnWs4Foz8
	 elzH5QNEdpGjZm7fHG8N9jif9LwGZTP9QWlx8IM7tgqL8o55G3iDqWIzwLJ5uVarFx5+j
	 212V2es+A4ASEtgxBKwgEfA9jQHTEwJcU+Ps97d2UIDYFOExuqzec4edbKXDa+QNuoEZ2
	 CTHHl9nv2QC9b5gMq1B/FL2qA/v2/bsEVdIHa3FIzOnaMy0YdhoFRQzsSwzyNn8ph7H8s
	 Xf+OHLTLoZZaIT0l2qZfJ6TQy9e0+KnJ2+6Obww3PRmsMjVBWi9KkKZcO5hdiPQ+Z2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBP5At19;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB0B606EEA1
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EB0B606EEA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBP5At19
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1aefd1bf74aso782925c88.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810808; x=1794415608; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gamzM6thtPz+m4PXUApFbSIz2cimDoEpil3OMLpoqEk=;
        b=XBP5At19jSXF2Ymsq2H63T2GyP6w2zu5Qk8AUyQ6tXi2X8yWgIDxtBDzbozKNSkXBL
         Zz2ElqzcqYMJ+cHXeoeG2nAvzf/xr4U55S61+RO5zRTZCCDeJoAJiyXFtcB0FgQKa+hG
         5zQTz4hsXvYRDzKPDnDmDzAkYApNWFr8GpMkugeupeYlsEwm/WxpqShs0lmXYTi6sx4i
         vrwyLBwhacO2O1ZVv1owM8V/XoS9VgGOo8CdWEGBB0co0cQAV6cw/bZ8ONCaHZuTkkXl
         IFcH0IEI6dt27oV44JblEL+s0cI29qR7RJSzbvkg9r9byLEo58pzqcFI2Bt0nBS9m6z8
         2vfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810808; x=1794415608;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gamzM6thtPz+m4PXUApFbSIz2cimDoEpil3OMLpoqEk=;
        b=Vf935uTxQmDcPTSOb1XcTV2xr0VQQSE3Tg+EDH9gYpX3JWZXC3cw/1w+/ndqea3Bxi
         s621Nxa+ENZs+uqnCQSqFxnEq0pV8CG9bf/cb/uAcwVAEnzfFF1I/klFvi0qOKftSp0f
         VK+o3h+EjR1LQ5L1MJqBKkf3q71vyOMuO0PnWXGExNOnIZoRdjSfut6JZOQInwawlbQ9
         N05C5luUUI8AvNMKGuH67+f6VY6ZtbliwAVfVB5jyelQhT0cTgsrpnUbTNgIhv9szo4Q
         +ta/UZW2S0CD7mlB4MdeKlij9Pb2hCRkqSM/FT58XXCpYSZcb5bdeXtLOk9MzvvEi0vz
         wgCg==
X-Forwarded-Encrypted: i=1; AKwUvBwdRLvsibei09ATu+L4vdGXtm6TywFqb8s31sWt85wurX+4HXtIpW9TD8lKfG8vKpTugM3LLYfG9bsu@vger.kernel.org
X-Gm-Message-State: APuU4Z8DoaD83/I/TykIVNmSCpXER83xiD78C3MWn0Yng4ZLIxgOV0dN
	+U7NBpc69mrUHKAN5wV9fcDSMocL+qgZW21D7DHe9KE1k2RidzTx5z6M
X-Gm-Gg: AYBFou34kePAUGEkd42b3dNan8LBx3ty6g7/eFJaakjUZML5uK44qPx5MWrJvHjifIj
	xFDTw4t64R7funyZM0d1gPKgkVCJvy/yEeVbeVk3LSo/jJw6XE7UvEHOr3Pl/2+XS0aoVmr+WuW
	7wTFLPJ711FIdyKrfml7ASYfkMOR0vhhc0f46YX0ggXbje0JkLQntYNi9x0AcZf6ilJz7Y3e16D
	Ux+NJblZfNwDGs/y8qjeq/pa4trABWCcro61cTKopgI6gzmNLns/rsbU1zDQCRlf3okSnQ0p6gB
	ivaeEiPL6wnsNKnNjGFUnYzv9fABkrB+9ErPhZ74tO53BpTOLz6pBQ9mxy+ffrBOLQ7L+3YYYtF
	KNjnEdH6DvFQV3emRZ++339p6yx++nB8t1DGCAZ3/zFoV/FXE3mAzVnjwd0Y43+rl2JYVJ0HSbg
	NE18xbX81jXMCHUyZh8paElZKW2DmHruR5IUHRajHMLapI943vxi5zIxa9vK65zAXrOlMbM0jVn
	+P0b5G1Eu6xUBLdoVN9iJdlohRNGKG21tJMty1vIZkE6GHQpc44xue2KKFC0bl0lmnw0grmy4Bq
	faaCcfyBaWkD3mRi8JuoC8Mvuc8pOK54P+tjSDfNbaaFb/E3Z92xqGZF0Khey4q91fW+49hdIiV
	u8+9CMyE=
X-Received: by 2002:a05:7022:ea8a:b0:159:f192:5290 with SMTP id a92af1059eb24-1b24f4bbb6fmr26685c88.13.1793810807054;
        Wed, 04 Nov 2026 08:46:47 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:46:46 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v13 0/8] Add initial support for Qualcomm SM7250 SoC
Date: Wed, 04 Nov 2026 16:46:32 +0000
Message-Id: <20261104-master-v13-0-355b65c6f764@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGhh62oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDI11FJSSM
 xLz0lN1M1OAAkpGBkZmhoYGJrq5icUlqUW6liYpyQZmpmnmxqYmSkDFBUWpaZkVYJOiY2trAa7
 qdUdZAAAA
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=7848;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=uPzqsnBTSTy5j8CzURIR/JxJhIk24GZEHjkBYenwv7M=;
 b=j47drGptocIm5nmgMwnduUwrjp77y/xGZ8CsPAov6BfHh5+B0PsqUlETbwVa6Ya2s/RXCGBbf
 jPokhHoLf5JBwfEi+3JY0rCVnzwcnHPo05/DmJ6VI/0WiDgrLjjet3b
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

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

>-----------------------------------------------------------------------------<
Merged patches:
dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
soc: qcom: socinfo: Add SM7250 SoC ID
dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible
clk: qcom: rpmh: Add SM7250 rpmh clocks
dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
pmdomain: qcom: rpmhpd: Add RPMh power domains
dt-bindings: arm: cpus: Document Kryo 475 CPUs
dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC

Pending patches:
dt-bindings: clock: Add SM7250 global clock controller
clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
thermal/drivers/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
dt-bindings: thermal: lmh: Document SM7250 LMh
thermal/qcom/lmh: Add support for Qualcomm SM7250
dt-bindings: firmware: qcom,scm: Document SM7250 SCM
dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
arm64: dts: qcom: Add SM7250 devicetree file
>------------------------------------------------------------------------------<

Changelog [v13]:
Fixed various issue found from Sashiko's review, Link: https://sashiko.dev/#/patchset/20261104-master-v12-0-57fbe9eef978%40gmail.com
[PATCH v13 3/8] thermal/drivers/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
> Switch to match data mapping instead of hardcoded 4-4 cpu configuration.
[PATCH v13 5/8] thermal/qcom/lmh: Add support for Qualcomm SM7250
> Add 6-2 cpu configuration LMh support for SM7250 SoC.
[PATCH v13 8/8] arm64: dts: qcom: Add SM7250 devicetree file
> Place the nodes in acesending order.

Link [v12]: https://lore.kernel.org/linux-arm-msm/20261104-master-v12-0-57fbe9eef978@gmail.com/T/#t
Changelog [v12]:
[PATCH v12 1/6] dt-bindings: clock: Add SM7250 global clock controller
> Move dt-binding definition to qcom,gcc-sm8250.yaml. The device tree
schema of SM7250 matches with SM8250 for clock-controller node.
[PATCH v12 5/6] dt-bindings: thermal: lmh: Document SM7250 LMh
> Add LMh compatible.
[PATCH v12 6/6] arm64: dts: qcom: Add SM7250 devicetree file
> Remove cluster wise sorting of cpus.
> Add LMh node.

Link [RESEND v11]: https://lore.kernel.org/linux-arm-msm/20261029-master-v11-0-2c29e382162c@gmail.com/T/#t
Link [v11]: https://lore.kernel.org/linux-arm-msm/20261016042432.824-1-sreeshankar0910@gmail.com/T/#t
Changelog [v11]:
[PATCH v11 2/5] clk: qcom: Add Global Clock Controller (GCC) driver
> Drop hw_ctl clock branches
> Populate default values for GDSCs

Link [v10]: https://lore.kernel.org/linux-arm-msm/20261015051926.13752-1-sreeshankar0910@gmail.com/T/#t
Changelog [v10]:
[PATCH v10 2/6] clk: qcom: Add Global Clock Controller (GCC) driver
> Update .halt_check and .ops are per the review.

Link [v9]: https://lore.kernel.org/linux-arm-msm/20260901092447.3028-1-sreeshankar0910@gmail.com/T/#t
Changelog [v9]:
[PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Make all clk_init_data instances const across the driver.

Link [v8]: https://lore.kernel.org/linux-arm-msm/20260901070717.20513-1-sreeshankar0910@gmail.com/T/#t
Changelog [v8]:
Same as v7. Resending the full patchset as v8 due to a transmission interruption during v7.

Link [v7]: https://lore.kernel.org/linux-arm-msm/20260901064357.20055-1-sreeshankar0910@gmail.com/T/#t
Changelog [v7]:
[PATCH v7 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Fixed missing (struct device *dev) in gcc_sm7250_clk_regs_configure

Link [v6]: https://lore.kernel.org/linux-arm-msm/20260824150156.1310-1-sreeshankar0910@gmail.com/T/#t
Changelog [v6]:
[PATCH v6 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Make all clk_init_data instances const across the driver.

Link [v5]: https://lore.kernel.org/linux-arm-msm/20260824130437.2771-1-sreeshankar0910@gmail.com/T/#t
Changelog [v5]:
[PATCH v5 13/13]: arm64: dts: qcom: Add SM7250 devicetree file
> Reformat multi-entry phandle lists (domain-idle-states) to '<&a>, <&b>'.
> Reformat multi-entry tuples and string lists (qcom,pdc-ranges, qcom,tcs-config, reg-names)
  to one item per line.
> Enable QUPv3 wrapper globally by dropping 'status = "disabled"'.
> Move compatible property to first.
> Remove clock-frequency property for timer.

Link [v4]: https://lore.kernel.org/linux-arm-msm/20260821154030.2514-1-sreeshankar0910@gmail.com/T/#t
Changelog [v4]:
[PATCH v4 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Update .fw_name with .index
[PATCH v4 13/13] arm64: dts: qcom: Add SM7250 devicetree file
> Added missing capacity-dmips-mhz and dynamic-power-coefficient for cpu@300
> Added power-domains for cpus and apps_rsc

Link [v3]: https://lore.kernel.org/linux-arm-msm/20260821081125.4522-1-sreeshankar0910@gmail.com/T/#t
Changelog [v3]:
[PATCH v3 04/13] clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> Updated the way of registering critical clocks.
> Made some more clock critical.
        GCC_VIDEO_XO_CLK
        GCC_CAMERA_XO_CLK
        GCC_DISP_XO_CLK
        GCC_NPU_CFG_AHB_CLK
        GCC_CPUSS_AHB_CLK
        GCC_NPU_BWMON_CFG_AHB_CLK
  These clocks are flagged as critical in gcc-lito.c

Link [v2]: https://lore.kernel.org/linux-arm-msm/20260819152545.3934-1-sreeshankar0910@gmail.com/T/#t
Changelog [v2]:
[PATCH v2 12/13] dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
[PATCH v2 13/13] arm64: dts: qcom: Add SM7250 devicetree file
> Added SM7250 cpufreq hardware

Link [v1]: https://lore.kernel.org/linux-arm-msm/20260818080754.4362-1-sreeshankar0910@gmail.com/T/#t

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
Sreeshankar K (8):
      dt-bindings: clock: Add SM7250 global clock controller
      clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
      thermal/drivers/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
      dt-bindings: thermal: lmh: Document SM7250 LMh
      thermal/qcom/lmh: Add support for Qualcomm SM7250
      dt-bindings: firmware: qcom,scm: Document SM7250 SCM
      dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
      arm64: dts: qcom: Add SM7250 devicetree file

 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |   13 +-
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml          |    2 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
 .../devicetree/bindings/thermal/qcom-lmh.yaml      |    1 +
 arch/arm64/boot/dts/qcom/sm7250.dtsi               |  803 +++++++
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-sm7250.c                      | 2278 ++++++++++++++++++++
 drivers/thermal/qcom/lmh.c                         |   84 +-
 include/dt-bindings/clock/qcom,gcc-sm7250.h        |  163 ++
 10 files changed, 3332 insertions(+), 24 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-master-94dc065f7354

Best regards,
-- 
Sreeshankar K <sreeshankar0910@gmail.com>

