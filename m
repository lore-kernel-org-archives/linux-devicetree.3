Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1619B27CB02
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 17:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617171; cv=none; b=RIZdtb6KGuI9853M14T43BMStEif90CB/7NKzBEsg0P0gxauEnOQkXvIqlRGyj7OqOKnWc6JK5QtPF+SnhnhmxQmyxlL82GjfkDe7fgBbhQQqvXi/gOz95mIkCaKo2HOYvZJiVjmtzitEBXci4yoPh0f+ovRN0l0oDGhvlvHPlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617171; c=relaxed/simple;
	bh=cWkrm5wQC1wsrzLvvSG0Ap9aiZvJ+DH7i9sNgJ6RMaQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OjHVeSZ/T6efny+T9Tki+0CG2wIuzHPms2v104yhuYb68lKNe/eXM8j8qNYcepcOjiJuX32OfNCzSTLsQwTeO3YBBtdXHg2q0h1Jqai7luRdxwqI2jS6npuAOm8WGiz8UYAbjVL058KVkAY5QTtrWqf/8dm0eYuDvemYNfDar+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnxcJiLD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnxcJiLD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61EA01F00A3D;
	Thu,  9 Jul 2026 17:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617169;
	bh=g2qEXeW15cCmoCXbtr/lEn/RFL3KHShp8Rjn+NHgLOM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZnxcJiLDVsbjJZwE+0db9B4ouhjPhNdLrsZ+QesdxU88DjVb5Pni4azg5XypQzB1u
	 2Fv/RTcPRY4gdtzvkcIFlBz5k4tUFD/9l6wOjWrWIPXM9jvl9juhxws9tIchfQOe1W
	 PBnhU03qCakeJWpDuhppfYixmBPYERDBQz6s5jkts6IlgaTleKq8oKyETiknASUAor
	 ZBR4xDVMrmbTTM8kB2rBDbX1xbwWlJHB3ZlC589XDXqCMTyP6duA2A1KmZ/+21SfU9
	 TmOWfrJ3F9OvUcva4Z7RNXEWsxm0R8ZlkQ65XHpdnI4b4BzVhCFI2sq2Yw0QnD0r3I
	 z8nzPbCOGg5TQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 05/15] net: ethernet: oa_tc6: Move oa_tc6.c
 to its own directory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-s2500-mac-phy-support-v7-5-478c877aa1a9@onsemi.com>
References: <20260708-s2500-mac-phy-support-v7-0-478c877aa1a9@onsemi.com>
 <20260708-s2500-mac-phy-support-v7-5-478c877aa1a9@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:12:49 +0000
Message-Id: <20260709171249.61EA01F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] The patch renames the resulting kernel module from `oa_tc6.ko` to =
`oa_tc6_mod.ko`, which can break existing userspace configurations.
- [Low] The Kconfig prompt for `OA_TC6` drops the `if COMPILE_TEST` conditi=
on, making an internal library unconditionally visible in menuconfig.
- [Low] The Makefile uses the `:=3D` assignment operator for `obj-$(CONFIG_=
OA_TC6)` instead of the standard `+=3D` operator.
- [Low] The new MAINTAINERS wildcard pattern fails to cover the Makefile, K=
config, and future files in the new directory.

Pre-existing issues:
- [High] Missing bounds check before `skb_put()` leads to `skb_over_panic` =
if the MAC-PHY sends an overly large frame.
- [High] Spurious frame chunks without a preceding start chunk cause a NULL=
 pointer dereference.
- [High] Receiving multiple frame start chunks without end chunks leaks SKB=
s.
--

--- Patch [5]: [PATCH net-next v7 05/15] net: ethernet: oa_tc6: Move oa_tc6=
.c to its own directory ---
commit 5ceee1aba13100b21fa64b6c007fc879eb9ec499
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Move oa_tc6.c to its own directory

This commit moves oa_tc6.c to its own directory under drivers/net/ethernet.
This refactoring facilitates adding additional files to support other featu=
res
defined by the OPEN Alliance 10BASE-T1x Serial Interface specification, such
as hardware timestamping and PTP-related APIs.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index fab0804329db4..c9b101d8e1fd2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20219,7 +20219,7 @@ M:	Parthiban Veerasooran <parthiban.veerasooran@m=
icrochip.com>
>  L:	netdev@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/networking/oa-tc6-framework.rst
> -F:	drivers/net/ethernet/oa_tc6.c
> +F:	drivers/net/ethernet/oa_tc6/oa_tc6*

[Severity: Low]
Does this file matching pattern miss the new Kconfig, Makefile, and future
files in this directory?

A directory path wildcard F: drivers/net/ethernet/oa_tc6/ would cover all
relevant files in the new location.

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
Does dropping the "if COMPILE_TEST" condition unconditionally expose this
internal framework in the kernel configuration menus?

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
Does the use of :=3D instead of +=3D violate the standard Kbuild pattern for
appending objects to obj-$(CONFIG_...)?

Using :=3D overwrites the variable entirely, which may be brittle against f=
uture
additions.

[Severity: High]
Does renaming the resulting module from oa_tc6.ko to oa_tc6_mod.ko break
existing userspace configurations?

Renaming a kernel module breaks userspace dependencies, initramfs builds,
and modprobe.d configurations that expect the original name.

To allow multiple source files without renaming the module, the standard
practice is to rename the C file instead (e.g., oa_tc6_core.c) and use
oa_tc6-y :=3D oa_tc6_core.o ptp.o while keeping obj-$(CONFIG_OA_TC6) +=3D o=
a_tc6.o.

> +oa_tc6_mod-objs :=3D oa_tc6.o

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6/=
oa_tc6.c
> similarity index 100%
> rename from drivers/net/ethernet/oa_tc6.c
> rename to drivers/net/ethernet/oa_tc6/oa_tc6.c

[Severity: High]
This isn't a bug introduced by this patch, but does the lack of bounds chec=
king
before calling skb_put() lead to an skb_over_panic if the MAC-PHY sends an
overly large frame?

If a MAC-PHY sends a continuous stream of ongoing chunks without an end_val=
id
bit, the driver repeatedly appends 64-byte payloads via oa_tc6_update_rx_sk=
b():

drivers/net/ethernet/oa_tc6/oa_tc6.c:oa_tc6_update_rx_skb() {
    memcpy(skb_put(tc6->rx_skb, length), payload, length);
}

The SKB is allocated with a fixed maximum size (MTU + headers).

When the tailroom is exhausted, skb_put() triggers a kernel panic.

[Severity: High]
This isn't a bug introduced by this patch, but do spurious frame chunks wit=
hout
a preceding start chunk cause a NULL pointer dereference?

If the MAC-PHY sends an ongoing chunk (start_valid=3D0, end_valid=3D0) or a=
n end
chunk without a preceding valid start chunk, tc6->rx_skb will be NULL.

The driver directly passes these chunks to oa_tc6_update_rx_skb(), which ca=
lls
skb_put(tc6->rx_skb, length).

Dereferencing the NULL pointer inside skb_put() will crash the kernel.

[Severity: High]
This isn't a bug introduced by this patch, but does receiving multiple frame
start chunks without end chunks leak SKBs?

In oa_tc6_prcs_rx_chunk_payload(), if the driver receives a chunk with
start_valid=3D1 while tc6->rx_skb is already allocated, oa_tc6_prcs_rx_fram=
e_start()
is called.

This unconditionally calls oa_tc6_allocate_rx_skb():

drivers/net/ethernet/oa_tc6/oa_tc6.c:oa_tc6_allocate_rx_skb() {
    tc6->rx_skb =3D netdev_alloc_skb_ip_align(tc6->netdev, tc6->netdev->mtu=
 +
                                            ETH_HLEN + ETH_FCS_LEN);
    ...
}

This overwrites the tc6->rx_skb pointer. The previously allocated SKB is ne=
ver
freed, resulting in a memory leak that can cause OOM.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-s2500-mac-=
phy-support-v7-0-478c877aa1a9@onsemi.com?part=3D5
