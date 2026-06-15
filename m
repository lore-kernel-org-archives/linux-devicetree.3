Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBED246782
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542887; cv=none; b=tGDg6UPitI7u3BUihKojpHnF0MRma+JZZ1culz/f5U47dV82J3T28WOGvuhc4UTo4rj14CJDdcVmd1MXb0bTXOZYkc82BwO2W7mf5tqL+H/c37Nr+Ydk9ryjMIIracvgESry3YLoKpoxrk9dZRvDh+8T/ftN4VPAuEvcNZmZXoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542887; c=relaxed/simple;
	bh=fZ2aFT5BQEOV2Ydzqq5UPQnBoLsPy2KwuyTYjCqM2rg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hpzfgNSFCo8xXLtOLWoiM/Yg8CctJPXTX2tOFT7NjRiNkbKa5edEoofYl2XbFeaiLggsiXMLL8WtBSvOIxJPIjrzMW9SJNu6aM9oevaqXalCF3nVuFgh/2TuZset2F6GzJSUsxBB6Q5H37LN2NC0JJX4qLXT2+P3E5HcpTbBz/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgVbyqHw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgVbyqHw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B5A1F000E9;
	Mon, 15 Jun 2026 17:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781542886;
	bh=ok77BuTiKlnIEeofC5NyTSOeNhZBHZqtyrTOnmM0PQA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JgVbyqHwjQUQCFdAzVFzh/H7WbHiNuy8jffHCL+Ks4+YN+TZ2cSfgxpogXsxhRMDa
	 y5H7jC0bNiehL536zAmj7RE3txIbyGDrkDLmbITFX/utfu9fnjNdE4IDy6zhBxbOvY
	 9hw6TiUY5ED957RxuzuhuWsMc2qzmAE3LMdUCiGbP8ASkW/RsO9hyqpq5s5tJdQC+y
	 yNrcSAfaRVOTSMXRc2PKwLjkhXp8X6oQ0tOl7v3WfPolAXdOU7lWOXQQQENEYMPZns
	 7Hrz1WNXov6+SRYEB6DRRAtBdcX1aRLr79fkqiI6kNWuhL5bk7QxE86JUcnsRiv3YR
	 1wAZkP+lZnUWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 03/15] net: ethernet: oa_tc6: Move oa_tc6.c
 to its own directory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260614-s2500-mac-phy-support-v5-3-89874b72f725@onsemi.com>
References: <20260614-s2500-mac-phy-support-v5-3-89874b72f725@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 17:01:25 +0000
Message-Id: <20260615170125.E6B5A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The kernel module is implicitly renamed from `oa_tc6.ko` to `oa_=
tc6_mod.ko`, breaking userspace compatibility.
- [Low] The Kconfig prompt for `OA_TC6` was made unconditionally visible, v=
iolating standard practice for library modules.
- [Low] The new file pattern in the `MAINTAINERS` file fails to cover all f=
iles in the newly created directory.
--

commit ac71755a6e3c87fc8edbf0f95cf23dd24cbc012f
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Move oa_tc6.c to its own directory
   =20
This commit moves oa_tc6.c into a dedicated directory
(drivers/net/ethernet/oa_tc6) and adds a corresponding Makefile and
Kconfig to support adding more files for the OPEN Alliance 10BASE-T1x
Serial Interface.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc1dde0c9067d..4cee98fc922cc 100644
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
Does this glob pattern leave the newly added Makefile and Kconfig orphaned?

Using drivers/net/ethernet/oa_tc6/oa_tc6* only matches files starting with
oa_tc6.

Could this be updated to use the directory-level pattern
drivers/net/ethernet/oa_tc6/ instead?

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
Was the "if COMPILE_TEST" condition intentionally dropped from this prompt?

The original entry in drivers/net/ethernet/Kconfig correctly hid this
library from users during normal configuration.

Dropping the condition makes the prompt unconditionally visible in
menuconfig, even though the library is designed to be selected by dependent
hardware drivers.

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
Will this rename the generated kernel module from oa_tc6.ko to oa_tc6_mod.k=
o?

Renaming an existing module breaks out-of-tree dependencies, modprobe
configurations, and initramfs environments that expect the old module name.

To maintain the original module name without hitting a Kbuild cyclic
dependency, could the original oa_tc6.c be renamed to something like
oa_tc6_core.c? Then the Makefile could use:

obj-$(CONFIG_OA_TC6) +=3D oa_tc6.o
oa_tc6-y :=3D oa_tc6_core.o

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614-s2500-mac-=
phy-support-v5-0-89874b72f725@onsemi.com?part=3D3
