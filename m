Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCB93921E9
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780310903; cv=none; b=OkO2Zg1L+P6/m9j0mDmttC1p/BxHsH7MTudtv0h0JPhqtYBwdmL15DihCU9i6PAdHMuLvhW8DSH8m3zxUpy42Nq4AAFJx/BmW4kBRka7yn6LSBd3pBypgLKuEdwRqv6JPS8vP9eFMGcl7LP8MkZL5eE4ysJlx0iiqiZU8//gtPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780310903; c=relaxed/simple;
	bh=WsPxTv0SMv3muF7bT0UGoXsJQvrGUvQC+6I/tu1jv/s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T62O5s612VaXoPSjdxdGf2l2A+u2us2NE127OiDBqv40BeBrCzoeDltegNVqcY8R+jkLUF35LcTKdoxTKS/6p5Oc8Wty9+MBdjw6pz6ZdOOwMR6qDAqvo/jt9XAgfbVLLH/9RnLnPEg+QtvVyYCEM6ThHAgteWmTpC/nnfuzR+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzi41gw3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzi41gw3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9283C1F00893;
	Mon,  1 Jun 2026 10:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780310901;
	bh=mK5K/mph/EJJdoH/cCWB0QXMAKHOMEbAale7M0F8pSw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lzi41gw3DyVUsKpHgBvmwyWDq8YFRDyf6iOEuDraD+qoB0CiN36XRbXoPbiD8soVS
	 cnR85HEW2TO2wf2Dz4T41uUK5GSACEZCYowWa5h1ChmWxXzrT7cjH1pthNK5T4Tar7
	 erVAiVV4w4UxRsfBtAV8xf5f6eGHZIW1gfGeISk9jXnqhf+wLL2uNkUl1HXeZP+VHn
	 M/HzC9CgsR4HdP4kdCaJzSoz0vG/fyGFEEIHm6WSazPWlywaWUxeDuhXVUacNSQE4a
	 2BMsZeOMdvzSFdlH6/+Z6Oky2hxlot4CiJa3WqfC1VMhcUdu7D6I79OGsiucuwrjTh
	 zO4itG3BPOPyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 12/23] arm64: kexec_file: Fix TOCTOU buffer overflow
 via memory region padding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601094805.2928614-13-ruanjinjie@huawei.com>
References: <20260601094805.2928614-13-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 10:48:21 +0000
Message-Id: <20260601104821.9283C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The newly added bounds check allows the loop to consume slots expl=
icitly reserved for post-loop crashkernel exclusions, leading to an -ENOMEM=
 failure instead of the intended -EAGAIN retry.

Pre-existing issues:
- [Critical] Lockless traversal of memblock regions using `for_each_mem_ran=
ge()` without holding memory hotplug locks leaves a pre-existing Use-After-=
Free (UAF) vulnerability unmitigated.
--

commit a57099609b29f69b5cdb1aca8c6ba0cda12c085a
Author: Jinjie Ruan <ruanjinjie@huawei.com>

arm64: kexec_file: Fix TOCTOU buffer overflow via memory region padding

Sashiko AI code review pointed out there is a TOCTOU (Time-of-Check to
Time-of-Use) race condition in prepare_elf_headers() between the initial
pass that counts System RAM ranges and the second pass that populates them.
If a memory hotplug event occurs between these two steps, the number of
memory regions may increase, causing an out-of-bounds write to
the cmem->ranges[] array.

> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/m=
achine_kexec_file.c
> index 4cbb71e1f8ed5..8a96fb68b88d6 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c
> @@ -48,7 +48,8 @@ int prepare_elf_headers(void **addr, unsigned long *sz)
>  	u64 i;
>  	phys_addr_t start, end;
> =20
> -	nr_ranges =3D 2; /* for exclusion of crashkernel region */
> +	/* for exclusion of crashkernel region */
> +	nr_ranges =3D 2 + CRASH_HOTPLUG_SAFETY_PADDING;
>  	for_each_mem_range(i, &start, &end)
>  		nr_ranges++;
> =20
> @@ -59,6 +60,11 @@ int prepare_elf_headers(void **addr, unsigned long *sz)
>  	cmem->max_nr_ranges =3D nr_ranges;
>  	cmem->nr_ranges =3D 0;
>  	for_each_mem_range(i, &start, &end) {
        ^^^^^^^^^^^^^^^^^^

[Severity: Critical]
This is a pre-existing issue, but does locklessly traversing memblock regio=
ns
here leave a use-after-free window during concurrent memory hotplug?

Since this path only holds kexec_mutex and not get_online_mems(), concurrent
memory hotplug events like add_memory() can trigger memblock_add().

If the memblock regions array is full, memblock_double_array() will allocate
a new array and free the old one by calling kfree(old_array).

Could this concurrent free cause the internal memblock traversal logic in
__next_mem_range() to dereference a freed type->regions pointer?

> +		if (unlikely(cmem->nr_ranges >=3D cmem->max_nr_ranges)) {
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does this bounds check allow memory hotplug region expansion to consume the
slots explicitly reserved for crashkernel exclusion?

Because nr_ranges initially reserved 2 slots for exclusion, if hotplug
expands the regions and consumes those slots, this check won't fail because
we haven't hit cmem->max_nr_ranges yet.

If the loop completes having consumed these reserved slots, subsequent calls
to crash_exclude_mem_range() will hit their internal limit:

    if (mem->nr_ranges =3D=3D mem->max_nr_ranges)
        return -ENOMEM;

This returns -ENOMEM instead of the intended -EAGAIN retry, which aborts the
kexec load entirely.

Should this evaluate against cmem->max_nr_ranges - 2?

> +			ret =3D -EAGAIN;
> +			goto out;
> +		}
> +
>  		cmem->ranges[cmem->nr_ranges].start =3D start;
>  		cmem->ranges[cmem->nr_ranges].end =3D end - 1;
>  		cmem->nr_ranges++;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601094805.2928=
614-1-ruanjinjie@huawei.com?part=3D12
