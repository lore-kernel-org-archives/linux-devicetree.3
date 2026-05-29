Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E243BD63B
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051239; cv=none; b=IjzZi+1kSFPlP59vPdGap3tx8R1qaItIWaOtfQcwLRtQWYsNHQt7X4azyhf5juoFGdWaDcBgSVegCvoamPYyStYn3uf6eal/OHA2gmc/+mDD2CGY/yU6TMiqDpqLNTH63THRcHT1IyAdYX4OJJtYR+LrWT+6VS2yZ35hGceT26Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051239; c=relaxed/simple;
	bh=KLF11ChEzJICtnL6Wogz+Q1HvAHnThVriwwEkcG4y2k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=op8kPXBb0eDZ8mulcOmZb7V4RbvjIL5KtIQZ2VGNiAGUzR25CFx0yisS5pdfGAT3gC1e+sJ6ncfWjOMf3QnHH4HPOpZTtaaGhadVfPMpxRd1x7E9aKMk/lutmDI+rAQJXXczIQcx7XT7yibMjrvjBzmmwq6bj024wLSYMLP7cJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObHFXI8I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObHFXI8I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 978111F00893;
	Fri, 29 May 2026 10:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780051238;
	bh=Bvhofl3GMa57cwEXjxtsGcUlUeVU/Jx6nSkcEUWho64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ObHFXI8IVujRiPGE/fAAAJPDtpEt0gDu0UFMRzsvQPviV1xo+tCNPuZnuTLNEFrTw
	 pJ4rAOPZHKDfa+j7dLWNx6E5tbECjxyA4hhh2HV3x4h8Q77OzmFNkpLNIYv47QYKBW
	 dUKT7q+2JNFJNEg8+AkXUMRd54FS68CJAG3tc3g2e8oa2Eg0Lz3YKZAr/A8qVpcNhm
	 xwWjf7Zw9yInDujHle1lw2QiNOG4+q9uq7ylh4Ygka7rPRXiHLdKx5I2vjP96IhpXq
	 6yuf7uttt1y6xzKBL6uwtGzhYQw2F63SeEvceHp2Z8YMxOGMHm1lkspHH3ujNzCaNU
	 UJ+KbEOQt4nzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/10] ACPI: APEI: share GHES CPER helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmed Tiba" <ahmed.tiba@arm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-8-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-8-2e0500d42642@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 10:40:36 +0000
Message-Id: <20260529104037.978111F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Low] The `generic` parameter in `ghes_cper_handle_status()` is completel=
y unused.
- [Low] Internal helper functions are unnecessarily exposed in the global `=
<acpi/ghes_cper.h>` header.

Pre-existing issues:
- [High] The `queued` boolean is unconditionally overwritten during iterati=
on over multiple error sections, potentially masking a successful recovery =
queueing and causing an unintended SIGBUS.
- [High] Incorrect pointer math using `sizeof(err)` where `err` is a pointe=
r defeats bounds checking, allowing out-of-bounds reads.
- [High] The `twcb->pfn` field is accessed after its containing memory chun=
k has been freed, causing a Use-After-Free.
- [High] The global `ghes_estatus_pool` pointer is left dangling if its ini=
tialization fails, leading to a Use-After-Free.
--

commit 286897690a5dfe45676a004c4969ff7b921f6c22
Author: Ahmed Tiba <ahmed.tiba@arm.com>

ACPI: APEI: share GHES CPER helpers
   =20
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
> +
> +	len =3D GHES_ESTATUS_CACHE_AVG_SIZE * GHES_ESTATUS_CACHE_ALLOCED_MAX;
> +	len +=3D (num_ghes * GHES_ESOURCE_PREALLOC_MAX_SIZE);
> +
> +	addr =3D (unsigned long)vmalloc(PAGE_ALIGN(len));
> +	if (!addr)
> +		goto err_pool_alloc;
> +
> +	rc =3D gen_pool_add(ghes_estatus_pool, addr, PAGE_ALIGN(len), -1);
> +	if (rc)
> +		goto err_pool_add;
> +
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

[Severity: High]
This is a pre-existing issue, but does this leave ghes_estatus_pool as a
dangling pointer?

If vmalloc or gen_pool_add fails, gen_pool_destroy is called, but
ghes_estatus_pool is not set to NULL. If other code checks for
ghes_estatus_pool to avoid double initialization, it might use the
destroyed pool.

[ ... ]

> +static void memory_failure_cb(struct callback_head *twork)
> +{
> +	struct ghes_task_work *twcb =3D container_of(twork, struct ghes_task_wo=
rk, twork);
> +	int ret;
> +
> +	ret =3D memory_failure(twcb->pfn, twcb->flags);
> +	gen_pool_free(ghes_estatus_pool, (unsigned long)twcb, sizeof(*twcb));
> +
> +	if (!ret || ret =3D=3D -EHWPOISON || ret =3D=3D -EOPNOTSUPP)
> +		return;
> +
> +	pr_err("%#llx: Sending SIGBUS to %s:%d due to hardware memory corruptio=
n\n",
> +	       twcb->pfn, current->comm, task_pid_nr(current));

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to access
twcb->pfn after twcb has been freed via gen_pool_free?

If the memory chunk is reallocated and overwritten by another thread
before the pr_err call, this could log corrupted data.

[ ... ]

> +bool ghes_handle_arm_hw_error(struct acpi_hest_generic_data *gdata,
> +			      int sev, bool sync)
> +{
> +	struct cper_sec_proc_arm *err =3D acpi_hest_get_payload(gdata);
> +	int flags =3D sync ? MF_ACTION_REQUIRED : 0;
> +	int length =3D gdata->error_data_length;
> +	char error_type[120];
> +	bool queued =3D false;
> +	int sec_sev, i;
> +	char *p;

[ ... ]

> +	p =3D (char *)(err + 1);
> +	length -=3D sizeof(err);

[Severity: High]
This is a pre-existing issue, but does length -=3D sizeof(err) subtract the
correct amount here?

Since err is a pointer, sizeof(err) evaluates to the pointer size (8 bytes)
rather than the size of the underlying struct cper_sec_proc_arm. This
might artificially inflate the remaining length and bypass the bounds
checks in the loop below.

> +
> +	for (i =3D 0; i < err->err_info_num; i++) {
> +		struct cper_arm_err_info *err_info;
> +		bool is_cache, has_pa;
> +
> +		/* Ensure we have enough data for the error info header */
> +		if (length < sizeof(*err_info))
> +			break;

[ ... ]

> +		if (is_cache && has_pa) {
> +			queued =3D ghes_do_memory_failure(err_info->physical_fault_addr, flag=
s);

[Severity: High]
This is a pre-existing issue, but does assigning directly to queued
overwrite successful recovery queueings?

If an earlier iteration successfully sets queued to true, but a later one
fails and sets it to false, the function might incorrectly return false and
cause an unintended SIGBUS. Would a logical OR (queued |=3D ...) be more
appropriate here?

[ ... ]

> +void ghes_cper_handle_status(struct device *dev,
> +			     const struct acpi_hest_generic *generic,

[Severity: Low]
Is the generic parameter used anywhere in this function body? It looks like
it could be removed to improve clarity.

> +			     const struct acpi_hest_generic_status *estatus,
> +			     bool sync)
> +{
> +	int sev, sec_sev;
> +	struct acpi_hest_generic_data *gdata;
> +	guid_t *sec_type;
> +	const guid_t *fru_id =3D &guid_null;
> +	char *fru_text =3D "";
> +	bool queued =3D false;
> +
> +	sev =3D ghes_severity(estatus->error_severity);
> +	apei_estatus_for_each_section(estatus, gdata) {
> +		sec_type =3D (guid_t *)gdata->section_type;

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

[Severity: High]
This is a pre-existing issue, but similar to the loop above, does assigning
directly to queued overwrite successful queueings from earlier sections?

[ ... ]

> diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
> index dd49e9179b63a..511b95b509111 100644
> --- a/include/acpi/ghes_cper.h
> +++ b/include/acpi/ghes_cper.h

[ ... ]

> @@ -107,6 +110,23 @@ void ghes_estatus_cache_add(struct acpi_hest_generic=
 *generic,
>  			    struct acpi_hest_generic_status *estatus);
>  void ghes_defer_non_standard_event(struct acpi_hest_generic_data *gdata,
>  				   int sev);
> +int ghes_severity(int severity);
> +bool ghes_handle_memory_failure(struct acpi_hest_generic_data *gdata,
> +				int sev, bool sync);
> +bool ghes_handle_arm_hw_error(struct acpi_hest_generic_data *gdata,
> +			      int sev, bool sync);
> +void ghes_handle_aer(struct acpi_hest_generic_data *gdata);

[Severity: Low]
Do these helper functions need to be exposed in the global header?

Since they are only invoked locally by ghes_cper_handle_status, could they
be marked static in ghes_cper.c to prevent namespace pollution?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-topics-ahm=
tib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com?part=3D8
