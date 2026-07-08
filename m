Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1D73D75DF
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495321; cv=none; b=YziyMP7tLRPBgqDDRUJJwyn5kIRrjw9+0i2Qu6Uw7ihD4HEHvQ8fYNwHI6hqIRii18c4pUeN7Q3OMqqHX8AAcbeBMoF8ibxLyPe/0SST4kw4vbJaUwFCk4ZWjn0MNAH3rVSRk2qwY1UNm0704Xd82INKQCMP141QNUUwdipK3G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495321; c=relaxed/simple;
	bh=Sf77mjRzrtMDrvy2jF/R5L8Ny16BETQvhDbzbx5Httw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZbHlQtIfwBGSYzHKBORJb0gEIaEBeoxtY6iDUyNNVnOZd3EzpkwXmUgjFLC5IyCjtXzx8YOV+eDRU0YsYXPj8L5NF9ehQP5EBPBY0DLdvG0rl0L0JQoDHkDbrs01WB19spre5xgvFtpPQx4Faj/pGulBTdhTFagJBM1zpE+Pd7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0ElIOMl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0ElIOMl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5EFC1F000E9;
	Wed,  8 Jul 2026 07:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495301;
	bh=UPtBIzsoB3zweDU9jFycXI7glMu793OsokDd4fpIIbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C0ElIOMlnc9UyXDAQSyhYKvXLjgdLenM2qCf4/97eEyS47pD66KBcURyA0qoIchfx
	 gbkKSp8t0+UDVPqk6yIQJTFZZrNhZo3A8whiM+TTtzRxxPPk9UptFOE0VSMerGUu2f
	 8C0ERvcNHTejpYb7od/0Qgdj9W70/SW9o0u/x0QcXrd4wlS7woC21zXISo7LFH/S/z
	 5Y8XUQ0wZRDpbw/q8DDzFonASTdCW0VkCAjzzD0a65xj4VmHp+T1Fxu4321BBXu2Ft
	 5O4A4BnDJXJysKubSNZVFX5hBt7txQaNx5z7NfyRx/T02IiPX8wDrS/ocqo9R40ijL
	 39m5QtKyU9eCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/26] init/version: Annotate static information into
 meminspect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-meminspect-v3-v3-2-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-2-7aa5a0a74d5c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:21:40 +0000
Message-Id: <20260708072140.C5EFC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The linux_banner meminspect entry is duplicated in the .inspect_=
table section, leading to brittle size resolution based strictly on linker =
command-line order.

Pre-existing issues:
- [High] Adding static kernel symbols to the meminspect table triggers a ke=
rnel warning during boot because the framework incorrectly uses virt_to_phy=
s() on non-linear addresses.
--

--- Patch [2]: [PATCH v3 02/26] init/version: Annotate static information i=
nto meminspect ---
commit fe87675e956aedb4b693667a58386a5bc91ca7cd
Author: Eugen Hristev <ehristev@kernel.org>

init/version: Annotate static information into meminspect

Annotate vital static information into inspection table:
 - init_uts_ns
 - linux_banner

Information on these variables is stored in a dedicated meminspect
section.

> diff --git a/init/version-timestamp.c b/init/version-timestamp.c
> index 375726e05f690..37bdcdd443f9b 100644
> --- a/init/version-timestamp.c
> +++ b/init/version-timestamp.c

[ ... ]

> @@ -24,3 +25,5 @@ struct uts_namespace init_uts_ns =3D {
>  const char linux_banner[] =3D
>  	"Linux version " UTS_RELEASE " (" LINUX_COMPILE_BY "@"
>  	LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION "\n";
> +
> +MEMINSPECT_SIMPLE_ENTRY(linux_banner);

[Severity: Medium]
Does this result in duplicate entries for linux_banner in the inspect_table
section?

Because init/version-timestamp.c is compiled independently as a standalone
object and also included directly by init/version.c, this macro expands twi=
ce
during the build.

This generates two entries: one with a dummy size from the early compile
phase where UTS_VERSION is a stub, and one with the actual size. While
scripts/link-vmlinux.sh currently appends version-timestamp.o last to ensure
the real size overwrites the dummy size during initialization, this approach
relies strictly on linker command-line order.

Could this break under Link Time Optimization or section sorting optimizati=
ons,
causing the dummy size to be used and truncating the banner in the inspecti=
on
tool?

> diff --git a/init/version.c b/init/version.c
> index 94c96f6fbfe6a..eeb1392365627 100644
> --- a/init/version.c
> +++ b/init/version.c

[ ... ]

> @@ -51,4 +52,6 @@ const char linux_banner[] __weak;
> =20
>  #include "version-timestamp.c"
> =20
> +MEMINSPECT_SIMPLE_ENTRY(init_uts_ns);

[Severity: High]
This isn't a bug introduced by this patch, but adding static kernel symbols
here triggers a kernel warning during boot because the meminspect framework
incorrectly uses virt_to_phys() on non-linear addresses.

When meminspect_prepare_table() iterates over the table unconditionally at =
boot:

kernel/meminspect/meminspect.c:meminspect_prepare_table()
    if (!inspect_entries[e->id].pa && inspect_entries[e->id].va)
        inspect_entries[e->id].pa =3D virt_to_phys(inspect_entries[e->id].v=
a);

It passes the virtual addresses of static symbols like linux_banner and
init_uts_ns to virt_to_phys(). This records an invalid physical address in =
the
meminspect table, and on architectures where static kernel symbols reside in
non-linear virtual memory (like vmalloc space on arm64 or x86_64 with KASLR=
),
this triggers a kernel WARN.

Should the framework be updated to use __pa_symbol() for these entries inst=
ead
to safely handle non-linear kernel image addresses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-meminspect=
-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com?part=3D2
