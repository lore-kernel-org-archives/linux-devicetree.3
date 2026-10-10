Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410D935C691
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 17:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652352; cv=none; b=Wg5mzd0QEo3bfa/nQHLgglfk4w7u+D3FKoCsmiVq0qzyq4XegNogwCO+5KLh5068zvX9HsQFWXEgDogOIEHqU/DVP44M9eb/RPD9pyy4mNrMV+0HeoFj5Ago189+uc+XXWs0EzeBlSPkryTCdg82y7qtwK5nRU9N+VB+EiCPSzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652352; c=relaxed/simple;
	bh=JkWiZeGxlP1NnY0L2xPVcGQFKVO0AzpUV/0zJcpPTzE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tOeDYmzF6x28n2Y/3KzPT6YHedtBVeyHEhj0i1GkMs0T6BVQTG2KwgcTDmSvvtyJY39Q4kTxW27KAQZaRbTlBj7Fvic+Ru6nIrDywg3vAnFps/z5l7xu3pjqrUxNo0rFz4vXOBvgBS5bTbkUQWWKktLWjYLj+3rAs7lJlf4IDZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIRLfdWM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIRLfdWM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89ADF1F00893;
	Sat, 10 Oct 2026 17:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791652350;
	bh=JkWiZeGxlP1NnY0L2xPVcGQFKVO0AzpUV/0zJcpPTzE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XIRLfdWMG8cSZpOvLJmxcg1fYuYRbf29HfQEIkT03ESGFNdhbV9wKFubE8U4DPggp
	 a2Dl8gFfp9t90y4vSgFD2CAKzZ5KXt+mBc+VjwDqJyPPPg3C1bq/F7I8lsrgA/s+Ar
	 m3Asp4F/Oyhe1ojkVE38jktb9vUxbc3njoAyZvI+AtTNr9Bfzk0R0iH0exaWqgvXtf
	 MdiOK4KVZ5ezSsf+6Kv/LUm09lksZrv4ojVH2j2xIioU4fcT0YflREf9p6UULhqYyq
	 GSDpD3vgBfPDuTzfNLE0YN45xepVI82OyzHpDyPK+nI2ZKLfyTZUb+QKp6BW6CgsD7
	 C3PZSkgYTxJkQ==
Message-ID: <sashiko-outbox-166765@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 03/11] net: ethernet: oa_tc6: Move oa_tc6.c
 to its own directory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009-s2500-mac-phy-support-v9-3-dcefe1d0bf0d@onsemi.com>
References: <20261009-s2500-mac-phy-support-v9-0-dcefe1d0bf0d@onsemi.com>
 <20261009-s2500-mac-phy-support-v9-3-dcefe1d0bf0d@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 17:12:30 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] build: module rename from oa_tc6.ko to oa_tc6_mod.ko breaks user=
space ABI
- [Low] build: incorrect use of immediate assignment :=3D for obj- variables
--

commit 0bfed8040741146a241b85eae9b49a4eb898b379
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Move oa_tc6.c to its own directory

This commit moves the existing oa_tc6.c file to a dedicated oa_tc6
subdirectory under drivers/net/ethernet. It updates the Kconfig and Makefile
structures to accommodate this new location. The change is intended to
prepare for adding more files related to hardware timestamps and PTP APIs.

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
Is it correct to use the immediate assignment operator :=3D here?

Using :=3D instead of the standard Kbuild append operator +=3D for obj- var=
iables
clobbers any prior assignments. While this currently works because there are
no other entries in this new subdirectory Makefile, it breaks Kbuild
composability.

> +oa_tc6_mod-objs :=3D oa_tc6.o

[Severity: Medium]
Does this break userspace ABI by renaming the resulting kernel module?

The patch changes the target object name from oa_tc6.o to oa_tc6_mod.o,
causing the resulting kernel module to be named oa_tc6_mod.ko instead of
oa_tc6.ko.

Module names are part of the kernel's userspace ABI. Renaming an existing
kernel module breaks userspace configurations that explicitly reference the
old name, such as initramfs scripts, modprobe configurations
(/etc/modprobe.d/), and autoload lists (/etc/modules-load.d/).

To preserve the module name while supporting multiple source files, the
original oa_tc6.c could be renamed (e.g., to oa_tc6_core.c or oa_tc6_main.c)
and the Makefile could use obj-$(CONFIG_OA_TC6) +=3D oa_tc6.o alongside
oa_tc6-y :=3D oa_tc6_core.o.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-s2500-mac-=
phy-support-v9-0-dcefe1d0bf0d@onsemi.com?part=3D3
