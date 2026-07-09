Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EC325BF13
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605082; cv=none; b=P0+MMl/Lt5FwGUKoPyUc9YpDuVFFpFiLboUH0FaSaF/TQWO4OCUL/u8bOKliZYmm+ZrXqDkfxpYhizhZo42U6VGy3TffEUKdfppVtekhcKnARqr666ImCy0qTLGMfSoMNGdSH/J0xoerPzUkKmzreMiRKTmMoNJARglbUrzcnJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605082; c=relaxed/simple;
	bh=y4ni9wIBIePLc2OYY21TT1+Ay0gNxqIVQP9RW+kaN+U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mlgQH9Fw/aXXiZNLRpXmgpkUFMiWHtpcxR2ip05CC5abgg6mdRQGOya34vFFEoAR50OTjDCx8FQGtst7Z+nZsrEg8qOGq9Wj0J/avFNlHYEBuE1sAxHpa/Mf2ShPU67sZisEjxa2PGyz5i+F58uBxiiEVYwLZxLJkqYnZ1ZhlHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEfUezB0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEfUezB0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C1D81F00A3E;
	Thu,  9 Jul 2026 13:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783605080;
	bh=Jvyk/1DqPT94asu4fgogBjDx6wucmzeag9GXLmf9BKU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JEfUezB0h4OXd6tsDhL57RNsHdO5YrJ9yVI9VYA78xQ4AFFxsKvAARHC5fEOoCULV
	 EdqcZEx/aephEs2NVKkwtKS3MoS7aOvvIiVVgEbYCS2qyz0wxc8l+0Z0fihxae2Lx6
	 Y+5WXieGcyHMERejryGal9qtTw78qS6Z8+AbgNj+mErQtOipIFY3Na0jWSWpNrl54y
	 WwitrX5M/irSWYgn5AxkYDQ5vgAnapOugkydXJpsWfp0OtPKaDdzINUbMTbMRfdjI7
	 9jWc7dfJzH5G7bxEl75mJraIG9IFeaWbwGNBUu3g/d7ZdUg+XBSsa0N+C1G+9wFsCt
	 a3XmrkA/sq2ZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/7] arm64: dts: qcom: Add device tree for Nord
 GearVM variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260709132013.4096850-3-shengchao.guo@oss.qualcomm.com>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
 <20260709132013.4096850-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 13:51:19 +0000
Message-Id: <20260709135120.7C1D81F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] SCMI providers `scmi3` and `scmi11` are left disabled by default, =
causing indefinite probe deferral for their consumers.
- [High] SCMI nodes scmi57 through scmi63 use GIC_ESPI 32-38 with conflicti=
ng trigger types, overlapping the statically assigned apps_smmu_0 interrupt=
s.
--

--- Patch [2]: [PATCH v5 2/7] arm64: dts: qcom: Add device tree for Nord Ge=
arVM variant ---
commit 4395a14fff5eeaf5f222d6a5a7f0fa310adfb7bf
Author: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord GearVM variant

This patch adds a device tree include for the Nord GearVM variant. It covers
SCMI shared memory regions, GENI SE QUP blocks (I2C/SPI/UART), and the UFS
host controller which use SCMI for power and performance domains.

> diff --git a/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi b/arch/arm64/boot/=
dts/qcom/nord-gearvm.dtsi
> new file mode 100644
> index 0000000000000..8f29b5f24ef8c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
> @@ -0,0 +1,2847 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "nord.dtsi"
> +
> +&firmware {

[ ... ]

> +	scmi57: scmi-57 {
> +		compatible =3D "qcom,scmi-smc";
> +		arm,smc-id =3D <0xc6008012>;
> +		shmem =3D <&shmem57>;
> +		interrupts =3D <GIC_ESPI 32 IRQ_TYPE_EDGE_RISING>;

[Severity: High]
Does this interrupt mapping conflict with the SMMU context bank interrupts?

scmi57 through scmi63 claim GIC_ESPI 32 through 38 with IRQ_TYPE_EDGE_RISIN=
G,
but these physical lines perfectly overlap with apps_smmu_0, which statical=
ly
claims them as IRQ_TYPE_LEVEL_HIGH from the base nord.dtsi without being
overridden.

The kernel's IRQ subsystem will likely reject mapping the same physical
interrupt with conflicting trigger types, leading to a probe failure for ei=
ther
the SMMU or the SCMI channels.

> +		interrupt-names =3D "a2p";

[ ... ]

> +&i2c0 {
> +	compatible =3D "qcom,sa8797p-geni-i2c",
> +		     "qcom,sa8255p-geni-i2c";
> +	power-domains =3D <&scmi11_pd 0>,
> +			<&scmi11_dvfs 0>;

[Severity: High]
Since this consumer strictly relies on scmi11_pd, will it face indefinite p=
robe
deferral because the scmi-11 provider is left disabled by default in this
variant DT?

The same issue appears to apply to ufs_mem_hc, which relies on scmi3_pd
but has its provider disabled as well.

> +	power-domain-names =3D "power",
> +			     "perf";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709132013.4096=
850-1-shengchao.guo@oss.qualcomm.com?part=3D2
