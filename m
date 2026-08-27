Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A33C3644D4
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 04:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787806512; cv=none; b=VYKWC//vaEBCCDRPCv7CLwA8iRrL+QHV/Ifh169kMWL4FO8IJA9qlL6JoacGw4H/7P97BeuhgUcSCVSazN7EM7wfDci3nHnwG9pP+WNCUnacz+YZe5JwEQ4XX9S9196qWF9e1YzWkhCiVs39woBmL0eF8XKKAr4cclqEIdrwj/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787806512; c=relaxed/simple;
	bh=vOY6pOXJvQ62tWffgRJybxyeMOsjOBAQ/O67XGwtJvs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Em15h8X44e/9tELx9eZQOA7vmmhjB2oL9l86zEGSljfLSgLPwcynaRW+CXHwIkiYYETELc8uHrmT6ztmL4qi/9KrEo8UL7/6mYQ+19oQJOUGZ09YwetpvXhli2ImDHgXqBpSai9JMa0g/VCJfjWLLEXZ5Y3EwKZtCrQ/+yTwIoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLoukYfv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLoukYfv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2301F00A3A;
	Thu, 27 Aug 2026 04:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787806511;
	bh=Vq71psu1/IHAJRm/3s0+LpueZlOcH8ZGfckHWB2WVWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FLoukYfvcOfaGoGshr8SBGkWGe+KuIiw7fdMCOTus/x7OTBHSBe22PCGxJk6mH/JN
	 7D8udrUqsMURt320pNGkEe/gwSiZgyPMFvGv/EG/WRVS3+z0BYNiN4wpBK2/9I1FZr
	 NjuTVC3gLYJjUXi1mBjdRtMnLVol96nfkK4nxKzWQk+kX9kPsBEiJ1bDn/38m6sSDE
	 iW26hdQjna+6vrAxsTlhQ6zEvY3mix+g2yNpmHCiTADtb2NUyyfW3x4E31qL6y55jN
	 wHQWWAShTqlQNcbAaRL4m4IpsWW3GSHEPd83KU6iPHfsOkSFTDm+pXMoBkyXLueG9y
	 fzJS7QLvwKuag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 3/4] crypto: spacc - add spacc autodetect support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260827044349.826534-4-pavitrakumarm@vayavyalabs.com>
References: <20260827044349.826534-1-pavitrakumarm@vayavyalabs.com>
 <20260827044349.826534-4-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 04:55:10 +0000
Message-Id: <20260827045510.BA2301F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Use of `wait_event_killable` contradicts safety assumptions, allow=
ing fatal signals to cause DMA Use-After-Free
--

commit e7d03dccc593f00d608b75c3b090d8bba8e22258
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - add spacc autodetect support

This commit adds autodetection support to the SPAcc crypto driver. It dynam=
ically=20
tests which algorithms the hardware supports by issuing test operations aga=
inst=20
the hardware during initialization.

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> --- a/drivers/crypto/dwc-spacc/spacc_core.c
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c
[ ... ]
> @@ -579,6 +1480,276 @@ int spacc_close(struct spacc_device *dev, int hand=
le)
[ ... ]
> +static int spacc_check_modes(struct spacc_device *spacc, int algo_mode,
> +			      int keysz_idx, void *virt, char *key,
> +			      struct pdu_ddt *ddt)
> +{
[ ... ]
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
> +		wait_event_killable(job->waitq, job->job_done);

[Severity: High]
The comment explicitly states this wait should be "not interruptible" and
uses TASK_UNINTERRUPTIBLE to prevent abandoned-job and use-after-free
risks. However, wait_event_killable() can be interrupted by a fatal
signal.

If a fatal signal (like SIGKILL) is delivered, won't this return early
without checking the return value? Since the hardware is still processing,
does returning here allow the caller to prematurely free the DMA buffers?

> +
> +		job->job_done =3D 0;
> +		err =3D job->job_err;
> +	}
[ ... ]
> +int spacc_autodetect(struct spacc_device *spacc)
> +{
[ ... ]
> +		for (y =3D 0; y < ARRAY_SIZE(keysizes[0]); y++) {
> +			/*
> +			 * spacc_check_modes() now always returns 0 --
> +			 * it only comes back once the job is confirmed
> +			 * done, closes it itself, and disables the mode
> +			 * bit internally on any failure/mismatch. Nothing
> +			 * left for this loop to branch on.
> +			 */
> +			spacc_check_modes(spacc, x, y, virt, key, &ddt);
> +		}
> +
> +		if (!(spacc->config.modes[x] & 0x7F))
> +			spacc->config.modes[x] &=3D ~128;
> +	}
> +
> +	pdu_ddt_free(&ddt);
> +	dma_free_coherent(spacc->dptr, SPACC_TEST_DMA_BUFF_SIZE, virt, dma);

[Severity: High]
Following the potential early return from wait_event_killable() in
spacc_check_modes() above, these DMA buffers will be freed here.

Will this cause a use-after-free and DMA corruption when the hardware
eventually completes the abandoned job and writes to this freed memory?

> +	spacc->autodetect =3D false;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827044349.8265=
34-1-pavitrakumarm@vayavyalabs.com?part=3D3
