Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624D841D120
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010170; cv=none; b=NDXzEZdLRMEfMDWw+FIp7IqXy1Ksa+8eBYKIvys6vdSBaBKK7nhq56eKLgEXmijf/Ew668qmWa5OH56yuLXP0d6DTrxUsLOPwbJaCsAHfDbn/fuXwW/2VIOH/NcnGHt3OnpOw1Vd1+8aZwTrQj38a8LhjKL5Ff27duv0LYi4VYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010170; c=relaxed/simple;
	bh=ZmR8porvAdRb5Wn6N3UsNg06/E7lQoP7vjlvZOvC+KQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ka7jRssQDpTjqpQknbQimVULCUCpDiIvIeZuHGoIdUhudBi8v5dwbESnwM76iaaBXFgH6JpCoHfZnL5cSOc8OniTquVM5ni06JBvxwDLt+NzrKDgsbYEDUurwgc3vjkGWi94PvF9hP2NvhNYpLnfmtLkhUlk7yQgYMQS87If1nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyX2iUie; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyX2iUie"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E131F00A3A;
	Thu,  6 Aug 2026 09:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786010165;
	bh=38DuWsFhptZ9n1O8cP/NhUbkIzkLPlXN0qsuBDssR0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cyX2iUiedbgCAzEUGi3dJamd+jpAuvgRw8TA/9UH4kdLkJCz+J7L/MPoPViSHAE7n
	 vaVCYhk7O2wEdXUauqAmsnFZpvm8PBCT+yMfzAE6V3s1fOHN8JVCTgMaAZi+UEVMUF
	 CDQOT79MITijbUvzlTq5WCe8dS1n1zxXxKFm7nA6p0l/Q6EnzmCxl04qCONVM7VaiT
	 655Ziu71vebfeRuHmYfptTzzD/HjzIg5mfNQ2wTklls/w8Kww+aAjHU7BcT/lCj55N
	 JLshkULH8j9yjc/vbBK7LGHl2xd5GuR+XF/NoX6NR/bJFujEtJi0DOqp+y17qvsLe4
	 8wo7M/4SAkecw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/8] crash_core: fold duplicated memblock arch hooks
 into the weak default
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806093519.2907771-7-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
 <20260806093519.2907771-7-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:56:04 +0000
Message-Id: <20260806095605.21E131F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Leftover unused `#include <linux/memblock.h>` in `arch/riscv/kernel=
/machine_kexec_file.c`.

Pre-existing issues:
- [High] A time-of-check to time-of-use (TOCTOU) race condition in `crash_p=
repare_headers()` allows an out-of-bounds array write and Use-After-Free (U=
AF) during concurrent memory hotplug.
--

--- Patch [6]: [PATCH v5 6/8] crash_core: fold duplicated memblock arch hoo=
ks into the weak default ---
commit 1003e078862f2080b60e5f21352f7989a4d125c2
Author: Wandun Chen <chenwandun@lixiang.com>

crash_core: fold duplicated memblock arch hooks into the weak default

arm64, loongarch and riscv open-code the same memblock walk in
arch_get_system_nr_ranges() and arch_crash_populate_cmem(). Move it into
the __weak defaults in kernel/crash_core.c and delete the arch copies.

> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/m=
achine_kexec_file.c
> index 808e872f40634..fdc6695e85882 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
> @@ -37,32 +37,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *=
image)
>  }
> =20
>  #ifdef CONFIG_CRASH_DUMP

[Severity: Low]
This isn't a bug, but can we also drop the #include <linux/memblock.h>
from arch/riscv/kernel/machine_kexec_file.c?

The patch successfully relocates all memblock usage out of the riscv file,
and the include was correctly dropped for arm64 and loongarch, but it looks
like it was missed here.

> -unsigned int arch_get_system_nr_ranges(void)
> -{

[ ... ]

> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 2b36aa9fade06..77285ae3ce600 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c

[ ... ]

> +int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
> +{
> +	phys_addr_t start, end;
> +	u64 i;
> +
> +	for_each_mem_range(i, &start, &end) {
> +		cmem->ranges[cmem->nr_ranges].start =3D start;
> +		cmem->ranges[cmem->nr_ranges].end =3D end - 1;
> +		cmem->nr_ranges++;
> +	}

[Severity: High]
This is a pre-existing issue, but does this loop risk an out-of-bounds array
write during concurrent memory hotplug?

The loop unconditionally writes to cmem->ranges and increments the index
without verifying bounds against cmem->max_nr_ranges.

In crash_prepare_headers(), the code sequentially counts the regions,
allocates memory, and then calls arch_crash_populate_cmem():

	max_nr_ranges =3D arch_get_system_nr_ranges();
	if (!max_nr_ranges)
		return -ENOMEM;

	cmem =3D alloc_cmem(max_nr_ranges);
	if (!cmem)
		return -ENOMEM;

	ret =3D arch_crash_populate_cmem(cmem);

Since neither kexec_file_load nor these functions hold the memory hotplug
read lock (get_online_mems()), couldn't memblock.memory be modified
concurrently between the check and the use? If regions are added or split,
this loop would write past the allocated array size.

> +	return 0;
> +}
>  int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) { return 0;=
 }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806093519.2907=
771-1-chenwandun1@gmail.com?part=3D6
