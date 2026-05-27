Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1A23E51CB
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877402; cv=none; b=NC2dSkMbP1ArQFANvndIJMJpa1yudwVwLGOFABt0FQexZ4X8bJQDIsZRYmIn5T43PZJHmEeG1jUF4XRZgBWn6PWOs330rLfNDZVB+LzRD5R876anj0ELcx1KYiVBrgXmoPgwRaz3E/dw/fv0GmEDPyuprkv0Vm0AbqdM4fhGvAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877402; c=relaxed/simple;
	bh=q3Vh5UMB++6tZWrpCSjc14jS9zHx4tG6riFkQy7YMSU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AqAaeu9Ou5UWDL8zTGhhrpisI66H6p5xnANL6BR4S26jjJupVOpUvy5PdoD9jex1VFfDayYAaZQnowGIy5ZS2SGVXiJXGmTuv3Kkw7iitcqoSSLlKRJRZzOtBV1upWHYR1VFNfhMLezSbjs2As9fExdni9d5h+dguwRnVsi3xQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JSUcisVF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JSUcisVF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110801F000E9;
	Wed, 27 May 2026 10:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779877400;
	bh=7omHX5oiHNPicRgf1iPC/ccW84DgJ8zev+LP/EDOHAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JSUcisVF8Q0SsxJ6HV4gdqMIF4KgOfTjtd5EojLsKq3i9hAk8bt1dZfO01kHJk63U
	 /MMNAF/NqXlfhu8hqIfg+YmLZwcsHvrSKM51ubzjkL77gyrGBSmI+Uz2nqSO69Yh0v
	 bxHw2vRNG8Hr77+KTza+RA6TmVf5PX7/ktaKbE9aVwBaS1iZ++tshd2S/NaDaLFZNg
	 gJqSE/MkDkiXRDN49xb++F/8lX6+wqVckGDlTUAa9qpeAehAceDE5iMfuATt1BAiUl
	 6DKwqr0sCBPSiUUiefBfVZ2UYizRgNS66DOyGDzprv52804znZllvS36wB1QR1ribC
	 wVjeEKAjoJvlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/24] arm64: dts: qcom: sm8350: Reduce OS PDC DRV
 span to 0x10000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260527094333.2311731-11-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-11-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:23:19 +0000
Message-Id: <20260527102320.110801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reducing the PDC register size to 0x10000 in the device tree tri=
ggers a spurious boot warning because the irq-qcom-pdc driver hardcodes a m=
inimum size expectation of 0x30000.
--

commit 05076204b4916b97559866917e2826b903983008
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: sm8350: Reduce OS PDC DRV span to 0x10000

The commit reduces the size of the first reg entry for the OS PDC DRV regis=
ter
window on sm8350 from 0x30000 to 0x10000 bytes.

> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/q=
com/sm8350.dtsi
> index c830953156ec6..ca235ce899c92 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -3174,7 +3174,7 @@ dispcc: clock-controller@af00000 {
> =20
>  		pdc: interrupt-controller@b220000 {
>  			compatible =3D "qcom,sm8350-pdc", "qcom,pdc";
> -			reg =3D <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
> +			reg =3D <0 0x0b220000 0 0x10000>, <0 0x17c000f0 0 0x60>;

[Severity: Medium]
Will this change trigger a spurious boot warning in the driver?

Looking at drivers/irqchip/qcom-pdc.c, the driver calculates the resource
size using a hardcoded QCOM_PDC_SIZE of 0x30000:

    res_size =3D max_t(resource_size_t, resource_size(&res), QCOM_PDC_SIZE);
    if (res_size > resource_size(&res))
        pr_warn("%pOF: invalid reg size, please fix DT\n", node);

Since this patch reduces the device tree reg size to 0x10000, it appears
this condition will evaluate to true and print a warning on every boot,
even though the driver overrides the map size anyway.

Does the driver need to be updated alongside this device tree change to
avoid polluting dmesg?

>  			qcom,pdc-ranges =3D <0 480 40>, <40 140 14>, <54 263 1>,   <55 306 4>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527094333.2311=
731-1-mukesh.ojha@oss.qualcomm.com?part=3D10
