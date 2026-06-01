Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178D636A377
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 11:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313840; cv=none; b=eEAQJ7MQmyux34JVRrdNMDgMgqIzeABfWm9GyMv4iWt9fvkDgR4DNr5F6pLBTIIblXultOusYkuA+XFKUnySDlSP7hRxEYRgdBvZcWdoGP50fFCvgbFhZwgpxT9nO0gM1bQqYq0nVVJeEvdp1trVTnSRnM3ihjeE3094FoltpJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313840; c=relaxed/simple;
	bh=R+KasddaMRmif+AiDUfe9N/FjzpnMe46yT3wjENkylc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dVX5E+nYYXVlSXYxjFvPKSq1UEDXw59IkBzcvgi+7N+85M7MSjQBoi1s1MCV8FH1Hh7+qW/oFsv/ezLCJo+MlPfO6kQZG/R4w8RZX6ixahxAZZ7q81+Qzl0++mZg0e9GpE6MmLANQxxtJucR7p0nz36xLdX9PLgGONh4OK8/gA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xkwtd5r1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xkwtd5r1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF2D1F00893;
	Mon,  1 Jun 2026 11:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780313838;
	bh=gqWSzS9DXWfP5MekYE6m6LgKpw7wSuwIfEH9b3wCvQ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xkwtd5r1GpzNS1Z+SlTM9WV1OPSOba8DaHoBMjRxAZCY/Aoo3PXoWlWHAfAlAHFSM
	 JGENe7e1RwRiOF++77AMWODyfVcVNRBAswrIA8OjVMFtuC4A1N3v7llmXhBNw0Y1kc
	 9ATXGjwVfFF0YLlJRGZqM/8mWbSLQycehlEn1bpN4mnDJ3kT6jxuhs4ix9v49uLJCM
	 F/hbvdQo4eG2YTj3Daf6IqOJJAM/DvIU172h7QqeUCak4ypazuhl3z3qgrUpRzubuh
	 +eI+lnycz7njfHDbqIKy7toAyXytTe3tdT7sJwlQ7TP1XCP/cw1tqFl/RWlcn4Kt7V
	 AkF88dX1cVhrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 23/23] arm64: crash: Add crash hotplug support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260601094805.2928614-24-ruanjinjie@huawei.com>
References: <20260601094805.2928614-24-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 11:37:18 +0000
Message-Id: <20260601113718.8BF2D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] During `kexec_file_load`, the system will read out of bounds f=
rom the `vzalloc` allocated `image->elf_headers` buffer, potentially causin=
g a kernel panic by hitting a vmap guard page.

Pre-existing issues:
- [High] Lockless iteration of `memblock.memory` via `for_each_mem_range` d=
uring `kexec_file_load` races with memory hotplug, potentially causing a Us=
e-After-Free.
--

commit 5a09c245ca3b9b38d052bf46687cba4c0372f7eb
Author: Jinjie Ruan <ruanjinjie@huawei.com>

arm64: crash: Add crash hotplug support

This commit adds crash hotplug support for arm64. It allows the architecture
to selectively update the kdump image components (like elfcorehdr) during
memory hotplug events without reloading the entire kdump image.

Link: https://lore.kernel.org/all/20240529133446.28446-1-Jonathan.Cameron@h=
uawei.com/

> diff --git a/arch/arm64/kernel/crash.c b/arch/arm64/kernel/crash.c
> new file mode 100644
> index 0000000000000..5882b9b5a90e8
> --- /dev/null
> +++ b/arch/arm64/kernel/crash.c

[ ... ]

> +int arch_crash_populate_cmem(struct crash_mem *cmem)
> +{
> +	phys_addr_t start, end;
> +	u64 i;
> +
> +	for_each_mem_range(i, &start, &end) {

[Severity: High]
This is a pre-existing issue, but does this lockless iteration of
memblock ranges race with memory hotplug?

When invoked via the sys_kexec_file_load() path, it appears no locks
protecting memory hotplug (such as mem_hotplug_lock) are held.

If a concurrent memory hotplug event occurs, couldn't memblock_add_node()
dynamically resize the memblock.memory.regions array via
memblock_double_array() (which calls kfree() on the old array), resulting
in a use-after-free here?

[ ... ]

> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_im=
age.c
> index 93c36a3aa618e..21f38de7a8b6a 100644
> --- a/arch/arm64/kernel/kexec_image.c
> +++ b/arch/arm64/kernel/kexec_image.c

[ ... ]

> @@ -92,16 +93,32 @@ static void *image_load(struct kimage *image,
>  #ifdef CONFIG_CRASH_DUMP
>  	if (image->type =3D=3D KEXEC_TYPE_CRASH) {
>  		/* load elf core header */
> -		unsigned long headers_sz;
> +		unsigned long headers_sz, pnum =3D 0;
>  		void *headers;
> =20
> -		ret =3D crash_prepare_headers(true, &headers, &headers_sz, NULL);
> +		ret =3D crash_prepare_headers(true, &headers, &headers_sz, &pnum);
>  		if (ret) {
>  			pr_err("Preparing elf core header failed\n");
>  			return ERR_PTR(ret);
>  		}
>  		image->elf_headers =3D headers;
>  		image->elf_headers_sz =3D headers_sz;
> +
> +#ifdef CONFIG_CRASH_HOTPLUG
> +		/*
> +		 * The elfcorehdr segment size accounts for VMCOREINFO, kernel_map
> +		 * maximum CPUs and maximum memory ranges.
> +		 */
> +		if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
> +			pnum =3D 2 + num_possible_cpus() + CONFIG_CRASH_MAX_MEMORY_RANGES;
> +		else
> +			pnum +=3D 2 + num_possible_cpus();
> +
> +		if (pnum < (unsigned long)PN_XNUM)
> +			image->elf_headers_sz =3D max(pnum_hdr_sz(pnum), headers_sz);

[ ... ]

> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/m=
achine_kexec_file.c
> index d0f73eb3f856f..0016001f4d005 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c

[ ... ]

> @@ -98,6 +66,12 @@ int load_other_segments(struct kimage *image,
>  		kbuf.bufsz =3D image->elf_headers_sz;
>  		kbuf.mem =3D KEXEC_BUF_MEM_UNKNOWN;
>  		kbuf.memsz =3D image->elf_headers_sz;

[Severity: Critical]
Will this cause an out-of-bounds read during the segment copy?

In arch/arm64/kernel/kexec_image.c:image_load(), image->elf_headers_sz
is artificially inflated beyond the actual allocated size (headers_sz) to
accommodate future hotpluggable CPUs and memory regions.

By setting kbuf.bufsz to this inflated size here, when the generic
kimage_load_segment() executes, it will use segment->bufsz to determine
how many bytes to copy from the source buffer.

Since the copy size now exceeds the vzalloc'd allocation size, won't this
cause the kernel to read into unmapped vmap guard pages and trigger a
panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601094805.2928=
614-1-ruanjinjie@huawei.com?part=3D23
