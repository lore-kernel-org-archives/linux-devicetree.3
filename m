Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCAB3EE1EE
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496352; cv=none; b=aBr6cBKSOIWb8wG7E63hbfRNCMzAWIJC5eap/z+ACXZHdoGJHBURU0KKfwtg3RBkHbSnvLSkabhNwCdlosiKd+iSdKMYkiaYINKG4VzKjkuPkdNrq740eed0BG7/UXRrY9ojQ2tIMIvYbop+FScDmUazKSxqK+pY60ANKp1YmEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496352; c=relaxed/simple;
	bh=P5ArlwkBBdf0bFhp9k0116Qh7v2QHsjGawv8BIT68n4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WJ/t7RyBegyJJW4rxF49R3bjuIUYHU+gDzWUR9NLJzrrAol3iBKFU7l4gxJR3bZGp6oLjzzEZHsuAGGo3Bo2dWcl9qZz896cC7YenI6D5wCG8l7dh4p9rKOt44cgKSGCllwecqiNk14f+DVQJBW/rT3jLBGI3o2kv1o5ypjcAzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMrnxSWl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMrnxSWl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72301F000E9;
	Wed,  8 Jul 2026 07:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783496343;
	bh=MZoh8QEWLaVkiPbjTmkZ1LiCHigis+lapZFy99+UT6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aMrnxSWlGSXW6gs5M3mu8glrCq/Y2dDIadTiiUpmO1qNBWw2nMuW3eKi2yE3PHU/I
	 qaPphaoz0+ZDbuB/1nJQaDQe+J68hYeXUtScX+/DbtzbxbBk4Z7xtBWq+4yzomzwTE
	 MwWp9MiDMeLZyIXw/PxHoT78WLyqASk5zNuP8CAO27OQm40AOw9d/g+pgT/7Fz0ff6
	 FRvAiD9y96tpTyCqfbScsfm0WCCLh//tu84wJtpJXDQmMjj6A55eubbq0BnT08KUiL
	 EkiqCKy7Uj0hPTBPMt39yonHxL8WvvMi8xyvx8TNTXwgyJ1YYNYSRAMc2QXL8BLItq
	 5r8x4BmrBlAJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/6] arm64/efi: Add and parse custom PSCI EFI
 configuration table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-efi-psci-v1-2-9efb3abf0e4c@kernel.org>
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
 <20260708-efi-psci-v1-2-9efb3abf0e4c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:39:02 +0000
Message-Id: <20260708073902.E72301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unclamped `num_features` leads to out-of-bounds read of `efi_psci.=
features` array.
- [High] PSCI power-down calls (CPU_SUSPEND/CPU_OFF) bypass the `arm64_efi_=
psci_call` epilogue, causing a permanent `preempt_count` and `TTBR0` leak.
- [High] `arm64_efi_psci_call()` lacks validation of EFI runtime services s=
tate, leading to a translation fault and panic if booted with `efi=3Dnorunt=
ime`.
--

--- Patch [2]: [PATCH RFC 2/6] arm64/efi: Add and parse custom PSCI EFI con=
figuration table ---
commit fe3c6fc95ebeb940962943f65e4f442c468d4718
Author: Sven Peter <sven@kernel.org>

arm64/efi: Add and parse custom PSCI EFI configuration table

This commit adds a new custom EFI configuration table and extracts a
pointer to a PSCI handler. It invokes the handler under the EFI virtual
mapping as a plain call rather than through the runtime services dispatch.
This approach relies on the firmware to not use lazy state and to be
reentrant.

> diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> index 30cd7f8043986..e40885567f9e9 100644
> --- a/arch/arm64/kernel/efi.c
> +++ b/arch/arm64/kernel/efi.c
[ ... ]
> @@ -242,6 +243,63 @@ bool efi_runtime_fixup_exception(struct pt_regs *reg=
s, const char *msg)
>  /* EFI requires 8 KiB of stack space for runtime services */
>  static_assert(THREAD_SIZE >=3D SZ_8K);
> =20
> +struct efi_psci_table efi_psci __ro_after_init;
> +static unsigned long efi_psci_handler_table __initdata =3D EFI_INVALID_T=
ABLE_ADDR;
> +const efi_config_table_type_t efi_arch_tables[] __initconst =3D {
> +	{LINUX_EFI_ARM_PSCI_HANDLER_TABLE_GUID, &efi_psci_handler_table},
> +	{}
> +};
> +
> +static void __init arm64_efi_init_psci(void)
> +{
> +	struct efi_psci_table *psci;
> +
> +	if (efi_psci_handler_table =3D=3D EFI_INVALID_TABLE_ADDR)
> +		return;
> +
> +	psci =3D early_memremap_ro(efi_psci_handler_table, sizeof(*psci));
> +	if (psci =3D=3D NULL) {
> +		pr_warn("Unable to map PSCI table.\n");
> +		return;
> +	}
> +
> +	memcpy(&efi_psci, psci, sizeof(*psci));

[Severity: High]
Is it safe to copy the num_features field from untrusted firmware directly
into efi_psci without clamping it to EFI_PSCI_MAX_FN?

The destination structure defines features as a fixed-size array of size
EFI_PSCI_MAX_FN. If firmware provides a num_features value larger than
this, subsequent driver code relying on num_features to indicate the number
of valid entries could read past the end of the efi_psci object in .rodata.

Could we validate and clamp num_features here?

> +	early_memunmap(psci, sizeof(*psci));
> +}
> +
> +void __init arm64_efi_init(void)
> +{
> +	efi_init();
> +	arm64_efi_init_psci();
> +}
> +
> +unsigned long arm64_efi_psci_call(unsigned long function_id, unsigned lo=
ng arg0,
> +				  unsigned long arg1, unsigned long arg2)
> +{
> +	unsigned long ret, flags;
> +
> +	/*
> +	 * Note that unlike for regular EFI runtime calls we don't have to save
> +	 * FP/SIMD state here because the handler ABI forbids using those.
> +	 * Likewise, we do not take any lock here because the handler has to be
> +	 * re-entrant. We couldn't take the sleeping efi_runtime_lock here
> +	 * anyway because we may be called from atomic context for cpuidle
> +	 * and CPU bring-up.
> +	 */
> +	local_irq_save(flags);
> +	efi_virtmap_load();
> +	uaccess_ttbr0_enable();
> +	post_ttbr_update_workaround();

[Severity: High]
What happens here if the system is booted with efi=3Dnoruntime?

If EFI runtime services are disabled, arm_enable_runtime_services() returns
early, and efi_mm.pgd is left as NULL. However, arm64_efi_init_psci()
parses the configuration table and registers the handler regardless of whet=
her
efi_enabled(EFI_RUNTIME_SERVICES) is true.

When arm64_efi_psci_call() unconditionally invokes efi_virtmap_load(), it
would pass the NULL efi_mm.pgd to cpu_switch_mm(), programming a garbage
physical address into TTBR0_EL1. This could crash the system with a
translation fault when attempting to execute the unmapped EFI virtual addre=
ss.

Should we check efi_enabled(EFI_RUNTIME_SERVICES) before registering the
handler or attempting to load the map?

> +
> +	ret =3D efi_psci.psci_handler(function_id, arg0, arg1, arg2);
> +
> +	uaccess_ttbr0_disable();
> +	efi_virtmap_unload();
> +	local_irq_restore(flags);

[Severity: High]
Can PSCI power-down calls (like CPU_SUSPEND or CPU_OFF) bypass this
epilogue?

efi_virtmap_load() calls preempt_disable(), and efi_virtmap_unload()
calls preempt_enable().

Successful CPU power-down calls do not return to the caller. For example, f=
or
CPU_SUSPEND, execution resumes via the kernel's hardware reset vector
(cpu_resume), which bypasses this return path and jumps straight to the
caller of __cpu_suspend_enter.

As a result, the epilogue of arm64_efi_psci_call() is skipped entirely,
permanently leaking the +1 preempt_count and leaving TTBR0_EL1 incorrectly
mapped to efi_mm on the idle thread.

Is there a way to handle this bypass for suspend/off calls?

> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-efi-psci-v=
1-0-9efb3abf0e4c@kernel.org?part=3D2
