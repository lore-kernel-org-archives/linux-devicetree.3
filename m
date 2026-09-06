Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9A62405EB
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 00:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788655797; cv=none; b=tNG8xItIdQCx4LzDfqyYIzMC4tFGfxnY6jn52MAxrsrdFTe4tcSs4tgwHU1xUlrp+McabBuVy/bJxPhm60++zlJQu+UnTyawqTP4Ww3egReY+3fAXBT5AbVOyz8XzTRpjw8ZUKykU1OMJucU+IUAsNjTZJWyuv9LBBj/c7sehbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788655797; c=relaxed/simple;
	bh=Gsgq184hapqbalj4fyT7PTXNgUIwUYr30xHdVr9FBRI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KBObHpy9CeZGAOXaExrCn++cXT9epznYzhnkhN3pwRjaqwqKDD8Dd1vohY18ZOPp5ZCEfjhjFgmIc6dmdoBTURioGoQUGtVIS6Zr9vu5GTNZg4634U2RbMm1oWlo8VDXnAtuJQHpIor45ok9GrjoWKJPQ/EFxxJMntSRu47pK2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPIXl557; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPIXl557"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137D21F00A3A;
	Sun,  6 Sep 2026 00:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788655795;
	bh=1cQAbjOybQXV7cLozjnTek8Luyuizg0e1MGe29uEJmI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QPIXl557zkyjIEsTM6pAmE2No/mfnYlHMURSyybUW8FpVDVL6FC7yzfozvw0qHKda
	 cnpBTHD+ve8kOK3U3wyABsr493VFF5AwHiWL47pxbOFspqdRNp0VAW3TBU749djguz
	 VV60w6ba9C6JJJrnWf2Brpoi8QA/Cub3Vpyi1ZxPtuufDn4l6j7FLqTMsjplLwIr0c
	 ESJ1ameVI36sO7uCFD9HgjK8CGOJ/iqKE0bD7x5oC83FHEERlMjslwsQoc6NTEMGnH
	 0rlINk/u032fifjvwQFhhj79y4WFRkFLgD8K2aGM6D9X8MofoqWwFmv0dJtvNIqiVm
	 K3/7S5tOk+hWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/4] soc: qcom: Add modemsmem for Google phones
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260906-modemsmem-v1-2-a3634b553841@ixit.cz>
References: <20260906-modemsmem-v1-0-a3634b553841@ixit.cz>
 <20260906-modemsmem-v1-2-a3634b553841@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 00:49:54 +0000
Message-Id: <20260906004955.137D21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Probe fails unconditionally if the SMEM item already exists, break=
ing module reload and pre-allocated items.
- [High] Newly allocated SMEM memory is not zeroed, exposing uninitialized =
data to the modem firmware.
--

commit 7a67ae0180630b09d3437d4fa514d468a7075572
Author: Richard Acayan <mailingradian@gmail.com>

soc: qcom: Add modemsmem for Google phones

Modems on Google Pixel devices require extra information about the
SoC to be passed through a vendor-controlled Shared Memory (SMEM)
channel. This driver provides this information.

> diff --git a/drivers/soc/qcom/modemsmem.c b/drivers/soc/qcom/modemsmem.c
> index 0000000000000..7a733422ff7c1
> --- /dev/null
> +++ b/drivers/soc/qcom/modemsmem.c
[ ... ]
> +static int write_socinfo(struct modem_smem_info *target)
> +{
> +	struct socinfo *socinfo;
> +	u32 plat_ver;
> +
> +	socinfo =3D qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID, NULL=
);
> +	if (IS_ERR(socinfo))
> +		return PTR_ERR(socinfo);
> +
> +	/* hw_plat_subtype was added in socinfo format 0.6 */
> +	if (le32_to_cpu(socinfo->fmt) < SOCINFO_VERSION(0, 6))
> +		return -EOPNOTSUPP;
> +
> +	plat_ver =3D le32_to_cpu(socinfo->plat_ver);
> +
> +	target->version =3D cpu_to_le32(MODEM_SMEM_VERSION);
> +	target->major_id =3D cpu_to_le32(PLAT_VER_TO_MAJOR_ID(plat_ver));
> +	target->minor_id =3D cpu_to_le32(PLAT_VER_TO_MINOR_ID(plat_ver));
> +	target->platform =3D socinfo->hw_plat;
> +	target->subtype =3D socinfo->hw_plat_subtype;
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Does this code leave uninitialized fields in struct modem_smem_info exposed=
 to
the modem firmware?

When the SMEM item is freshly allocated by qcom_smem_alloc(), the memory is
not zeroed. This function assigns 5 of the 8 fields in struct modem_smem_in=
fo,
leaving modem_flag, efs_magic, and ftm_magic uninitialized.

Could this SRAM garbage cause undefined modem behavior or misconfiguration?
Follow-up patches in the series do not fix this regression.

> +
> +	return 0;
> +}
> +
> +static int modemsmem_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct modem_smem_info *info;
> +	u32 smem_id;
> +	int ret;
> +
> +	ret =3D of_property_read_u32(dev->of_node, "qcom,smem-id", &smem_id);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Could not read smem id\n");
> +
> +	ret =3D qcom_smem_alloc(QCOM_SMEM_HOST_ANY, smem_id, sizeof(*info));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Could not allocate modem smem\n");
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^

[Severity: High]
Will this logic fail the probe process if the SMEM item already exists?

qcom_smem_alloc() returns -EEXIST when the item has already been allocated =
by
an earlier boot stage or during a previous module load.

Treating any non-zero return as a fatal error prevents the driver from upda=
ting
a pre-allocated SMEM region. Follow-up patches in the series do not fix this
regression.

> +
> +	info =3D qcom_smem_get(QCOM_SMEM_HOST_ANY, smem_id, NULL);
> +	if (IS_ERR(info))
> +		return dev_err_probe(dev, PTR_ERR(info), "Could not get modem smem\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-modemsmem-=
v1-0-a3634b553841@ixit.cz?part=3D2
