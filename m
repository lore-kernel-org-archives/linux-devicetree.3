Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A023C14E2F2
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 01:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782176833; cv=none; b=chm7Wr/1OdDn8kTYJVPmhtrseyno4rC9kq/NYxlHjCfPLCOVHZd72GhL3eouYAHcWSNBmWIX3p4j6nHcKvOdtMcaY+kZ4nwtY0Rj3lYKZshUXHfbdgBCR9ZKwxa5zInmRk64/YaF+GUFsLy54lDIUI0Q2bIP46ScmB4UPHEcKr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782176833; c=relaxed/simple;
	bh=vn4ppfWWw7TdhAWJhWvK2nB2jjHpNQ85O1tXp5i5H18=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oBFqVQ2+kEBEiDll2PBwYKfKinp5H5f01pNWoVxQh05mV5t6ZYm410SqyovnWgdtT/bC1NhjPvHGsxDrF9Rxgjt+7vpM9oKEyh4gAoU1YAjPMLucT4bGgPwOs77dcv9Y963gmu+c0A5/7xzcwxbYUM12ICQt2fgyeJ3VszXRiG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4aQVrVh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4aQVrVh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8D11F000E9;
	Tue, 23 Jun 2026 01:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782176832;
	bh=PoFU25/WsYPg3E9ZVNWMJTwiMtZyLQjhQBzWIHmBejc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q4aQVrVhWvVMPpsqcCU9NWSR6K45h3yJoj1VYHXZjsQmAurXKqi8rDQN0Ix+AjGZU
	 t3xHWK5pP3bBW0amQ7UxMVDC5tqYeWqqjLdJ7rsn6FQ+WVK/BtIrLpGXuRBEeCuFCB
	 W4dFoHkSroX5cjzili6mht3Iu52uk77LTPH5im0Xqo26I7HRa82dPHmiO9jWszlNUG
	 3Do0oJP0y4rOELeCvriZYJGv3aqncKjfc0aRdvXs3C8irtMQb2gzTkm8z8yMWN8oxb
	 n5b6yO00SsJe7JBqgE9svT2EeVWlI4jHt4C/AS37hpxUIjet5Cp/ewXayrzFMfBfYU
	 LES3d1jEmvjeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/8] iommu/arm-smmu-qcom: Add SM8450 MDSS compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia via B4 Relay" <devnull+esteuwu.proton.me@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, conor+dt@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260622-sm8450-qol-v1-5-37e2ee8df9da@proton.me>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-5-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 01:07:11 +0000
Message-Id: <20260623010711.EC8D11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The SMMU client match table is missing several other modern Qualco=
mm MDSS compatibles (e.g., SM8350, SM8550, SM8650, SM8750, SM6125), causing=
 them to suffer from unhandled context faults and broken display functional=
ity.
--

commit d66a67918c0ac7790f3063bd520102cd893aafb7
Author: Esteban Urrutia <esteuwu@proton.me>

iommu/arm-smmu-qcom: Add SM8450 MDSS compatible

This commit adds the SM8450 MDSS compatible to the Qualcomm SMMU client=20
match table. This ensures the device is properly configured by the IOMMU=20
driver to prevent unhandled context faults on the Snapdragon 8 Gen 1.

> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index e2c914fccd6fc..795e8ec7e8faf 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -425,6 +425,7 @@ static const struct of_device_id qcom_smmu_client_of_=
match[] __maybe_unused =3D {
>  	{ .compatible =3D "qcom,sm6375-mdss" },
>  	{ .compatible =3D "qcom,sm8150-mdss" },
>  	{ .compatible =3D "qcom,sm8250-mdss" },
> +	{ .compatible =3D "qcom,sm8450-mdss" },

[Severity: High]
This is a pre-existing issue, but while we are adding the sm8450-mdss=20
compatible, should we also add other modern Qualcomm MDSS compatibles like=
=20
sm8350, sm8550, sm8650, sm8750, and sm6125?

It looks like those SoCs might also lack a fallback qcom,mdss compatible=20
and are currently missing from qcom_smmu_client_of_match.

If they are assigned a default DMA translation domain instead of the=20
required bypass identity domain, wouldn't the MDSS wrapper generate native=
=20
transactions that fail against the empty DMA domain, resulting in similar=20
unhandled context faults?

>  	{ .compatible =3D "qcom,x1e80100-mdss" },
>  	{ }
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622-sm8450-qol=
-v1-0-37e2ee8df9da@proton.me?part=3D5
