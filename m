Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807239;
	b=jlqPHXXXdi2XuQRt2F45Qd8js8Tmx+K3w22gHdEBIfXEezzFr6Tp9G1AjPhgih8NUl3m
	 +qG4YBIrG9I9HxUzK5BdXoSU/BfmTHnCFA1Rk6kmFXQ9KxNLx2NAdxiJTBzm+XeBKXcMa
	 oKoiFU5qtce1RLs29B4hDYPyYI75P5sx8xDnmJ9RbB2wOu9+OB87p9U3Y/MAEz8dlfA4c
	 vlljtX3S1s8f0VFiwx9fFKhbEu3D8ja8cagTjeysq2kx6ySPqLjSXE3IBuUOQq/OpMESV
	 PDXZMTRulBLPv6sM47Wq2D/vVvGsQmX1OuedA2ah4EJ8xTcAjh2QJYINNeyRadN7s7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0w/f/nIRvQ41Y5kXOY9lL+2GFsd+GjYZ0Mpuv3lgWjs=;
	b=Qmfk+yXVUx9A+nwGvpMvWHgJcLWA0lTJfc238RX3MjaYsk+Zn+sg6dmOUAhACTCjbVLY
	 x8sWcTfr0gxRdjII7kNzAdqPyJ0aMiFmzC0qqwXkkIHPtfAf9PbFYDALZiSXidg7iw2vy
	 yxoaP438Vgig+JpmlfuRTdAW0juJNrBX3z7x/b5X+UfTj31ucNT2ztYZCL1MexIbenWHF
	 eFRfui54L+n2y0DLW1hW5qp/kX7adOoSgFVQDNkR7Q7hbS4SdwycArftbxn0YFJ6v9gBD
	 QRK1LIEV53QaUbmg64S4PUvCJiU5zi1vS5VZJEF7I92t4P2l4aJC0ts1Fp+GQa8B1gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vwJ1KqKL;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55364606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55364606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vwJ1KqKL
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3b4944a0eso1158501c88.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807237; x=1795412037; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0w/f/nIRvQ41Y5kXOY9lL+2GFsd+GjYZ0Mpuv3lgWjs=;
        b=vwJ1KqKLo2XIV441DN9PpIWRfPJaoX9A0drWHA+3bQDRQxXKPa+zWdT5VPD/4m1uNP
         lSY4desoNuPSzNMazMVv2cNxT8i4E66H4lR4BP2jm9fDcVNeXKQVgeYUlW6WDrYSSJPB
         i6xJ7r6WEyj+X0kzTTW4S8Cc7LJUvl/O7lJrU+x3lfiGVNKPAo6gJyiB+2Y+W5Pg6q7h
         KptRYlAyZUtxsO0C5ZebFVUVxjC+12K8W1pdeKgP/EyS30L97pZnDzQsjjB7f+FIjRLS
         A5m2EUDsc0XpVWtBvT6n0CUTptwq0NXvMuIFb7Iq6MLb8Pk9imci6b1G7Li6IqYNITYi
         K9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807237; x=1795412037;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0w/f/nIRvQ41Y5kXOY9lL+2GFsd+GjYZ0Mpuv3lgWjs=;
        b=N5lH68rPqst6gVvosQtEuZeKe6je1YWy5igvbgr5vqSRf091xhUaZ3sVRQgXW1P/cm
         R9eClpC04TBka2feuauzfJkiqxeyjfzEzoLkcsXQ3hdrhVPW5I6yq9e5HCarX20kWwk9
         APuaATMfJ8nu3+vG9de+5KePO2oqBIKf3Mqd1l4wO8b8u/0gQBUEFwiDaoD3a2muGkVn
         h/1JCjQKEMo1afeYxH22evbOQQCcNxo4qwsQQ0kAJJrbh8PZ74VgvnmsH5oWOLidsa0+
         h+JhY5av/8eSqO0x+rFcFE3CuZAR3dl4+xBFU2PZpC/4H8BsvGCdlFgGafDJK5FKeds6
         gOhw==
X-Forwarded-Encrypted: i=1; AL+hErGP/90h6AaJGBGYFuBzzRqolfZ2SsI3tTd6e7iTvokQEd3ithRa0T89bN8Jx0GPDSmx2d+ZgMf75ZDJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/vYss/PbIaV9L3MnkQdXUOqBv+fkmBNzsTIz65rudpBeMaD3Kn
	FTFVFdW/OCr/wBJ/46QAXMRZTGXr2+sbv5BGmmeTK1BGFbajN9avz4d8
X-Gm-Gg: AYBFou0xeI0XdmeIQxluqyIwIeYV2gf1Esdb3R/+be53lZSuFFlhc6kMc60xqNY+sqm
	vSvVYSpRnNN38QksGLwAeKHBgsz9xj2DbGfo315b13yXXmdG6RFEpESZJIfwmo0eqrZ9fz/+0Pd
	I9oi0NAUR9PWGfF2MiQfIwKB4qdzX7OMCxxjlGfDxXVDJoBqoFaIq0tpn4wT7pytGWt/MSgbQK9
	KK34SmqEFgaEl6Lmzi1JQk90g4H8a8VHy/umVOVaVDd3KwXZXvtkNf4uIgtIIllP1NZYTLdpdBt
	b1M8PTd4cyqBd2SC8DV8UrAY5d255sr/sM8M0lwcCR6jomiwqp/ey1OxfxV/A+nYlqSOXsZiq8A
	XntBzg9x1ygJJQT+csbQKVso+H8+QKJFHvX8bz1zo1L9wPrf+BbPQ8UYTucHrt4gAVz42dGN7iB
	4e20giRHhWz3xsBzr35jodfdJcn4/Ll/lApTixLPwT2GgNNNoaXRySsS2eOcaixqLl5USvMXo9J
	RO4FozrHXbMnDChSHv0AMxUrLCVNrhT0b5K1Iil1a7I2JJuGdnUVTxe04WO3fSC/avvoa2HLRx3
	9IZ47VaItwHWatjkp7eEeTUmXJR0FJ8rwzXKAYo7efu8UGSE3nbv4zTe1i7qViX5Fx8/tH60Tdb
	9ilE5
X-Received: by 2002:a05:701b:2050:10b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1b5031247b2mr9638120c88.30.1794807237116;
        Sun, 15 Nov 2026 21:33:57 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:33:56 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v15 0/8] Add initial support for Qualcomm SM7250 SoC
Date: Mon, 16 Nov 2026 05:33:44 +0000
Message-Id: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIALiV+moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDE11FJSSM
 xLz0lN1M1OAAkpGBkZmhoaGZrrFueZGpga6BkYmScamBonmSWmGSkDFBUWpaZkVYJOiY2trAYg
 gNg1ZAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807228; l=8347;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=7sFNnBSgl0y/IKnMm2OQoutXPcOL7acB8zm5ok13LaE=;
 b=vz/YVSoqEGCVg/OHnT2rf5hNS0amPModqoJeSgyHHgLcsLkzSIr5QY607mugyMKPPruaTV6rg
 XHknS7t+e/BCrw9RWwSxUarDlJCzEGfdp9JvI1mGC0U7vsUe9VxaJ1r
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
thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
dt-bindings: thermal: lmh: Document SM7250 LMh
thermal/qcom/lmh: Add support for Qualcomm SM7250
dt-bindings: firmware: qcom,scm: Document SM7250 SCM
dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
arm64: dts: qcom: Add SM7250 devicetree file
>------------------------------------------------------------------------------<

Changelog [v15]:
[PATCH v15 3/8] thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
> Update the patch to fix apply conflicts with Linux 7.4-rc3

Link [v14]: https://lore.kernel.org/linux-arm-msm/20261106-sm7250-v14-0-7d167e993f9c@gmail.com/t/#t
Changelog [v14]:
Fixed various issue found from Sashiko's review, Link: https://sashiko.dev/#/patchset/20261104-master-v13-0-355b65c6f764%40gmail.com

Link [v13]: https://lore.kernel.org/linux-arm-msm/20261104-master-v13-0-355b65c6f764@gmail.com/t/#t
Changelog [v13]:
Fixed various issue found from Sashiko's review, Link: https://sashiko.dev/#/patchset/20261104-master-v12-0-57fbe9eef978%40gmail.com
[PATCH v13 3/8] thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
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
      thermal/qcom/lmh: Switch to match data for SoC CPU-to-node mappings
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
 drivers/thermal/qcom/lmh.c                         |   74 +-
 include/dt-bindings/clock/qcom,gcc-sm7250.h        |  163 ++
 10 files changed, 3327 insertions(+), 19 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261116-sm7250-024b350a7bf1

Best regards,
-- 
Sreeshankar K <sreeshankar0910@gmail.com>

