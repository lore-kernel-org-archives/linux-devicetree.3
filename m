Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3F62765D7
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731185; cv=none; b=VnTldR9uU8MM7yoF9YrkPJfJaKMqAnGyN6hiNneHIksruqtxqtRa8pkP7odc4JDIdfx58K4bStXHRaKwXrdnS16WYeiqAN3rcDViN4+09B3qAIwmIl7ugLckkJU3u+dXbl6j+3FUvoWMaXGVUS7LBgxh283R4ZWkPFcZDkGS6as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731185; c=relaxed/simple;
	bh=yKd8A6p+8bziZPsp2Q28s2PZ2vk3u4AqtgqFKkxKqxY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TyxmEzwv5Xxxjg/HtTaPhZBcW4brvRKtGPkMzTMrRtWYLzF2hfNvOHTHr8hLh5Av1ymPqUYVb8Zb2WfzS8JaGhYteJ15gkq+7p+W+Ito2g9Yxq7mwBWs9iJS6n+tlsPCDaxsAFtN6UhRKX5eyCggLFDBr9bzwLvFilBVH/vvalU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMrrQtvH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMrrQtvH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19FAD1F000E9;
	Mon, 29 Jun 2026 11:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782731184;
	bh=lxoWw985NMd9JHNaIPVIITMVNctxRj+Fm6JNRS8rwMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QMrrQtvHnsPioSmnlGtWJSNhx5j0VyHGA3dhkcg0fQKLrqzRWw5K3PHKrNzUJXPT+
	 7bd++QkFHYh2TKSxUiO3puS1DQBhSuiKpqafNjgsS4j967bMUhWSZWJpWmI/nQBdBA
	 WpyUq8ACZvw9aI/AF6mXgs+9LebK9JIf83r0ckLoPhnXe60Pk9WKbyoq22EwExtX+r
	 1bmKkTMLd55h9HM/RHBv2XWFa1gP3+3aDaEJbobf9EvkdFzqriS10wbW/tQ3I631l5
	 ekgbbXJQUgAnyk5E97zBkocGdkpZPQYvSbb9bSuPt1+FGljFtXnc1bgR50a+ih7flo
	 0xawbX/8Nlyew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 07/10] LoongArch: kexec_file: Use
 crash_prepare_headers() helper to simplify code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260629094746.191843-8-ruanjinjie@huawei.com>
References: <20260629094746.191843-1-ruanjinjie@huawei.com>
 <20260629094746.191843-8-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 11:06:23 +0000
Message-Id: <20260629110624.19FAD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Concurrent memory hotplug can modify `memblock.memory` during `kex=
ec_file_load()`, causing an out-of-bounds write on `cmem->ranges[]` and use=
-after-free on `memblock.memory.regions`.
--

commit 144c95098f9114fc6eb269028a7cf5e5b2d79839
Author: Jinjie Ruan <ruanjinjie@huawei.com>

LoongArch: kexec_file: Use crash_prepare_headers() helper to simplify code

This commit simplifies the kexec_file code by replacing the existing
prepare_elf_headers() with the generic crash_prepare_headers() helper.
It implements the architecture-specific arch_get_system_nr_ranges()
and arch_crash_populate_cmem() functions using for_each_mem_range.

> diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/=
kernel/machine_kexec_file.c
> --- a/arch/loongarch/kernel/machine_kexec_file.c
> +++ b/arch/loongarch/kernel/machine_kexec_file.c

[ ... ]

> -static int prepare_elf_headers(void **addr, unsigned long *sz)
> +unsigned int arch_get_system_nr_ranges(void)
>  {
> -	int ret, nr_ranges;
> -	uint64_t i;
> +	int nr_ranges =3D 2; /* for exclusion of crashkernel region */
>  	phys_addr_t start, end;
> -	struct crash_mem *cmem;
> +	uint64_t i;
> =20
> -	nr_ranges =3D 2; /* for exclusion of crashkernel region */
>  	for_each_mem_range(i, &start, &end)
>  		nr_ranges++;
> =20
> -	cmem =3D kmalloc_flex(*cmem, ranges, nr_ranges);
> -	if (!cmem)
> -		return -ENOMEM;
> +	return nr_ranges;
> +}
> +
> +int arch_crash_populate_cmem(struct crash_mem *cmem)
> +{
> +	phys_addr_t start, end;
> +	uint64_t i;
> =20
> -	cmem->max_nr_ranges =3D nr_ranges;
> -	cmem->nr_ranges =3D 0;
>  	for_each_mem_range(i, &start, &end) {
>  		cmem->ranges[cmem->nr_ranges].start =3D start;
>  		cmem->ranges[cmem->nr_ranges].end =3D end - 1;
>  		cmem->nr_ranges++;
>  	}

[Severity: High]
This is a pre-existing issue, and was not introduced by the patch under
review, but could this loop overflow cmem->ranges[]?

The crash_prepare_headers() function first counts the memblock memory ranges
via arch_get_system_nr_ranges() to allocate the cmem array, and then
populates it using arch_crash_populate_cmem().

Neither of these functions appears to hold the mem_hotplug_lock via
get_online_mems(). If a concurrent memory hotplug event adds a new memory
range via memblock_add_node() between the counting and population steps,
does the loop here blindly increment cmem->nr_ranges past cmem->max_nr_rang=
es
and cause a heap out-of-bounds write?

Furthermore, if the hotplug event triggers memblock_double_array(), the
underlying memblock.memory.regions array might be reallocated and freed.
Could this lead to a use-after-free when for_each_mem_range() iterates
over the stale array pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629094746.1918=
43-1-ruanjinjie@huawei.com?part=3D7
