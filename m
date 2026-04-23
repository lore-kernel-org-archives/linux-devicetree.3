Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D923C4569
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776942428; cv=none; b=hVR0bykAN1W9Uz3o0fhRGkBoZi6WwzwLJrl9ArqdViObUrxfSBZMJBNJcoXJGtdLZ2E4WF1rhM0tvri6mdBE6AhzwLux6DwKVoEX/uFBbec8HRyzUJQd9LyddzHNAFzN/WmoiFK5Ujr/2zHOc2iOnr128c2Dbp6lq91p3i36br4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776942428; c=relaxed/simple;
	bh=9C/kWYxYwf3WG04MyX3l/9Ak/A3bEvzfMk1jFe44vn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usEcxQINUWU4rnkrgZCfH4Bg8FuZDOm1obAP5jfSQDemJpiRv60Gl3G0xrudLqDNskCUJyVO8f/t/qlov9PjklU2pbzCEzDTIqZld++kz0auR7AYL/K6WOsniKK0WcIENbN8GlyHOrfpQ1I9DKlpfgcsIUo7ZoKGJUkpSwTS20k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5/tjeRa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXtT3NQ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5/tjeRa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXtT3NQ/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8tr2K028822
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AfSMA0QbucQHqV6snfKtLI8N
	WtAMHekaj8A15WhgdBU=; b=k5/tjeRa32ioBD7786omohP/URimuJrH7ixem7Zg
	35icic7FDfemKYXv8Z4aXhzeBFC9o3/zO2uvMwX8D9UHrrqHLtuJ1MJ0jOgiEam9
	jIjs2Cepy3aiC0iNr5rTNE7qtdkWqtPanflBf/C6Ua3a6XjyjxV/cGUj9PG1fTul
	/K8udbo849GrUu6Xk5+Jupcb5AViGG5RJsm3jrlQsORa7rlxiDTBPjdU6RXquIu8
	DtZfXOWnMAd85yKp9Kp5Yn85FSwTzErquzi4W7Nw0IpIo4DwMAtHxi4vyRzPV4bG
	kQv5K/7n3AUR7bPBneoCPa46CpDPgpZTMMWcrc4PPTLdPg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqdjm15ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 11:07:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0ba59a830so10178457eec.0
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776942426; x=1777547226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AfSMA0QbucQHqV6snfKtLI8NWtAMHekaj8A15WhgdBU=;
        b=BXtT3NQ/wtJ2IrW2xc8hnJAPY/qHzbDR+L545Ppw0vPuTBIt9RFTZNrmoPqcoSgCFb
         zaKsT6+2iqiVWF07q3PKRrU72NwUxuHbYzQRBlElvZzo6re5X5SLJTYKu7CLm8S3LfRI
         jvwJkCkDbnXK+xRxtiEJqOgDq9PsHoNB7loCiXS4n2zq80j3Bvkb1zfOlV7hxs1DYmdc
         Q1gsI1+pvs4OMbOkin7IlBZ48Qha5ScEE3H3zY+MkIU5W/FAh/oTK0lPqvn88lNc4/Ac
         lmuVpeJJcRp+TSUGY3pI43Xeds+L2b06HI7U4LIsKzq42386lZqKRSIrCa4KhkIWuAS8
         HlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776942426; x=1777547226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfSMA0QbucQHqV6snfKtLI8NWtAMHekaj8A15WhgdBU=;
        b=GcZUcx7i05wMg0YfC5uUS9z+HDQ/Sbt/atyBZLHvKMw+mWXslAXY+NFiZElZhQzdQT
         6KJ2RiY4jvAEKtCDwBO0MTZIBepGjDp2JfbqxTsuK2hiHcoF7gRTSg49NoRDDm0J1WUx
         kzllr5wK18FS2AP0qfyjM/GMjFI3XWaOZ4KCHdaVfRaI613l8qu5uTYkDQd8VgebZdzk
         NFvj7yi0jzwQFe2xu6gpsaMcuimuq9dsr6Kg5RjTbeJvqP5k+2DUjLT+6oK8ccYvg7Ng
         5EMMm6VX/oSVQ3P0tkiqVDPexKaY/zqYLYPQVjzZLUmlzB9PP1V6q09IHznryRiN3XEp
         cm5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9OtPvN0Uez575xWbZXkv/e9H9rG0ERkhUj940DoPecqa+8o0Zgdna/Qh2DtM94aAl5yErkvtmZBBxK@vger.kernel.org
X-Gm-Message-State: AOJu0YxqcGksxg3g+GhFgmR/6fRBFHAOsARJVLqhsTLrBYlICdtIRD1U
	0w1YK6wAMBIHhn2yfJMcIt37GzZxWtAUuG3dNtU5pX/97yGefSpKI1cvUK8trfJyK8jO/tEczwo
	jg9laMJOy/7hnqzEXhGu3DhAloQ15HVRilKfEHwBvFS+kaTpaWfMwy6kYpq6xpqlC
X-Gm-Gg: AeBDietrV3yhDtSixMr2E+uAcPXmOml8Hp0QVRGmwpOELOp+nTs9OwTzmpXSxNSDPE7
	4gasm7v4Md+PRe3VOON8ckiU+GqWEH2GbYFfZJVcYQ9n1neunaieCJeQrfOIesZIWZrrQBex2IC
	TwMEdLhqQbVX7mjjh578ZYf1QLwRgrU/q7GNegnYkOykg5mwWT0g7swAgfTmf/8L6EvN7MELG5d
	VO20hiCWZBRU9MbfbDeG9F545KKt3T58w+rGwy2Vc8wQ5QzXHBtQ0Z8ZSiZUcXpUB6qp4ZSECtY
	GDc6t6pd1mnGEIOlaZ/Q/JBcsVxOvQlC1IRZnvv5S+s7YwEOl7G4ul3vxVyWeujYtl6HHD3CBZM
	I9xtGD3aR4mD1Fof3vw2t1uTRj2yGJLD4F/BbYutmMyKh68Ar+I/nCyplystmAYw39os2+mToup
	g=
X-Received: by 2002:a05:7022:6606:b0:128:bae0:e044 with SMTP id a92af1059eb24-12c73fc621dmr13828069c88.30.1776942426376;
        Thu, 23 Apr 2026 04:07:06 -0700 (PDT)
X-Received: by 2002:a05:7022:6606:b0:128:bae0:e044 with SMTP id a92af1059eb24-12c73fc621dmr13828039c88.30.1776942425654;
        Thu, 23 Apr 2026 04:07:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbe78e12fsm4439640c88.15.2026.04.23.04.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 04:07:05 -0700 (PDT)
Date: Thu, 23 Apr 2026 19:06:59 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: qcom: geni-se-qup: Add compatible for Nord
 SoC
Message-ID: <aen9U_3jMRagJwgp@QCOM-aGQu4IUr3Y>
References: <20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EZn4hvmC c=1 sm=1 tr=0 ts=69e9fd5b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hCYcIqgGm8RcXDvY5OYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: _IHcYRFD1rBGQYWGZ7jY8SPHRNpc1BjF
X-Proofpoint-ORIG-GUID: _IHcYRFD1rBGQYWGZ7jY8SPHRNpc1BjF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExMCBTYWx0ZWRfX0Q4mDJCY3TKx
 SWIC7RzO6lbUBGAVs/ErILjLV2OstPUmre5tLrBw1Hjli4JTLF/8wq6y1xvgs1odTVT30Io0ABx
 OHjRHN8QqxgMHX9eNzhGcutncCnC0Wwz7iSHSsnxV4VkAy5tHh9Qb+eSdrl7J9afneh/9Pas2OA
 W+dMQeC551ugykazUWv51yk4NdN0CSOVdVaF/xFb4MeMrpbc1BBWJzxwdEY6cP4XNT4p7Adf1P1
 +qHnrTJekrjyh57LFDpctiD8z4To25hFWsWQ4WbYdigeTWqtzXQGvwkOZucktwqmLFHj1/CvGDJ
 z4S98mcZdT7Bui0ZM0AvshN3JutUl0uLkx9Y6uCbDTRH4sr+OO2GgsWKz0PkdnQsk/IwMiAhvTU
 Ikmz3Cx72ZDtHAOHH3OUFgckC3f4N8KVsTYEuSmWitDu7fXitfQTZSOed08aChvBPvBU8LKSxFo
 Jn3KiaDIq6c6vz69peQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230110

On Mon, Apr 20, 2026 at 02:44:01PM +0800, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add compatibles for GENI Serial Engine QUP Wrapper Controller on Nord SoC
> with fallback on SA8255P compatibles.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml    | 20 +++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
> index 352af3426d34..d73f9edcbbdb 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
> @@ -19,7 +19,12 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,sa8255p-geni-se-qup
> +    oneOf:
> +      - enum:
> +          - qcom,sa8255p-geni-se-qup
> +      - items:
> +          - const: qcom,nord-auto-geni-se-qup

AUTO variant of Nord is SA8797P, so it makes more sense to use
'qcom,sa8797p-geni-se-qup' which is more consistent to
'qcom,sa8255p-geni-se-qup'.  Will update in the next version.

Shawn

> +          - const: qcom,sa8255p-geni-se-qup
>  
>    reg:
>      description: QUP wrapper common register address and length.
> @@ -67,9 +72,16 @@ patternProperties:
>  
>      properties:
>        compatible:
> -        enum:
> -          - qcom,sa8255p-geni-uart
> -          - qcom,sa8255p-geni-debug-uart
> +        oneOf:
> +          - enum:
> +            - qcom,sa8255p-geni-uart
> +            - qcom,sa8255p-geni-debug-uart
> +          - items:
> +            - const: qcom,nord-auto-geni-uart
> +            - const: qcom,sa8255p-geni-uart
> +          - items:
> +            - const: qcom,nord-auto-geni-debug-uart
> +            - const: qcom,sa8255p-geni-debug-uart
>  
>  required:
>    - compatible
> -- 
> 2.43.0
> 
