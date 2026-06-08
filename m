Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4294394498
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 07:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904892; cv=none; b=EiqiWWruCZs/WIt0Ph5SJ0hQvsdblEksnV4083L49D6XFD30C99asz56zb4AaZchvRTiOCnagBFEUW9Eg2oqG+hcI5oJlv2APvles46oCF90dKKqVAI6HEYtGxk2RRTv/H2/hl54fQbTX75P+tT8ALhD/aKuX2FrTcih2k1raVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904892; c=relaxed/simple;
	bh=WCvtDmOoiGwf1VBMJ88tMUrd9bV2I8M3srg1/9+hG5Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SvHToUyJ+BdCPfp2isFYbPgCUYJIisbonbvw9DKRxDxUpoVPb1E2gkb2c2sIkG+b8jeNg3LWlao7L0yVcGghLGMU4jS/wj5LwSHkSoD9k1MzVC9aEBVgJwDvN5au4pPTDL8LTYgWG25fCgjczUvv/Zn0Z/yi7icnTT41oLXsg84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfgnBiPC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfgnBiPC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4201F00893;
	Mon,  8 Jun 2026 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780904890;
	bh=R/W/LYWFRiCN2RriJCp/9sA6sLnXpSZKRmbDWDk1Kv0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CfgnBiPC6kmNxoZF6tu5l9RURz7Ig0k1XEV0OgV3acDmu39nvFQdnnAaCDbRo8ssv
	 cWlqFTjIDd84HRvawdF+Xdyke24L5X2jLR4G6u7evX5DEQ5SUzLscuYkHo18LoHbv1
	 Yo/Gj0cbuES8gTkAzJOFt1ixEjwfGVkukDPr1LjmWzsNj9czt/YmtE0U6iyIrlcn9x
	 xaU14/TCCjwFcR4z8ZTtWMd80f6q70F4rOoD8uOP+RKRwI6ONyPvl1uevC/Tz4rak7
	 Cqgc2OsPqdBL/bYf8YJYRK1jgl1bDpgYi0HlBFQiivefj7tBiUACDcLpxpxOo2v4GE
	 OFVHl9PIN56ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 01/10] riscv: kexec_file: Fix crashk_low_res not
 exclude bug
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260608073459.3119290-2-ruanjinjie@huawei.com>
References: <20260608073459.3119290-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 07:48:09 +0000
Message-Id: <20260608074809.EE4201F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition in `crash_p=
repare_headers()` and `arch_crash_populate_cmem()` can lead to an out-of-bo=
unds array write (Heap Buffer Overflow) if system RAM resources are hotplug=
ged concurrently.
--

commit d18db7747e63171595f6e6caa523eb4a8bcc5bc5
Author: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: riscv: kexec_file: Fix crashk_low_res not exclude bug

This commit ensures the "crashk_low_res" reserved ranges are excluded
from the crash kernel memory in RISC-V kexec_file to prevent them from
being exported through /proc/vmcore. It adds the necessary exclusion
logic and an extra crash_mem range.

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
This is a pre-existing issue, but could this multi-pass allocation pattern
lead to an out-of-bounds array write if system RAM resources are hotplugged
concurrently?

Looking at the refactored logic in kernel/crash_core.c and the callbacks in
arch/riscv/kernel/machine_kexec_file.c, there appears to be a Time-of-Check
to Time-of-Use (TOCTOU) gap:

crash_prepare_headers()
   arch_get_system_nr_ranges()
       /* First walk: calculates max_nr_ranges */
   cmem =3D alloc_cmem(max_nr_ranges)
   arch_crash_populate_cmem(cmem)
       /* Second walk: populates cmem */

Since neither the global resource_lock nor device_hotplug_lock is held acro=
ss
both passes, a concurrent memory hotplug event (e.g., add_memory()) could
insert new RAM ranges into iomem_resource between the two passes.

If the second pass encounters more ranges than originally allocated,
prepare_elf64_ram_headers_callback() writes directly to the array and
increments the counter:

    cmem->ranges[cmem->nr_ranges].start =3D res->start;
    cmem->ranges[cmem->nr_ranges].end =3D res->end;
    cmem->nr_ranges++;

Does this code need a bounds check against cmem->max_nr_ranges in the
callback to prevent a heap buffer overflow in the cmem->ranges array?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608073459.3119=
290-1-ruanjinjie@huawei.com?part=3D1
