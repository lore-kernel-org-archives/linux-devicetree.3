Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909513FC5AB
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728403; cv=none; b=DWmsYZFAmpYdL4pWIOhuUe/InX3axNrMib1LmOKDQh9akSlEpc1ZxjAaEa6ugH+gnN5rAtkm313R0mwUPZYWrn7UybGrFr+zuv4ETruLCN5K+YdjIxYazf2XyQ51ah6fyDItZDtHar2qx0fIxaWlyKUv7NhjIS0cV9gcx+YU/9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728403; c=relaxed/simple;
	bh=BLBUuM7zc/KXZSAXc45HZ+BlHAyikquaK9r0xC5N2LQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kQyBK9od1j/1kw+UC79bQANS2TW3gufJKVHbmcWGaJedLaCabPhIUvpf3YWxPupAl34BXOvHI96lKPNUgS5GKtZBvEg6h7MKVH3Q7ewr/6OEXMlaYYZ6FJzx01K++UgCehgQcZZw1w9lJ3/Qd0Xoa+g6VM0r8QxMeTjnQVlgxTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyJl16dA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyJl16dA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBFD1F00A3A;
	Mon, 29 Jun 2026 10:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782728401;
	bh=gm+I1+tunMmHWDFSIxPvYyIVjMifbM60gP00efQIztM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IyJl16dA64intbnz//8YQ78BjlVrO7CvrcSbepKOLT8W1r4lCV/0aSngNRlOyCH0Z
	 /s4Dx9Q4MYgR6JDTxQGX46NRYbtUckNinGZe1P1HaGkusaRNrqopNpcORsdoSaj058
	 yLhUkL+18OsxSF8ohklYhUk36TwLfXZh8TW2gni722az4YHNSqcwY3lgfSTyWm5R9t
	 xeM4y4POEczFaC6dK0UxOjwzFDawP7bS3iul0v1TTNfSbOq/mmos7BNfWlXQCORzyG
	 nsM5eZF0fqRlydCLcNKmoIKnhzMycLZ5XdhENmoObSKjer3eApjY5z95RaXj2gNWH/
	 gmLj0uzaEvkfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 03/10] crash: Add crash_prepare_headers() to exclude
 crash kernel memory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629094746.191843-4-ruanjinjie@huawei.com>
References: <20260629094746.191843-1-ruanjinjie@huawei.com>
 <20260629094746.191843-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 10:19:59 +0000
Message-Id: <20260629102000.0BBFD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] crash_prepare_headers() delegates array sizing to architectures =
but performs memory exclusions in generic code, forcing implicit padding to=
 avoid -ENOMEM.
--

commit 7701a27578ff768dd0a4b481af66ec228b7e613f
Author: Jinjie Ruan <ruanjinjie@huawei.com>

crash: Add crash_prepare_headers() to exclude crash kernel memory

This patch introduces a generic crash_prepare_headers() helper to consolida=
te
crash memory allocation and exclusions across architectures. It adds
architecture-specific hooks for pre-counting memory ranges, populating the
ranges, and performing any additional exclusions.

> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 4f21fc3b108b8..481babc291310 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
[ ... ]
> @@ -272,6 +269,85 @@ int crash_prepare_elf64_headers(struct crash_mem *me=
m, int need_kernel_map,
>  	return 0;
>  }
> =20
[ ... ]
> +int crash_prepare_headers(int need_kernel_map, void **addr, unsigned lon=
g *sz,
> +			  unsigned long *nr_mem_ranges)
> +{
> +	unsigned int max_nr_ranges;
> +	struct crash_mem *cmem;
> +	int ret;
> +
> +	max_nr_ranges =3D arch_get_system_nr_ranges();
> +	if (!max_nr_ranges)
> +		return -ENOMEM;
> +
> +	cmem =3D alloc_cmem(max_nr_ranges);
> +	if (!cmem)
> +		return -ENOMEM;
> +
> +	ret =3D arch_crash_populate_cmem(cmem);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D crash_exclude_core_ranges(cmem);

[Severity: Medium]
Will this return -ENOMEM if the generic exclusion splits memory ranges, unl=
ess
architectures implicitly pad the count returned by arch_get_system_nr_range=
s()?

crash_exclude_core_ranges() calls crash_exclude_mem_range() for crashk_res,
crashk_low_res, and crashk_cma_ranges. If these exclusions split existing
ranges, crash_exclude_mem_range() will attempt to grow cmem->nr_ranges.

Since cmem is allocated exactly to the max_nr_ranges provided by the
architecture, if the architecture doesn't artificially inflate its count to
account for these generic splits, won't the split operations hit the
cmem->nr_ranges >=3D cmem->max_nr_ranges check and fail with -ENOMEM?

> +	if (ret)
> +		goto out;
> +
> +	ret =3D arch_crash_exclude_ranges(cmem);
> +	if (ret)
> +		goto out;
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629094746.1918=
43-1-ruanjinjie@huawei.com?part=3D3
