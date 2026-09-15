Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E944D0A09
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 20:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504536; cv=none; b=LeoM/CxSMniVG5K+Vm9LKGML2ZFvkuTQvdbXBvr3nHi1I92LxaNgwzvlg4Dc9UdpIFH/7CFVV+AmYwpQIVrOOyGXDMuKfverr6/OulDskcNOJsOKtgZd2dwkMwwXpf0hLceMkol3+xZJ7WiQYPF78YiPUJBZG6B2xPQUmNqcDBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504536; c=relaxed/simple;
	bh=30bCxm28LpnetiA2/39VgcKfjAZMHulpFJQEep2XXbY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jur28R6L7EceXkmWSZg0ADsCxh5DE2cKAfK8eno0v5tFaSC37vTLNcyZ7eichbHnA1vNMsq2Yc1t5S1lCcDVDXMqigQT/5J3A5Zt97uDgA+uFee5AYW3kfRxY5reDeSY/AjqsO+9U1bDLR53kEfm6P80EbBZLUt7CkYZxeGjulk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOoyCNNW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOoyCNNW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6631B1F00893;
	Tue, 15 Sep 2026 20:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789504533;
	bh=uqOSYHRH1DVX0UitJkDRTkkmckLsSu4aeyUZnY6TOFI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FOoyCNNWEoxfAs9yKwHXkZ7cWUqH+bs4yq7X+uBIVMQko4vh9Y9r6CBLwoqTh8lYn
	 kxYmqdrF8zCjiV1JXaavWo7eTPB0QSnVzPEuylCYdC6QiaTg4LqJGzx31hbAPbRWru
	 OG8lYSYv1Dk1gCWh6/RWzIqApmuseDJOKuMv6aJ8k8sdO9VtKxLe5QLgotpWRTHqBU
	 rc2wMMtnU99lLGICBJlssEuNxgEWm2r6QMGclxgvClsuXXI1mj1QxKSO8L7h8uUG3P
	 oxKyZ5n9r+PTYIOgAZyxVUxzg4/KBm+8Q8jmLZAW8MwtJA/QxpSw238SQrGABTmh01
	 kwLOwIxZsTEVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v14 2/4] net: dsa: tag_ks8995: Add the KS8995
 tag handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260914-ks8995-to-ksz8-v14-2-3d72692b3c97@kernel.org>
References: <20260914-ks8995-to-ksz8-v14-0-3d72692b3c97@kernel.org>
 <20260914-ks8995-to-ksz8-v14-2-3d72692b3c97@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 20:35:31 +0000
Message-Id: <20260915203532.6631B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing SKB length validation before inserting VLAN tag causes out=
-of-bounds read and information leak.
- [Low] Missing explicit include of <linux/bitfield.h> for FIELD_PREP and F=
IELD_GET macros.
--

commit ac1156cbef4888a74fa57e39ccd4edb8d239ca42
Author: Linus Walleij <linusw@kernel.org>

net: dsa: tag_ks8995: Add the KS8995 tag handling

This commit introduces a DSA tag driver for the Micrel KS8995 switch,
adding support for ingress and egress tagging. The driver modifies an
802.1Q ethertype tag to include the target port mask and rate-limits
untagging errors.

> diff --git a/net/dsa/tag_ks8995.c b/net/dsa/tag_ks8995.c
> new file mode 100644
> index 0000000000000..d08166f0e9ad5
> --- /dev/null
> +++ b/net/dsa/tag_ks8995.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 Linus Walleij <linusw@kernel.org>
> + */
> +#include <linux/etherdevice.h>
> +#include <linux/log2.h>
> +#include <linux/list.h>
> +#include <linux/net.h>
> +#include <linux/slab.h>
> +
> +#include "tag.h"

[ ... ]

> +#define KS8995M_STPID_STD	GENMASK(15, 4)
> +#define KS8995M_STPID_PORTMASK	GENMASK(3, 0)
> +#define KS8995M_STPID(portmask)	htons(ETH_P_8021Q | FIELD_PREP(KS8995M_S=
TPID_PORTMASK, portmask))

[Severity: Low]
Does this file rely on an implicit include for the FIELD_PREP and FIELD_GET
macros?

Including <linux/bitfield.h> directly might prevent potential build failures
on configurations where the implicit include chain differs. The FIELD_GET
macro is also used later in ks8995_rcv().

> +static struct sk_buff *ks8995_xmit(struct sk_buff *skb, struct net_devic=
e *dev)
> +{
> +	struct vlan_ethhdr *hdr;
> +	u16 portmask;
> +
> +	/* Prepare the special KS8995 tags */
> +	portmask =3D dsa_xmit_port_mask(skb, dev);

[ ... ]

> +	/* Always add a distinct outer tag. The user port removes this field on
> +	 * egress, so reusing an existing 802.1Q tag would consume that VLAN ta=
g.
> +	 */
> +	skb =3D vlan_insert_tag(skb, KS8995M_STPID(portmask), 0);

[Severity: High]
Could this lead to an out-of-bounds read or write if a short packet is sent?

If a user with CAP_NET_RAW sends a very short packet (e.g., a 1-byte payloa=
d)
via an AF_PACKET raw socket, it might reach ndo_start_xmit without being
padded to 14 bytes because needed_tailroom is not set by the tagger.

When ks8995_xmit() calls vlan_insert_tag(), it operates under the assumption
that the MAC header is at least 14 bytes long. The vlan_insert_tag()
function uses memmove() to shift 12 bytes of the MAC header. If the skb
length is less than 12 bytes, this reads uninitialized heap memory into the
MAC header, which could then leak to the network wire.

Additionally, writing the 4-byte VLAN tag at offset 12 could write beyond
the allocated buffer size and corrupt skb_shared_info.

Should this path validate that skb->len is large enough before inserting the
VLAN tag, or ensure short packets are padded first?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-ks8995-to-=
ksz8-v14-0-3d72692b3c97@kernel.org?part=3D2
