Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7A93E49F7
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 07:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444563; cv=none; b=cEsTl25U+bDiLDobuZqfMn9mRiQqCWMymTpuHVSKGFrxiNglh2Mvn9L6zGu9W1lIRUW5Ct3kP/vikkvh1zohL1/VFWIw0BIQ+kTcfFzmmDjYgsMZTuyvna35NVCMZ2CRRshZLxlRbjTf0y4DNoMiT+I2CynX60DlQpTViWh2R0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444563; c=relaxed/simple;
	bh=D6S8vUJ0cb95OQnRpxmXh4/hPp37KlroYFrYBnQADBs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=iePZBi0lbRhIuLFR2Lv32qI7+IPA4rW/Totp9lSYUPCV1hCnlPVU7gDkmtZe+oUBisRTQmEXpU7EouIgSBWHMPXaDi8X8mHzHrqNq9FY5QtS1mgLyo79zBLzsx3KmytNsLC+hKKY+GFmDhEPrAYOQ74yW8NFnnm6+NL3GkvXt4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/im5R9z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/im5R9z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1E31F000FF;
	Thu,  8 Oct 2026 07:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791444560;
	bh=LoqUM2YEELUiIvwftTXbSKEJZLI4BN3PEcn0ofvkAG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M/im5R9ziNMj+RNBML0MPGJUVLachc5d9EYt4aICKMKF3/1QrohcKViX2fddWQdUo
	 /R5OVw1RiL7SLptGYe2F9Siz9CJr9ZkWVXTOKT7IztrihDEM3aUc+KFhs2s3BlrbNd
	 7c98pLk2dlXzHyCZdwbAi1DU8ZbzwFEtF9kDsmdRkzNtRnH/+67LjiTNn8/CZp7yNE
	 FkNEOUtiKuXT/WR1Q24RO+BUE4d+dIdcH6V+Qg+okjRsUoOwf60RHIogjkI41UCsSk
	 IjGB6Ov3H0CjZZJdK2q/2UWZ6VLaQ/tggmWhxK9QKnubTl3S3mpq6q/vZhHJna+4W0
	 id0bbLE+Chwdw==
Message-ID: <sashiko-outbox-163759@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 05/12] media: qcom: camss: Add Kaanapali compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com, robh@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20261008-kaanapali-camss-v19-5-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-5-b2c583ef50e0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 07:29:19 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: qcom: camss: missing DT port bounds check in camss_parse_en=
dpoint_node()
--

commit 781d7cc1d1be2a0b64ef04982c38bd82fc6c1a5d
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

    media: qcom: camss: Add Kaanapali compatible
   =20
    Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driv=
er
    private data. The private data currently includes only basic informatio=
n.
    Later changes will add CSIPHY, TPG, CSID and VFE resources.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a9..fca3de214a922 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c

[ ... ]

> @@ -5576,6 +5590,13 @@ static void camss_remove(struct platform_device *p=
dev)
>  	camss_genpd_cleanup(camss);
>  }
> =20
> +static const struct camss_resources kaanapali_resources =3D {
> +	.version =3D CAMSS_KAANAPALI,
> +	.pd_name =3D "top",
> +	.icc_res =3D icc_res_kaanapali,
> +	.icc_path_num =3D ARRAY_SIZE(icc_res_kaanapali),
> +};
> +

[Severity: High]
Does this code allow an out-of-bounds array access if a malformed device tr=
ee
provides an excessively large port number?

The driver parses the port endpoint from the device tree in
camss_parse_endpoint_node() and stores it without bounds checking:

drivers/media/platform/qcom/camss/camss.c:camss_parse_endpoint_node() {
	...
	csd->interface.csiphy_id =3D vep.base.port;
	...
}

Then in camss_subdev_notifier_bound(), this unvalidated id is used to index
into the dynamically allocated camss->csiphy array:

drivers/media/platform/qcom/camss/camss.c:camss_subdev_notifier_bound() {
	...
	u8 id =3D csd->interface.csiphy_id;
	struct csiphy_device *csiphy =3D &camss->csiphy[id];
	...
}

Could this lead to memory corruption or a kernel panic if the port number
exceeds camss->res->csiphy_num?

While the specific zero-size pointer issue for Kaanapali is resolved by
follow-up patches setting csiphy_num, the missing bounds validation appears=
 to
remain a vulnerability for any invalid device tree.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-kaanapali-=
camss-v19-0-b2c583ef50e0@oss.qualcomm.com?part=3D5
