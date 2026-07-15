Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9943480320
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126224; cv=none; b=N9TXiPWWG4eOUKH+OilJJCGAMB1U6Yrie44fhr9zPQ6nMKbn1nSPYL73fmydBhPd0JAfl7bAwOpVTzwFTq9l+DJqasJza6D4MSx0eMfEfx6531pU3Tpj/P0HFMIsTJQxEoyR5uWfoLUNyVfn82VETE5L+FTrDUZH296g/idEus8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126224; c=relaxed/simple;
	bh=U3MbEIdAzljtBFUuTBd/WX/QVwM2W3Q7I1mh/yB8+Oc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mf+RKixaGiCsIhzkYf2nnMWm1PWnhiC+lkmYCzELXbvS+MNCyrKebsWFNfHUHXx6ROXL61uCffAMEV9BFak1IG/xLBHIb/MHYsIX1TvY+AHp+goW7quld1X49+UnNPYSFLKlaOeZBi+p1tBnibWt/JCPovGw5QXYfr/ZU5iCOYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5aptBxq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5aptBxq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4871F000E9;
	Wed, 15 Jul 2026 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784126222;
	bh=BDj1M2Olpz8/lLFcqZACRgyhWu6KpFb8xXQ+wJM7g/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U5aptBxqu5mm0aTLV5FEQzyAR3VvSqIPeZKW4OIDll99hV/oFWGg6iwkDR5p1tYGP
	 qZ7hKq0szv94RTdh1GNIi1k2j3oYfyaRv3xoXMy11QhZpAOlLzIZ1rYSQ4Iz5mizHH
	 qYICnogm8ecy8wQLsRtEacVtzdP82s1pg+YsiXugd5d+Rhu+9qi7I8pFtmQNBXVg/c
	 HbglD6+Qhw5WTZNnrhxcQfjag6QWJD51orrnLChkVLbaCnXI1cxDHpUwM0nS7qeLYe
	 FlAcsZQZk8Z4SsAKjmxeOgp1NTlxH3UXK9BVD4mfQUJjigc9B/2TnbK6B4OjYPc2dt
	 246JrYM/oBUtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 06/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260715-glymur-v9-6-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-6-8cf2cbe12a07@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 14:37:01 +0000
Message-Id: <20260715143702.5B4871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Missing cleanup of PAS metadata DMA allocation introduces a memory=
 leak on every firmware load/unload and load error.
- [High] The `core->fw_dev` pointer is added to support Linux-managed IOMMU=
 mapping for the firmware context device, but it is never initialized anywh=
ere in the driver.

Pre-existing issues:
- [High] Missing cancel_delayed_work_sync() for sys_error_handler in driver=
 remove path leads to Use-After-Free.
--

--- Patch [6]: [PATCH v9 06/14] media: iris: Enable Secure PAS support with=
 IOMMU managed by Linux ---
commit d784ba63809fa89007c5ca51f86bf7421bf5d466
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

    media: iris: Enable Secure PAS support with IOMMU managed by Linux
   =20
    On platforms where a hypervisor is present, all Secure Monitor Calls
    (SMC) are intercepted. For qcom_scm_pas_auth_and_reset(), the hypervisor
    registers a Shared Memory (SHM) bridge over the Peripheral Image Loader
    (PIL) memory region so that TrustZone (TZ) can access it, forwards the
    authentication SMC to TZ, and upon return maps the PIL region and
    triggers the co-processor bring-up sequence.

    Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815=
380@oss.qualcomm.com/

> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/m=
edia/platform/qcom/iris/iris_firmware.c
> index 1a476146d7580..56c477b36b619 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
[ ... ]
> @@ -15,11 +17,14 @@
>  #define IRIS_PAS_ID				9
> =20
>  #define MAX_FIRMWARE_NAME_SIZE	128
> +#define IRIS_FW_START_ADDR	0
> =20
>  static int iris_load_fw_to_memory(struct iris_core *core, const char *fw=
_name)
>  {
> +	struct device *fw_dev =3D core->fw_dev ? core->fw_dev : core->dev;

[Severity: High]
Is core->fw_dev initialized anywhere before this point? It appears to be
allocated as part of struct iris_core using devm_kzalloc(), but never
assigned a value in the driver, meaning it will always be NULL and this will
always fall back to core->dev.

>  	const struct firmware *firmware =3D NULL;
> -	struct device *dev =3D core->dev;
> +	struct qcom_pas_context	*ctx;
> +	struct iommu_domain *domain;
>  	struct resource res;
[ ... ]
> @@ -53,9 +65,23 @@ static int iris_load_fw_to_memory(struct iris_core *co=
re, const char *fw_name)
>  		goto err_release_fw;
>  	}
> =20
> -	ret =3D qcom_mdt_load(dev, firmware, fw_name,
> -			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
> +	core->pas_ctx->use_tzmem =3D !!core->fw_dev;

[Severity: High]
Since core->fw_dev is never initialized, will use_tzmem always be false,
causing the entire iommu_map() block below to become dead code?

> +	ret =3D qcom_mdt_pas_load(core->pas_ctx, firmware, fw_name, mem_virt, N=
ULL);
> +	if (ret)
> +		goto err_mem_unmap;
> +
> +	if (core->pas_ctx->use_tzmem) {
> +		domain =3D iommu_get_domain_for_dev(fw_dev);
> +		if (!domain) {
> +			ret =3D -ENODEV;
> +			goto err_mem_unmap;

[Severity: High]
If this error path is taken, will it leak the PAS metadata DMA allocation?
It seems the caller is required to free the metadata allocated by
qcom_mdt_pas_load() using qcom_pas_metadata_release(), but this call
is omitted during cleanup and error handling.

> +		}
> +
> +		ret =3D iommu_map(domain, IRIS_FW_START_ADDR, mem_phys, res_size,
> +				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
> +	}
> =20
> +err_mem_unmap:
>  	memunmap(mem_virt);
>  err_release_fw:
>  	release_firmware(firmware);
> @@ -77,13 +115,13 @@ int iris_fw_load(struct iris_core *core)
>  	ret =3D iris_load_fw_to_memory(core, fwpath);
>  	if (ret) {
>  		dev_err(core->dev, "firmware download failed\n");
> -		return -ENOMEM;
> +		return ret;
>  	}
> =20
> -	ret =3D qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
> +	ret =3D qcom_pas_prepare_and_auth_reset(core->pas_ctx);
>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
> -		return ret;
> +		goto err_unmap;

[Severity: High]
Does this error path also need to call qcom_pas_metadata_release()? The
metadata does not appear to be released here or in the normal success path.

>  	}
> =20
>  	for (i =3D 0; i < core->iris_platform_data->tz_cp_config_data_size; i++=
) {
> @@ -94,20 +132,31 @@ int iris_fw_load(struct iris_core *core)
>  						     cp_config->cp_nonpixel_size);
>  		if (ret) {
>  			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret=
);
> -			qcom_scm_pas_shutdown(IRIS_PAS_ID);
> -			return ret;
> +			goto err_pas_shutdown;
>  		}
>  	}
> =20
> +	return 0;
> +
> +err_pas_shutdown:
> +	qcom_pas_shutdown(IRIS_PAS_ID);
> +err_unmap:
> +	iris_fw_iommu_unmap(core);
> +
>  	return ret;
>  }
> =20
>  int iris_fw_unload(struct iris_core *core)
>  {
> -	return qcom_scm_pas_shutdown(IRIS_PAS_ID);
> +	int ret;
> +
> +	ret =3D qcom_pas_shutdown(IRIS_PAS_ID);
> +	iris_fw_iommu_unmap(core);
> +
> +	return ret;
>  }

[Severity: High]
Does iris_fw_unload() also need to call qcom_pas_metadata_release()?
If the PAS metadata context is not released, won't it cause a memory leak
on every firmware load/unload cycle?


[Severity: High]
This is a pre-existing issue, but does iris_remove() need to cancel the
sys_error_handler delayed work before destroying resources?

If a hardware fatal error interrupt schedules the work, and the driver is
unbound before the delay expires, it looks like iris_remove() will destroy
the mutex and free the core struct without calling cancel_delayed_work_sync=
().
Could this lead to a use-after-free when the delayed work eventually execut=
es?

drivers/media/platform/qcom/iris/iris_probe.c:iris_remove() {
...
	iris_core_deinit(core);
	...
	iris_deinit_cb_devs(core);

	mutex_destroy(&core->lock);
}

drivers/media/platform/qcom/iris/iris_probe.c:iris_sys_error_handler() {
	struct iris_core *core =3D
			container_of(work, struct iris_core, sys_error_handler.work);

	iris_core_deinit(core);
	iris_core_init(core);
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-glymur-v9-=
0-8cf2cbe12a07@oss.qualcomm.com?part=3D6
