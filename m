Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A1544E66F
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 23:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686888; cv=none; b=gXzorLVNs893W4gW/FBVgNYJOUi1E0wiBvYzqknibU4VdECbYLKWbedmhv4mSrio5Icmt7I2nT1RSBKOjWT/46VL3YnM5KnL3BsjWxv2/NRRlK/jjM+C2AmuB3C9lkby4NyJEKkGOWBggJhCY2VbxMhRMEiLAP/eiXEBmRWMOEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686888; c=relaxed/simple;
	bh=mLTaTEtE/ybMJejT9CV6bK0DB4RsE2amj1mh2AiJqT4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I+Pg2LSOLijmarCdbdTGawpYC+Nq6mW1pMdhDFaSWDH4Xs0tmCnFYoiVNxSFJicvLZxdudqH9ZtmAtoijpvUn8Nmg/HB6Fe/EL009+WWVsU90azxs84g55G1YlQEVG9Ra3thFyb6phYpot/dBiGoY0aEDOQgAQjaV+uzKOSMs0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FUOHDEkQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FUOHDEkQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EB61F00893;
	Thu, 17 Sep 2026 23:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686882;
	bh=t5rHHyVZbcQfmBUqaNZnrlq8pTdncppF9/0FOf48Mlk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FUOHDEkQ6oem/CD8+adCaTkzltCa/mBMXuzD2mZ/1l60BRxC8eUnG/fshDi20Xuki
	 yjOLEy1MDdRiHDKrfB97BbdMQvFVv4jYUYQrNtPPw1coOkOm6bpSKZB9DFTJWC5dyc
	 tmQoNqhUX0IWIXKXf1P2nPSzijVuDXaOTAUl9e97qbTTe13/7jSOIvOe1t/onU2v69
	 ZiLdm4LBmO51CIlURV7vU6IXhl1nPfkXMR2D5xFHQdFG5c/J96mThNR2aOKr86VMk1
	 y9vi1X0+irBZp5dDZY/cvOoIqx9NgwQnWLRx4RD7S/h0JwVcgSsXcKxTNTg0ugG2lM
	 ptQEeVbqsmIUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/19] crypto: cmh - add DRBG hwrng
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917225929.2494111-12-aousherovitch@rambus.com>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-12-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:14:41 +0000
Message-Id: <20260917231441.C6EB61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] rng: DMA use-after-free on module unload due to un-aborted DRBG op=
eration
- [Medium] rng: infinite retry loop on fatal hardware error in cmh_rng_read=
()
- [Medium] rng: mailbox queue exhaustion from orphaned DRBG requests
--

commit 8d9076a5e8784ced0b9563b435b225e28e6737e2
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add DRBG hwrng

This commit registers the CMH DRBG core as a hardware RNG provider. It adds
synchronous reads that map DMA buffers and submit VCQ commands through the
transaction manager to gather entropy from the device.

> diff --git a/drivers/crypto/cmh/cmh_rng.c b/drivers/crypto/cmh/cmh_rng.c
> new file mode 100644
> index 0000000000000..a73634024e135
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_rng.c
[ ... ]
> +	/*
> +	 * Use the noabort variant: if the MBX is occupied by a slow
> +	 * operation (e.g. SLH-DSA sign at 120 s), we must not issue
> +	 * MBX_COMMAND_ABORT -- that would kill the unrelated in-flight
> +	 * VCQ.  On timeout with an in-flight VCQ (-EINPROGRESS), the
> +	 * orphan callback defers DMA cleanup until the RH fires.
> +	 */
> +	ret =3D cmh_tm_submit_sync_noabort(vcq, DRBG_READ_VCQ_CMDS, 1,
> +					 msecs_to_jiffies(drbg_timeout_ms),
> +					 cmh_dma_orphan_free, orphan);

[Severity: High]
Could this cause a DMA use-after-free during module unload? Since
cmh_tm_submit_sync_noabort() leaves the hardware operation running in the
background, if the cmh module is unloaded, cmh_tm_cleanup() will force-canc=
el
the transaction and trigger cmh_dma_orphan_free(). This unmaps and frees the
DMA buffer while the hardware accelerator is still actively writing to it.

> +	if (ret =3D=3D -EINPROGRESS) {
> +		/*
> +		 * The orphan callback owns dmabuf and frees it on VCQ
> +		 * completion.  Return 0 (not -EAGAIN): .read() only runs with
> +		 * wait=3Dtrue (see the !wait early return above), and the hwrng
> +		 * core forwards a negative errno straight to a blocking read
> +		 * whereas a 0 return makes it retry.
> +		 */
> +		return 0;
> +	}

[Severity: Medium]
Does returning 0 here cause mailbox queue exhaustion? When 0 is returned
on a timeout, the hwrng core immediately retries the read. Since the
hardware might be blocked by a slow operation, won't this rapidly submit
more DRBG requests until the Command Message Queue is completely filled
with orphaned requests, blocking all other subsystems?

[ ... ]
> +		switch (ret) {
> +		case -EAGAIN:
> +		case -EBUSY:
> +		case -ETIMEDOUT:
> +		case -EIO:
> +		/*
> +		 * -ENODEV: the TM is not running -- occurs when the
> +		 * hwrng kthread (PF_NOFREEZE, not frozen during
> +		 * suspend) calls .read() while the device is suspended.
> +		 * Treat as transient: the TM restarts on resume.
> +		 */
> +		case -ENODEV:
> +			dev_dbg_ratelimited(cmh_dev(),
> +					    "rng: transient DRBG failure (rc=3D%d)\n",
> +					    ret);
> +			kfree_sensitive(dmabuf);
> +			/*
> +			 * Back off before the hwrng core re-issues the
> +			 * blocking read: rng_dev_read() loops on a 0 return
> +			 * with only a conditional need_resched, so a persistent
> +			 * transient fault would otherwise spin the CPU.
> +			 */
> +			msleep(CMH_DRBG_RETRY_BACKOFF_MS);
> +			return 0;

[Severity: Medium]
Will this create an infinite retry loop for fatal hardware errors? By
masking -EIO to 0 and treating it as a transient error, rng_dev_read()
will retry the read indefinitely if the accelerator encounters a persistent
failure. Should fatal errors be propagated to break the loop instead of
returning 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917225929.2494=
111-1-aousherovitch@rambus.com?part=3D11
