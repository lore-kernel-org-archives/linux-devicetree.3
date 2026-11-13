Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794550477;
	b=a/QhZqKUZPNTOwkvQYABy6BFzkXrX4Aa9efn1q1HaY3iS3AaB9H6gTdm2JFJ+vqhcJRA
	 1XZ3eQyV4eEBoKhputYwtIPa0Gf8YkiDQCD2g/Pf8ryle3tfvzz2RMoSKmhueZB8DcYeP
	 dXLP2EW3iQ6j3Ax+46Bj4xWA1HdrnHi7Z1JV+YIpwc9TZSIuXjVWM3uoB9tvqHCRHzHHI
	 nL4U6bjI71046CtigiO7Scjhp1AZDf651qMiCtvWOCoFdVtd3uQ/aXKtLKyR7EhldsrIV
	 74LiDK8bEB0496MZgceYFE1y1TsHsmvIUvBYkOZYUocpqa5xYqgc+mRqgkgGenOnkRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794550477;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Q44Rtdokva8R0o9T+p1SzXM0YgXSl9Xi9xwtccuxZJA=;
	b=i1bJN9ytfeNrLOLyNFUmsx48Mlir8i3bA1g2t0vM3eqL1cOCuinGV5Rd+VfCTMV47Jwq
	 kUwvjlGApIl7q2nFdnq6kDhxPqAf+MxFbxvylW0F/AQoG9651GkHFQohxJEf9YFcUDNbR
	 k8b3LHpPEqFhikn/UAERqEyjwrQQPD9/TsiJiR2+hbwxCpeLRNMMzhesxZGO4Q3fQRmZz
	 5PAEmN05ZKXfDXGN9V/y9rUXVRNvQmV7Z5oSJ61Kq2gGdxhfE3Mn5YaXGRZvxMgG0HGvm
	 wgwgFY22e9Vwbu1+nrTtpXn9Dujm5LoS+WgGpfd//DuxRlnkyhgyedOgZDVc3A+A72Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oPfHwZu3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E67D606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 06:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oPfHwZu3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BCB1F000C4;
	Fri, 13 Nov 2026 06:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794550476;
	bh=Q44Rtdokva8R0o9T+p1SzXM0YgXSl9Xi9xwtccuxZJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oPfHwZu3WhyklIPoRfy9QKdXrjbUsyuHNLjDsCbOplyA59Si26JhCasYXmr+pDrb1
	 eilIV2c8nBXac1QGqAslVltOfjlHoqfITMKvkuOtGabOsCGml8ObElWraIjgce7k5d
	 Iyif+WgXbiGroNFzg3K8os0V/KAY/pQawDttHFyueJKAr+19jl6z3d7SBk6HQaM1hJ
	 07pMDHE+eKeGRGhDW0Vgu9sV6C2KjYZG/XgsJmRtDjG/bbT6uS/EnuRU890UP/4EQV
	 ZS/Tqf3HFzLoKlODuLP2T7tIl0tYKwcnRJyEwwxB94exjuV5YLqNtMmG9nJDzIKzV8
	 a3yFSyVc/ndzQ==
Message-ID: <sashiko-outbox-212271@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] drm/msm/dpu: Add SM7250 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ishu Brar" <patches@brar.si>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-dpu-sm7250-v3-5-30bdec59d204@brar.si>
References: <20261113-dpu-sm7250-v3-0-30bdec59d204@brar.si>
 <20261113-dpu-sm7250-v3-5-30bdec59d204@brar.si>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 06:14:36 +0000
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

commit 59825eaff1e766d3f8d177a85a687c71ae26eb1b
Author: Ishu Brar <patches@brar.si>

drm/msm/dpu: Add SM7250 support

This commit adds the DPU 6.1 hardware catalog definitions and device tree
match entry for the Qualcomm SM7250 platform.

[ ... ]

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
Does qcom_ubwc_configs[] in drivers/soc/qcom/ubwc_config.c also need an
entry for "qcom,sm7250"?

During initialization, dpu_kms_hw_init() calls qcom_ubwc_config_get_data(),
which looks up the machine root compatible in qcom_ubwc_configs[]. Without
a "qcom,sm7250" entry there, qcom_ubwc_config_get_data() returns
ERR_PTR(-EINVAL) and DPU initialization fails on SM7250.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-dpu-sm7250=
-v3-0-30bdec59d204@brar.si?part=3D5
