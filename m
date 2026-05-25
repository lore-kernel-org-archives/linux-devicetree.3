Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9997330B11
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700311; cv=none; b=Zii8K4J+cRGRK8lDj0VXErIBGSTe4bLmwLMDgZZu7RKQLw2SCIf5n5X7RgXGfJ06yrRG+7pAhJR1mE5ojyuxyZPVZBfHaifvT+FncXoimicwYsmVdFcYbFGw3iel/8XBODejHKgZ8RBF26B5GKHAySPynepOsU4Eg0+9ZZJmSUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700311; c=relaxed/simple;
	bh=t3Uj+AAmWqrYhDRnj/Jc73UEUesmnCGX1RIcFLcaWZY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZxcrSIlfNxRmOJ35rSrSBb79OMv7iMESjCLzeO8bEnc0EiXW4hGFGWgw2NOaNILzvrwj6HClBdGNBlh4tODzMpQvPPoPBjFyPlDS67+I62Ij+DsMnGcs/rYYHWjaQnwXBtCda/5jqyUyDRUSc3AQvyZBABO/mKJGwbNkrHM/vp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecCdrPBK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecCdrPBK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1E01F00A3D;
	Mon, 25 May 2026 09:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779700309;
	bh=DFQgW4KRUMLUlZr52Gl1waa6iZspm+vHBYyC1vWUSm0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ecCdrPBKwzmz5n1ZdUQI5fHEb6DYdHjI8r7kcj68X5UEYjhpKnHL82Yx2yIogK8F/
	 XWautovR8Xl4CF2CpAf53GTnYD831O5sXxfiNU8kMyadZQ2RVuM6+VxtVOiLXmQMWT
	 u3eGz0d32GZyQck3rrmTcjSSvO770TJDJngy68Te9bBsuMY8RLZSEVnneWTBw9dFPc
	 M2o8I27jQvWSir+qbXwBbDbVS6MaLbqvKebtG+7XOPrMVLaul2CDhFYdVXjrscgLgd
	 tysBFD7Qo3pGEpXNqZoyjyLCsMap6buDICKeTFoenY+jJJEHg6K8MyPorQXi05l44M
	 K4LcCTqf30F+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 04/17] arm64: kexec: Fix image->elf_headers memory
 leak during retry loop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260525084932.934910-5-ruanjinjie@huawei.com>
References: <20260525084932.934910-5-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 09:11:48 +0000
Message-Id: <20260525091149.1A1E01F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Critical] Use-After-Free and Double Free due to residual `vfree(headers)=
` in the error path.
- [Low] Compilation failure when CONFIG_CRASH_DUMP is disabled.
- [Low] Uninitialized variables passed to `load_other_segments()` when load=
ing non-crash kernels.

Pre-existing issues:
- [High] CMA pages allocated for kexec segments are permanently leaked when=
 `image->nr_segments` is truncated.
--

commit c40f3dfedb4fb90dbc751e696184623090b1055a
Author: Jinjie Ruan <ruanjinjie@huawei.com>
arm64: kexec: Fix image->elf_headers memory leak during retry loop

This commit moves the ELF header allocation outside the retry loop in
image_load() to fix a memory leak during kexec placement retries. It reuses
the single allocated buffer and updates load_other_segments() to receive the
headers and size as arguments instead of allocating them internally.

> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_im=
age.c
> index b70f4df15a1ae..79efeaeb71e93 100644
> --- a/arch/arm64/kernel/kexec_image.c
> +++ b/arch/arm64/kernel/kexec_image.c
> @@ -44,6 +44,11 @@ static void *image_load(struct kimage *image,
>  	struct kexec_buf kbuf =3D {};
>  	unsigned long text_offset, kernel_segment_number;
>  	struct kexec_segment *kernel_segment;
> +#ifdef CONFIG_CRASH_DUMP
> +	/* load elf core header */
> +	unsigned long headers_sz;
> +	void *headers;
> +#endif
>  	int ret;

[ ... ]

> @@ -89,6 +94,18 @@ static void *image_load(struct kimage *image,
> =20
>  	kernel_segment_number =3D image->nr_segments;
> =20
> +#ifdef CONFIG_CRASH_DUMP
> +	if (image->type =3D=3D KEXEC_TYPE_CRASH) {
> +		ret =3D prepare_elf_headers(&headers, &headers_sz);
> +		if (ret) {
> +			pr_err("Preparing elf core header failed\n");
> +			return ERR_PTR(ret);
> +		}
> +		image->elf_headers =3D headers;
> +		image->elf_headers_sz =3D headers_sz;
> +	}
> +#endif
> +
>  	/*
>  	 * The location of the kernel segment may make it impossible to satisfy
>  	 * the other segment requirements, so we try repeatedly to find a
> @@ -99,7 +116,8 @@ static void *image_load(struct kimage *image,
>  		kernel_segment =3D &image->segment[kernel_segment_number];
>  		ret =3D load_other_segments(image, kernel_segment->mem,
>  					  kernel_segment->memsz, initrd,
> -					  initrd_len, cmdline);
> +					  initrd_len, cmdline,
> +					  headers, headers_sz);

[Severity: Low]
Will this cause a build failure when CONFIG_CRASH_DUMP is disabled?

The headers and headers_sz variables are declared inside an
#ifdef CONFIG_CRASH_DUMP block, but are unconditionally passed to
load_other_segments() here.

Also, when CONFIG_CRASH_DUMP is enabled but the image is a standard kexec
kernel (image->type !=3D KEXEC_TYPE_CRASH), headers and headers_sz remain
uninitialized.

Could passing these uninitialized variables trigger compiler warnings or
undefined behavior?

>  		if (!ret)
>  			break;
> =20
> @@ -107,7 +125,7 @@ static void *image_load(struct kimage *image,
>  		 * We couldn't find space for the other segments; erase the
>  		 * kernel segment and try the next available hole.
>  		 */
> -		image->nr_segments -=3D 1;
> +		image->nr_segments =3D kernel_segment_number;

[Severity: High]
This is a pre-existing issue, but does truncating image->nr_segments here
leak CMA pages?

When kexec_add_buffer() successfully allocates from CMA, it saves the page
in image->segment_cma[image->nr_segments]. If we erase segments by rolling
back image->nr_segments, the cleanup function kimage_free_cma() will only
iterate up to the new nr_segments.

Are the CMA pages for the discarded segments permanently lost?

>  		kbuf.buf_min =3D kernel_segment->mem + kernel_segment->memsz;
>  		kbuf.mem =3D KEXEC_BUF_MEM_UNKNOWN;
>  	}
> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/m=
achine_kexec_file.c
> index e31fabed378a5..daf81a873bbd3 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c

[ ... ]

> @@ -105,16 +106,7 @@ int load_other_segments(struct kimage *image,
>  	kbuf.buf_min =3D kernel_load_addr + kernel_size;
> =20
>  #ifdef CONFIG_CRASH_DUMP
> -	/* load elf core header */
> -	void *headers;
> -	unsigned long headers_sz;
>  	if (image->type =3D=3D KEXEC_TYPE_CRASH) {
> -		ret =3D prepare_elf_headers(&headers, &headers_sz);
> -		if (ret) {
> -			pr_err("Preparing elf core header failed\n");
> -			goto out_err;
> -		}
> -
>  		kbuf.buffer =3D headers;
>  		kbuf.bufsz =3D headers_sz;
>  		kbuf.mem =3D KEXEC_BUF_MEM_UNKNOWN;
> @@ -128,9 +120,7 @@ int load_other_segments(struct kimage *image,
>  			vfree(headers);
>  			goto out_err;

[Severity: Critical]
Since the headers buffer allocation was moved out to image_load(), does this
vfree() cause a use-after-free and double free?

If kexec_add_buffer() fails, this path frees the headers buffer and returns
an error. The retry loop in image_load() will then unconditionally call
load_other_segments() again, passing the now freed headers pointer back to
kexec_add_buffer().

Additionally, the post-load cleanup function
arch_kimage_file_post_load_cleanup() unconditionally calls
vfree(image->elf_headers).

Could this lead to memory corruption?

>  		}
> -		image->elf_headers =3D headers;
>  		image->elf_load_addr =3D kbuf.mem;
> -		image->elf_headers_sz =3D headers_sz;
> =20
>  		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=3D0x%lx memsz=3D0=
x%lx\n",
>  			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525084932.9349=
10-1-ruanjinjie@huawei.com?part=3D4
