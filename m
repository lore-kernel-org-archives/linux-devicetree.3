Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50C8420868
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783470422; cv=none; b=ig+0qjkmQ1EkzgVJZf3MyAZcoOsqVeIx0HOE+kKgZtGZTzI+hni9kBWd2xVYG6IXC+1mC74QTZblBYcv7klL3iFCeajbGenNs7+V9nnjpnnLn87jXLMCKsIfjOlokoUy5VmqM2e7+Qffz7IgubwDhlwRXsZMOcc1UJRSorp+5cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783470422; c=relaxed/simple;
	bh=eAMIT+E2Ntoi/KKhcOeUh9jll9X9z9aRqMDvps2bVJA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gOlkVoamcHp9NjBs1kicXS8QbiADZL589zc5waatDV8DNbMgscnH1kJ/QT3R1so3T69uBxh2o74iFvzyINUZaago4QeQvpsf8EvGttb69kDwa+CoiGHc1Gt1JDr0MHnN+GZlS/8W3amBvm7Rl/j9s7B7E5CQF+TIwywPkwaxBJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJ0oTZ8p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJ0oTZ8p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CB41F000E9;
	Wed,  8 Jul 2026 00:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783470420;
	bh=/6zdsixgjkgf6RtHJG3ti5zug0G1Q7L3NcGybM9fWl0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hJ0oTZ8pE+3LnyR/WMK58D0E1KJTE+/ohcm70gQvSsbhxjZRRH0xQDTFOFko4V4b8
	 SSJaGSyi2/hMuZl2Yupe2YbCOg+M7KRPROyfndrNg5RVt0EsgeWWrpjUw7Furhflzx
	 mRXqVU0C/5gSfGB9oqzGgS/0+vnb98y5opO+kEMRZurawfjk4fu9WQKeICgdkybs8j
	 +bzpsvOwX84FoOua4OnF8xcFlpvQZ3QsWVAgKdm3JD6reThHgtHySYf4BCpraLZZJu
	 K+itIiQGLxe3c9Fp/KGd4hMFxQw3C8Q9hCMHYGk+RWDfjjf99HXCc2aHCfj2EmlKw1
	 /jkJvUw3CJ5dQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 6/6] media: qcom: camss: Drop legacy PHY
 descriptions from x1e
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-6-f8588da41f16@linaro.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-6-f8588da41f16@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 00:26:59 +0000
Message-Id: <20260708002700.17CB41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Missing `phy_exit()` cleanup on probe error paths results in PHY r=
esource leaks for non-legacy PHYs.

Pre-existing issues:
- [High] Potential out-of-bounds access in `camss_subdev_notifier_bound()` =
due to non-contiguous hardware IDs.
--

--- Patch [6]: [PATCH v12 6/6] media: qcom: camss: Drop legacy PHY descript=
ions from x1e ---
commit 77049628030f3bcd1557363f75216c90c62c80af
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

media: qcom: camss: Drop legacy PHY descriptions from x1e

x1e is the first CAMSS SoC to use the new PHY interface. This patch drops
the redundant legacy CSIPHY descriptions to enable the new interface.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 146fea438486f..f360b2c99bf89 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
[ ... ]
> @@ -5803,7 +5767,6 @@ static const struct camss_resources sm8650_resource=
s =3D {
>  static const struct camss_resources x1e80100_resources =3D {
>  	.version =3D CAMSS_X1E80100,
>  	.pd_name =3D "top",
> -	.legacy_phy =3D true,

[Severity: High]
Does dropping the legacy PHY interface introduce PHY resource leaks on probe
error paths?

If msm_csiphy_subdev_init() fails during camss_init_subdevices(), previously
initialized PHYs do not appear to be rolled back with phy_exit():

drivers/media/platform/qcom/camss/camss.c:camss_init_subdevices() {
...
			ret =3D msm_csiphy_subdev_init(camss, &camss->csiphy[i],
						     &res->csiphy_res[i],
						     res->csiphy_res[i].csiphy.id);
			if (ret < 0)
				return ret;
...
}

Additionally, if camss_probe() fails after camss_init_subdevices() (for
instance, in dma_set_mask_and_coherent()), the error path jumps to
err_genpd_cleanup, bypassing camss_unregister_entities() and permanently
leaking all initialized PHYs:

drivers/media/platform/qcom/camss/camss.c:camss_probe() {
...
	ret =3D dma_set_mask_and_coherent(dev, 0xffffffff);
	if (ret)
		goto err_genpd_cleanup;
...
}

Similarly, does camss_register_entities() fail to call phy_exit() for the
failed csiphy[i] and all subsequent PHYs, since the cleanup loop starts at
i - 1?

drivers/media/platform/qcom/camss/camss.c:camss_register_entities() {
...
err_reg_csiphy:
	for (i--; i >=3D 0; i--) {
		if (camss->csiphy[i].phy)
			msm_csiphy_unregister_entity(&camss->csiphy[i]);
	}
...
}


[Severity: High]
This is a pre-existing issue, but since x1e80100 defines non-contiguous PHY
IDs (0, 1, 2, and 4), does this cause an out-of-bounds access?

The csiphy_num is 4 for x1e80100, meaning the camss->csiphy array only has
4 elements. The endpoint port ID is parsed from the device tree and stored
in csd->interface.csiphy_id:

drivers/media/platform/qcom/camss/camss.c:camss_parse_endpoint_node() {
...
	csd->interface.csiphy_id =3D vep.base.port;
...
}

If the port number aligns with the physical hardware ID (e.g., port@4 for
CSIPHY4), will this use id =3D 4 to index the 4-element array in
camss_subdev_notifier_bound(), causing an out-of-bounds access?

drivers/media/platform/qcom/camss/camss.c:camss_subdev_notifier_bound() {
...
	u8 id =3D csd->interface.csiphy_id;
	struct csiphy_device *csiphy =3D &camss->csiphy[id];

	csiphy->cfg.csi2 =3D &csd->interface.csi2;
	subdev->host_priv =3D csiphy;
...
}

>  	.csiphy_res =3D csiphy_res_x1e80100,
>  	.tpg_res =3D tpg_res_x1e80100,
>  	.csid_res =3D csid_res_x1e80100,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org?part=3D6
