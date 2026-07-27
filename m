Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BEC422542
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173924; cv=none; b=sXvjUU7SSMotLisoCFYr/AKsg7rXKMO0j+M6JTsmC3wsspQVxUtQGenA9IhTamCBjdObdQfAx5a2C4X7Fkaxt4U+WaVvBCy7LGM2lRSrfgE+1P1fCDQLsPHkOf+7P05vmrjoBQAnxs4LJ91/lb17qYLOpv1LjKy+uNXr/HP39Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173924; c=relaxed/simple;
	bh=vXM27qT0ibFF0OiK2Uq4qUK7ftTuK/F9hCiZAjfh95U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tf5zk8sn4bwdDBtNVUWJ3+pgXXmAAGLx7cbLM0queINDBuXrN2QpUCYt/eKik88sjNGUe0L4F+eolj98f1Z41YGx2s7PLEln/3t8ooXVcCv/3ZfnghwzoFkLFq8OKqbw5ESVv/ul2wCLnw2TUq8hrZHO+B7gckNK1JK+GuLURxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJ1OXNAJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJ1OXNAJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D68E1F000E9;
	Mon, 27 Jul 2026 17:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785173922;
	bh=ZBFlMXcgYI074KUq+3tAXXsyEoywz0bPwixckezs4tU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iJ1OXNAJhXqnMV65grYFEeqw7zGiEn4gsXyJNvjxbfzpW2rKo8NKFsdcQfnqcWl8N
	 eFoTZ4yBSOdiq5VstH1Zoj0tzU5o7PimC7hM1H8gjTngXidCBLxdx6uCZENYbLkvpI
	 0TBgxLvimvdW8hQpr0G158YsGgsxkdLRbKflmdu81dhNrPQi+JxIk1B4dtVptP+TCF
	 ONdH0VsSkqnwBOpiBWARQARuv/piiwC5wM4yKSicEA5XsMZtidiNWa3gJcGaJCUmzn
	 gOCEq34Fo25VTxMi6a7H8kfR03eO6k4uKlKLV5oezy8zjg8HFqfWWiwwyrMN6AXeTd
	 M3TKKrZLtOVKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: Add header file for ADC5 Gen3
 channel macros
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260727-adc5_gen3_dt-v3-1-bc00223648f3@oss.qualcomm.com>
References: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
 <20260727-adc5_gen3_dt-v3-1-bc00223648f3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:38:42 +0000
Message-Id: <20260727173842.9D68E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree binding header for ADC5 Gen3 channels is incorre=
ctly placed in `arch/arm64/boot/dts/qcom/` instead of `include/dt-bindings/=
iio/adc/`. This violates the standard architecture of DT bindings, prevents=
 `dt-schema` validators and external projects from accessing the macro defi=
nitions, and masks a C namespace collision with the driver's internal macro=
s.
--

--- Patch [1]: [PATCH v3 1/4] arm64: dts: qcom: Add header file for ADC5 Ge=
n3 channel macros ---
commit 5bbbdaf340939452a160698c40a85377bcafb036
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

arm64: dts: qcom: Add header file for ADC5 Gen3 channel macros

This commit adds macro definitions for virtual channels used by the ADC5
GEN3 device. It introduces the header file in the architecture-specific
devicetree directory.

> diff --git a/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h b/arch/arm64/boot/=
dts/qcom/qcom-adc5-gen3.h
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h
> @@ -0,0 +1,88 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __DTS_ARM64_QCOM_ADC5_GEN3_H__
> +#define __DTS_ARM64_QCOM_ADC5_GEN3_H__
> +
> +/* ADC channels for PMIC5 Gen3 */
> +
> +#define VIRT_CHAN(sid, chan)			((sid) << 8 | (chan))
> +
> +#define ADC5_GEN3_REF_GND(sid)			VIRT_CHAN(sid, 0x00)
> +#define ADC5_GEN3_1P25VREF(sid)			VIRT_CHAN(sid, 0x01)
> +#define ADC5_GEN3_VREF_VADC(sid)		VIRT_CHAN(sid, 0x02)
> +#define ADC5_GEN3_DIE_TEMP(sid)			VIRT_CHAN(sid, 0x03)

[Severity: Medium]
Should this header be placed in include/dt-bindings/iio/adc/ instead of the
architecture-specific dts directory?

Placing device tree binding headers in arch/arm64/boot/dts/qcom/ prevents
dt-schema validators and external projects from accessing the macro
definitions. It also forces the driver to duplicate these channel constants
internally.

For example, because the header is isolated, the driver is forced to
duplicate this as an object-like macro in
include/linux/iio/adc/qcom-adc5-gen3-common.h:

#define ADC5_GEN3_DIE_TEMP                      0x03

Would it be better to move this file to include/dt-bindings/ so it can be
shared between the devicetree YAML bindings, the driver, and the dts files,
while also avoiding the C namespace collision?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adc5_gen3_=
dt-v3-0-bc00223648f3@oss.qualcomm.com?part=3D1
