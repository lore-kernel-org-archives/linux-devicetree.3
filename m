Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5534DD6CF
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778695063; cv=none; b=sjeL99crWznS4QqaPOYESdLAjSbhIS9aldHcqX1QCPaVtqSb+csBrj1JuINyH75BTbD7Q8Ra8yt9IWspZ98QKUECdYdAbzqMMaiDG353+NEQ97nDJ4KNCx7YwIg0fGAfWU5fZ6bLt+2n5ax/Peh7vXr7SBU3Z1PdkptVwDk9vb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778695063; c=relaxed/simple;
	bh=JRtvbQ8QxYw13braQVEr2wIckkNTLwmQHTaR9vDx178=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOMAs87UJJLteiwezF6K6ar0FJpeyPK6HG9RO9sztKE+HR+fKRPzdOKI4AT/JGlDI51/DLLTg25crOtlHQWODEkAbh/at4XLXxqnHGIwyOAX0aatow2LHu5o/Xm7mhMjHwIJaVla43GnrcZw2HgJ5MzlNzu22IezH6gXLX2+GqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mU1hYuZk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/kt1BkB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mU1hYuZk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/kt1BkB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DFde4b1242793
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mMie+CI7fOWywl6kF6h6N96e
	rnFrXS2fN9VjDSUGY4s=; b=mU1hYuZkcOu4TnVf24ssSjxq0iGXPCqiK9fhfpFw
	/nR4/pQhm1S820fJd12uRFzF+R/hseA/A3r+HqM9SRa+JCktFAVaL7VgRipAsukj
	9Rj59tw4tjuUJM8TFMajl75npH5E4wpsAwRfpNszIf3gGUE6Kc5Gn+PDqNAd2V5G
	cQs16fJO2t7sUoFvyC/huzNgYTrNsIg4GIJj+rb97+RDmJciN3MLe9Q1ZqE+oeEL
	ZoPpUSZ/mDJLGLwgon1oWrI7JlT5Vs+GUjTMMt6gHzryF4S+8s3mRMASej0KjhDr
	Ih9i5msLFZodVD8ag4L99QlXLYloS+ZzDfnQDffBs/+j+w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4trhmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:57:40 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6313c9d983fso2945264137.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778695060; x=1779299860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mMie+CI7fOWywl6kF6h6N96ernFrXS2fN9VjDSUGY4s=;
        b=P/kt1BkByT/Obw+Zj+HDUhQJuyJ803J4RJfK/p+Pt8WyJ1s7WWsT1W0qaD40//if2f
         c1LXo/tJOZ+5OSbyQ89H5WkARh5J/+DtVgwfXYkNi+8Z2NxgMMYNwkjSmoDbu+MEFHgr
         ATbTUOgeuV1XId25l6gGpOzVya9kwQnCUMW1XCXEcYKZyUICQIO4NDS7itrbvESOzukD
         cgIhi2q/iPgRQ+fnt6CyPXgiZskGmUPDdXYZ/qSyPlDW/8q4gJqepbNWOWkP7CxdnL5r
         9u5QX634i01Iyr2yp72ctDxJKLgxjDBZn6ZIb48yVThbtAFvieVIWKS972NGWcI30Pvu
         Ua9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778695060; x=1779299860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMie+CI7fOWywl6kF6h6N96ernFrXS2fN9VjDSUGY4s=;
        b=p7yB+xFr6ccklVt58RPSjpXZuiSr1EMFsSU6HTYuHRC0L2ZV2zr93EWxD6RDGhiTYN
         Wx1bjukWL7PW0fW+O0iliX604G4fX0zQFiCvHRqFgp901XqTwffgs/PGpAWVM+aPPL84
         RzHC+FNKM+bwKsjma8uczPxAoF1Mcp3O85BIdDzeoK18xrGRUxzpsM5p+5LGfhqkVtCY
         QQ5sb+cl+6zzZq/xVAcAZwRE18pQHfzXn9DRWQDDycYJHWLGyNrft1pOhcfvfFciNMi+
         ByP+kGtLA4ZMxWSuqJjnAyjBuGbcy1+5kZKP1J0sAQmamWEMq3S4AXtkezoy6sHd9Tj5
         wjuA==
X-Forwarded-Encrypted: i=1; AFNElJ/Xj5u31H+shAfC1+uGRbTxD9u6jsnC4WZu5QtMNhoiBGtiGAjBzf+YnRITPmdWhXcYsjaTRcfnYdSY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+opwvk79VSj6RnP2lXBlZ7G5p5M7dWFrilHlBYBrSav4051su
	YTZ39nBSfk6dvXrxuQKQD/GRxxBCFIcm2LV8jsLKfFs3SM/pyRToZ1D1281HsRcorhC+FwdDl+B
	5FnTGazByYgA4fNIRUvEQi3POp68sA3bzSenxS/Ui0ATCahaDKcdS58P2O6MruOdE
X-Gm-Gg: Acq92OEnP8l00VfR4k6QY2u8ElMuW/2+GpdN2Q5UN8zNRzELl3NmRDSxPnwkgKvI6x6
	UGCuoE/lApgOk8Xi2PVKjZBM28fngVLbXkKdLKO0lGlqoMwYI86VWym1Iy7S9AUktYrYEvW3vtu
	rty9yR5sbzeoOA3mT7UcwsvWoXV2WyNRBfND9thLy5oChiKJ849Xj6igV7V5K1wGsG39pxzfNQ5
	vGRu5p+OkVm0Rzylag6ojpYKFkiXZmpyPv3Q2S3eHrq0af4zJ8D33cw7yCY4OuXqU7QtUE5saFs
	rx/W9WIHnAgImFjw+RKxRhwAUMoOi7fsQnVgr13VzJXtzikgwVZRrGbbMtc3Uty0lag24NpLX1D
	rDJ9kWafjIXHjvycYp5446mZDn7linhcjv41DJeV4dSKoSB9B4tUNYEEEwxEbdFyjX8C7NA6sBC
	fJhWN23RzJa3ByHDQ7WAQ57jPmlKxTwRubbtIxgTK7q+wr8Q==
X-Received: by 2002:a05:6102:b07:b0:631:e729:4575 with SMTP id ada2fe7eead31-6377156b7b8mr2460641137.5.1778695059862;
        Wed, 13 May 2026 10:57:39 -0700 (PDT)
X-Received: by 2002:a05:6102:b07:b0:631:e729:4575 with SMTP id ada2fe7eead31-6377156b7b8mr2460622137.5.1778695059390;
        Wed, 13 May 2026 10:57:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8bd7d8974sm3167182e87.64.2026.05.13.10.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:57:38 -0700 (PDT)
Date: Wed, 13 May 2026 20:57:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
        Yifei Zhan <yifei@zhan.science>
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: sdm670-google: add common
 device tree include
Message-ID: <fz4llnqzz4qx5xcp6j6xswtkfmalzyxm3jwycl5yfmn6qhc6n7@wa7mpngjeykr>
References: <20260513172549.1345-1-mailingradian@gmail.com>
 <20260513172549.1345-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513172549.1345-2-mailingradian@gmail.com>
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a04bb94 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=byJCrBVNwhKw5jrXw44A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3OSBTYWx0ZWRfX+nfoDMOY3Z8v
 inWnf8BtY7xrPgTt/VpxmqNup3tKCiraEIMIuiLk24mECxvK3cg2zcZyY8FHPkgjk5ynnP3cxM1
 glvzHWPhPaVChkXCbBqS1kcG+KLjsqTfbrIY5InzDG1DUble8hvOoy1o42fcQYNyyO4gifmSb8Z
 OIVNzK0PhP9j76hmJUGO2yu/a4BTgTapaM2Zvu8xSEUK9TLVOfeUsyJghS0RrlwOuVlNL+Dhyuv
 c+xEePE9WUyltxXeIVIGiBbWuUrJFd9xShwhJT6iwJoWGxoUmzhU7Cnfco+Md8gxDz4sn6UCCF/
 D9il1YPF90N1NgKfonF8RAkkunMm0gnBqhGwZut/+JpDBEHiwbsTBKzGxDyoMXifdIrHeSayJTu
 2xkB4SQNOZP6AygRPiseQUFvMu5dKCPlaF0Zz6BDv6lh3C/2lLAM+ZaF2zsrUOGrSYNAC3df8Zi
 t33WvIJO9UeWT+xE7uw==
X-Proofpoint-ORIG-GUID: MRTasFrVQDg9Qi4g2NWD5WnjhWFHzJKt
X-Proofpoint-GUID: MRTasFrVQDg9Qi4g2NWD5WnjhWFHzJKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130179

On Wed, May 13, 2026 at 01:25:48PM -0400, Richard Acayan wrote:
> The Pixel 3a XL can be supported by reusing most of the device tree from
> the Pixel 3a. Move the common elements to a common device tree include
> like with other devices.
> 
> Since the original devicetree should only specify non-XL properties, it
> needs to be completely rewritten. Also change the SPDX license
> identifier from GPL-2.0 (which was deprecated as it can be
> misinterpreted as GPLv2 or later) into GPL-2.0-only.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Assisted-by: "Claude Code Review Bot":claude-opus-4-6
> ---
>  ...le-sargo.dts => sdm670-google-common.dtsi} |  22 +-
>  .../boot/dts/qcom/sdm670-google-sargo.dts     | 714 +-----------------
>  2 files changed, 20 insertions(+), 716 deletions(-)
>  copy arch/arm64/boot/dts/qcom/{sdm670-google-sargo.dts => sdm670-google-common.dtsi} (97%)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
