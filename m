Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1703A7F75
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779273456; cv=none; b=TaSS1Vi+1XyR9MuXPEyf1GG1H/2ThBaeJl+WRsCZ31Xc3VlcX6FrEz+6jbfe0tZbGsBQTrgy8vC0ttAP7yW+T19sT0/4FUGGwDs4w0F16oOjbIIS9iprJ32QWWS+mES3a4+SFy/6ub7Qf6dCARMYSB05WCkQz9+Q1gLhOI14TB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779273456; c=relaxed/simple;
	bh=b1KS4ve7nKCZnietzA3JqZt5Sc/XivNo+XmABNMV1yg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rz6L9GAtotXelEPN/4P6bnG+ItHAu2VifPHoBddTZJOiOsrZtib6uyti6NKErFPCxsqZmZYD5EBwJbP3NlPahhqHzOqVfQc2Sq6W3yza3e6CocQ787LbU0FYS+60eb8L5Wup7oXXVww6+vrg86OGuavWKA7+nqM5EDjc4eo79L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4xKdNfy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4xKdNfy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CDFA1F000E9;
	Wed, 20 May 2026 10:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779273454;
	bh=Wo5xbYL+itlqTvl7Ze4s4sO7SYGNulrf+hWbS5SGRVs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I4xKdNfykyy8WG9EJfc4LSXD4ZoZWi3ubi5ZM9pyt59y/RHAOmSGh63QfL1a/chAM
	 +dkhG9Qvf2wht/3qOo7Rvog/FBzmtRLBkjdGnUaKDpYNwddE+YJOrNCeqF/jpCEKPj
	 1lw1sW357clg1p6/qehnme0aPfZFxNwS76yxJmtunvTNnASWDFyP7K2laIJ777N+Ul
	 /cDnXQ7N3NyJ7njzUGpduI1wkXUPZRCoqQE+emenoc90jTywE7eZUV4tX9Qw9WiTIG
	 AIztDSFGAvGZc/kZYcLjYip6EUif5wzBecDNtceNTHA+nJl+h5A0YSNmuo7PZIb2iA
	 1+vDA2LaTglaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/8] of: reserved_mem: save /memreserve/ entries into
 the reserved_mem array
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520091844.592753-5-chenwandun@lixiang.com>
References: <20260520091844.592753-5-chenwandun@lixiang.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 10:37:33 +0000
Message-Id: <20260520103734.2CDFA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Out-of-bounds write to the statically allocated `reserved_mem_arra=
y` due to inflated `total_reserved_mem_cnt` without guaranteed array reallo=
cation.
--

commit cac834a48f61205ebaa2a6eaf1bc2f735c0a6c46
Author: Wandun Chen <chenwandun1@gmail.com>

of: reserved_mem: save /memreserve/ entries into the reserved_mem array

This commit saves /memreserve/ entries into the reserved_mem array so they
can be excluded from kdump vmcores. Overlapping entries are marked as dumpa=
ble
to ensure useful crash analysis data is retained.

> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 82f7327c59ea9..d2bcaf149fe81 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
[ ... ]
> @@ -516,7 +517,9 @@ void __init early_init_fdt_scan_reserved_mem(void)
>  		if (!size)
>  			break;
>  		memblock_reserve(base, size);
> +		nr_memreserve++;
>  	}
> +	fdt_reserved_mem_account_memreserve(nr_memreserve);
>  }
[ ... ]
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 313cbc57aa453..6dfe9e03c535d 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
[ ... ]
> @@ -241,6 +241,43 @@ static void __init __rmem_check_for_overlap(void)
>  	}
>  }
> =20
> +static void __init fdt_reserved_mem_add_memreserve(phys_addr_t base,
> +						   phys_addr_t size)
> +{
> +	struct reserved_mem *rmem;
> +	bool dumpable =3D false;
> +	int i;
> +
> +	if (reserved_mem_count =3D=3D total_reserved_mem_cnt) {
> +		pr_err("not enough space for memreserve regions.\n");
> +		return;
> +	}

[Severity: High]
Could this lead to an out-of-bounds write to the statically allocated
reserved_mem_array during early boot?

fdt_reserved_mem_account_memreserve() increments total_reserved_mem_cnt
by the number of /memreserve/ entries. However, if the device tree lacks
a /reserved-memory node, fdt_scan_reserved_mem_late() returns early and
alloc_reserved_mem_array() is bypassed.

If this happens, the reserved_mem pointer continues to point to the
statically allocated array with a fixed capacity of MAX_RESERVED_REGIONS.

Since the check above compares against the inflated total_reserved_mem_cnt,=
 it
appears we could write past the end of the static array if the device tree
contains 64 or more /memreserve/ entries?

> +
> +	for (i =3D 0; i < reserved_mem_count; i++) {
> +		rmem =3D &reserved_mem[i];
> +
> +		if (!rmem->dumpable)
> +			continue;
> +
> +		if (base < rmem->base + rmem->size && rmem->base < base + size) {
> +			dumpable =3D true;
> +			break;
> +		}
> +	}
> +
> +	rmem =3D &reserved_mem[reserved_mem_count];
> +	rmem->base =3D base;
> +	rmem->size =3D size;
> +	rmem->dumpable =3D dumpable;
> +
> +	reserved_mem_count++;
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520091844.5927=
53-1-chenwandun@lixiang.com?part=3D4
