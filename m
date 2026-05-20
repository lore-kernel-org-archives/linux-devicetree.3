Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B0B3E0C67
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278524; cv=none; b=mTSBxM+2vWIbvXpmCj1hBtx8gNyZmPjZGujZo3etVtYIEg9b0tzYKmXUqQI+/zyruQuYrzFBXom8CLY3JMuE7xdm111zZtAgD6OInA7JMF7Ax6MnBy8RAP1bvJo0g6yVowtVeabM8/Si0qSPAPuavWop22O4cRR/IN6oqRMtuNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278524; c=relaxed/simple;
	bh=BCzxPB4ojBYQzI9r4A+6DIA2hOF5VYDPqfE7/YthD1o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XJgrlVHxSF2nlvmJ1GL+9Sg3h4ulhIDPej4UiaLLs+F403LcgB0jq/soPYO/SGny1IT/qP5iNIki4S3/AqDfBG39LmZI1HBY3fCoPm8c1Z3sYQ3+hx60/ckpbGm1WJel4zfK8WhXT9TNlyA3TWsDLBZNCwz5eR4Bk0sxzbf/7bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmhiW9ox; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmhiW9ox"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B7F1F000E9;
	Wed, 20 May 2026 12:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779278523;
	bh=bY38RAUE/SPUc5VJISXvC/1lBDIRpwGUshE7/6YPpII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZmhiW9oxtXTSPhiY8ugNc7tdNm2DrrcaVULNWikYqKv/9Fg1AeHreI15xUOedFz1+
	 xmBw6xIuKjNRUf9bh/P1RtpGhN7lHn7z69yuB7bb3li7rSs2MDyXeMjGcVcKpF+7XG
	 UtclRAM7qGur44xuqU++OsC7OknZTvno2GqlLGpkjVeDXHVpPr9ZGrWscJEO/dvNI6
	 E11+ZowlkYdvIlehisExGaPGRHnMEWCRjjKNTg1mILQ8TEikkgOOROg4XBnaNxL/1L
	 eDV4AFS9h0EYhqGDdGg6SeIalj+RPRAmC+qqgo7ajuBfox+KMKAX4JQzW9LA2BfZz9
	 MTO0qJo35L3eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/8] arm64: kdump: exclude non-dumpable reserved
 memory regions from vmcore
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260520091844.592753-7-chenwandun@lixiang.com>
References: <20260520091844.592753-7-chenwandun@lixiang.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 12:02:02 +0000
Message-Id: <20260520120203.20B7F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Lockless traversal of `memblock.memory` combined with a Time-of-Ch=
eck to Time-of-Use (TOCTOU) pattern can cause an out-of-bounds array write =
if memory hotplug runs concurrently.
--

commit 9b53a1de1ee9b0da26c3c33056f291e1bba1171e
Author: Wandun Chen <chenwandun1@gmail.com>

arm64: kdump: exclude non-dumpable reserved memory regions from vmcore

Reserved memory regions are excluded from vmcore by default unless marked
dumpable. This patch honors the dumpable flag to filter out device firmware
regions reserved via device tree to reduce vmcore size.

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

[Severity: High]
This is a pre-existing issue, but can this lockless traversal of
memblock.memory result in an out-of-bounds write if memory hotplug runs
concurrently?

The prepare_elf_headers() function iterates over memblock.memory twice:
first here to count the regions for sizing the cmem allocation, and then
later to populate cmem->ranges. This runs during the kexec_file_load
syscall which holds kexec_mutex but not memory hotplug locks like
device_hotplug_lock.

If a memory hotplug operation (e.g., via sysfs) occurs between the two
loops, memblock_add_node() could resize memblock.memory.regions via
memblock_double_array(). This would free the old array and increase the
region count.

Could this cause the second loop to iterate over a freed array and write
past the end of the allocated cmem->ranges array?

> +	nr_ranges +=3D of_reserved_mem_kdump_nr_ranges();
> =20
>  	cmem =3D kmalloc_flex(*cmem, ranges, nr_ranges);
>  	if (!cmem)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520091844.5927=
53-1-chenwandun@lixiang.com?part=3D6
