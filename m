Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4C53D413C
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778564892; cv=none; b=QuBNVSK809HuNyBpkUIVnzkbVMOg293lFXz2i6gGCqHto4VyvhfFb5NH+oJNJeqk+jLNDgIOcsKwuvkMB70kaLLu+13p/uGD6L+3LeUVjIlY3Me1Tf5WAjepOEebsqjLsgIDgdbTrtZw2OfEuxjg+9AphxjWF2vq/NuRU6PJ3cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778564892; c=relaxed/simple;
	bh=yzZ0ilCbU1G0/yVZuOMEJTyG1cn/76wQFxUCUi9dqYo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XYhoAk/B1iY/Jjao4DeHBmVwUnUU8VV61Ld7qVSNuqSrWiHBOQYbS/zGkJU4v4s//OLdtF4Df5EA7bE53L4htCm89uGdN3yLX8Zw24uYxS2ux11IlBAAENvtQdTjW7lidatFsYYsgUGutlCA9MVwR2i2/4JGb4uXuplUL7pHZIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ku17xVTn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ku17xVTn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FD8C2BCB0;
	Tue, 12 May 2026 05:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778564891;
	bh=yzZ0ilCbU1G0/yVZuOMEJTyG1cn/76wQFxUCUi9dqYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ku17xVTnyYzUZTu1ElGymnYp54avN3WHKflq3b5vJXBxh73bcKrHaqv/ChNdkNc4e
	 nKrODN/CBbmMzGcyneZ3yoH/rbRh6RwxZDTsYRuf/ZezkQY5dobXJBcjXooHCtBVMX
	 WKTc5wan/g/1ibFT1Y70Y0P5fcv0AOdFYfKVFFf215uurUjf2hMvCHAiUgCCsZ39uD
	 82KVfqkXl2xFq1j+cIzJFI3zYZ/3ug3BM96JJFhzQVLFTV1R558e3rVv8whLMzCoSz
	 zecgBWZcPshSAmjERUGzYDnk9DTzfv6TdFb2NvnIFWft7tmkK4ikvir/J9+rlbzdKy
	 gW8WjnxcjE0wQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 10/15] x86/kexec: Use crash_prepare_headers() helper
 to simplify code
Reply-To: sashiko@lists.linux.dev
To: "Jinjie Ruan" <ruanjinjie@huawei.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511030454.1730881-11-ruanjinjie@huawei.com>
References: <20260511030454.1730881-11-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 05:48:10 +0000
Message-Id: <20260512054810.B4FD8C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Calling `crash_prepare_headers()` from the memory hotplug notifier=
 causes a self-deadlock on `mem_hotplug_lock`.
--

commit 3ffc33a6d9cd3e7840883325b10a8172439b4b8f
Author: Jinjie Ruan <ruanjinjie@huawei.com>

x86/kexec: Use crash_prepare_headers() helper to simplify code

This commit replaces x86's custom prepare_elf_headers() with the generic
crash_prepare_headers() helper to handle cmem allocation, population, and
exclusion of crash ranges. The change implements the required
architecture-specific callbacks to support the generic core, reducing
code duplication.

> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> index 7fa6d45ebe3f7..10ef24611f2af 100644
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c

[ ... ]

> @@ -532,7 +465,7 @@ void arch_crash_handle_hotplug_event(struct kimage *i=
mage, void *arg)
>  	 * Create the new elfcorehdr reflecting the changes to CPU and/or
>  	 * memory resources.
>  	 */
> -	if (prepare_elf_headers(&elfbuf, &elfsz, &nr_mem_ranges)) {
> +	if (crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, N=
ULL)) {

Will this cause a self-deadlock when called from the memory hotplug notifie=
r?

During memory hotplug operations, the memory hotplug lock is held for
write before notifying the chain. For instance:

online_pages()
    mem_hotplug_begin() // takes mem_hotplug_lock for write
    ...
    memory_notify(MEM_ONLINE, ...)
        crash_memhp_notifier()
            arch_crash_handle_hotplug_event()
                crash_prepare_headers()

Then inside crash_prepare_headers() from kernel/crash_core.c:

int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *=
sz,
			  unsigned long *nr_mem_ranges)
{
	unsigned int max_nr_ranges;
	struct crash_mem *cmem;
	int ret;

	get_online_mems();

get_online_mems() attempts to acquire the mem_hotplug_lock for read.=20

Since the percpu_rw_semaphore does not support recursive read-after-write
locking by the same thread, won't this block indefinitely and result in a
deadlock?

>  		pr_err("unable to create new elfcorehdr");
>  		goto out;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511030454.1730=
881-1-ruanjinjie@huawei.com?part=3D10
