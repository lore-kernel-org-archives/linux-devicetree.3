Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4099D3F0761
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877517; cv=none; b=MB5vAH8s57B+/SL2NHT12L3Y7C1AzNJ9szm6LagxH7SwJbeLe/aTHXJQOhhXMIE4FzQxfbnbcIno1uB0jnq1wyWfcI2PGIuTYmB1sw332KMlmfvCbsYQJIqhEnyPTzyBBjPpQIUBYbqkUc5v/DyXxBVwFfMjgXrrg7KRfue8JnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877517; c=relaxed/simple;
	bh=SA4lCskZpZsZDp+k2cfgMShDoO+ExdKk7TIWYtBnnbk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gj5oXt9EDice/wbCF1xzpsKRJBMUVgoq7uDlmyyxru4ph470Ki/1dQxge21DRFr3zyyE+UWCBU7NTPqq1J6oD1w/f4ZJYxROEEXYXVxlZKrtb1lL05iu6V0aBqXoWUGVTwurFbTvCSnSpKXsRQc2nbPPJ9MMco4388eWdLBIL6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMhOrXVF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMhOrXVF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6BE1F000E9;
	Wed, 27 May 2026 10:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779877516;
	bh=oUkJuVIvKBPAMvFZ9LcFrS3AjrJhzI/gC7c+PBuCh8Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fMhOrXVFApTBu+9/Y0IRmTSydvTrS7P3YG05e5IMLVDxQiB86FbiTzS2hIypbbxSL
	 dwHkRxFlc1q1m4tY7VMWPhAd+mSOjgeVJWdGO07JLTxJwzu+cco/cM2vFB4xTgMwXk
	 MeCEHRXkG9IdcajBMpvQPXYcaiMrXR10kdm7m5GX7JWQNze73EPnFOKZND4dyuhSc1
	 Z4jcWqXTXkvb06cqElgPl8ExRRkrjr9D92waA14ERE4n1rFz0dKxgGoMIN1a/bJrQy
	 Y0yVweJwqJXH1I03NT8lesw9DAdKBb2UeSolaCrpUHHJqhvkJSuXOzGT6nlZnHD4tI
	 iW+epFTrAGvsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 22/24] arm64: dts: qcom: milos: Reduce OS PDC DRV
 span to 0x10000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260527094333.2311731-23-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-23-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:25:15 +0000
Message-Id: <20260527102515.EC6BE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reducing the PDC `reg` size to 0x10000 triggers a boot warning f=
rom the `qcom-pdc` driver and fails to reduce the actual mapped memory size.
--

commit bd9d32425fcdb7b1f806e074d8d4e1621656dc67
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: milos: Reduce OS PDC DRV span to 0x10000

This commit reduces the first reg entry size of the OS PDC DRV register
window on milos from 0x30000 to 0x10000 bytes.

> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qc=
om/milos.dtsi
> index 4a64a98a434b6..c2b25f0dec0cf 100644
> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> @@ -1948,7 +1948,7 @@ dispcc: clock-controller@af00000 {
> =20
>  		pdc: interrupt-controller@b220000 {
>  			compatible =3D "qcom,milos-pdc", "qcom,pdc";
> -			reg =3D <0x0 0x0b220000 0x0 0x30000>,
> +			reg =3D <0x0 0x0b220000 0x0 0x10000>,

[Severity: Medium]
Does this change trigger a warning in the pdc driver during boot?

Looking at drivers/irqchip/qcom-pdc.c, the driver hardcodes a minimum
mapping size:

#define QCOM_PDC_SIZE 0x30000

And in qcom_pdc_probe(), it forces the mapping to be at least that size:

    res_size =3D max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);
    if (res_size > resource_size(&res))
            pr_warn("%pOF: invalid reg size, please fix DT\n", node);

Since the driver expands the mapping back to 0x30000 and prints this
warning when the devicetree size is smaller, it seems this patch will
pollute the kernel log without actually reducing the mapped memory region.

Should the qcom-pdc driver be updated to support the smaller size before
or alongside this devicetree change?

>  			      <0x0 0x174000f0 0x0 0x64>;
>  			interrupt-parent =3D <&intc>;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527094333.2311=
731-1-mukesh.ojha@oss.qualcomm.com?part=3D22
