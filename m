Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACF33E3DA7
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700929; cv=none; b=M3PMrvzZ/gFQvXksS4Ev6Xm1SOC7tt9eC8ESckfuGD5scMVXp/ZNoywHVqoFuTXrz1Z8T9baofVwFwdyStYjcnopKEDuL77axMN1OBsHRd5RQ/lvG/rbfINHPH5R5twHDlvnUEayaN1U3AbK+bTO3n+ZJzVzYbLgJb0JqKpUxtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700929; c=relaxed/simple;
	bh=jBwhCGQ81N+Q65N/Im6zWLI0tHf9JAxIspMwCd4zPOA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hekzs7ssvT1rWS1dp+WfixOjZN++RQKXiiRqdHRVkP0VPJDZh3wSPRJO865ZlZE8Vs6vdzm/skl2fdb5F05TmLoXOlugSGOYCJsw+stcsgteD70ps7zarpq4Amslj7SD0v3qlbWyn5X+m0K9dColQn3Qi+ZE5a/UzMd8HdkoELE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DyZkLxvy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DyZkLxvy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B9D1F000E9;
	Mon, 25 May 2026 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779700927;
	bh=1dJXrjIypDouKLJEtNxfo3ozrZzGTT89k1+B3F/POMA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DyZkLxvy76jlOrSPGkgLQ2sjm5gZ+WQWNLro2DN4RHBABxDREktTV+LexfQhUKw4J
	 ScTgzqIW5m0ydsAXgqoe9L/Zl16PXvgenZ/DdKm7mC71FSYzDi0tpl7iODVl148q14
	 Iig67fXPMMxvlt9FMAI6vPDrEj+0+IkeoULUoAjOlziAaGz88/k0MVvJfr5PhKYnts
	 ulMiDZ+Duk2RLPaaHEXDZgWGzrxy6RmOfETnzW63lEO6F3Fjium89+k1J6RbUDe6Bi
	 glZgZUUFzgoFXu8/8vLMypjN10NcMPxa45glw+2aos+aYOrHTo6NLC+0FDIkA4lhtc
	 wLt5r9U7vgadg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 02/17] powerpc/crash: Fix possible memory leak in
 update_crash_elfcorehdr()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260525084932.934910-3-ruanjinjie@huawei.com>
References: <20260525084932.934910-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 09:22:07 +0000
Message-Id: <20260525092207.96B9D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Missing NULL check on `rmem` before accessing `rmem->nr_ranges=
` causes a NULL pointer dereference in `kexec_extra_fdt_size_ppc64()`.
- [Critical] `__merge_memory_ranges()` incorrectly shrinks overlapping memo=
ry ranges, causing critical memory regions to be lost.
--

commit 4efbfe4b6923f71ffba2342131a0178fa07349c0
Author: Jinjie Ruan <ruanjinjie@huawei.com>

powerpc/crash: Fix possible memory leak in update_crash_elfcorehdr()

This commit fixes a memory leak in update_crash_elfcorehdr() by ensuring
allocated memory from get_crash_memory_ranges() is freed if an error occurs.
It updates the code to jump to the out label to properly free the memory.

> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
> index e6539f213b3d1..a520f851c3a6b 100644
> --- a/arch/powerpc/kexec/crash.c
> +++ b/arch/powerpc/kexec/crash.c
> @@ -502,7 +502,7 @@ static void update_crash_elfcorehdr(struct kimage *im=
age, struct memory_notify *
>  	ret =3D get_crash_memory_ranges(&cmem);
>  	if (ret) {
>  		pr_err("Failed to get crash mem range\n");
> -		return;
> +		goto out;
>  	}
> =20
>  	/*

[Severity: Critical]
This is a pre-existing issue, but does kexec_extra_fdt_size_ppc64()
dereference a NULL pointer if rmem is NULL?

If get_reserved_memory_ranges(&rmem) returns 0 without allocating memory for
rmem (e.g., when there are no matching device tree nodes), rmem remains NULL
when passed to kexec_extra_fdt_size_ppc64():

arch/powerpc/kexec/elf_64.c:elf64_load() {
	...
	ret =3D get_reserved_memory_ranges(&rmem);
	if (ret)
		goto out;

	fdt =3D of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
					   initrd_len, cmdline,
					   kexec_extra_fdt_size_ppc64(image, rmem));
	...
}

Inside kexec_extra_fdt_size_ppc64(), there is no check before accessing
rmem->nr_ranges:

arch/powerpc/kexec/file_load_64.c:kexec_extra_fdt_size_ppc64() {
	...
	/* Consider extra space for reserved memory ranges if any */
	if (rmem->nr_ranges > 0)
		extra_size +=3D (unsigned int)(rmem->nr_ranges * sizeof(u64));
	...
}

Could this lead to a NULL pointer dereference and a kernel panic during
the kexec device tree preparation?


[Severity: Critical]
This isn't a bug introduced by this patch, but does __merge_memory_ranges()
incorrectly shrink overlapping memory ranges?

When merging memory ranges, the code unconditionally assigns ranges[i].end
to ranges[idx].end without using max(), and compares the start against
ranges[i-1].end rather than ranges[idx].end:

arch/powerpc/kexec/ranges.c:__merge_memory_ranges() {
	...
	for (i =3D 1; i < mem_rngs->nr_ranges; i++) {
		if (ranges[i].start <=3D (ranges[i-1].end + 1))
			ranges[idx].end =3D ranges[i].end;
		else {
	...
}

If a smaller memory range is completely subsumed by a larger one, could this
assignment shrink the end boundary of the merged range?

Would this truncate valid memory blocks from the kexec exclude lists,
potentially allowing the new kernel to overwrite the running kernel's memory
and causing data corruption or crashes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525084932.9349=
10-1-ruanjinjie@huawei.com?part=3D2
