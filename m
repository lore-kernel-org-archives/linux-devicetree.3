Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66A541F359
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 23:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686934; cv=none; b=IyjYTyCF8qrd8KP7P8O5Hy0PZj2/+wZ5cnJbbUWZuI1cvol6cfxk7HikHjP+0k01sj8IiOmWB1ZrTPXG3IR9i27+uHuFWLECl7QxGzJhEASuQeetxMtSpUwoC0AF+A1n3xBeD9X4MJ1FpEiVaB1ZhXSemaaodIRPG5XUAM0Z5rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686934; c=relaxed/simple;
	bh=TctMtNNx/NIhRzqXnAUoZZz0Pd/7//GAmlOSUy3ypoU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qCE4gYPn6DFquq65Q4yeDj3aL7KasgJWIyHUYta9MKLTUZ8OJkVXeyJYXt610Ac91Q9V+ZeDQKlm6kRfN4+KRH6TyJ0u5rQV8hYZ3KiMUoIAf8nf0vs96dN7n8AdH08RTabZKHNewRqzvSWhpPTdCkyvOhMCSvZtNPEQYxaV5Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YG81aZFd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YG81aZFd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B171F000FF;
	Thu, 17 Sep 2026 23:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789686928;
	bh=8Y3ymB4l+gsn+/BVUO4yzfmKXPA5vCqKX9jJ7krqDms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YG81aZFdkaya9XO0ETp1ClNZFLRSBE5iZOgqqpb69e9Yirqao0uE09m3CeQhR0qEh
	 V/Lwabh7s8rS8sHvi149iYZrN6gt5rB8VUOC2S6US7xGVZ2P2d7dj5wOG0S7Xk4e+2
	 kXC3jFUUPMzQH1ChQnf5oWT63MHqEOOVxSv1hsNzfO6ACBG/pbaeWXHj8ERNBeeSFq
	 /y55wx4gEbreJejvXf2DWVF4r4Gw154qWBZECx/rIpeD7L3LtyVijogbYsQkc4tFEg
	 1H4oq5f+/7ULqwE4q4WTEgBF6t0aN+p7CSPoz4BVjbAPWHEjhXRYr+jsUfN+QM9kgX
	 RfmwnDiDstYuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/19] crypto: cmh - add key provisioning and
 management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917225929.2494111-4-aousherovitch@rambus.com>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-4-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:15:28 +0000
Message-Id: <20260917231528.64B171F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [Critical] crypto: cmh: Transaction abort timeout leads to Use-After-Free=
 of DMA buffers
- [High] crypto: cmh: Unmapped DMA address 0 is unmapped on error paths in =
PQC sign ioctls
- [High] crypto: cmh: cmh_mgmt_sm2_ecdh_hash() omits PKE_SWAP_FLAGS corrupt=
ing the shared key
- [High] crypto: cmh: Hardcoded PKE_SWAP_FLAGS corrupts ECDH operations for=
 X25519 and Curve448
- [High] crypto: cmh: Standard crypto requests are randomly aborted by mana=
gement ioctls
- [Medium] crypto: cmh: Resource leak in cmh_mgmt_sm2_ecdh_hash() error path
- [Medium] crypto: cmh: Guarding DMA unmap with && dma leaks mapping if val=
id address is 0
- [Medium] crypto: cmh: TOCTOU race on shared hardware temp store across mu=
ltiple ioctls
--

commit 48c89e33b36bd86891b285934734edd42955fb45
Author: Alex Ousherovitch <aousherovitch@rambus.com>
Subject: crypto: cmh - add key provisioning and management

This commit adds a character device (/dev/cmh_mgmt) to expose CMH management
operations such as key provisioning, derivation, asymmetric cryptography, a=
nd
post-quantum cryptography algorithms.

> diff --git a/drivers/crypto/cmh/cmh_txn.c b/drivers/crypto/cmh/cmh_txn.c
> --- a/drivers/crypto/cmh/cmh_txn.c
> +++ b/drivers/crypto/cmh/cmh_txn.c
> @@ -1453,30 +1453,25 @@ int cmh_tm_submit_sync_tmo(struct vcq_cmd *vcq_cm=
ds, u32 vcq_count,
>  			left =3D wait_for_completion_timeout(&sync->done,
>  							   5 * HZ);
>  			if (!left) {
>  				/*
>  				 * ABORT did not complete within 5 s -- the HW
[ ... ]
>  				dev_err(cmh_dev(),
>  					"tm: abort timeout (5s) cmd=3D0x%08x - HW wedged\n",
>  					msg->command_id);
>  			}
>  			cmh_sync_ctx_put(sync);  /* drop waiter ref */
>  			command_msg_put(msg);    /* drop waiter ref on msg */
>  		}
>  		return -ETIMEDOUT;

[Severity: Critical]
Is there a risk of a use-after-free here if the transaction abort times out?

When cmh_tm_submit_sync_tmo() returns -ETIMEDOUT, the callers proceed to
free their destination buffers. If the hardware is merely stalled rather
than completely wedged, and it subsequently completes the DMA operation,
could it write directly into the freed kernel memory?

> diff --git a/drivers/crypto/cmh/cmh_mgmt.c b/drivers/crypto/cmh/cmh_mgmt.c
> --- a/drivers/crypto/cmh/cmh_mgmt.c
> +++ b/drivers/crypto/cmh/cmh_mgmt.c
> @@ -1083,10 +1083,10 @@ static int cmh_mgmt_kic_aes_cmac_kdf(void __user =
*argp)
>  	if (label_buf) {
>  		cmh_dma_unmap_single(label_dma, req.label_len, DMA_TO_DEVICE);
>  		kfree(label_buf);
>  		label_buf =3D NULL;
>  	}
> =20
>  	if (ret)
>  		goto out_ref_cmac;
[ ... ]
>  out_unmap_label_cmac:
>  	if (label_buf && !cmh_dma_map_error(label_dma) && label_dma)
>  		cmh_dma_unmap_single(label_dma, req.label_len, DMA_TO_DEVICE);

[Severity: Medium]
Does checking && label_dma potentially leak the DMA mapping?=20

Since a physical address of 0 can be a valid mapped DMA address on some
systems, skipping the unmap when the address evaluates to false seems like
it could result in a resource leak.

[ ... ]
> @@ -1513,10 +1513,10 @@ static long cmh_mgmt_ioctl_locked(struct file *fi=
le, unsigned int cmd,
>  				  void __user *argp)
>  {
>  	int ret;
> =20
>  	if (cmh_mgmt_needs_temp_flush(cmd) &&
>  	    atomic_xchg(&mgmt_temp_dirty, 0)) {
>  		ret =3D cmh_tm_flush_mbx(MGMT_MBX);

[Severity: High]
Could this flush inadvertently cancel unrelated kernel crypto requests?

Standard crypto API requests are assigned mailboxes via round-robin, which
can include MGMT_MBX. When a management ioctl calls cmh_tm_flush_mbx()
to clear the temporary datastore stack, it issues a hardware command
that discards all queued commands. Will this forcefully abort in-flight
crypto requests with -ECANCELED?

[ ... ]
> @@ -1650,10 +1650,10 @@ static long cmh_mgmt_ioctl(struct file *file, uns=
igned int cmd,
>  			   unsigned long arg)
>  {
>  	void __user *argp =3D (void __user *)arg;
>  	long ret;
> =20
>  	mutex_lock(&cmh_mgmt_lock);
>  	ret =3D cmh_mgmt_ioctl_locked(file, cmd, argp);
>  	mutex_unlock(&cmh_mgmt_lock);
>  	return ret;
>  }

[Severity: Medium]
Is it possible to hit a TOCTOU race on the shared hardware temp store here?

Cross-ioctl flows targeting the temp store execute as separate ioctl calls.
Because cmh_mgmt_lock is released between them, couldn't a concurrent ioctl
from another process interleave, flush or overwrite the temporary datastore,
and destroy the first process's key material?

> diff --git a/drivers/crypto/cmh/cmh_mgmt_pke.c b/drivers/crypto/cmh/cmh_m=
gmt_pke.c
> --- a/drivers/crypto/cmh/cmh_mgmt_pke.c
> +++ b/drivers/crypto/cmh/cmh_mgmt_pke.c
> @@ -624,10 +624,10 @@ int cmh_mgmt_pke_ecdh(void __user *argp)
>  	if (req.flags || req.__reserved || req.__reserved2)
>  		return -EINVAL;
>  	clen =3D cmh_pke_validate_curve(req.curve);
>  	if (!clen)
>  		return -EINVAL;
> =20
>  	swap =3D PKE_SWAP_FLAGS;

[Severity: High]
Does hardcoding PKE_SWAP_FLAGS here corrupt ECDH operations for X25519 and
Curve448?=20

Edwards and Montgomery curves use native little-endian byte ordering
and must not be byte-swapped by the hardware. Should this use the
pke_swap_flags() helper instead?

[ ... ]
> @@ -712,10 +712,10 @@ int cmh_mgmt_pke_ecdh_keygen(void __user *argp)
>  	vcq_set_header(&vcq[0], PKE_VCQ_CMDS_MIN);
>  	vcq_add_pke_ecdh_keygen(&vcq[1], pke_cid, req.curve, clen,
>  				pkx_dma, req.key_ref,
>  				PKE_SWAP_FLAGS);

[Severity: High]
Similarly, can hardcoding PKE_SWAP_FLAGS in this VCQ builder corrupt
the generated keys for non-Weierstrass curves?=20
   =20
Using the curve helper would ensure correct byte ordering for Curve25519
and Curve448.

> diff --git a/drivers/crypto/cmh/cmh_mgmt_pqc.c b/drivers/crypto/cmh/cmh_m=
gmt_pqc.c
> --- a/drivers/crypto/cmh/cmh_mgmt_pqc.c
> +++ b/drivers/crypto/cmh/cmh_mgmt_pqc.c
> @@ -1178,10 +1178,10 @@ int cmh_mgmt_slhdsa_sign(void __user *argp)
>  	vcq_set_header(&vcq[0], HCQ_VCQ_CMDS_MIN);
>  	vcq_add_hcq_slhdsa_sign(&vcq[1], hcq_cid, req.parameter_set,
>  				req.msg_len, req.ctx_len,
>  				rnd_dma, msg_dma, ctx_dma,
>  				req.sk, sig_dma);
>  	vcq_add_hcq_flush(&vcq[2], hcq_cid);
> =20
>  	ret =3D cmh_tm_submit_sync_tmo(vcq, HCQ_VCQ_CMDS_MIN, 1, MGMT_MBX,
>  				     cmh_tm_slow_op_timeout_jiffies());
> =20
>  out_unmap:
>  	if (rnd_buf && !cmh_dma_map_error(rnd_dma))
>  		cmh_dma_unmap_single(rnd_dma, n_val, DMA_TO_DEVICE);

[Severity: High]
Can this lead to unmapping physical address 0?=20

The variable rnd_dma is initialized to 0. If rnd_buf is allocated but a
subsequent mapping fails, the code branches to out_unmap. Since checking
map error on 0 is typically false, this attempts to unmap 0, which violates
the DMA API and could trigger kernel panics or IOMMU faults.

[ ... ]
> @@ -1328,10 +1328,10 @@ int cmh_mgmt_slhdsa_sign_prehash(void __user *arg=
p)
>  	vcq_set_header(&vcq[0], HCQ_VCQ_CMDS_MIN);
>  	vcq_add_hcq_slhdsa_sign_prehash(&vcq[1], hcq_cid,
>  					hcq_cmd, req.parameter_set,
>  					req.prehash_algo,
>  					req.msg_len, req.ctx_len,
>  					rnd_dma, msg_dma, ctx_dma,
>  					req.sk, sig_dma);
>  	vcq_add_hcq_flush(&vcq[2], hcq_cid);
> =20
>  	ret =3D cmh_tm_submit_sync_tmo(vcq, HCQ_VCQ_CMDS_MIN, 1, MGMT_MBX,
>  				     cmh_tm_slow_op_timeout_jiffies());
> =20
>  out_unmap:
>  	if (rnd_buf && !cmh_dma_map_error(rnd_dma))
>  		cmh_dma_unmap_single(rnd_dma, n_val, DMA_TO_DEVICE);

[Severity: High]
Does this exhibit the same unmapped address 0 issue as seen above?

If rnd_buf is allocated but rnd_dma mapping was skipped or a later mapping
fails, unmapping 0 will occur here as well.

> diff --git a/drivers/crypto/cmh/cmh_pke_sm2.c b/drivers/crypto/cmh/cmh_pk=
e_sm2.c
> --- a/drivers/crypto/cmh/cmh_pke_sm2.c
> +++ b/drivers/crypto/cmh/cmh_pke_sm2.c
> @@ -646,10 +646,10 @@ int cmh_mgmt_sm2_ecdh_hash(void __user *argp)
>  	vcq_set_header(&vcq[0], 4);
>  	vcq_add_sys_new(&vcq[1], 0, ref_dma, SM2_SHARED_KEY_LEN);
>  	vcq[1].id |=3D PKE_SWAP_FLAGS;
>  	vcq_add_pke_sm2_ecdh_hash(&vcq[2], core_id, peer_dig_dma, dig_dma,
>  				  req.shared_point_ref, SYS_REF_LAST,
>  				  sk_type, PKE_SWAP_FLAGS);
>  	vcq_add_pke_flush(&vcq[3], core_id);
> =20
>  	ret =3D cmh_tm_submit_sync_mbx(vcq, 4, 1, MGMT_MBX);
>  	if (ret)
>  		goto out_unmap;

[Severity: Medium]
Is there a resource leak if Phase 1 fails?=20

When the sync submit fails, the code jumps to out_unmap but bypasses the
scrub operation. Without calling cmh_mgmt_ds_scrub(), the already-allocated
datastore object from sys_new will remain, causing a persistent datastore
resource leak.

[ ... ]
> @@ -654,10 +654,10 @@ int cmh_mgmt_sm2_ecdh_hash(void __user *argp)
>  	/* Sync bounce buffer so CPU sees the DMA-written ref */
>  	cmh_dma_sync_for_cpu(ref_dma, sizeof(u64), DMA_FROM_DEVICE);
> =20
>  	/* Phase 2: read shared key from DS -> DMA */
>  	vcq_set_header(&vcq[0], 3);
>  	vcq_add_sys_data(&vcq[1], *ref_buf, sk_dma, SM2_SHARED_KEY_LEN);
>  	vcq_add_sys_flush(&vcq[2]);

[Severity: High]
Will omitting PKE_SWAP_FLAGS here corrupt the shared key?=20

The SM2 key exchange requires PKE_SWAP_FLAGS on both its sys_new and
sys_data commands to byte-reverse the payload from the internal Weierstrass
format. Skipping this flag on Phase 2's sys_data command leaves the output
shared key with the wrong byte order, which would break SM2 key exchange
interoperability.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917225929.2494=
111-1-aousherovitch@rambus.com?part=3D3
