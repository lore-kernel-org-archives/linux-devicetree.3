Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61573F58CE
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103803; cv=none; b=Rw4/MsIhgczsmnRKt4pvwYFxCbQV1JG4S3E+c9/Z5l2B/IpljBZMKj6FA6QRQHyR8nbPChNWW0tvsip3Q4deGtn2ByRGS/nbsw1SQgfP11acoeKz0uiXWTomS3y1CvNxhWKck1oNKAE0GlQlMapC7X5KwJGq5RyCVI0KpzIQkLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103803; c=relaxed/simple;
	bh=D+JxwENoOUj3iS9Ow5TGib5JfpQ4/E5yu6fQWqjUhSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a38MQ6/Kn5sZAXhS9+x+IHEKZk8zwxzCRYleNRbBnViTJZtT3pnCS4JhwDqVj6JATXUpbEUl0Rnz4fhhhG+lK8HXMWI9Wr2rTRL8MN2AWgIiOpHVbvKH8OSwwVG0K++lwbCMeMzW8HqPbgVo3Zs+PZKoZCJcMutIkSJ7l1+6MZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ymdn0rOC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+1TvshE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ymdn0rOC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+1TvshE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IA8U782091009
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G6hjDl458fg1vZmi1jXkcPSC
	R1vUSBiQ5TtnFePeUdc=; b=Ymdn0rOCHG7oKgKuxMp8IZLFMqXGmaMdnTNt9X1l
	MSlEyPIUBdbmL22N1kRTDc1HHWhpBLGSnvVtUr3Gik63yH5Ti3gbtbQTlSuCgZoe
	l473jJhjcM0ZUPvDG3rsLBOpQuP2eRNrHqsNdvd5air7ONkUfy5swWiXsdjjWLnk
	1yrkFGJ0+kA6+Wnj3N+J72qROiX8vtMGsWdA5zhtwh9UK70YmcZS0OSpqGl8EZM+
	pwc27rUbzsJz2cHmcjzYn6bWic2+8qR/ggb7sfyntLuHS7wvUeH+giRqBJiIntTZ
	SyAVV/Cw+75xTgKX/tP/ZK7R/WqsOjNIvLz3G6aJOCy0UQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpgahw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:29:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b458add85aso23905445ad.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 04:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779103795; x=1779708595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G6hjDl458fg1vZmi1jXkcPSCR1vUSBiQ5TtnFePeUdc=;
        b=M+1TvshEOaLD7uvSKTGN9PhFHxRXKKlE4uM4gZgHzCYenlxAIPYdHixvn7cM+ugRoP
         f/H8ku9c1YZaz/z97bMzBIBN0nYyDYA61R6/7RPp7ICaUAr3kfPSPinVYKrFJZgeihap
         wDnKJvp/k66BWD06LGxyuYyCqMYMmMY4P+oyQRQc3gv43UXruI7/xdT+44H9lClRehBm
         wtw7DiP2fsYBdFVq+r/MaUe1spoUj/b3bsw06pyQAennI2R/U9YXCeDzSmT/q8099GMo
         bRU9QsmlB0tPymONDemO2Ownh11JJQ9/wn6TQCHPFkLXGVfdPdbNRjR1Xb1vYzNBO6La
         OJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779103795; x=1779708595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6hjDl458fg1vZmi1jXkcPSCR1vUSBiQ5TtnFePeUdc=;
        b=dBpeUfyIZqkk60QZ7PHPvN6Uk7powojGp+pCsD7v53iuHt/79YuwZwbwVtFCFgsiLr
         3qbEqNKg5cHnCGmE+VWl9NxFS8TCrc//uwRNgLm9GRd5w8npB88roTd1+JVXLUC/DotA
         JlFN6QqYrSqVYE+fPSIuU/3TzSsxOtGmftcW6NgiZoq2FKCQXbVvdfxJggFO7wne91Mb
         vd6QPEPvqm9JDhGnZXGtLf72iuC5fLbNpSP5JyY8sOveX8c+1w5Q3ojPNKzakS8uy2Po
         58WGAuqD1p6o5XJ+POVftWgAbZ8RWa7/gEMzlO9VnD5oi+WThNZXSjDoaT8og0bEAKz7
         EcDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZuWpjBqOcQb+YH0b9uxq74knEqQLFK13Pw8V7bMnDLXBwkkFCrZ52mmRTPVlB9XJwg3t9LtCuz7jh@vger.kernel.org
X-Gm-Message-State: AOJu0YwICKjKhxSh2+QRz3q9ZmZQjy89oTLH4trn9GmjjhBQ/Pjtfkfl
	L6/yHwHtrudI2KGMgiM970hpR83U6Ns8nRhGC0AX3o2rOeO6UIk0VmtgM4vV7nWc2jUke9Aa7KJ
	oCNGyYB2Zvrwu3ujrnk4Xxv0uW+ZHFCjY9IiUzSR8df4RoZNXwtB5dFgdG+A+8Ggui7qQUtwZ
X-Gm-Gg: Acq92OFIpiE1KBy7sD5BAyELBO74CkHP8ukueFmUCNN0KL+Uo6NefrX818twzFn2WpC
	cEjIIUx12cbcV/cQR/1b8FyixDb3MQTXF1vJUb1FBvdqbUkY5ayKbO19i9Rbw36z8hSTHLcO13n
	UwtLrj/7GjbmH2fscByqyBWo0MMGTVrcPW8nUfA7Sp5Hvvm1ZwG6WWNKzjR++4u01GZIqMeK/Cu
	8nej39HeKWhs9Yyuim4DjkWE6iHe2PVhX4OR0Srku0FlCKFw3Led1GE3mKsCZ/CvAwK78rEE1Uf
	BG7nn6XUpkaBt98RSj0YRD7QDIe+JTodBAiR/HULH7iDxR/yxMXxGupTxaEjn9T3XHwY3x9ReLk
	QliPrZDjGN1unRGn5k07AFdhYJR8sP8B6xEmHCbk+RA1xBn8G
X-Received: by 2002:a17:902:d512:b0:2b4:5f96:184d with SMTP id d9443c01a7336-2bd7e86c6a4mr167038095ad.5.1779103795508;
        Mon, 18 May 2026 04:29:55 -0700 (PDT)
X-Received: by 2002:a17:902:d512:b0:2b4:5f96:184d with SMTP id d9443c01a7336-2bd7e86c6a4mr167037715ad.5.1779103794907;
        Mon, 18 May 2026 04:29:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fc2bdsm187835475ad.63.2026.05.18.04.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:29:54 -0700 (PDT)
Date: Mon, 18 May 2026 16:59:49 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interconnect: qcom-bwmon: Add Hawi
 cpu-bwmon compatible
Message-ID: <20260518112949.ui2gfxvkjdmgc6ks@hu-mojha-hyd.qualcomm.com>
References: <20260427182255.3649922-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427182255.3649922-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: i24C3UYustT-6Erp5gOYec25UDw_zL25
X-Proofpoint-ORIG-GUID: i24C3UYustT-6Erp5gOYec25UDw_zL25
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDExMSBTYWx0ZWRfX9Mli3xSD15P2
 ahIvd1eaQ9mJ6tA/yPvOil/bNUXzXR+adF66QgFEQurc7wze/aSioRjuNKxJiQ92WRyg8e6uThY
 xoE9FNsJJCan6I3r8Ywrev+dhV+iqTr3oYaPV03QurVYTsS5INiLncvis2BI2VkTEZ3bSeg9hsC
 tc5ntZCtdfbSkAaro2xP3p6Dg3R8JRa3laai5r5mwVyrcR4gtEXUClSgKX+MXmkpGeRa27FSWUt
 NDa51WK6NNukzrd9ZQ36YWnvIbdcIgsKnQklsl9BtoeEoeqWnPZCyPN6LLs8xdlErP/VKDYrxEG
 vS0I9qqJ4T7dprbRzCTSYYNZ/ABRpbsEN5nyoKQIyO+51te17FFC+PkLOn1jhk7+/YUBz3QPbde
 d5Ar/cWUj2C0CmrZYXJOH385K3UJPy/piuOML4GqBWeIYa3SXW9o0bDB2qJQfk0peVOdJQ5GbCK
 jex5Pl3vSzkmufY44VA==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0af834 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=O7OvwgOkGeDt5fK5py0A:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180111

Hi Georgi,

On Mon, Apr 27, 2026 at 11:52:55PM +0530, Mukesh Ojha wrote:
> Add the Qualcomm Hawi SoC compatible string for the CPU bandwidth
> monitor and there is single instance present globally to monitor
> the traffic from CPU to LLCC.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> index ce79521bb1ef..82b1d94d3010 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> @@ -26,6 +26,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-cpu-bwmon
> +              - qcom,hawi-cpu-bwmon
>                - qcom,kaanapali-cpu-bwmon
>                - qcom,qcm2290-cpu-bwmon
>                - qcom,qcs615-cpu-bwmon
> -- 
> 2.53.0
> 

I am hoping, you would be picking this., let me know.

-- 
-Mukesh Ojha
