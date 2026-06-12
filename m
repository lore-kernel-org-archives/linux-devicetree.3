Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B70425228C
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781225778; cv=none; b=bo5U+cv91yn+UON2OowceiTZn9GVzipIXcLwBLqO0sK/azyX0eudT5FwdzRePqHTz0ACT73KaS47Aw4RgQVwuTfHa73F3Y6EoTCDCO+BiqVSAjd8xqfXnBeNVGyYxJkDUGstc13FDH/TIvUEQjlTCjUNH6hDxdcNTRuHeZzM0rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781225778; c=relaxed/simple;
	bh=pcU5WxnVvahkSdZD5SO01dQyrIQjHHQKRKLM83SFDmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVrojFRAa0s/mM0z8icPD+zPnNA+YhUgozra9H6oJ71qpN7C2O8Ep2u3wnkV6Tfs/SohsueAmDu5gHQHdEXiHnrIcZ2QIbD90BKLSwXI/0MjUVPsheMbYcTo6XFozr59yJoIV8CAkFViqoXKQAYNoCp6fRnONWaIX0DZvpB2yZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZQcWkhz2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtGmfOo4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZQcWkhz2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtGmfOo4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMSWhr1891790
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X1u+3fA7kHIVfDFfKwj+C/37
	uBiOEHgBubv0x4etziI=; b=ZQcWkhz2ZKDbxvNTWstAFfK4LfbnICpEuZnhBiKj
	OYj5S89J2hfRgg5vm+KJklqJ0JRzjT1jZ8N7TD2/+8l90ujTkBr9soZ4Vxszk1Pg
	5OmUuLu7BsN6JFnrhz5ix3XtRkhjbBTCJa5PlgbWcHevcDJyUcmHoFTf2HnrG05p
	GGlyueGxiDEczVM//XCNSSUMjr+o0v2zp3Z/m7d/DtTOEiH/RrUb20ILqj2l1tGV
	8Vr59wN4oM2qgssi+NuujCo8p9gGW6b7m8kLykcuY18zDFWl6Og9MkVxB42aDcrE
	xgqAxqsT0csAN/rGwuAZmGL0oOSYDmygd0kvey+PxDNCHg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5s5fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:56:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfc719d238so172324137.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 17:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781225775; x=1781830575; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X1u+3fA7kHIVfDFfKwj+C/37uBiOEHgBubv0x4etziI=;
        b=EtGmfOo4qV+MtDtgD75IGP6U6vX7BoxY0rGhgprOmBBX835W4uiOI8V31f5mKUg06p
         44QP2lZEfxH8fvR5sVwcRPl6F7Mb0S0B++oxIJYyhXfLPYdBRPjSZHf0RSyhPUVwmmhn
         VR6bCwycGsF+RdRVz8+3CgPddvyl4wCcJmGGCuR0ToO+KX3apLA5CLCjtdPXtGxmzYvB
         vVG5WHWPMboQl873ij3yRqbsxXOxcjUA+tY73+ZC6Pr4P1M9sFLKwenaLMiUy07vYCTK
         1/8WoWNGpNmZLonS5eB5DSwsOInGZ6IXSdDWJdziFBPi8+0dY7h5as1Bgg6JJgkhVO7/
         gc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781225775; x=1781830575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1u+3fA7kHIVfDFfKwj+C/37uBiOEHgBubv0x4etziI=;
        b=e42xFZtGzYUu1ZlmFoU+URKMyKJDjYwmPLpEz9zdsrOrQBSkRmBbNv3Vgm3J4Ly6qe
         CAEw/xVOP/l5AafCbZ4dBilUMoU9vXDg0M1eCU6t1W8FF50frnQCaTbFbwYOCvKf7UKq
         lgnREW+BNrbwY+/vnDci3b+OY8j0ugMfswqSJOSAF8uVpMfhqhb5VP+ERPOkxo+TtwKF
         0jyq0+mCu/+z7ieKnRON4E5Q3F/RmBWsR1CB/3xdQ0gtpLVIV4tEYldhQHWzHH/hAE+L
         IHuqbQAlDQyEF+gRdkJQYWr1lRIovvGhON00jSLqO/bZ+fPywsncOaM+UhB12jADuFbP
         NEoA==
X-Forwarded-Encrypted: i=1; AFNElJ8jH4ukqsfS9bl10Ghrlh+ZQdL5e1QOdPhc0WVzbYCV/K08BQqWcBkMHJRQUUP+h2mtTVAEyBRWplEV@vger.kernel.org
X-Gm-Message-State: AOJu0YyA6B7m6GGDbMS3h/ZC6NDNJFTTg/yMj4sY+St+Jrbybte7cKrD
	EBdBLpdukvxlQUY+OSI/ALWAHe/RzK/zcYnCdylJbpIbFSoVEdnnMamf/7vqez0lx2sZ+DaVVIm
	MAHnfrqYlw5sSGOyZE1RQLUPRXrhxOGFQhWW5ziRGxtrhaNiI5SipMWfVUetnXgAr
X-Gm-Gg: Acq92OHDpOieUOgWhT7JfFySjvh/lcL83GjH01zjZCUv900ilgoSFgu7AAYcr9qzZhg
	ZtE+6zNcKytnKgtOQ0Nbt/5QIqXU3BJ6drNj1sf0z8rusHkw4Tr+8s7qZ50UGMdL+TobUANhkrF
	UCiy+jOFUnFUdTFfwYkcE0mhXGcmNVU9LvXhNU6+UrzH98qxoS/KY0p7df4OBZmcIWO4Ssdb9dy
	tugJmCM+/QA3kMRVf2vS2uE61HjoYHfwwdSkFoCRTSiYDRgqblDxbh/xvI6kOdsuu4mNrixO70f
	31no2QbiTe4UOVioxC3oUkBWK+O96tCi7vzPkevIKc6ckmFBXkMnrDXS8OvYNgpAqGZp3WNN9d3
	WmRENt4AfB9QSLBoUwEbNvgzEa5gWb2qhBPviez9CFrXtn6kNY8H2nHkiCVoLGFC7qlhV4gGPOS
	y35RF2l/BfIG399/jSQJ7dcDxbyIlJVJB48i4=
X-Received: by 2002:a05:6102:5491:b0:660:d26b:506e with SMTP id ada2fe7eead31-71e88ac8860mr284527137.1.1781225774777;
        Thu, 11 Jun 2026 17:56:14 -0700 (PDT)
X-Received: by 2002:a05:6102:5491:b0:660:d26b:506e with SMTP id ada2fe7eead31-71e88ac8860mr284519137.1.1781225774269;
        Thu, 11 Jun 2026 17:56:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190e9sm1719881fa.23.2026.06.11.17.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 17:56:11 -0700 (PDT)
Date: Fri, 12 Jun 2026 03:56:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] regulator: qcom-refgen: add support for the
 IPQ9650 SoC
Message-ID: <367u4tqrx4wkwepm3pwlbdbqhsquilhmloxkzugvgmzk2iw6dw@ul25u2ynoyzn>
References: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
 <20260611-ipq9650_refgen-v2-3-d96a91d5b99e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-ipq9650_refgen-v2-3-d96a91d5b99e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Ibjfj7T1REkBst67HFx8XLrPduNzyjaV
X-Proofpoint-GUID: Ibjfj7T1REkBst67HFx8XLrPduNzyjaV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAwNiBTYWx0ZWRfX+CBOq+UHS7z8
 nY+gZhzvRHr/WLLzfndkWfMmtSAbOwieVtpftkktrCL13+YI9u3USXylIiZP/2FbFz9jwpeg6o2
 9vybeW9KpXdaH5VZgjTNEOSqiC94QiY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAwNiBTYWx0ZWRfX13db0orYr5Jr
 clKY5xjnK9OqJKpgn9/46w840wMdYQUQtZ3PmrN4UPcnIyQw//lTselHQA3dbdB5w5TDSaZTmFG
 Vg3yHoT83WIbh5EALxJ1D8XUoZHKKfUY48ZxIj3ztdhK6n3cGY7PJSQcHhfkrCY1SrTI+sxCNFM
 LHrrRpwgDyHJWCDq+vzyiEbHkqOPHnSCrVMKouoik8aUm9yDKnUwX7Jg/90PnR4+KEW+tV2B8qx
 mZ1hpUFegFjk27K6mNoQ4cV+9WVOk7VPBNFsC2mqcVPUjkPgzyPT82xVAcI7hsXvyg46J0H3rAj
 KQkIwZs0vVsOXvGk98t+2smN7eBCqA8keJVEcT0hDO8OxB9MaDgO4O1qGDVQcqcMRnSuSBrgih4
 rKFwY9NCf5Uh2Xj7YWbHPToKRtcTN+faHlHUHMUCia8D5QvSGVZWcBcXox55JfYEVBBHhpcQ3e/
 x6Fs4EvoJ25TbJ9GDHg==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2b592f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=b784Gs7XNV41u_O6X0EA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120006

On Thu, Jun 11, 2026 at 02:33:18PM +0530, Kathiravan Thirumoorthy wrote:
> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
> PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
> enabled on power up but that's not the case for IPQ9650 and we have to
> enable those clocks explicitly to bring up the PHYs properly.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-refgen-regulator.c | 89 +++++++++++++++++++++++++++++--
>  1 file changed, 85 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
> index 6a3795469927..e8821f159ff1 100644
> --- a/drivers/regulator/qcom-refgen-regulator.c
> +++ b/drivers/regulator/qcom-refgen-regulator.c
> @@ -3,6 +3,7 @@
>  // Copyright (c) 2023, Linaro Limited
>  
>  #include <linux/bitfield.h>
> +#include <linux/clk.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -16,6 +17,10 @@
>   #define REFGEN_BIAS_EN_ENABLE		0x7
>   #define REFGEN_BIAS_EN_DISABLE		0x6
>  
> +#define REFGEN_REG_REFGEN_STATUS	0xC

Lowercase hex, please.

With that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +#define REFGEN_STATUS_OUT_MASK		BIT(3)
> + #define REFGEN_STATUS_OUT_ENABLE	0x8
> +

-- 
With best wishes
Dmitry
