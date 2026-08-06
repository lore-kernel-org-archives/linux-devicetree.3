Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B933543D4F8
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011896; cv=none; b=Fs6B3Aowu8Ru0guPymcXdDRUuXpsdeYJNAY9hQWISqxAc0OPPCZX2QhGieJV7YkwzI7bCgbPVuzzMFnS7w/agEKzQnTxV6NRdQynkyCGJn35GQTLFGipqPApJLjxlgzLxbi/bHn9W8WHpQVgFhC9Z8kuZIuotyh+Wu691xBkBII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011896; c=relaxed/simple;
	bh=vpTCDFi5vEGLwSba4kUkjHr/7Q9mwV3W0gDOxkSIgrE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XVA2u+oWGKSY/pNqsA4SZts6On0k/0yshSLDgowUsa/dbS5Fx6xRxEMw/E+LgGBfPKE+axdiKiTq2uIUs1f77DGZ1mM241P+p0OhGRm61snDLEIumAGQ/oyCQWKca8pZoE5AjaKA1Gm7M8oA1afOLJbgqnYt41s9y8g+h82ePVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+RGv8iv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+RGv8iv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE191F000E9;
	Thu,  6 Aug 2026 10:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786011894;
	bh=Pkd4YyogPOoyZ9v4z+C4B68WNRh9P+U+f54RbnUb5Y8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i+RGv8ivr3nH15Tv3uJ7UZc62pCb0kDexONf8476DsKCQP/NJA953pbpKI5TSvmdH
	 +rypUsdzqtp0NoIWwM08rrzXjZUZ7hgoewvYIcAiYsu/+YTSwa4wtH2zGfkA60v6VA
	 991FVjR71UNX1gvRVDK84oYz4el8xBpF44F9Byp6g0HpJcTQYsiIHIumNViH4qXkyp
	 4egPVOkpZDUp357bikKJVXMO2Ws/yzANWSINIBMyu8GymwMTTfkU1+FSTTN8Umr0Ja
	 gkqSoEMBSHHMMyU+wlvWFBWKFsUiNIarojE9IAy7/Hk6wQcARHYvCbBJLz4zVzrUXu
	 hFSwunF63nuqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 8/8] crash_core: skip MEMBLOCK_NODUMP regions when
 building vmcore ELF header
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806093519.2907771-9-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
 <20260806093519.2907771-9-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 10:24:53 +0000
Message-Id: <20260806102454.1BE191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Lockless iteration over memblock regions without bounds checks can=
 lead to Use-After-Free and Heap Buffer Overflow during concurrent memory h=
otplug.
--

--- Patch [8]: [PATCH v5 8/8] crash_core: skip MEMBLOCK_NODUMP regions when=
 building vmcore ELF header ---
commit 7fdffadebf6d8803dc1491f6f55262a163ba9f05
Author: Wandun Chen <chenwandun@lixiang.com>

crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index fb78b7814f188..8cc9d666bc541 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -269,10 +269,10 @@ int crash_prepare_elf64_headers(struct crash_mem *m=
em, int need_kernel_map,
>  	return 0;
>  }
> =20
> -/* Exclude NOMAP regions from the vmcore. */
> +/* Exclude NOMAP and NODUMP regions from the vmcore. */
>  static bool crash_should_skip_region(struct memblock_region *reg)
>  {
> -	return memblock_is_nomap(reg);
> +	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to call this
function during a lockless memblock iteration?

The caller arch_get_system_nr_ranges() uses for_each_mem_region(reg) without
taking locks. If a privileged user initiates memory hotplug concurrently
while loading a crash kernel, memblock_add_node() could trigger
memblock_double_array(), which reallocates and frees the
memblock.memory.regions array mid-iteration.

Could this result in a use-after-free on the memblock array?

kernel/crash_core.c:arch_get_system_nr_ranges() {
	...
	for_each_mem_region(reg) {
		if (crash_should_skip_region(reg))
			continue;
		nr_ranges++;
	}
	...
}

Additionally, there appears to be a time-of-check to time-of-use window
in crash_prepare_headers() between sizing and populating. If memory is
hot-added during this window, the second iteration could encounter more
regions than originally counted:

kernel/crash_core.c:crash_prepare_headers() {
	...
	max_nr_ranges =3D arch_get_system_nr_ranges();
	if (!max_nr_ranges)
		return -ENOMEM;

	cmem =3D alloc_cmem(max_nr_ranges);
	...
	ret =3D arch_crash_populate_cmem(cmem);
	...
}

Because arch_crash_populate_cmem() writes to cmem->ranges without bounds
checking, could this race cause a heap buffer overflow on the cmem->ranges
array?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806093519.2907=
771-1-chenwandun1@gmail.com?part=3D8
