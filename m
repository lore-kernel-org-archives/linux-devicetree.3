Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB8C3E9F61
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779706349; cv=none; b=YmjGiJJvKH8/jxerUSqWtAjGei4IFLwwhsfkWqtA+vmsUlTbqunw9+uURi+qLsYQql8uBFosdJsm5m29JwRDypdsydGfdts7WJtRm0KscfKYC6R1OMZUZQzkxPeAaH/x0lRY3InQ2B6tAvgU8JLQiJk2p+9JjYXjbDifcf2DkdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779706349; c=relaxed/simple;
	bh=iSvM5FSXg8aEBadxyyqQYD1FnPy2Lb3Pjm3JnZjQyDI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uvOTk+Z+2NaTIi4XRj6ANk7RnJ/4epAY22AxEXq0J1RDLFrgO4O/kKYJkpLQDi+rjPWzG+6T9s1pV6RaWFSFd6aUZOKyUVb8pG8zmytDlj5vNQa957iBWpyJWbFdpj/wF9zATlns+/W6xqzTexlf2wqj+wlwy+BP7icgTG+yr9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSRPaKFk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSRPaKFk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2421F000E9;
	Mon, 25 May 2026 10:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779706347;
	bh=0GxtY0yogvNkAhD2ZNPYNGZJ7CWT0X3CDgizI1YYqE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RSRPaKFkT2L9I08L2tVIgK5tG6c0QhbR0tSB6YrefsDe+ubyw/nC7Jd3EHwO0cHo/
	 xLhA1pZTsAuhwhkeMixQy2jrWzUhpjiDtIdDPHCoXyxbVnfxurvKnEzvAMJBGpfDGl
	 jPeHS4ukpkN3FgDdVcnUXP3zHJzST6LawcCux1VHlwqyn9tS39+xx+L6z/25qUIZWo
	 KdI1lR1dk9exEZ+3tUKuh8UXLmyARueQ9XktVpZa+m1Vb4OlKUihR7K6dnWaTDZAn8
	 h8SUxW9PPsfNM+pwPxv8A/85u8pv2JWHFkELS6PbUYNMZpH5015On/ksRzobBK3qY6
	 QsP+qtWRZkPWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 06/17] arm64: kexec_file: Fix potential buffer
 overflow in prepare_elf_headers()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260525084932.934910-7-ruanjinjie@huawei.com>
References: <20260525084932.934910-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 10:52:26 +0000
Message-Id: <20260525105227.3C2421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] If kexec_add_buffer() fails for the ELF headers segment in load_ot=
her_segments(), it erroneously calls vfree(headers). However, the caller im=
age_load() operates in a placement retry loop and will reuse the freed poin=
ter on the next iteration, leading to a Use-After-Free. Furthermore, the gl=
obal cleanup path will double-free the pointer.
- [High] In crash_load_dm_crypt_keys(), if kexec_add_buffer() fails, the gl=
obal keys_header is freed via kvfree() but the pointer is not set to NULL. =
If the kexec load sequence retries, it will trigger a Use-After-Free or Dou=
ble Free.
--

commit 205dd983aa0b64a4b48461b2eeaf22aeada0f3e8
Author: Jinjie Ruan <ruanjinjie@huawei.com>

arm64: kexec_file: Fix potential buffer overflow in prepare_elf_headers()

This commit addresses a TOCTOU race condition in prepare_elf_headers() duri=
ng
memory hotplug events by physically isolating the locking contexts. It moves
the get_online_mems() read lock to the top-level architecture image loaders
and adds bounds checking in machine_kexec_file.c.

> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_im=
age.c
> index 79efeaeb71e93..884e446f08e34 100644
> --- a/arch/arm64/kernel/kexec_image.c
> +++ b/arch/arm64/kernel/kexec_image.c

[ ... ]

> @@ -96,11 +97,14 @@ static void *image_load(struct kimage *image,
> =20
>  #ifdef CONFIG_CRASH_DUMP
>  	if (image->type =3D=3D KEXEC_TYPE_CRASH) {
> +		get_online_mems();
>  		ret =3D prepare_elf_headers(&headers, &headers_sz);
>  		if (ret) {
>  			pr_err("Preparing elf core header failed\n");
> +			put_online_mems();
>  			return ERR_PTR(ret);
>  		}
> +		put_online_mems();
>  		image->elf_headers =3D headers;
>  		image->elf_headers_sz =3D headers_sz;
>  	}

[Severity: High]
This is a pre-existing issue, but does the retry loop directly below this
code lead to a use-after-free if kexec_add_buffer() fails in
load_other_segments()?

Looking at image_load(), the while loop attempts to load segments and calls
load_other_segments() repeatedly. If load_other_segments() fails during
kexec_add_buffer(), it calls vfree(headers). However, the loop in
image_load() will try again and pass the same freed headers pointer to
load_other_segments() on the next iteration.

Additionally, if the loop exhausts all options, does the global cleanup path
arch_kimage_file_post_load_cleanup() also unconditionally call
vfree(image->elf_headers), resulting in a double-free?

[Severity: High]
This is a pre-existing issue, but can this retry loop similarly trigger
a use-after-free or double-free with keys_header?

If kexec_add_buffer() fails inside crash_load_dm_crypt_keys(), the global
pointer keys_header is freed via kvfree() but not set to NULL.

When image_load() retries, crash_load_dm_crypt_keys() is invoked again. If =
it
calls build_keys_header(), it executes:

    if (keys_header !=3D NULL)
        kvfree(keys_header);

which would trigger a double-free. Alternatively, if is_dm_key_reused is
true, would it reuse the freed pointer directly for a new
kexec_add_buffer() call?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525084932.9349=
10-1-ruanjinjie@huawei.com?part=3D6
