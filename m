Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAA73BD22F
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809181; cv=none; b=QHEi/pTXOgOR0tjsjhejsKsF0UZ6Cp79g7gRxP99C7JjgC95NpVPIa0ythItKOkbiNDgfXIlU2xzkuhfGtxSe3jodA8QeDQWc16tEukzFg1IJeqyOdbFK/YAMvEaoevvcU8Uhx5/B6PU3ZLxqUg5/lO0C84uaarLlH9uc2SqfPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809181; c=relaxed/simple;
	bh=+ynolZ8p18iNozECoMAjyGWpibEl9xvImaq1nwawI08=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IoF15BqjnsawbcjnSjGADiEvPwzvnVs/oCzjzrms+oqngMJ4+aB3JthpU2LzlEW8RmoWmk/9nJjOU3ex+1CbcmBqjBYYCXXJORbRhTdfZC0q8IjZerWilz4gYIDZCOIYeucYS+DqGJF9H6F6sfdh4djXNAne1CvceBVIv1M7ftE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSf/IQOK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSf/IQOK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699381F000E9;
	Thu, 23 Jul 2026 12:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784809179;
	bh=jcF3zYacKU3DwUNhIVJ1mD4dsBKlM/04V/i8AMty/5s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SSf/IQOKAa30F6Nb9dtVRCNl6Fy7SMCIpImxizXvIHqjNMAbtmrmWESWrK+TWyInn
	 iDEGQZ/h/XNIPS6tEWD/AvOYAviwcXZ3PKPl5AdgQmIH14VL0woBw9Ve1UfFR1Lyxg
	 9nz88uPxcm0wWCAxcxGwYn/pYlCQDRDJtn31b5a0RS8evTG8sbaTBYNCxziUqxGpYC
	 9XNSyzlrzgA2xG5HkT5yGSGjr2Y9DJLQYUuYrhF0aKqlnY7CyvFAImRH+bsSjwcOJf
	 GB3zeW6tloh3wxIFm9PoJPD85iskV0llZE4Msj2sKlG/USdHkY6gd6LmwA3N3Khd8z
	 ZbCjhfXGgE9WQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 3/4] crypto: spacc - Add SPAcc AUTODETECT Support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723120156.285270-4-pavitrakumarm@vayavyalabs.com>
References: <20260723120156.285270-1-pavitrakumarm@vayavyalabs.com>
 <20260723120156.285270-4-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 12:19:35 +0000
Message-Id: <20260723121939.699381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unkillable wait during hardware autodetection can permanently hang=
 the kernel if the device drops unsupported jobs.
--

--- Patch [3]: [PATCH v18 3/4] crypto: spacc - Add SPAcc AUTODETECT Support=
 ---
commit 9e2e636bd5aacb282e1058d2b08e95919016a954
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc AUTODETECT Support

This commit adds hardware autodetect support to the SPAcc crypto driver.
It iterates through multiple cryptographic algorithms and submits test jobs
to determine if the hardware supports them.

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> index 36ab428301867..b6ed04d936dba 100644
> --- a/drivers/crypto/dwc-spacc/spacc_core.c
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c

[ ... ]

> +static int spacc_check_modes(struct spacc_device *spacc, int algo_mode,
> +			      int keysz_idx, void *virt, char *key,
> +			      struct pdu_ddt *ddt)
> +{

[ ... ]

> +	err =3D spacc_packet_enqueue_ddt(spacc, rc, ddt, ddt, proclen, 0,
> +				       aadlen, 0, 0, 0);
> +	job =3D &spacc->job[rc];
> +
> +	if (err =3D=3D 0) {
> +		/*
> +		 * No timeout, not interruptible: this only returns once
> +		 * job_done is actually true, i.e. the hardware has
> +		 * genuinely relinquished the job. That guarantees it is
> +		 * always safe to close the job/context and (via the
> +		 * caller) free the DMA buffer immediately below --
> +		 * there is no "unconfirmed" case left to handle.
> +		 *
> +		 * Tradeoff: if the hardware ever genuinely fails to
> +		 * complete a submitted job, this hangs here
> +		 * unkillably (TASK_UNINTERRUPTIBLE, no timeout) for the
> +		 * rest of probe. Accepted deliberately in place of the
> +		 * abandoned-job/UAF risk of giving up early with no
> +		 * hardware cancel available.
> +		 */
> +		wait_event(job->waitq, job->job_done);

[Severity: High]
Could this wait_event call permanently hang the kernel during initializatio=
n?

If the hardware silently drops a command for an unsupported algorithm inste=
ad
of completing it with an explicit error status, no interrupt will be raised.

Since autodetection inherently tests invalid or unsupported states, using
wait_event without a timeout could cause the boot or driver probe path to h=
ang
indefinitely in an uninterruptible state.

Could a timeout like wait_event_timeout be used here instead, and perhaps
handle the hardware failure gracefully (e.g. by resetting the hardware or
quarantining the test DMA buffer) rather than intentionally hanging the sys=
tem?

> +
> +		job->job_done =3D 0;
> +		err =3D job->job_err;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723120156.2852=
70-1-pavitrakumarm@vayavyalabs.com?part=3D3
