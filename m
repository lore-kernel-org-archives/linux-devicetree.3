Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3039E3EDAD8
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496537; cv=none; b=Qpyv9ziaLQC+2K6dtdVpKn6Vr89RImCxrM6yEc4Om7o9fjCx6dS+/05vNJFwDN7G46qLYDcOGBj354i44XTsA61ozP2ptQvx9mgl5NPd22xZ3FNNPfb++GAyEsz4/FuAzWsf3Km4A2hJk4B2GIpAcKv5R3ck92zaI6gEgYMKlyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496537; c=relaxed/simple;
	bh=PWSrEnt8nbeS8M/Ojxom6Q7GfHw2d2WxjhKhoHGmnNQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wihw8Mrvq8BDUeRMd2kIsPJkrG6bWwGHZ6az6O/AixvTwey2YDm6eMMyDYhXPxvV1yO3FqIR0JgmJA6UDYPBU/+r+5GhZ/HcNBBCYKAMys8egI//HvfzrmpJFRxTZKPEoj8Sb5x9EnglPMzfcHZQfJYPsLe8rw5ee0m+3qZ+jCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PzqvWoo1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PzqvWoo1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D461F000E9;
	Wed,  8 Jul 2026 07:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783496523;
	bh=8ZrIVAa+vOrV2oTjs+N53jOVFiDW3e7+kZu/tzN2opE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PzqvWoo1zUetFfQIzuTDUj3GzfKAC1+7cVw7DkgVO9Jka6sUCloeJd8EBMtLRfOEs
	 Dbgoz1cLb+KnNfH+bYTlsmdPNRgLgQTZkiVu3Z/WEVUAWTwee3scRiY7k0AMqD0wl0
	 XgTtZlzZngpyuQAoGRRkRsh01e3cjDwIC1H3p0W/qbu3EP7oMG+g5XiqVv4pYmQ0IA
	 IpcX9loXK/b8mMWg52K4RdI9sCkxxa2L/NwRXjPkeODnytjJsRTjfBLsCiPqGtg3YN
	 +tyBB8os+3JlGR+9ghDRtTU3xFSsDF/uPewz9IjjMXBpXOYI+9dWg8hqrZk1YusLNn
	 mTQ64Rv3uCk4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] arm64: versal-net: Switch Versal NET to firmware
 clock interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Simek" <michal.simek@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <c1e9d7f1dd555ff96bfda6afa727205a8a3e53c0.1783495122.git.michal.simek@amd.com>
References: <cover.1783495122.git.michal.simek@amd.com>
 <c1e9d7f1dd555ff96bfda6afa727205a8a3e53c0.1783495122.git.michal.simek@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:42:01 +0000
Message-Id: <20260708074202.74D461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Device tree binding headers are incorrectly placed in arch/arm64=
/boot/dts/xilinx/ and duplicate existing bindings.
- [Medium] Use of #undef directives in device tree binding headers to remov=
e inherited definitions.
--

--- Patch [5]: [PATCH v4 5/5] arm64: versal-net: Switch Versal NET to firmw=
are clock interface ---
commit 768ce0b0d6c0eff83d929d6530cf30c0e1e4baaa
Author: Michal Simek <michal.simek@amd.com>

arm64: versal-net: Switch Versal NET to firmware clock interface

Switch Versal NET from using fixed clocks to the firmware-based clock
interface. Add DT macro headers for Versal NET and base Versal clocks,
power domains, and mandatory resets required by the clock dtsi.

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
> +
> +#define PMC_PLL					1

[Severity: Medium]
Should these device tree binding headers be placed in include/dt-bindings/
instead of arch/arm64/boot/dts/xilinx/?

Placing them in the architecture directory bypasses the convention of having
binding definitions act as a shared contract between the device tree and
kernel drivers. This applies to xlnx-versal-clk.h, xlnx-versal-power.h,
and others introduced here.

[ ... ]

> diff --git a/arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h b/arch/arm6=
4/boot/dts/xilinx/xlnx-versal-net-clk.h
> new file mode 100644
> index 0000000000000..4a6add03c173e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
[ ... ]
> +/* Remove Versal specific node IDs */
> +#undef APU_PLL
> +#undef RPU_PLL
> +#undef CPM_PLL

[Severity: Medium]
Will these undef directives work correctly with the device tree schema tool=
s?

Since schema validation tools typically use simple regex-based parsers rath=
er
than a full C preprocessor, they generally ignore undef statements. Could t=
his
cause the validation schemas to incorrectly accept the removed IDs?

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
> +
> +#define VERSAL_RST_PMC_POR			(0xc30c001U)

[Severity: Medium]
Does this new file unnecessarily duplicate the already existing reset IDs
binding in include/dt-bindings/reset/xlnx-versal-resets.h?

Maintaining duplicate copies of these bindings introduces a risk of the
two files drifting out of sync.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783495122.gi=
t.michal.simek@amd.com?part=3D5
