Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481732;
	b=PDN43cqpCdZIyvPx/yFcSeJuIsAIdYebDysrqVClUB8zbVUU/4jXyhgoznbUNGonA3iq
	 3A3rwXInKwKCm16JlVExm/85CV6hzNUoyHXphGKV3e945cmgmw9Zxu57k3jq1eAh8CjLY
	 GYumSuVsCtwqAdhJz8G99zXH9UZs6/fSdcrYIYTzOvEyWJI5rJBdIXK0WfVf5mFDm8Ebg
	 /TWqet1cQKiM+NIGSCEaPmZW7QksS6+8sON7g5S1VISSK0UDedeYt1zne1/4aLfx1pO7V
	 Fml5EVOzZLmTT4vU2ABEtZHmUIWibb4P0F/xStjDPtzkzosI6Hf5k7xZoptSC2aQFJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481732;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=r8LeQJ3H9vwXd92l8n5mDTq6/jwXyFVP+xBw8qc6N4w=;
	b=eIDJvUSuOoP1Nbmlq5wdM5xSKDLG9rs2zpehi9hGwUOkfIMX4ghu3f0h/Auxr7a9vIaz
	 2Mi67R9/d1k6UwlsfwAmqQvVolvPEfkEWeEHSUi8dUDSDuKYx66vycTuO478Hm7NuPjXG
	 xmzZfBADzDvufE7wBmeXmqgooRE6YOJ885tKGNoJ1ZIB+f58moFr/+MVPgG1+DV87dKXg
	 AK4fF8ukQn3rdNbwdEkIz9qSPqr/sZyG0s0hXDgDefZ3wc5vbSHCZIl+fPWOWzg5ZNMHE
	 EFMR+9OMX1KF2Nj3yCGSxZQOTPrqt7Es7RDtUQk/B18DgvMniZbXo02HRoGA0Dt1u3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NzMZ1Oh9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86054606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NzMZ1Oh9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFAE1F00A05;
	Thu, 12 Nov 2026 11:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481732;
	bh=r8LeQJ3H9vwXd92l8n5mDTq6/jwXyFVP+xBw8qc6N4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NzMZ1Oh9HxHZ6qAk5EfPB8RIuILKq+u/heoaTo1HB53tH9+5pAKywe7KbvOxoq+zA
	 XATFxvjljrWRPI7iflpDvHXoKr30fBFmSTI/XNfdHoHHBI70Yl5971B6lXqcOjBPPG
	 iavS4XP4C9ZWMdrlksAJ6tvnCezzRTD0/4Ty3BOZM5/lQekHC75pQrP4Km93UEIyK0
	 IoPO2Yp4kzZkeJIjSK9qStqxhk+wW7s9m2pgkDzXwaaTkQ9WkbEpsd+YkIXUXCgBW0
	 3PsdCBnlJJ8x3WMAd1B2QG43Rlw/jWyA0Y9rY3LigHytx6iUKLSjfoOBvfehna4gln
	 VIwlv6tgvLALw==
Message-ID: <sashiko-outbox-210997@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/8] optee: Add support for lendable-dma-pool
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Donnefort" <vdonnefort@google.com>, catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, akpm@linux-foundation.org, m.szyprowski@samsung.com, jenswi@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mark.rutland@arm.com, robin.murphy@arm.com, hch@lst.de, ryan.roberts@arm.com, sumit.garg@kernel.org, sudeep.holla@kernel.org, ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, linux-mm@kvack.org, op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
In-Reply-To: <20261111110738.872947-9-vdonnefort@google.com>
References: <20261111110738.872947-1-vdonnefort@google.com>
 <20261111110738.872947-9-vdonnefort@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 11:08:50 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] optee: restore_direct_map_dyn_protmem() called when
  reclaim_protmem() fails
--

commit 1a801ca7487b0859c4bfdf62e4f1116b16a1b7fe
Author: Vincent Donnefort <vdonnefort@google.com>

optee: Add support for lendable-dma-pool

This commit uses dma_zap_direct_map() and dma_restore_direct_map() to
unmap dynamically allocated protected memory from the kernel linear map
before lending it to the secure world and restore it upon reclaim.

> diff --git a/drivers/tee/optee/protmem.c b/drivers/tee/optee/protmem.c
> index be3abf6e8aa6d..10e8f1540e5e8 100644
> --- a/drivers/tee/optee/protmem.c
> +++ b/drivers/tee/optee/protmem.c

[ ... ]

> @@ -76,6 +103,8 @@ static int init_dyn_protmem(struct optee_protmem_dyn_p=
ool *rp)
>  	rp->gen_pool =3D NULL;
>  err_reclaim:
>  	rp->optee->ops->reclaim_protmem(rp->optee, rp->protmem);
> +err_restore_direct_map:
> +	restore_direct_map_dyn_protmem(rp);
>  err_put_shm:
>  	tee_shm_put(rp->protmem);
>  err_null_protmem:
> @@ -112,6 +141,7 @@ static void release_dyn_protmem(struct optee_protmem_=
dyn_pool *rp)
>  	rp->gen_pool =3D NULL;
> =20
>  	rp->optee->ops->reclaim_protmem(rp->optee, rp->protmem);
> +	restore_direct_map_dyn_protmem(rp);
>  	rp->protmem->flags &=3D ~TEE_SHM_DYNAMIC;
> =20
>  	WARN(refcount_read(&rp->protmem->refcount) !=3D 1, "Unexpected refcount=
");

[Severity: High]
Can restore_direct_map_dyn_protmem() run while rp->protmem is still lent
to the secure world if reclaim_protmem() fails?

reclaim_protmem() can fail, for example if optee_get_msg_arg() returns
-ENOMEM in optee_smc_reclaim_protmem() or if the secure world has not
relinquished the memory handle in optee_ffa_reclaim_protmem().  Both
init_dyn_protmem() and release_dyn_protmem() ignore that return value and
unconditionally call restore_direct_map_dyn_protmem(rp).

On arm64, arch_dma_restore_direct_map() remaps the pages as cacheable in
the linear map and runs dcache_inval_poc() across the range, which
re-exposes the still-lent pages to CPU speculative reads and triggers a
synchronous external abort or SError on the cache maintenance before
tee_shm_put() returns the pages to the allocator.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111110738.8729=
47-1-vdonnefort@google.com?part=3D8
