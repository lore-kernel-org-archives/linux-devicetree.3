Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6329925C80E
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495268; cv=none; b=kQ2JCn4psY+/fFgadGvUAyZ58NcyCVSjhImOK+cnk7eiOLMt8/AhAHwI/v3USBSndKJ4jhTG0/LOiz8Ouf36mAPQGOhrVfCRqdonlFTr/kkws2B5TxvgD5PbrikWTU1ew9iVe+u8a/5/DPSr1QNE3DMEH1kRBZj6oHomAgPZ3pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495268; c=relaxed/simple;
	bh=1rav9dsXalwRUF6zlfWezeKE6XuFgJuU5tWW1TcU7UY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TCJOLyPzYADBfB9CClfOPtsBGw2HKuLj95xuX4+yzJs/Gw9Dlsi8xzo5QqpsEgTsvS/zveRS0H6lWHit0THJWftcYL+cx5Ou0Kq4Cg4N7lUTU9HlfrYGN/QxcGfRYGLIJv6cEadpmHxs+cT++xqE8zWhBmZml5bhKkjdn0UdmEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwuKQnY7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwuKQnY7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB271F000E9;
	Wed,  8 Jul 2026 07:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495253;
	bh=HQzKref42l9xejoGDAeyF13y5kgZrrRp5pJWj/mCLcM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nwuKQnY7wJa8m2tQDK2C0v2jLUUMC5m+wyWgjgRjZl4a4OqAATlLxfhQ0ELSd+x5u
	 fFyATrI3OQmTX18oPn4gTU7AT0EHsXNBj81xaJANqnLEFxXqSeEqOvY0ffu4b+F8uO
	 rof/C1b+9ApxDLmeYfbtXSrxgEFbxxEN5P+2gCsVUkHedYMHAme7e4baC1ssL4snw7
	 uuuG39C8Vple6fX5Qozu1OnZ2BQVV/eHLXvUFdQi7mpP+p7HYJeSpD/3lRNYKtOp1p
	 ogOuRW4vsewxyy0mXS7oVGvmXkeUu4qIWnsSr5cFdiKL9ncNDa5AsCptQ8OPAgaGHT
	 PKeAzMdlrHHBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/26] kernel/configs: Register dynamic information
 into meminspect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-meminspect-v3-v3-13-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-13-7aa5a0a74d5c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:20:52 +0000
Message-Id: <20260708072053.2AB271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing Cleanup / Use-After-Free on module unload
- [High] Invalid Virtual-to-Physical Translation for module/kernel symbols
- [Medium] Double dispatch of MEMINSPECT_NOTIFIER_ADD for built-in initiali=
zations
--

--- Patch [13]: [PATCH v3 13/26] kernel/configs: Register dynamic informati=
on into meminspect ---
commit 69a88fbb66bd86af76d457f0ad80ecb85abfe14b
Author: Eugen Hristev <ehristev@kernel.org>

kernel/configs: Register dynamic information into meminspect

This commit registers kernel_config_data information into the memory
inspection table. It captures the start and end markers of the region=20
to assist debugging tools.

> diff --git a/kernel/configs.c b/kernel/configs.c
> --- a/kernel/configs.c
> +++ b/kernel/configs.c
> @@ -64,6 +65,11 @@ static int __init ikconfig_init(void)
> =20
>  	proc_set_size(entry, &kernel_config_data_end - &kernel_config_data);
> =20
> +	/* Register 8 bytes before and after, to catch the marker too */
> +	meminspect_lock_register_id_va(MEMINSPECT_ID_CONFIG,
> +				       (void *)&kernel_config_data - 8,
> +				       &kernel_config_data_end - &kernel_config_data + 16);

[Severity: High]
Since meminspect_lock_register_id_va() translates this address using
virt_to_phys(), is it safe to pass module or kernel symbol addresses here?

When built as a module, kernel_config_data resides in vmalloc space where
virt_to_phys() is invalid. Even when built-in, kernel symbols on some
architectures (like x86_64 or arm64) reside outside the linear mapping and
typically require __pa_symbol() instead.

[Severity: Medium]
Will this result in a double dispatch of the MEMINSPECT_NOTIFIER_ADD event
when the feature is built-in?

When CONFIG_IKCONFIG=3Dy, this initialization runs during the device_initca=
ll
phase, which fires the notifier. Later, meminspect_prepare_table() runs at
late_initcall and appears to fire the same event again for all populated
entries:

kernel/meminspect/meminspect.c:meminspect_prepare_table() {
    ...
    for (i =3D MEMINSPECT_ID_ELF; i < MEMINSPECT_ID_MAX; i++)
        if (inspect_entries[i].id)
            atomic_notifier_call_chain(&meminspect_notifier_list,
                                       MEMINSPECT_NOTIFIER_ADD,
                                       &inspect_entries[i]);
    ...
}

Won't consumers of the notifier chain receive two ADD events for the same
entry?

[Severity: High]
If this is built as a module, does ikconfig_cleanup() need to unregister
the dynamically added entry?

kernel/configs.c:ikconfig_cleanup() {
    remove_proc_entry("config.gz", NULL);
}

If the module is unloaded and the entry is not unregistered, won't the
meminspect table retain a dangling pointer to freed module memory, leading
to a use-after-free during subsequent table traversals?

> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-meminspect=
-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com?part=3D13
