Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2F32153D8
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 04:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779854744; cv=none; b=CrYhnGmiZfmhO/XxnliebC4n39wqpPje85FSxDn8Wtu0lE5V1StpETFc9mqkLlGfBwdH0ME4skF9qHUOT0+2lpJRgOC0RfPpx8R4bEfATdY9yE7m7jOhp/E6+MZ/PreO21tsHZCyLUumcPA+3FBrgBsHkFI2TvWxhpv4wCGyndE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779854744; c=relaxed/simple;
	bh=V71F0otw5FjCLSMFcYhj5hu+azbxQx0Wc8kAv8b0fUg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CX6w5ibp2oWL+PcqX0WHyzKkTN6oulQ1E0fZnRrtSv4H0CStqoPBpAVFBlojJ9sBC3qiCnS7QSPsqkdB3SewTrPxtbIwbfs68HUMwa9WeWgGV0ODuBlri05P1Ug+1Md4VFloLdbKqhmRgYGzDCgMe6p7fHlylhl5ENlDOdw5zXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iclDohim; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iclDohim"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2F81F000E9;
	Wed, 27 May 2026 04:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779854743;
	bh=Ip5IaBQfvy5gE6F8zed/dafKw9C2zRcL9BtXAEWChfk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iclDohims7Z4FUnvGwV56iycS/pZgG3+TsaIooF46Yz6XF/OVGYpRnCYdmjWziHE2
	 +CoMwn+griBfHqhQSu7QpM79fY6fREcnpsMvKdxzZyeNXSOX1X40q2NHgvPh33yVsU
	 p3uMEQoRmFGBOxj3cPjj5ChPL192OHRt2lMFtjGMUYRgZqu+gXnz+18dQSy1crQAZs
	 BG0i7eDdUHWrc2bozXYmvDczcEn/FqpftUpBFYc8C4sDt4E8k/S+JK7Bsf7exVrwfF
	 OquwE9A1PHjh61XFVh2kQA21qc6DnYwHrSJ3usSIJt8YwvxHikRLigKB51SsrTLUgP
	 koYtLffROU7AQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/11] riscv: kdump: exclude non-dumpable reserved
 memory regions from vmcore
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260527032917.3385849-11-chenwandun1@gmail.com>
References: <20260527032917.3385849-11-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 04:05:42 +0000
Message-Id: <20260527040542.DB2F81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition during memo=
ry hotplug can lead to an out-of-bounds heap write when populating the cras=
h_mem array.
--

commit a3046cf8f5e5d648fc54675ac919081b37df020f
Author: Wandun Chen <chenwandun@lixiang.com>

riscv: kdump: exclude non-dumpable reserved memory regions from vmcore

This commit applies non-dumpable reserved memory filtering to RISC-V kdump
by dropping flagged regions from the elfcorehdr PT_LOAD segments. It
calculates the needed ranges and excludes them during ELF header preparatio=
n.

> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/m=
achine_kexec_file.c
> index 54e2d9552e930..c359cf714c791 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c

[ ... ]

> @@ -63,6 +64,7 @@ static int prepare_elf_headers(void **addr, unsigned lo=
ng *sz)
> =20
>  	nr_ranges =3D 1; /* For exclusion of crashkernel region */
>  	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
> +	nr_ranges +=3D of_reserved_mem_kdump_nr_ranges();
> =20
>  	cmem =3D kmalloc_flex(*cmem, ranges, nr_ranges);

[Severity: High]
This is a pre-existing issue, but could this sequence be susceptible to a r=
ace
condition during memory hotplug?

In prepare_elf_headers(), walk_system_ram_res() is called here to calculate
nr_ranges, and then called again later to populate the cmem->ranges array.
Because get_online_mems() is not held across these two calls, a new memory
region could be hot-added between them.

Since prepare_elf64_ram_headers_callback() lacks bounds checking and
unconditionally writes to cmem->ranges[cmem->nr_ranges], would a hot-add
event cause the second walk to exceed the newly allocated cmem->max_nr_rang=
es
and result in an out-of-bounds heap write?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527032917.3385=
849-1-chenwandun1@gmail.com?part=3D10
