Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6D236212F
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417114; cv=none; b=HCl3rZTKvKor0S9/kbQk5AmHA0/fa4Gy6xbN38AK8AgO/ITLHULiMLdpqPUUbYj5bNiZRdFthjkKrrYgJaqICRTT5Y4wO6ly8n6fl6EEax1XjF+xZpAilnpUqYTrm9V4OHAyv7eTehItspFo4VwdRFtlXUTYYVxQrDys6r6pN7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417114; c=relaxed/simple;
	bh=6RmdioRbhdI2+CAQvwmTI3GTZ4X11E1ZAqyhyLmEoaY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iNJpnIAssYftO0BHqxQfYqO2buC1KWptqdv+2wQYQLuAFPwxHJQ8itTiggxBUwzyDhclKC0aAwnY52KplVtXeY1tOHS6Wt9fjQnrbRY5QMS7n45gQCDqcLFu6uhhXgMnaX3TROASxlAbNDdVOH/kHZydjXfMJYF7G1N4Z1KXb+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0Slg1B8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0Slg1B8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861631F000E9;
	Thu,  3 Sep 2026 06:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417113;
	bh=eXRYvuoWhjpAFAs56As7/B0zK4Nhewhv/Z99ghulzgA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O0Slg1B8lcydoOczFHYJF6kEDE0yyhOpXQXwNLxRARhN8o0RguXLYJVFKAgQ/F4mh
	 ZZjyczu/iFG0gY4HVilD6He62Tuof/X8xZqhVgHWA01F5KsMir3BrnIBvYIm3119Wm
	 CnRfJQebNSPrbekWx8etV1+FkpdQNmmidthRsXbeVGI5ASc0Sb7YVoqsDGqXSjnL5D
	 kId7a7kQ1jetiEHu+rlIj+VPdnDMHBOf4vb+qcdcpqv+wiCDtUkaCJnKg8HGuJCzCV
	 mscU7AWGYomr+T1s08tbUHOu/t6lP8ZTz9DH87AT2NME/ptjmafsHM4JhDLzvqUsNt
	 k/MiFxqURZm7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 5/8] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260903062108.2712296-6-lakshay.piplani@nxp.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-6-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 06:31:52 +0000
Message-Id: <20260903063152.861631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Driver-specific header placed in the global include/linux/mfd/ dire=
ctory.
--

commit cbaa07506e1e33ad932d2b0d2d38edfb4437adc1
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x i3c hub

This commit adds a regulator driver for the on-die regulators in the NXP=20
P3H2x4x i3c hub. The driver registers the regulators using the MFD framewor=
k=20
and exposes them via the regulator subsystem.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index d482a23c0bf78..bdf54313bc5f6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19772,6 +19772,7 @@ L:	linux-i3c@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
>  F:	drivers/mfd/p3h2840.c
> +F:	drivers/regulator/p3h2840_i3c_hub_regulator.c
>  F:	include/linux/mfd/p3h2840.h

[ ... ]

> diff --git a/drivers/regulator/p3h2840_i3c_hub_regulator.c b/drivers/regu=
lator/p3h2840_i3c_hub_regulator.c
> new file mode 100644
> index 0000000000000..244f2a4f70f38
> --- /dev/null
> +++ b/drivers/regulator/p3h2840_i3c_hub_regulator.c
> @@ -0,0 +1,289 @@
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
Does this driver include a shared header from the globally exported include
path rather than keeping it local?

The MFD subsystem guidelines state that driver-specific header files should
be kept local to drivers/mfd/ if they are only used by the parent and its
immediate children. Should p3h2840.h be moved out of the global namespace
if it is only used by this device family?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903062108.2712=
296-1-lakshay.piplani@nxp.com?part=3D5
