Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D9B1C3F0C
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 10:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050857; cv=none; b=ZiEQZlhDXP+Km/DaMz5TLa3beyxgGKzV2BzH48rNtV9EFFROL6pOSLkLdW3qda6NItYGS631RTxfXS87yMrFftePeEV51qDSPdVGQLLoFe81M5jBEKGae1D69oGOVrWKC8dNLuhGCm6l8UWGoF76NoM/mDDPVD+TWvI4E85cGk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050857; c=relaxed/simple;
	bh=2hUgCtAACYiccmOOQ8w7rLnf/x48NyZBCT7pgOuDs2A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eunJiB7SOZlwqBVUXFubqXT70XAIchjOvELqLrgozrxuguXzthRKcBlsS7/OsTI2DuUaDlGKUhONqH9oVn27ex4YL/XkIlOCMqMTXxjOOIh12uDmYJIyTY4kNrqObllEPvDLiqCmfSM89AMkCeXkvMSOJOEc4L1gRrBo4FN0wsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgfZD40A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgfZD40A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E939F1F00893;
	Fri, 29 May 2026 10:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780050856;
	bh=Ady4WRTY1skNZKIWj6Qqbaa9icFEhQEIUKyNdLAFups=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OgfZD40AMBAmWN03PtyyjrroBpqE7zQ/M5RLJ1i4MwwTj5Q8jDPVdLyF+XjO5lRTo
	 fPi3z1Mq6OLWilruAqyKveYrx/gO+JPV7A6UR9sYbculJ5wUEgTMOkE4eArl2iUp5D
	 N9JHOTAKWGVD/kt19Lv+LIkuD7TMW25oJEZD2328BfOUY6bBEmMLqEckq6OGnVVY+a
	 DU4h4W/wxyh3D9czJweuTa/6LYXEXWnilpO8wovASnjTpfq1M1Dn/S8wHCvn/lx0GM
	 YvbblQy/nEjWipghAJu6gMMW/MxG/l3ruslpbFQIxPHuzF8wTTneBcqsAZ0VG2Mpwc
	 D8ReE9ZCvy9Uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/10] ACPI: APEI: GHES: move CXL CPER helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmed Tiba" <ahmed.tiba@arm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-6-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-6-2e0500d42642@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 10:34:15 +0000
Message-Id: <20260529103415.E939F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] Missing explicit include for `<linux/cleanup.h>` in `drivers/acpi/a=
pei/ghes_cper.c`.

Pre-existing issues:
- [High] Unconditional `memcpy` of maximum struct size causes an out-of-bou=
nds read for variable-length CPER records.
- [High] Missing bounds validation on the untrusted firmware-provided `dvse=
c_len` causes an out-of-bounds memory read.
- [High] Registration functions acquire spinlocks without disabling interru=
pts, leading to a potential deadlock with hardware error interrupt handlers.
--

commit d583282347526020c8ef8e69151955c3658e3406
Author: Ahmed Tiba <ahmed.tiba@arm.com>

ACPI: APEI: GHES: move CXL CPER helpers

Move the CXL CPER handling paths out of ghes.c and into ghes_cper.c so the
helpers can be reused.

[ ... ]

> diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
> index 131980d360641..d7a666a163c3a 100644
> --- a/drivers/acpi/apei/ghes_cper.c
> +++ b/drivers/acpi/apei/ghes_cper.c
> @@ -12,10 +12,12 @@
>   *   Author: Huang Ying <ying.huang@intel.com>
>   */
> =20
> +#include <linux/aer.h>
>  #include <linux/err.h>
>  #include <linux/genalloc.h>
>  #include <linux/irq_work.h>
>  #include <linux/io.h>
> +#include <linux/kfifo.h>

[Severity: Low]
Is it possible to include <linux/cleanup.h> explicitly in this file?

The code makes heavy use of the guard() macro, which is defined there.
Relying on transitive inclusions might lead to build breakages if header
dependencies change in the future.

>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/math64.h>

[ ... ]

> +void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> +			    int severity)
> +{
> +#ifdef CONFIG_ACPI_APEI_PCIEAER
> +	struct cxl_cper_prot_err_work_data wd;
> +
> +	if (cxl_cper_sec_prot_err_valid(prot_err))
> +		return;
> +
> +	guard(spinlock_irqsave)(&cxl_cper_prot_err_work_lock);
> +
> +	if (!cxl_cper_prot_err_work)
> +		return;
> +
> +	if (cxl_cper_setup_prot_err_work_data(&wd, prot_err, severity))

[Severity: High]
This isn't a bug introduced by this patch, but does the validation here ens=
ure
that the untrusted firmware-provided dvsec_len is safe to use?

Inside cxl_cper_setup_prot_err_work_data(), the offset to the RAS capability
structure is computed using dvsec_len from the firmware:

    dvsec_start =3D (u8 *)(prot_err + 1);
    cap_start =3D dvsec_start + prot_err->dvsec_len;

Since cxl_cper_sec_prot_err_valid() doesn't seem to validate dvsec_len
against the boundaries of the mapped CPER payload, could a malformed record
with an oversized dvsec_len cause cap_start to point into unmapped memory?

If so, the subsequent memcpy() might trigger an out-of-bounds read and a
kernel panic:

    memcpy(&wd->ras_cap, cap_start, sizeof(wd->ras_cap));

> +		return;
> +
> +	if (!kfifo_put(&cxl_cper_prot_err_fifo, wd)) {
> +		pr_err_ratelimited("CXL CPER kfifo overflow\n");
> +		return;
> +	}

[ ... ]

> +int cxl_cper_register_prot_err_work(struct work_struct *work)
> +{
> +	if (cxl_cper_prot_err_work)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&cxl_cper_prot_err_work_lock);

[Severity: High]
This is a pre-existing issue, but can acquiring this spinlock without
disabling interrupts lead to a deadlock?

The event reporting path, cxl_cper_post_prot_err(), is executed from IRQ
context (such as NMI, IRQ, or timer contexts for GHES events) and acquires
the same lock using guard(spinlock_irqsave).

If a hardware error interrupt fires while a process context thread is
executing this registration function and holding the lock, won't the
interrupt handler attempt to acquire the already-held lock on the same CPU,
resulting in a hard lockup?

> +	cxl_cper_prot_err_work =3D work;
> +	return 0;
> +}

[ ... ]

> +void cxl_cper_post_event(enum cxl_event_type event_type,
> +			 struct cxl_cper_event_rec *rec)
> +{
> +	struct cxl_cper_work_data wd;
> +
> +	if (rec->hdr.length <=3D sizeof(rec->hdr) ||
> +	    rec->hdr.length > sizeof(*rec)) {
> +		pr_err(FW_WARN "CXL CPER Invalid section length (%u)\n",
> +		       rec->hdr.length);
> +		return;
> +	}
> +
> +	if (!(rec->hdr.validation_bits & CPER_CXL_COMP_EVENT_LOG_VALID)) {
> +		pr_err(FW_WARN "CXL CPER invalid event\n");
> +		return;
> +	}
> +
> +	guard(spinlock_irqsave)(&cxl_cper_work_lock);
> +
> +	if (!cxl_cper_work)
> +		return;
> +
> +	wd.event_type =3D event_type;
> +	memcpy(&wd.rec, rec, sizeof(wd.rec));

[Severity: High]
This is a pre-existing issue, but could this memcpy() read past the bounds
of the firmware-provided payload?

The function receives an untrusted rec pointer and validates that
rec->hdr.length is less than or equal to sizeof(*rec). However, it then
unconditionally copies the maximum struct size, sizeof(wd.rec), into the
work queue buffer.

If rec->hdr.length is less than sizeof(wd.rec), wouldn't the memcpy() read
beyond the end of the provided payload? Since this memory is an ioremapped
ACPI buffer, could reading past its bounds cross into unmapped physical
memory or unrelated device I/O space?

> +
> +	if (!kfifo_put(&cxl_cper_fifo, wd)) {
> +		pr_err_ratelimited("CXL CPER kfifo overflow\n");
> +		return;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-topics-ahm=
tib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com?part=3D6
