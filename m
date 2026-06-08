Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B5D30B51E
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 07:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780905179; cv=none; b=Qd0Syfn64xH4eLgEErOdB5gvL5okodfW5wlg64a/W//t9e5XUd5zO78VHEhxJ7aKFx7ixEc4wPZjGUJ66wevze7jpEUzkmvI88zVeoyakh+PKVMHgaSb+rmoXZ+FOJtf82O26E2/GfkcEnZI0VR7FXm+UZEUhh9RKdTzuYpJXGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780905179; c=relaxed/simple;
	bh=RjC0UvPCvtYRCOYFQtTaOHXAQHKAPBEuna/jz4lBg/g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EAF6+uuWgWTVFU7t+/Iai2p3LTg+s2qTxe3u7Cze23JCN3NhWISTmHy4mdalszLMsqDKTHW+LZUw1jVO+ZmlqaF2Rouue9mMI/rDWHv+rlk37fPMlOMvxBsLJmdi0NiPvSuT2SrxNj4hZRg7JWQAMJGYpktdOdeDD+F45NBpgV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaxkGZNu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaxkGZNu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6D91F00893;
	Mon,  8 Jun 2026 07:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780905178;
	bh=8ffh1L+6LhsILBoTxSrezAEmRxaqILPCsAMEMvKj7uY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BaxkGZNuUwB10kdanH8kHql+ASjrffR0SX1dROIEFjkpKx0b/zYC4wA7sMyY4uCOY
	 lxeXOIHkYk4PQrfd86XPQ4zIgjnYVIm4n9AJ5dAXzAduMwKtrDPVifdmh+ZPdxkRLI
	 VGmP4srAwKhleIDyIFB9ujEK26vznj7yeiRQ8bfvE19onVj7MIt2yAP2B736w2AAol
	 fEjhjAXHNqj8Td24k+xIx6telKU05YuNdL6ypdubmt1IFP5rwcNX2dW6C5wdYI3Bns
	 RMSifmsSYFhoNHP4ZwaVffkCB/J7j86gE9I93kIxO/5y0VfQ4MKTwvCY1f32YfIU0t
	 3X/sJ1u0RB9Xg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 07/10] LoongArch: kexec_file: Use
 crash_prepare_headers() helper to simplify code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608073459.3119290-8-ruanjinjie@huawei.com>
References: <20260608073459.3119290-8-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 07:52:57 +0000
Message-Id: <20260608075258.0F6D91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A time-of-check to time-of-use (TOCTOU) race condition exists betw=
een arch_get_system_nr_ranges() and arch_crash_populate_cmem() against conc=
urrent memory hotplug, potentially causing a buffer overflow or Use-After-F=
ree.
--

commit e15fd7173b2be430036c153dea51e26db1b14d57
Author: Jinjie Ruan <ruanjinjie@huawei.com>

LoongArch: kexec_file: Use crash_prepare_headers() helper to simplify code

This commit replaces prepare_elf_headers() with the generic
crash_prepare_headers() helper to simplify crash memory handling. It implem=
ents
arch_get_system_nr_ranges() to count memory ranges and
arch_crash_populate_cmem() to fill them.

> diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/=
kernel/machine_kexec_file.c
> index 5584b798ba464..5412aa9f35687 100644
> --- a/arch/loongarch/kernel/machine_kexec_file.c
> +++ b/arch/loongarch/kernel/machine_kexec_file.c
[ ... ]
> +int arch_crash_populate_cmem(struct crash_mem *cmem)
> +{
> +	phys_addr_t start, end;
> +	uint64_t i;
> =20
> -	cmem->max_nr_ranges =3D nr_ranges;
> -	cmem->nr_ranges =3D 0;
>  	for_each_mem_range(i, &start, &end) {
>  		cmem->ranges[cmem->nr_ranges].start =3D start;
>  		cmem->ranges[cmem->nr_ranges].end =3D end - 1;
>  		cmem->nr_ranges++;
>  	}

[Severity: High]
This is a pre-existing issue, but is there a risk of a time-of-check to
time-of-use (TOCTOU) race condition here against concurrent memory hotplug?

Because sys_kexec_file_load() acquires kexec_mutex but does not hold memory
hotplug locks (e.g., mem_hotplug_begin()) or cpus_read_lock(), concurrent
memory hotplug events like add_memory_resource() could occur.

The generic crash_prepare_headers() separates counting and population:

kernel/crash_core.c:crash_prepare_headers() {
    ...
    max_nr_ranges =3D arch_get_system_nr_ranges();
    if (!max_nr_ranges)
        return -ENOMEM;
   =20
    cmem =3D alloc_cmem(max_nr_ranges);
    ...
    ret =3D arch_crash_populate_cmem(cmem);
    ...
}

If memblock regions are added dynamically between the time max_nr_ranges is
calculated and the cmem->ranges array is populated in
arch_crash_populate_cmem(), won't the loop above iterate more times than
max_nr_ranges and blindly write out-of-bounds to the flexible ranges array?

Additionally, could a concurrent memblock_add_node() trigger a
memblock_double_array(), which reallocates the regions array and frees the
old one, resulting in a use-after-free while for_each_mem_range() is
traversing it?

> +	return 0;
>  }
> =20
>  /*

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608073459.3119=
290-1-ruanjinjie@huawei.com?part=3D7
