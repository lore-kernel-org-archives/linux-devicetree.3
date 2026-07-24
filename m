Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930EF1448E0
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784892637; cv=none; b=HMQfhDw7bj8Oq9TZbz13UCDZTSmuZ3ub4eduwE8HHsiVW8j+Nk0qyaeUKgJv4OIo9lPobq3JeSp6EMNn9oBPMWqW7v79pLz55qrVk9+1KsK39GiLgie7dfZFkCWYYIzpePEx933W9lNpQeDURDIR6as+xigCybWlHOrXtTfRsBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784892637; c=relaxed/simple;
	bh=v9CE0NZgeV5DlI/DjX5s89yBEYtQGbY9EDY4vDxz7xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXH/A8FDXBPdcJ4FcpSnKRHBSuJBBNy5DT+ke4EWrxN90yx7vstNMXlYi4RVj1To4Ueo6cZLJqpuu6pCTW10q+MQ4Cak5LXBQryYWUcqs1wfA3VK0/ITOMJzbANzowiyNrEO11/CyoaL4nsbZPoXKWqfmqDEWM1HvTCj/Z5zSbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzYsxphn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QJNl4c+b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzYsxphn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QJNl4c+b"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADrqw2721540
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ifhK8jF0fZ9P81kr75lgN2ov
	xxuOE8Gi3gW8iorSRjM=; b=AzYsxphnwEvoFrjj2ct2dVpTyT4wuylQpTaRYmk9
	YwYg6Y2GF7tVOo39jVowCMUiobRWJ/NOoqfl0r5uCU9w7hRysnfmN30Vi+hGIjNE
	Qp14rhVgwsUu2v6jVlo6bJ4Htd9c/L1VdD4Nkao5Ep75EfH9nrso9KUtrNqSkn7T
	fRenBAkO8Ql3W397zwOCke9LdDKe/WfcKi/ZvvsEu+AMzLoZlZbhe8OfTyruRc6U
	eOI8qlgT8zUfjmLnQajcrftnlz98Np+ysoCxK59j7r5EDmcLbQWIvAwsc45xGifn
	DMq6efJCE4u2nWodMALhfjOLi2mft+PW2cvNL0PjgLKQKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yagamm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:30:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0199faafso5265501cf.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784892634; x=1785497434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifhK8jF0fZ9P81kr75lgN2ovxxuOE8Gi3gW8iorSRjM=;
        b=QJNl4c+biHvGXI+8z4ugszdg+GquPl8ljyucdpQtdSzkKaaTno5KJD0RT5ZZTMbSJN
         4ssjIuNWfjRMW+XsGiAwVqf9BnvmS0RJ2xRb/xjxlzoq7R6WfTazKK1tj2vYKIj45rTc
         EySN+NdGYkvAoTx/+dxcxPD0Hr9F2lENjFtu+rVJ81zZNI9l6P5+xCpqkKFWFIhiHVKp
         h4G/RbYbBYIe8CQ8PgxpTRLFype5xUeG8HTmMcF/JkdNGKpo+lWmJqAHGa6Y2eKHgvip
         5UnF//yElHtKo/tWi7SxVcE8lI1wBs8D7EFiew6vLhIxZmlNyuuru9BkO/CxRzWsytLw
         VQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784892634; x=1785497434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifhK8jF0fZ9P81kr75lgN2ovxxuOE8Gi3gW8iorSRjM=;
        b=X0V0+PbEQwPcrJfD9R4wBcqS6P70LA4i7R2DPQQYv9YZYFPldRPawS2XfSHBvQZanI
         l2wDciUPP2nlqqAP4Yyuqu5KC92j88XpGM52OWSHfGEsek2p7I603KRXP6hyT1Bwu41F
         UGqR8MVn6H22mcwE1fIpiOMQvgQ+Wy4dTmhHM9bODRt9/Hg6IzK5q7jbQMetihLqWH60
         FrmtWFL3D2++4btDgHKfr3kEl4khsfAtcQr0Njy7WFkCLkJizg29Mp3eIcl35Jc6OGSP
         qnjlAWM246b7KKOukkGct1xRPZYt1xaiF37cZlF4FjTaXdZ0bg0um9xFUY8EKlF09/g2
         n+OQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+lRWsc1gFzYuCRSDn/O9hCbx0eWx8rFKXOtp8m87pWDvpFyFyarRgvr76UWILGD+cT4h/cnOgPDag@vger.kernel.org
X-Gm-Message-State: AOJu0YxhmeK2L7zSpLMnwdr2a2+tQpdhxzHNm2JpURwZeeNzpwG38D8T
	wEXeSF4yDlLUlKBkcOEBQndRf+UdGTyFqrd5hPvFho8ZX9qXCj+CwpQ+84ICANpmUH8B6zlwdqN
	UVsRrErBu3YszdDyEQ9g4NWNYeZiAQ4kpvrjKyqKkm691frTf/BE+RC+Vc7s5sPjI
X-Gm-Gg: AR+sD11yaTxf1kGtHN6lJO6brehfaFWD3uwRo9ANXPSDUSUTf8DYdXJtt9SE0iPjfsx
	ReiBQAiGwvpknSVxrY8nHky7jLfKLs0p+kiGh71wtJunVgrTQt4NjTV14TbPA9+gQ3nVjPPLiDo
	h19/kO5O3vTrLr7Q3Oxo3FDuf4Mdhybn42Hm/DDpLGg/iUrkPrZ4UfS1EjOmU5DRZt1dtPbWU1U
	SGEP2fYN4JLSy/uPHuUVfIn5ypvPMzqmejTwacISA9Ax9gJw8KHbPJDmcaQcFxPaybj7+CjYaDT
	Ke9PLCHzQ0Y4RLYQIyaTepZe9tI4ERjZy05aBiWIwdnnHIxOZz0h44sfQj0TMG8Qxrdwc9c2C9e
	2qEWykRZDhfA43eqWPCLLZ0LzZmnuTNYvIcZIk5aw6+YZeaUcRekjv+BVHj+wZLhe/lqS68iY4l
	y6MJfWEC5rihsyOw==
X-Received: by 2002:a05:622a:1350:b0:51c:83ee:e42e with SMTP id d75a77b69052e-5283dffc205mr65522861cf.77.1784892633949;
        Fri, 24 Jul 2026 04:30:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1350:b0:51c:83ee:e42e with SMTP id d75a77b69052e-5283dffc205mr65522211cf.77.1784892633423;
        Fri, 24 Jul 2026 04:30:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c9f8sm1459645e87.14.2026.07.24.04.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 04:30:31 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:30:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add
 glymur video codec
Message-ID: <frmpjyrk3epa26oebskil52sony6k672a5mkcamviiz3vdjlj5@eenvztuikja5>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwNCBTYWx0ZWRfX+bHd5gZE+7Ji
 Eas1pOGA2LPuXyz+xbwOdpfHcwgROwFNXlqDbGVqh2T8yAqrCHskaWN6rZ44ZrczFsUrmmC16z3
 j7xw56RLhLC5cH3N0Wo9BQ/WsrP3Fu0=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a634cda cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=l6FLTy858EcHa7FfVjsA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Bu-4GMUxHCV8j_vIVobu1hP2F_Zr2N-q
X-Proofpoint-ORIG-GUID: Bu-4GMUxHCV8j_vIVobu1hP2F_Zr2N-q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwNCBTYWx0ZWRfX218eHCiY1gc7
 xkWjH/5HWyHCBZjbLsBA5ffTly28LR14d1To1HLOVjRmuei3IwlYRLRd3AZGbIxtv/8QCWuMG/q
 9X3KGPKWRlRzwnYnHSDXxgPvclcUZmFUHhBPbGgJJIbnStFxZ3+ZgcgR7voP1vvT4I6VF3j4jtp
 XC1blN4wXEmalyd00gqeVQKhE7U63pS3jEJv+7UAg+aPlDyCGa60I6KAV+8mSPlkBBbFc68uiCu
 /sflE6tfX5jN5FxEBxB+ZvPc0XDwHeXMKbSqu2Ew418Liz9sKJVJ747JvvmFr5kkqcF+JpcCXnd
 vq3FvoEy0o+3x3Bi+cuNRZBECUa2B+Pm1dECP+Krf380UjhkXHjNg5FlYwDkcsSecMD9XmDqCPE
 h7WCAnTcr8qCG59jh0QQwAPDm+4B7XVtpXm59QgcTr+16LTh/jqr8Ak8ScQGIzplxb19rXhdFcf
 4BBOFXsJOP66dPIiFdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240104

On Wed, Jul 15, 2026 at 07:39:55PM +0530, Vishnu Reddy wrote:
> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
> is a new generation of video IP that introduces a dual-core architecture.
> The second core brings its own power domain, clocks, and reset lines,
> requiring additional power domains and clocks in the power sequence.
> The current maxItems constraints for clocks and power-domains in the
> common venus schema were sized for platforms available at the time of
> authoring. The glymur platform introduces a dual core architecture
> that requires more clocks and power domains, exceeding these limits.
> Raise maxItems for clocks, clock-names, power-domains and
> power-domain-names to accommodate the glymur platform.
> The glymur platform-specific schema have fixed constraints for these
> properties, so the common schema only acts as an upper bound.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,glymur-iris.yaml           | 255 +++++++++++++++++++++
>  .../bindings/media/qcom,venus-common.yaml          |   8 +-
>  2 files changed, 259 insertions(+), 4 deletions(-)
> 
> +
> +  firmware:

video-firmware. Please follow the prior art that existed for venus.

> +    type: object
> +    description:
> +      Context bank for the VPU firmware processing domain.
> +    properties:
> +      iommus:
> +        maxItems: 1
> +    required:
> +      - iommus
> +    additionalProperties: false
> +

-- 
With best wishes
Dmitry
