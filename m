Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1994A2931CD
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 06:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785046126; cv=none; b=ZMz9ETIB78nnWs4QDy/VOr/PtZRGiidLUNbPWSgMxb1aa1cEfsBNGgiMFSEGilPPszkQgXyFtYS03U0elfQMpEfgTTnIm/RysFGWdOJCysr7m5WUZJKMPuTczwuz1zMGv9xCVlZ0YyITAzVnIMWo4Xb8pHWS8me3K9PBxxy8cgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785046126; c=relaxed/simple;
	bh=WfxMVRmcA+0ACYodQY5Umk6BLjIMFJr1em3TFkK+dbk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jyCJX/T7D8umIyEaQKoyR3mZRhH0Kxvtq+nom/A2bUHtKgwxJeJV1Q+UYaNFwS8F/pIS+dskhBQLjMScRMp/PMSLbz9/OuEZ946/A5gM6HbRYrdNPqv2U27p3yV4Te1umNTRk5Mut2yd2tZ7cK8DJ2/KlNHnnpazrLLdgTDASwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqksEnb1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqksEnb1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A711F000E9;
	Sun, 26 Jul 2026 06:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785046124;
	bh=iWkEZZc3G+8NrtWli7DHXiiCpZB9r91KyquHDr/KTuQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gqksEnb13ikijxgPxGSkECfauZPkRR4j6PQcbOykX9vfBAiE4xcXBTrviwxxRNB5J
	 kzo4RqL+o35RqB7l8MFNFBTN2jl4Zwbw9QheTtHqwg/KId0ON8WGSY5KrhD0CLYSPY
	 hmA4Uhq939oFs0g59enkDt/ZtmWtBm3+XaTmx10W7Ni7ueyMX/eCz/fh8Xes9C0PH+
	 MDioV/PjN6pXs6p2R71q1PBGlJ42Tuao4/DDrHm7UMfSesy3NmsKlwzdlzEvTMLKe7
	 LFKkSHOPk/ZTkaCo61I5b0NWmcm9IxXoEqJDTtYDtBkapDgkjhuHkDtkf9lIOd3rO9
	 GGuNwZhLX9LFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 06/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Reddy" <busanna.reddy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260726-glymur-v10-6-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-6-de451559e88b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 06:08:43 +0000
Message-Id: <20260726060844.53A711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incomplete Implementation / Dead Code: `core->fw_dev` is never ass=
igned, rendering the direct IOMMU mapping feature entirely dead code.
- [Medium] Potential NULL pointer dereference of `core->pas_ctx` in `iris_f=
w_iommu_unmap` during asynchronous error cleanup.
--

--- Patch [6]: [PATCH v10 06/14] media: iris: Enable Secure PAS support wit=
h IOMMU managed by Linux ---
commit 4079c73feb157bb490aaa33ca1d6e4970df1c4f7
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

media: iris: Enable Secure PAS support with IOMMU managed by Linux

On platforms without a hypervisor, Linux handles the SMC mapping and brings=
 up
the co-processor directly. This patch adds support to the Iris driver to
manage the firmware context device and IOMMU mapping directly when the
firmware device SID is present.

Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@=
oss.qualcomm.com/

> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media=
/platform/qcom/iris/iris_core.h
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -85,6 +87,8 @@ struct iris_core {
>  	struct device				*dev;
>  	struct device				*np_dev;
>  	struct device				*p_dev;
> +	struct device				*fw_dev;
> +	struct qcom_pas_context			*pas_ctx;
>  	void __iomem				*reg_base;

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/m=
edia/platform/qcom/iris/iris_firmware.c
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c

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
Is core->fw_dev ever assigned a value in the driver?

It appears to be declared in struct iris_core, which is zero-initialized,
but I don't see any logic populating it anywhere in the codebase. Because it
remains NULL, !!core->fw_dev will always be false. Does this unintentionally
make the subsequent direct IOMMU mapping logic unreachable dead code?

> +	ret =3D qcom_mdt_pas_load(core->pas_ctx, firmware, fw_name, mem_virt, N=
ULL);
> +	if (ret)
> +		goto err_mem_unmap;
> +
> +	if (core->pas_ctx->use_tzmem) {
> +		domain =3D iommu_get_domain_for_dev(fw_dev);

[ ... ]

> +static void iris_fw_iommu_unmap(struct iris_core *core)
> +{
> +	struct iommu_domain *domain;
> +
> +	if (!core->fw_dev)
> +		return;
> +
> +	domain =3D iommu_get_domain_for_dev(core->fw_dev);
> +	if (domain)
> +		iommu_unmap(domain, IRIS_FW_START_ADDR, core->pas_ctx->mem_size);

[Severity: Medium]
Could this lead to a NULL pointer dereference on core->pas_ctx if
core->fw_dev is properly initialized in the future?

If an early failure occurs during iris_load_fw_to_memory (for instance, if
of_reserved_mem_region_to_resource fails), core->pas_ctx is never allocated.
If a hardware watchdog or spurious interrupt fires concurrently,
iris_hfi_isr_handler could overwrite the state to IRIS_CORE_ERROR and
schedule iris_sys_error_handler. The error handler calls iris_core_deinit()
followed by iris_fw_unload(), which invokes this function.

Should there be a check to ensure core->pas_ctx is non-NULL before
accessing core->pas_ctx->mem_size?

> +}
> +
>  int iris_fw_load(struct iris_core *core)
>  {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-glymur-v10=
-0-de451559e88b@oss.qualcomm.com?part=3D6
