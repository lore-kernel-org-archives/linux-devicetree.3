Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794550651;
	b=mKgrMkWHYmX87lv5mi2BqXdjojnpu4VRr+eHQucQwq1qQWL92AnaSRcyfLvqFcpmOEHD
	 FTL8Hviv6K1Dwt+HWx5suDXk5CTuwe8UP1YN/fdM1sU2n4g0HoQ21aIEtC3ZGgoCAYJHY
	 FA/nRKepQA8E0asDlGNXDxL0tOhw7T/k0IJZAUA0loNeYagcIKEV6TxOAaeVSsTWioK9I
	 aTNUU1URs02+3G6DrFDknSwUNS/rhakjuSclpsBhNsu35kQTQffBdIWOeJ+K7ZFaOqnVU
	 oJhcyRI/S4EbfV3up4IsCfnF3CjoPK9M7UXRq1g2UBlpBZHj5a0sigTv1cyIYUlTr4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794550651;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gF+Q7Ui34Qq0VtY7TAD0rthakFzomrYF9aXVXa/KptI=;
	b=O8xmlLPp0FbkR0XP/hKN72e+/zHBeD6VJTOkdDsVtpRcFWyk3ZqHsv6pXJFzzy8ppcme
	 UoxRBnC4ZTOJw9/LRjB1AaX+rkpP5U4XOpspk/McmS/FjOwduqWYuYP0spwGNLnVaXPBm
	 9u0YMDSebyQ3HepRpSSX1FLUzgYJl+S+sEBJqmF16oan4+u9GI+kXPX45eVvRO7DzYEiL
	 YRMgBfrtoZkSpOcT5l0rQ2cqp3HbRRqE67e+qqRTKFjEuegpRLr0o/1QVkHKPL7o/BGjD
	 1yzbGJKsZTp7moLHoLpIbQOj0Bj2UrIM+rElr9C2JU54TqC8JO5RCRx1nnWVJ2hFfbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KW8qug2p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D548606A321
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KW8qug2p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A224F1F000C5;
	Fri, 13 Nov 2026 06:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794550650;
	bh=gF+Q7Ui34Qq0VtY7TAD0rthakFzomrYF9aXVXa/KptI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KW8qug2pSfjcML1x8AqLbCYQvGh80Grc8+MAhccLo5MLpofernvyDhvxHcTENFshP
	 vqh3ig3rhnyxnlombdYWNwknJuR8plgi1mAm2ftyNM4oJfgw6IuLb2PX011BKHncPD
	 7PMSf1RvX1R0mB3EPPZVKvxaFqGbfgOA0OSuUJnRE0wjWdvhTuXVk/u6K0Edp6xEgb
	 uAg1jHydhHP+IkhTUPuD0j79ZEZpqN5xUfqDUWSLXnUTafy9ryorfdn/9TVqNSR8uT
	 AQCMErLEcu1FUQJ4D8/WnEWKncRDQa6UEUHvJLq8rF9G3wRATbJdaWIt/8nEkb6xAq
	 yUGyeGuJX1DOA==
Message-ID: <sashiko-outbox-212272@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/6] drm/msm: mdss: Add SM7250 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ishu Brar" <patches@brar.si>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-dpu-sm7250-v3-6-30bdec59d204@brar.si>
References: <20261113-dpu-sm7250-v3-0-30bdec59d204@brar.si>
 <20261113-dpu-sm7250-v3-6-30bdec59d204@brar.si>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 06:17:23 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/msm: mdss: missing qcom,sm7250 UBWC config breaks
  msm_mdss_init()
--

commit 9c80774ba784ea5c8dce29db13d653c875106e5d
Author: Ishu Brar <patches@brar.si>

drm/msm: mdss: Add SM7250 support

This commit adds the qcom,sm7250-mdss compatible entry to mdss_dt_match.

> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mds=
s.c
> index 259d362475c81..8097e8f9144e4 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -563,6 +563,7 @@ static const struct of_device_id mdss_dt_match[] =3D {
>  	{ .compatible =3D "qcom,sm6350-mdss", .data =3D &data_76k8 },
>  	{ .compatible =3D "qcom,sm6375-mdss", .data =3D &data_76k8 },
>  	{ .compatible =3D "qcom,sm7150-mdss", .data =3D &data_76k8 },
> +	{ .compatible =3D "qcom,sm7250-mdss", .data =3D &data_76k8 },

[Severity: High]
Does qcom_ubwc_configs[] in drivers/soc/qcom/ubwc_config.c also need an
entry for "qcom,sm7250"?

Both msm_mdss_init() (called from mdss_probe()) and dpu_kms_hw_init() call
qcom_ubwc_config_get_data() and fail when it returns an error.  Because
qcom_ubwc_configs[] has no "qcom,sm7250" match, qcom_ubwc_config_get_data()
returns ERR_PTR(-EINVAL), so MDSS and DPU probe on SM7250 will always fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-dpu-sm7250=
-v3-0-30bdec59d204@brar.si?part=3D6
