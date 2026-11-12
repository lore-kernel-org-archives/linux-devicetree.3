Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459014;
	b=UKdVj3jO6+ANWjf+08cWjvjV+WUNjlQ5DM8URc0aOumvivkqYQsutHn8eCppjPeTj32o
	 RXbicJZXsrU1YtVr8dnE4UnZrejiHnLWQla+P4jVBTYnqWwQNG4+Vg2HM/Vkgdb8N+Tr7
	 f1OVx/1imCcnHCn/NfKpwPxGq4TOwOA8worqC0nC/bE0Y/6WH38pgr1MC9AO3i6geWIEl
	 Ag9IDdXBi5ecTXDlRQFbTi/5GYZlZeKZf5Z+ocy/nDxYJhlQRwIhYljG1L8e/TP6oBH8p
	 z4cXc0v8WlqLGEHT9JCAq1+eHpY1b9lDJv9IMM+lJLN/Mpt1sj/fLyQImlsHXQi9rxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459014;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HIRt5B5nNQh55PESYhR+4DreZOkc2TtI2/Vumccg6fY=;
	b=tqz8XEEPs8bN50SNhBlYsNo9qwoAFszyDN8fwOL85YXo629XhM4xIEnEBGJSOashuVzf
	 Oro/bOwT3ZN7eKP2162gcg1VOnt0kd1yEwUVUTooJgZZHo7G+JKb49GnQnjmN1efPQ6Uv
	 45xjrWIV4vDnVLoWoQVGC7AtzkNLgAqRRcrAbdhoM3c0p+OQ990uBuvPz4nBhD6g6GpTo
	 h8Am8Jst2Y8Zip4+eEOyRk4E8jDqifWtRAkNiuRnbdslZQgQpYEWBRfoUhvxgE5TnbHgO
	 xI4IDTVRtKrVFzOMfKsRe1Y0M1GkgloZaovou318KIWA+KZPcQa+tA3MZN7iPNDqaWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hx323KDK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03A8606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hx323KDK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2554B1F00A05;
	Thu, 12 Nov 2026 04:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794459014;
	bh=HIRt5B5nNQh55PESYhR+4DreZOkc2TtI2/Vumccg6fY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hx323KDKyC0rBry7lHkbUg9FOHEoMFSkwXOno3MvjpeGC3Zo7HgL7ENg42+IaBN2B
	 2Edr7QfXrrIn2BeiNNfJ1JtfW510w4Rjv9zXM065SwhIswvfqx9S3uHfO3bQi7leeA
	 05iMocDihZdOqxcguhaGCSQagpA5zi4ExzInxk7muDsd3GDYgAIorc0Wyzbkl2kjc6
	 NMjGBM/Bcsogkj81rFKj7mHLVHCTfxIJWNGxQo20k+ENRe/sIF/CpxE8i/kFYYoJdc
	 wW39ZhcTCjjsy4WZjz6i7wX3b0vVUtP/MVq7yAvLSvLivL6mGPeeahaf3gHT2pE44L
	 AkNV8+95U9q8g==
Message-ID: <sashiko-outbox-210396@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] drm/msm: mdss: Add SM7250 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ishu Brar" <patches@brar.si>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-dpu-sm7250-v2-6-8e925a3a8a7d@brar.si>
References: <20261112-dpu-sm7250-v2-0-8e925a3a8a7d@brar.si>
 <20261112-dpu-sm7250-v2-6-8e925a3a8a7d@brar.si>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 04:50:13 +0000
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

commit d4f3819a63c8f3f76b2bc3a988c5686bff7ac892
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
>  	{ .compatible =3D "qcom,sm8150-mdss", .data =3D &data_76k8 },
>  	{ .compatible =3D "qcom,sm8250-mdss", .data =3D &data_76k8 },
>  	{ .compatible =3D "qcom,sm8350-mdss", .data =3D &data_74k },

[Severity: High]
Does qcom_ubwc_configs in drivers/soc/qcom/ubwc_config.c also need a
qcom,sm7250 entry?

Both mdss_probe() -> msm_mdss_init() and dpu_kms_hw_init() call
qcom_ubwc_config_get_data() and abort on error.  Because qcom_ubwc_configs
has no entry for qcom,sm7250, of_machine_get_match_data() returns NULL and
qcom_ubwc_config_get_data() fails with -EINVAL, preventing MDSS and DPU from
probing on SM7250.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-dpu-sm7250=
-v2-0-8e925a3a8a7d@brar.si?part=3D6
