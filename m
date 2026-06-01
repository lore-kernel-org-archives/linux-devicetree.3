Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E0939656C
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 10:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780311436; cv=none; b=XbX5YHlBAWqEoy1/NPUsWVWB4K0Zrr4OUk+SWS6zi1KQRnTbcSVzBgANlBF+50PcsAmATGvpXhL7oOG8ndnQnaDSsb9Sm57UtUxaeTVLe9sWJJHFYPFd3U0mGlbue5v0xIFXiFF6NH8W4Lt8CIg868AI4oaS9eBMNspS7OA7qo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780311436; c=relaxed/simple;
	bh=I+veZGOX1eKE/vtdrJly23HYs7s3UJy01nQWBG7DmIc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LRz8/kQv/r3nhrCQ4gpZ4WCT9Fic640linW9is0PMomr5D2Ptl1o87HtgiZN47WUZR0++CRZPX7MV30+sLikukDp7T3Gv2LPJTpzwahARpTFGaVpU1LoZ90euiWSTox5GYfpZpFzUnBXr4SCBGlYJRRrzy3Vwu4NF//1SWcHcsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9vl0aze; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9vl0aze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4581F00893;
	Mon,  1 Jun 2026 10:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780311434;
	bh=Et+6hxxbuX6vGzVQg/R9H1E74GykC/F8CZSPCPGjSSA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K9vl0azeiA8etBDoW8f1FYx4BapOvp1A1GWQzIGjFTUsJhmf2BDyzuMNCl2yi2wfg
	 qh7RgZZZLWtGkqrVCS0MCZugOWWcJ0dafmtgI11VXXtG+JvkVcsSHDBqbyYIq5xrAE
	 fJ3DmeKDRmC2J4wzoo3m4C4wBUnJGw2h/Opga0kg/OJdtKgveSIo7zM+ZypgrcZQnm
	 XrcbdThycVwoDHpZ2RYcri9qCmgUKVsSaXKjTgaUULuSPy5uSB/iIjoV1kjDiOSTN5
	 U/l1akd/kSCijqYPjv6PkeRQ9Dp4n9814sWrtQb6WVyvsiBnmXMjIlEiKZatlFtnfp
	 hLW2yJC3YsFgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 15/23] crash: Add crash_prepare_headers() to exclude
 crash kernel memory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260601094805.2928614-16-ruanjinjie@huawei.com>
References: <20260601094805.2928614-16-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 10:57:13 +0000
Message-Id: <20260601105714.8B4581F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Lockless traversal of memblock regions during kexec_file_load race=
s with memory hotplug, leading to Use-After-Free.
--

commit 4f0896f6bb8685cdb345e9a9e54c301abdd1086a
Author: Jinjie Ruan <ruanjinjie@huawei.com>

crash: Add crash_prepare_headers() to exclude crash kernel memory

This commit introduces crash_prepare_headers() to consolidate memory alloca=
tion=20
and crash kernel exclusion logic across architectures. It adds three weak=20
architecture-specific callbacks to handle counting, populating, and excludi=
ng=20
crash memory ranges.

> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 4f21fc3b108b8..481babc291310 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c

[ ... ]

> @@ -272,6 +269,85 @@ int crash_prepare_elf64_headers(struct crash_mem *me=
m, int need_kernel_map,
>  	return 0;
>  }
> =20

[ ... ]

> +int crash_prepare_headers(int need_kernel_map, void **addr, unsigned lon=
g *sz,
> +			  unsigned long *nr_mem_ranges)
> +{
> +	unsigned int max_nr_ranges;
> +	struct crash_mem *cmem;
> +	int ret;
> +
> +	max_nr_ranges =3D arch_get_system_nr_ranges();

[Severity: High]
This is a pre-existing issue, but can this lockless architecture callback
trigger a Use-After-Free during concurrent memory hotplug?

In the kexec_file_load() path, we don't seem to hold mem_hotplug_lock
(via get_online_mems()). When architectures implement arch_get_system_nr_ra=
nges()
they typically iterate over memblock.memory.regions locklessly:

arch_get_system_nr_ranges() {
    ...
    for_each_mem_range(i, &start, &end)
        nr_ranges++;
    ...
}

If a concurrent memory hotplug operation calls add_memory_resource() and
the memblock regions array is full, memblock_double_array() will allocate a
new array and free the old array via kfree().=20

Does this allow the lockless kexec iteration to dereference a freed regions=
=20
array, crashing the system when concurrently hot-plugging memory and loadin=
g=20
a kexec crash kernel?

> +	if (!max_nr_ranges)
> +		return -ENOMEM;
> +
> +	cmem =3D alloc_cmem(max_nr_ranges);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601094805.2928=
614-1-ruanjinjie@huawei.com?part=3D15
