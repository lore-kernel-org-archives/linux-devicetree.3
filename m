Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705AB3932FD
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078031; cv=none; b=nSF1k7YAQ2w8ovqamhAF/W7ClN63HP3y4/s7Ze/r0X1ivnOZ0nuD5xoLlima+CBmRPhSyzddBus2iU3skWb+tcZiErjgkHs3zryb2LVrHS/csXJ99Tz8caNWBaeZVdUGjddjIAd1BfDFhJsaK6qGtYqJ0QwFN/0Uz/CtP1wMFLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078031; c=relaxed/simple;
	bh=T/5izGsEhIpoAdL9X0ZraMVdFBpprCeM12rQV/RB4A0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WW/elIX7azOoMQs4K7d6CUHU1dSb0TPQMovxr7xy0SEnIH6XJTcI4s5RAccU+Bxp23bYF+Y+F3Kl1tWoG6uLxrNF8Ye2iINmsISaQpRlTBn/nha48Jxm9OnGOQbdUwzGp42LPxRmhRfUPm9YsKVpM9MIrz4pYhYEjlj6RUxe9WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLnHcn1n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLnHcn1n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163011F00898;
	Wed, 10 Jun 2026 07:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781078030;
	bh=ndrYZ+U7s/nUkCw3YdazjptzCT+18khr4sjo+8tOm6c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gLnHcn1nOMpkb5qRmRglpfpjHchUmbBhOYb56Bbv3OStZYyeeKP1rwASvONGARwUu
	 Y/knyOFP/buo2LqtyhPrh+IpTGjMMG12owdbrpRsmh5gquGIHgbDGRcX7rPnVppfdP
	 f/YBatFKB4+6HmL5gmyQgAVTezGRB7UUnnFCKKzq+sGnRrlX5QbPHKt4pf/7TaN5SN
	 EOQns1DtjBF/dKI1Bl0AjaLznY8l7ZfkmVY+UmjaHtXZMUiBgbFXxBqZ44YNfH8HBF
	 5NIQcwGTF0/9DqK/rd83huc7MsE0LXg1tfy2B9zXcIBZP2FasgFqyPpmLlF4xiKGRd
	 /Qm8nDeG7jSBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/8] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609-block-as-nvmem-v4-5-45712e6b22c6@oss.qualcomm.com>
References: <20260609-block-as-nvmem-v4-5-45712e6b22c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 07:53:49 +0000
Message-Id: <20260610075350.163011F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The refactored `of_get_mac_address_nvmem()` allocates `u8 mac[ETH_=
ALEN]` on the stack without an explicit alignment attribute, but passes it =
to `is_valid_ether_addr()` and `ether_addr_copy()`, which explicitly requir=
e 2-byte alignment. Additionally, it replaces `memcpy()` with `ether_addr_c=
opy()` for the output buffer `addr`, which places a new 16-bit alignment re=
quirement on the caller-provided destination buffer. On architectures where=
 `CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS` is disabled, passing unaligned bu=
ffers to these inline functions triggers hardware alignment faults (kernel =
panics).
--

commit bea465de4254300767e8f7bcd7c42eab2fe9f51f
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

net: of_net: Add of_get_nvmem_eui48() helper for EUI-48 lookup

This commit factors out the common NVMEM EUI-48 retrieval logic from
of_get_mac_address_nvmem() into a new of_get_nvmem_eui48() helper. It
updates of_get_mac_address_nvmem() to use this new function to preserve
the existing behavior while making the logic reusable.

> diff --git a/net/core/of_net.c b/net/core/of_net.c
> --- a/net/core/of_net.c
> +++ b/net/core/of_net.c
> @@ -61,9 +61,7 @@ static int of_get_mac_addr(struct device_node *np, cons=
t char *name, u8 *addr)
>  int of_get_mac_address_nvmem(struct device_node *np, u8 *addr)
>  {
>  	struct platform_device *pdev =3D of_find_device_by_node(np);
> -	struct nvmem_cell *cell;
> -	const void *mac;
> -	size_t len;
> +	u8 mac[ETH_ALEN];

[Severity: High]
Does this stack-allocated array need an explicit alignment attribute?

Because it is a u8 array, it only guarantees 1-byte alignment.

>  	int ret;
> =20
[ ... ]
> -	mac =3D nvmem_cell_read(cell, &len);
> -	nvmem_cell_put(cell);
> =20
> -	if (IS_ERR(mac))
> -		return PTR_ERR(mac);
> +	ret =3D of_get_nvmem_eui48(np, "mac-address", mac);
> +	if (ret)
> +		return ret;
> +
> +	if (!is_valid_ether_addr(mac))

[Severity: High]
Could this cause an alignment trap on architectures without efficient
unaligned access?

is_valid_ether_addr() expects its argument to be 2-byte aligned.
The previous implementation used the pointer returned by nvmem_cell_read(),
which was allocated via kzalloc() and naturally provided an 8-byte alignment
guarantee.

> +		return -EINVAL;
> +
> +	ether_addr_copy(addr, mac);

[Severity: High]
Can this ether_addr_copy() call cause an alignment fault?=20

ether_addr_copy() requires both the source and destination pointers to be
2-byte aligned. This replaces the safe memcpy() used in the previous
implementation and introduces a new 2-byte alignment requirement for the
caller-provided addr buffer, as well as the locally allocated mac array.

> +	return 0;
>  }
>  EXPORT_SYMBOL(of_get_mac_address_nvmem);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-block-as-n=
vmem-v4-0-45712e6b22c6@oss.qualcomm.com?part=3D5
