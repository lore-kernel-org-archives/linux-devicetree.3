Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A131243C7C8
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010851; cv=none; b=bBzIYM1ZbJuIzB6kXb/BTG3+WLkfJm5vSwKjdhKDXEhF1BHtu6yIayVceV2hnkCBK3RQybaE7S+8aB+BZV4VqT0fRZS3EIhe8+m8/dAPt0adLOPqNOd/uLl1sltPXbBjicclY3EnvLeLgFFqgU9PXn12KVZQRhW9PCnrk4F0QcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010851; c=relaxed/simple;
	bh=xL56zrVs0SfXyeGSM9bXh1/gXqwjOleiuoAgGJXEn50=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AHAHhl1aPpzcd4DKo2c8sZsXhkhoo0rdAyJGrs+SgHJLSF8QuNe0wuIwC9BMGBpA5x9qNVqwZyHeYBaUxSVSboVvIp1vbuF1TRS8ruwtZa0UYNRKLNAzZA9r+GBP2Ett7QJe4ioGYTB9G7yyune6CDyHr1Th5O07K1RpD3RdlY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHeiJ/3m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHeiJ/3m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4191F000E9;
	Thu,  6 Aug 2026 10:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786010842;
	bh=3dT11s32vKCwER9pybflrDb3IlrT4yFwTN+YqTZlc2s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QHeiJ/3mS0bZe+M6uxiIjO5kCqqChAEfosHTfhxvbhQywECXd0cUmLvjtV9UvXP1o
	 AlTO649LOeQx8FuZ4q9k5KqRgCcdaqIbBvPOmYr3QvvqxzReCbF4sDWg20dneQ24sz
	 eDY6LK2oa5Gg2O1U940Xga+LnTJ9EHPoZ+IrpZsyZcUlYNRb8LfK0x9Q2yskjzpS0M
	 9CD1NyvYrzzuZifvYvoDnihg+mzQK+x+DO+7MzRfm7UUx0I9iQEhYIadIwtNZDijQ6
	 epHvrV3iGWZlAwF7jBhWTa/8BBBquEF27q1HJQni8bjFOBVc2B+SZRItxYEBvu0RjD
	 Gyw/ump2gVu/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/8] crash_core: replace for_each_mem_range() with
 for_each_mem_region()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806093519.2907771-8-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
 <20260806093519.2907771-8-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 10:07:21 +0000
Message-Id: <20260806100721.AA4191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Use-after-free and wild pointer iteration in `for_each_mem_region`=
 due to concurrent memory hotplug.

Pre-existing issues:
- [High] TOCTOU race between counting and populating memblock regions leadi=
ng to an out-of-bounds write.
--

--- Patch [7]: [PATCH v5 7/8] crash_core: replace for_each_mem_range() with=
 for_each_mem_region() ---
commit 50852c55d127f622d99b3ad7a91bdd709c53a6eb
Author: Wandun Chen <chenwandun@lixiang.com>

crash_core: replace for_each_mem_range() with for_each_mem_region()

This patch replaces the use of for_each_mem_range() with
for_each_mem_region() in the weak defaults for arch_get_system_nr_ranges()
and arch_crash_populate_cmem(). It also introduces a
crash_should_skip_region() helper to explicitly filter out MEMBLOCK_NOMAP
regions.

> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 77285ae3ce600..fb78b7814f188 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
[ ... ]
> @@ -284,22 +290,25 @@ static struct crash_mem *alloc_cmem(unsigned int nr=
_ranges)
>  unsigned int __weak arch_get_system_nr_ranges(void)
>  {
>  	unsigned int nr_ranges =3D 2 + crashk_cma_cnt; /* crashk_res + crashk_l=
ow_res, +CMA splits */
> -	phys_addr_t start, end;
> -	u64 i;
> +	struct memblock_region *reg;
> =20
> -	for_each_mem_range(i, &start, &end)
> +	for_each_mem_region(reg) {
[Severity: High]
Is it possible for a concurrent memory hotplug to cause a use-after-free and
unbounded iteration here?

If sys_kexec_file_load() calls this path without holding mem_hotplug_lock, a
concurrent memory hotplug (e.g., ACPI memory add) could add a new region via
memblock_add_node().

This could trigger memblock_double_array(), which frees the old
memblock.memory.regions array.

Because the for_each_mem_region(reg) macro initialized the reg pointer once,
would it now point to freed memory? Also, if the loop condition compares
against the new array's bounds, and the new array is at a higher address,
could the loop run out of bounds?

> +		if (crash_should_skip_region(reg))
> +			continue;
>  		nr_ranges++;
> +	}
>  	return nr_ranges;
>  }
> =20
>  int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
>  {
> -	phys_addr_t start, end;
> -	u64 i;
> +	struct memblock_region *reg;
> =20
> -	for_each_mem_range(i, &start, &end) {
> -		cmem->ranges[cmem->nr_ranges].start =3D start;
> -		cmem->ranges[cmem->nr_ranges].end =3D end - 1;
> +	for_each_mem_region(reg) {
> +		if (crash_should_skip_region(reg))
> +			continue;
> +		cmem->ranges[cmem->nr_ranges].start =3D reg->base;
> +		cmem->ranges[cmem->nr_ranges].end =3D reg->base + reg->size - 1;
>  		cmem->nr_ranges++;
[Severity: High]
This is a pre-existing issue, but can this out-of-bounds write corrupt the
heap if a region is added concurrently?

crash_prepare_headers() performs two lockless passes over the regions:

	max_nr_ranges =3D arch_get_system_nr_ranges();
	if (!max_nr_ranges)
		return -ENOMEM;

	cmem =3D alloc_cmem(max_nr_ranges);
	if (!cmem)
		return -ENOMEM;

	ret =3D arch_crash_populate_cmem(cmem);

If memory hotplug adds a new region concurrently between these two passes,
the region count increases. Since the array assignment here lacks bounds
checking against cmem->max_nr_ranges, would the second pass iterate more
times than the allocated capacity and overwrite adjacent memory?

>  	}
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806093519.2907=
771-1-chenwandun1@gmail.com?part=3D7
