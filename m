Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191D33AAF4E
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 18:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434559; cv=none; b=avxCE8N9nJc/frskqpTN6fv0BZtWZisEeZHmmzKkpy/GwK2nfrNaeia6hJo4pGoM0/O7FN5isXprzzK3y9KYXTgiqfJqDb44kBBNVldWRh94cNz1IFNwZEEoWjNlXUYAV4du1+gixXijGLRF39P3zGYmnH68yOJWn1upCywI35M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434559; c=relaxed/simple;
	bh=j8isL4FdgVQRlwt+uxFPOf0+eqYOm8fdeG4rThm0mkc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mD7Y4f29cqyRofDY8itYsWcTTsjnzqb2h37jlMM97hvcvoSsFMrydmHWIlisVj4jUNmCyutJmAoVcIBBM5wgHDNWqnEZysrss1BI5tZQSUJl+OV+gjkX3VMMd0gacbNT0bFrR0mFme99TmGtqhtjcYpu5KfDUekWMfh8jdLmwEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QphR7wD8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QphR7wD8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCDA1F000E9;
	Thu, 30 Jul 2026 18:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785434557;
	bh=Y0ecOZSLyzIyJCYLLnssghsAa6aYy+2HlzoA1YQwe28=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QphR7wD8loAzftKWlB0RzVjV3tGxuBgNJIROfF+XPm4PcDOcxM5YfMm4tipv8uml0
	 7e99Io8TcVOir2jagtm7D6mGoyuLo+PPcRMymGCr+c6sVQAywsGA76um5W52IG0SI1
	 bCG2mMDS/RoMLVpQ0idBXXXYOf9LGp/1NVNFhx4D2Ke/qS8APs3gFuhZjrr21Rfe4G
	 zCd34cGXjvsSkafQJzAyG7+kerP0SEn6HDNz8oZfEkE0rUBJ531cmBXuMgpEb6iOM8
	 /LOQJ56mjOrVsxboaedN/BGy5i/cjKaNkxmQXT4iHyJMwGDUyHI8bYJ2BHKa4jHP+D
	 ELz9e/ImG6rOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] dt-bindings: clock: qcom: Add Maili global clock
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730-maili_initial_clock-v4-3-ed52ade264f0@oss.qualcomm.com>
References: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
 <20260730-maili_initial_clock-v4-3-ed52ade264f0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 18:02:36 +0000
Message-Id: <20260730180237.5FCDA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing QUPV3 WRAP5 reset definition (e.g., GCC_QUPV3_WRAPPER_5_=
BCR) for the Maili GCC.
--

--- Patch [3]: [PATCH v4 3/5] dt-bindings: clock: qcom: Add Maili global cl=
ock controller ---
commit 833adf32860ecbd5cd7a72269cd3221a4b141fad
Author: Taniya Das <taniya.das@oss.qualcomm.com>

dt-bindings: clock: qcom: Add Maili global clock controller

This commit adds device tree bindings for the global clock controller (GCC)
on the Qualcomm Maili SoC. It extends the existing Hawi GCC bindings and
introduces a new header file for the Maili-specific clocks.

> diff --git a/include/dt-bindings/clock/qcom,maili-gcc.h b/include/dt-bind=
ings/clock/qcom,maili-gcc.h
> new file mode 100644
> index 0000000000000..9bea90adb988e
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,maili-gcc.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_GCC_MAILI_H
> +#define _DT_BINDINGS_CLK_QCOM_GCC_MAILI_H
> +
> +#include "qcom,hawi-gcc.h"
> +
> +/* Maili has below additional clocks on top of Hawi */
> +#define GCC_QUPV3_WRAP5_CORE_2X_CLK				188
> +#define GCC_QUPV3_WRAP5_CORE_CLK				189
> +#define GCC_QUPV3_WRAP5_QSPI_REF_CLK				190

[Severity: Medium]
Does the QUPv3 WRAP5 hardware on Maili also require a corresponding reset
definition (such as GCC_QUPV3_WRAPPER_5_BCR)?

The QUPv3 core driver usually needs a reset for each wrapper to initialize
it and recover from hardware errors. Without the reset index macro included
here alongside the clocks, it looks like developers won't be able to define
the resets property for WRAP5 in the Device Tree.

> +#define GCC_QUPV3_WRAP5_QSPI_REF_CLK_SRC			191
> +#define GCC_QUPV3_WRAP5_S0_CLK					192
> +#define GCC_QUPV3_WRAP5_S0_CLK_SRC				193
> +#define GCC_QUPV3_WRAP_5_M_AHB_CLK				194
> +#define GCC_QUPV3_WRAP_5_S_AHB_CLK				195
> +
> +#endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-maili_init=
ial_clock-v4-0-ed52ade264f0@oss.qualcomm.com?part=3D3
