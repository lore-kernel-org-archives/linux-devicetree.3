Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1CD3D34AC
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779280497; cv=none; b=gOk6Vj1yaG3Hjvq1S+3icVVyGfMd0pvlBaiu3erZfiGgo+ymlKRlbdkpNytOrSBazw6tVOunxvLE10atgKrkHZeowk+cmTKe+C3qhKYpCbfAI9OIRR+8PYXdcaW9XHwoD7ZWVUskQGe+rNXJIsCO41GPqiJ4ezFJn68wb2F8hWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779280497; c=relaxed/simple;
	bh=jgzI/cmM+sz4pxUrrB8osS4JP7Q1rzzdTUwIxXQPR5A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SGhvYzO+qfvR/7kCdVlAc9CnfBx7U6fVQosnK+IvbQaqDVVpKZWp9ZtjrxHOjnhGEB1Ay1aeNAlKgHWkmbH+VaRx6VQIbds/1Jyhsf695jZnKC/8Zw7F4M77sPPBYhD7A4D1+347bA0l3MLWVvjeawIESEGXG3d4kTyZzrLXMAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hO6VJQxg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hO6VJQxg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442BD1F000E9;
	Wed, 20 May 2026 12:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779280495;
	bh=PFCqgvozvPrbpYyXHN370bgKzdaQhfBgjglyMdLkQSg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hO6VJQxg/oEI+Yzck8OZfLAkNdJpuWxKcuglRrTvlxyo9fOQK+boBj+wmDyrbAMVf
	 eFiALf2N4HXTnsUko57g/YJ2ZKE/Gyv5twbPcGAXmaoiGoTqiU7Y+K69vdsKhZfuTt
	 ArO3F8Fr9nVzLXJFA+pBbhbBp94lJIgeg98SBWAVS6BgMJO21QlmUolgwUvdesfedl
	 5rmkEccESY0CummoQmUPQzI04ZJ4uLI9OcmVdshchP/MW3yQ9TXXGFy+yJYO+6A6WD
	 gYHkrdBgVfAMvQXSfrGCX4Ak7OYRYy4AWD4BtkQkJjTimcfmH+DGVYzAPqVkWJkCgx
	 JoepVUB5VNaJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/8] riscv: kdump: exclude non-dumpable reserved
 memory regions from vmcore
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260520091844.592753-8-chenwandun@lixiang.com>
References: <20260520091844.592753-8-chenwandun@lixiang.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 12:34:54 +0000
Message-Id: <20260520123455.442BD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Accessing freed `__initdata` array `reserved_mem_array` when `/res=
erved-memory` DT node is absent.

Pre-existing issues:
- [High] Out-of-bounds write in `prepare_elf64_ram_headers_callback` due to=
 a Time-of-Check to Time-of-Use (TOCTOU) race condition with memory hotplug.
--

commit 4dec7cc9539d2fdcf926f6b807bb95730aa0a6b5
Author: Wandun Chen <chenwandun1@gmail.com>

riscv: kdump: exclude non-dumpable reserved memory regions from vmcore

This commit applies the same non-dumpable reserved memory filtering to
RISC-V kdump as was done for arm64. It uses of_reserved_mem_kdump_exclude()
to drop flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.

> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/m=
achine_kexec_file.c
> index 54e2d9552e930..c359cf714c791 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
[ ... ]
> @@ -63,6 +64,7 @@ static int prepare_elf_headers(void **addr, unsigned lo=
ng *sz)
> =20
>  	nr_ranges =3D 1; /* For exclusion of crashkernel region */
>  	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);

[Severity: High]
This isn't a bug introduced by this patch, but does this two-pass approach
with walk_system_ram_res() have a Time-of-Check to Time-of-Use (TOCTOU)
race condition with memory hotplug?

Because kexec_file_load does not hold the memory hotplug lock
(get_online_mems()), and memory hotplug operations (add_memory()) do not
block on kexec_mutex (they only try to acquire it in the memory notifier
crash_hotplug_handler, which logs and returns early on contention), a
concurrent memory hot-add can increase the number of RAM ranges between
the counting pass here and the later population pass.

Could this cause the second pass to execute the callback more times than
the allocated size, leading to an out-of-bounds write that corrupts the
heap?

> +	nr_ranges +=3D of_reserved_mem_kdump_nr_ranges();
> =20
>  	cmem =3D kmalloc_flex(*cmem, ranges, nr_ranges);
>  	if (!cmem)
> @@ -76,6 +78,8 @@ static int prepare_elf_headers(void **addr, unsigned lo=
ng *sz)
> =20
>  	/* Exclude crashkernel region */
>  	ret =3D crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
> +	if (!ret)
> +		ret =3D of_reserved_mem_kdump_exclude(cmem);

[Severity: High]
Can these kdump helpers access a freed __initdata array if the
/reserved-memory DT node is absent?

If a Device Tree contains /memreserve/ entries but lacks a
/reserved-memory node, fdt_scan_reserved_mem_late() returns early and
skips calling alloc_reserved_mem_array(). As a result, reserved_mem
continues to point to the statically allocated reserved_mem_array, which is
marked as __initdata and is freed by the kernel at the end of the boot
process.

The newly introduced fdt_reserved_mem_save_memreserve_entries() then
populates this __initdata array with /memreserve/ entries. When
kexec_file_load later calls these kdump helpers, could it read from the
freed __initdata array, resulting in a Use-After-Free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520091844.5927=
53-1-chenwandun@lixiang.com?part=3D7
