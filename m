Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37B125B0AA
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789209097; cv=none; b=nKHV95UcpZRysuaC6N1tZQLRMT2DT2fAFrPZLu/ljeMgcYXKa4TMU8x0H1n/DygAGvQNzIjSM8V7mFDlWocSQXTcUQRnfdCAMVxzyF2LzXgCIWrHq7Hc/7y4GYDSEWxd1dz4quKr5uI79VnVHwA4QjIdhgRv/d92z496OvjTpQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789209097; c=relaxed/simple;
	bh=ZYgE+Fb4RQ4KgWEH2CNfTLIbHmArD+ozxdVsUqcUTS4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b4hEYM5MtrhA+UjQogX/is2D7gaeqauZQcor5AwgmxcVQoo/7chDzOKxsNbGOGMvkJsfAjIoYbtpHfUkqQf0ITOCh+fjSUBgVN58D9dw6cIAQ2dSyLRb/KGxAEQ3Q5IE+6/3mI94N5lI3YXJ2RxkQVmRL6xTWGjC7rwtXGlx97Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VicommLg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VicommLg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B061F000FF;
	Sat, 12 Sep 2026 10:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789209095;
	bh=QLUM11JE+0YEntfeW14dta1zAk5G3a6PEEGPR5aNMCg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VicommLgVyC/iG577vs1jh7uXjG7zwEAObfL83+zBzS2dWxM5VxwzCIDXonyIwgoF
	 rZMwQeuA++p4+vSiDMJR2PQxQEOifuvjQ9ltxgms/NRGRU4RWng1W9ogFS4i8fpD0B
	 a+nNjPbj4zARLjX4QdZ6ZyEvsbIgYuG48z0TUc/7CDmplU8qad6rCtix0ZrmD6N9rC
	 m25OP3vGrbOgP1dqE+V+5UOl/fHAtNvKZFirvXrbz2SH1IFXXKLKf+P63M5JYdg8io
	 8G2gTi6oN8N2waIv8XQC/jKtOzZv+fk+m+Kcp8gZk+uiM3qnFVlqzpZaJtY1j2/89c
	 R6Im02Lp0UbmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/5] optee: riscv: add shared memory and scheduled
 calls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amirreza Zarrabi" <amirreza.zarrabi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260912-rpmi-tee-service-grp-dev-v1-2-1d1d35c2a859@oss.qualcomm.com>
References: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
 <20260912-rpmi-tee-service-grp-dev-v1-2-1d1d35c2a859@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 10:31:35 +0000
Message-Id: <20260912103135.76B061F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Valid memory parcel IDs >=3D 0x80000000 are incorrectly treated as=
 negative error codes due to sign extension and int truncation.
- [High] Array sizing and indexing use num_possible_cpus() instead of nr_cp=
u_ids, causing out-of-bounds rejections on systems with sparse logical CPU =
IDs.
- [High] The rhashtable element `struct shm_rhash` is freed synchronously w=
ith `kfree()` upon removal, causing a use-after-free race with the backgrou=
nd rhashtable resizing worker.
- [Medium] Missing call to optee_shm_arg_cache_uninit() on the probe error =
path causing a resource leak.
--

commit 7782cc7b47fb82ba73be35240ca31c1527d2ca1e
Author: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date:   Sat Sep 12 10:15:13 2026 +0000

    optee: riscv: add shared memory and scheduled calls
   =20
    Add the shared-memory and call support required by the RISC-V RPMI
    transport.

> diff --git a/drivers/tee/optee/optee_riscv.c b/drivers/tee/optee/optee_ri=
scv.c
> index 0fe4edf92fc9b..36115326486d6 100644
> --- a/drivers/tee/optee/optee_riscv.c
> +++ b/drivers/tee/optee/optee_riscv.c
[ ... ]
> @@ -86,61 +116,887 @@ static int optee_riscv_probe_feature(struct optee *=
optee, u32 feature_id,
>  	if (rx.status)
>  		return rpmi_to_linux_error(le32_to_cpu(rx.status));
> =20
> -	if (value)
> -		*value =3D le32_to_cpu(rx.value);
> +	for (i =3D 0; i < RPMI_TEE_OPTEE_RESP_REGS; i++)
> +		out[i] =3D rpmi_xlen_to_cpu(rx.reg[i]);
> =20
>  	return 0;
>  }
> =20
> -static int optee_riscv_features(struct optee *optee)
> +/*
> + * 1. Maintain a hash table for lookup of a memory parcel id
> + *
> + * The RPMI framework assigns a memory parcel id for each piece of shared
> + * memory. Together with a caller-supplied nonce it forms the wire ident=
ity
> + * used when communicating with secure world, playing the exact role of =
the
> + * FF-A global memory handle.
> + *
> + * Main functions are optee_shm_add_riscv_handle() and
> + * optee_shm_rem_riscv_handle().
> + */
> +struct shm_rhash {
> +	struct tee_shm *shm;
> +	u64 global_id;
> +	struct rhash_head linkage;
> +};

[Severity: High]
Does this struct need an rcu_head field for safe RCU-deferred freeing?

Since the hash table is initialized with automatic_shrinking =3D true, the
RCU-based background resizing worker (rht_deferred_worker) can traverse the
hash table concurrently.

> +
> +static void rh_free_fn(void *ptr, void *arg)
>  {
> -	u32 share =3D RPMI_TEE_MEMORY_SHARE_NONE;
> +	kfree(ptr);
> +}
> +
> +static const struct rhashtable_params shm_rhash_params =3D {
> +	.head_offset =3D offsetof(struct shm_rhash, linkage),
> +	.key_len     =3D sizeof(u64),
> +	.key_offset  =3D offsetof(struct shm_rhash, global_id),
> +	.automatic_shrinking =3D true,
> +};
[ ... ]
> +static int optee_shm_rem_riscv_handle(struct optee *optee, u64 global_id)
> +{
> +	struct shm_rhash *r;
> +	int rc =3D -ENOENT;
> +
> +	mutex_lock(&optee->riscv.mutex);
> +	r =3D rhashtable_lookup_fast(&optee->riscv.global_ids, &global_id,
> +				   shm_rhash_params);
> +	if (r)
> +		rc =3D rhashtable_remove_fast(&optee->riscv.global_ids,
> +					    &r->linkage, shm_rhash_params);
> +	mutex_unlock(&optee->riscv.mutex);
> +
> +	if (!rc)
> +		kfree(r);

[Severity: High]
Can freeing this element synchronously with kfree() cause a use-after-free
with the background rhashtable resizing worker?

Without an RCU grace period (using kfree_rcu()), the background worker might
access the freed linkage pointers.

> +
> +	return rc;
> +}
[ ... ]
> +static int optee_riscv_parcel_create(struct optee *optee, struct page **=
pages,
> +				     size_t num_pages, u32 nonce)
> +{
[ ... ]
> +	rpmi_mbox_init_send_with_response(&msg, RPMI_TEE_SRV_MEM_PARCEL_CREATE,
> +					  req, req_len, &rx, sizeof(rx));
> +	ret =3D optee_riscv_send(optee, &msg);
> +	kfree(req);
> +	if (ret)
> +		return ret;
> +	if (rx.status)
> +		return rpmi_to_linux_error(le32_to_cpu(rx.status));
> =20
> -	return 0;
> +	return le32_to_cpu(rx.mem_parcel_id);
>  }

[Severity: High]
Since this function returns an int, what happens if rx.mem_parcel_id is a
valid 32-bit unsigned ID with the most significant bit set (>=3D 0x80000000=
)?

The unsigned value would be sign-extended to a negative integer, causing the
caller to misinterpret it as an error code.

> +
> +static int optee_riscv_shm_register(struct tee_context *ctx,
> +				    struct tee_shm *shm, struct page **pages,
> +				    size_t num_pages, unsigned long start)
> +{
[ ... ]
> +	nonce =3D (u32)atomic_inc_return(&optee->riscv.next_nonce);
> +	rc =3D optee_riscv_parcel_create(optee, pages, num_pages, nonce);
> +	if (rc < 0)
> +		return rc;

[Severity: High]
Following up on the previous question, if a valid memory parcel ID >=3D
0x80000000 is returned, will this error check mistakenly trigger?

This would result in returning early without reclaiming the parcel,
permanently leaking it in the firmware and causing the allocation to fail.

> +	global_id =3D (u32)rc | ((u64)nonce << 32);
> +
> +	rc =3D optee_shm_add_riscv_handle(optee, shm, global_id);
> +	if (rc) {
> +		optee_riscv_parcel_reclaim(optee, (u32)global_id);
> +		return rc;
> +	}
[ ... ]
>  static int optee_riscv_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct rpmi_mbox_message msg;
> +	unsigned int rpc_param_count;
> +	unsigned int max_notif_value;
> +	struct tee_shm_pool *pool;
> +	struct tee_device *teedev;
> +	struct tee_context *ctx;
>  	struct mbox_client *client;
>  	struct optee *optee;
> -	u32 servicegroup_id;
> +	u32 sec_caps;
>  	unsigned int nr_cpus;
> -	int ret;
> +	int rc;
> =20
>  	nr_cpus =3D num_possible_cpus();
>  	if (!nr_cpus)
> @@ -206,7 +1164,7 @@ static int optee_riscv_probe(struct platform_device =
*pdev)
> =20
>  	client =3D devm_kzalloc(dev, sizeof(*client), GFP_KERNEL);
>  	if (!client) {
> -		ret =3D -ENOMEM;
> +		rc =3D -ENOMEM;
>  		goto err_free_optee;
>  	}
>  	client->dev		=3D dev;
> @@ -221,66 +1179,156 @@ static int optee_riscv_probe(struct platform_devi=
ce *pdev)
>  	optee->riscv.chan =3D kcalloc(nr_cpus, sizeof(*optee->riscv.chan),
>  				    GFP_KERNEL);

[Severity: High]
Does allocating this array using num_possible_cpus() risk being too small
on systems with sparse logical CPU IDs?

If a sparse logical CPU ID is retrieved via get_cpu() in optee_riscv_send(),
it might exceed the population count used to size this array.

For example, if get_cpu() returns a sparse ID that is numerically larger
than the population count, optee_riscv_send() checks:

	cpu =3D get_cpu();
	if (cpu >=3D optee->riscv.nr_chan || !optee->riscv.chan[cpu]) {
		put_cpu();
		return -ENODEV;
	}

This could lead to valid CPUs being incorrectly rejected because their ID is
>=3D nr_cpus, even though they are valid logical CPUs. Should nr_cpu_ids be
used instead?

>  	if (!optee->riscv.chan) {
> -		ret =3D -ENOMEM;
> +		rc =3D -ENOMEM;
>  		goto err_free_optee;
>  	}
[ ... ]
> +	rc =3D rhashtable_init(&optee->riscv.global_ids, &shm_rhash_params);
> +	if (rc)
> +		goto err_unreg_supp_teedev;
> +	mutex_init(&optee->riscv.mutex);
> +	atomic_set(&optee->riscv.next_nonce, 0);
> +	optee_cq_init(&optee->call_queue, 0);
> +	optee_supp_init(&optee->supp);
> +	optee_shm_arg_cache_init(optee, 0);
> +	mutex_init(&optee->rpmb_dev_mutex);
>  	platform_set_drvdata(pdev, optee);
> +
> +	ctx =3D teedev_open(optee->teedev);
> +	if (IS_ERR(ctx)) {
> +		rc =3D PTR_ERR(ctx);
> +		goto err_rhashtable_free;
> +	}
> +	optee->ctx =3D ctx;
[ ... ]
> +err_rhashtable_free:
> +	rhashtable_free_and_destroy(&optee->riscv.global_ids, rh_free_fn, NULL);
> +	rpmb_dev_put(optee->rpmb_dev);
> +	mutex_destroy(&optee->rpmb_dev_mutex);
> +	optee_supp_uninit(&optee->supp);
> +	mutex_destroy(&optee->call_queue.mutex);
> +	mutex_destroy(&optee->riscv.mutex);

[Severity: Medium]
Should there be a call to optee_shm_arg_cache_uninit() in this error path?

It looks like the resources allocated by optee_shm_arg_cache_init() might
leak if probe fails here.

> +err_unreg_supp_teedev:
> +	tee_device_unregister(optee->supp_teedev);
> +err_unreg_teedev:
> +	tee_device_unregister(optee->teedev);
> +err_free_shm_pool:
> +	tee_shm_pool_free(pool);
>  err_free_channels:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-rpmi-tee-s=
ervice-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com?part=3D2
