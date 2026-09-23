Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FCB5678FE
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 19:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191479; cv=pass; b=IPqGLNPcT5WuOHoNd4j4HXyFU4RbziVPOe3j6RK6aKcXaVQtJATfIjZamVj724bsop+SO0pgD3eHQlUxABrgGZVTizQ8ZCiyEN6iPpA8jvDGzzpLWWDsntFotUc9B8Q4jmzpwc9ZIONyLE2s6vSnq925jJscQQjpJztUzdEF/PA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191479; c=relaxed/simple;
	bh=qrPdumNOqAnGYg4uJA6sSaJAWzPE1DQsa0KWSX2NE6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ke2dtpWeYaDAxIIx0SBW2LH4BBPZQyMSgBlWcCUmn/mgHR/CduiMjz4VIuZVNtoBkIUrrNL6QZurc87/tTHVn5jN0Zons/cUN0A97o7zLPEd8mAf21M0QwwNkDnttXs20/E5ginWL5yMAJTXOivuk2AryYGYPg94q158wWBssc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XD7S3HV+; arc=pass smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XD7S3HV+"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39e57ee1cb0so34525a91.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790191477; cv=none;
        d=google.com; s=arc-20260327;
        b=WrwZ6OyuFdqeV9tFv8p5RG1I/U91B172PpyZdnfy5f5ndMehW58Yk6x7vblpjBh560
         +XW1ZGLC5S+RTKedD7vz2qNwRGYHjenooW4Lpb4sIU4/nxiSjQEUT35YEkZ3dFO4tHTi
         QQUZDZ81VQROlcJLNXKwzXX9pHHJ32JxnKJPb4TbjBSDr/c5aOa+0PwkR3xu613E9a88
         oY1lbcOkixZUOaf3f3h7T/BvyMrdjx437//QkswjzGTSe5HVfMzzEtAuBLkWLJosWFVP
         TxDJvt/Z8pbB59/cg/LULYARHugPlVGB9vu1exoyz2gNVyIwt5Cgp6aKokeIWw8qNHuE
         4LbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0x2nZQroxHQRc04e1jt8isM+CH3x3G89bDQEzIpEuKE=;
        fh=4bMmcDEaEA1ynbKD/BeEPskBnL4HB1arsarKEKOcT0M=;
        b=JizG7t3caVzIvf5v5XIlahcvdn0tm8G3xdxtJxvCoWcfaBwavo2Xvy+0I+nobNo4o5
         Z4jy1ACMyxjd7SCJUDYsRYb+svON1i/+7MUhTXfKSQumSJ15oA1UYF8IMW1KHgduoM3u
         A2mRG4JMx4lP6oH+w7TNVCJUNQE1XDRC7eAC+vSrXsI0CHu2oV9GQIDxY3Qx2lWuvbwp
         PLBRh8JbmRfA1ZSTC8XIp7QypJVIsG3LFa75MWsn1LxTg9vrlhduojMlv10Hkr0lDOYZ
         uyZouo9HuJhUH+q4liMwHQCQpC1yeTMLMn8oZIGdeWTgP92Imvfm3Jr1KXlrR9RMpXZl
         psfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790191477; x=1790796277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0x2nZQroxHQRc04e1jt8isM+CH3x3G89bDQEzIpEuKE=;
        b=XD7S3HV+3Gplqc1e6sI5yMPLhAUtpMTwgD6Zu+vQbjwvqqvETWsqk2JB4YwGQkrHmt
         c8xfdt7SCETCJFrXkfju0ml3PCJq/SDNFiDLkOAeCISp9835XbRfFUKiWieNZzmrMQOM
         AAFuXsOMBvXkOYMSrMMVnfsFTizYC3beLEIvCM3VlmvqB/quVk4RPQxtD/qlcOklCSxw
         0d57BqmaILbFD/smu7r8KK9RIXX9/Gr8guREO0gxuWHaGZ9Z+HhY2hrDA7CD6dRmJ+Yg
         uRrZsywbobkhgZlasSLSE+F8eIsbQC6s8ZS328kGEEcn7zeak6xfb9jU9jMkcREBsEOl
         ALZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191477; x=1790796277;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0x2nZQroxHQRc04e1jt8isM+CH3x3G89bDQEzIpEuKE=;
        b=WMdeNiObn4I0oHxBErBlyZDHXr8fyxp+HgtBgGIziUfYNvdcgokEwHM/3MZwmKNQYE
         oWhmaYeYG1ZqyOeV3a60CdYMwNumgw1cxf2h8FPtVq3OW5OjHLN6+eCuV2zZAYrlXwhy
         Bt7G6Ipi2AVsYg/FzeCAnYCd+StbY9lqEbjEUSUg3OcvqvpqBfbscXbDMZg4od7zZB2P
         g88Q2FjqiulA7ppQIBTl9NB24pStkyjkwSkloyLpr7o4k7dPIUFAXkJ1ErW6RISy6/N5
         1F0zHFNup35QCZ7n74bzHusrAFr8FfYBjinRRP3Qccvs0nC1gV0mjWU72hL59sAk9gzS
         SaTw==
X-Forwarded-Encrypted: i=1; AKwUvBy6nP8x0Vhh+13TNlKBwvg++paT4t6qQ4DY1GRTg2XZXnPREn8WXjXQRN+wnfHZVgIFkZNWa9gmVdwA@vger.kernel.org
X-Gm-Message-State: AFuF++mNOOoiKBpPRnrt75hLR7KmtqLox5M9mlB+cGOkWCS3sV2xxE/a
	BW48B0Q4UZ15scPNEzWVwNV+rY2FyolvK+c6b56DuTSWncTIm9S5dFosbnGXZCRU5tNMi/IXsPg
	iVTTcQmkJXiO77lXT/QVHEHEwWcyjUyc=
X-Gm-Gg: AYBFou3d3jRsgFC4f6leJtH4Un4iHgt32Q141oNhbX2d828YphGVswhW0QNxxkYSU0V
	CiFqjGIsOBE8GtF5XgMyC8eb8bXI8S3P6rsTSs+SdMmdHyxZQGwxk9n6oP11ddBnweyuWqpP5Jl
	/OWl5T8PFgUvqLU2vuTPVnuWx8xwAY2cny9Cfceqs+BBGL2h53EYS8CJJsYyzh7see/qrqHVEDg
	x9loFbPrMMueHUQE0BgXkPNIN7i5LsWy5m6iKPdlHpTfyBJOwQHKWpIRF2JuQI3OoTBNs6hpiN0
	XS79lVUl8awqk+3seASY97vZdPZhM6z7atlLQWx43pLq2UZPKMMkh4+7B3SXlLV3Uiu+zGjWkDH
	VxEB7UN/FHEg=
X-Received: by 2002:a17:90b:254e:b0:3a0:238b:db4d with SMTP id
 98e67ed59e1d1-3a098dc0266mr188923a91.5.1790191476700; Wed, 23 Sep 2026
 12:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 23 Sep 2026 15:24:24 -0400
X-Gm-Features: AcwNN1VoBofGVm8cbejsfh35C-7w7BgK4tswB9hEES5ypKbcuahQ7NLIu-ocYuY
Message-ID: <CACu1E7GndBnSj75ZVqic9NxdSakZJL3ZJOuz7D+RbVWA4DUqTQ@mail.gmail.com>
Subject: Re: [PATCH 00/15] drm/msm: Support for Hawi & Maili GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jordan Crouse <jordan@cosmicpenguin.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 6:26=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> Adreno 850 is the next generation of A8x GPU present in Hawi SoC. It shar=
es
> the ADRENO_8XX_GEN2 family and slice architecture with A840, but has many
> architectural improvements. There is a new block Matrix core (MALU) which
> helps to accelerate certain compute workloads. Also, there is a new Bx ra=
il
> that powes a part of the GPU IP. GMU is now powered by a dedicated GDSC
> powered by MxG rail.

If there is a dedicated rail for GMU, then
VK_KHR_calibrated_timestamps is likely broken, assuming that the GMU
AO counter is on this rail. The AO offset logic in kgsl probably needs
to be ported here. Has this been tested?

Connor

>
> Maili GPU (Adreno 845) is very similar to A850, except that it doesn't
> have the MALU block.
>
> We will post the Mesa support and linux-firmware support soon. MALU suppo=
rt
> will be brought in separately along with its support in Mesa.
>
> As there is no display support available for Hawi/Maili, validated offscr=
een
> testcases that render basic triangles, glmark2-offscreen etc.
>
> The driver/dt-binding patches are for Rob to pickup and the DT patches
> are for Bjorn.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> To: Rob Clark <robin.clark@oss.qualcomm.com>
> To: Sean Paul <sean@poorly.run>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> To: Dmitry Baryshkov <lumag@kernel.org>
> To: Abhinav Kumar <abhinav.kumar@linux.dev>
> To: Jessica Zhang <jesszhan0024@gmail.com>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Jordan Crouse <jordan@cosmicpenguin.net>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Bjorn Andersson <andersson@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
>
> ---
> Akhil P Oommen (11):
>       drm/msm/a6xx: Honor perfmode_bw threshold on A8x
>       drm/msm/a6xx: Fix secondary rail vote in ARC votes
>       drm/msm/a6xx: Fix RPMH dependency votes
>       drm/msm/a6xx: Factor out RPMh arc-vote helpers
>       drm/msm/a6xx: Add BX rail support to GMU dependency votes
>       drm/msm/a6xx: Clamp MX dependency vote
>       drm/msm/a8xx: Add Adreno 850 support
>       drm/msm/a6xx: Send THINMEM config to GMU for A850
>       dt-bindings: display/msm: Document A850 GPU and GMU
>       arm64: dts: qcom: hawi: Add GPU support
>       arm64: dts: qcom: hawi-mtp: Enable GPU
>
> Bhaskar Reddy Valluru (4):
>       drm/msm/a8xx: Add Adreno 845 support
>       dt-bindings: display/msm: Document A845 GPU and GMU
>       arm64: dts: qcom: maili: Add GPU support
>       arm64: dts: qcom: maili-mtp: Enable GPU
>
>  .../devicetree/bindings/display/msm/gmu.yaml       |  90 ++++-
>  .../devicetree/bindings/display/msm/gpu.yaml       |   4 +
>  arch/arm64/boot/dts/qcom/hawi-mtp.dts              |   8 +
>  arch/arm64/boot/dts/qcom/hawi.dtsi                 | 336 +++++++++++++++=
+
>  arch/arm64/boot/dts/qcom/maili-mtp.dts             |   8 +
>  arch/arm64/boot/dts/qcom/maili.dtsi                | 309 ++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 446 +++++++++++++++=
++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 231 +++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   2 +
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  25 ++
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   1 +
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |  16 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  21 +
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   8 +
>  15 files changed, 1407 insertions(+), 99 deletions(-)
> ---
> base-commit: 1e9b8055458b92f9ebab6f39d97ade5265a0b012
> change-id: 20260811-hawi-gpu-05b4ecfc3c4c
> prerequisite-message-id: 20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qual=
comm.com
> prerequisite-patch-id: 239c169e15da44519b2dad09ecd92f0052757929
> prerequisite-patch-id: 6c586be864944bb1eed773e8c211b898bb1289fe
> prerequisite-patch-id: f3d8748ccdb6760563f3e07f701a18388a9408ed
> prerequisite-patch-id: b1639353868bed10fd3cbfcd01cfb88b7e737ead
> prerequisite-message-id: 20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcom=
m.com
> prerequisite-patch-id: 36f12c16bf9cb0411d8be2f396407c724162189d
> prerequisite-patch-id: 28ede1ab83d4b5b56423ebb09bae74b6599b3bac
> prerequisite-patch-id: 6b3e28c55c07bfcdca8bfa9219fa0c6c763c6f6e
> prerequisite-patch-id: a2007fdaaeaf2981860c54ae5514f5a6f06c6bb3
> prerequisite-patch-id: af8aa3c630647336bdaeffa9c88de3650f1e49e4
>
> Best regards,
> --
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
>
