Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9678747042D
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 22:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790720738; cv=none; b=GHXNYMKhWoS/LfEQnVTCPYshv9/osuUwLprqkDtqzO3Ik71F/+sKENFq/OBlP8CX8ypsxSBEQ56+IJS/Wx3GMVGsSSiPrYvbEXdTJ+uDbctYdpE1d0ptU6kpi/AY1z7MIwEzSha71j+9PuRQdvqSe80QF995U1KbJZpsqTMv1V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790720738; c=relaxed/simple;
	bh=usf/nGZo7Kr+Gbq68CPjjquBIi0svBfAyUtzXrViC8U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GpUQCmIQoK8IJNZ8Tpkk24Pyu2A8vKGNZ5aBMUAAlNJQiX73GPtB0D0yzAvv8ZO3ir43ifPnxY2gPOIFz22U0f7fBI2q0QYNR9+IaCK/uY03p4LkKqmVqYrSHtbRAJbRl8MAMVe3bEnIBXzydvSdE2tjEr1vrrIQIk2x9T0I/7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZAA9zVh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZAA9zVh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69AB1F000FF;
	Tue, 29 Sep 2026 22:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790720737;
	bh=ljD/IgBIheI6+u/Q12kE6j2Mobrxs0V3l1xWQpPl+LI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OZAA9zVhr4qESYSqBBuorYKHCT7EEaKoEGG1EnJlOiUoWzNm5nFl5XHTyWCnSgWdb
	 DZNqo6nFu2paP2K2ul10WEeL3F0R4/4MG2zO3m4sOtUWQo++lg9cja4NEO/Rgaygzo
	 Dc0dCEVqj4F411+DmYUx8LeBpOWmLjB4zNxsLz1SW7tVxaoO/URyzUW+L85ItvPeta
	 MWWjs5efykMvA7zoeafvk13AQ7mAqch6bbbhSDnuxrm+NWdG0XDg8s3/80hIAmmmpc
	 gUbQmGa+nP8ZLSiMOd/TPt6WrrYegiqdC9b+AzkRZQ9LGxUUkRa9d6XAFLqpAy/15S
	 ArH9/HrbjElXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 03/11] net: ethernet: oa_tc6: Move oa_tc6.c
 to its own directory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928-s2500-mac-phy-support-v8-3-7e011aacc309@onsemi.com>
References: <20260928-s2500-mac-phy-support-v8-0-7e011aacc309@onsemi.com>
 <20260928-s2500-mac-phy-support-v8-3-7e011aacc309@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 22:25:36 +0000
Message-Id: <20260929222536.E69AB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] module: silent renaming breaks user-space ABI expectations
- [Low] kconfig: dropped 'if COMPILE_TEST' exposes internal library in menu
- [Low] maintainers: incomplete coverage for new oa_tc6 directory
- [Low] kbuild: incorrect use of assignment operator :=3D for obj-* variabl=
es
--

commit 2a2bc9b290cac06ae77b59d4713ff2993761f061
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Move oa_tc6.c to its own directory

This commit moves the oa_tc6.c driver into a newly created
drivers/net/ethernet/oa_tc6 directory. This restructuring prepares the
subsystem for additional files that will support hardware timestamps and
PTP APIs for the OPEN Alliance 10BASE-T1x Serial Interface.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 64da809e46021..541ed016144d8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20457,7 +20457,7 @@ M:	Parthiban Veerasooran <parthiban.veerasooran@m=
icrochip.com>
>  L:	netdev@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/networking/oa-tc6-framework.rst
> -F:	drivers/net/ethernet/oa_tc6.c
> +F:	drivers/net/ethernet/oa_tc6/oa_tc6*

[Severity: Low]
Does this wildcard pattern inadvertently exclude the new Kconfig and
Makefile added to this directory? Since they do not start with oa_tc6,
maintainer tooling might fail to automatically copy the maintainer on
patches touching these build files.

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
Is the removal of the if COMPILE_TEST condition intentional? By dropping
this condition on the prompt without removing the prompt entirely, the
internal framework library becomes unconditionally visible, which might
needlessly pollute the networking drivers menu for users configuring the
kernel.

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

[Severity: Low]
Does the use of the assignment operator :=3D instead of the standard +=3D
cause issues with Kbuild? While it compiles because it is currently the
only entry in this specific Makefile, it overwrites the Kbuild accumulator
variable and could silently drop any previously defined targets if the file
is expanded in the future.

[Severity: Medium]
Could renaming the final module object to oa_tc6_mod break user-space ABI
expectations? The kernel module changes name from oa_tc6.ko to oa_tc6_mod.k=
o,
which might break modprobe configuration, modules.dep, blacklisting rules,
and sysfs paths under /sys/module/ that rely on the old name.=20

To avoid the Kbuild target conflict between the module and the C source
file, would it be better to rename the C source file (e.g., to oa_tc6_main.=
c)
instead of renaming the resulting module?

> +oa_tc6_mod-objs :=3D oa_tc6.o

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-s2500-mac-=
phy-support-v8-0-7e011aacc309@onsemi.com?part=3D3
