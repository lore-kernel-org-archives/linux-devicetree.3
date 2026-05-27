Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FC02F3C0A
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 04:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779855007; cv=none; b=m4bJ+bSZ/thwDC2kI//nvxMcYvJj9XkxPCpV2Qy/eSUnj7AVOLlTPUIxMPAdEAt2sKa1ObT2rAAyCruvX74GAVhJQduS/Du2DhSgx5Tlw7wCZg02qor2RiGJ7FVwYAxtOnrSpPlF8u+deDoNBqiScG4UFWuT1e0+gvdrxFjrSpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779855007; c=relaxed/simple;
	bh=4tK5hJ35g5rgu4psi8U44gctS8Lj1ewBRLGA7hxATck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a/8vCpEDWATxG7y97l3jZKMT2q0Hcwv12XQO39kt7ujlo9fSX8gAfyUmnweh8S4tHq49s6NxMBK5wbHdFJbskjBpkpDn82I9kN1cmq3khK9wUsizgyFGxKvY4HWWDlWOALoCNeeRLiHCpzHi4zR8A5cOwIx8WUQGkBrITFg6Ycc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g16IA5X6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g16IA5X6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBD41F000E9;
	Wed, 27 May 2026 04:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779855006;
	bh=VpccuFor4/frG4hfZ7Gp5JyVcSK5RnlcH4alqlu472Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g16IA5X62pGMuj6jE/NoYzm9KGCxgLUZEyt06URpqDCkFOo21Bqhxa+LRRv8nYiKp
	 DntCq8rLITvXdHREz1fxWmuAqYxDmS7TNfxfr7fNjKgZBYrX+XpgqJHossNnsNsiPI
	 ltX8Ao7WkPUjGfj85BYetqHpmK4GGjO/309JpBuBe8yx/0eYkjML/1QM0QxmhdOrq+
	 pRR8+5sEBnyWH0VdIf939HP7eqG6xBTcE9wljcVRiz8W7xhT/I8PZnUCYM69uvF8lx
	 BTmBDswEpzp0TUSxgU7hIkVYOMAIlp92V4F9jwFKJqqdTIbxiK3pnAXSVP74EIEPt8
	 g4wCC/iqjEQcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/11] arm64: kdump: exclude non-dumpable reserved
 memory regions from vmcore
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527032917.3385849-10-chenwandun1@gmail.com>
References: <20260527032917.3385849-10-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 04:10:04 +0000
Message-Id: <20260527041005.BDBD41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing TOCTOU and heap buffer overflow in `prepare_elf_heade=
rs()` due to unlocked `memblock` traversal.
--

commit 4cfe0a8d3d6226820c437fa8c78ba7628ef98fd5
Author: Wandun Chen <chenwandun@lixiang.com>

arm64: kdump: exclude non-dumpable reserved memory regions from vmcore

This commit excludes device firmware memory regions reserved via device tre=
e=20
from the vmcore by default, honoring the dumpable flag. It calculates the=20
required array size using of_reserved_mem_kdump_nr_ranges() and filters=20
them via of_reserved_mem_kdump_exclude().

> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/m=
achine_kexec_file.c
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c
[ ... ]
> @@ -51,6 +52,7 @@ static int prepare_elf_headers(void **addr, unsigned lo=
ng *sz)
>  	nr_ranges =3D 2; /* for exclusion of crashkernel region */
>  	for_each_mem_range(i, &start, &end)
>  		nr_ranges++;
> +	nr_ranges +=3D of_reserved_mem_kdump_nr_ranges();
> =20
>  	cmem =3D kmalloc_flex(*cmem, ranges, nr_ranges);

[Severity: High]
This is a pre-existing issue, but could a concurrent memory hotplug event
cause a buffer overflow or use-after-free here?

The prepare_elf_headers() function iterates over memblock.memory locklessly
using for_each_mem_range() to count the memory ranges, and then allocates
the cmem array based on this count before later populating it.

Since ARM64 sets CONFIG_ARCH_KEEP_MEMBLOCK, memory hotplug operations can
dynamically add or remove regions at runtime via memblock_add_node() and
memblock_remove(). While these modifications are protected by
mem_hotplug_begin(), the sys_kexec_file_load() path does not appear to
acquire this lock.

If a hotplug event occurs between the counting loop and the population loop,
might the number of ranges increase and cause an out-of-bounds write past
the end of the allocated cmem->ranges array?

Additionally, can a concurrent hotplug trigger memblock_double_array(),
which reallocates the memblock.memory.regions array and frees the old one,
leading to a use-after-free read during the unlocked iteration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527032917.3385=
849-1-chenwandun1@gmail.com?part=3D9
