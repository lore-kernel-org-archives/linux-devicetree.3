Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3275F5581F6
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 16:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884572; cv=none; b=R2qW5VVRsFQw08ZUBL2lhVLT3YivPLfdEhMCaKBRof+F1gnMKPrw6+UA5DD4O02Y2wtdxCb4QPE0KfMRN8nSYoXI5ddnU1y8YvQ6UtzCLKb0dtiaGg9MzQ6tbc2f2efgNJ/8lNnXIMXZTdAMacaxcLy3bVS8jSur3XKh2z4dviI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884572; c=relaxed/simple;
	bh=XUHil1vEravhRyA9+QGk5JFGaXFknoEQbXAIvX708AI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C0K6KA72nn21XyXdTppZSUTGeASKZL56zShBTZ/IkYrHhZbHRvQrDtufM4TSWNmPzqHlVmYV0r3QjIX4klhAgBmN3CB0LG4OT+5az6xra9sMWGJQOPVZdeOxo9DSol4F+21gIwA9Znqq7MFcjwS9+VIJAgHf3qRKYAOWEUu2Bdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXIfUZeS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXIfUZeS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770621F00A3A;
	Tue,  8 Sep 2026 16:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788884570;
	bh=FZrcMSVcWKjQBu3s0C0zRHYTlTWPR+ZQuRWfJ/za1po=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZXIfUZeSJr9eRwHZFoL5+QJrpFMvE4+dcdiF8lgshK9d4dIHI0cFCLAZEa+jxg2in
	 eRpFEtSXNYaeuCfsvF+WM9urbp0aYiLaaAMUNV32J4t++Su0/blHgdMX7zFOgv3BaG
	 pD0x5K6tp4jp+V7G+zJvH4oM/5/hmNkHii1Gn/RRdtJt9eGIB9hvb7jrykwtuBXc3S
	 oSjsspDZoG6OGELtlHYaWLcSXPEQBKzqc9YDLKCtWDectSJe52cAfTkq7/ZM+YXPRg
	 Ox/i44J0gLlTlbMW/mU/FH4dRixCFoT4b7jyiSQBcRuYpC8IAdU+GskEjtSltVsx8x
	 YO6vy1TDfz+Uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] kho: rename KHO scratch to KHO bootmem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pratyush Yadav" <pratyush@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260908155639.2496551-4-pratyush@kernel.org>
References: <20260908155639.2496551-1-pratyush@kernel.org>
 <20260908155639.2496551-4-pratyush@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 16:22:50 +0000
Message-Id: <20260908162250.770621F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Mismatch in device tree property names for KHO bootmem causes KHO =
initialization failure on OF platforms.
- [Medium] UAPI breakage: renamed fields in `struct kho_data`.

Pre-existing issues:
- [High] Kernel panic or Use-After-Free during early boot if KHO bootmem al=
location fails.
--

commit 3dec172ac499ac601fb7ed89fbed34f0bd01b393
Author: Pratyush Yadav (Google) <pratyush@kernel.org>

kho: rename KHO scratch to KHO bootmem

This commit renames the term "KHO scratch" to "KHO boot memory" (or bootmem)
across function names, variable names, comments, and documentation. The cha=
nge
clarifies that the memory is provided by the previous kernel for early boot
allocations, while the discovered allocatable areas are now called "noprsrv=
".

> diff --git a/arch/x86/include/uapi/asm/setup_data.h b/arch/x86/include/ua=
pi/asm/setup_data.h
> --- a/arch/x86/include/uapi/asm/setup_data.h
> +++ b/arch/x86/include/uapi/asm/setup_data.h
[ ... ]
> @@ -85,8 +85,8 @@ struct ima_setup_data {
>  struct kho_data {
>  	__u64 fdt_addr;
>  	__u64 fdt_size;
> -	__u64 scratch_addr;
> -	__u64 scratch_size;
> +	__u64 bootmem_addr;
> +	__u64 bootmem_size;
>  } __attribute__((packed));

[Severity: Medium]
Will renaming these fields in a UAPI header break source compatibility for
userspace tools (like kexec-tools) that are compiled against this structure?
If userspace references scratch_addr and scratch_size, compiling against the
new headers will fail.

> diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
> --- a/drivers/of/kexec.c
> +++ b/drivers/of/kexec.c
[ ... ]
> @@ -285,8 +285,8 @@ static int kho_add_chosen(const struct kimage *image,=
 void *fdt, int chosen_node
>  				       fdt_mem, fdt_len);
>  	if (ret)
>  		return ret;
> -	ret =3D fdt_appendprop_addrrange(fdt, 0, chosen_node, "linux,kho-scratc=
h",
> -				       scratch_mem, scratch_len);
> +	ret =3D fdt_appendprop_addrrange(fdt, 0, chosen_node, "linux,kho-bootme=
m",
> +				       bootmem_arr, bootmem_len);

[Severity: High]
Does this create a mismatch with the FDT reader? Looking at the boot-time
initialization in early_init_dt_check_kho() in drivers/of/fdt.c, the new
kernel still appears to search for the old linux,kho-scratch property.

If the reader side is not updated to match, will this cause the new kernel
to silently discard the handed-over memory during kexec on OF platforms?

> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec=
_handover.c
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
[ ... ]
> @@ -837,73 +837,73 @@ static void __init kho_reserve_bootmem(void)
>  	if (!kho_enable)
>  		return;
> =20
> -	scratch_size_update();
> +	bootmem_size_update();
> =20
>  	/* FIXME: deal with node hot-plug/remove */
> -	kho_scratch_cnt =3D nodes_weight(node_states[N_MEMORY]) + 2;
> -	size =3D kho_scratch_cnt * sizeof(*kho_scratch);
> -	kho_scratch =3D memblock_alloc(size, PAGE_SIZE);
> -	if (!kho_scratch) {
> -		pr_err("Failed to reserve scratch array\n");
> +	kho_bootmem_cnt =3D nodes_weight(node_states[N_MEMORY]) + 2;
> +	size =3D kho_bootmem_cnt * sizeof(*kho_bootmem);
> +	kho_bootmem =3D memblock_alloc(size, PAGE_SIZE);
> +	if (!kho_bootmem) {
> +		pr_err("Failed to reserve bootmem array\n");
>  		goto err_disable_kho;
>  	}
[ ... ]
> -err_free_scratch_areas:
> +err_free_bootmem_areas:
>  	for (i--; i >=3D 0; i--)
> -		memblock_phys_free(kho_scratch[i].addr, kho_scratch[i].size);
> -err_free_scratch_desc:
> -	memblock_free(kho_scratch, kho_scratch_cnt * sizeof(*kho_scratch));
> +		memblock_phys_free(kho_bootmem[i].addr, kho_bootmem[i].size);
> +err_free_bootmem_desc:
> +	memblock_free(kho_bootmem, kho_bootmem_cnt * sizeof(*kho_bootmem));
>  err_disable_kho:
> -	pr_warn("Failed to reserve scratch area, disabling kexec handover\n");
> +	pr_warn("Failed to reserve bootmem, disabling kexec handover\n");
>  	kho_enable =3D false;
>  }

[Severity: High]
This is a pre-existing issue, but if the initial memblock_alloc() fails in
kho_reserve_bootmem(), the error path sets kho_enable =3D false but fails to
clear kho_bootmem_cnt back to zero.

If kho_bootmem_cnt is greater than zero and kho_bootmem is a NULL or freed
pointer, could this cause a panic later in boot? Code like
kho_bootmem_migratetype() unconditionally calls kho_bootmem_overlap(), which
iterates up to kho_bootmem_cnt and blindly dereferences kho_bootmem:

bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
{
        ...
        for (i =3D 0; i < kho_bootmem_cnt; i++) {
                bootmem_start =3D kho_bootmem[i].addr;
        ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908155639.2496=
551-1-pratyush@kernel.org?part=3D3
