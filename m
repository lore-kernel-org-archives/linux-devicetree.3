Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A41139FD9
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 11:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732836; cv=none; b=fR7Kns/GdRiiQQnW0XcnVTaRUkVpXrn0/fWyjocFbXcPif2R4Qo8LYc6BVWSgkgUuSJG9hfbB3yd7y0d8xGucTYqac/2yhs3QWBJKuqXeIp+4pgBToLISE6eGXY2xml9Jyu0aTaDlqVkUjiwsp0dJsOT3UUDQND9YiWeIs4XjqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732836; c=relaxed/simple;
	bh=3Y9q6eviUsO6eYjVx5fjawZdw0kcvDEenftcWRIFaEI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X0qXr1OGPwPrOhMW2JEQSb5pvQbhj2bWJLV3iWscV92gFh6zWsmjYYv4gnNrFtA0tb5ja4ekvoLKwDzVdLoxdNQokkoBKFDvUJO4vPwVv0D1+svIZG4HDUDQxGfH8f0umYW64/nyiDxYGYLQf5skWZSOQ0gXjJB4KII2FFPeEK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZRJZM+R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZRJZM+R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099941F000E9;
	Mon, 29 Jun 2026 11:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782732835;
	bh=J3DjO7nmgCgPHEw4OMYl68+dBL6EiT/kJHfTLggZGzc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jZRJZM+RBOhZ9yeULWJ2oK1zdZBxBQ0obfsh5KH7U2NnJPpU60emFwrpf6Ps7sRl9
	 8/diaXkFcNzcym7UVsVF1ReoQmB0W8KyTNVyIVyoGC4o6zP5p8SQB/T45q1Mu/HFfb
	 y8+UAvgVHxf/MyPa55mdj3YrDcvJZti0/G+JH8/0LFxQwB6k5+rB2nGuzxav2pm97l
	 +rRfPK0VUVBjoMAojFqfxlevQuVEmrW3pbLdU6coBZNs4LqXSLhCO1pn+7zJxcjlj2
	 TCpngMF0KvWvnP+B4FkmuFRZFEaSpfMSv905w9J9x9mvb+lwpvTItJ/5iNoqciRWk9
	 iPEsAcZe6lqig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 10/10] riscv: kexec_file: Add support for
 crashkernel CMA reservation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260629094746.191843-11-ruanjinjie@huawei.com>
References: <20260629094746.191843-1-ruanjinjie@huawei.com>
 <20260629094746.191843-11-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 11:33:54 +0000
Message-Id: <20260629113355.099941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing bounds check in `prepare_elf64_ram_headers_callback` can l=
ead to an out-of-bounds heap write if memory is hot-plugged concurrently.
--

commit 12b2d1ca4895e26a575347f3f6f5b7e59957f99a
Author: Jinjie Ruan <ruanjinjie@huawei.com>

riscv: kexec_file: Add support for crashkernel CMA reservation

This commit adds CMA support for kdump crashkernel reservation on RISC-V.
It parses CMA reservation parameters, allocates the memory dynamically, and
handles exclusion of these ranges from the crash kernel memory appropriatel=
y.

> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/m=
achine_kexec_file.c
> index 439cbc50dfa69..85f14abceb507 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
> @@ -46,7 +46,7 @@ static int get_nr_ram_ranges_callback(struct resource *=
res, void *arg)
> =20
>  unsigned int arch_get_system_nr_ranges(void)
>  {
> -	unsigned int nr_ranges =3D 2; /* For exclusion of crashkernel region */
> +	unsigned int nr_ranges =3D 2 + crashk_cma_cnt; /* For exclusion of cras=
hkernel region */

[Severity: High]
This is a pre-existing issue, but while modifying arch_get_system_nr_ranges=
(),
I noticed a potential race condition with concurrent memory hotplug.

In crash_prepare_headers(), the code counts the ranges and then allocates t=
he
cmem array based on that count:

kernel/crash_core.c:crash_prepare_headers() {
    ...
    max_nr_ranges =3D arch_get_system_nr_ranges();
    if (!max_nr_ranges)
        return -ENOMEM;

    cmem =3D alloc_cmem(max_nr_ranges);
    if (!cmem)
        return -ENOMEM;

    ret =3D arch_crash_populate_cmem(cmem);
    ...
}

Neither kexec_lock nor resource_lock appears to be held to prevent the syst=
em
RAM resource tree from being modified between the counting phase and the
population phase. If a memory hotplug event inserts a new memory range duri=
ng
this window, the second traversal of the resource tree will encounter it.

When that happens, could prepare_elf64_ram_headers_callback() write past the
end of the allocated cmem array?

arch/riscv/kernel/machine_kexec_file.c:prepare_elf64_ram_headers_callback()=
 {
    ...
    cmem->ranges[cmem->nr_ranges].start =3D res->start;
    cmem->ranges[cmem->nr_ranges].end =3D res->end;
    cmem->nr_ranges++;
    ...
}

Does this callback need a bounds check against cmem->max_nr_ranges to preve=
nt
an out-of-bounds heap write?

> =20
>  	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629094746.1918=
43-1-ruanjinjie@huawei.com?part=3D10
