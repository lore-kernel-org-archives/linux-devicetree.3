Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A0632B10C
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780052830; cv=none; b=hlRnfFLaH0eyDR7kiOu2WKtKb89F1Y9qV0DNWLbhHLAYQC1vqcq1VD4aBaCdwX4ozurgglARvgq/kGJ+kK/QRhKlgE8xrH/a+YyYe0oiNVhGqz2EuRgTo0ZsnsA93Ghr81g5XqJ4oQY+iMEwM9hrETU2EkAhFW6UV7ooFRIwwQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780052830; c=relaxed/simple;
	bh=1v9uN/ngg5RGuvdkaiwvzp4aW43Ap/sFRs4OA3/1pmo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mfYoQUwmaPmLbqLxOLnxr/BZRh+M7c34I/3gG96FZiksmhI3MTXtVGj3rStV/C8eGf65kBDBqPHCqnx2B0OpAHmbfXJn61WJ+BmeLe9gu4aGDHGjm2DgapEgcg9YxevogYL1mkWX/42kLETBUH1RENn4L48OZ35n62oX9ESOgMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdISLnXt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdISLnXt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3C01F00893;
	Fri, 29 May 2026 11:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780052829;
	bh=3MygCMg6DBf+icGqb5rYdyA3lrZZrIwoZ0olm6GIfCw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MdISLnXtRHbTKSFRHQq6VamPDuR4g6Ie2520ixsPblVglZi5bKYGpMPkuJ4G65aQ1
	 WlcWP6+jkM4E/1OWzx4jno3AcygbmHadPvoBRyJnUwGMllL3BJkiStUdROm0N35mcu
	 +0+CIBZwAvFMaZ/50+aPmLfAw0Waiimm/cQjEikm5iS7UxEwdBewyRFe559EqBdh0k
	 ZAMlAqzrsIatGxtfqLTcU9DKIt+5dVcYpv6AWbv3XBbaGKV8ewKEGQzk3DM6EJ8vjH
	 yqaTUg1cZnPoF/wSfBQxiERs6RzT7Oj8JplRpEhl7VCi0Vr3xWO+5nsZXusgZiBiNV
	 GvtLljfX2Y8rA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/10] RAS: add firmware-first CPER provider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmed Tiba" <ahmed.tiba@arm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-10-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-10-2e0500d42642@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 11:07:08 +0000
Message-Id: <20260529110709.0B3C01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Handling synchronous errors via an asynchronous threaded IRQ cause=
s force_sig(SIGBUS) to kill the kernel IRQ thread instead of the faulting u=
ser task.
- [High] The driver fails to validate or clear the hardware CPER 'block_sta=
tus' field, leading to the processing of invalid/stale records and violatin=
g the firmware state machine.
- [High] The driver blindly trusts the memory-mapped region size and firmwa=
re-provided CPER record lengths, leading to out-of-bounds heap reads.
--

commit 079bcf67c79972332f188b664beb5efc21cf8796
Author: Ahmed Tiba <ahmed.tiba@arm.com>

RAS: add firmware-first CPER provider

Add a firmware-first CPER provider that reuses the shared GHES helpers, wire
it into the RAS Kconfig/Makefile and document it in the admin guide.

> diff --git a/drivers/ras/cper-esource.c b/drivers/ras/cper-esource.c
> new file mode 100644
> index 0000000000000..83f7a910e50a7
> --- /dev/null
> +++ b/drivers/ras/cper-esource.c
[ ... ]
> +static int cper_esource_copy_status(struct cper_esource *ctx)
> +{
> +	memcpy_fromio(ctx->estatus, ctx->status, ctx->status_len);
> +	return 0;
> +}
[ ... ]
> +static void cper_esource_process(struct cper_esource *ctx)
> +{
> +	int sev;
> +
> +	guard(spinlock_irqsave)(&ctx->lock);
> +
> +	if (cper_esource_copy_status(ctx))
> +		return;

[Severity: High]
Should this code check and clear the CPER block_status field?

The CPER/HEST specification uses block_status to indicate if a valid error
record is present. Since cper_esource_copy_status() unconditionally copies
the buffer without checking ctx->estatus->block_status, could a spurious
interrupt cause the driver to process invalid or stale records?

Also, does the hardware require the OS to clear the block_status in IO
memory after consumption, similar to ghes_clear_estatus()? Without doing so,
the firmware might consider the buffer permanently full or the OS might
repeatedly process the same stale error upon subsequent interrupts.

> +
> +	sev =3D ghes_severity(ctx->estatus->error_severity);
> +	if (sev >=3D GHES_SEV_PANIC)
> +		cper_esource_fatal(ctx);
> +
> +	if (!ghes_estatus_cached(ctx->estatus) &&

[Severity: High]
Can this lead to out-of-bounds heap reads if the firmware provides
unexpected lengths?

The estatus buffer is dynamically allocated with a size of ctx->status_len,
but the ACPI GHES core helpers (like ghes_estatus_cached() and
apei_estatus_for_each_section()) rely on the firmware-provided data_length
and raw_data_length fields to calculate the total record size.

If cper_estatus_len(ctx->estatus) evaluates to a size larger than
ctx->status_len, these helpers could perform out-of-bounds reads when
comparing memory or iterating over sections. Should the total length
be validated against ctx->status_len before passing it to these helpers?

> +	    ghes_print_estatus(NULL, ctx->generic, ctx->estatus))
> +		ghes_estatus_cache_add(ctx->generic, ctx->estatus);
> +
> +	ghes_cper_handle_status(ctx->dev, ctx->generic, ctx->estatus, ctx->sync=
);

[Severity: High]
For synchronous errors (when ctx->sync is true), will this signal the wrong
task?

ghes_cper_handle_status() uses force_sig(SIGBUS) to kill the current process
for unrecoverable synchronous errors:

drivers/acpi/apei/ghes_cper.c:ghes_cper_handle_status() {
    ...
    if (sync && !queued) {
        ...
        force_sig(SIGBUS);
    }
}

Because cper_esource_irq() is registered below as a threaded IRQ via
devm_request_threaded_irq(), it executes in the context of a kernel IRQ
thread. Doesn't this mean force_sig(SIGBUS) will kill the IRQ thread instead
of the user task that actually triggered the fault?

> +	cper_esource_ack(ctx);
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-topics-ahm=
tib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com?part=3D10
