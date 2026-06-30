Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4EF3E5A14
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810254; cv=none; b=dYWXnEjNDTsRJZDJAb0lSbZsBOciu2uRPOx51qns7fVEvKzXALLtaTwQrDYaWwSU0gvb6j75hB5L6ynj/Vpu7lq7f3pxLdDU7ZSh3ymH/bvAcG31z5QOu6k3bqNWYNJjYN+CiHJU+oRR0YQg3lkv4Cd6Iutt7w0KDfTeh6erImc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810254; c=relaxed/simple;
	bh=ishNFSa2/fAzAehpD+s3tFppiuJZ4jjTpVbnkdEwkKc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c07g20PzkUmxUYCU0Q1IV6HPTMRLGQgFOCzTEJy+plzfQJr3RfYIM/udyBFa7SFeztcgWrkl87cgvr2UP5rgWx8T0SvOt+Y5E17tcjhJFG3Tv6BtpA2fNqJ+AuqoFD9i2QPnliotXAnetjpbqfG00SfbmlTANmF23p+P8/YBTl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atqXPlaB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atqXPlaB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4051F000E9;
	Tue, 30 Jun 2026 09:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782810252;
	bh=xK19dFfrbuDDxAMpI6dgOiL3JqfUCBrZGIpbXLstX9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=atqXPlaByfzt83jxs1Pz1znD89eVPJaE/Fs4BjOHnaa0NvIzfV4alUR8IKK5wa5i1
	 pI7m4dzEvILfSwcZbtCEiuG8hMmhlATOMbjVHLtYxM0Odk1gJS3vprbSjxIoxCl3Si
	 LGRd6Wp7TEdb9D/iQXr522N0ZBb7ogFfwCt3Yeqkv8d8spzABMTh6fq/EC0pyQGFzK
	 E9kloIg5bYTj0PjB+wUBqx/kNs7DzS1HEl25xDIgSX3gMtbRbyQC1PN/6DX5EzPl92
	 HX3jUxSdutU3OmjORj+/3UyxemYptSHCXhtXsSbp1YlE7X1dMUZIOKoo8SuCc8FZQQ
	 PmNxWdMqhhTWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/10] arm64: kdump: exclude non-dumpable reserved
 memory regions from vmcore
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260630074715.4126796-9-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
 <20260630074715.4126796-9-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 09:04:12 +0000
Message-Id: <20260630090412.6A4051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Preexisting TOCTOU race in prepare_elf_headers() during memblock i=
teration can cause an out-of-bounds array write due to concurrent memory ho=
tplug.
--

commit 66936af0a692eab34029fe4f8b5ede43875e861f
Author: Wandun Chen <chenwandun@lixiang.com>
Date:   Tue Jun 30 07:47:12 2026 +0000

arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
   =20
This commit excludes reserved memory regions from the vmcore unless they are
explicitly marked as dumpable. It uses device tree reservations to filter
out device firmware regions, reducing the size of the vmcore. The array
size is adjusted to accommodate these exclusions.

> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/m=
achine_kexec_file.c
> index e31fabed378a5..1d65320c6ba48 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c
[ ... ]
> @@ -51,6 +52,7 @@ static int prepare_elf_headers(void **addr, unsigned lo=
ng *sz)
>  	nr_ranges =3D 2; /* for exclusion of crashkernel region */
>  	for_each_mem_range(i, &start, &end)
>  		nr_ranges++;
> +	nr_ranges +=3D of_reserved_mem_kdump_nr_ranges();
> =20
>  	cmem =3D kmalloc_flex(*cmem, ranges, nr_ranges);
>  	if (!cmem)

[Severity: High]
This isn't a bug introduced by this patch, but could this allocation lead to
an out-of-bounds write due to a time-of-check to time-of-use race?

In prepare_elf_headers(), the code counts the memory ranges with a first
for_each_mem_range() loop, allocates cmem based on that count, and then
populates cmem->ranges in a second for_each_mem_range() loop further down.

Because sys_kexec_file_load() does not hold the memory hotplug lock, a
concurrent memory hotplug operation could increase the number of ranges
between the two loops.

Since the second loop does not verify if cmem->nr_ranges exceeds
cmem->max_nr_ranges, could it write past the allocated array bounds?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630074715.4126=
796-1-chenwandun1@gmail.com?part=3D8
