Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB373B52FA
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787697175; cv=none; b=oMDI8e8efMhMk6uB+yZg9nl2qPtcAl6+i/D70TGiDh1U4XFYbX07YIQgXdDKzKGQDSip047EG31rbOHe4bDvaDWx6iKnMWRdRog09sQJRly6Z/RpT62qK0Jjq1Hyvhe4S8A1hSG6PEGJ6XskvRd7jR8x9i/YvDT/lN/bhO0e+Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787697175; c=relaxed/simple;
	bh=Mv416VHMTmgcuLxrf4ipXGY6lBpYatlIf61ksDHlhb8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rMm2kRO4ZN1fFJtyFINtlW1nB5gMjtM1Y7ZIaQ6gkODH2H4e2ax8vO3OZ6qCJX60aGMKNWnwYvArkbAAwimcfJw4aDMeUF2E5ZdRGEdiR2NWXxskh1BJR7DY5zgHRt9JrWyBvAJzBDZuXXZqiCKtfJbW+AwNIOJpoqxGPqt4cSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zwgx//eU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zwgx//eU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA8C1F000E9;
	Tue, 25 Aug 2026 22:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787697174;
	bh=AuxUoKHM/erqUgCbO+fDLAXGzQD90RCJ0stczLnycj8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zwgx//eUHL8hCwmsiSl/oAZu9xL+uQ/6wVqJEf57KFCRKetZVT2FaX+2b3Ha3Ww2J
	 xNIMyIi34I48HH7Q3kWHLKQ/ulKiGRiOx5nLBLsJANa2i7qYAlZHIOZopo4nPH82+8
	 8T6BDsTBOVUdcoHwXncGtRADYqMvz0hZrlzAUANIAaU2uFPdhG81rhTsL7kLNyFg44
	 vcJHOgjB5O5egTwPYQ0mHRzp/7PewUd8mljsq0lhkgtzFEFnWxTS+pDH29wEi3udsy
	 jhTNCXjxa0uA25Zy5Z0OKmuDHFfUbLSATAR1rSmMctYwCWZFjhtkBUwIpSu8Q0fWSO
	 yY3LOZR1UMfbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/19] crypto: cmh - add DRBG hwrng
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260825221539.255951-12-aousherovitch@rambus.com>
References: <20260825221539.255951-1-aousherovitch@rambus.com>
 <20260825221539.255951-12-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 22:32:53 +0000
Message-Id: <20260825223253.DFA8C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing hardware presence check in `cmh_rng_register` causes indef=
inite spinning if DRBG is absent.
- [High] Module unload frees in-flight DRBG DMA buffers without stopping th=
e hardware, causing a DMA use-after-free.
- [Medium] Small `kmalloc` buffer mapped for DMA risks cacheline sharing an=
d memory corruption.
--

commit 888e90a741e40c8e3f25d31a12ecb6c6108685b4
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add DRBG hwrng
   =20
Register the CMH DRBG core (core ID 0x0f) as an hwrng provider.
The hardware implements a NIST SP 800-90A compliant DRBG with
automatic self-seeding.

> diff --git a/drivers/crypto/cmh/cmh_rng.c b/drivers/crypto/cmh/cmh_rng.c
> index 0000000000000..a73634024e135
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_rng.c

[ ... ]

> +static int cmh_rng_read(struct hwrng *rng, void *data, size_t max, bool =
wait)
> +{
> +	struct cmh_dma_orphan *orphan;
> +	struct vcq_cmd vcq[DRBG_READ_VCQ_CMDS];
> +	dma_addr_t dma_addr;
> +	void *dmabuf;
> +	size_t nbytes;
> +	int ret;

[ ... ]

> +	nbytes =3D min_t(size_t, max, CMH_DRBG_MAX_GENERATE);
> +
> +	orphan =3D kmalloc_obj(*orphan, GFP_KERNEL);
> +	if (!orphan)
> +		return -ENOMEM;
> +
> +	dmabuf =3D kmalloc(nbytes, GFP_KERNEL);
> +	if (!dmabuf) {
> +		kfree(orphan);
> +		return -ENOMEM;
> +	}
> +
> +	dma_addr =3D cmh_dma_map_single(dmabuf, nbytes, DMA_FROM_DEVICE);

[Severity: Medium]
Since dmabuf is a small allocation (up to 32 bytes) from the generic kmalloc
cache, does mapping it for DMA risk cacheline sharing and memory corruption?

On architectures without SWIOTLB bounce-buffering for unaligned kmallocs,
this violates DMA API requirements for cacheline alignment and risks adjace=
nt
object corruption upon unmap or invalidate.

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

[Severity: High]
Does this code introduce a DMA use-after-free during module unload?

If cmh_rng_read() returns 0 on a timeout (-EINPROGRESS), the hardware conti=
nues
executing and an orphan callback (cmh_dma_orphan_free) is set. During module
unload, cmh_tm_cleanup() forcefully completes timed-out transactions to dra=
in
the queues, triggering the orphan callback which unmaps and frees the DMA
buffer:

drivers/crypto/cmh/cmh_dma.c:cmh_dma_orphan_free() {
    cmh_dma_unmap_single(o->addr, o->len, o->dir);
    kfree_sensitive(o->buf);
}

Because the hardware lacks a stop primitive and is still running, when it
finally completes, will it write random bytes into the freed physical memor=
y?

[ ... ]

> +int cmh_rng_register(struct platform_device *pdev)
> +{
> +	struct vcq_cmd cfg_vcq[DRBG_CONFIG_VCQ_CMDS];
> +	int ret;
> +
> +	/*
> +	 * The hwrng core elevates a zero quality to full trust (1024) for
> +	 * a hardware RNG, so cmh_hwrng.quality is left at 0.  Set it in the
> +	 * hwrng initializer to lower the entropy estimate if a platform
> +	 * requires it.
> +	 *
> +	 * DRBG CONFIG is a management-host operation.  Attempt it: it
> +	 * succeeds in stateless mode (any host) or when we are the
> +	 * management host.  On -EPERM (not the management host) continue
> +	 * without error -- GENERATE works once the management host has
> +	 * configured the DRBG.
> +	 */
> +	vcq_set_header(&cfg_vcq[0], DRBG_CONFIG_VCQ_CMDS);
> +	vcq_add_drbg_reset(&cfg_vcq[1]);
> +	vcq_add_drbg_config(&cfg_vcq[2], CMH_DRBG_ENTROPY_RATIO,
> +			    CMH_DRBG_SECURITY_STRENGTH);

[Severity: High]
Is it intentional to interact with the DRBG hardware here without checking =
if
the DRBG core is actually present?

Other CMH registration functions seem to use cmh_core_present(CMH_CORE_DRBG)
to guard against absent hardware. If the DRBG core is not present, commands
could time out. The function ignores the -ETIMEDOUT error, warns, and regis=
ters
the device anyway.

If a local process then reads from /dev/hwrng, cmh_rng_read() will time out
and return 0, which could force the hwrng core into an infinite retry loop,
causing readers to spin indefinitely.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825221539.2559=
51-1-aousherovitch@rambus.com?part=3D11
