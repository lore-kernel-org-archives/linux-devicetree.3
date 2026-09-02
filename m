Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B93747277C
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347364; cv=none; b=BZYUd24RY2BZhOj+oHl8T2yudvqKvmKlfOrS3uNz+cHLIuwfsIB0MgAZcTG3dDZQqFXwfIZMJ2DV1EoV+jn0EqU/rNGXcjTXlU7hdyuBydaEzG3aZicWIsieW4b5frgDiAwvGR6hYw4LNl/Gdr7xjmyY1Q8L7cNIOyZfI4A/xIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347364; c=relaxed/simple;
	bh=OM9XpgSLD1cEcRNRnaH8dcP/FbXFMHG5T6yDaXj7tNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CTGqteiaHQkE1zwELivuavC8OPil3T5JrlenQduIupL+VF+OlhaQASB7NhSi4TNl/KJP41UEFnWEWlhB6o2MzpvZ4/DPb45H0mli7Df5vBaH/dZcQdmXYMCzX6PFOmO/dGzUv8PyNJz9ggJuopi6K+VH/x9W3ES/dvX6iql6nvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzXyrNfp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzXyrNfp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00211F000E9;
	Wed,  2 Sep 2026 11:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788347360;
	bh=9vqn3XAffMn6BhClpX7JtxO4WPb18LP9ycyftkVIKe0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BzXyrNfpUMlbCbgYLUjJ7OVylVUM5I/jRXpice8dPKy2Wn283IQHyH98sdSVMHrWN
	 879/ILZX3zzPhNrBtayi4uTW0aldZH3FqDq23iNZ2B7o6lcXvvPv4CixrGqBqaGZAO
	 0DjC4TnT46C/mSDSTuJv8ZxJ/lpoQdY/1BZed3jgdi/eavjg4cS0/Jq/Cs9KS/qjrf
	 FafAiIivuS6YmXcHGmkEggF8xyVenTpzy16Xd7pG5Rnk+QgHFC1imUTz2lmr1Uglqf
	 RYBB9IvCMK3cChcU7RFCw5c75BUJql55eDHphmepKiWKAsmKtxqLx28JSi6C/7ieud
	 WrRHwoby4Bq1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 10/10] optee: Add support for arm,ffa-lend-pool
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Donnefort" <vdonnefort@google.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260902104712.2399797-11-vdonnefort@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-11-vdonnefort@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:09:19 +0000
Message-Id: <20260902110919.E00211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Use-After-Free during driver removal when releasing the reserved m=
emory / lend pool device.
- [High] Memory leak and dangling pointer in global lists on probe error pa=
ths.
--

commit a9ed483b0a922615c4b6f53cf658491bee8ed6a1
Author: Vincent Donnefort <vdonnefort@google.com>

optee: Add support for arm,ffa-lend-pool

This commit hooks OP-TEE dynamically allocated protected memory pools to the
"arm,ffa-lend-pool" driver. It also adds reserved memory device
initialization and release for SMC transport platform devices.

> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -979,6 +979,7 @@ static void optee_ffa_remove(struct ffa_device *ffa_d=
ev)
> =20
>  	mutex_destroy(&optee->ffa.mutex);
>  	rhashtable_free_and_destroy(&optee->ffa.global_ids, rh_free_fn, NULL);
> +	ffa_lend_pool_detach(&optee->teedev->dev);

[Severity: High]
Can this cause a use-after-free when unbinding the driver?

The call to optee_remove_common() slightly earlier in this function will
unregister and eventually free optee->teedev. Does this subsequent call to
ffa_lend_pool_detach() dereference the already-freed optee->teedev pointer?

> =20
>  	kfree(optee);
>  }

[ ... ]

> @@ -1042,13 +1043,21 @@ static int optee_ffa_protmem_pool_init(struct opt=
ee *optee, u32 sec_caps)
>  	int rc =3D 0;
> =20
>  	if (sec_caps & OPTEE_FFA_SEC_CAP_PROTMEM) {
> +		rc =3D ffa_lend_pool_attach(&optee->teedev->dev);

[Severity: High]
Does this introduce a resource leak and dangling pointer on the probe error
paths?

If optee_ffa_probe() fails after this pool is successfully attached, the
error paths will unregister and free optee->teedev. However, it doesn't
appear that the error paths call ffa_lend_pool_detach() to clean this up.

Could this leave the freed device pointer tracked in the lend pool tracking,
leading to a use-after-free later if list operations occur?

> +		if (rc && rc !=3D -ENODEV)
>  			return rc;
> =20
>  		pool =3D optee_protmem_alloc_dyn_pool(optee, id);
> -		if (IS_ERR(pool))
> +		if (IS_ERR(pool)) {
> +			ffa_lend_pool_detach(&optee->teedev->dev);
>  			return PTR_ERR(pool);
> +		}

[ ... ]

> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -1528,6 +1529,8 @@ static void optee_smc_remove(struct platform_device=
 *pdev)
>  	if (optee->smc.memremaped_shm)
>  		memunmap(optee->smc.memremaped_shm);
> =20
> +	of_reserved_mem_device_release(&optee->teedev->dev);

[Severity: High]
Does this also trigger a use-after-free during driver removal?

Similar to optee_ffa_remove(), optee_smc_remove() calls
optee_remove_common() before reaching this code, which frees optee->teedev.
Is it safe to access optee->teedev->dev here after it has been freed?

> +
>  	kfree(optee);
>  }

[ ... ]

> @@ -1712,16 +1715,22 @@ static int optee_protmem_pool_init(struct optee *=
optee)
>  	if (!protm && !dyn_protm)
>  		return 0;
> =20
> +	of_reserved_mem_device_init_by_idx(&optee->teedev->dev,
> +					   dev_of_node(optee->teedev->dev.parent), 0);

[Severity: High]
Is there a missing of_reserved_mem_device_release() on the optee_probe()
error paths?

If a failure occurs later in optee_probe() (for instance, if
optee_enumerate_devices() fails), the error handling jumps to labels like
err_disable_shm_cache and err_unreg_teedev. Those paths unregister and free
optee->teedev, but do not release this reserved memory device.

Could this leave the freed dev pointer tracked in the global
of_rmem_assigned_device_list, risking memory corruption if another device
requests memory later?

>  	if (protm)
>  		pool =3D static_protmem_pool_init(optee);
>  	if (dyn_protm && IS_ERR(pool))
>  		pool =3D optee_protmem_alloc_dyn_pool(optee, heap_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902104712.2399=
797-1-vdonnefort@google.com?part=3D10
