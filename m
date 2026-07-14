Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3B136AB5A
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 10:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784026648; cv=none; b=r6rc3ce20hELwFrilsBYDMI/JZlQsYX8AE1QFfR28lblNBI2basAnB8ESvDOu1LB2SQg7bmQpfum3G0sgwmo2gMcnOb8llsbTPr2X0BsNSDF/Eg6N+3LNYEknparFrUqOta33EOjtA4qf+yObEGtAOF/TWH413EagJJ7dmhyjXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784026648; c=relaxed/simple;
	bh=PUrAMNKKtIh+m8LSI4KcnQSGUil2dDHFvif7uSclZ1w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RQPcKNWrMUplz/KnGOFR3Ky+KdNa20XZh/Hhq2u4aNw9QN+/8feqi3LNaQMIDtEuNbh9m0l3hAiD6cMWVwqnhYl7l+kkmvxSNzRASrKo03FAaSiaBST7sBC3HLl7iH6aQyZjxIHT3RFFeE/nOyLsefH+yFqD3TrQRoFRs6kBNbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRgpfG3G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRgpfG3G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0739E1F00A3A;
	Tue, 14 Jul 2026 10:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784026647;
	bh=q1AaoEK4bYh3i5GDpj3wQ4+SNcuPkGLyWx5d/VFYvNQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kRgpfG3GMiTxfLqKuf364W6vGSQ/enTgRVRJ7RH4sImvAMCriz9AyAicpPaEfAXZB
	 puxaQUSaPwP2KiUxG1TwSRWdDtXrCHeNfb1uVzzNscTI+4jgfyFCNIXxt3zO1qlmM/
	 o2rRXdB1fm1quCXG7Zr2eTrGbXEedGzVoTHD/fNlhycFLcNuggMKn+D0UPte8Vn+pB
	 pnIHf+icxh5v8iWEkkfXTVIV+ivlRkGtwKZYz2iHZqCO043LqOMhOUqZWSb+hcfylW
	 a7qeO7csP/9AM4P7OoV8G79tdhRxahE7KJijFK7w5xL7rkyyXPIIQKpBCug+292aBk
	 VHktnCSzuxEBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 5/8] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714092053.2461482-6-lakshay.piplani@nxp.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
 <20260714092053.2461482-6-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 10:57:26 +0000
Message-Id: <20260714105727.0739E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The driver-specific header `p3h2840.h` is improperly placed in the =
global `include/linux/mfd/` directory in violation of MFD subsystem guideli=
nes.
--

--- Patch [5]: [PATCH v14 5/8] regulator: p3h2x4x: Add driver for on-die re=
gulators in NXP P3H2x4x i3c hub ---
commit dee1faf4c21dfa7f5c815bfdc8376ffa3158fbfe
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x i3c hub
   =20
The NXP P3H2x4x family integrates on-die regulators alongside I3C hub
functionality. This driver registers the regulators using the MFD
framework and exposes them via the regulator subsystem.

> diff --git a/drivers/regulator/p3h2840_i3c_hub_regulator.c b/drivers/regu=
lator/p3h2840_i3c_hub_regulator.c
> new file mode 100644
> index 0000000000000..645d46ad7c2f2
> --- /dev/null
> +++ b/drivers/regulator/p3h2840_i3c_hub_regulator.c
> @@ -0,0 +1,284 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025-2026 NXP
> + * NXP P3H2X4X regulator driver file contain functions for enable/disabl=
e regulator
> + * and voltage set/get.
> + */
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/mfd/p3h2840.h>

[Severity: Low]
According to the MFD subsystem guidelines, driver-specific header files that
are only used by the parent and its immediate children should not be placed
in the global include/linux/mfd/ directory.

Could p3h2840.h be kept local to drivers/mfd/ instead of being exposed in t=
he
global include path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714092053.2461=
482-1-lakshay.piplani@nxp.com?part=3D5
