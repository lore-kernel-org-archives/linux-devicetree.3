Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE9640DFC9
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107980; cv=none; b=U1TE8QtpFjmEwk0Umlen+ZZT7bAB2nQTvBC2TmErS7KYG94Zi9aitjWKgoMvzG/kBjh3W5XAu3tMSoM7ERVY2pkDdZiG7GfNQbLE8b29SWRgzSuzNwPJuVoiaOO4NT2yD8MswQ+q5eNwV1GfQw4e4Z143Y7Rf8eBC093YneNe3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107980; c=relaxed/simple;
	bh=jwC2Hfo74X8+0ijh/xcLZsAkwZduWAe27cZLfbLU+Fs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CkW6orkAIPh1iX3YlnqBerjHZlnbrJGSk+Lpr8c5uhC3JqcqYMhoy/iylrSBIwrsBXl1Gf9YEMoyGdkqs3UgCgXH4Cs9gPyIAvfltvrrsy3PLCxW2L1XuLMkd8m+1q3P8kYErFKn0Lp22BOoWd1Iflp7o97ENUZ0/USoV3HzDqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdYCz9a4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdYCz9a4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E15C2BCB7;
	Mon, 18 May 2026 12:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779107979;
	bh=jwC2Hfo74X8+0ijh/xcLZsAkwZduWAe27cZLfbLU+Fs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=HdYCz9a4pllphu5ypFmb1khqaXXmvWNpAuGSfjIhV478rnLVM/GJfdzvmkcXVAR/8
	 CKMZ6UbvB4rmmZGz+PuTv4cqrGQwq9wxAk43k3iQ/Bg0PHjQt907TVCAXDrRy8P08j
	 7wugCAJQxdkhQUx764nAsafZyxoEGRhmCJkzC9e92TNlZRPjdQYvGGVvR0rqUtZ243
	 07nwkz3w9QyxL3Po0IHHiAdmD4C8/eAPn+q3/h//lNQTyPHiNFmz17oBB+vdOyrGri
	 RPKaJd0hbV7cCseGYw65yXxPeUy6QcO33fpUSdw0FeaNvRS3JhTH0a5FBfJYOTmiz4
	 GTyOZ1GGyhvyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/10] ACPI: APEI: share GHES CPER helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmed Tiba" <ahmed.tiba@arm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-8-42698675ba61@arm.com>
References: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-8-42698675ba61@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 12:39:39 +0000
Message-Id: <20260518123939.A9E15C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Incorrect pointer arithmetic leads to out-of-bounds reads in ARM h=
ardware error handling.
- [High] State overwrite of the `queued` flag can mask unrecoverable synchr=
onous errors.
- [High] Permanent memory leak from the fixed-size `ghes_estatus_pool` when=
 `task_work_add` fails.
- [High] Permanent memory leak from the fixed-size `ghes_estatus_pool` when=
 the AER recovery kfifo is full.
- [High] Unsafe initialization semantics of `ghes_estatus_pool_init` risk p=
ool corruption or NULL pointer dereferences for shared providers.
- [Medium] Incomplete decoupling of APEI Kconfig dependencies prevents func=
tional sharing with non-APEI providers.
--

commit 593ad4fbd91409a6d18986b04b8adfb0d9f1ad5a
Author: Ahmed Tiba <ahmed.tiba@arm.com>

ACPI: APEI: share GHES CPER helpers

Wire GHES up to the helper routines in ghes_cper.c and remove the local
copies from ghes.c. This keeps the control flow identical while letting
the helpers be shared with other firmware-first providers.

> diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
> index d7a666a163c3a..0ff9d06eb78f9 100644
> --- a/drivers/acpi/apei/ghes_cper.c
> +++ b/drivers/acpi/apei/ghes_cper.c
[ ... ]
> +int ghes_estatus_pool_init(unsigned int num_ghes)
> +{
> +	unsigned long addr, len;
> +	int rc;
> +
> +	ghes_estatus_pool =3D gen_pool_create(GHES_ESTATUS_POOL_MIN_ALLOC_ORDER=
, -1);
> +	if (!ghes_estatus_pool)
> +		return -ENOMEM;
[ ... ]
> +	return 0;
> +
> +err_pool_add:
> +	vfree((void *)addr);
> +
> +err_pool_alloc:
> +	gen_pool_destroy(ghes_estatus_pool);
> +
> +	return -ENOMEM;
> +}
> +EXPORT_SYMBOL_GPL(ghes_estatus_pool_init);

Is it safe to export this initialization function without safeguards against
multiple invocations?

If multiple firmware-first providers call it, ghes_estatus_pool might be
unconditionally overwritten, leading to leaked memory and corruption when
older objects are freed into the new pool. Also, if a non-GHES provider
uses the helpers without ensuring initialization, could gen_pool_alloc crash
on a NULL pool?

[ ... ]
> +static bool ghes_do_memory_failure(u64 physical_addr, int flags)
> +{
> +	struct ghes_task_work *twcb;
> +	unsigned long pfn;
> +
> +	if (!IS_ENABLED(CONFIG_ACPI_APEI_MEMORY_FAILURE))
> +		return false;

The commit message states the goal is to let these helpers be shared with
other firmware-first providers. However, functions like
ghes_do_memory_failure() and ghes_handle_aer() are guarded by
CONFIG_ACPI_APEI_MEMORY_FAILURE and CONFIG_ACPI_APEI_PCIEAER.

Since a non-APEI provider might not have these enabled, will memory and
AER errors be silently dropped?

[ ... ]
> +	if (flags =3D=3D MF_ACTION_REQUIRED && current->mm) {
> +		twcb =3D (void *)gen_pool_alloc(ghes_estatus_pool, sizeof(*twcb));
> +		if (!twcb)
> +			return false;
> +
> +		twcb->pfn =3D pfn;
> +		twcb->flags =3D flags;
> +		init_task_work(&twcb->twork, memory_failure_cb);
> +		task_work_add(current, &twcb->twork, TWA_RESUME);
> +		return true;
> +	}

This isn't a bug introduced by this patch, but pre-exists in the moved code.
Does this code leak the twcb allocation if task_work_add() fails?

If the target task is exiting, the callback might never be executed,
permanently leaking memory from the boot-time fixed-size ghes_estatus_pool.

[ ... ]
> +bool ghes_handle_arm_hw_error(struct acpi_hest_generic_data *gdata,
> +			      int sev, bool sync)
> +{
> +	struct cper_sec_proc_arm *err =3D acpi_hest_get_payload(gdata);
[ ... ]
> +	p =3D (char *)(err + 1);
> +	length -=3D sizeof(err);

This isn't a bug introduced by this patch, but pre-exists in the moved code.
Does this incorrectly subtract the size of the pointer err (8 bytes) instead
of the size of the struct it points to?

This leaves length artificially inflated, which might allow the subsequent
bounds check to falsely pass and read past the end of the firmware-provided
payload into adjacent kernel memory.

[ ... ]
> +void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
> +{
> +#ifdef CONFIG_ACPI_APEI_PCIEAER
> +	struct cper_sec_pcie *pcie_err =3D acpi_hest_get_payload(gdata);
[ ... ]
> +		aer_info =3D (void *)gen_pool_alloc(ghes_estatus_pool,
> +						  sizeof(struct aer_capability_regs));
> +		if (!aer_info)
> +			return;
> +		memcpy(aer_info, pcie_err->aer_info, sizeof(struct aer_capability_regs=
));
> +
> +		aer_recover_queue(pcie_err->device_id.segment,
> +				  pcie_err->device_id.bus,
> +				  devfn, aer_severity,
> +				  (struct aer_capability_regs *)
> +				  aer_info);
> +	}
> +#endif
> +}

This isn't a bug introduced by this patch, but pre-exists in the moved code.
Is it possible for aer_info to be leaked here?

If the internal aer_recover_ring kfifo in aer_recover_queue() is full,
the item is dropped with a log message, but the aer_info memory allocated
from ghes_estatus_pool is never freed. Could this silent leak eventually
deplete the finite error status pool during an AER storm?

[ ... ]
> +void ghes_cper_handle_status(struct device *dev,
> +			     const struct acpi_hest_generic *generic,
> +			     const struct acpi_hest_generic_status *estatus,
> +			     bool sync)
> +{
> +	int sev, sec_sev;
> +	struct acpi_hest_generic_data *gdata;
> +	guid_t *sec_type;
> +	const guid_t *fru_id =3D &guid_null;
> +	char *fru_text =3D "";
> +	bool queued =3D false;

Also regarding sharing helpers with other modules, should
ghes_cper_handle_status be exported so that loadable modules can use it
as intended?

> +
> +	sev =3D ghes_severity(estatus->error_severity);
> +	apei_estatus_for_each_section(estatus, gdata) {
[ ... ]
> +		if (guid_equal(sec_type, &CPER_SEC_PLATFORM_MEM)) {
> +			struct cper_sec_mem_err *mem_err =3D acpi_hest_get_payload(gdata);
> +
> +			atomic_notifier_call_chain(&ghes_report_chain, sev, mem_err);
> +
> +			arch_apei_report_mem_error(sev, mem_err);
> +			queued =3D ghes_handle_memory_failure(gdata, sev, sync);
> +		} else if (guid_equal(sec_type, &CPER_SEC_PCIE)) {
> +			ghes_handle_aer(gdata);
> +		} else if (guid_equal(sec_type, &CPER_SEC_PROC_ARM)) {
> +			queued =3D ghes_handle_arm_hw_error(gdata, sev, sync);
[ ... ]
> +	}
> +
> +	/*
> +	 * If no memory failure work is queued for abnormal synchronous
> +	 * errors, do a force kill.
> +	 */
> +	if (sync && !queued) {
> +		dev_err(dev,
> +			HW_ERR GHES_PFX "%s:%d: synchronous unrecoverable error (SIGBUS)\n",
> +			current->comm, task_pid_nr(current));
> +		force_sig(SIGBUS);
> +	}
> +}

This isn't a bug introduced by this patch, but pre-exists in the moved code.
Can the queued flag be incorrectly overwritten during later loop iterations?

If an early section contains a synchronous unrecoverable error but fails to
queue recovery, and a later section successfully queues its recovery, the
queued flag might be overwritten to true. Could this bypass the force_sig
fallback at the end of the function, allowing the task to continue executing
despite a fatal memory error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-topics-ahm=
tib01-ras_ffh_arm_internal_review-v4-0-42698675ba61@arm.com?part=3D8
