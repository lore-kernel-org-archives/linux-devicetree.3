Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C30261B91
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812223; cv=none; b=XA8S21GEvyuUOriP+KueCRP5nmZni9l+xIDUylcMW5RuYqaAusJpBC2H4GqIZOG+Q6SWrEWCfgTYybtHfu06RU6yVDjbRHGx3E3+2pwTU7cOnsvlS492sMMTsb5bBd53hxM7tRgAJqR3na+xNf+oElA6VWVC0yAbhzBITCHXhdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812223; c=relaxed/simple;
	bh=DFQYKzaMLxMFb8KpdU/CMtl/afClSFq3DLOWV46ufng=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uIw+wmx2dgzo5DZCX0OvTPbD0HJS+1RuP5OcxsoPfA+MV0tucZR3njot3K2QYN+dlR7udx117jayNMXqGstMKpNSiQ9XLom3gs9zBAUMfs0aAYTgKov+lpXDjntPfZFTOyMQVCihTFBDKB9E0/QuVcY/+SJ+qLplpnPIzvcCggc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNJDxbBd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNJDxbBd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24B31F000E9;
	Tue, 30 Jun 2026 09:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782812222;
	bh=klixIZihNJVXQiVlbUS2Xvpyd8/AKRUFXbey2VeZ2Co=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TNJDxbBdqVpxOeiReYVTZ7lYB0riEPZHpaJsFqdlHBDyGLQoZQVDu1nJJSm0dd8QE
	 2lyeduvl9tfbcbHHt8zIIXv2AcshDLSlIK8MkPR0w8hrlSEDXIAjKxJ81/RShGUoYR
	 HWA2BZkQXwK/upOS0JfanS/zMmqjpChwVzVD2diR9NZJpzTSqnGJldiTwH5LnHjBa6
	 b8AM60xa26oo3hCyVhusjbmJi2TPpTQ/CCCwbQEul7Vt6OfqGl8u5j7uw2o2nJYLXc
	 cDs4VKGoADySX6fBsPGxxzbEQhfXptVgrvi/1r+uA+p8AylRzuQ9LSU6/Nm2MSBc4i
	 jr3gSHz4xe7+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/10] loongarch: kdump: exclude non-dumpable
 reserved memory regions from vmcore
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260630074715.4126796-11-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
 <20260630074715.4126796-11-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 09:37:01 +0000
Message-Id: <20260630093701.B24B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Concurrent memory hotplug during kexec_file_load() can cause an ou=
t-of-bounds write in the `cmem->ranges` array due to a TOCTOU between two l=
ockless passes of `for_each_mem_range()`.
--

commit d8948c2d581027666a36bbb47058ae244b39b8ae
Author: Wandun Chen <chenwandun@lixiang.com>

loongarch: kdump: exclude non-dumpable reserved memory regions from vmcore

This commit applies the arm64 non-dumpable reserved memory filtering to
LoongArch kdump. It uses of_reserved_mem_kdump_nr_ranges() to size the=20
crash_mem array and of_reserved_mem_kdump_exclude() to drop regions.

> diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/=
kernel/machine_kexec_file.c
> index 5584b798ba464..4b918c3d4a285 100644
> --- a/arch/loongarch/kernel/machine_kexec_file.c
> +++ b/arch/loongarch/kernel/machine_kexec_file.c
[ ... ]
> @@ -67,6 +68,7 @@ static int prepare_elf_headers(void **addr, unsigned lo=
ng *sz)
>  	nr_ranges =3D 2; /* for exclusion of crashkernel region */
>  	for_each_mem_range(i, &start, &end)
>  		nr_ranges++;
> +	nr_ranges +=3D of_reserved_mem_kdump_nr_ranges();
> =20
>  	cmem =3D kmalloc_flex(*cmem, ranges, nr_ranges);
>  	if (!cmem)

[Severity: High]
This is a pre-existing issue, but can concurrent memory hotplug during
kexec_file_load() cause an out-of-bounds write in the cmem->ranges array?

If the number of memory regions increases between the first lockless pass
of for_each_mem_range() shown above, and the second lockless pass that
populates the array later in prepare_elf_headers():

	for_each_mem_range(i, &start, &end) {
		cmem->ranges[cmem->nr_ranges].start =3D start;
		cmem->ranges[cmem->nr_ranges].end =3D end - 1;
		cmem->nr_ranges++;
	}

could the second pass write past the allocated cmem->ranges array?

Since kexec_file_load() takes kexec_mutex while memory hotplug uses
mem_hotplug_lock, they can run concurrently. A concurrent addition via
memblock_add_node() could result in writing beyond the bounds of the array.
Should there be bounds checking when adding ranges to the array in the
second pass?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630074715.4126=
796-1-chenwandun1@gmail.com?part=3D10
