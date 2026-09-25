Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17C52F28EA
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790316102; cv=none; b=LKrKBE4o5zzo7OaYsFjnbC93DoTiV7dwxGg6SIKRH/yIjfqWowAqcyV/6H3vnJeqMDIiHliTvUmUOq4SONfHZt7NbYXH8quL1SfZPWqgQJtWegYBwbXrnjkSH4ffCNhScKJ9aPUCDNPeAg6apv61nfM36Fs5IEpDeBp2PA9BpFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790316102; c=relaxed/simple;
	bh=qbVBBK/D0MtKem+q8mIlfDI+vqxESprv4PR4EbzlSLE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ndFWq8T0BwRHXzdnRD4/pDCRj3DVyCbVYAHimwwtlbeZqBJFKS4u1jtKglRMy6Ci3+lfyZV+LsW4VpGPFMBVi7RSNpfioHnSc/RZIaocdrz6XZ58aYdhrNQafBqQs6zPJY4XG3QNpONb/h8NXclFwxiOvLHd5MHRCpogk7s3AuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LATZXVZM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LATZXVZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154E21F000FF;
	Fri, 25 Sep 2026 06:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790316100;
	bh=QPXGKPr9hn/dwplM+tc+lJNLm6kQfonUAc4Ik1Qhd1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LATZXVZM9+hDHCKdiLIMIuijuJzJDq/eU0Ku0VFremiTBgDGJPXb6rBEaYrNa4ROx
	 FdeImP7by2JYO+5VJB02GHAqPoGkYWmY7ZL6BWzdj4+5KtmFgzPIsaSkdUqzZaXCPD
	 5xMs/96vzbF5L7lBE/rL4k6tWMw9QCYLZ8sQdWC11a+Vz1BAziETu/cATpcR1Xmvsl
	 gp7jWnnMS3napSyYMMa5oM4bE7tqhL1JSJ9s+Ezw92paRHFKRn9VQToF0EVvGgOXw1
	 Jh5HovZsrT2vUMwd71dZoQ0YtAmQot5t1k8NlPpP4Jd93g2UhC4lIOQvtTmwkaevij
	 XvTl2elsPUJJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add Glymur compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: conor+dt@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, media-ci@linuxtv.org, vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 06:01:39 +0000
Message-Id: <20260925060140.154E21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: qcom: camss: probe failure on Glymur due to hardcoded CSIPH=
Y resources
--

commit 739b00bed07b519e1dc22bfdfaf2147620cb9dde
Author: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

media: qcom: camss: Add Glymur compatible

This commit adds a new compatible string "qcom,glymur-camss" for the Glymur
platform. It maps this compatible to x1e80100_resources, since Glymur's
camera subsystem is a functional subset of X1E80100.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 23f3cc30a15a5..9954a99981004 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5751,6 +5751,7 @@ static const struct of_device_id camss_dt_match[] =
=3D {
>  	{ .compatible =3D "qcom,sm8550-camss", .data =3D &sm8550_resources },
>  	{ .compatible =3D "qcom,sm8650-camss", .data =3D &sm8650_resources },
>  	{ .compatible =3D "qcom,x1e80100-camss", .data =3D &x1e80100_resources =
},
> +	{ .compatible =3D "qcom,glymur-camss", .data =3D &x1e80100_resources },

[Severity: High]
Does this hardcoded resource mapping cause the probe to fail on Glymur hard=
ware?

The commit message notes that Glymur only has three CSIPHY instances,
while X1E80100 has four. Because x1e80100_resources specifies 4 CSIPHY
instances, camss_probe() -> camss_init_subdevices() will unconditionally
execute its initialization loop 4 times:

camss_init_subdevices() {
    ...
    for (i =3D 0; i < camss->res->csiphy_num; i++) {
        ret =3D msm_csiphy_subdev_init(camss, &camss->csiphy[i],
    ...
}

During the iteration for the missing instance, msm_csiphy_subdev_init() will
attempt to acquire memory and interrupt resources via
devm_platform_ioremap_resource_byname():

msm_csiphy_subdev_init() {
    ...
    csiphy->base =3D devm_platform_ioremap_resource_byname(pdev, res->reg[0=
]);
    if (IS_ERR(csiphy->base))
        return PTR_ERR(csiphy->base);
    ...
}

When this lookup fails on Glymur due to the missing "csiphy2" instance,
won't it propagate an -EINVAL error back to camss_probe(), causing the
entire driver initialization to abort?

>  	{ }
>  };
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-glymur_cam=
ss-v4-0-d7c2983d6d7b@oss.qualcomm.com?part=3D3
