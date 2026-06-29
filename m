Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518E835A393
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729071; cv=none; b=n6NI1kMKGtC5yWoVftyDg8eINFUICLlQgt0y7x+ZVjGihJi2i1dfXAIvvLzUn8rA2cGsF5+h5mbNSOrQDXFF52QhC9m+0DHaedGWSFLKv9oW5ayPv3nDfXk8lyoFuOuGgmWOk5Vhnbe2rlQOnaqUt38nDOYmzkM22sIJwsbyNlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729071; c=relaxed/simple;
	bh=VrWVCz6yhMDpAhIN0NNK0+oJDPYp4a+CihdlOidDzPQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b6yqWrINJ96w2C89wnLgRFKo58i5LeiJI1GylhgfoozUEgSPNbib+i2tfNR1aRypjgdYjyz7QstvxcTQFvj/M8HLN35ejkvWGLODu5KFsvVDtW32Wuzvc/bhwEiD/uGJSR2Bf523mkEOyGUFSHTfTTmDXY0voiWNxb4rCK7hpxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BG8U8xWk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BG8U8xWk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894551F000E9;
	Mon, 29 Jun 2026 10:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782729070;
	bh=P6uBJ8w0bAucCXFNofgNXHTkkFyvbYHjRKKVnRuy738=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BG8U8xWkwcZygZUyxl2MT2fkdxGjjXbA6wkE4uXklHVTkq693ugTdDFOWDbMMv967
	 furR7gIseOsE9jsVfBd0JF6nNXNa1RN7+HZ+Rqb/zrC11hU93XI2CjE0qI+BTg7z/H
	 g66GRi7g/KfjHIBKoXixEf+th0aw2Bu6KWFJm4BwIVNMPJ2R7UHYIbmj2SW68xkhQX
	 iRemeegSJ2YefNkRkk6/ai7WyORLI75oGu3fOYSvqRkqK7TWyu02IYQX47cwHdYzDA
	 /BAHeRCxaL+jrY3J6gW1kxylww87/UPqggdEyk8wcVUhNDZlvH/5h8wGlaKmDbmxJF
	 YuxJp6McfdQwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 04/10] arm64: kexec_file: Use
 crash_prepare_headers() helper to simplify code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260629094746.191843-5-ruanjinjie@huawei.com>
References: <20260629094746.191843-1-ruanjinjie@huawei.com>
 <20260629094746.191843-5-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 10:31:09 +0000
Message-Id: <20260629103109.894551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition in arch_cra=
sh_populate_cmem() causes a heap buffer overflow in the flexible array cmem=
->ranges.
- [High] Memory leak of the vmalloc'd ELF headers buffer in the fallback re=
try loop of image_load().
--

commit 8b7f92744f5c8fa93faeb43fb72b1a59dcc427a4
Author: Jinjie Ruan <ruanjinjie@huawei.com>

arm64: kexec_file: Use crash_prepare_headers() helper to simplify code

This patch refactors the kexec_file code to use the newly introduced
crash_prepare_headers() helper, replacing prepare_elf_headers(). It
implements arch_get_system_nr_ranges() and arch_crash_populate_cmem()
to traverse memblock ranges and populate crash memory structures.

> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/m=
achine_kexec_file.c
> index e31fabed378a5..b019b31df48cb 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c

[ ... ]

> +int arch_crash_populate_cmem(struct crash_mem *cmem)
> +{
> +	phys_addr_t start, end;
> +	u64 i;
> =20
> -	cmem->max_nr_ranges =3D nr_ranges;
> -	cmem->nr_ranges =3D 0;
>  	for_each_mem_range(i, &start, &end) {
>  		cmem->ranges[cmem->nr_ranges].start =3D start;
>  		cmem->ranges[cmem->nr_ranges].end =3D end - 1;
>  		cmem->nr_ranges++;

[Severity: High]
This is a pre-existing issue, but is it possible for memory hotplug events
to add new memblock regions concurrently?

If a concurrent memory hotplug event adds regions between the first
pass in arch_get_system_nr_ranges() and this second pass in
arch_crash_populate_cmem(), this loop blindly increments cmem->nr_ranges
without bounding it against cmem->max_nr_ranges.

Could this lead to an out-of-bounds write to the cmem->ranges array?

>  	}
> =20
> -	/* Exclude crashkernel region */

[ ... ]

> @@ -109,7 +93,7 @@ int load_other_segments(struct kimage *image,
>  	void *headers;
>  	unsigned long headers_sz;
>  	if (image->type =3D=3D KEXEC_TYPE_CRASH) {
> -		ret =3D prepare_elf_headers(&headers, &headers_sz);
> +		ret =3D crash_prepare_headers(true, &headers, &headers_sz, NULL);

[Severity: High]
This isn't a bug introduced by this patch, but does this leak the vmalloc'd
headers buffer if a subsequent step in load_other_segments() fails?

If a later operation (like placing the initrd or dtb via kexec_add_buffer)
fails, the function jumps to out_err:

out_err:
	image->nr_segments =3D orig_segments;
	kvfree(dtb);
	return ret;

This doesn't free headers or clear image->elf_headers. The caller,
image_load(), catches this failure and loops to retry load_other_segments()
in a new memory hole.=20

On the retry, a new headers buffer is allocated here, overwriting the
previous pointer in image->elf_headers and permanently leaking the old buff=
er.

>  		if (ret) {
>  			pr_err("Preparing elf core header failed\n");
>  			goto out_err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629094746.1918=
43-1-ruanjinjie@huawei.com?part=3D4
