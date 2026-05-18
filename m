Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3623F23C7
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107454; cv=none; b=punVpgDjOO18IZtISqGDuEz10FVSrNqEn9sUewQ23dPINUrh0MVXnY4hjrpaDUUy+yaMAJDObsWFzC6DWykWPa+oEfTOc6Z9KRQxFeZ4lFF5YOf4jl2OLZLnNeL3dmo6zRLo0PV/xKV1uFFYq+JOjH4qA/oEjk2/p8iU9JBYqBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107454; c=relaxed/simple;
	bh=mpNxlt9y1kw6BLvcJIGBD5cZQMu0FWYTOSmOsbJ5dCI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qy9gRys3g7vgZTZOKe6SP9xBJePzQzWoAZpbQ0qBn4ytdihPVyPzQ5Cxf5ERhyFWxtgewrXUyx83aeGZeCVrZG5Hu72IFG4z3uTH8kbBcEgWeZlDEyHNbPNW3SM6czNpdSpyB+wXi/3xBBZwKUiIrFeEEzHWsrSJKfF1TDXSM+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRtk0GA2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRtk0GA2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4401AC2BCB8;
	Mon, 18 May 2026 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779107454;
	bh=mpNxlt9y1kw6BLvcJIGBD5cZQMu0FWYTOSmOsbJ5dCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YRtk0GA2gYXsF5vlEG8C7wtLEHr4/hNuNB2RNF1g5SS7+iVR7hgQ1HumUKLlBwqjC
	 fKOMVIMS7UAXE/b7hL3OjMuGawSS9W+ATE+WXaY9Ze7kjmzv6/00Y/lqgDYe+uBugV
	 v06jOzwqikgUfwiAezXGdqeaFQYKRhMTvRSraiL3OrC+y15xgP3wXYj7A7h9n/gZon
	 SXCP+Qnb6fsIla1Aq9odUYVgFnaeiA9GAIn1bBloAVbrPIKVZN5jnmgmnrry7ELjhj
	 QIvqQV51n687FdBHUm6yx4z/l36a/d6sX7Pn9mks/HwozKhT4pAPANahD8xCxtM9bs
	 L8mJ9eR8Buj6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/10] ACPI: APEI: GHES: move CXL CPER helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmed Tiba" <ahmed.tiba@arm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-6-42698675ba61@arm.com>
References: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-6-42698675ba61@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 12:30:53 +0000
Message-Id: <20260518123054.4401AC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Deadlock risk due to missing interrupt disable in registration fun=
ctions.
- [High] Out-of-bounds read in `cxl_cper_post_event()` due to unconditional=
 maximum-size `memcpy`.
- [High] Out-of-bounds read in `cxl_cper_setup_prot_err_work_data()` due to=
 unvalidated `dvsec_len`.
--

commit b9b10da731ac810e776dc0f6489817a12018762f
Author: Ahmed Tiba <ahmed.tiba@arm.com>

ACPI: APEI: GHES: move CXL CPER helpers

Move the CXL CPER handling paths out of ghes.c and into ghes_cper.c so the
helpers can be reused. The code is moved as-is, with the public
prototypes updated so GHES keeps calling into the new translation unit.

> diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
> index 131980d360641..d7a666a163c3a 100644
> --- a/drivers/acpi/apei/ghes_cper.c
> +++ b/drivers/acpi/apei/ghes_cper.c
[ ... ]
> @@ -321,6 +323,138 @@ void ghes_defer_non_standard_event(struct acpi_hest=
_generic_data *gdata,
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
> +		return;

This isn't a new bug introduced by this patch, but could this call lead to =
an
out-of-bounds read?

Looking at cxl_cper_setup_prot_err_work_data() in ghes_helpers.c:

int cxl_cper_setup_prot_err_work_data(...)
{
    ...
    dvsec_start =3D (u8 *)(prot_err + 1);
    cap_start =3D dvsec_start + prot_err->dvsec_len;
   =20
    memcpy(&wd->ras_cap, cap_start, sizeof(wd->ras_cap));
    ...
}

The prot_err->dvsec_len field from the firmware doesn't appear to be
validated against the actual payload bounds before being used to calculate
cap_start. If a buggy firmware provides an artificially large dvsec_len,
could the subsequent memcpy() read adjacent kernel memory?

[ ... ]
> +int cxl_cper_register_prot_err_work(struct work_struct *work)
> +{
> +	if (cxl_cper_prot_err_work)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&cxl_cper_prot_err_work_lock);

This isn't a new bug introduced by this patch, but could this lock usage
cause a deadlock?

The event posting functions like cxl_cper_post_prot_err() are called in
hardware IRQ contexts and correctly use guard(spinlock_irqsave).

If an interrupt occurs on the same CPU while this registration function hol=
ds
the spinlock in process context, and the IRQ handler calls
cxl_cper_post_prot_err(), won't it attempt to acquire the already-held lock
and spin indefinitely?

Should these registration functions use guard(spinlock_irqsave) instead?

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
[ ... ]
> +	wd.event_type =3D event_type;
> +	memcpy(&wd.rec, rec, sizeof(wd.rec));

This isn't a new bug introduced by this patch, but could this memcpy()
over-read the rec buffer?

The length validation above allows rec->hdr.length to be smaller than
sizeof(*rec), but the memcpy unconditionally copies sizeof(wd.rec) bytes.

If the firmware provides a dynamically sized payload smaller than the maxim=
um
structure size, will this read out-of-bounds kernel memory into the work
queue data?

[ ... ]
> +int cxl_cper_register_work(struct work_struct *work)
> +{
> +	if (cxl_cper_work)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&cxl_cper_work_lock);

This isn't a new bug introduced by this patch, but similarly to the protocol
error registration, could this lock usage cause a deadlock if interrupted
by cxl_cper_post_event() running in an IRQ handler?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-topics-ahm=
tib01-ras_ffh_arm_internal_review-v4-0-42698675ba61@arm.com?part=3D6
