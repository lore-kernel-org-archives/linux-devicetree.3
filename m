Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD80F3B71A9
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727097; cv=none; b=fg//nUXJ/ISfp69rAhSgv0HRVVTjrGXHjOP02FE7wPblhDd6vGtzuBNvEIZ6oTa089+CxXxaOKI1CSge4LcMzl4exS8hKPZZculfYc7HP+sVVlXTJXtQMgSuSzgAx05idzrAPlvwhtGCTqvd6Q7e/6kQGXCOuKiowGckqq/L3c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727097; c=relaxed/simple;
	bh=Jw2UNO7uFXqogtZg+nC9TF+iSrrJ/t03lCJXxAAWrmU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GvI4VFyKAaGw0TRPr6MgzDYX2cl/dVuE7rUpZAM1JANE12pvSoh+7G596M+WETKggJPv9QMNdcIx0hsyrjkYc4zOZMHulU6GpmOqYkSjXeUh5heer0/xF34XcXwif48JvHkh331AXtfdoMH6oNqHNfQeZZ3IZwYjuED6ff6moFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4RLHtRK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4RLHtRK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024021F000E9;
	Mon, 29 Jun 2026 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782727096;
	bh=wmMybmRo3anWAcyjcmE8QOSAt15RWAB1QkpEKbtQDco=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U4RLHtRKYpfteRPIseqWHDA6xS2rM8UN6KiAyarMZMstCjBVU/u2ebP0VIOPhsI/T
	 TLwIt+Jn2jT2tx7XSOEiKQnIVtE73lp68B3s9RzC4lqdaCH8Xv3ovDt1Xgt4MgBQ1J
	 3LoVvOxOb//h1KuzqwjiBGQGHqsf2jD15IcXiQ88Y5inuKyLEzhECQaVE71Vm4iNwv
	 g57oiyxa1kaTRo82INXa+/C3qTGq5mm6psbXdlgk24iQz2KvOHfHDsUT37gR/k9vpW
	 BaxchFgwApA46G4+XmqpHHQg57duVMPIIZqOdQ/d4sFYc8SSG1sbIxl/T071rxqiQ8
	 Bdmewr+V8pYCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 01/10] riscv: kexec_file: Fix crashk_low_res not
 exclude bug
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260629094746.191843-2-ruanjinjie@huawei.com>
References: <20260629094746.191843-1-ruanjinjie@huawei.com>
 <20260629094746.191843-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 09:58:15 +0000
Message-Id: <20260629095816.024021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition between cou=
nting system RAM ranges and populating them can lead to a heap buffer overf=
low in `prepare_elf64_ram_headers_callback()`.
--

commit d55f858d6c28d0bc9c6e0e425332f4e2b5fea19b
Author: Jinjie Ruan <ruanjinjie@huawei.com>

riscv: kexec_file: Fix crashk_low_res not exclude bug

This commit fixes a bug in the riscv kdump implementation where the
crashk_low_res reserved ranges were not excluded from the crash kernel
memory. It updates the number of reserved ranges and excludes the
low memory range to prevent it from being exported through /proc/vmcore.

Link: https://github.com/chenjh005/kexec-tools/tree/build-test-riscv-v2
Link: https://lore.kernel.org/all/20230726175000.2536220-1-chenjiahao16@hua=
wei.com/

> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/m=
achine_kexec_file.c
> index 54e2d9552e930..3f7766057cac3 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
> @@ -61,7 +61,7 @@ static int prepare_elf_headers(void **addr, unsigned lo=
ng *sz)
>  	unsigned int nr_ranges;
>  	int ret;
> =20
> -	nr_ranges =3D 1; /* For exclusion of crashkernel region */
> +	nr_ranges =3D 2; /* For exclusion of crashkernel region */
>  	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
> =20
>  	cmem =3D kmalloc_flex(*cmem, ranges, nr_ranges);

[Severity: High]
This is a pre-existing issue, but what happens if memory is hot-added
concurrently between the first and second calls to walk_system_ram_res()
in prepare_elf_headers()?

If the number of RAM ranges increases after the first walk computes the
allocation size, the second walk will invoke
prepare_elf64_ram_headers_callback() more times than the allocated capacity.

Looking at prepare_elf64_ram_headers_callback(), there is no bounds check
against cmem->max_nr_ranges:

static int prepare_elf64_ram_headers_callback(struct resource *res, void *a=
rg)
{
        struct crash_mem *cmem =3D arg;

        cmem->ranges[cmem->nr_ranges].start =3D res->start;
        cmem->ranges[cmem->nr_ranges].end =3D res->end;
        cmem->nr_ranges++;

        return 0;
}

Could this cause a heap buffer overflow if the number of new regions exceeds
the padding reserved for exclusion ranges?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629094746.1918=
43-1-ruanjinjie@huawei.com?part=3D1
