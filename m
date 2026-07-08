Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981F93ECBD2
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495559; cv=none; b=QxXBe3bpGom71quebLGr7s39S1gwtb5N4SVtQuz/9b7VG7cDThEKOLRoOzQYMQUCjRIcnP6YXwdXSScXLdie4MdjADGYVfYkglQRp9v/YGJPtsyMmu+BRDD/n0WoqDUKHC1twWFkUd/H5UOLdb0iIYvMoHgXIdklnSAjz5o1kmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495559; c=relaxed/simple;
	bh=uObYszLbg14EoKe4JyXVG/xY+aDCmtyEGNgQ/c7Y2/Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XTxa7VAmDIPZ9C8Zs3MUg22qWLJZhK5ipf70el7csjLpBTj/1VQx5kzi43BTx1hPJ8qEDSoknhoKjrSACS2qEvlBz3ow/khpRZZ37WC7B5ZaIefOIS0IGOwIyCP306DRhz55EQVFzTf9z5e2h3m9W9J0TPXPouIX0q+3/CG+ty4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DszTG6lV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DszTG6lV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6894D1F000E9;
	Wed,  8 Jul 2026 07:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495546;
	bh=nqbI6xzJzHRNTXfiZNgfQyTxC5TbBjwNdXEr9NDncRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DszTG6lVWvN7CuwuqvoKIjQe8LZdY8MqfD25KlCVE9xFPpWj4KjF61vGrVo3JLQ23
	 aFqABjQ0joiFBBrRI8S7MgmWixY5BrxaLS/xZzFvez4sq0OClou0M2tZF3iSqpVufR
	 JvaBUErbCgpVae8MbhYAzogSt2eEiQg8GfA7cJBq+sOqNbFz5saVWwSdEcfGDQwR4s
	 CEdR56KjNW26wRlVY6DyDGwTK+xOkdyIOnfQnvnVEICdePAJnlwOn8UifOP97JjLru
	 gFiFes6tZd4NZZ23bDzabvsCWf0PBu8N+eqVYXBoGKqsppoA44rX66Vfl4xSebwFZ4
	 C8a12qjjYV2gQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/26] kernel/vmcore_info: Register dynamic
 information into meminspect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-meminspect-v3-v3-12-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-12-7aa5a0a74d5c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:25:44 +0000
Message-Id: <20260708072545.6894D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The meminspect registration captures a stale size and physical add=
ress for `vmcoreinfo_data` at initialization time, causing dynamically appe=
nded crash-time data to be truncated and safecopy buffer redirects to be mi=
ssed.
- [High] Registering the unaligned vmcoreinfo_size causes the resulting mem=
inspect ELF core image to be misaligned and corrupted upon concatenation.
--

--- Patch [12]: [PATCH v3 12/26] kernel/vmcore_info: Register dynamic infor=
mation into meminspect ---
commit 8bf40adf00adb32d4b5c8192b6dcc0d380039441
Author: Eugen Hristev <ehristev@kernel.org>

kernel/vmcore_info: Register dynamic information into meminspect

Register vmcoreinfo information into the inspection table.
Because the size of the info is computed after all entries are
added, there is no point in registering the whole page; instead,
call the inspection registration once everything is in place with
the right size. A second reason is that the vmcoreinfo is added
as a region inside the ELF core image note, so there is no point
in having blank space at the end.

> diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
> index 8614430ca212a..c5181e9d049cf 100644
> --- a/kernel/vmcore_info.c
> +++ b/kernel/vmcore_info.c

[ ... ]

> @@ -247,6 +248,9 @@ static int __init crash_save_vmcoreinfo_init(void)
>  	arch_crash_save_vmcoreinfo();
>  	update_vmcoreinfo_note();
> =20
> +	meminspect_lock_register_id_va(MEMINSPECT_ID_VMCOREINFO,
> +				       (void *)vmcoreinfo_data, vmcoreinfo_size);

[Severity: High]
If this registration captures the address and size at initialization time,
does it miss the crash-time updates?

Looking at crash_save_vmcoreinfo(), it appends the crash time which increas=
es
vmcoreinfo_size, and it can conditionally swap the pointer to a safecopy:

kernel/vmcore_info.c:crash_save_vmcoreinfo() {
	...
	if (vmcoreinfo_data_safecopy)
		vmcoreinfo_data =3D vmcoreinfo_data_safecopy;

	vmcoreinfo_append_str("CRASHTIME=3D%lld\n", ktime_get_real_seconds());
	...
}

Will the meminspect table retain the stale size and original address,
resulting in truncated or potentially corrupted crash dumps since the safe
buffer redirect is missed?


[Severity: High]
Does this unaligned size cause issues when concatenating meminspect regions?

If vmcoreinfo_size is not 4-byte aligned, registering the exact size here
seems to conflict with how the meminspect ELF header generator calculates
segment offsets:

kernel/meminspect/meminspect.c:init_elfheader() {
	...
	note_len =3D (... +
	    ALIGN(vmcoreinfo_size, 4));

	buf_sz =3D elfh_size + note_len - ALIGN(vmcoreinfo_size, 4);
	...
}

Could the missing padding cause the ELF core dump structure to become
misaligned, making the p_offset pointers incorrect and failing to parse
in external tools?

> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-meminspect=
-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com?part=3D12
