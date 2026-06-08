Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1C73101D4
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 07:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905262; cv=none; b=uAAUR+cT7gEt9+y0jqjAzR9yGsZiVxaNbe/xFpzVAEzWbtsYb0GvkG/lNYlYh4ao2gJ4mfdub0gYASvJ6YvVG4v4E7yvlSw5BEwhviJTXdczGm8GaQOQe86TwwSbSX6RmhssWaIyXvK9IiZRDGozySmAMTkgnvbw4idfqqtFi+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905262; c=relaxed/simple;
	bh=1TBbE154d7n6vJz2xt2Zd43U+H5MBxTvz8QxmTXZeNo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KHtNcSekx2yB7jaSZtmC7IF/hFWFyWwmbTip8mQIv2H3yAhXlXHK6b6eo5guDFuHhJt3dNlHgzxWWInXP5viu8XuT6AI+9hD7PFBDZG9iScL5c2evFtLE9J2HAC/l7fV/A1NXO7I4UZEj95sOoKMTrL7ZDuJi2C1sUXfuoeEZ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3w0AFvZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3w0AFvZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5871F00893;
	Mon,  8 Jun 2026 07:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780905261;
	bh=SLoG+vZ6qQr+aKJX0NhBBf6Rn8OeKTA6fft+3Qish6o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f3w0AFvZhqhUEOXsxl/7tZzGasNN3N0ScX//pWnlrjE2KH1TNwzkuzSdSm9+J1iW7
	 vd+n4pf/rPZdle5PfrB5MXPlC+FEp8NGkgOFNvn8gAbmlKRf/gNedMtUg2L1b9DMpK
	 Wjx9RMiFc6hZBiEUg/VEpnwTQYj1lu5cR7acU8KHo377dnJdLya6Ra3YzwQWa0l2G3
	 g0yjBleLOtgpOHDtN4akeqfUTryKNOJIRzdqPwSYH+IkIChJ3MM9sbzSuSc1cWLzjC
	 KWhThJkLcZSoGqoedXodw7AeW0v56MxaBpfGn7Q5rKvMcMPllN8Tfl1ZFkeNlKcECn
	 WLKDekqdfgbkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 06/10] riscv: kexec_file: Use
 crash_prepare_headers() helper to simplify code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608073459.3119290-7-ruanjinjie@huawei.com>
References: <20260608073459.3119290-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 07:54:20 +0000
Message-Id: <20260608075420.8C5871F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition in kexec se=
gment preparation can cause a heap buffer overflow if memory hotplug occurs.
--

commit b23452d9853c692b4f51771e551dbfc49512243d
Author: Jinjie Ruan <ruanjinjie@huawei.com>

riscv: kexec_file: Use crash_prepare_headers() helper to simplify code

This patch simplifies the kexec_file code for RISC-V by using the newly
introduced crash_prepare_headers() helper. It replaces the architecture
specific prepare_elf_headers() with arch_get_system_nr_ranges() and
arch_crash_populate_cmem() to reduce code duplication.

> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/m=
achine_kexec_file.c
> index 3f7766057cac3..439cbc50dfa69 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
[ ... ]
> @@ -55,41 +64,9 @@ static int prepare_elf64_ram_headers_callback(struct r=
esource *res, void *arg)
>  	return 0;
>  }
> =20
> -static int prepare_elf_headers(void **addr, unsigned long *sz)
> +int arch_crash_populate_cmem(struct crash_mem *cmem)
>  {
> -	struct crash_mem *cmem;
> -	unsigned int nr_ranges;
> -	int ret;
> -
> -	nr_ranges =3D 2; /* For exclusion of crashkernel region */
> -	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
> -
> -	cmem =3D kmalloc_flex(*cmem, ranges, nr_ranges);
> -	if (!cmem)
> -		return -ENOMEM;
> -
> -	cmem->max_nr_ranges =3D nr_ranges;
> -	cmem->nr_ranges =3D 0;
> -	ret =3D walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_call=
back);
> -	if (ret)
> -		goto out;
> -
[ ... ]
> +	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callb=
ack);
>  }

[Severity: High]
This is a pre-existing issue, but can this code suffer from a Time-of-Check
to Time-of-Use race condition during memory hotplug?

The crash_prepare_headers() helper in kernel/crash_core.c uses a lockless
two-pass sequence:

kernel/crash_core.c:crash_prepare_headers() {
    ...
    max_nr_ranges =3D arch_get_system_nr_ranges();
    ...
    cmem =3D alloc_cmem(max_nr_ranges);
    ...
    ret =3D arch_crash_populate_cmem(cmem);
    ...
}

Since the kexec syscall does not hold mem_hotplug_lock or use
get_online_mems(), could a concurrent memory hotplug event call add_memory()
and insert a new resource into the system RAM resource tree between the two
passes?

If that happens, the second walk_system_ram_res() pass in
arch_crash_populate_cmem() would encounter the newly inserted memory range.
This would cause it to execute prepare_elf64_ram_headers_callback() more
times than initially counted.

Because prepare_elf64_ram_headers_callback() unconditionally writes to
cmem->ranges[cmem->nr_ranges] without verifying that
cmem->nr_ranges < cmem->max_nr_ranges, would this result in an out-of-bounds
write that corrupts adjacent heap memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608073459.3119=
290-1-ruanjinjie@huawei.com?part=3D6
