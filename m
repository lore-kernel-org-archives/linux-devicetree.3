Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459245;
	b=RWujo8AXJSsNQt03KXZ4bwQa7zMoi3eQ3drWIqzW35LUOnGTl2/CUL/jaefZo9AtoDo7
	 Pyh5wvHrFsJwIOJNNlgMukmnBx1BgM5QKd566m4ue2cLE6Jm4uJwvULhsIv9VnUeHWZlI
	 G//OErPpOlHlp+zVXFu1YqXbJbsTVVwX31yC7RWvAMBAIoWpES3jpRplune5d09fQ4nJi
	 e5p1muM38UI/Fi0/EsNedBSYIyfPLbndeLYI/oZu5SWCqDHnFSmCbHwrGgKj9aFWdvy4e
	 nTVWGNP6SKCWmULfBdV18CUu8c2//0/0K6cc+G5Zs+k0s6P0lN/3w06ECdxcd3sIm9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459245;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5IvI3ny+Myq1O82n3c9+7DHtZFn1bWsneuTWZKLGf2g=;
	b=VZtb3iZ9yDC5WUIlT3U8fjMhNoPwObq6C3R9ctc9m0TiJ2IXR2XsE6KIQ/7od15AZOxX
	 exEFyPteD7CGEHyfBrjdULj0VqrSug95uE7E6hKNVNToNXd83fwgr6A1IQHe2QLm1fU9F
	 H5c/AGHQ5MIJ0IaVKPOmVdcr1GgbmMTDpdNsQkM+LA3qPxMn8IWIluhLD4Whnj47KiwWk
	 eDyny5QiI0RPWAugXtYE3LQWnzVU5NciGEcS1+E63KmrEDmyiLHh4NA9LLAQW64n+o22j
	 4mJ9q1LeChjHbU5+ENzU01XeYEbydC8ET+LcF2WLVUL/efCPtqDmFTuIGHVCxUlYq+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gY70MHX6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04B2606A893
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gY70MHX6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347F11F00A0D;
	Thu, 12 Nov 2026 04:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794459245;
	bh=5IvI3ny+Myq1O82n3c9+7DHtZFn1bWsneuTWZKLGf2g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gY70MHX6eSzBQ88RYGXHfUDaetTBtzBHxCFNqMF6nns8GHslDW8Z6PBAsKMCfs709
	 L5u+ZRskgPky7Lzww8MAEqm9YFOhuGjruR8xwRw9Se5xIqS4rSwRtxu8xaqC2T96vh
	 Jw/jMW2B81wBItwlSiV/I+YeMhRLmdWSir150qBN5wBG8Ttsdy/qCbdPQ5GVYgCqsV
	 HB5CqWS9g7unctRRSjdmz7DEF/yJYljpbJQ/IsH6pgcnmnui9bEvIsEQLn/ngs5Npj
	 nnYekf5H/r0/y/tQlhyw2a6N2vLrZRgvUBWbEsJ4ciCJ3DQNu6/fYOvStiuDp+elWJ
	 H4ef7Bk7S0qQQ==
Message-ID: <sashiko-outbox-210400@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] drm/msm/dpu: Add SM7250 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ishu Brar" <patches@brar.si>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-dpu-sm7250-v2-5-8e925a3a8a7d@brar.si>
References: <20261112-dpu-sm7250-v2-0-8e925a3a8a7d@brar.si>
 <20261112-dpu-sm7250-v2-5-8e925a3a8a7d@brar.si>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 04:54:04 +0000
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
- [High] drm/msm/dpu: missing qcom,sm7250 in qcom_ubwc_configs breaks
  probe
--

commit 028e2a72798ab5d56d8d81bb276fb38107826ea0
Author: Ishu Brar <patches@brar.si>

drm/msm/dpu: Add SM7250 support

This commit adds DPU 6.1 hardware catalog definitions and device tree match
data for the Qualcomm SM7250 platform.

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/ms=
m/disp/dpu1/dpu_kms.c
> index 1b6286dccfc00..908d401ec4020 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1506,6 +1506,7 @@ static const struct of_device_id dpu_dt_match[] =3D=
 {
>  	{ .compatible =3D "qcom,sm6350-dpu", .data =3D &dpu_sm6350_cfg, },
>  	{ .compatible =3D "qcom,sm6375-dpu", .data =3D &dpu_sm6375_cfg, },
>  	{ .compatible =3D "qcom,sm7150-dpu", .data =3D &dpu_sm7150_cfg, },
> +	{ .compatible =3D "qcom,sm7250-dpu", .data =3D &dpu_sm7250_cfg, },

[Severity: High]
Does qcom_ubwc_configs in drivers/soc/qcom/ubwc_config.c also need an entry
for "qcom,sm7250"?

During probe, msm_mdss_init() and dpu_kms_hw_init() call
qcom_ubwc_config_get_data(), which looks up the machine root compatible in
qcom_ubwc_configs via of_machine_get_match_data().  Without a matching
"qcom,sm7250" entry in qcom_ubwc_configs, qcom_ubwc_config_get_data()
returns ERR_PTR(-EINVAL) and display initialization on SM7250 fails.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-dpu-sm7250=
-v2-0-8e925a3a8a7d@brar.si?part=3D5
