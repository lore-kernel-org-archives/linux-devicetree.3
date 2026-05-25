Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ECA1CAA7D
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779704268; cv=none; b=PDv9qHrmPfy8xhdh8EVjriWWbNskXLP8cASv6BvEL19Fg63BOA1xDl+a6d+YlrXU+x2D0L7uOCl/C23A2loFJSHAFZRFxJAAn+C5P5/9SqoEY7giTjJ0YvorSBJTy6+DG/sFssUmeALTV/sKp0bW+I3idikHJGBJ9Cy8jQKrT7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779704268; c=relaxed/simple;
	bh=pePL4qrjgDN56uMV/3M0cb/J14CyFN2xhkZoaCwA9LE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iyPJJ5owBPuAbk7/4hdM4UrflFXDX/eN9V5XDvccLeDa3OiT8k+c5fOtETyySg9AmfpONgwZ5zl2T/UN3TDR7OYly+PsbF+Cr6NLsFszyduCT7g5JtmkasiQ4HAwg1aHXGMvaa7GIlW5/EWSPaEzmBgusDqw6fLtBmZvQYu99Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eiGBThC3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eiGBThC3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9959D1F000E9;
	Mon, 25 May 2026 10:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779704266;
	bh=yzxHWgw0OIOuzfoK/coY/u6fyIykFIRIMRBQN6CaDXE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eiGBThC3/bBkgyvss2zg/9hD1CTf6vaVM5qLTwvs1BKrXreuWA59GESaJ2yTg+Ran
	 QWRGjr5GL+oykfBKkgUqm8rpV2PwPtowN6GpOEBh860eMfxt3brNMMiaoE6h5UUQzv
	 2IK9OANiMpsPFOnwtiGKT8BZlQf1+EfMeu7j9SgRGKXh+gbfrj1DV3UE2oac9UC61O
	 F/FUuC1YEpTJCaw8N8H5oBKDI2ienIyZfXnBOl32qA8WyuaflrN9AIuoBK4GF/zd5h
	 LsIJ/mxoytXvmQaui+ZijdKjZqNfxOFEN8L0u7K3Lnvc0adncQokfR5hlhvMjyBZ5+
	 4nu1uJgjqlZ3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 17/17] arm64/crash: Add crash hotplug support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525084932.934910-18-ruanjinjie@huawei.com>
References: <20260525084932.934910-18-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 10:17:45 +0000
Message-Id: <20260525101746.9959D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Incorrect `kbuf.memsz` calculation in `load_other_segments` when `=
CONFIG_CRASH_HOTPLUG` is enabled leads to memory truncation or kernel hang.
- [High] Erroneous fall-through for CPU hotplug events contradicts document=
ation and leads to data races / use-after-free.
- [High] Using `memcpy_flushcache` on ARM64 without guaranteeing a PoC flus=
h compromises the kdump kernel integrity.
- [Medium] Missing `elfcorehdr_index` initialization allows hijacking of th=
e crash environment via a crafted initrd.
- [Low] The variable `pnum` is unused when `CONFIG_CRASH_HOTPLUG` is disabl=
ed, causing build failures with `-Werror`.

Pre-existing issues:
- [High] Freeing `headers` on `kexec_add_buffer` failure leads to a use-aft=
er-free on retry and a double-free during cleanup.
--

commit 35229a9002089e25646d549d3be6f48c32587974
Author: Jinjie Ruan <ruanjinjie@huawei.com>

arm64/crash: Add crash hotplug support

This commit adds crash hotplug support for ARM64 by implementing the
architecture-specific functions arch_crash_hotplug_support(),
arch_crash_get_elfcorehdr_size(), and arch_crash_handle_hotplug_event(). It
primarily handles memory add/remove events to update the elfcorehdr,
reflecting the current memory layout without needing to reload the entire
kdump image.

Link: https://lore.kernel.org/all/20240529133446.28446-1-Jonathan.Cameron@h=
uawei.com/
Link: https://lore.kernel.org/all/20260328074013.3589544-1-ruanjinjie@huawe=
i.com/

> diff --git a/arch/arm64/kernel/crash.c b/arch/arm64/kernel/crash.c
> new file mode 100644
> index 0000000000000..2114375820da9
> --- /dev/null
> +++ b/arch/arm64/kernel/crash.c

[ ... ]

> +static void update_crash_elfcorehdr(struct kimage *image)
> +{
> +	void *elfbuf =3D NULL, *old_elfcorehdr;
> +	unsigned long mem, memsz;
> +	unsigned long elfsz =3D 0;

[ ... ]

> +	/*
> +	 * Temporarily invalidate the crash image while the
> +	 * elfcorehdr is updated.
> +	 */
> +	xchg(&kexec_crash_image, NULL);
> +	memcpy_flushcache(old_elfcorehdr, elfbuf, elfsz);

[Severity: High]
Is it guaranteed that these caches are flushed to the Point of Coherency? On
ARM64, if CONFIG_ARM64_PMEM is disabled, CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE
is also disabled, causing memcpy_flushcache() to silently fall back to a
standard memcpy() without flushing caches.

Since the kdump kernel boots initially with the MMU and data caches
disabled, could the kdump kernel read stale or garbage data directly from
physical RAM instead of the newly updated elfcorehdr?

> +	xchg(&kexec_crash_image, image);
> +	pr_debug("updated elfcorehdr\n");
> +
> +out:
> +	vfree(elfbuf);
> +}
> +
> +/**
> + * arch_crash_handle_hotplug_event() - Handle hotplug elfcorehdr changes
> + * @image: a pointer to kexec_crash_image
> + * @arg: struct memory_notify handler for memory hotplug case and
> + *       NULL for CPU hotplug case.
> + *
> + * Update the kdump image based on the type of hotplug event:
> + * - CPU add and remove: No action is needed.
> + * - Memory add/remove: Update the elfcorehdr to reflect the current mem=
ory layout.
> + *
> + * Prepare the new elfcorehdr and replace the existing elfcorehdr.
> + */
> +void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
> +{
> +	switch (image->hp_action) {
> +	case KEXEC_CRASH_HP_ADD_CPU:
> +		fallthrough;
> +	case KEXEC_CRASH_HP_REMOVE_CPU:
> +		if (image->file_mode || image->elfcorehdr_updated)
> +			return;
> +		fallthrough;

[Severity: High]
Can this fall-through to the memory hotplug handler cause a data race? The
commit message states that CPU hotplug events require no action on ARM64.

If the CPU cases fall through to update_crash_elfcorehdr(), it will iterate
over memblock.memory.regions. Since CPU hotplug notifiers might not hold the
required locks to protect against concurrent memory hotplug operations,
could this iteration run concurrently with physical memory operations and
lead to a use-after-free?

> +	case KEXEC_CRASH_HP_ADD_MEMORY:
> +	case KEXEC_CRASH_HP_REMOVE_MEMORY:
> +		update_crash_elfcorehdr(image);
> +		return;
> +	default:
> +		pr_warn_once("Unknown hotplug action\n");
> +	}
> +}
> +#endif /* CONFIG_CRASH_HOTPLUG */

> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/m=
achine_kexec_file.c
> index d2985ce623062..781febd0f6db1 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c
> @@ -82,10 +82,11 @@ int load_other_segments(struct kimage *image,
>  			char *cmdline, void *headers,
>  			unsigned long headers_sz)
>  {
> -	struct kexec_buf kbuf =3D {};
> -	void *dtb =3D NULL;
>  	unsigned long initrd_load_addr =3D 0, dtb_len,
>  		      orig_segments =3D image->nr_segments;
> +	struct kexec_buf kbuf =3D {};
> +	unsigned long pnum =3D 0;

[Severity: Low]
Does this cause a compiler warning when CONFIG_CRASH_HOTPLUG is disabled?
The pnum variable is declared unconditionally here but only used inside an
ifdef CONFIG_CRASH_HOTPLUG block, which might trigger a -Wunused-variable
warning.

> +	void *dtb =3D NULL;
>  	int ret =3D 0;
> =20
>  	kbuf.image =3D image;

[ ... ]

> @@ -98,6 +99,23 @@ int load_other_segments(struct kimage *image,
>  		kbuf.bufsz =3D headers_sz;
>  		kbuf.mem =3D KEXEC_BUF_MEM_UNKNOWN;
>  		kbuf.memsz =3D headers_sz;
> +
> +#ifdef CONFIG_CRASH_HOTPLUG
> +		/*
> +		 * The elfcorehdr segment size accounts for VMCOREINFO, kernel_map
> +		 * maximum CPUs and maximum memory ranges.
> +		 */
> +		if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
> +			pnum =3D 2 + num_possible_cpus() + CONFIG_CRASH_MAX_MEMORY_RANGES;
> +		else
> +			pnum +=3D 2 + num_possible_cpus();
> +
> +		if (pnum < (unsigned long)PN_XNUM)
> +			kbuf.memsz =3D pnum * sizeof(Elf64_Phdr) + sizeof(Elf64_Ehdr);

[Severity: High]
Could this calculation cause an integer underflow later? If
CONFIG_MEMORY_HOTPLUG is disabled, pnum only accounts for CPU headers and
VMCOREINFO. This calculation ignores the existing size of the core headers
(headers_sz) which contains the boot memory ranges.

If headers_sz exceeds kbuf.memsz even after alignment,
kexec_calculate_store_digests() might underflow when calculating the null
padding size:

    nullsz =3D ksegment->memsz - ksegment->bufsz;

Would it be safer to ensure kbuf.memsz is at least as large as the original
headers_sz?

> +		else
> +			pr_err("number of Phdrs %lu exceeds max\n", pnum);
> +#endif
> +
>  		kbuf.buf_align =3D SZ_64K; /* largest supported page size */
>  		kbuf.buf_max =3D ULONG_MAX;
>  		kbuf.top_down =3D true;
> @@ -108,6 +126,7 @@ int load_other_segments(struct kimage *image,
>  			goto out_err;
>  		}

[Severity: Medium]
Is the elfcorehdr_index missing from this segment initialization? Without
explicitly setting image->elfcorehdr_index here, generic hotplug code in
crash_handle_hotplug_event() falls back to scanning all segments for the
ELFMAG signature and uses the index of the last matching segment.

Because ARM64 loads the initrd after the elfcorehdr, could a user supply a
crafted initrd starting with the ELF magic bytes to hijack the
elfcorehdr_index? Upon a hotplug event, the new elfcorehdr might overwrite
the initrd's physical memory instead.

[Severity: High]
This isn't a bug introduced by this patch, but does freeing headers in the
goto out_err path lead to a use-after-free?

fs/btrfs/send.c:load_other_segments() {
    ...
    ret =3D kexec_add_buffer(&kbuf);
    if (ret) {
        vfree(headers);
        goto out_err;
    }
    ...
}

The caller image_load() handles failure by adjusting boundaries and retrying
load_other_segments() in a while loop, passing the freed headers pointer
again.

If it succeeds on retry, the kexec segment would store a freed pointer.
Also, since image->elf_headers is assigned to headers prior to this
function, could this cause a double-free on ultimate failure when
arch_kimage_file_post_load_cleanup() executes?

>  		image->elf_load_addr =3D kbuf.mem;
> +		image->elf_headers_sz =3D kbuf.memsz;
> =20
>  		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=3D0x%lx memsz=3D0=
x%lx\n",
>  			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525084932.9349=
10-1-ruanjinjie@huawei.com?part=3D17
