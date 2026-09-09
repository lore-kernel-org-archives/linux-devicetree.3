Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8193DC4CC
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 07:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938103; cv=none; b=psepxM4XLtQRP+1MR+s6bHYhzJlqJPeoh2lBII0VDaF3qRDkczhP/9yJ4gCmEJMhBpJ/YfyQjAZ2ewnHe0oEyP6puRJk2LJG/QA3P6MjAQpRtd08T7BQkJmL0GjfSNE1qEyom9RSoGvxT6ieCGTWoQurkH4Kp9O5C8ZIvxI56+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938103; c=relaxed/simple;
	bh=+xZTaW+vK513KJjl0e2Lq9/GuXeg2rZbRJFoVXmk3rU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MjqX6F35fLVo+9LUU2zYQjKYHZYw0MkwaP0iziHBQunG5rvlAbtW2e1+8z6JrpJW+gn7IN5YwDmrVbSprc0jIqump3mnTWRxo9U/dGJpNsKnr+4NLY104OBM8ONH32pjgC2jeRyALhCPqh5ix4aCftg/CgOwFBb+eLbxqOxA/3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqkEzLHk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqkEzLHk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CAD1F00A3D;
	Wed,  9 Sep 2026 07:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788938101;
	bh=rP9NyoXu+/tRx6wTXAZxYzH9zjHiaYEoqNEM5/6sZIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oqkEzLHkX0dfr7n6hsrazrNaUkFLpD1WLFwXwbs+ZpwNhjTZoT5n+6C+shjsujtOR
	 N0qi7gB2Ns0Bh0IvKNqYJJg9V8736INjkVIbpuAJpdOq1zsQVA29IqJYEz+to8dffo
	 6rTmJjrmfWs+J3FptOGx6puAcyre0vOjBN6BNcV4bILkXFDxj6UKR+tRatnG2Q3mxg
	 QGl/OdULYOdBwWnIhtgego0+LGIH1ac98BeFocoArwFazqDcWWwUHU07Td7u/wOyBH
	 C+dnlF2yCgCxj/Gq7eg/mbd+0XCoUrkskHgXucR5roEBEIP958LK6zZZaSYtZZslxQ
	 lujCg9Lut9aXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: altera: Move all SoCFPGA files to
 dts/altera
Reply-To: sashiko-reviews@lists.linux.dev
To: evon.chiam@altera.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <4b78273b85041f74b12245d0bf222f018afd2bd6.1788933630.git.evon.chiam@altera.com>
References: <4b78273b85041f74b12245d0bf222f018afd2bd6.1788933630.git.evon.chiam@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 07:15:00 +0000
Message-Id: <20260909071500.B8CAD1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Moving the device tree files from 'intel/' to 'altera/' changes th=
e installation path for compiled DTBs, breaking downstream boot flows.
- [Medium] The 'ARM/SOCFPGA ARCHITECTURE' block in MAINTAINERS incorrectly =
retains the 'intel/' directory wildcard, meaning the SOCFPGA maintainer wil=
l erroneously receive patches for Intel Keembay.
--

commit 40a6a579bbb5d58ecf53040c72ad3c2df070f500
Author: Chiam, Evon <evon.chiam@altera.com>

arm64: dts: altera: Move all SoCFPGA files to dts/altera

The dts/intel/ directory contains two distinct families: Altera SoCFPGA
platforms and Intel Keembay. This patch moves the remaining SoCFPGA
DTS/DTSI files from dts/intel/ to dts/altera/ to consolidate them.

Link: https://lore.kernel.org/all/cd16fb78-551e-4630-83d6-a44a68e2e411@kern=
el.org/

> diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/al=
tera/Makefile
> index 540bb5ae746b3..8f41349103b80 100644
> --- a/arch/arm64/boot/dts/altera/Makefile
> +++ b/arch/arm64/boot/dts/altera/Makefile
> @@ -1,5 +1,17 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) +=3D socfpga_stratix10_socdk.dtb \
> +dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) +=3D socfpga_agilex_n6000.dtb \

[Severity: High]
Does moving the device tree files from intel/ to altera/ change the
installation path for compiled DTBs, which could break downstream boot flow=
s?

For arm64, make dtbs_install preserves the vendor subdirectory structure.
By moving the DTS source files from arch/arm64/boot/dts/intel/ to
arch/arm64/boot/dts/altera/, the installed DTBs will move from
<INSTALL_PATH>/intel/ to <INSTALL_PATH>/altera/.

Will any automated deployment relying on standard kernel install scripts and
static bootloader configurations (such as U-Boot or GRUB) be broken?

While the commit message notes that the set of produced DTBs is unchanged,
the path change effectively modifies the deployment ABI.

[ ... ]

> diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/int=
el/Makefile
> index 270c70fdf084b..5b030fb8d165e 100644
> --- a/arch/arm64/boot/dts/intel/Makefile
> +++ b/arch/arm64/boot/dts/intel/Makefile
> @@ -1,14 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) +=3D socfpga_agilex_n6000.dtb \
> -				socfpga_agilex_socdk.dtb \
[ ... ]
> -				socfpga_agilex7m_socdk.dtb \
> -				socfpga_n5x_socdk.dtb
>  dtb-$(CONFIG_ARCH_KEEMBAY) +=3D keembay-evm.dtb

[Severity: Medium]
Will this change cause erroneous patch routing for Intel Keembay changes?

By moving all Altera SoCFPGA device trees out of arch/arm64/boot/dts/intel/
and leaving only the Keembay files, the ARM/SOCFPGA ARCHITECTURE section in
the MAINTAINERS file will still claim the F: arch/arm64/boot/dts/intel/
wildcard.

Because of this, will developers running get_maintainer.pl on Keembay patch=
es
erroneously send them to the SoCFPGA maintainer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/4b78273b85041f74b12=
245d0bf222f018afd2bd6.1788933630.git.evon.chiam@altera.com?part=3D1
