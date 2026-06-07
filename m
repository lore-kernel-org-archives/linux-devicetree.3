Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADEC27FD75
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 05:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780810982; cv=none; b=CsfmGySPsdA/oU+elMqGBC5lZxob9ZG8LywTVtl8tj/dMz6P55TY3Z3LIF43ZEWiG7LAwOu5b/QQdbd0Zr24L6tswvl1c48sLWudKFxZ6YCajiM+X2mYakWMwVASy4M3rIwAtMnWK3oV4BZl9Ui+OWok52TARRTcgulPG0XA83s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780810982; c=relaxed/simple;
	bh=DaLieuBsJSh2Cyy/MNkYGjZxNLqpVNFvxpqUhX1jRiY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NijZm7SwLDSqJAhULarxlvzDuFCbWBVshcsQQbDEITpqyjACrPnQpWokv4FQQ1sXK5I0o5ge/S58Pj00RyqSTQXNg10JW1mV+Ip8FpFEmfYgVd1dLyl0aaomQesSgZ70ctGCAPq6Q6mTqzqvkDCLbUXS9CenTzT9qqBxPLmsiC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0v7nHqG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0v7nHqG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308031F00898;
	Sun,  7 Jun 2026 05:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780810980;
	bh=3QnP4GMEaap+6PGXlClzjROLR987LptGFmEKm18rEsE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b0v7nHqG1fNtRiULEh3u0XbrbqNnCzl9AiyhcqZqD76mXA6+8lPqWtlSj3SoQ1Sif
	 pkI+wnD/jO9LQDKfVjYGHr+LjS5tMNepHyiVZ1N+vF7oV15jFWpUQU4gYyXZVcITI/
	 X3fK+dKKNYtRyK5179RD5jEDEeEDyiLRXYeGDRKO6VbrBkGB95JBHVqh0psg/X4Cc2
	 P0KXA7bxdqn3KhpIGIToaC7a6unoQcc8DYOgmJUQkKeH3zZS6seqqAoISjYQwhL22B
	 D4xlK0g7zfnGoJ4e3E8JgJrk23Qo+BE/XDkikpKs+QXy7w/Vv7MfUPoqmMhxJtz2ad
	 +941bk4i/v0jA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 03/16] net: ethernet: oa_tc6: Move oa_tc6.c
 to its own directory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260605-s2500-mac-phy-support-v4-3-de0fbc13c6d8@onsemi.com>
References: <20260605-s2500-mac-phy-support-v4-3-de0fbc13c6d8@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 05:42:59 +0000
Message-Id: <20260607054300.308031F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Module renamed from `oa_tc6` to `oa_tc6_mod` and improper use of=
 `:=3D` assignment in Makefile.
- [Low] The `F:` pattern in MAINTAINERS does not cover all files in the new=
 directory.
- [Low] The `OA_TC6` Kconfig prompt is now unconditionally visible to all u=
sers.
--

commit 5213f15d674af18a29bb38e48f42c89b428013c8
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Move oa_tc6.c to its own directory

Moving oa_tc6.c to its own directory to facilitate adding more files
to support other features defined by OPEN Alliance 10BASE-T1x Serial
Interface specification.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index eb8cdcc76324f..7e6b28202e88e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20001,7 +20001,7 @@ M:	Parthiban Veerasooran <parthiban.veerasooran@m=
icrochip.com>
>  L:	netdev@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/networking/oa-tc6-framework.rst
> -F:	drivers/net/ethernet/oa_tc6.c
> +F:	drivers/net/ethernet/oa_tc6/oa_tc6*

[Severity: Low]
Does this pattern leave the new Kconfig and Makefile in this directory
unmaintained?=20

Using the directory pattern `drivers/net/ethernet/oa_tc6/` would ensure all
files in the new directory are routed to the OPEN ALLIANCE TC6 FRAMEWORK
maintainers instead of falling back to generic netdev maintainers.

[ ... ]

> diff --git a/drivers/net/ethernet/oa_tc6/Kconfig b/drivers/net/ethernet/o=
a_tc6/Kconfig
> new file mode 100644
> index 0000000000000..97345f345fb9f
> --- /dev/null
> +++ b/drivers/net/ethernet/oa_tc6/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# OA TC6 10BASE-T1x MAC-PHY configuration
> +#
> +
> +config OA_TC6
> +	tristate "OPEN Alliance TC6 10BASE-T1x MAC-PHY support"

[Severity: Low]
Is the removal of the `if COMPILE_TEST` condition intentional here?

In the original drivers/net/ethernet/Kconfig, this was conditionally
displayed. Because OA_TC6 is a framework library automatically selected by
dependent hardware drivers, making the prompt unconditionally visible during
kernel configuration might unnecessarily clutter the interface for users.

> +	depends on SPI
> +	select PHYLIB

[ ... ]

> diff --git a/drivers/net/ethernet/oa_tc6/Makefile b/drivers/net/ethernet/=
oa_tc6/Makefile
> new file mode 100644
> index 0000000000000..f24aae852ef27
> --- /dev/null
> +++ b/drivers/net/ethernet/oa_tc6/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Makefile for OA TC6 10BASE-T1x MAC-PHY
> +#
> +
> +obj-$(CONFIG_OA_TC6) :=3D oa_tc6_mod.o
> +oa_tc6_mod-objs :=3D oa_tc6.o

[Severity: Medium]
Does this change the resulting kernel module name from oa_tc6.ko to
oa_tc6_mod.ko?

Renaming a kernel module breaks ABI and userspace tools that expect the old
module name. A standard Kbuild practice when converting a single-file module
to a multi-file module is to rename the original C file (e.g., to
oa_tc6_main.c) and use `obj-$(CONFIG_OA_TC6) +=3D oa_tc6.o` with
`oa_tc6-y :=3D oa_tc6_main.o`.

Also, does using `:=3D` instead of `+=3D` here overwrite the `obj-` variable
instead of correctly appending to it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-s2500-mac-=
phy-support-v4-0-de0fbc13c6d8@onsemi.com?part=3D3
