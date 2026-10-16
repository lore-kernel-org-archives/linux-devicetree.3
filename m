Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779BF339390
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132363; cv=none; b=dMpuJlat3DFO8XvjU/7VzvYyMtIeHugmmKm2tZWDszY2vJFjr9djTe0ByezHsOc1xPVjOoCyH21FiGHdxfwpWLJdbI1FPaV8COUL6IJO1H9NQmsOkrUF9XJFKJq/8HpqNKksR4Zqw4rrVy3v/k6Vsn7j3OCd5VgeQkAyeGQunbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132363; c=relaxed/simple;
	bh=vldBTlYpx9QuCIdCJkr7hwTB5VqPz6OyY+vG8JwFayU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tNQ9U9agtIquL94EosKq3B3+oo9iYdy1eXO2i1zg6eJI+8Md88vo4Bup1EJBupeUYEZNFnsn6kPkOZfbwGmToK9Om8gxeZeZyZ6qCZLZFyOluq2I3qysXiblf7CgyQrEIMK0jBMJXxLtaHyyrFWEg8XCdkqf4oFn6Q3WIFJTcVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vt1OeF+x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vt1OeF+x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD8E1F000C8;
	Fri, 16 Oct 2026 06:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792132362;
	bh=s35H72d+77FYJLR12nijBq1KSdcBQQdrhTAC7CnobQU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vt1OeF+x4b2yxRdvfHGJiAufmJvygGY2iNsBd475Xm2Wf3Krj5sf7dFznIeMkQRtZ
	 AUivHJ9u+3sqJ16UAcU2urw1/Fbdy3bPCH0c8bcPadQeeF8nErMTdQFZxYelFdgWGZ
	 KFelM6ridR6OaWbe9D9g7C+UyCAFLpHnN3JIjAq54ByJjSt9cbiKH3ODVgAY9D4WbK
	 edqcQHhqJlFDgZxXbU1wlltiqBMwdSkaOiN/X2gM/ep0QSJcZV9FHmKRm82WbJEaOp
	 nuvk4hPaal6irLBQf1mIDhay0VMFQgYJvbTP4Bj6hypALc9USIMZNtXilqeqE2J6Be
	 qiACcj+1ngxow==
Message-ID: <sashiko-outbox-173868@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RESEND PATCH v8 7/8] of: reserved_mem: mark /reserved-memory
 entries with MEMBLOCK_NODUMP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>, robh@kernel.org, baoquan.he@linux.dev, rppt@kernel.org, m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, saravanak@kernel.org, akpm@linux-foundation.org, pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev, robin.murphy@arm.com, devicetree@vger.kernel.org, kexec@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20261016061549.4181390-8-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
 <20261016061549.4181390-8-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 06:32:40 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] of: fdt: boot panic on sh due to memblock_mark_nodump splitting be=
fore resize
--

commit c3780e76cb8942c20c5a5a3858d45f390651c1c3
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index ecc9231026224..a5f223a74b7ea 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1285,6 +1285,7 @@ void __init unflatten_device_tree(void)
> =20
>  	/* Save the statically-placed regions in the reserved_mem array */
>  	fdt_scan_reserved_mem_late();
> +	fdt_mark_reserve_mem_nodump();

[Severity: High]
Could this cause a boot panic on architectures like sh that call
unflatten_device_tree() before memblock resizing is allowed?

On the sh architecture, unflatten_device_tree() is called prior to
paging_init():

arch/sh/kernel/setup.c:setup_arch() {
...
#ifdef CONFIG_BUILTIN_DTB
	unflatten_and_copy_device_tree();
#else
	unflatten_device_tree();
#endif

	paging_init();
...
}

Dynamic resizing of the memblock array is only enabled during paging_init():

arch/sh/mm/init.c:paging_init() {
...
	memblock_enforce_memory_limit(memory_limit);
	memblock_allow_resize();
...
}

Since fdt_mark_reserve_mem_nodump() applies MEMBLOCK_NODUMP flags,
it forces memblock.memory regions to be split. Because memblock_can_resize
is 0 at this early stage, if the device tree specifies enough non-dumpable
reserved memory regions to exceed INIT_MEMBLOCK_MEMORY_REGIONS,
memblock_double_array() will unconditionally panic the kernel during early
boot.

> =20
>  	/* Populate an empty root node when bootloader doesn't provide one */
>  	if (!fdt) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016061549.4181=
390-1-chenwandun1@gmail.com?part=3D7
