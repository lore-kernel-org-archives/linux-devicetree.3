Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72718CA5A
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469687; cv=none; b=No0vN50I9YVEJuQ6svwiep0VLZcWFLnYCmT1OMrDU85/CeBtX5h83F1zItzSSO+ocpuiQfvhoEzp9fH+2+Ty2Z4hDyqxwGXSLhtFqq1UEWh1iJ2kc+Qg1wdpzthnxzv1P7cr6h+8p5HhkDMOiKq8ExrvnV6uGzdzoONJqCzoujI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469687; c=relaxed/simple;
	bh=Ytb9iq+3wtBF/a29nrlxJILn3VNkZ52RknKnX0NSoUc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PExrOAosefhvkBI0gYbXFWzPEb/e9U62qKparJ9R02M9t+2YaDx2zzSp/NpRGcRBRmz2p3CxeEDxGUclaRiSClYb/WqicyjPEL7DZ1rfSkl2iwn/HKiJaD2vUfKkqacbInll0QOZUZrqKK6OjxzoxOR8jOx6jzdLKDfqeUqUrIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCapi/Ig; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCapi/Ig"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E5E1F000E9;
	Wed,  8 Jul 2026 00:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783469686;
	bh=y5gacFk35+hsbJciyvoLDije0RWBRjCB8cSYL7lzSFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jCapi/IgwaAClE6mGQo6KXVxxfEhxq6Veg6jiprFhtBDP0+jM/N4wpLk051bDRX2E
	 0Gp+ltecUn+ZEmd0fxg8sF5RWol6k4D+HBvcdErdQcP8Pqr2sayUsSMTnaAudhoaGk
	 VcDBC341qoA0novTzRVHDoR4YOn7/TWHa2W8bSByQkbXOcKs9Tdmn3JRFy+vws+nY9
	 wwKkbJ8FZkjTBVkGGfCq8vaVhzqz73E62Pwc3dvYe59cbcLh0+jzUvKxUCVy45D2J3
	 1tpglpsV1qAJwkbNcdztcRV+yGpugu9xat97B2cfIRCLZSgcGGhChnHLoPuLoZJP1P
	 +DEtEQX0Z37kw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 4/6] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-4-f8588da41f16@linaro.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-4-f8588da41f16@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 00:14:45 +0000
Message-Id: <20260708001445.B4E5E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `.legacy_phy =3D true` flag initialization for the `sm63=
50_resources` SoC definition.
--

--- Patch [4]: [PATCH v12 4/6] media: qcom: camss: Add legacy_phy flag to S=
oC definition structures ---
commit 909874316ccb4262ad4b5121de9b3eda2618f46a
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

media: qcom: camss: Add legacy_phy flag to SoC definition structures

This commit adds a legacy_phy flag to various SoC definition structures
to indicate which SoCs have builtin PHY code. This flag is intended to
inform PHY bringup logic in subsequent patches if legacy bindings are
available.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 95e655a8b6aa0..e814a96953b1b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
[ ... ]
> @@ -5661,6 +5672,7 @@ static const struct camss_resources sm6350_resource=
s =3D {

[Severity: Medium]
Did we miss setting .legacy_phy =3D true for sm6350_resources?

Looking at the other SoC definitions in camss.c, they all receive the
.legacy_phy =3D true flag, but it appears sm6350_resources was skipped:

static const struct camss_resources sm6350_resources =3D {
	.version =3D CAMSS_6350,
	.pd_name =3D "top",
	.csiphy_res =3D csiphy_res_sm6350,
	.csid_res =3D csid_res_sm6350,
        ...
};

Will this cause SM6350 to incorrectly fall into the non-legacy path when
the PHY bringup logic is updated to rely on this flag?

>  static const struct camss_resources sm8250_resources =3D {
>  	.version =3D CAMSS_8250,
>  	.pd_name =3D "top",
> +	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_8250,
>  	.csid_res =3D csid_res_8250,
>  	.vfe_res =3D vfe_res_8250,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org?part=3D4
