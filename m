Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1759392C32
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 10:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309771; cv=none; b=rN0lwsjvdNLIN66IDC01QYi2ms1LECaHRgtqXKj/aTrs05oBjuKaQ4sZBBhb4aCWw/YZEbE8xuN6SEh4YTs/oORROQbtOpmjK2DskOXGPPUgRVqd+ufzO1BQg9cro+jzg8WMSdfIAw2ITr5zSccDQ6749fQTVTGVzTPS4UAfOIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309771; c=relaxed/simple;
	bh=WlP+XHSIQsix5un3Kur/aHv0tezstUKc8ArO/pNwSvQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C/7kmuZS8f6PgFf+M2TQOjtKMMzO5f3e+PskpYBQUj/ZGnHhodMRrulXd59SMOZsk/llXAAPgzza/0HCHz6yJJ+JGFbdH8DJp8xLvCHfUSvXtuikxLLfqjqaHWpUxfFwPGMe+1NvaZZc6ZY/xrauQjTPF9WoK9tdk4KfqNKgtNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VB9K9joL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VB9K9joL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7133B1F00893;
	Mon,  1 Jun 2026 10:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780309769;
	bh=dGcW4dVMT0Gi8DM+Zhzs/MD2Asuu4oRwknBtGBOZ9lw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VB9K9joLVYReZaQajVv26UmKBe3zkkSLX1tBfIOdx54k17vNzXPq2sTrJ5JZtzAco
	 zZzV/JvqZx/bMKRJkTftNkbjRZNRghOMTNxGwE3PwEPRCaW4PizNzN/ATA0+BvECIm
	 aJstI6hgg6IhsVhuQ9dpOa6+f/x5PY8u3HX+mnU+zSaoxsL3pb3s5K4MAjhP+euw+Q
	 cks5TSRmn0R0A7kzRKe/rJNPSU3A52K/5tPBEkbLtghF5O/6fjX1TBReTIXGTlSO47
	 LpHx0O8cIYXeMk+4ELeDV69I4DIl3w27oosBLTUQW123P4ZMeIBodgfFoXuBGe2Xpu
	 qbO0DORABAv1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 09/23] kexec: Fix UAF and Double Free in
 crash_load_dm_crypt_keys()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601094805.2928614-10-ruanjinjie@huawei.com>
References: <20260601094805.2928614-10-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 10:29:29 +0000
Message-Id: <20260601102929.7133B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] The patch breaks the `is_dm_key_reused` feature by erroneously dis=
carding recovered keys and silently falling back to the user keyring on kex=
ec placement retries.

Pre-existing issues:
- [Critical] A severe heap buffer overflow occurs in `get_keys_from_kdump_r=
eserved_memory()` due to the allocation size of `keys_header` becoming desy=
nchronized with a dynamically updated `key_count`.
- [Critical] A Time-Of-Check to Time-Of-Use race between reading the global=
 `key_count` and iterating the unlocked configfs list allows a heap buffer =
overflow when populating `keys_header`.
- [High] A race condition exists between the configfs `reuse` attribute sto=
re and the `kexec_file_load` syscall, allowing a Use-After-Free dereference=
 of the `kexec_crash_image` pointer.
- [High] The `build_keys_header` function iterates over the configfs `cg_ch=
ildren` list without holding the required subsystem mutex, leading to a Use=
-After-Free or list corruption.
- [High] The `config_keys_restore_store` function lacks synchronization and=
 unconditionally reallocates the global `keys_header` when toggled, causing=
 a memory leak.
--

commit 5c3cfda384c3afc1b8e6d5155bf696ea37a80c9b
Author: Jinjie Ruan <ruanjinjie@huawei.com>

kexec: Fix UAF and Double Free in crash_load_dm_crypt_keys()

This commit attempts to fix a use-after-free and double free in the
dm-crypt keys handling path during arm64 kexec image placement retries.
It zeroes the keys_header global pointer after it is freed in the failure
path and updates the header regeneration check to trigger a fresh build
if keys_header is missing.

> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
> index cb875ddb6ba68..2c54628763377 100644
> --- a/kernel/crash_dump_dm_crypt.c
> +++ b/kernel/crash_dump_dm_crypt.c
> @@ -412,13 +412,12 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>  	};
>  	int r;
> =20
> -
>  	if (key_count <=3D 0) {
>  		kexec_dprintk("No dm-crypt keys\n");
>  		return 0;
>  	}
> =20
> -	if (!is_dm_key_reused) {
> +	if (!is_dm_key_reused || unlikely(!keys_header)) {
[Severity: High]
If kexec_add_buffer() fails and we retry, does this new condition
unintentionally discard the recovered keys?

When is_dm_key_reused is true, falling back to build_keys_header() here
appears to overwrite the intended configuration by fetching keys from the
current user keyring instead of reusing the recovered dm-crypt keys.

>  		image->dm_crypt_keys_addr =3D 0;
>  		r =3D build_keys_header();
>  		if (r) {
[ ... ]
> @@ -437,6 +436,7 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>  	if (r) {
>  		pr_err("Failed to call kexec_add_buffer, ret=3D%d\n", r);
>  		kvfree((void *)kbuf.buffer);
> +		keys_header =3D NULL;
[Severity: High]
Nulling the pointer here triggers the faulty fallback mentioned above on
the next iteration of the retry loop.

>  		return r;
>  	}
>  	image->dm_crypt_keys_addr =3D kbuf.mem;

[Severity: Critical]
This is a pre-existing issue, but is there a risk of a heap buffer overflow
during reuse?

kernel/crash_dump_dm_crypt.c:get_keys_from_kdump_reserved_memory() {
    ...
    memcpy(keys_header, keys_header_loaded, get_keys_header_size(key_count)=
);
    ...
}

If a user adds more keys via configfs after the initial allocation, key_cou=
nt
increments. When reuse is triggered, this copies data based on the new
key_count into a keys_header buffer that was sized for the old key_count,
writing past the allocated bounds.

[Severity: High]
This is a pre-existing issue, but can this lead to a use-after-free?

kernel/crash_dump_dm_crypt.c:config_keys_reuse_store() {
    ...
    if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
    ...
}

Since kexec_crash_image is checked without synchronization, a concurrent
kexec_file_load syscall could swap and free the old image. The configfs
thread might then dereference the freed pointer when calculating the page
frame in get_keys_from_kdump_reserved_memory().

[Severity: High]
This is a pre-existing issue, but does this loop traverse the configfs list
unsafely?

kernel/crash_dump_dm_crypt.c:build_keys_header() {
    ...
    list_for_each_entry(item, &config_keys_subsys.su_group.cg_children,
                        ci_entry) {
    ...
}

The cg_children list is dynamically modified via mkdir/rmdir and is normally
protected by su_mutex. Since this runs during kexec load without that lock,
a concurrent rmdir could mutate the list, leading to list corruption or a
use-after-free.

[Severity: Critical]
This is a pre-existing issue, but is there a time-of-check to time-of-use
race that causes an out-of-bounds write?

kernel/crash_dump_dm_crypt.c:build_keys_header() {
    ...
    keys_header =3D kzalloc(get_keys_header_size(key_count), GFP_KERNEL);
    ...
    list_for_each_entry(item, &config_keys_subsys.su_group.cg_children,
                        ci_entry) {
        ...
        r =3D read_key_from_user_keyring(&keys_header->keys[i]);
    ...
}

If a concurrent process adds a new configfs key after the allocation but
during the loop, the unlocked traversal will iterate over more items than
allocated. Without bounds checking against the original key_count, this
overflows the keys array.

[Severity: High]
This is a pre-existing issue, but does this unconditionally leak memory?

kernel/crash_dump_dm_crypt.c:config_keys_restore_store() {
    ...
    if (!restore)
        restore_dm_crypt_keys_to_thread_keyring();
    ...
}

kernel/crash_dump_dm_crypt.c:restore_dm_crypt_keys_to_thread_keyring() {
    ...
    keys_header =3D kzalloc(keys_header_size, GFP_KERNEL);
    ...
}

There is no check if keys_header is already allocated, nor is the existing
pointer freed. A user could repeatedly write '0' to the restore attribute
to trigger the allocation and exhaust memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601094805.2928=
614-1-ruanjinjie@huawei.com?part=3D9
