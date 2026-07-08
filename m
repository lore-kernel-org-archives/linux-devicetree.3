Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FAF3D9050
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496291; cv=none; b=u6N0Lpvr+mJL0ovCE6Swt7qfclPRHclo1bmFcdhumDBCP9eWbkdo22O6h4Fx3Z/75Ow+cKqwJoRIb6v/ieBDJ4y6hcs+QCooMLRR9E3WtEZYS3RhK0ZIuUA6KfMstKnQeUhffg5zaQR4MxoPPa32dfPB/VpFEMwL5e5SIlm2Bs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496291; c=relaxed/simple;
	bh=pgDqUuptdif89H1QIYT3m0ahfN303UZHVcWYSy6bMsg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N9xa6RUSYWlKQXiCtHxQ4IgmBDEa7SCSvjiWAxeJsPJA/GuXkQi8rAx1JgY47rBMBFTlsGCsebxOLpc+i/uOSNUtl9wikes17l2j9JT46C0/NgwruEeJlLKE0Vs8fFbIpW0C5PGEEJ0KvY4qSn+fM1uh2E9H1/oxsAnpnPUiUcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRZ1CAaD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRZ1CAaD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED0C1F000E9;
	Wed,  8 Jul 2026 07:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783496276;
	bh=nbwXZjW7Og0ewMuBjHd5t9R+UGN33bfoKQ0NQ++Be/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dRZ1CAaD9UGNHy70E9GHmupHfNOxqEH8py8cqv3KbfHeSUkeNJ0AV92zFWb8FdB4f
	 todfeSYKPEr8Tfqf6P/avc1wS2sTiPNGcPU4lJAMD9T21IjMLBwdtB7E0qIKwciUVu
	 F0soFgjyf8dbCc9eyiFZCnbcwyEzHDTo8R8rBHW/XCa/AawYLwzfiJ26sNggjO0b0M
	 OTcT+MF1FkAI508HU1fsm8hUOBjk5v6ui8KuWWmL4yC133lMjEjb51Bfg701qji/Qz
	 wWJlWikWmsAn8S3JsZ0TktG13OgCeLR0xX94uDsB6GkRzYO3wx9IG5DmEH+dlkhbJi
	 qtcGdp/fy6bNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 26/26] meminspect: Add debug kinfo compatible driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260708070809.2660886-1-mukesh.ojha@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708070809.2660886-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:37:55 +0000
Message-Id: <20260708073755.DED0C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing `return` statements after `dev_err_probe()` calls cause th=
e driver to ignore size and base validations, leading to buffer overflows.
- [High] The driver attempts to use `rmem->priv` as a virtual address point=
er, but it is never mapped or populated for this compatible string.
- [High] The driver uses `__pa()` instead of `__pa_symbol()` for statically=
 allocated kernel symbols, which is invalid on architectures where kernel t=
ext/data is not in the linear map.
- [Medium] The shared memory checksum is updated non-atomically, exposing a=
n intermediate, invalid state to concurrent external readers.
- [Low] Unconditional access to conditionally compiled `struct module` memb=
ers causes build failures.
--

--- Patch [26]: [PATCH v3 26/26] meminspect: Add debug kinfo compatible dri=
ver ---
commit 8eff82a7a3c1597f04d6cc3418d6d9376460f4fc
Author: Eugen Hristev <ehristev@kernel.org>

meminspect: Add debug kinfo compatible driver

This commit adds a driver that copies registered memory regions to a shared
memory zone supplied via OF. It keeps only the addresses in a format that
is compatible with Kinfo.

> diff --git a/kernel/meminspect/kinfo.c b/kernel/meminspect/kinfo.c
> new file mode 100644
> index 0000000000000..7451c13bc3163
> --- /dev/null
> +++ b/kernel/meminspect/kinfo.c

[ ... ]

> +static void update_kernel_all_info(struct kernel_all_info *all_info)
> +{
> +	struct kernel_info *info;
> +	u32 *checksum_info;
> +	int index;
> +
> +	all_info->magic_number =3D DEBUG_KINFO_MAGIC;
> +	all_info->combined_checksum =3D 0;
> +
> +	info =3D &all_info->info;
> +	checksum_info =3D (u32 *)info;
> +	for (index =3D 0; index < sizeof(*info) / sizeof(u32); index++)
> +		all_info->combined_checksum ^=3D checksum_info[index];

[Severity: Medium]
Could this non-atomic update expose an invalid intermediate state to
concurrent external readers?

If a crash occurs concurrently with the execution of this loop, the exposed
checksum in the mapped shared memory might be zero or partially computed.
Would it be safer to compute the checksum locally and then write it to the
shared memory once?

> +}
> +
> +static void __maybe_unused register_kinfo_region(void *priv,
> +						 const struct inspect_entry *e)
> +{
> +	struct debug_kinfo *kinfo =3D priv;
> +	struct kernel_all_info *all_info =3D kinfo->all_info_addr;
> +	struct kernel_info *info =3D &all_info->info;
> +	struct uts_namespace *uts;
> +	u64 paddr;
> +
> +	if (e->pa)
> +		paddr =3D e->pa;
> +	else
> +		paddr =3D __pa(e->va);

[Severity: High]
Is __pa() the correct translation macro to use here for statically allocated
kernel symbols?

On architectures like x86_64, kernel symbols reside in the kernel image
mapping outside the direct linear mapping. Calling __pa() on these
addresses can trigger a virtual bug on kernel panic if CONFIG_DEBUG_VIRTUAL
is enabled. Should this use __pa_symbol() instead?

> +
> +	switch (e->id) {

[ ... ]

> +static int debug_kinfo_probe(struct platform_device *pdev)
> +{
> +	struct kernel_all_info *all_info;
> +	struct device *dev =3D &pdev->dev;
> +	struct reserved_mem *rmem;
> +	struct debug_kinfo *kinfo;
> +	struct kernel_info *info;
> +
> +	rmem =3D of_reserved_mem_lookup(dev->of_node);
> +	if (!rmem)
> +		return dev_err_probe(dev, -ENODEV, "no such reserved mem of node name =
%s\n",
> +			      dev->of_node->name);
> +
> +	/* Need to wait for reserved memory to be mapped */
> +	if (!rmem->priv)
> +		return -EPROBE_DEFER;

[Severity: High]
Will rmem->priv ever be populated for this compatible string?

The core framework only populates rmem->priv if there is a
RESERVEDMEM_OF_DECLARE callback that explicitly maps the memory. Since
there appears to be no such callback for google,debug-kinfo, this might
cause the driver to enter an endless probe defer loop.

> +
> +	if (!rmem->base || !rmem->size)
> +		dev_err_probe(dev, -EINVAL, "unexpected reserved memory\n");
> +
> +	if (rmem->size < sizeof(struct kernel_all_info))
> +		dev_err_probe(dev, -EINVAL, "reserved memory size too small\n");

[Severity: High]
Are these dev_err_probe calls missing return statements?

Without returning an error, execution proceeds. If the reserved memory is
indeed too small, the subsequent memset will write out-of-bounds of the
reserved memory region.

> +
> +	kinfo =3D devm_kzalloc(dev, sizeof(*kinfo), GFP_KERNEL);
> +	if (!kinfo)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, kinfo);
> +
> +	kinfo->dev =3D dev;
> +	kinfo->all_info_addr =3D rmem->priv;
> +	kinfo->all_info_size =3D rmem->size;
> +
> +	all_info =3D kinfo->all_info_addr;
> +
> +	memset(all_info, 0, sizeof(struct kernel_all_info));
> +	info =3D &all_info->info;
> +	info->enabled_all =3D IS_ENABLED(CONFIG_KALLSYMS_ALL);
> +	info->enabled_absolute_percpu =3D IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_P=
ERCPU);
> +	info->enabled_base_relative =3D IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIV=
E);
> +	info->enabled_cfi_clang =3D IS_ENABLED(CONFIG_CFI_CLANG);
> +	info->name_len =3D KSYM_NAME_LEN;
> +	info->bit_per_long =3D BITS_PER_LONG;
> +	info->module_name_len =3D MODULE_NAME_LEN;
> +	info->symbol_len =3D KSYM_SYMBOL_LEN;
> +	info->thread_size =3D THREAD_SIZE;
> +	info->enabled_modules_tree_lookup =3D IS_ENABLED(CONFIG_MODULES_TREE_LO=
OKUP);
> +	info->mod_mem_offset =3D offsetof(struct module, mem);
> +	info->mod_kallsyms_offset =3D offsetof(struct module, kallsyms);

[Severity: Low]
Will this cause compilation errors if CONFIG_MODULES or CONFIG_KALLSYMS
are disabled?

The struct module type is incomplete if CONFIG_MODULES is disabled, and
the kallsyms member only exists if CONFIG_KALLSYMS is enabled.

> +
> +	kinfo->nb.notifier_call =3D kinfo_notifier_cb;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-meminspect=
-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com?part=3D26
