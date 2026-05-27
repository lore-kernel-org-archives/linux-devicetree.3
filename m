Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B86A304BDC
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 04:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779855136; cv=none; b=ZZZGFmxR2bUX195h0rM89EoX5znFdfcKkPSJVD7FLtQlF3j02xb+W4N4j087J1DYamL0rMjJQg3UeOxV4rZYNc/EyoWz8TWYJ2lBJX4z6xbnhcnG2EZ59570LxUupFoa1r+GcOZw3HoKelCcTh2JWopi4Zl+O+36lxrd6SW1XCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779855136; c=relaxed/simple;
	bh=z46IMnSieIQBkw7YmjcN5DVlMscmeWoTSHF6qql2chs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tEffvf88CPkMN3K8/bhvMouW2Brpuwwm8wtpzIoJgv4DLQcp1GW0fepPy6LMxgi6gBxFfGwMsz+gOj/NUa1fSp6y/xr022hgo0Z3kjWjQwUT/AcLw/dzdUhjoPrWA1OB/lWZZx6fymsk9LWM2jJzXciJMT26GJPzLAQWhVZbtxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBSIxP5a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBSIxP5a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E990D1F000E9;
	Wed, 27 May 2026 04:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779855135;
	bh=DsjXEDnj9t6PhB3mS0FjjXhTKlmDvq44wsBgiHwnid4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZBSIxP5awyCewOJ60Yu8MJseVFuiRuEGxvmKWWBln2poupcvbgjqydnhksFtf0/K8
	 4F1NEnJq62OD/Rtt3Nori5CO0jNN+7cZpKr1ezPrigXVNBTRuDOusF6OqCEPk2VNpi
	 sIxq+ZYV2DKYD7YvxFQZUTe/1TVr6WOfl4ZziPQg9XGvhTo+N+tv47XUq3IpseVnz7
	 DHZHASqHF/HCExesQICWvUCOW6I1FCfjpqvP+TRotelV6OnqQBpF2F0XTw5DyJmqkr
	 BMKinWk+FCFGmHjR4Rkx7oW2lr8kbqgFcgqpgJiMHhtiv3zQNc+8cveqeuX0CZFarH
	 XiZIiP1tsiqZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/11] loongarch: kdump: exclude non-dumpable
 reserved memory regions from vmcore
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260527032917.3385849-12-chenwandun1@gmail.com>
References: <20260527032917.3385849-12-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 04:12:14 +0000
Message-Id: <20260527041214.E990D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Lockless iteration of memblock regions causes a Time-of-Check to T=
ime-of-Use (TOCTOU) heap buffer overflow and Use-After-Free.
--

commit b3c21375f26da6475c1a19c55f8aa3b310aa8539
Author: Wandun Chen <chenwandun@lixiang.com>
loongarch: kdump: exclude non-dumpable reserved memory regions from vmcore

This commit applies non-dumpable reserved memory filtering to LoongArch kdu=
mp.
It uses of_reserved_mem_kdump_exclude() to drop flagged regions from the
elfcorehdr PT_LOAD segments and sizes the crash_mem array accordingly.

> diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/=
kernel/machine_kexec_file.c
> --- a/arch/loongarch/kernel/machine_kexec_file.c
> +++ b/arch/loongarch/kernel/machine_kexec_file.c
[ ... ]
> @@ -67,6 +68,7 @@ static int prepare_elf_headers(void **addr, unsigned lo=
ng *sz)
>  	nr_ranges =3D 2; /* for exclusion of crashkernel region */
>  	for_each_mem_range(i, &start, &end)
>  		nr_ranges++;
> +	nr_ranges +=3D of_reserved_mem_kdump_nr_ranges();
> =20
>  	cmem =3D kmalloc_flex(*cmem, ranges, nr_ranges);

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for a concurr=
ent
memory hotplug operation to cause a use-after-free or buffer overflow here?

Since prepare_elf_headers() executes in process context during the
kexec_file_load syscall, it iterates over memblock.memory via
for_each_mem_range() without holding get_online_mems() or other memory
hotplug locks.

On LoongArch, CONFIG_ARCH_KEEP_MEMBLOCK is enabled, meaning memblock is not
discarded after boot. Concurrent memory hotplug operations can invoke
add_memory_resource(), which calls memblock_add_node() and subsequently
memblock_double_array(). Since slab_is_available() is true at runtime, this
allocates a new array and calls kfree() on the old memblock.memory.regions
array, which could lead to a use-after-free during the lockless iteration.

Additionally, is there a time-of-check to time-of-use race?

The first loop locklessly counts regions to size the cmem array. If memory =
is
hotplugged between the counting loop and the second population loop, the
second loop will iterate more times than the allocated size.

Without bounds checks before adding entries to cmem->ranges, could this
overflow the kernel heap buffer?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527032917.3385=
849-1-chenwandun1@gmail.com?part=3D11
