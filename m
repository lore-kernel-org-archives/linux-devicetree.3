Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043E8396D29
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 10:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309280; cv=none; b=ZMCcTPaofUw0bIoEjjZyXIexepAgTJBaRoPJUZWd13GlQbqOveHigax1+vqMDiGzpVbSC/Vy49dthbnLrM3l3REm9j+Zk0Co4uMQYBZRzLyHPE3QUM61A5EbtdEsflafrJm6gw0XhOEUISS4isSwiurflJZP6gdUB2v0Ygg4sb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309280; c=relaxed/simple;
	bh=/7jY3aADkmuj2OBCCexFPNOX5p+YLO8qFCCEoEcVkcE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lU0/zWLcidArFdiADyiQi4dLGQPx/ZIpX63SNPCtp6tqGAO9Po/uZQLuw6zvia4L9XwR0PM0ZZn2yr49x7z4tSaTwDWvCBh59moNRR9SfadMDIVlBQfrg5NJ6jLqlsYL/k0lY18oOlqr3WdnatrCkVmTipfKQqi+T3Y7PiJfJ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJskGjkL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJskGjkL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07301F00898;
	Mon,  1 Jun 2026 10:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780309277;
	bh=waxQIKPLDwPwRD4W0QeqdHjnyOODSnQtRttFlKxB7vk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BJskGjkLf0k+OK/Z5stkRftuQgidprce+u4TGH5Gsy92qddwX78Sw2JGt8sQKhhnI
	 x/Rzt10QXKU3SKv9K4U8/mWZvnJzretKQh/6/XLEtOEcup8PvknUD20VvvBDIW7O1c
	 pGwCx1XPReonNharBiZJ/PFGxxfJxh8Foxvk6N9Xi7ryb04/6wB/YnOxBRrRIVuEMn
	 hXK04ToG2MGelsNFkiMuHC2Cul8VzWPugLIGmYWAKVFm3N+t/LxAjJeB4bvjfyjUYZ
	 O4FGZypENsLVccL1HmKEw2IPa+nCkZZFZxmqGPSBEq3hO6Em0Y7cxDljtuz0uv6ofU
	 dSMb12oPJ8Vvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 08/23] arm64: kexec_file: Fix image->elf_headers
 memory leak during retry loop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260601094805.2928614-9-ruanjinjie@huawei.com>
References: <20260601094805.2928614-9-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 10:21:16 +0000
Message-Id: <20260601102116.A07301F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Lockless traversal of configfs subsystem children list and unprote=
cted read of `key_count` causes out-of-bounds writes and use-after-free.
--

commit d09b9ae34966886d76e46f5d76f2ae24ee9d84a3
Author: Jinjie Ruan <ruanjinjie@huawei.com>

arm64: kexec_file: Fix image->elf_headers memory leak during retry loop

This commit moves prepare_elf_headers() outside the retry loop in
image_load(). It prevents leaking memory allocated for image->elf_headers
on failure paths and reuses the pre-allocated header on retries.

> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/m=
achine_kexec_file.c
> index 13c247c288660..4cbb71e1f8ed5 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c
[ ... ]
> @@ -105,32 +105,19 @@ int load_other_segments(struct kimage *image,
>  	kbuf.buf_min =3D kernel_load_addr + kernel_size;
> =20
>  #ifdef CONFIG_CRASH_DUMP
[ ... ]
> -		if (ret) {
> -			vfree(headers);
> +		if (ret)
>  			goto out_err;
> -		}
> -		image->elf_headers =3D headers;
>  		image->elf_load_addr =3D kbuf.mem;
> -		image->elf_headers_sz =3D headers_sz;
> =20
>  		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=3D0x%lx memsz=3D0=
x%lx\n",
>  			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);

[Severity: High]
This is a pre-existing issue, but the crash dump setup here proceeds to call
crash_load_dm_crypt_keys(image) just below this block, which exposes a
potential race condition in the dm-crypt keys setup.

Is it safe for build_keys_header() in kernel/crash_dump_dm_crypt.c to
traverse config_keys_subsys.su_group.cg_children without holding the
subsystem mutex (config_keys_subsys.su_mutex)?

If a user concurrently adds a key via configfs:

kernel/crash_dump_dm_crypt.c:config_keys_make_item() {
    ...
    key_count++;
    ...
}

The lockless read of key_count to size the allocation:

kernel/crash_dump_dm_crypt.c:build_keys_header() {
    ...
    keys_header =3D kzalloc(get_keys_header_size(key_count), GFP_KERNEL);
    ...
}

could race with the key addition. This would mean the subsequent list
traversal:

    list_for_each_entry(item, &config_keys_subsys.su_group.cg_children, ci_=
entry) {

could process more items than the allocated space allows, causing an
out-of-bounds write to keys_header->keys[i]. It could also encounter
partially unlinked items during concurrent configfs directory removals,
leading to a use-after-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601094805.2928=
614-1-ruanjinjie@huawei.com?part=3D8
