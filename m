Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061B13E51F0
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495445; cv=none; b=cYti1CseJAgbB97jZZpjwfvfdZy0VkM3tC6YI1uU71pPoQvW5iQWAx6CR5cDrTTO+7xcEWtdKekQIAcOa6jT26kX86N2XQrMCZpYJQCvrNkyj/oY3i1huCo6EdyNtDh+vsX9xmZgn3Sh9EUHVAyYtQxgHT1UuDV3qhA4JX+2l7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495445; c=relaxed/simple;
	bh=vrheQ5KEfurzPJ4CLgKZxOzpyjoIR8hl0Jk630UDJow=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dXja/mhJ+AXEBhb1o+KbBLyPsxpU0nln7pZEcrAhy3cbXz/pwl+KmYMLevXC0TSKG6BuURKTwiLGUvmsFVEB3SAq9EARCEUZWSY7a3wTZq6Bg4QWgzSLgWUs15ztE55lgRBg31tbEyH/pP96Ktr5eCPG66NgHLxkXbLVUeiDIqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B0kYsrRo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0kYsrRo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED88D1F00A3A;
	Wed,  8 Jul 2026 07:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495428;
	bh=K3kZDG5BjJFAsx0W2/gO5tCKHvKcwJba+1L9wbqcKxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B0kYsrRon4nM1Aafkw6l2bFesLO0/Bg9zLD7y1S884Bv1X1XVEGXnaK4h0H4T3x1B
	 Q4xQPoXIshUpnzEufFU37dgwQ0+QAqdJrUZmMzLHVKV2FxzrW9Qj2OOX8pqVYZDK9+
	 CiksJQcDnkUWnlGArRMpDxeae03IphOU5gJIeJBpQpcsZbpUCatSRLy5JWsq8cYto6
	 YEeLxhBVGusLjadX189M/QoETM4zzXOVE0BiVqfU0VDhgp4IJZ/GWyggvr8QtCo0Hj
	 0CZCztBao6ynF2HVapJsAhaP1DCEfbGcyrFKsBJzwxgZTtbXAhgc2AC0x20vCILZy+
	 JEqzSUKtbfJcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 14/26] mm/init-mm: Annotate static information into
 meminspect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-meminspect-v3-v3-14-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-14-7aa5a0a74d5c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:23:47 +0000
Message-Id: <20260708072347.ED88D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Registering `swapper_pg_dir` with a size of `sizeof(void *)` restr=
icts the generated crash dump to only the first 8 bytes of the root page di=
rectory.
- [Medium] Linker boundaries (`_text`, `_sinittext`, etc.) are registered w=
ith an arbitrary 8-byte size, which incorrectly dumps tiny fragments of exe=
cutable code rather than exporting the symbol addresses.
- [Low] Taking the address of `swapper_pg_dir` causes a fatal compilation e=
rror on architectures where it is defined as an rvalue macro.
--

--- Patch [14]: [PATCH v3 14/26] mm/init-mm: Annotate static information in=
to meminspect ---
commit a168e74f97589c651c261ad981c839eec643f005
Author: Eugen Hristev <ehristev@kernel.org>

mm/init-mm: Annotate static information into meminspect

This commit annotates vital static information such as init_mm, swapper_pg_=
dir,
and various linker boundary symbols into the meminspect inspection table. T=
he
information is stored in a dedicated section for inspection.

> diff --git a/mm/init-mm.c b/mm/init-mm.c
> index 3e792aad76261..cf53058410b17 100644
> --- a/mm/init-mm.c
> +++ b/mm/init-mm.c
[ ... ]
> @@ -19,6 +21,13 @@
> =20
>  const struct vm_operations_struct vma_dummy_vm_ops;
> =20
> +MEMINSPECT_AREA_ENTRY(_sinittext, sizeof(void *));
> +MEMINSPECT_AREA_ENTRY(_einittext, sizeof(void *));
> +MEMINSPECT_AREA_ENTRY(_end, sizeof(void *));
> +MEMINSPECT_AREA_ENTRY(_text, sizeof(void *));
> +MEMINSPECT_AREA_ENTRY(_stext, sizeof(void *));
> +MEMINSPECT_AREA_ENTRY(_etext, sizeof(void *));

[Severity: Medium]
Are linker boundaries like _text intended to be registered as 8-byte
memory areas?

By registering these linker boundary addresses (e.g., _text) as memory areas
of size sizeof(void *), the kernel will include arbitrary 8-byte chunks of
memory from these addresses as PT_LOAD segments in the crash dump. This was=
tes
space and creates nonsensical micro-segments.

[ ... ]
> @@ -50,6 +59,9 @@ struct mm_struct init_mm =3D {
>  	INIT_MM_CONTEXT(init_mm)
>  };
> =20
> +MEMINSPECT_SIMPLE_ENTRY(init_mm);
> +MEMINSPECT_AREA_ENTRY(swapper_pg_dir, sizeof(void *));

[Severity: High]
Does registering swapper_pg_dir with a size of sizeof(void *) restrict the
generated crash dump to only the first 8 bytes of the root page directory?

By passing sizeof(void *) instead of the actual page directory size (e.g.,
PAGE_SIZE or PTRS_PER_PGD * sizeof(pgd_t)), the dump will only contain the
first entry of the root page table. This breaks virtual-to-physical address
translation for vmalloc or kernel modules in post-mortem analysis tools like
crash.

[Severity: Low]
Will this break the build on architectures where swapper_pg_dir is defined
as an rvalue macro?

The MEMINSPECT_AREA_ENTRY macro takes the address of the provided symbol us=
ing
&(sym). On several noMMU architectures, swapper_pg_dir is defined as an rva=
lue
macro (e.g., ((pgd_t *) 0) or NULL). Taking the address of an rvalue results
in a compiler error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-meminspect=
-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com?part=3D14
