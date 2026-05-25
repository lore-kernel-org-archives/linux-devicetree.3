Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43BC3E3C72
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701600; cv=none; b=KHEeFxktiSUwzIzaJKVMbCakwN4JRwrndAdAfugWHv5vF1RQkOCGDReXufl+18drPih5J4FmnjY4Bd6n+VIcNBwgToyLKpIxK/EFuPTyXCDk8Jb5XK0IQSpxzrQlDyre5NamiGzLSDi9la/MOmUQgR47xyuAA2ppX/rh/h5q4/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701600; c=relaxed/simple;
	bh=GQbv4aWVY1T0t73ViRoBACDc1nhUG9XNnv5gz96kXOE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eQoP8tY3QHvVVd73Q1FRdyPIGNH1T43JmW4B58nMsiiE2fqV1DrsPzZ285YXC8OevtMCF6QbEGyaUTBxFh/V2FRScbqlCcAwzBdPHQ6B4aczkRspWe62tpGN9QQGejGehTRu7Ml6yO6x3yX/aUwD9EHSAjN1J9RKpRiYV0Ch0co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdgPMbC0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdgPMbC0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C591F000E9;
	Mon, 25 May 2026 09:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779701598;
	bh=58W2dRQqLUE3bZ4NSfmHGCYX9hhjAt+rGc9lA9qsnFo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kdgPMbC07MJsirSVrIeKc9sReXNIvDpvrVTzyG3hACQN2gek3jP9TC70GBZtKTfhC
	 KpWy0g7gWEQ1+ZsdQp5g3T+lYr+hMg+fiA+IntDrAxPF7pqUHc11+iJrvQbiYDfZGR
	 zdnq/UuDNUa6rhkWxowEZKG5oKxwq+J2xapH8Z25avND9y8PnOlkQk3D48OrXbyWXN
	 qpC04W4kHgWYJ47XXEctnZ68EIr4DWY1xVs1LqLaMPOR+YdRoiFpqhBp1tBXgvXoZY
	 eqGBDxhpB/MbA27GkKs6HvCnTMa8P6kdHcSIl4oDMGIIpsLxRvt4BJM49Dc4Yj3Y42
	 w/CFcnGocNXzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 10/17] arm64: kexec_file: Use
 crash_prepare_headers() helper to simplify code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260525084932.934910-11-ruanjinjie@huawei.com>
References: <20260525084932.934910-11-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 09:33:17 +0000
Message-Id: <20260525093318.12C591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Stale function prototype for prepare_elf_headers() left in the arch=
 header.

Pre-existing issues:
- [Critical] Retrying after load_other_segments() failure leads to Use-Afte=
r-Free and Double Free of the ELF headers buffer.
--

commit 6831fa88a7516f58be581afc5bb7de8776b9c44c
Author: Jinjie Ruan <ruanjinjie@huawei.com>

arm64: kexec_file: Use crash_prepare_headers() helper to simplify code
   =20
Use the newly introduced crash_prepare_headers() function to replace
the existing prepare_elf_headers(), allocate cmem and exclude crash
kernel memory in the crash core, which reduce code duplication.

> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_im=
age.c
> index 884e446f08e34..770a4c7bf5737 100644
> --- a/arch/arm64/kernel/kexec_image.c
> +++ b/arch/arm64/kernel/kexec_image.c
> @@ -97,14 +96,11 @@ static void *image_load(struct kimage *image,
> =20
>  #ifdef CONFIG_CRASH_DUMP
>  	if (image->type =3D=3D KEXEC_TYPE_CRASH) {
> -		get_online_mems();
> -		ret =3D prepare_elf_headers(&headers, &headers_sz);
> +		ret =3D crash_prepare_headers_locked(true, &headers, &headers_sz, NULL=
);
>  		if (ret) {
>  			pr_err("Preparing elf core header failed\n");
> -			put_online_mems();
>  			return ERR_PTR(ret);
>  		}
> -		put_online_mems();
>  		image->elf_headers =3D headers;
>  		image->elf_headers_sz =3D headers_sz;
>  	}

[Severity: Critical]
This isn't a bug introduced by this patch, but it appears there's a
use-after-free and double-free risk in the retry loop below this code.

If load_other_segments() fails during the retry loop, it frees the
headers buffer:

arch/arm64/kernel/machine_kexec_file.c:load_other_segments() {
    ...
	if (image->type =3D=3D KEXEC_TYPE_CRASH) {
		...
		ret =3D kexec_add_buffer(&kbuf);
		if (ret) {
			vfree(headers);
			goto out_err;
		}
    ...
}

If the retry loop in image_load() continues after this failure, won't the
next iteration pass the already freed headers pointer back into
load_other_segments()?

Additionally, since image->elf_headers stores this pointer, does
arch_kimage_file_post_load_cleanup() also call vfree(image->elf_headers)
upon failure, leading to a double-free?

[ ... ]

> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/m=
achine_kexec_file.c
> index c0ace89ded923..66fbfbaec1c67 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c
> @@ -40,51 +40,33 @@ int arch_kimage_file_post_load_cleanup(struct kimage =
*image)
>  }
> =20
>  #ifdef CONFIG_CRASH_DUMP
> -int prepare_elf_headers(void **addr, unsigned long *sz)

[Severity: Low]
Does the function prototype for prepare_elf_headers() need to be
removed from arch/arm64/include/asm/kexec.h as well?

It appears to be left behind as dead code since this patch removes its
architecture-specific implementation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525084932.9349=
10-1-ruanjinjie@huawei.com?part=3D10
