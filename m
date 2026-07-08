Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8223E9C21
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495327; cv=none; b=rSiUoG+koGSi/q6SM+7hVsecRd7AscLztOpMxK6T8qtRr1RJ7jCYdY7MDhdrBfANF3UDDIQDI2JpMCJiBPeKxemRbkrBm1Ukq6sw23YpuFit1ErfAo1auj2y5eLs4NnasXu9vaQpF7pp1mosNQtK5ZDTQ+DmFKI8mnzxnXsQ8FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495327; c=relaxed/simple;
	bh=8Y4BBNHlwyf05pOWDqeL+jvP/ZJQ7NzRcBztDPlED/Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BQkuJkHC2hMZV1Cg1iQoI7VrJj2qxJqYwr9Mn5Qphxeu6vAvJBsDk0MqWq/1AxIcMwSqay/9RUjOFHJdf2zTp+PzH3YCP3CQGvcDrYglBMihnvjic9cn2qOvLB2EN8dhYAlNFdMbjO274uP459+OOnH8X5af7RUu5L7uFn7Fs58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOVIsTSU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOVIsTSU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21811F00A3A;
	Wed,  8 Jul 2026 07:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495301;
	bh=b7cRjoEPRNQ6TwZEsCC540MViqqACVcFBKuJLBp7bSg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QOVIsTSUUJ9cYTAYW0VetvWw4ylXHrCPruWpyy9vZIjJGqzQy68wwTDUBG5MYuRUv
	 GIYOZlbmQkcnxI144Zkoq7F27kmt2ulKZPk1ughsaXGKGqXt1SrFTgdf+TqTG9E6OT
	 a32Ld0aUiSzdappCwaoU08+NY+HqW2eNR2nAcQP3/lO8jbsoWB5sIZkAVluuZnzx7D
	 VJtGPmR5TxNqT8rkQIN+15t4A0D1HtnzYj8ZuuzQEi9bOD5gAItwjRd7jne3rEA6Yv
	 4Un3AdhV3XIT7SjYUEX72I/i11YLNRSB1FQ8SJoWOW73HIERp8vtsmOiNPt27gJ6aL
	 ZSHDuJ9cIuL5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/26] kernel: Introduce meminspect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-meminspect-v3-v3-1-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-1-7aa5a0a74d5c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:21:41 +0000
Message-Id: <20260708072141.B21811F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Integer truncation in memory allocation size causes an undersized =
CMA block, leading to a heap buffer overflow during ELF header initializati=
on.
- [High] Invalid use of `virt_to_phys()` on statically allocated kernel sym=
bols causes boot panics or returns bogus physical addresses.
- [High] Missing bounds checking on the `id` field leads to out-of-bounds a=
ccesses on the `inspect_entries` array.
- [Medium] ELF core dump file layout will be corrupted because physical tra=
versal order diverges from chronological ELF header offsets.
- [Medium] Missing padding for unaligned region sizes causes cumulative off=
set mismatches in the dumped core file.
- [Medium] `meminspect_prepare_table` issues duplicate `MEMINSPECT_NOTIFIER=
_ADD` notifications for dynamic entries registered before the late initcall.
- [Low] `meminspect_notifier_list` is defined as an `ATOMIC_NOTIFIER_HEAD`,=
 pointlessly forcing driver callbacks into an atomic context.
--

--- Patch [1]: [PATCH v3 01/26] kernel: Introduce meminspect ---
commit 62611e2ce3f1357bd155ab67d8e06e76e5461779
Author: Eugen Hristev <ehristev@kernel.org>

kernel: Introduce meminspect
   =20
This commit introduces a mechanism to register memory areas into an inspect=
ion
table for later use by drivers. The inspection table can be requested and
analyzed for purposes such as memory dumping or debugging.

> diff --git a/kernel/meminspect/meminspect.c b/kernel/meminspect/meminspec=
t.c
> new file mode 100644
> index 0000000000000..d9d38f484f1f4
> --- /dev/null
> +++ b/kernel/meminspect/meminspect.c
> @@ -0,0 +1,474 @@
[ ... ]
> +static DEFINE_MUTEX(meminspect_lock);
> +static struct inspect_entry inspect_entries[MEMINSPECT_ID_MAX];
> +
> +static ATOMIC_NOTIFIER_HEAD(meminspect_notifier_list);

[Severity: Low]
Since the notifier events are dispatched while holding a sleepable mutex
(meminspect_lock), does using an ATOMIC_NOTIFIER_HEAD unnecessarily force a=
ll
consumer callbacks into a non-sleepable atomic context?

[ ... ]
> +static void update_elfheader(const struct inspect_entry *e)
> +{
> +	struct elf_phdr *phdr;
> +
> +	phdr =3D elf_phdr_entry_addr(ehdr, ehdr->e_phnum++);
> +
> +	phdr->p_type =3D PT_LOAD;
> +	phdr->p_offset =3D elf_offset;

[Severity: Medium]
If dynamic regions are registered out of chronological order, will
meminspect_traverse() yielding entries in strict numerical ID order cause t=
he
physical data layout dumped by firmware to mismatch the chronologically
assigned p_offset values in the ELF headers?

> +	phdr->p_vaddr =3D (elf_addr_t)e->va;
> +	if (e->pa)
> +		phdr->p_paddr =3D (elf_addr_t)e->pa;
> +	else
> +		phdr->p_paddr =3D (elf_addr_t)virt_to_phys(e->va);
> +
> +	phdr->p_filesz =3D ALIGN(e->size, 4);
> +	phdr->p_memsz =3D ALIGN(e->size, 4);
> +	phdr->p_flags =3D PF_R | PF_W;
> +	elf_offset +=3D ALIGN(e->size, 4);

[Severity: Medium]
If an unaligned region is registered, update_elfheader() advances the global
elf_offset and header sizes with 4-byte padding, but the base table retains
the unaligned size.

When firmware iterates the table to dump the memory exactly by e->size, won=
't
this missing padding cause a cumulative drift between the actual file offse=
ts
and the p_offset recorded in the ELF headers?

> +}
[ ... ]
> +static int init_elfheader(void)
> +{
[ ... ]
> +	buf_sz =3D elfh_size + note_len - ALIGN(vmcoreinfo_size, 4);
> +
> +	/* Never freed */
> +	p =3D dma_alloc_from_contiguous(NULL, buf_sz >> PAGE_SHIFT,
> +				      get_order(buf_sz), true);

[Severity: High]
Does the expression buf_sz >> PAGE_SHIFT truncate the fractional page
remainder for unaligned sizes?

If buf_sz requires multiple pages but the shift truncates the count, could
this allocate an undersized CMA block and lead to a heap buffer overflow wh=
en
mapping the memory?

> +	if (!p)
> +		return -ENOMEM;
[ ... ]
> +void meminspect_unregister_id(enum meminspect_uid id)
> +{
> +	struct inspect_entry *e;
> +
> +	WARN_ON(!mutex_is_locked(&meminspect_lock));
> +
> +	e =3D &inspect_entries[id];

[Severity: High]
Does this function lack bounds checking on the id argument?

If a caller passes an ID greater than or equal to MEMINSPECT_ID_MAX, could
this result in an out-of-bounds access and corruption of adjacent kernel
memory?

> +	if (!e->id)
> +		return;
[ ... ]
> +static int __init meminspect_prepare_table(void)
> +{
> +	const struct inspect_entry *e;
> +	enum meminspect_uid i;
> +	int ret;
> +
> +	meminspect_table_lock();
> +	/*
> +	 * First, copy all entries from the compiler built table
> +	 * In case some entries are registered multiple times,
> +	 * the last chronological entry will be stored.
> +	 * Previously registered entries will be dropped.
> +	 */
> +	for_each_meminspect_entry(e) {
> +		inspect_entries[e->id] =3D *e;

[Severity: High]
Does this lack bounds checking on e->id?

If a statically compiled entry provides an invalid ID, could this result in
an out-of-bounds write?

> +		if (!inspect_entries[e->id].pa && inspect_entries[e->id].va)
> +			inspect_entries[e->id].pa =3D virt_to_phys(inspect_entries[e->id].va);

[Severity: High]
Is it safe to use virt_to_phys() on statically allocated kernel symbols par=
sed
from the linker section here?

Since these symbols reside in the kernel image map (which is outside the
linear map on architectures like arm64), could this cause a panic on boot or
return incorrect physical addresses?

> +	}
> +#ifdef CONFIG_CRASH_DUMP
> +	ret =3D meminspect_prepare_crashdump();
> +	if (ret)
> +		pr_warn("meminspect: failed to prepare crashdump ELF header: %d\n", re=
t);
> +#endif
> +	/* if we have early notifiers registered, call them now */
> +	for (i =3D MEMINSPECT_ID_ELF; i < MEMINSPECT_ID_MAX; i++)
> +		if (inspect_entries[i].id)
> +			atomic_notifier_call_chain(&meminspect_notifier_list,
> +						   MEMINSPECT_NOTIFIER_ADD,
> +						   &inspect_entries[i]);

[Severity: Medium]
If a dynamic region is registered via meminspect_register_pa() before this
late_initcall runs, will this loop blindly issue a duplicate
MEMINSPECT_NOTIFIER_ADD notification for that region?

> +	meminspect_table_unlock();
> +
> +	pr_debug("Memory inspection table initialized\n");
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-meminspect=
-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com?part=3D1
