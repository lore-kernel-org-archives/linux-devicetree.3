Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778383;
	b=CAo95HeQsTzh2nJCHMah6MmYZ0+fy+I94lv37rgI9eOyztIkXpZEHXHj7ljxy5kbBCNJ
	 yErV9JJuzZ+Jiip4xFIId6PKpzQPZcYEBUGVEhFqOCuKhEJQ+0y8BINKwHHKlb4Hpva67
	 EXX8j/vHFwNNx/dhEAr2wD/r6IKC213ndrohC5eSW3ikRTEvf1Bnk2n9Tx4POvGtQNeyT
	 gf9zf+xbwwwHMrHAAU0dzycreOcFSOhH4SU6KzizrPqkIYHDkL9+qvyMrgLQVE1tkiZ2I
	 fq7nDjb+3P2efj1TUPiWuT2Wtc8AraFJIqAd/VIMlHk0eAqY5jrmrfzBGx8Xc8Ymf+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=S+x6qxNQDI8X9419/RDkU2EfFf+KlNnBBqU1zpiR2vI=;
	b=0FJx+FU1evOF1oBdUbIhEHsF7aGjQWho9ROM34kgLr0+OzOrsTrhKdWzC4atKkiE1H2/
	 SvA07HbpevZHtEqNM2BJhJZiAod5/hK33S/th23ErQDpEFeM9ENZUnEk98QBwBljS9sof
	 cwRtV7Jlnmg6CKWX84b1HSOFYBpL4iG+O1qF440O55CHid/QLTrB9bCw+RuUEn4Aq7gld
	 5NQz/IcWYejUEpcr+WE/BY/Q9UtlMkDYXzBN+RfN6w0KE3QN+ryf5xPD8FUB+z9CyN9XR
	 ebbAQVj9opjqOLTpGHyyLXnZCdjg8Y7tzGowQEqVYfp2nCiOrNwgoQTnhaNLA2XKqZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GM7iVvK6;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E1A606A338
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 07:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8E1A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GM7iVvK6
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a315ed211so354352eec.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 23:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778381; x=1794383181; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S+x6qxNQDI8X9419/RDkU2EfFf+KlNnBBqU1zpiR2vI=;
        b=GM7iVvK6UGYRfYwjGjDsFFI2QHEuoujWoCh40Qmzr1fDH15kAebXMOgCnPY5D8V439
         kvgWs2/JaP+5cpassEqcTJGtc8zSW3MzM2RGwkdt+9qRvNtm57hC/PNnJg8fXMyQLjdH
         4SKdjED2hlEEsWx3fMa6kUcHH1XlcG6WRBr7+dJ6dCs4Bumf7LB1nfECl7S98FDdL7jL
         27fK22PiLvGeQIHsxGwIuW7a8l1ZgPvE3bhzlG2ZLMcrYU0hLiyPuM4eapOdkXrpEiK7
         WsqraqrmeUeyHPe7l5zASGpwL05PIzWcvY/1ezmt5qMwY6AOwVie2HCuca87Kz6Ar1Wg
         3dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778381; x=1794383181;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S+x6qxNQDI8X9419/RDkU2EfFf+KlNnBBqU1zpiR2vI=;
        b=GI+IUtRIMU6IyrFnMypZmCbyee2F8zOJwlgUlafiVGmDYuUnzp4zHVe9fdj4Ewz2d/
         8k8KfXwqpIZOqc6dG4MoBrPliVztMQt3/lqudr2sEgoI5Mn29fDHfhy8Fi9SUQrSeJiK
         ytnYfAxMebTEeeBV9SPvflV0/UcU45GtQ26tolicEAiD9seXqV3hQgBLsoqu9EDrnKri
         kiea4u1MyyrcCVfxpa2U/6WjWBUQ5Ulr0OFlrZj9Q76EGhGtB4KJTVqnlC/NWt3+GP8j
         b1A0mJzufP0Hx1LPD1YcJzX40IuL7VWlzbeJ2CW11cwcQR/X+YE3yXL3/eZ8wWpc3uLk
         9TgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwHxhZ9XHWhjwow6+RoGgCNbsZRAZvKByhh918oahu/CUshTVYYH3GrJ0f7JJkBCiJiDBSUdBYlX4N@vger.kernel.org
X-Gm-Message-State: APuU4Z+kIXc23cQTIEr/Ib4GZs+pbAVtzlG0tsFkGkCD4oVFnxYqaGat
	gyIPvLEHB3JiTt9un6U3CWXBt6ebtckMQgQD0sbpRmwNxxU7k+wgaVra
X-Gm-Gg: AYBFou1y7W+3OVSrH4rfvwsQPK0oWSgml+KdZG42iPfY4DQSXr19s26vqIBNOY7yvQQ
	V+c1PIOCA8DJBOuaD7rrB0NDTwWxSLjfxTs42XWbIx9O5ia1Gf0fV4Ej6YLLKmicThhLyWr+j8Y
	6PWSSztU8ImQiNtlPIMRb9vL2WlNEHbBSNrtL3PSLagMgaDGGGy6V/p0UDEKCEhmXhnyDjXSVWr
	iCWakENwRe6OpdGf+ifqVEo0FsIr7GqrMBX/2v7bF+PDdGT+WCxhew41CAusMEwne94rjOxGgfp
	uecr/P40TE2uZTlGNdDY81udwr3NMuhUxJgjs2QiC9+LfMQO9C5HLQkl7LAUxck1ATaJaxeAvjM
	VAuEgID/4l67x+u/FVwFNA6aKvWx014dP/AdH1rTSAqUjvnJ082iGz3awh/U5LdOytt1qeqWq2d
	rEyvdJCwbjzPq0OOVhqzKhfvAUo5OKoqLgUhJgI+NBHwiDPVojj7iBcE1gd8qg/VnuO14Sv+iVL
	f/3n9pwQzrHDv/FEdmuFHda6pI+phGvCxFYLbqXnvTesY36hTK+KLU4LFMRxHHtU1/Wk9d19EBY
	WXrxn1P53ebTtkkyYqloaJKhX7yIl/gjtS/rW1IfrMGnPhm0VGEaOCbrIVKQbUZzVA0gD+9kJa3
	iGgaQDQ==
X-Received: by 2002:a05:7301:23a6:b0:36c:a39e:fcf9 with SMTP id 5a478bee46e88-36ca39f00ecmr2531535eec.8.1793778381456;
        Tue, 03 Nov 2026 23:46:21 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.204.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm4566016eec.8.2026.11.03.23.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:46:20 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v12 0/6] Add initial support for Qualcomm SM7250 SoC
Date: Wed, 04 Nov 2026 07:46:03 +0000
Message-Id: <20261104-master-v12-0-57fbe9eef978@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIALzi6moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDI10FJSSM
 xLz0lN1M1OAAkpGBkZmhoYGJrq5icUlqUW6pskpRimWyUkGickWSkDFBUWpaZkVYJOiY2trAWA
 Gv35ZAAAA
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793778372; l=6866;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=R1dhX5JbUMHvKu/MupaHu+YfQPZ+VXmXHq+cGAjavtA=;
 b=wTe5JCMSJDIBrfir08X+CflO5XCH+38PYn1/dbIo7kqXlXBKhfzYT0p6fZA4vBcS1d+x8ZviW
 ap932+ga3SoCl4nQUY2POWiiy16YDK+rlegZDJZCvMnr5sSYRVQnA23
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
dt-bindings: firmware: qcom,scm: Document SM7250 SCM
dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
dt-bindings: thermal: lmh: Document SM7250 LMh
arm64: dts: qcom: Add SM7250 devicetree file
>------------------------------------------------------------------------------<

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
Sreeshankar K (6):
      dt-bindings: clock: Add SM7250 global clock controller
      clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
      dt-bindings: firmware: qcom,scm: Document SM7250 SCM
      dt-bindings: cpufreq: qcom-hw: Document SM7250 cpufreq hardware
      dt-bindings: thermal: lmh: Document SM7250 LMh
      arm64: dts: qcom: Add SM7250 devicetree file

 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |   13 +-
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml          |    2 +
 .../devicetree/bindings/firmware/qcom,scm.yaml     |    1 +
 .../devicetree/bindings/thermal/qcom-lmh.yaml      |    4 +-
 arch/arm64/boot/dts/qcom/sm7250.dtsi               |  795 +++++++
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-sm7250.c                      | 2278 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm7250.h        |  163 ++
 9 files changed, 3262 insertions(+), 5 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-master-5cd2d9cb0ac8

Best regards,
-- 
Sreeshankar K <sreeshankar0910@gmail.com>

