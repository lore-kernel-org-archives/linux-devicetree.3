Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151F63DD51D
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933936; cv=none; b=lgmvUWMh8h+NSE7pmXTxJjGA/WU3OEK8zDIeosSpA6381YXDsfmFdPRngehyEUu86IudmiHWoU2Yl+U1Fm9MuUFgGAcWWwBLzs4hWB7/t6oZjfJc5XN7omUjk5OEEfADYrKm/EJr2ovGCGtk8xd/mM+mI+iDfl5u0WY/qTKPRy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933936; c=relaxed/simple;
	bh=6MZbRAXtQ1EzJCapG/2k8DFB5H52KeWskAFZgXyoZ6I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sWbB342DuNYwEpqOvLNCn1K6sbGbVX06CCV/Xci7RQDrvRr8Lxf1zlgDHKasygLpMULwol7TV1VlouiIqPafKirdohpDqVPcbVbDzZj2+FddNzAmvRJmokVBxBtdKFGKpzFeypVYZyhhDqgdf7zP0Mu4EV1LeUl0jc5r2mJpiek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7emnPMR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7emnPMR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1671F00A3A;
	Mon, 13 Jul 2026 09:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783933934;
	bh=EPb4fAjmPtBKET53xKpYi8gT43zawbypZx7hRw/ZTyQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h7emnPMRBTsfmSZnSoVlIZ4FEv23tw/xaZ3Fo0VD2vbhMsEVI9iwuevGncDlxbXKg
	 BQWxBecux+lgJ4/t7Bg1G26IsIyBY5kv/XLjZKjDWS7mtQuQGoa73JPHxsap2NRwHJ
	 NYaqwY6Vavqf+D3aFHYvZ1QiYvN8jKVeRwGXIwvG7kWJ6ngz5eoHjJEYIlR4YzGF0k
	 bYuwuubYq7Xs1a+vMXhVvF1UnbC2g9FFXerPOfjJD/hL/25av303pjPom9brMJZDZ8
	 KcIeEXjdvyT7G8qCCACZdIp7n2bN/UUhlEfdn5/2uBbReDkxI2ohuv2NlGjCJNsCr/
	 0Q+g1wMwUrBrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: qcom: Add Maili global clock
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713-maili_initial_clock-v2-3-79548f0bb58f@oss.qualcomm.com>
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
 <20260713-maili_initial_clock-v2-3-79548f0bb58f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 09:12:13 +0000
Message-Id: <20260713091214.5F1671F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing Block Control Reset (BCR) definition for the newly added=
 QUPV3_WRAP5 hardware block.
--

--- Patch [3]: [PATCH v2 3/5] dt-bindings: clock: qcom: Add Maili global cl=
ock controller ---
commit 71e15b2f70937d7e5560b3d037438455bb0ef7dc
Author: Taniya Das <taniya.das@oss.qualcomm.com>

dt-bindings: clock: qcom: Add Maili global clock controller

Add device tree bindings for the global clock controller (GCC) on
the Qualcomm Maili SoC by extending the existing Qualcomm Hawi GCC
bindings, since the Maili GCC is identical to the Hawi GCC apart
from a few additional clocks.

[ ... ]

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
> +#define GCC_QUPV3_WRAP5_QSPI_REF_CLK_SRC			191
> +#define GCC_QUPV3_WRAP5_S0_CLK					192
> +#define GCC_QUPV3_WRAP5_S0_CLK_SRC				193
> +#define GCC_QUPV3_WRAP_5_M_AHB_CLK				194
> +#define GCC_QUPV3_WRAP_5_S_AHB_CLK				195

[Severity: Medium]
Is this block missing the corresponding Block Control Reset (BCR) definition
for the newly added QUPV3_WRAP5 hardware block?

Since the WRAP5 clocks are exposed here, it seems a reset definition such as
GCC_QUPV3_WRAPPER_5_BCR is needed as well. Without it, the clock controller
driver won't be able to expose the reset for the QUPv3 WRAP5 block, which=20
could prevent peripherals attached to it from initializing properly.

> +
> +#endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-maili_init=
ial_clock-v2-0-79548f0bb58f@oss.qualcomm.com?part=3D3
