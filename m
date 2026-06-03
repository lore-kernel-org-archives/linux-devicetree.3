Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF203DBD5B
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501628; cv=none; b=AerhzmjToJu1UHhcu1GYqac1Jd/bQrjEWKvCdMftv1qKpZ0H/LCjxW/Ph30OEYMu5A7XBsch8Gpe4IhWVX3sLNc77Rdlsd1fwsBbjsySpSANVFEk00sn69lzTiPoYiEEyv6ihM0qlcVxMl0nAjMaQc5dtVeDcyX1r5c1WwC0B9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501628; c=relaxed/simple;
	bh=HtClRsECTbq8dgRJq0ELTYeO3/CZ93I80LUFmEt/D6A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L1EX//7yMT/MtdubEZZ3vF4ER71cmag2PHI4t4KXS5smr+SRwRP6mucr+iXeTcDFXJr0WetLeqX7De5jsZ5ILXmJjojt5a62VNzfEoyl0dvUjaGGNkNM/h2fB+UCn94uU3wlnXMjIDfO9QcHfg7OIU0Q19nkCg8ZvcotXoaYzpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NALiOL6Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NALiOL6Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D741F00893;
	Wed,  3 Jun 2026 15:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780501624;
	bh=HtClRsECTbq8dgRJq0ELTYeO3/CZ93I80LUFmEt/D6A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NALiOL6QEt37+uk2VdxjNuSFjYGXhjBwqQaj2RingcF8SXyJmlr65Lt43f9AzMXmU
	 zCVG7SMovHkkD42QiO1SLjYEwPe/5N6yOZjjIuW/0b+4uQJxvIWt89bc/93KOYjFjf
	 YbQaUZ1c5vk4DDMRefwmv2ZX67ySveQdaIPcEafvYXonYMMWFemZJcvVSs5hEgW7rQ
	 MwPF5Wpw2k1ldfFUEKrawzrPHQplUnS6YsVFauXFzzAofRLklI0v6r4vr5KTXy8BDa
	 ps9LpdEVKPQ8FHklyOdh4AjbSnJ5SO2LRYaO1kSHOcfFqf1PGHDuLRZHUsEAcyF3Gi
	 OwXFf8KOhzdcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] arm64: versal-net: Switch Versal NET to firmware
 clock interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Simek" <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <c7007b07b00ff00affda9fa67a40667284acb330.1780499520.git.michal.simek@amd.com>
References: <c7007b07b00ff00affda9fa67a40667284acb330.1780499520.git.michal.simek@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 15:47:04 +0000
Message-Id: <20260603154704.87D741F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Duplication and misplacement of DT bindings ABI headers
--

commit bab3d39d7000abda6ce0255f27da2b7b9fbc10cd
Author: Michal Simek <michal.simek@amd.com>

arm64: versal-net: Switch Versal NET to firmware clock interface

Switch Versal NET from using fixed clocks to the firmware-based clock
interface (versal-net-clk.dtsi). Add DT macro headers for Versal NET
and base Versal clocks, power domains and mandatory resets.

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
Is it intentional to place these DT bindings ABI headers under
arch/arm64/boot/dts/xilinx/ instead of the standard include/dt-bindings/
directory?

Clock, reset, and power domain index definitions are generally considered
ABI and keeping them in include/dt-bindings/ avoids ecosystem fragmentation
and enables easier sharing with bootloaders.

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
Does this file duplicate the existing
include/dt-bindings/reset/xlnx-versal-resets.h?

It appears to be an exact duplicate, but uses a different include guard.
Using the duplicated header here might cause macro redefinition warnings
if both happen to be included.

Could this rely on the existing dt-bindings header instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780499520.gi=
t.michal.simek@amd.com?part=3D5
