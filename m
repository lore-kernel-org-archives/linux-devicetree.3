Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A8C3B2FE3
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779174984; cv=none; b=VAv7D34UGSjEbhEbY2oSywrR1yj8Jyxo2X5Ya8m+HTj6gLgE9IqRKR9lw17mSNRRyFbf30VC+mJWWWHhz+QxNvu+JMeMe2JUgxOxvmpfYKouXJR6js8TnJel9RHALTF46jKCksu1F18IDxXz3S1OLva+vlUQlICv04SV6NXJSAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779174984; c=relaxed/simple;
	bh=18BzN3Zf4zWGePYwy6xLX/qrfkklgaPYue75nsqzp9o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TBpoVMBchCbI0yGp8IlRuxOCthnefSHAABN5yS7s737BtCsNXFn8P8eZX4kWJLWdG+cBYuGe3/b61GtUrIRuoobNHYRoRGxhZWxEwXe5CzhTcCZtYddNnF6WaQ9uxZm/uIr/j4QSD/PbxXHYzftFyrkzSuAw1DsnOSoOQ56qwSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VeP+G8dH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VeP+G8dH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A452AC2BCB3;
	Tue, 19 May 2026 07:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779174983;
	bh=18BzN3Zf4zWGePYwy6xLX/qrfkklgaPYue75nsqzp9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=VeP+G8dHKoQKwfLw6vSkG61IPgHxmNx8oaL6uzoq2TDFuqLLA3NYU1vDRz1Otu6h3
	 J6YDR2awhb0kLIMEuK6fpGknDht9LVVhqHq7ZQDKvPLZ/LdNnFKNJv8CJINL5jhYC0
	 mBkaGoKjNyTF9D6kWx2sseOqGjNv63KiR0UCWzGOgImyRkUyCLpeqwMLnjfCvk0VEK
	 BaG+WfExZfl2gjHCOt/x8zc4s8OJau4uHLgkTyQaWsUG9M0Q72Mt4sSJJbAIItTp1j
	 kmnY98ZQrzAES7WYFvj4nTmjr4g4+bNv0eG5BulSZZnt+nPfQfKRtCeDP3bXvyVhsE
	 d0iwBNGES/ZHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: Add device tree for Nord
 SA8797P SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260519063505.883379-7-shengchao.guo@oss.qualcomm.com>
References: <20260519063505.883379-7-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:16:23 +0000
Message-Id: <20260519071623.A452AC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] SCMI providers are left disabled, leading to probe failures for de=
pendent devices.
- [Medium] Missing GPU SMMU node claimed in the commit message.
- [Medium] Inconsistent and missing SCMI protocol sub-nodes compared to the=
 commit message.
- [Low] Unresolved phandle dependency in shared `scmi-common.dtsi` breaks c=
ompilation for SoCs with fewer channels.
--

commit 360295b4c98c35977b904736f9ce01833171cfbb
Author: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord SA8797P SoC

This commit adds the device tree include for the SA8797P automotive SoC.
It covers SCMI shared memory regions, GENI SE QUP blocks, and UFS
controllers, while introducing scmi-common.dtsi for shared SCMI
channel nodes.

>     - GPU SMMU node with SCMI power domain via scmi15

Is this description accurate? There doesn't appear to be a GPU SMMU
node or any usage of the <&scmi15_pd> power domain in nord-sa8797p.dtsi.

>    Also introduce scmi-common.dtsi providing the firmware-level SCMI
>    channel nodes (scmi0, scmi3, scmi11, scmi15, scmi23) shared across
>    SCMI based SoCs, each carrying clock, power domain, performance,
>    and sensor protocol sub-nodes.

Are these sub-nodes correctly described?

Looking at the implementation in scmi-common.dtsi, the clock protocol
sub-node (protocol@14) is missing from all instances, and the sensor
protocol sub-node (protocol@15) is only present in scmi23.

Additionally, a reset protocol sub-node (protocol@16) is included in most
nodes but isn't mentioned here.

> diff --git a/arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi b/arch/arm64/boot=
/dts/qcom/nord-sa8797p.dtsi
> index 0000000000000..343de75129282
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi

[ ... ]

> +&ufs_mem_hc {
> +	compatible =3D "qcom,sa8797p-ufshc",
> +		     "qcom,sa8255p-ufshc";
> +	reg =3D <0x0 0x01d44000 0x0 0x3000>;
> +	power-domains =3D <&scmi3_pd 0>;
> +};

Since scmi3 is defined with status =3D "disabled" in scmi-common.dtsi and
not overridden to "okay" here, will this prevent the SCMI provider from
probing?

If the SCMI providers remain disabled, won't this cause the power domain
core to perpetually defer probing for dependent devices like ufs_mem_hc,
uart0, and i2c0?

> diff --git a/arch/arm64/boot/dts/qcom/scmi-common.dtsi b/arch/arm64/boot/=
dts/qcom/scmi-common.dtsi
> index 0000000000000..0c7ffe9e415c4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
> @@ -0,0 +1,1918 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +&firmware {
> +	scmi0: scmi-0 {
> +		compatible =3D "qcom,scmi-smc";
> +		arm,smc-id =3D <0xc6008012>;
> +		shmem =3D <&shmem0>;

Will this static reference to <&shmem0> through <&shmem63> break compilation
for other SoCs that include scmi-common.dtsi but have fewer than 64 channel=
s?

Because the Device Tree Compiler validates phandles globally at compile tim=
e,
it seems any SoC including this file would be forced to define all 64 shmem
labels even if they are unused.

Should the shmem property assignments be moved to the SoC-specific .dtsi fi=
les
instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519063505.8833=
79-1-shengchao.guo@oss.qualcomm.com?part=3D6
