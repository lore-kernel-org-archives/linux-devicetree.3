Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE0B3DD867
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429771; cv=none; b=OInSK+gbKsTG9OUHBfiPmJ+Zv6oS+PFlFNEhlAV5KVfef6fVimyRQVTk+waCRHhaDy28LhgqOA4lF6RI+GVhOURhWgVCPKlcizCs54LyiX5LclQ/wil5JrnNL8CKw+ldkI1qfsJhp2o27IgQP2gXCLeWxc668DsKmd4DhtOuhek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429771; c=relaxed/simple;
	bh=COTHQ/fLA75npUdzOnR9vrdCV2AUC4ozcVIcyNs77UQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MZVdJik5Ac6xVvw3G+URJpWKblDsCPpb7uztLw53SV5u5REm3U4EZ6UG1GTLNZSitYxJUbWQ2EYIMUQOV6IZD7QuedILxEEuZKFAtvsC7kpl5tnivnqb73Ervfca3Xxcu9HjlD2z2911lbAkz573jw5Vd48CbGLerz9U2Q3UwWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOGn9bR9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOGn9bR9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85091F000E9;
	Tue,  7 Jul 2026 13:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783429770;
	bh=HXThLHOQBHQwIlMvgnvFRGJZ5prpBSaI8kRxS5A0xUo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QOGn9bR9YUcDR3uPxS9xcrujYzK841ffM1eN1UZNpcWXs0St7qbpDsu9ZI4cmASbS
	 Bo7OJeMLMn2j6629+DXJS2/jU0RTuuKAIilaCyK1Z5xDbiwaZA2skFP/rUNMsQlgyK
	 C2nuyz0JZGkBHOPq1A9LmE9B4zVR15XeoOVaDwe03bFakXdS6iuyq8jOYRCW2FXmie
	 571glkMhLo00ML20hnoueNd1GBJAjIVO1Q0JRwaLGYh2qWO2zRXEetzHgEgBTZBwTr
	 qvvNg91iCSvPPyJnCBkiVp6Ugzh32ifPMHy4Un8AIlLqpnwNvm90wJ9XYOp5kK2LPR
	 YydU955ZTPvdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 3/4] crypto: spacc - Add SPAcc AUTODETECT Support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707125311.2398031-4-pavitrakumarm@vayavyalabs.com>
References: <20260707125311.2398031-1-pavitrakumarm@vayavyalabs.com>
 <20260707125311.2398031-4-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 13:09:29 +0000
Message-Id: <20260707130929.E85091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Missing hardware job cancellation on timeout or interrupt duri=
ng SPAcc autodetect causes DMA use-after-free, stack use-after-free, and da=
ta corruption.
- [High] Abandoned jobs from autodetect cause `spacc_pop_packets_ex` to abo=
rt, hanging the STAT FIFO and blocking subsequent jobs.
- [Medium] Autodetect test vector failures do not fully clear the 'hash fla=
g' or override specific ciphers, causing broken algorithms to be falsely re=
gistered.
--

--- Patch [3]: [PATCH v16 3/4] crypto: spacc - Add SPAcc AUTODETECT Support=
 ---
commit ecbce57497637f8381b32aed9f07d6c23e608ed7
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
crypto: spacc - Add SPAcc AUTODETECT Support

This commit introduces an autodetect configuration mode for the SPAcc
crypto driver to dynamically discover supported algorithms.

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> --- a/drivers/crypto/dwc-spacc/spacc_core.c
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c

[ ... ]

> +	if (err =3D=3D 0) {
> +		long ret;
> +
> +		ret =3D wait_event_interruptible_timeout(job->waitq,
> +				job->job_done,
> +				msecs_to_jiffies(SPACC_AUTODETECT_TIMEOUT_MS));
> +		if (ret =3D=3D 0) {
> +			/* no response; caller disables the whole mode */
> +			spacc_close(spacc, rc);
> +			return -ETIMEDOUT;

[Severity: High]
When a job times out, it is abandoned and spacc_close() marks its slot as
SPACC_JOB_IDX_UNUSED. If the hardware eventually completes this abandoned j=
ob
and the STAT IRQ fires, will spacc_pop_packets_ex() encounter this unused
slot, execute goto ERR, and skip processing the rest of the completed jobs
in the STAT FIFO? Could this cause remaining jobs to get permanently stuck?

> +		} else if (ret =3D=3D -ERESTARTSYS) {
> +			/* load interrupted; caller aborts and fails probe */
> +			spacc_close(spacc, rc);
> +			return -EINTR;

[Severity: Critical]
If the wait is interrupted (e.g. via a signal) or times out, the software
state is closed and the DMA buffers are immediately freed by the caller in
spacc_autodetect().

Because the hardware crypto engine is not explicitly instructed to abort
the job during spacc_close(), will it continue executing and asynchronously
write its result to the newly freed DMA memory?

> +		}
> +
> +		job->job_done =3D 0;
> +		err =3D job->job_err;
> +	}
> +
> +	output_zero_len =3D !testdata[algo_mode].test[keysz_idx].outlen;
> +	output_mismatch =3D memcmp(testdata[algo_mode].test[keysz_idx].data, vi=
rt,
> +			testdata[algo_mode].test[keysz_idx].outlen);
> +
> +	if (err !=3D 0 || output_zero_len || output_mismatch)
> +		spacc->config.modes[algo_mode] &=3D ~(1 << keysz_idx);

[Severity: Medium]
When an autodetect test fails, this bitwise operation only clears the
specific keysize bits (0-6). Does this leave bit 7 (the hash flag, 128)
set?

If bit 7 remains set, or if the algorithm uses a hardcoded check like
CRYPTO_MODE_AES_XTS, will spacc_is_mode_keysize_supported() bypass this
failure and falsely register algorithms that the hardware does not support?

> +
> +	spacc_close(spacc, rc);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707125311.2398=
031-1-pavitrakumarm@vayavyalabs.com?part=3D3
