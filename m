Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F03420868
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469930; cv=none; b=h98A4xQ9/usm/w8mXZypyEx3sGuiS69gcjI7/K/httODv8B2jDkUlKngDRFXTOap7koekimpi4/d217HyPwg3uAFGO9mvpjVRPX6PGiTX76MjFVtwZpQ2gFf0v1XPkVap63e5tA/OlVR9bPnt8cC6ArBz6zyC3413JRkev244iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469930; c=relaxed/simple;
	bh=rtT4GcUTZqTridNaBhzivMR6eJrSB4EryzKX30Cf0Ok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XtC6V2QKdmm29eygVTR1Y8U9jxwgs7mITlq8unbcd1rSWkKE3ge705OofZ5H1M5Gn40uqkQ411yKJ6Z95T2La1I1Y/iEth5yGClcQ579VDVvnc0kBNABf78zgE3PMfLfVQhYkK9IYxxQSoeuE0vIaJA0Ztk7uJr8f8RYpyt1dz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wzls0WY0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wzls0WY0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5EC1F000E9;
	Wed,  8 Jul 2026 00:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783469929;
	bh=HV9U0gExOXAmK2TgAcDKzxqx7sBtGfKa6WHuJM7SRNs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wzls0WY0L/UecHN7rjqjX+5b0GbCGl6TL9LD5HfapuAkVadglphQKFEjPmA2PRURA
	 CGiqgmon8a+UEx+W9rJi+QUU3lb30zWx2wLy2T2Lliehto1Ll1ljNozFOqKCJRDnlm
	 8ZCbdpVGFQMm1CnfTiYKcfEQcGjZAk/TOT4nNWfsGV1IaKUQo1n/T8a/feuOQPqHPl
	 qAecqoEInGwyWx+3t1qEJBc/ISf2AClleuYvPMwQuOtt8sHkNd388stdGL5u73SNZM
	 Og+TssMrPihAHVBXizW7rJSYgcc7/DnZv9q2m4qmL86JyKYwk7MOmIq8zvZQ//D3F9
	 x7eISR/m5N/ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 3/6] media: qcom: camss: Add support to populate
 sub-devices
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-3-f8588da41f16@linaro.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-3-f8588da41f16@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 00:18:48 +0000
Message-Id: <20260708001848.DE5EC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The return value of `devm_of_platform_populate()` is ignored, le=
ading to silent initialization failures and potential permanent resource le=
aks.

Pre-existing issues:
- [High] Missing NULL check for the result of `of_device_get_match_data()` =
leads to a potential NULL pointer dereference.
--

--- Patch [3]: [PATCH v12 3/6] media: qcom: camss: Add support to populate =
sub-devices ---
commit 187ecc190c79a7e3479de2344bee652ac9f2b71f
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

media: qcom: camss: Add support to populate sub-devices

This commit updates the Qualcomm Camera Subsystem (CAMSS) probe function
to use devm_of_platform_populate() for populating sub-devices in the tree.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7..95e655a8b6aa0 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
[ ... ]
> @@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pdev)
>  	if (!camss)
>  		return -ENOMEM;
> =20
> +	devm_of_platform_populate(dev);

[Severity: Medium]
Should the return value of devm_of_platform_populate() be checked here?

When this function fails, it returns a negative error code and the devres
framework frees the associated devres action rather than attaching it to the
parent device.

If the population fails midway, could this leave successfully created child
devices dangling, resulting in a permanent resource leak upon device unbind?

> +
>  	camss->res =3D of_device_get_match_data(dev);

[Severity: High]
This is a pre-existing issue, but is it possible for
of_device_get_match_data() to return NULL here?

If the driver is bound via sysfs to a platform device that lacks an OF node
(for instance, one manually created and bound by root),
of_device_get_match_data() will return NULL.

Would this lead to a NULL pointer dereference shortly after this line when
accessing camss->res->csiphy_num during the csiphy allocation?

> =20
>  	atomic_set(&camss->ref_count, 0);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org?part=3D3
