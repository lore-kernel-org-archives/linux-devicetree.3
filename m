Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A1B3A382D
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 10:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780308049; cv=none; b=Shub6kOF8DySSkMYM8KAPF7X4VYmjJvmZbh71ACSYCnU6YkrGNDv3aBsP03eMM3NxqySgRKNL2y74xQAXJI+gpX2rCLLQKwHbnaSROM5mXiV5n5zjGVKbl6ITmS74hx8J7oYNT0XQyhpoOhLMEw2yf9sIYTHE5IP25z6yqZBKBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780308049; c=relaxed/simple;
	bh=vPHP8I/UX0j5aOvf9jNZTi5aFwiw7oTpOGmLMTGnmyc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ovuk3edKAQbpjzr8mT//EfqIhbMvlQ73n+vSBo2/Q6KMJ0VwdkL0S6r6YgfahuQYNdk5ENwGfCdyNSWJxv9nLH6fsvZy1FwWbJmRTXzGEDmMNuOuqwnQQOmKL80PlawMFwXqxkz0s3hMMJHAvhBbdIM5bxlccTkdG+puEik82To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPEvFuex; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPEvFuex"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12111F00893;
	Mon,  1 Jun 2026 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780308040;
	bh=8PoILybRUN2udAjVN9PUzUr7LuJILxbVeBmD/H5DF0o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZPEvFuexmd8Xr++W8SJlOACUs4fSG6D24v7rEQ0lueBeQ1+s0oMTSZvTHG4pcSeJf
	 cxa5IvOwYN/fTV42mWR35pCFRUL+9qS04rxDzQrJk0la4KdA7rS/OVdJyelb78o3vg
	 ygT280phCoxHip7AUqtGTJgQ++/Cnk9LGqm6VuQGkVy7Eoe66jOx+BlQuTlRkzsoWe
	 /yfbUQAyR9eSBVm9Cu9VxzeOaXK81eQ9i0SYPubvx0G5vupN7z9johR7v6etjyfEYr
	 GJeHe5pHnhkp3MI9rFd92cjSg5pXsoSUXQydzXOPSuH5GdfT5o4NzFnUyhVdIUu6H2
	 KEEx6cgYRZXBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 03/23] powerpc/kexec_file: Fix NULL pointer
 dereference in kexec_extra_fdt_size_ppc64()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601094805.2928614-4-ruanjinjie@huawei.com>
References: <20260601094805.2928614-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 10:00:39 +0000
Message-Id: <20260601100039.B12111F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] FDT Buffer Under-allocation due to logic error in kexec_extra_fdt_=
size_ppc64()
--

commit 78687759639490ab63d0d6924f151d698ff15bbc
Author: Jinjie Ruan <ruanjinjie@huawei.com>

powerpc/kexec_file: Fix NULL pointer dereference in kexec_extra_fdt_size_pp=
c64()

This commit adds an early return to kexec_extra_fdt_size_ppc64() to prevent
a NULL pointer dereference if the rmem pointer is not allocated.

> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_=
load_64.c
> index 8c72e12ea44e5..fdeedf102c38e 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -649,6 +649,9 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage=
 *image, struct crash_mem *
>  	struct device_node *dn;
>  	unsigned int cpu_nodes =3D 0, extra_size =3D 0;
> =20
> +	if (!rmem)
> +		return 0;
> +

[Severity: High]
Does this early return improperly short-circuit the rest of the FDT extra
size calculation for independent components when no reserved memory regions
are present?

The get_reserved_memory_ranges() function can legitimately return 0 with a
NULL rmem on platforms lacking reserved memory regions. Returning 0 here
entirely bypasses other size estimations, such as plpks passwords,
hotplugged CPU nodes, and especially kdump_extra_fdt_size_ppc64().

Because kdump_extra_fdt_size_ppc64() calculates linux,drconf-usable-memory
entries which can exceed 32KB on systems with large hotpluggable memory
configurations, the baseline 4KB extra space cannot accommodate this missing
size. This could lead to FDT setup failing with -FDT_ERR_NOSPACE during
setup_new_fdt_ppc64() and prevent kexec/kdump from successfully loading.

Would it be better to conditionally guard only the rmem->nr_ranges access
further down in the function instead of returning early?

>  	// Budget some space for the password blob. There's already extra space
>  	// for the key name
>  	if (plpks_is_available())

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601094805.2928=
614-1-ruanjinjie@huawei.com?part=3D3
