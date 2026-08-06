Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A7C4CA27C
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786047451; cv=none; b=ls/THpAlrOgb7ldyz5Csp/UvTJubRj7z3J/qAifGcPz7GNV1ucy77fq8XxWVqEI4b5J8EwG/PVfL1EZUxt5BlUF67QdTGIm1QhQm5+8wrcE1oNmiMeEqgTDUp+AR4CytD2wlX5xCldLadm1g9LB8qQzD/vG8OD9xXq20YKOOUIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786047451; c=relaxed/simple;
	bh=nNY5PPi3JtLg3RHh9hhKw33u3HO2OmIQ3zX6WpD7kpM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SLJ0y7galxRteVVra/voWgVTfueqtRhhDG5w9lhWmS1KucSUvXSB1I5sGJWE8QF/Fq3A8Uvcev6UpDyqYWt0wgHs57jm7IT0VoZy0+iXq1AFbze+SmpeDd4NyrXdoJsE/GLeokLu1+t0imKYbc/Tnd/ivm/Q3X825zifOrbVL0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bcb7Q3pP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bcb7Q3pP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5551F000E9;
	Thu,  6 Aug 2026 20:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786047446;
	bh=3/CeIqn2JqFLOfklkfIyUCOQCP8+h2tiHuTsle63td4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bcb7Q3pPUJKa0YYXyp+Z/xAq6x+Mm4Z335QSpzr385IEWkfI3DJ4M+raV8LPHdEu1
	 0IGUsyFbP9OJOIKoF+4en+dfBeGFoi4BXatVGgqweXJ3FNySRRY2MnrcPCYucy+pmR
	 lzFKoYIb14A0/87/0XTxB2omOVhm8HNKbH4d4LwOFX3WSs/pEXUiceCXSaCHHVNMcR
	 NGg/S+gYjpr4gH5ULdwgyHz+WvpwzUiWSpQR3UX0DXiOxo/LOCs8hNJ8LeVeY8fJEp
	 E41uVmbtRHD439G6BTCQVHyAqIZcJz2XBBTbROianm/jiiE+2BJfwnctF95+udn+8s
	 XXIIzLw2LEDAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/19] crypto: cmh - add DRBG hwrng
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806195519.2703224-12-skrishnamoorthy@rambus.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-12-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:17:25 +0000
Message-Id: <20260806201726.5E5551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Returning 0 on immediate transient or fatal errors during a blocki=
ng read causes a tight CPU loop in the hwrng core.
--

--- Patch [11]: [PATCH v3 11/19] crypto: cmh - add DRBG hwrng ---
commit 8691568ae77b559cf0523f037da202d7654311a0
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add DRBG hwrng

This commit registers the CMH DRBG core as a hardware RNG provider. It
implements a read callback that submits requests to the hardware
transaction manager.

> diff --git a/drivers/crypto/cmh/cmh_rng.c b/drivers/crypto/cmh/cmh_rng.c
> new file mode 100644
> index 0000000000000..9532b8d66b4c5
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_rng.c
[ ... ]
> +static int cmh_rng_read(struct hwrng *rng, void *data, size_t max, bool =
wait)
> +{
[ ... ]
> +	ret =3D cmh_tm_submit_sync_noabort(vcq, DRBG_READ_VCQ_CMDS, 1,
> +					 msecs_to_jiffies(drbg_timeout_ms),
> +					 cmh_dma_orphan_free, orphan);
[ ... ]
> +	if (ret) {
> +		/*
> +		 * .read() only runs with wait=3Dtrue (see the !wait early
> +		 * return above).  For known transient conditions return 0 so
> +		 * the hwrng core retries the blocking read; a negative errno
> +		 * here would be forwarded to userspace on a blocking fd
> +		 * (e.g. -EAGAIN violates POSIX).  Propagate genuinely
> +		 * unexpected failures so real faults are not masked into an
> +		 * indefinite retry loop.
> +		 */
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
> +			return 0;

[Severity: High]
If the hardware transaction manager is suspended (-ENODEV) or the command
queue is full (-EAGAIN), cmh_tm_submit_sync_noabort() returns the error
immediately and this code returns 0.

For a blocking read (wait =3D=3D true), won't the hwrng core receive 0 and =
loop
without sleeping? This appears to create a tight kernel-space loop that
repeatedly holds and releases the reading_mutex, hogging the CPU until the
transient condition resolves.

> +		default:
> +			dev_err_ratelimited(cmh_dev(),
> +					    "rng: DRBG generate failed (rc=3D%d)\n",
> +					    ret);
> +			kfree_sensitive(dmabuf);
> +			return ret;
> +		}
> +	}
> +
> +	memcpy(data, dmabuf, nbytes);
> +	kfree_sensitive(dmabuf);
> +
> +	return nbytes;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806195519.2703=
224-1-skrishnamoorthy@rambus.com?part=3D11
