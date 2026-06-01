Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F8029D26E
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 10:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780311082; cv=none; b=T49qSSdcV3HvKiydi5s6nQYkxvw4oljh+sX38nI1rBPhiXbaNW6mI2aYz2Oipwey9YOTZpPeQYrleNF9VjxFfXYUS1/1S6w3zh3CNRlg3XFJ6LorNeQf7HXlz/lleMws8hMF5b7kHgJ8JifXAtcHhskX1qUBQNXN8pZXhK54D9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780311082; c=relaxed/simple;
	bh=6+61G6iClLHH3NYh+5WuEftGNRu98JQksusKpGOWUfM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R1jkX1o5KLKsyEsmte0fspLmTgpjXnEc4pDBHeljp0Uc0vRntoR7nlszMKVYaPasO7qZQxj/CNDFgx9Va5QhmXDaDOlVnt3JGcCRwa02N7fhIMW7aUVKi3dPxV3uDsmC5X9IfbkAywEEFdXeNLad16w6ZiQkJdaI+FOCpGI3Nc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXfA8/yQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXfA8/yQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2469A1F00893;
	Mon,  1 Jun 2026 10:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780311081;
	bh=TO+8aRlrZ/Mza5O6va/cWW6Qvg53wJEkEfmca9bMNPo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hXfA8/yQ1zYdbBC0oOp606YFSHHL2ww0RWIvYsgwA2aC0opjIJj7melgQxyH2F0vL
	 WOM13mXRS38AgIKdVz53BcdLBYkt1o4RnpDilne6nbxn8oIplsc9ndsh9QNw4FRUxL
	 SSyS+REITJAaZsLphtszjDSNGhc3AyvGX3Z3v7RiQogYjSQMxNVCAZfHMcrajYDRhl
	 MXEYktBUw9oG3DVkI3C3w64v+JbR2t6ga5c1rk7HVRcXok55DPIUrhDQaguLKUmimL
	 I0OFS71MRIDXUtHO5fivHit6Wbaf+0MEO9Pg2Wdlje80U/bXe7k4X944VHGE1NgvEf
	 5wAOD+i4IWe8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 14/23] LoongArch: kexec_file: Fix TOCTOU buffer
 overflow via memory region padding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601094805.2928614-15-ruanjinjie@huawei.com>
References: <20260601094805.2928614-15-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 10:51:20 +0000
Message-Id: <20260601105121.2469A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Use-After-Free (UAF) in lockless memblock iteration during con=
current memory hotplug.
--

commit 9f733b8a8b1bc2bc76d7b31a5df0518355501151
Author: Jinjie Ruan <ruanjinjie@huawei.com>

LoongArch: kexec_file: Fix TOCTOU buffer overflow via memory region padding

This commit aims to fix a race condition in prepare_elf_headers() between
the initial pass that counts system RAM ranges and the second pass that
populates them. It adds padding to the initial allocation and introduces
a boundary check to prevent out-of-bounds writes if a concurrent memory
hotplug event increases the number of memory regions.

> diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/=
kernel/machine_kexec_file.c
> index 5584b798ba464..3c369124586e1 100644
> --- a/arch/loongarch/kernel/machine_kexec_file.c
> +++ b/arch/loongarch/kernel/machine_kexec_file.c

[ ... ]

> @@ -75,6 +76,11 @@ static int prepare_elf_headers(void **addr, unsigned l=
ong *sz)
>  	cmem->max_nr_ranges =3D nr_ranges;
>  	cmem->nr_ranges =3D 0;
>  	for_each_mem_range(i, &start, &end) {
> +		if (unlikely(cmem->nr_ranges >=3D cmem->max_nr_ranges)) {
> +			ret =3D -EAGAIN;
> +			goto out;
> +		}
> +

[Severity: Critical]
This is a pre-existing issue, but does this lockless iteration over the
memblock array risk a use-after-free during concurrent memory hotplug
operations?

While the new boundary check successfully protects against index overruns
within the newly allocated cmem array, prepare_elf_headers() iterates over
the underlying memblock array using for_each_mem_range() without holding
the mem_hotplug_lock.

If a concurrent memory hotplug event invokes add_memory(), it can trigger
a reallocation of the memblock array, freeing the old regions array while it
is still actively being traversed:

mm/memblock.c:memblock_double_array()
        memcpy(new_array, type->regions, old_size);
        ...
        type->regions =3D new_array;
        ...
        if (*in_slab)
                kfree(old_array);

Would it be safer to acquire the hotplug lock (e.g., via get_online_mems())
before the lockless __next_mem_range() iterator attempts to dereference
potentially freed array pointers?

>  		cmem->ranges[cmem->nr_ranges].start =3D start;
>  		cmem->ranges[cmem->nr_ranges].end =3D end - 1;
>  		cmem->nr_ranges++;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601094805.2928=
614-1-ruanjinjie@huawei.com?part=3D14
