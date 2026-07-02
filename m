Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2423730C172
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 16:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008088; cv=none; b=aQP2YMMUol1reaLxFHcEWaNoBmWvvURpjhoPP3EuuCj3fsMrH1J2s2Jr8JDaCAa8fD3ZC7+HOB96eIM/JDf5Na4PrTyGIpXIIQML2A9ajLOL42cbilPrUuag6NxVbrT9VBPHgrNDmt1Jm9ZJBpjhML1ZszKqgwKcVeS6FNazjoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008088; c=relaxed/simple;
	bh=wO3/LmVoxzfJfksjb3yFO0Dt2pbGjdQf5JMaTKc+SVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ArkaWRSWVANBGe/QHVm9mD7TYG1Kh+A9vxLw9ZoEGygCqdyxwQPev7alnqVFEMg1HNu5UtjG2KJPaN8yzTQ3A5frQJBD4TBRFHP8XV1HN2YUzO/4DdhAMJ732QyOYOp71hHBdl9W2v69QXd4lfo5uTzC0EZjarEjUVfWgsY3JqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ei/UGXxo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ei/UGXxo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 774D01F000E9;
	Thu,  2 Jul 2026 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008086;
	bh=gAjm7p0II1d9NELpv7akJMESZVw3RagS/obMCFFh3ic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ei/UGXxohjnKB/TFo+KDZiotTfRqNgIV+XwZJTehHcRquU6MutBUZbzA0/d23EAEz
	 FuglEJ4n44j+mZNxM9Y9ZG+KQR2QqbLZ+COAe5CJhgwZYgGr/pYloK6tH+oeFfmZLM
	 O774LDq8AjQljYYvIGw8RgfOJ4p/o2Z61CXjfSNw4sWfnK5ePbx06Nir1644pvdOsl
	 kxIAOTCcyS4/cEMlw+nNFZcHb2ufFGr5NmFrq2RlhrfpZzr45cjtmVV2Czid36DFum
	 H1Lph1oWaMWijpo0IcrD+Xyo06reAY3k4dMFk9X915S2GZZew169iLIMSOo0BijODY
	 +DpzDKxITzG2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/9] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260701-block-as-nvmem-v7-6-3fe8205ef0a8@oss.qualcomm.com>
References: <20260701-block-as-nvmem-v7-0-3fe8205ef0a8@oss.qualcomm.com>
 <20260701-block-as-nvmem-v7-6-3fe8205ef0a8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 16:01:26 +0000
Message-Id: <20260702160126.774D01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Replacing `memcpy()` with `ether_addr_copy()` introduces a strict =
16-bit alignment requirement on the caller-provided address buffer, which w=
ill cause unaligned access exceptions on architectures lacking CONFIG_HAVE_=
EFFICIENT_UNALIGNED_ACCESS.
--

commit 4b3ab6cc908398547c262bcc34842d3a0a9fceab
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

net: of_net: Add of_get_nvmem_eui48() helper for EUI-48 lookup

This commit factors out the NVMEM EUI-48 retrieval logic into a new
of_get_nvmem_eui48() helper. The of_get_mac_address_nvmem() function is
updated to use this helper, changing how the MAC address is copied to the
caller's buffer.

> diff --git a/net/core/of_net.c b/net/core/of_net.c
> index 93ea425b9248a..11c1acca15126 100644
> --- a/net/core/of_net.c
> +++ b/net/core/of_net.c
[ ... ]
> @@ -75,27 +73,54 @@ int of_get_mac_address_nvmem(struct device_node *np, =
u8 *addr)
>  		return ret;
>  	}
> =20
> -	cell =3D of_nvmem_cell_get(np, "mac-address");
[ ... ]
> -	memcpy(addr, mac, ETH_ALEN);
> -	kfree(mac);
> +	ret =3D of_get_nvmem_eui48(np, "mac-address", mac);
> +	if (ret)
> +		return ret;
> +
> +	if (!is_valid_ether_addr(mac))
> +		return -EINVAL;
> +
> +	ether_addr_copy(addr, mac);

[Severity: High]
Does this introduce an unaligned memory access issue on architectures lacki=
ng
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS?

By replacing memcpy() with ether_addr_copy(), the caller-provided 'addr' bu=
ffer
is now strictly required to be 16-bit aligned.

Callers like of_get_ethdev_address() pass a stack-allocated, 1-byte aligned=
 u8
array:

net/core/of_net.c:of_get_ethdev_address() {
    ...
    u8 addr[ETH_ALEN];
    int ret;

    ret =3D of_get_mac_address(np, addr);
    ...
}

Since of_get_mac_address() can call of_get_mac_address_nvmem(), this will c=
ause
a hardware exception during probe when ether_addr_copy() casts the unaligned
pointer to u16* on architectures like ARMv5 or SPARC.

> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-block-as-n=
vmem-v7-0-3fe8205ef0a8@oss.qualcomm.com?part=3D6
