Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1863BCD2E
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780553780; cv=none; b=i9uZ0EDNviWVKdEw6tRN4hYWBxNWcumF0bM7dy7HenrbLSENMn62lXwFZDTk0l3cFMeQzZzvv7ZWDVOu2jBqrFvYqSA+PiJ9Rr87Hsu35/5+GN58dAXM0FyKtQ/EJmYL4dxYo8KzkEFOJ1/ULcD+kxZ/pFMC/eKnr9LjtIaIdvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780553780; c=relaxed/simple;
	bh=LAo1gykKBlyc6hrnwCyTN9ZSW8quXPMknkJE2Y7GFkE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jxLgK/pxQkoFBnRt/xhti3FQJASGEq/SQ18eMawaPJ4EidqAf5m8DTa5boOVKHxZo2nx//okPByvHkL0UJ1Blk1cynyoXM5eu6G/vDz6CsGVx5jJPnBNKp9dP9Fs3fSvTV7kzlfab3CRjMcLWq6OpyX6k8KIxJYI80GHiQV8d/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9ogwoOp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DL6c1GY1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9ogwoOp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DL6c1GY1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543HkvL3233912
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 06:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PltNnGhhKDeL8iIccExfCGRq7JR/z+5HhaWbWWSvhQE=; b=L9ogwoOp8II6c7CR
	yvh2QDGdz75nuBt+xCtGVQ+KwA9amMfAh5ie9HO04IHljwQgLvI6Ag/pWR9GUhVw
	S20I99jltULEusGAaFqCPLarQyPYk/h+GXIZRcM7YDaZqCZAY9G1bkPzbZLhypNH
	UtyAEzYK5E8JKo/jyJY8mJWFLPhmo99tAx3+HD3S3dnnMXNIZ/l8x5UH05FVUKzu
	GpvOlKH6srt5Driy7iQc/CgBUVeSC/m4zD+A4grdAYQ4/7px44NmiHBTqngVcdVp
	4m2S+s5uAQpclDgHz1zUDG+xq+sBC9hc3Lsex6s8bbE5tcZC+K0aZFATSodPf1P0
	erA95Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s29a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:16:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36b934a336eso277149a91.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780553778; x=1781158578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PltNnGhhKDeL8iIccExfCGRq7JR/z+5HhaWbWWSvhQE=;
        b=DL6c1GY1PxE9z0NYLZdVL05WT/0bQhq9wmnXrzcr5OgpUjMVWkxKqt1Eg/OCox5Ae/
         9/dWCWaZSs38BGyLt8oyeQj/E7KaNAN4Shl/Hx2QfDbwhlJBFWt2oiw9zHWFdtLrfQtJ
         y62iIrIuRy//T23FMht3ZURevQgKaZgEpu91oNypD/cmW2u5NW9TJdQnKMMY1EJXJ1tU
         dSWE5PfdW1E9OrZCBsYBzByduiM+287YjdIntD82S+G9XAon1oeojieUWf60FXoNGo7r
         hb8rOQizKJJHYedtgqk8WpcLpEIFyDvf9FoIy6Cb6c1scwH6aemi8WGFdZoRSXWf8uKO
         BvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780553778; x=1781158578;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PltNnGhhKDeL8iIccExfCGRq7JR/z+5HhaWbWWSvhQE=;
        b=E9gVpFTI6+6AwaU0HkaN7BozTskORGUVZbVhV2jA17MxwVqW0GgAwmW9HTzZRiouVR
         WDjjyHMIzRs3DxTG0EH9lbXCfF7V60MYM4QdXzz6qGS74qKTde1kKLYWIGrriPInlmpB
         TFelNxlfHt/g6dpHPyTBcBWVN/diUODaCsG2zIf0dwPIGqbTtjN5CvCK5yw2vb//loCG
         RuOZnm+jNcuZRNH1sxB36M1MSZrkUL3naOVFcM3oN7/EaQ+nH4rKDqllB2Rc4pHEavaD
         hWLZfKaAefPH9DRoL7iw2K3i1HU0G1sdfXfFy3w5rtu/h1gACRTfZH9xqFmIWtXEmGaD
         natA==
X-Forwarded-Encrypted: i=1; AFNElJ8qPGo8XIK14FAzVjIEuQr1EeMM8WctasyzFmuF2zxmBNyTUzi4w8H2QppIqczBzJF/6MSSDzOTukgD@vger.kernel.org
X-Gm-Message-State: AOJu0YwQQR2GUeqQi3rQ+vl/3ZGf5Z48YzgGT1ceCMpyMvIo40SImxq/
	p2HV+SQhQS0yUtfQGBlK7SHP9JIxrRjQ0P+i8a6cqiG/NUP/oXe4+uaaX0Tm41L0GG/uxWCIO5G
	ACs0BuitEPTq3v0sjWSqaAcJm43e4LwgV+S9AQRDo/mj4Vji55h27zRPAhiXkyMMY
X-Gm-Gg: Acq92OEXAewFHcV1AJzE4NMGEHPGnNkDrxVr8qIW5vgPrL7zenC7CgpxtprQ+zIzdst
	68i4DSjke3I/KqjBAHvEd/Pwdues7YOFV54fIn5v100XvsqhLinfDlPljqBqIIqu/eRwDHzg6tg
	8VyZc5woshzV8vnhf23slroC/DcHqTemitZ5xOYUj/6Tcg3YWmzAWxj7nhToanYKBVGwjDelxkz
	L7i50/Ax+FWNQ3ggSj52Zp1y+zRSG3s+8UlJF/mVUQKd39VOOozwsQ4bkOALN5zoZYqpXCVQKs1
	078DXVBUixxA8R0NoQdMR6lK6BkOTz8bQtxKbB6KSEkqX3TBCIoCAPm4vKsm3be1dbBIkCsQLlE
	mCFtKyu57oTnpvKsyC+DrC0GHWW4n4eSP5jcWhXhIeazA1/igxayz96NUaS0oDAS/
X-Received: by 2002:a17:90b:28c6:b0:36b:8baa:a683 with SMTP id 98e67ed59e1d1-36e32a430b2mr6139773a91.19.1780553777536;
        Wed, 03 Jun 2026 23:16:17 -0700 (PDT)
X-Received: by 2002:a17:90b:28c6:b0:36b:8baa:a683 with SMTP id 98e67ed59e1d1-36e32a430b2mr6139735a91.19.1780553777056;
        Wed, 03 Jun 2026 23:16:17 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827e6sm2477908a91.1.2026.06.03.23.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:16:16 -0700 (PDT)
Message-ID: <a8fcf4fd-3237-389c-8552-addfc2a97dbc@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 11:46:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] media: dt-bindings: qcom,qcm2290-venus: add Venus
 on SM6115
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-2-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515-iris-sm6115-v2-2-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cNQpfpdgdTl1_0sVCKAdzvRN7u7cl4RO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1OCBTYWx0ZWRfX6TVIfC/bDDVl
 n9OjrC6AQO8qLSL4wunxz57cKtpVS3rKGHXzUPcCZ7t6kcUf/AJDD0Zls2/NSfL3ZGWlD2qs7WH
 MzHVd4+syDOSAjwZDs2vMqLNZ4cJ2qyiB9RKXw3tsSKDxmXng24QTj5I8NGKNaQKDh7+Iz1GKkZ
 ryym+fwLzS/fREJnLWQtt4lwYSAgk5ZLm+P+XQu0qDDIcQencvCKoyGac69Bg8i3G6p1Aw3ZpHp
 aoJ7ckt/vUCK/fTbyOc4GSeyOTk+iPfxJZVtq9k4jRMlx8Gq33csID24h5JBLptyjVZUOdDvYSe
 Q1UdwMsaH3UqCTYWwBGVzfMqiCs3S0C8Bg9T9wlcZIrsoh1KPrXuDhN6JNvl99/vxZNyUam6hsv
 6bRSxEcBwIe6hDTnDwxtMkzLG6Pvq5ux2EEQNnKcwpiX34sswVxIpVt0Jt1GdgPB9ei8J1IZ4Jk
 ydM+Ivq4H5wQmQo/2fw==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a211832 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mmEirQiFKNK8A5MC6IkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: cNQpfpdgdTl1_0sVCKAdzvRN7u7cl4RO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040058


On 5/15/2026 5:29 PM, Dmitry Baryshkov wrote:
> The Qualcomm SM6115 platform contains the AR50_Lite core similar to the
> one found on the QCM2290. Define new platform-specific compatible, while
> using QCM2290 as a fallback.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> index 7e6dc410c2d2..ab4c56ee9182 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> @@ -18,7 +18,11 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: qcom,qcm2290-venus
> +    oneOf:
> +      - items:
> +        - const: qcom,sm6115-venus
> +        - const: qcom,qcm2290-venus
> +      - const: qcom,qcm2290-venus
>  
>    power-domains:
>      maxItems: 3

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

