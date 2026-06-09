Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2CC3DD505
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002279; cv=none; b=ugAYZQRHXn9aQmhcWWihghoVTEAO2iYYDsGuGY+mJggj771nDVJdDRlE5p91sXatQsIHKQAz8GWJMKIFiVc84VdXzlZecic/2WmY0soUYvKn6YUJtNuYmG54b+JjDU6PDcwQkco0V/LEL8en4skN+q1vsLqUXPJtF0DRYorj+oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002279; c=relaxed/simple;
	bh=X5aolmkDdxuo4apVQZM5Qq0GVfOHm3Uh7KMv1V0A56g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jKsiyKG+5xQYDGBCb40cf13AYaEZMs/i0iqGBaFh4JzZq/osHQP7ghBfZC4M7aSAj92nNox5oMvayhR4DMHIikKfw5WBYD5JHTlUEZ82GdVtNfJI6L6WikHGz5j8cYW0PxZPBdgaW0f+sLm4ORDSO/ashLi05IRvfeiKpNzca2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jp3bMx9D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jp3bMx9D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB061F00893;
	Tue,  9 Jun 2026 10:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781002278;
	bh=+F0D13mswuQNyvIKH911oqkWc+/subMdkdx++jCcL0E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jp3bMx9DnocS2RVGiHBlLqdWLjM4k+iKYgsxthjzuXiw6YuJLe4RLVJ9pgWHQL+t2
	 cqDDIjS3+grp5s+OWHOLIX6/0SNKk0ogZh46385wxVmkf1k5Kqiek1Ukh80wfl8FoW
	 edAB8b+mNBCDuSy8ftKUy404EiNShkYH7D+sshWwt5hOsL7z9elDEYEXczhHjPK3T9
	 xjPP889senwLXrn41dciqltpUa23LT+expmtnwFlIZA9C0Iv3rcLYJxYBG4JHnRs79
	 Dds9nciPNbStAqizTE2QDdW/sJH52F7OD8L079H6aevbnhGJ446X93VSV1enw28Yor
	 cq8jIGnhUw5dA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] net: of_net: Add of_get_nvmem_eui48() helper for
 EUI-48 lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608-block-as-nvmem-v3-5-82681f50aa35@oss.qualcomm.com>
References: <20260608-block-as-nvmem-v3-5-82681f50aa35@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 10:51:17 +0000
Message-Id: <20260609105117.AEB061F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unaligned memory access regression due to unaligned stack array pa=
ssed to ether_addr_copy() and is_valid_ether_addr().
--

commit d14ab417c7b180ecf43c9c668c8189080233fb01
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

net: of_net: Add of_get_nvmem_eui48() helper for EUI-48 lookup

This commit factors out the NVMEM EUI-48 retrieval logic into a generic
helper function, allowing other subsystems to reuse it. It updates
of_get_mac_address_nvmem() to use this new helper.

> diff --git a/net/core/of_net.c b/net/core/of_net.c
> index 93ea425b9248a..75341c186123e 100644
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
>  	int ret;
> =20
>  	/* Try lookup by device first, there might be a nvmem_cell_lookup
[ ... ]
> -	cell =3D of_nvmem_cell_get(np, "mac-address");
> -	if (IS_ERR(cell))
> -		return PTR_ERR(cell);
> -
> -	mac =3D nvmem_cell_read(cell, &len);
> -	nvmem_cell_put(cell);
> -
> -	if (IS_ERR(mac))
> -		return PTR_ERR(mac);
> -
> -	if (len !=3D ETH_ALEN || !is_valid_ether_addr(mac)) {
> -		kfree(mac);
> -		return -EINVAL;
> -	}
> -
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
> +	return 0;
>  }

[Severity: High]
Do ether_addr_copy() and is_valid_ether_addr() require their arguments to be
16-bit aligned?

The stack array u8 mac[ETH_ALEN] is naturally 1-byte aligned. On architectu=
res
without CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS, ether_addr_copy() and
is_valid_ether_addr() cast the pointers to u16* to perform 16-bit accesses:

include/linux/etherdevice.h:ether_addr_copy() {
...
#else
	u16 *a =3D (u16 *)dst;
	const u16 *b =3D (const u16 *)src;
...

Could this unaligned array trigger alignment faults on strict-alignment
architectures?

The previous implementation used kzalloc() for the buffer (which guarantees
alignment) and memcpy(), avoiding this issue. Switching to ether_addr_copy()
also imposes the same 16-bit alignment requirement on the caller-provided
addr buffer, which wasn't previously required.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-block-as-n=
vmem-v3-0-82681f50aa35@oss.qualcomm.com?part=3D5
