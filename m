Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C132E44B686
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108729; cv=none; b=Co+mFskHbZjhnGEXYK0RAqwXCti5GAZ1296JqhYC8/WtaC3LH6IKEjFKFZIX2TY68A6Sa2ILrtquvdMCQtTDu46izjMR2AVdVmDLa8Qb9aywwUWYtG1sGFC1w63bk0nOuzA1bp2ukTjb0XPYPJH2m/SMZw3KdwsiVVXbWq2sH4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108729; c=relaxed/simple;
	bh=2Xik32R0JwiOc7I7Pp7ha6ZClywgnnYcuSngp55dzeQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FUTOy1ogG/DF1wMSrLUEtCTN+2krlfMnsZTzq2N8a71n8+aRg58WC6igE/eXM042vcV1EvLH8hm4tpVhVA7t0MPEdkWMOENEvoGSxZQZTSEx2g8IGLLq+A5FzL7IfNhAGpPBpfRO/DxVFZ639wckqapxkrE28wm3dnhFojaSxQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvmJYPVj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvmJYPVj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47973C2BCB7;
	Mon, 18 May 2026 12:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779108729;
	bh=2Xik32R0JwiOc7I7Pp7ha6ZClywgnnYcuSngp55dzeQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KvmJYPVjEWfBoZO4APRWrU2n/ebh3Nghg2nXCLjf5TposN8Ph8jTa34PIaH4FSmpq
	 HnR/nOyoRj6bCNRymW0r4UrtfzR1JLhHNSgwQoJDWyeWoANQyepWzoDk1ZoiXrf8Ad
	 c+gc+pjSjiOF6KBV53lVDqPRz1HrNYLCcyJ+Zs0QOjLlaGEjLl/RiqEKWyexZNunAo
	 cOiUfn7cBLyZZFJf6d7iaBiTc3FAUV/GniGfo+nv2zmo6mfYR4gzWpzBfm2NCKu5WM
	 1zfdE/D4Ko77cMtnL/svixh3Z9j67In9K9hFG2kpjHq7ieecdWkixESzkM9mbmV5iR
	 Sr9QtpbWI9jMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/10] RAS: add firmware-first CPER provider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmed Tiba" <ahmed.tiba@arm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-10-42698675ba61@arm.com>
References: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-10-42698675ba61@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 12:52:08 +0000
Message-Id: <20260518125209.47973C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] Broken Synchronous External Abort (SEA) notification handling =
causes kernel thread crashes and probe failures.
- [High] Missing validation of firmware-provided CPER data lengths leads to=
 out-of-bounds heap reads.
- [High] Lockless initialization of the global `ghes_estatus_pool` causes T=
OCTOU races and memory exhaustion.
- [High] Unbinding the device leaves a dangling pointer to `ctx->generic` i=
n the global GHES estatus cache.
- [High] Failure to verify the `block_status` field before processing the C=
PER record.
- [Medium] Implicit truncation of the dynamically allocated `source_id`.
- [Low] Unconditional use of 64-bit I/O accessors will break compilation on=
 32-bit platforms.
--

commit cfb39f0834e377f821505be4d4466300f20e3265
Author: Ahmed Tiba <ahmed.tiba@arm.com>

RAS: add firmware-first CPER provider
   =20
Add a firmware-first CPER provider that reuses the shared
GHES helpers, wire it into the RAS Kconfig/Makefile and
document it in the admin guide.

> diff --git a/drivers/ras/Kconfig b/drivers/ras/Kconfig
> index fc4f4bb94a4c6..3c1c63b2fefc3 100644
> --- a/drivers/ras/Kconfig
> +++ b/drivers/ras/Kconfig
> @@ -34,6 +34,17 @@ if RAS
>  source "arch/x86/ras/Kconfig"
>  source "drivers/ras/amd/atl/Kconfig"
> =20
> +config RAS_CPER_ESOURCE
> +	bool "Firmware-first CPER error source block provider"
> +	select GHES_CPER_HELPERS

Should this depend on 64BIT? The driver uses readq() and writeq()
unconditionally, which will break compilation on 32-bit architectures.

> +	help
> +	  Enable support for firmware-first Common Platform Error Record

[ ... ]

> diff --git a/drivers/ras/cper-esource.c b/drivers/ras/cper-esource.c
> new file mode 100644
> index 0000000000000..83f7a910e50a7
> --- /dev/null
> +++ b/drivers/ras/cper-esource.c
> @@ -0,0 +1,257 @@

[ ... ]

> +static int cper_esource_init_pool(void)
> +{
> +	if (ghes_estatus_pool)
> +		return 0;
> +
> +	return ghes_estatus_pool_init(1);
> +}

Is there a race condition here if multiple instances of this driver probe
concurrently?

Both could observe a NULL pool and call ghes_estatus_pool_init()
simultaneously, causing a double allocation.

Also, if the pool already exists, this returns without expanding its capaci=
ty.
Will this reduce the safety margin for gen_pool_alloc() and risk dropping
records during an error storm since the pool wasn't scaled for the new
sources?

[ ... ]

> +static void cper_esource_process(struct cper_esource *ctx)
> +{
> +	int sev;
> +
> +	guard(spinlock_irqsave)(&ctx->lock);
> +
> +	if (cper_esource_copy_status(ctx))
> +		return;

Should we verify that ctx->estatus->block_status is non-zero before
processing the record?

If the interrupt is shared or fires spuriously, we might process a zeroed
block. A zeroed error_severity maps to CPER_SEV_RECOVERABLE, which could
falsely report a hardware error and spuriously trigger the hardware ACK.

> +
> +	sev =3D ghes_severity(ctx->estatus->error_severity);
> +	if (sev >=3D GHES_SEV_PANIC)
> +		cper_esource_fatal(ctx);
> +
> +	if (!ghes_estatus_cached(ctx->estatus) &&
> +	    ghes_print_estatus(NULL, ctx->generic, ctx->estatus))
> +		ghes_estatus_cache_add(ctx->generic, ctx->estatus);

Could this lead to a use-after-free if the device is unbound?

ctx->generic is allocated with devm_kzalloc(), so it will be freed
automatically on device unbind. However, ghes_estatus_cache_add() places
this pointer into the global ghes_estatus_caches array, leaving a dangling
pointer if the device is ever unbound.

> +
> +	ghes_cper_handle_status(ctx->dev, ctx->generic, ctx->estatus, ctx->sync=
);

If ctx->sync is true, ghes_cper_handle_status() will eventually call
force_sig(SIGBUS) on current. Since this is called from a threaded IRQ
handler:

cper_esource_irq() -> cper_esource_process() -> ghes_cper_handle_status()

Would current point to the kernel IRQ thread rather than the faulting
userspace process? This seems like it would crash the kernel IRQ thread
instead of delivering the signal to the correct task.

> +	cper_esource_ack(ctx);
> +}

[ ... ]

> +static int cper_esource_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct cper_esource *ctx;
> +	struct resource *res;
> +	int source_id;
> +	int rc;

[ ... ]

> +	ctx->status =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(ctx->status))
> +		return dev_err_probe(dev, PTR_ERR(ctx->status),
> +				     "failed to map status region\n");
> +
> +	ctx->status_len =3D resource_size(res);
> +	if (!ctx->status_len)
> +		return dev_err_probe(dev, -EINVAL, "status region has zero length\n");
> +
> +	rc =3D cper_esource_init_ack(pdev, ctx);
> +	if (rc)
> +		return rc;
> +
> +	rc =3D cper_esource_init_pool();
> +	if (rc)
> +		return rc;
> +
> +	ctx->estatus =3D devm_kzalloc(dev, ctx->status_len, GFP_KERNEL);

Does this adequately validate the size of the firmware-provided data?

ctx->status_len is based strictly on the MMIO resource size. If the resource
size is smaller than sizeof(struct acpi_hest_generic_status), or if the
firmware populates an estatus->data_length that exceeds the allocated
ctx->status_len buffer, will the subsequent CPER parsing functions read
out-of-bounds on the heap?

> +	if (!ctx->estatus)
> +		return -ENOMEM;
> +
> +	ctx->generic =3D devm_kzalloc(dev, sizeof(*ctx->generic), GFP_KERNEL);
> +	if (!ctx->generic)
> +		return -ENOMEM;
> +
> +	source_id =3D ida_alloc_min(&cper_esource_source_ids, 1, GFP_KERNEL);
> +	if (source_id < 0)
> +		return source_id;
> +
> +	ctx->generic->header.type =3D ACPI_HEST_TYPE_GENERIC_ERROR;
> +	ctx->generic->header.source_id =3D source_id;

Could source_id be truncated here?

ida_alloc_min() can return values up to INT_MAX, but
ctx->generic->header.source_id is a u16. If the IDA allocates a value
greater than 65535, it will be silently truncated, potentially causing ID
collisions with other error sources.

> +
> +	rc =3D devm_add_action_or_reset(dev, cper_esource_release_source_id,
> +				      ctx->generic);
> +	if (rc)
> +		return rc;
> +
> +	ctx->generic->notify.type =3D ctx->sync ?
> +		ACPI_HEST_NOTIFY_SEA : ACPI_HEST_NOTIFY_EXTERNAL;
> +	ctx->generic->error_block_length =3D ctx->status_len;
> +
> +	ctx->irq =3D platform_get_irq(pdev, 0);

If the device tree specifies that it uses a Synchronous External Abort (SEA)
for notification via the arm,sea-notify property, does the platform still
provide a standard IRQ?

If not, platform_get_irq() will fail and prevent the driver from probing
when only the SEA is described.

> +	if (ctx->irq < 0)
> +		return ctx->irq;
> +
> +	rc =3D devm_request_threaded_irq(dev, ctx->irq, NULL, cper_esource_irq,
> +				       IRQF_ONESHOT,
> +				       dev_name(dev), ctx);
> +	if (rc)
> +		return dev_err_probe(dev, rc, "failed to request interrupt\n");
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-topics-ahm=
tib01-ras_ffh_arm_internal_review-v4-0-42698675ba61@arm.com?part=3D10
