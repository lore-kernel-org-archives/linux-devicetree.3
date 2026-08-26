Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE503E557B
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787741336; cv=none; b=te5f4kEhyoxALyMCtFL9oWSZNDfsnL8WFxRMw4bxAu8qoigqKujMqLc0147JYDQNRMivKJ5hCY0SBvLiT1kHJAGsqSa5WSkvPHbG35WBeXbgVsuh/e+tTq00EMo3wwO5r2UsmDa5UJ0I/K51tt4xfD3foI7Bi0gxrpeYvEHT600=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787741336; c=relaxed/simple;
	bh=7+Nit2vONnXM3RV+nM1TrimxvDI5VQnjHLPfDm5U6Lg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sSM36t/ucCKFpAFcCO3peRY9iYOH7MLTDkPR/WxwmjlM6CUrykM13weqCT4S6m2TMiv5a7hBj5J8YkO86FKTE0/E/04NVYxPs7hbxC+OTZiCnytOlxgPiyggKdvZ9Ng1qV0iRnIuTFPnQzzyQsX/kAIwzprVPgnAyCciTootmhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBQEpieo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBQEpieo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E8A1F00A3A;
	Wed, 26 Aug 2026 10:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787741322;
	bh=7+Nit2vONnXM3RV+nM1TrimxvDI5VQnjHLPfDm5U6Lg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QBQEpieo+jG9Cm21vjjK0+RigO8esQlwhCmDkuuFLpg3dgESeEKgYp50gcIgzo9xF
	 S3vwss8z5Z3yGz7ZiGjvFvxkwrpEGMmJSHXDBfo98Di0BykyY27+mEwwrZYhw3Du/E
	 P7vxZhc4aleL9NY3XcIxbXtkCZ3S6xN9lSlp/ub/tnoIa1y6cxJss0p0VjeUo5hBKL
	 FV0J2J/GX+AxRf0U3kuXYigE//UCmTKO/70oX4MFEEpNG1GgNOn5D1tC1bsJqBP4XJ
	 0OXp0eqKmXDBCdrhBAuW8V/71GTkQ4+O3p7+rTdVuD2RcsY5BMtRNuLTWqWndJiLAO
	 OPVIyvaiEVk9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 5/8] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260826103819.1614843-6-lakshay.piplani@nxp.com>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-6-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 10:48:41 +0000
Message-Id: <20260826104842.36E8A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Driver-specific header file is incorrectly placed in the global inc=
lude/linux/mfd/ directory.
--

commit f0356d778985b362783f95ecd394c166098e5c31
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x i3c hub

This commit introduces a driver for the on-die regulators of the NXP P3H2x4x
i3c hub family. It registers the regulators via the MFD framework and expos=
es
them to the regulator subsystem.

> diff --git a/drivers/regulator/p3h2840_i3c_hub_regulator.c b/drivers/regu=
lator/p3h2840_i3c_hub_regulator.c
> new file mode 100644
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
Does this driver-specific header need to be placed in the global
include/linux/mfd/ directory?=20

According to MFD subsystem guidelines, driver-specific header files that are
only used by the parent and its immediate children should be kept local to
drivers/mfd/ rather than cluttering the global include space. The commit
message explicitly notes that this header is "used only by the parent and
its children".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826103819.1614=
843-1-lakshay.piplani@nxp.com?part=3D5
