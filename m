Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FE5390212
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 07:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904870; cv=none; b=ZztH/PIj/jUb+bHMOt2V6vojH2sN+F+sKQ+gPvSXsD+VvgfrQeyDFY71lo7mJrMWsokL6QDGSrvjvK/1+70s4/CdeYQrbpp+eDj3qg4/a7CAJWNS+35Jrlmr7PhJGCYra+A9Y4OWyWgEzJuLN7CyQFKxV25bh5TElYk7u4vDNzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904870; c=relaxed/simple;
	bh=csOIWRN6Cr8SiceUY6CmyvRKFufxUUN28B3ZZDfzOlM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ilRkjkN56nRD54qxD4qBWF3Um8uNJRACcBeyJ3Zy2zBvHGEf+e+IGXmKvXUNYIlg/x3L5+HHOBqstPxy//vwqx+dX8LuN6Vz/qnE4vFF5SbB9qR65UC1B0FXRzmA3cpmcgSddgl/8mMRxQiFb+sGWQO2EmocIX96ODDXPptSz2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIxscAvK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIxscAvK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E8E1F00893;
	Mon,  8 Jun 2026 07:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780904868;
	bh=vOfXh1sjtifG7MGizYHBHLSvcrF62jm52lsXcAYyW2Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VIxscAvKatgA4pMAExD3FAYlAbX7sMiZqTMDlIljPt57KDPI7fyj3W7dfBI0DManV
	 lV4wAt6k6JHQOXssQ8XIisQ0nhwrFh4yxEtAqK7QfObKw0aIDWjwF1k5gx9fMXoQk2
	 aRhkdHFinCYtD0EUby9ppDgx9KkDkObENTEQqFi3fHAAoYLNaBMUAhOod0aMaQPZzr
	 6wobsYq6TOX7eHSu8GtMv4tQRaX0EXQTLtjDbazMTjR+MU42Drn/dEtD0pJKGV9IwR
	 wtXei4URX6F6VI+CYU9dbJBsqkGApmPLmNRnIP6MLLTfCzunns9sNihXc2bE1Uij7U
	 TeZ9nk/c/WsXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 05/10] x86: kexec_file: Use crash_prepare_headers()
 helper to simplify code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260608073459.3119290-6-ruanjinjie@huawei.com>
References: <20260608073459.3119290-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 07:47:47 +0000
Message-Id: <20260608074748.58E8E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition with concur=
rent memory hotplug can cause an out-of-bounds array write in `prepare_elf6=
4_ram_headers_callback()` due to a missing bounds check.
--

commit 4e1090b66ab88651797483f0d06242b9bd18b6b3
Author: Jinjie Ruan <ruanjinjie@huawei.com>

x86: kexec_file: Use crash_prepare_headers() helper to simplify code

This commit replaces x86's custom prepare_elf_headers() with the generic
crash_prepare_headers() helper. It implements the required architecture
callbacks arch_get_system_nr_ranges(), arch_crash_populate_cmem(), and
arch_crash_exclude_ranges() to manage crash memory regions.

> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> index cd796818d94d9..cb2ce7acfec45 100644
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c

[ ... ]

> -/* Prepare elf headers. Return addr and size */
> -static int prepare_elf_headers(void **addr, unsigned long *sz,
> -			       unsigned long *nr_mem_ranges)
> +int arch_crash_populate_cmem(struct crash_mem *cmem)
>  {
> -	struct crash_mem *cmem;
> -	int ret;
> -
> -	cmem =3D fill_up_crash_elf_data();
> -	if (!cmem)
> -		return -ENOMEM;
> -
> -	ret =3D walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_call=
back);
> -	if (ret)
> -		goto out;
> -
> -	/* Exclude unwanted mem ranges */
> -	ret =3D elf_header_exclude_ranges(cmem);
> -	if (ret)
> -		goto out;
> -
> -	/* Return the computed number of memory ranges, for hotplug usage */
> -	*nr_mem_ranges =3D cmem->nr_ranges;
> -
> -	/* By default prepare 64bit headers */
> -	ret =3D crash_prepare_elf64_headers(cmem, IS_ENABLED(CONFIG_X86_64), ad=
dr, sz);
> -
> -out:
> -	vfree(cmem);
> -	return ret;
> +	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callb=
ack);
>  }

[Severity: High]
This is a pre-existing issue, but can this sequence lead to an out-of-bound=
s=20
write during concurrent memory hotplug?

The generic crash_prepare_headers() performs two lockless passes over system
RAM resources:

1. arch_get_system_nr_ranges() counts the regions to allocate cmem.
2. arch_crash_populate_cmem() populates them using walk_system_ram_res()
   and prepare_elf64_ram_headers_callback().

Since sys_kexec_file_load() does not hold mem_hotplug_lock, and=20
walk_system_ram_res() temporarily drops resource_lock between iterations,
concurrent memory hot-add operations can insert new memory regions between =
or
during these passes.

If the number of dynamically added RAM regions exceeds the reserved padding=
,=20
the second pass will encounter more regions than cmem->max_nr_ranges.

prepare_elf64_ram_headers_callback() currently does not verify bounds before
appending new regions:

    cmem->ranges[cmem->nr_ranges].start =3D res->start;
    cmem->ranges[cmem->nr_ranges].end =3D res->end;
    cmem->nr_ranges++;

Could this allow an out-of-bounds array write on the vmalloc heap if enough
memory ranges are hotplugged concurrently? Would it make sense to add a bou=
nds
check to prepare_elf64_ram_headers_callback() to prevent exceeding=20
cmem->max_nr_ranges, or perhaps hold the memory hotplug lock across the pas=
ses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608073459.3119=
290-1-ruanjinjie@huawei.com?part=3D5
