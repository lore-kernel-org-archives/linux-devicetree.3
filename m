Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F393DA5B3
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176044; cv=none; b=uJzvcKmg7VkcDKvhnOYnvDrMTigvRBXJK5lB5PcxgkPo7+E38wzN1B2THIOa6pHHgubrd0OQmc9uShk5+EBtvyazG/ukoo9qr9IkcmKl1ZW957j6oDXbEsjHaTdKyoHq8AaNrfflaJKlIEPWdVnIgOHgWDr5C/SaPoG6dQdYP30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176044; c=relaxed/simple;
	bh=3DTiN8WLxAI7jEcU0DMmzkseLKAryypmV7z6A+MVvHE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mqWL9R8nMgmx2veHHAm0plc76c8eUyB5MVmidVTG5rJuGaRi+0ZtTTKntDVoAfhjKHpPtvpyiDa0lOWXvt2EU/cVDXohvwyGpuKCroW7NA/ZyffJuTS8HFH4082zXHJyaMPaYtsYlaPQ4P1oG+LOjA2Ai+M0zLuDpwTi9IPY198=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWs/CO+f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWs/CO+f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC07AC2BCF5;
	Tue, 19 May 2026 07:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176043;
	bh=3DTiN8WLxAI7jEcU0DMmzkseLKAryypmV7z6A+MVvHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=VWs/CO+faKLFqjXuTpUW8LwZ5AfrCLPVhNsrfHpP5eC40/RP3KyvuiFNgwDXvFuY8
	 oquk8APJTMXoB++eZzLRy7pghtCdWPHzu1fjKr3pnmgsuKeHnwCR53Sw7E3ZqJ5jHW
	 xrRmHHXcRFIkg1ZfjNnqXPR+97QXT0pbI95cYD3R+uRNt/gYAbMoQNziB5wcRe/HMC
	 U+noOPqgjYAa+uOd9hvsbbAHGF1+gy0lN0gkC/J7Un10B7eFGtTVDqA5/L9t8Dr4qr
	 8Ly2auSkCOmotXH0ewM3rtIutFWun/x9msmeON+FK4R0pO6nDPblE1f6hCcy0gvAeB
	 0dFiQglqb+m3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/16] drm/msm: Switch to generic PAS TZ APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260518072856.22790-11-sumit.garg@kernel.org>
References: <20260518072856.22790-11-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:34:03 +0000
Message-Id: <20260519073403.AC07AC2BCF5@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Infinite probe deferral on devices that do not support PAS.
- [High] Time-of-Check to Time-of-Use (TOCTOU) race leading to NULL pointer=
 dereference or Use-After-Free.
--

commit 168f850440ba0271d11e8bfd4d88f6adbd042e93
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>

drm/msm: Switch to generic PAS TZ APIs

This commit switches the drm/msm client drivers to use the generic PAS TZ
APIs instead of the SCM-specific ones. This allows the driver to support
multiple TrustZone implementation backends.

> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 66f80f2d12f95..6d68edf0578c2 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -146,10 +147,10 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu,=
 const char *fwname,
>  		goto out;
> =20
>  	/* Send the image to the secure world */
> -	ret =3D qcom_scm_pas_auth_and_reset(pasid);
> +	ret =3D qcom_pas_auth_and_reset(pasid);

Could this introduce a race condition if the PAS backend is unbound
concurrently?

Looking at the new generic PAS APIs, they do not appear to protect the back=
end
operations pointer:

drivers/firmware/qcom/qcom_pas.c:qcom_pas_auth_and_reset() {
	if (!ops_ptr)
		return -ENODEV;

	return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
}

If a dynamic backend like qcom_pas_tee is unbound via sysfs between the che=
ck
and the dereference, ops_ptr could become NULL, leading to a NULL pointer
dereference.=20

Is there a mechanism preventing this race when switching from the SCM backe=
nd
to the generic PAS API?

[ ... ]

> @@ -175,9 +176,9 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 p=
asid)
>  	if (!zap_available)
>  		return -ENODEV;
> =20
> -	/* We need SCM to be able to load the firmware */
> -	if (!qcom_scm_is_available()) {
> -		DRM_DEV_ERROR(&pdev->dev, "SCM is not available\n");
> +	/* We need PAS to be able to load the firmware */
> +	if (!qcom_pas_is_available()) {
> +		DRM_DEV_ERROR(&pdev->dev, "Qcom PAS is not available\n");
>  		return -EPROBE_DEFER;
>  	}

Will this cause an infinite probe deferral on platforms that do not support
PAS hardware?

The SCM backend skips registering PAS ops if the hardware lacks PAS support.
If qcom_pas_is_available() is called on such a platform, it returns false
because no backend has registered.

Since this check happens before zap_shader_load_mdt() parses the device tree
to determine if a zap shader is actually needed (which is what updates the
zap_available flag), won't the GPU probe indefinitely defer instead of
failing gracefully?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518072856.2279=
0-1-sumit.garg@kernel.org?part=3D10
