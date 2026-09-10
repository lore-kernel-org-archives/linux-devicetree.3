Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2C94A014B
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050585; cv=none; b=iUPtNx4WMB3jfyQ1Yk/Ll8/pOWaZImOA9NyEKmfT87ocEN+TcwHEV4KSdsY9xohu3DSVfdEcBKdUN+JbsyK9aDpnAJ8PkrbB94ZuJOKGWPuQvMxOUwP9GONK/YIoEGXZjCbpW/48vCtXLRzNgqGkIFbi3NO+OsR7boDmAQf8xU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050585; c=relaxed/simple;
	bh=wvwzk4Im4C7lJLRgwU/z4M7rypMkS+Vhn2fYwXG16G8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q4yqiijsdr7gQyAWHVohoCS4bERI3PRUuS/J5oBR1WV7PobLmkTYLkm0+8KTQjgIbOtrEMeLU0sa2pW3JYe2rJ4uUBSUdBNHActYKQsGF2x4d69ydaWglwVHijDRs6A1pGVtBcGK+H+TuDP6DuwECj9OhqTU0/ZeOfmWVmc/s/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5CXExVk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5CXExVk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D8E1F000FF;
	Thu, 10 Sep 2026 14:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789050583;
	bh=gCi6QAH90CunYMfewIafolM41NOAmX5GTCkAUdO+6b0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G5CXExVkZCSKPAPE8zHGkZk7uFQg8yLyVc+YnphUxNxwHSrl1cmmmbxXKE+tlum2e
	 gCB7UDAQkgaDBXFBJcMPvUJgITLChpv+RMUzx51SU4Fhi3DMHxBAGcRLW4U72qdT2Y
	 K6b/3GoRLqM1aMAti8CPhsI/NcjpYOvUIY4ioUQAK6TPkpNEDOllbHiS3PYVCC26h+
	 Nu/6qiURcMYeK2l5Hhznavi+9KkhCSJ67cFk9DTM5p7LffftFAFmSDAgRACcfJqmoD
	 KAyZXOUnUYJeoKM9Cn3U8Idwq6ww6UTaCRWY2BjVeE/MHGvAaE0yVUjXldLle7jWVw
	 xahY67+H7DqAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: altera: Move all SoCFPGA files to
 dts/altera
Reply-To: sashiko-reviews@lists.linux.dev
To: evon.chiam@altera.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <47719884b157863b2253b415daa447b417cd3419.1789048358.git.evon.chiam@altera.com>
References: <47719884b157863b2253b415daa447b417cd3419.1789048358.git.evon.chiam@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 14:29:42 +0000
Message-Id: <20260910142943.33D8E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The move changes the installation directory of Altera SoCFPGA DT=
Bs from `intel/` to `altera/`, breaking bootloader configurations.
- [Low] Removing the `intel/` directory from the ARM/ALTERA SOCFPGA ARCHITE=
CTURE maintainer entry leaves `arch/arm64/boot/dts/intel/Makefile` orphaned.
--

commit 323947fd2b3947f88fe8d0768788642ef6666cca
Author: Chiam, Evon <evon.chiam@altera.com>

arm64: dts: altera: Move all SoCFPGA files to dts/altera

This patch moves Altera SoCFPGA device tree files from arch/arm64/boot/dts/=
intel/
to arch/arm64/boot/dts/altera/ to consolidate them under a single directory=
. It
also updates the corresponding Makefiles and drops the intel/ path from the
SoCFPGA MAINTAINERS entry.

Link: https://lore.kernel.org/all/cd16fb78-551e-4630-83d6-a44a68e2e411@kern=
el.org/

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d00c9..c1e1e3fb225fa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3626,7 +3626,6 @@ F:	arch/arm/boot/dts/intel/socfpga/
>  F:	arch/arm/configs/socfpga_defconfig
>  F:	arch/arm/mach-socfpga/
>  F:	arch/arm64/boot/dts/altera/
> -F:	arch/arm64/boot/dts/intel/

[Severity: Low]
Does dropping this directory-level match leave
arch/arm64/boot/dts/intel/Makefile orphaned?

The ARM/INTEL KEEMBAY ARCHITECTURE entry explicitly matches the Keembay dts
and dtsi files, but it doesn't seem to include the directory or the Makefile
itself.

Will get_maintainer.pl still be able to identify maintainers for changes to
this Makefile?

> diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/al=
tera/Makefile
> index 540bb5ae746b3..8f41349103b80 100644
> --- a/arch/arm64/boot/dts/altera/Makefile
> +++ b/arch/arm64/boot/dts/altera/Makefile
> @@ -1,5 +1,17 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) +=3D socfpga_stratix10_socdk.dtb \
> +dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) +=3D socfpga_agilex_n6000.dtb \

[Severity: Medium]
Will this move break bootloader configurations and deployment scripts?

Running make dtbs_install on arm64 preserves vendor directories since
CONFIG_ARCH_WANT_FLAT_DTB_INSTALL is not set.

Because the files are moved from dts/intel/ to dts/altera/ without backward
compatibility symlinks, the installed path changes (e.g., from
/boot/dtbs/x.y.z/intel/socfpga_agilex_socdk.dtb to
altera/socfpga_agilex_socdk.dtb).

Can this prevent boards from booting after a kernel upgrade if the bootload=
er
expects the old path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/47719884b157863b225=
3b415daa447b417cd3419.1789048358.git.evon.chiam@altera.com?part=3D1
