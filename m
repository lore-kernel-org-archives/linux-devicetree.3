Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865534C6F15
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778694849; cv=none; b=hFTE/QAtfzs6BUPv2kTH4yafugm4Uz1JRXxFiAERklkErvTAsDCxENxc43JpsdzmaQ7+Ux/l+9k74dxBnwKceZTAzyosNruDP3H16yu5NNtPJ4IQGpk3GxTOEDRF9AlLDm0HF1NPPPGXGabJ1izwcDjdV5YrpphO7h8uWd15zCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778694849; c=relaxed/simple;
	bh=5OCnIDxaKzXtIMFl7vgca1Wdf+x4Gq6w9DliutD+wa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2+NTatV7Vq2yd85qzKlfGeRVoPq+MioJQSKt0fKpKmixLql8BAoE2/XaVKpzXt2DaD1Sj6suNwIyrRonN3kBPP3Nrcg7m+TjpGHbi1cWLuIebv3kT0Pp7wrxbiqul/Hbzkj1wtFpGSQsKVPjO9A+xxUs+q+tPbf2LIVH5p22Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnrEFmAG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OqNuhNc5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnrEFmAG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OqNuhNc5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBYZAs3324660
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rPuHL/f5LzXJ7O7qOo274Obs
	+ipAHrmu1VPjHVQ/kck=; b=RnrEFmAGoLK6MSSxH/hyxpSV94i49m/hTXnpMIbi
	D7cl9PdO2cHptax5x49zf/eDaswen8dPC1Z9MKvwXnNfg0Se79gL6OSFmSE/31HB
	SFGfiYRWoYg/1GpBol6ieYd0ontVTPIMbEeIsikKfwZQ8ZH+1zPScFZ+0gh87H8d
	xfjxPH2dZIc7qXrQ4WxqmmxtwF5W0ZfctuaohLAw5NA1oLPbyFiQj13uctdBVqwn
	aUSahxZQbQPR8ONqSWRf5yLcqLQ57B9RcaRdZRp4K4FeG9SfEy8KVbtMrueuuaAr
	FGQHPyeAyThzLhvmkv2qOZfFtvOz4Gn7p8RBqSV3MvvzEA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvdarms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:54:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fba8d8c40so50103361cf.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778694847; x=1779299647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rPuHL/f5LzXJ7O7qOo274Obs+ipAHrmu1VPjHVQ/kck=;
        b=OqNuhNc5S9UqRbnv+3a2P0a73yzgVajispWeJ77/VVOIDRI7/gRsCLsmeGyD/6ayNM
         5Ayah76Q2RE4kJS9wKSi5eCSB06WJGizBZockx3YKLBFXNRarWDFxBlppk+1UkyFT6bW
         X5mZNlksomo032a6dzkQwwzl75AqFgH4TYuI7J+Z7aGZ3DX0rbgxHRpkejS98Ne/itfS
         z9Ih8PyOJy9BAniOUjW8+ZbSoc1l+IWqjr/409mYvJhUD1KYreSWZDQjyj/00qGhQUFt
         5S/O8DLKc5woEFQ5b1T3HZfn0MQbVQrsLbTEGtIUsDOkf5d3+UOuGZxOhqA6GRRPtD6H
         dasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778694847; x=1779299647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPuHL/f5LzXJ7O7qOo274Obs+ipAHrmu1VPjHVQ/kck=;
        b=a53paZr9R1pt4IhafrxkzIJaMyytra7hhRV+FgFpHLGMpNFTCh9Bwyd78ZDJCV/5O1
         a/yvRaxiatcaxglihlZAvs4RO6nCVjm+jnbkfHhxA5t7rKMaNy42Cb2wj3pi6TvN8Xi9
         /8JikJLEd1AIGFajgMCcHCRR2qgVvINVaE6z4NVW4W0c41sTEcIFzmORy7gmAst7dvu6
         STLCbD2wraIEVGNpTW4H8/FAE8zqxhBdtanVSqoJlAnuJADwKltz8jDbDUdLTU/z+AeW
         L+nMgaRc+c+F0ZRTRixJYNerI9+/026Uz1FDcGpck5lAZEDUbkTcutaYVY1ERGBQgAIN
         jYfg==
X-Forwarded-Encrypted: i=1; AFNElJ8gaJgQMMdXZcFBPPSjtqSw7kdIX1P6dy+Le6JtEjhpSQdIR30ghp6n7zkccwFqi0lm9saDtAlTpPIY@vger.kernel.org
X-Gm-Message-State: AOJu0YzragQeMweaqe4mEwo9B2/pNRuYUophSB6z0+qE6Z70HF92DbAq
	tkPoqbCe28ugsuWX1Au+X1i/EWcHnypYWdziY6wVrUfVK3puhpysWnRA99Q7kWBfmtfwGWNf7+K
	JrbVc0xYk5XW5v3Lx2WxBjZPWeVn1dxu11+48NNH6zwwTxunbFugDQU2Mhx2fkwzi
X-Gm-Gg: Acq92OGP1LoY6nO+k7/GcFqXflTVSQdgFd12YrmlvfoDjfU9pJ53UTnLFjIEM4MnAyZ
	+aYkZA/AcVXbe7jBsTmOGcg27R10u0zz1Ua2LEeD5SeV88aQs8Du01m/VHBTr5hG7sPZKr9+QIr
	ofwCevh8wodie73KuRgYAVAQlRYX7RQurlIIOkVjcs1xmwRbFYh25kCVvxVflpnTjIMFiZS7IFR
	co10jYm++mORkxMos0vG0AUeAjKR6LIC8q92dylOLGUjmAmU9fRzEtnsGXGhAivoSss4AdfNE9E
	0GjXU30xCjIzy5mlj8ZeWN+dzU4cg/MPKGkPxOQv5gdzMfRSrSx57fvhy01Pdyd2ZrC18IQ4OFQ
	ArPNVgU6EV+B+uh0oBNDc1hxaPNAAU0kToaOHF1PGUIfvAwz1Ur8tqtZfy5tuOUn5Zc9RBTazjv
	TXKxfV4aD+ilCkM+08v7S74ksz6BKCCd2FIYY=
X-Received: by 2002:a05:622a:98b:b0:50d:a3a3:e612 with SMTP id d75a77b69052e-5162f4a88fcmr58559441cf.18.1778694846816;
        Wed, 13 May 2026 10:54:06 -0700 (PDT)
X-Received: by 2002:a05:622a:98b:b0:50d:a3a3:e612 with SMTP id d75a77b69052e-5162f4a88fcmr58558691cf.18.1778694846256;
        Wed, 13 May 2026 10:54:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956606fsm4199375e87.60.2026.05.13.10.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:54:05 -0700 (PDT)
Date: Wed, 13 May 2026 20:54:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 7/8] arm64: dts: qcom: kaanapali-mtp: Enable GPU
Message-ID: <c3qa7bctzt4v7lblcnagdkxl7q2ku6iutwz3c7yplh7zvrrxb7@iyhn3wd43mrj>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-7-13e1c07c2050@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-kaana-gpu-dt-v1-7-13e1c07c2050@oss.qualcomm.com>
X-Proofpoint-GUID: UfBWMxa8AqvzkMTbCDDJRofzR4nNn-0N
X-Proofpoint-ORIG-GUID: UfBWMxa8AqvzkMTbCDDJRofzR4nNn-0N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3OSBTYWx0ZWRfX0Xuw4w7Y4dzA
 vNMUbvLNXXyvoteIZr6uv+hJXIhH31Tptcsh5tcvjmyKYRsOjlqly9tiq9/R+iTTab7F0CyyIog
 rW5s+y3r2FX2CucPCcuZ7kjV8ez3heX2gVn8UQL1QIJFBZ0oVsnZ8OI+FGVQWpNTdq9lS6Yb8Ro
 rcbVje8nCwZjiav3F5rI7Rd9D/+qmJKLDddmvf87VI4jI1pYJEiwGdf8OpU48JQ2oPfumyF8LmL
 ORdrXvGXJT0jw5ZByPfMueUCijh091PlJVYHONHVhID1eC/R4O+uGm2CCIT/OMBWkxwBsAIcXL8
 3qKBd8fDOiUBfk4xpETE3tmM+35dm47CvXuu/RPPfjcB3z2Ucu71ZXVD+h3Xdh8TdRtEIuCR8Kt
 YoZBcR9nGSV4lhlLzVDKxNO+Yj4FFQWGpmi1GOGm50wDUGkwPk6iHKs8sBr3aa5czgA/JbhR9fZ
 dID9oDu04KMAyzqaafQ==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a04babf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=z9YPW0OalzF3dbzmYPEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130179

On Tue, May 12, 2026 at 03:53:21AM +0530, Akhil P Oommen wrote:
> Add the secure firmware name property and enable GPU support on
> Kaanapali MTP device.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
