Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB26388E60
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 18:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786557902; cv=none; b=kOWTfd89vLYWEv/PZu04gj3sRCsHAWIo5nTiO1Eu1XClABdpfZpoXrSc52WtwsA6SGU10DJ3aXJrasESaI5N3ekFmAHtyvqvDfQJ25aWPPfNEU6guS7LcklTvjVu6kM4kgbDhhwYFLnk/C0/Jmf5pXFnggFtc5TNyFonTjpOf98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786557902; c=relaxed/simple;
	bh=6kRMeR4CZLrkLFDCwFAtknATi5A7J7Mx54k9I/wyqt0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s03VwX93mXmYVNWBoXvPGWOWvApozghlVCJqOYkJClFP20WDbi9vxni6CUlhOy07SsshNEl7JGfmzvrp25coJbVljIdi2GaPd7UUGZwA7UTBEHOK7sdt+ziVs8AExBK57VjxMsUtHxf0YvE39+zpIPEBWplIoH1Psgw9y+MgICo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CW3WRGZ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CW3WRGZ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68871F000E9;
	Wed, 12 Aug 2026 18:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786557901;
	bh=AV/s2ZQAzJ0cReUgpeV0F1BbIlaQhebkRsp4R9HBRHM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CW3WRGZ+3sulWLCBlKBTu/sa/mYK2gld/XGU1W2mm3UIGf1jLEok/Rno0gW8EYtZx
	 WIrh7TJ5aBwJHnVDwrokyojbcrHEq4KB0Q8k+0GwF33MRZcvcPA16fKAEqbV5j9QNj
	 kxtGolzo3NrOHOXtKcgF2A9JGoK5iV83MejPKWq3sVS3Qt3r94bVsmeapHuEzFTKAc
	 6J1zGKCFuqFi9MP2gjICNxCHk16hxz1Vohn2eF9qvF4S6qrB2FEM8ZvvQYO2Jq3bbo
	 NyXpPkKIDpNjK8UcAlaxNXv9k1IZLqJskqQajwy4+HM0UhPQGtFZln6BDQtJO/pE8p
	 4pNYpX4cgpmPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 3/4] crypto: spacc - add spacc autodetect support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260812175020.666558-4-pavitrakumarm@vayavyalabs.com>
References: <20260812175020.666558-1-pavitrakumarm@vayavyalabs.com>
 <20260812175020.666558-4-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 18:05:00 +0000
Message-Id: <20260812180500.A68871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unkillable wait without a timeout in hardware autodetection can pe=
rmanently hang the kernel.
--

--- Patch [3]: [PATCH v22 3/4] crypto: spacc - add spacc autodetect support=
 ---
commit 1b02ffd964af3b1927d2fca1ccd5966f8d928e2e
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
crypto: spacc - add spacc autodetect support

This commit adds autodetection support to the SPAcc driver to determine
supported cryptographic algorithms. It runs test vectors through the hardwa=
re
during initialization and disables algorithms that fail to produce the
expected output.

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> index b72d5072ccc58..3287e9e61b1c0 100644
> --- a/drivers/crypto/dwc-spacc/spacc_core.c
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c
[ ... ]
> @@ -579,6 +1480,275 @@ int spacc_close(struct spacc_device *dev, int hand=
le)
[ ... ]
> +#if IS_ENABLED(CONFIG_CRYPTO_DEV_SPACC_AUTODETECT)
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
Can this wait_event() cause a permanent kernel thread hang?

If the hardware fails to respond or trigger the completion interrupt, this
uninterruptible wait will never complete. If the driver is built-in and
probes synchronously, couldn't this stall the entire system boot process,
or otherwise result in hung task panics?

While the comment notes this as a deliberate tradeoff to avoid DMA
use-after-free risks upon abandoning the job, is it possible to implement a
safe hardware cancellation or reset path and use wait_event_timeout()
instead of relying on an unkillable wait?

> +
> +		job->job_done =3D 0;
> +		err =3D job->job_err;
> +	}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812175020.6665=
58-1-pavitrakumarm@vayavyalabs.com?part=3D3
