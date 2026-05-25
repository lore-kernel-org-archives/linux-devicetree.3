Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2293539656D
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702889; cv=none; b=nvsVDkWjHDoWGTsnI3h5pxpSgStbpEFv1lFKcev1Xl1bUZjCls46LEwvgeRMaIeh8r/1s/ib9xdFGveE7AePWBb6TUD1KX8sBPAiQpraQEFCNTJw+zxICVTgtZLGyIy5WRYyaXwupexxtNAHXHkhKGz/E8awOahjOzzpSoffxnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702889; c=relaxed/simple;
	bh=o9md3+eLaZx1Hi+4A3ZOlU4h/hcxfCCPD1pmP4J0rVs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BIa3X7EAkqbVc6yVjWKv7DP6pjRfE+IuirCdP4049xXWcrWLqQK22NmoPsH5l514FRtRVUEkUAahD0+s2O6mjBfsMcNTTJ+eGH/JisanwRBtrHarI6xnsoLSxjSmkTsohei6V0rwdiqmUEJyP83jgRxWm5q7QQzsJbL4KpU8jUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZvVRj2J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZvVRj2J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944E11F000E9;
	Mon, 25 May 2026 09:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779702887;
	bh=U+OUUUTaZXY3i5PqLBtC1Z5Sootpx0lKuRav3GkcydM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OZvVRj2JJAyt51fJoMwqqtqEE2X86/RG+0uaIQvr/upmVjSuNXL+1+DZ0ztkeamCT
	 fALqrucQYT2jWHJhsdu0X3LgScPzk80NZjR81paZSogHh6kqMhiIkXK0l/cFizjTiY
	 qfKzf3aS7FYyBysGC2p3qf0HTKbyaqqfxK4QJUbtpju81fkQUCwOu0FdV/7yrdjcOB
	 Hyu2yuhGd1CqntIVnzN8KywNKsRhqVutjAeAwMxBKjGiNjU1PBO+NLfxvxFZMazE9p
	 CVCW+z8WT6vgdtToWBgQmML6uAC8DexBr0rl2Z7l5FmNd1DNBWW5ByJrMeUsl95ili
	 bFtdjoLsbAJgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 07/17] riscv: kexec_file: Fix potential buffer
 overflow in prepare_elf_headers()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260525084932.934910-8-ruanjinjie@huawei.com>
References: <20260525084932.934910-8-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 09:54:47 +0000
Message-Id: <20260525095447.944E11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] `get_online_mems()` does not serialize `walk_system_ram_res()` aga=
inst memory hotplug, failing to eliminate the TOCTOU race.
- [High] Reachable TOCTOU race condition inappropriately triggers `WARN_ON_=
ONCE`, allowing intentional dmesg spam and potential panics.
- [Medium] The commit message fabricates a non-existent deadlock scenario i=
n RISC-V to justify the lock's placement.
--

commit 223e3ce35bfbaf2615822d5aa0bcebc0234cf741
Author: Jinjie Ruan <ruanjinjie@huawei.com>

riscv: kexec_file: Fix potential buffer overflow in prepare_elf_headers()

This commit attempts to fix a TOCTOU race in prepare_elf_headers() by
moving get_online_mems() to the top-level architecture image loaders,
and adding a bounds check in prepare_elf64_ram_headers_callback().

> Directly introducing get_online_mems() inside prepare_elf_headers() would
> trigger an immediate recursive read-after-write deadlock when invoked by
> the runtime hotplug notification path (which already holds the hotplug
> write lock).
>=20
> To eliminate the TOCTOU window safely without deadlock risks, move the
> get_online_mems() read lock to the top-level architecture image loaders.
> Since these top-level loaders are strictly executed on the initial system
> call path and are never re-entered by the runtime hotplug notifier, this
> approach physically isolates the locking contexts. The system memory rang=
es
> are forced to be statically frozen during the entire layout generation,
> eradicating the buffer overflow vulnerability.

[Severity: Medium]
Is this deadlock scenario accurate?

RISC-V currently does not select CONFIG_CRASH_HOTPLUG or
ARCH_SUPPORTS_CRASH_HOTPLUG. This means there is no runtime hotplug
notification path that dynamically updates kexec images or calls
prepare_elf_headers() on RISC-V.

Could the commit message be updated to clarify what this lock placement
actually protects against, given that the described runtime hotplug
notification path doesn't apply to this architecture?

> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/m=
achine_kexec_file.c
> index 3f7766057cac3..a88362dfbd893 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
[ ... ]
> @@ -48,6 +49,9 @@ static int prepare_elf64_ram_headers_callback(struct re=
source *res, void *arg)
>  {
>  	struct crash_mem *cmem =3D arg;
> =20
> +	if (WARN_ON_ONCE(cmem->nr_ranges >=3D cmem->max_nr_ranges))
> +		return -EAGAIN;

[Severity: High]
Is it safe to use a WARN_ON_ONCE() here?

Because get_online_mems() (added below) fails to prevent the Time-of-Check =
to
Time-of-Use race, a concurrent memory hot-add can legitimately cause
cmem->nr_ranges >=3D cmem->max_nr_ranges.

By repeatedly invoking the kexec_file_load syscall concurrently with memory
hotplug, a privileged user could intentionally hit this branch. This allows
them to pollute dmesg with stack traces or potentially trigger a kernel
panic on systems configured with panic_on_warn=3D1.

> +
>  	cmem->ranges[cmem->nr_ranges].start =3D res->start;
>  	cmem->ranges[cmem->nr_ranges].end =3D res->end;
>  	cmem->nr_ranges++;
[ ... ]
> @@ -281,12 +285,15 @@ int load_extra_segments(struct kimage *image, unsig=
ned long kernel_start,
>  	if (image->type =3D=3D KEXEC_TYPE_CRASH) {
>  		void *headers;
>  		unsigned long headers_sz;
> +		get_online_mems();
>  		ret =3D prepare_elf_headers(&headers, &headers_sz);

[Severity: High]
Does get_online_mems() properly serialize walk_system_ram_res() against
memory hotplug?

get_online_mems() only acquires the mem_hotplug_lock as a reader. During
memory hotplug, __add_memory() calls register_memory_resource() to add the
new memory range to the iomem_resource tree (temporarily acquiring
resource_lock) before it calls add_memory_resource() to acquire the
mem_hotplug_lock as a writer.

Because walk_system_ram_res() iterates over the iomem_resource tree, it will
see newly added memory regions even while get_online_mems() is held.

Does this render the intended synchronization ineffective and leave the
Time-of-Check to Time-of-Use window open?

>  		if (ret) {
> +			put_online_mems();
>  			pr_err("Preparing elf core header failed\n");
>  			goto out;
>  		}
> =20
> +		put_online_mems();
>  		kbuf.buffer =3D headers;
>  		kbuf.bufsz =3D headers_sz;
>  		kbuf.mem =3D KEXEC_BUF_MEM_UNKNOWN;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525084932.9349=
10-1-ruanjinjie@huawei.com?part=3D7
