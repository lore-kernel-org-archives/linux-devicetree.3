Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567303630BC
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 13:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517423; cv=none; b=aHaJXTGeD3FF0qOttzdZ+eur+EM4FmTd/R0mDeBOanbqxlIETt1Jyp1ZLraKELVCXRMhhuZzdBV1OBK+sCbO8c5PLw5Fq8ST20qNs6VxsH/zchTTIkscuGU6vVbJ8l4/hTB4gFuta9KmNcsKalX/RJg0i2MZAokJG2k/Rh26htI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517423; c=relaxed/simple;
	bh=FHM/o+FI+YoUTGv2uDICctDnYjddOwPWwsJmsyegOFQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qn7r66vmVi+fmIc0IcslFZePSzZs5NEWS4UPxdZ6IQsSL4XACn392p+ofo8UiXFh3u0gBq/I8ZvuC/JkinI0odnxxo7TLS2m1b6OCzqjBQUHNn2qxMnawB/hsZ9AKs0y+y2sWzZiPsyMjyqF9yCZFfV8Dja1+MY7fVq7i/n0cDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aIQ7f1cA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aIQ7f1cA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9DE1F00A3F;
	Wed,  8 Jul 2026 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783517422;
	bh=FHM/o+FI+YoUTGv2uDICctDnYjddOwPWwsJmsyegOFQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aIQ7f1cAWY2syYaRjGzVeaMrBrg+TnguISmQz1RxIpTctuURgd+pCOKIAUFoMcBQJ
	 5qz2p7jYzQjz/2tkKt+m3T7YEIBEb0hDpc7FIBJzI116Tg7aohxs7tn5N4/NYuJjoN
	 5DGpdhJpzdls+ldkBqN/iZVpAWUvgoVw9uNLx2kHHPMvhVFMGHoz6aR4ugMZ+UOBL6
	 Gb6YIabwyYwUGCMIYz/o8hcd8bwl96oPMQrOYKNrVdYUSEG+vBJTtypWsIC5j3GHqL
	 cSZakunqHAwiap5UJ+PdwbV1hO5ljKrdHdGSQ4ouDTGqhT1HZtjJ9ow9chMmBkCZhh
	 391OSsQe7QbZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/5] arm64: versal-net: Switch Versal NET to firmware
 clock interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Simek" <michal.simek@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <77e6234f6cef3f78fb1c6c97142fa8055982e14e.1783516336.git.michal.simek@amd.com>
References: <cover.1783516336.git.michal.simek@amd.com>
 <77e6234f6cef3f78fb1c6c97142fa8055982e14e.1783516336.git.michal.simek@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 13:30:21 +0000
Message-Id: <20260708133021.CC9DE1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Duplication of dt-bindings headers into arch/arm64/boot/dts/xilinx/=
 instead of include/dt-bindings/.
--

--- Patch [5]: [PATCH v5 5/5] arm64: versal-net: Switch Versal NET to firmw=
are clock interface ---
commit 49b1e2cd1b89d937b21ae992159666e14683c5d0
Author: Michal Simek <michal.simek@amd.com>

arm64: versal-net: Switch Versal NET to firmware clock interface

This commit switches Versal NET from using fixed clocks to the
firmware-based clock interface via versal-net-clk.dtsi. It also adds new
DT macro headers for Versal NET and base Versal clocks, power domains,
and mandatory resets required by the clock dtsi.

[ ... ]

> diff --git a/arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h b/arch/arm64/bo=
ot/dts/xilinx/xlnx-versal-clk.h
> new file mode 100644
> index 0000000000000..d0c4abf78f307
> --- /dev/null
> +++ b/arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
> @@ -0,0 +1,123 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 - 2022, Xilinx, Inc.
> + * Copyright (C) 2022 - 2026, Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _XLNX_VERSAL_CLK_H
> +#define _XLNX_VERSAL_CLK_H

[Severity: Low]
Should these device tree binding headers (like xlnx-versal-clk.h and
xlnx-versal-power.h) be placed in include/dt-bindings/ instead of the
architecture-specific DTS directory? Placing them in the arch directory
prevents drivers from easily including them and diverges from the standard
kernel tree layout for device tree bindings.

[ ... ]

> diff --git a/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h b/arch/arm64=
/boot/dts/xilinx/xlnx-versal-resets.h
> new file mode 100644
> index 0000000000000..fe00f4a0ba65b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
> @@ -0,0 +1,106 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 - 2022, Xilinx, Inc.
> + * Copyright (C) 2022 - 2026, Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _XLNX_VERSAL_RESETS_H
> +#define _XLNX_VERSAL_RESETS_H

[Severity: Low]
Does this file need to be added here? It appears this newly added file is
an exact duplicate of the existing
include/dt-bindings/reset/xlnx-versal-resets.h.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783516336.gi=
t.michal.simek@amd.com?part=3D5
