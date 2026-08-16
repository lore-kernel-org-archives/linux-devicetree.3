Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A18A1F936
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 16:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786898015; cv=none; b=fDmElKGx9fo87zbRrRBo8GxQiuopeRTLsFf3NDZ7IUDb9KI9FhwUd7uCt66nDQuvHKccgEMp9gwS0x06LlmhVepJhXiO3jGbb2bZFxyP/V6H5V3LLOzSwo7XBrLfaD2/mhEvenzJ/NWNl2hyg3MypW54L60ytBapRR1VyTQ6BI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786898015; c=relaxed/simple;
	bh=aLmCTTokoBQWTHnnQIVsPOPPMBvtHbO/XqplkOYS4Jo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OgkotIw56j4JyHwJXuZOlpq11d7fkfwZx4IrN8Ui/MSajPbIIT6Lb0THXQ5j9DJTIOlEhg/lJ1Rr+3bjUXRzleH2nhRbtwb9MSQwupDNLkEyacV7/TfcsRlkx1vmwp2x4JjT2hj40D+/5VVxAs/cKvDkZYjok4T2cf5ebbZvMLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VtWuaRJa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VtWuaRJa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954231F000E9;
	Sun, 16 Aug 2026 16:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786898013;
	bh=LVVeSLCybKHcDzTSqp+T8m009ppBAIs7wbVyURoJ91Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VtWuaRJafiZ4KdODygceJO62ntfRDjXPfwA+GP59Xlyvju0zeWL8MrAUssf/jHq7+
	 I/e6NupV5AK6N5C7alYBZavgeAmh52o8NQzbE0RjHbVZnQP8WU/3oOo2Hq+s+E/8TM
	 ++bUEZ3WKWKkN0S7oXR6NlrN0Y7Fm4DC4OIF1hDXDbZx9GR9Y4vtJ8VHZ/CrO0nFoC
	 o0Aydm0sYEcgs6TOAuDgECrNEBCkxyDG8IK4tdrWADrO0tDjiewK1r5q+Os3lvhzUv
	 HeiJdm1tS1zYG7ljO2WqBAZQZGxLvptyBNmL7RN4yHkstSLZ8ykGDgWXb1TeLagnoB
	 JFlelDq6ElLEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: Add SM7250 base dts file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260816161808.12419-2-sreeshankar0910@gmail.com>
References: <20260816161808.12419-1-sreeshankar0910@gmail.com>
 <20260816161808.12419-2-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 16:33:33 +0000
Message-Id: <20260816163333.954231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The `cpu-map` cluster definitions use non-zero starting indices (`=
core6`, `core7`), breaking Linux topology parsing.
- [High] Mismatched QUPv3 wrapper addresses and clocks.
- [Low] Missing devicetree bindings header for the clock controller.
- [Low] Invalid GIC_CPU_MASK_SIMPLE usage in GICv3 interrupt specifier.
--

--- Patch [1]: [PATCH v2 1/5] arm64: dts: qcom: Add SM7250 base dts file ---
commit f9be33ec0cc19ce8ffedcebd3293f880830f4c83
Author: Sreeshankar K <sreeshankar0910@gmail.com>

arm64: dts: qcom: Add SM7250 base dts file

Add devicetree file for SM7250 SoC and SM7250 MTP platform.
This file adds the basic nodes like cpu, psci and other required
configuration for booting up to the serial console.

> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7250.dtsi
> @@ -0,0 +1,499 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> + */
> +
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,gcc-sm7250.h>

[Severity: Low]
Does this file exist in the source tree? A missing devicetree bindings
header will cause a preprocessor error during compilation and break the
build.

[ ... ]

> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu =3D <&cpu0>;
> +				};
[ ... ]
> +			};
> +
> +			cluster1 {
> +				core6 {
> +					cpu =3D <&cpu6>;
> +				};
> +			};
> +
> +			cluster2 {
> +				core7 {
> +					cpu =3D <&cpu7>;
> +				};
> +			};
> +		};

[Severity: High]
Will this topology be parsed correctly by the kernel?=20

Looking at parse_cluster() in drivers/base/arch_topology.c, the kernel
iterates over cluster cores looking for child nodes named core%d
starting strictly at index 0. Because cluster1 and cluster2 start at
core6 and core7, it seems the parser will fail to find core0, break
out of the loop instantly, and completely ignore the remaining cores
which will degrade scheduling behavior and performance.

[ ... ]

> +		qupv3_id_1: geniqup@9c0000 {
> +			compatible =3D "qcom,geni-se-qup";
> +			reg =3D <0x0 0x009c0000 0x0 0x6000>;
> +			clock-names =3D "m-ahb", "s-ahb";
> +			clocks =3D <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;

[Severity: High]
Are these clocks correct for this QUP base address?=20

The base address 0x9c0000 physically corresponds to QUP0, but the clocks
requested here belong to QUP1 (GCC_QUPV3_WRAP_1_M_AHB_CLK). During
driver initialization, won't the driver enable QUP1 clocks and then
attempt to read or write registers belonging to QUP0, triggering a
synchronous external abort and kernel panic due to accessing an
unclocked AMBA peripheral?

[ ... ]

> +	timer {
> +		compatible =3D "arm,armv8-timer";
> +		interrupts =3D <GIC_PPI 1
> +				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 2
> +				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,

[Severity: Low]
Does this comply with the GICv3 devicetree bindings?

The schema for arm,gic-v3.yaml requires the third cell of a GICv3
interrupt specifier to only contain trigger type and level flags in
bits [3:0]. GIC_CPU_MASK_SIMPLE is a GICv2 legacy macro that sets
bits [15:8], which causes dtbs_check validation failures.

> +			     <GIC_PPI 3
> +				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 0
> +				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816161808.1241=
9-1-sreeshankar0910@gmail.com?part=3D1
