Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70223446C01
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321754; cv=none; b=nN2txXor1aLMQYUnxVeLuWZDXGCdZfHO4rPUDtDlhsC6B50+MUtKqAeXzPne6QZtU4QvojT3CN5TZCCAzEaRmSvlO5QRUKkSN5JHipLRpgYOCqEVYYnQKrHAQKhslsZIfmP09k+xHLPul6sQx2EjICtt8pSqFdJ6WfguLHOyBDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321754; c=relaxed/simple;
	bh=otLTJVv5EptweQY8zjnrdWfPZBg5pE+xxkmF+MrQUh0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fTFUgj0JQFYnE903qS60vqfAqG8ApPNhy39qDfJz3bNbPvABs/zWLrxQTl6SliXvoe3XxlXbxgjUlZOLyp6kIda8oR3yF/81Ul9ZkkpVwgW+WlR7iCuukcXoOQfW5ya1UpXp1c1OV5PFh9FUb+GiH8paQgeIOfd8AP2k4KQXhj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fu/1Pis9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fu/1Pis9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C3BF1F000E9;
	Wed, 29 Jul 2026 10:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785321747;
	bh=7aafAII75zFOwDIet+zxccb/wH6Cjbph1bV4JdIARek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fu/1Pis9KDEBb0e55Wp7zy84pUeAILmyunJ6fsj5w54DCIYth7lEeeeiD3bK3LznH
	 pGo3b6j5+5v8adIrDrnSsQLesYK0uOQrCh0l2HG3rvOUk/15zjRiZCTVhd2GDvCGgS
	 CNd9Lx9NwAI0tZ3GFHXRYZABtfsWBU0AOCa8M5l1pV4UpxpjNr0F0V6ejdrRjFCTKv
	 k2pgNLBI5rr7LK//Eh6HFTP4P3k9ka6O+OIFr6JJUFnb44r9k+VlaBrtuEq1b1Ozmp
	 L1bXU4P0B2AZj4z5lq1VvC5DIUmjT14rC6Qhsh7LqVL1rgkDx4eVm/VtaLIdniqxko
	 +WiEL/9LuKT3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 3/4] crypto: spacc - Add SPAcc AUTODETECT Support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260729102547.159890-4-pavitrakumarm@vayavyalabs.com>
References: <20260729102547.159890-1-pavitrakumarm@vayavyalabs.com>
 <20260729102547.159890-4-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 10:42:26 +0000
Message-Id: <20260729104227.3C3BF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unbounded wait_event() in spacc_check_modes() can hang the kernel =
unkillably on hardware failure
--

--- Patch [3]: [PATCH v19 3/4] crypto: spacc - Add SPAcc AUTODETECT Support=
 ---
commit 962d554e2ceb06aab36f424093e873ccc473ceb6
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

crypto: spacc - Add SPAcc AUTODETECT Support

This commit adds autodetect configuration support to the SPAcc driver.
It attempts to automatically detect the supported cryptographic algorithms
at runtime instead of relying on a static configuration.

> diff --git a/drivers/crypto/dwc-spacc/spacc_core.c b/drivers/crypto/dwc-s=
pacc/spacc_core.c
> index b4eaab534c8ee..ec77a13612756 100644
> --- a/drivers/crypto/dwc-spacc/spacc_core.c
> +++ b/drivers/crypto/dwc-spacc/spacc_core.c
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
                ^^^^^^^^^^

[Severity: High]
Is it safe to use an unbounded wait here?

If the hardware is faulty or drops the interrupt, wait_event() will hang
indefinitely in TASK_UNINTERRUPTIBLE (D-state). If the driver is built-in,
this would hang the entire kernel boot process. If it is loaded as a module,
it permanently hangs the loading process.

While the comment explains this is a deliberate tradeoff to avoid a
use-after-free, could we use wait_event_timeout() instead? If the timeout
expires, the driver could fail the probe and intentionally leak the DMA
buffers and job context (or reset the hardware block) to safely prevent the
UAF without permanently hanging the system.

> +
> +		job->job_done =3D 0;
> +		err =3D job->job_err;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729102547.1598=
90-1-pavitrakumarm@vayavyalabs.com?part=3D3
