Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B368C3F4DDC
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910127; cv=none; b=VcfeAOPSG9Yl8Yd+w21C/prPIxx+inYw6MGvW4Lw9G7zS59DuG5cGNWeTEsD0GVbmx2+25H1W0nGIivgh4PlkKuOLuPE41zAXtKobDjqMMsUkutceYVefB6pTrpWVUV/SQ+1q4tDLcCvECwCWqC0IoEgqh/GzykAwmU2Vx37SII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910127; c=relaxed/simple;
	bh=77T/fxoTkrH7sAuRwclcktPTDpd2RSVcgrqfY7REfvo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oEvVi8R3m8XWoOEb9bR5ha1RUHk5rYXGpcUOG0alGU6oH197iJpV/vc4H+FZKdxvoMoArQC+AddiVw/Jpciljx4dpBk2Gn+58CIRKnFNUltFfTW6U7ZxQ4QPQYRuk/BtMPPiXE+SrZGjtewJmxF/HwYzLeBHtF15HN/QKr3DkfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xiy4BZYU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xiy4BZYU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5291F000E9;
	Wed,  1 Jul 2026 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782910126;
	bh=kCfaZMg6oJxnUnZZJ/iUDbnggMYXpq/s+15GDwJM3RM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xiy4BZYU5akitbJL+4tTLTHJR8JPPXtWOaL5wmrN56rjh8h1vl+hbZ3rMvAZc43or
	 Cjyw2nxRcno76yv/A9Q72KyNnl0wMQe3x5lq3/DyoVRyOMXE5t7GxU5FmEQAd/u2FQ
	 YDbEyBYIfFsU7GUDbOOSqmdwc78+C476XYqI2WlS3DS+J/6mBU0GV/lMcrXguBjdUK
	 ymPwHzaZuqX3Wct/8qeM2ysL5XXoJI8AFGyRiVdIXqrk3ph+E1wQ8t+YsmZ2M67FeS
	 mijzGch0n/qd7CakPDuHOFddEO1QaW9PW6kcNhmbiKGky8/6PH6aG/ERdVDazezzfE
	 H6Y8wY1pXWe6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 3/4] crypto: spacc - Add SPAcc AUTODETECT Support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260701122941.2149121-4-pavitrakumarm@vayavyalabs.com>
References: <20260701122941.2149121-1-pavitrakumarm@vayavyalabs.com>
 <20260701122941.2149121-4-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 12:48:45 +0000
Message-Id: <20260701124846.2A5291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Critical] Abandoned autodetect jobs leave the SPAcc hardware engine perf=
orming active DMA operations into freed or reused memory buffers.
- [High] spacc_autodetect() ignores fatal error codes (-EINTR, -ETIMEDOUT) =
and unconditionally returns 0, falsely reporting success on failures.

Pre-existing issues:
- [High] Error paths in `spacc_open` increment `spacc->ctx_sem` incorrectly=
 (sometimes twice), permanently artificially inflating the hardware context=
 count.
--

commit 150bf09c88aa2a0a8786c39974aa1382292a056f
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc AUTODETECT Support

SPAcc is configurable and it supports the below modes:
1. AUTODETECT configuration - Autodetects the supported algos.
2. Static configuration - The algo support is defined statically.

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> index 68a309ee10d47..3e50488afeccd 100644
> --- a/drivers/crypto/dwc-spacc/spacc_core.c
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c
[ ... ]
> @@ -557,6 +1460,311 @@ int spacc_close(struct spacc_device *dev, int hand=
le)
[ ... ]
> +static int spacc_check_modes(struct spacc_device *spacc, int algo_mode,
> +			      int keysz_idx, void *virt, char *key,
> +			      struct pdu_ddt *ddt)
> +{
[ ... ]
> +	rc =3D spacc_open(spacc, enc, hash, -1, 0, NULL, NULL);

[Severity: High]
This is a pre-existing issue, but calling spacc_open() here can trigger a
double semaphore increment on its error path. If spacc_open() encounters an
unsupported mode, it jumps to err_release_job which calls
spacc_job_release(). Since spacc_job_release() internally calls
spacc_ctx_release() and issues an up() on the semaphore, falling through
to err_release_sem will execute a second up() on ctx_sem:

spacc_open() {
    ...
err_release_job:
    spacc_job_release(spacc, job_idx);
err_release_sem:
    if (!ctx_reused)
        up(&spacc->ctx_sem);
}

Could this double increment permanently inflate the context count and
eventually lead to concurrent allocations of the same hardware slot?

> +	if (rc < 0) {
> +		spacc->config.modes[algo_mode] &=3D ~(1 << keysz_idx);
> +		return 0;
> +	}
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
> +		} else if (ret =3D=3D -ERESTARTSYS) {
> +			/* load interrupted; caller aborts and fails probe */
> +			spacc_close(spacc, rc);
> +			return -EINTR;
> +		}

[Severity: Critical]
If wait_event_interruptible_timeout() times out or is interrupted, the
job is abandoned and we return here, but spacc_close() only clears the
software state. Is there a risk that the hardware engine continues
performing DMA into the buffers, leading to memory corruption when the
caller immediately frees the ddt and virt buffers?

> +
> +		job->job_done =3D 0;
> +		err =3D job->job_err;
> +	}
[ ... ]
> +int spacc_autodetect(struct spacc_device *spacc)
> +{
[ ... ]
> +			if (ret =3D=3D -ETIMEDOUT) {
> +				/*
> +				 * No response for this algorithm. Disable the
> +				 * whole mode (never ship a half-validated algo)
> +				 * and move on. Several timeouts in a row mean
> +				 * the engine is dead: fail loudly rather than
> +				 * silently registering a crippled device.
> +				 */
> +				spacc->config.modes[x] =3D 0;
> +
> +				if (++timeouts
> +					>=3D SPACC_AUTODETECT_MAX_TIMEOUTS) {
> +					dev_err(spacc->dptr,
> +						"SPAcc unresponsive: timeout");
> +					err =3D -ETIMEDOUT;
> +					goto out_free_dma;
> +				}
> +
> +				break;	/* skip this mode's other keysizes */
> +			}
> +
> +			/* engine answered =E2=80=94 reset the dead-engine streak */
> +			timeouts =3D 0;
> +		}
> +	}
> +
> +out_free_dma:
> +	pdu_ddt_free(&ddt);
> +	dma_free_coherent(get_ddt_device(),
> +			SPACC_TEST_DMA_BUFF_SIZE, virt, dma);
> +	spacc->autodetect =3D false;
> +
> +	return 0;
> +}

[Severity: High]
When returning from an error path via the out_free_dma label, does this
unconditionally return 0 and drop the recorded error code? It looks like
failures from spacc_check_modes() might be silently swallowed here,
causing the driver probe to report success even when hardware
initialization fails.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701122941.2149=
121-1-pavitrakumarm@vayavyalabs.com?part=3D3
