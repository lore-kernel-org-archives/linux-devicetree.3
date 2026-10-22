Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660697;
	b=MjLsnM5Ebrm0n4RyXfbc8RsvWhqZR3w6qQDIlzta/WQ8LbuTVHzIdkF7jSIzFkVOI7MU
	 oJ0wgvzjbf669noxaxj3HaYZniYreMS0UN0ywtXzBEv+t5N2WHamIjiOVmVWCMkpqCXMG
	 zHDkbqGRS/lLDKIOSkrBFNd79x7mNuWwXLVAgVh1Oy6Pa2ia/Ho+AwspOKe7k5y3flait
	 XFALUHbkAqHXE7vT29sg5CoktccrYzJBDNuB81xdrShCIj2TDRRFjHoyPM+mIz53o+3v5
	 nG9dXE92mIewal7PKHjlGXSiaPloIQCFLPyNI+OrtCazHFAa973g9pckFPIJFW/JA0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660697;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=749+aDeQ/ZlTlRoYy1DcYQ+Op5jDghh6/V2zXfQ3V8c=;
	b=kGiHWNWnGBeCicqazG7WPqLg+CypYZXNWMB3Y1vWYhF3IuwVxUyJovIPiVRN43BlJcap
	 459VV4cTuvfY6p0loW73whA2Gpsq4dNZlTE/TaThQ/a3DP2HnZYfZvpOcC/SbcO2SMii7
	 NkmyEKylKwEmZZOgR2UOb0BUhrdyRkfqpscdKkAwXEHWgyvucGZIPau+fQ0fBnqNbjvdT
	 jjcAWUTnd68f/Qy3RZx2r/svAWAOD2WntYnS3HDXrVoHedFSVUodA4oncHJCS3QcVTy8L
	 36NjVAcauvg1j8msu5kl6VlzF1gX8IPT3ppq86groxwW5Qd5Vboc3z7tajICNfVedYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OLcLFIMy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adFFD+aG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD04606A32C
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DD04606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OLcLFIMy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adFFD+aG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M703qm3076705
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	749+aDeQ/ZlTlRoYy1DcYQ+Op5jDghh6/V2zXfQ3V8c=; b=OLcLFIMykHoQV4I6
	CfMEVtii2eDc14lG9rp6YB+ThfuEw2Gy1krKAUtqGdRVLfBXVgM1evisFtdLtvX3
	7/ykdGjH5dSdKgNQg9aiar9wSgNzSwtmTmWJvQoW6HbANaY4wHvABxNm7lfd/TOQ
	Tjz9Mmqsr3zerHv/Jb3JNmIycVfuvgi1W+Qr2uOPpEbMe/fD9qZTzmLWIzS4ydzX
	Qse6Zn8bL1aTJ0hRk9b/Udt2+asfFJNH5vrNJ/VIZYbJLS+1D7jxW1Sq6A+zzN1P
	poHLBdl+DhH/BqRYDAV6FRdZxZxJOG/1i9Bt917UgRh4FE47DEM5JFG22wgex+K8
	oktkJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a1n6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:18:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so44026585a.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660695; x=1793265495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=749+aDeQ/ZlTlRoYy1DcYQ+Op5jDghh6/V2zXfQ3V8c=;
        b=adFFD+aGejmu2iZcLQZ7oWPqFT3J7J1xTCpMZlouJsEu8m8JyhH2/g1rKcyolVR2Jw
         lFH85OBxxEqAeGUx4426L0TlR4oz/6eNWkQWjBAvl2Jl3ZvctNHFmZyl3ofCbVAlOcbS
         ++LxnKvyMO3Uhmgxrz340hkikSobH7aexj4axzFE5y3tNevBFqzRVDxYH3rLja9V/oYw
         vFB/6++BlGR8hvsW5qsp3/UuW71wENzgLhMDIkoyR2cQUA1tUXBeE6Wh2YU9HBkQte2i
         wJUgs5g2M7uGbIkYVYpqnRY2FYUqZ/oC3rTOA7GN2ZnRPKu1AFD8vRxAtP16uTDEJtMd
         4pyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660695; x=1793265495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=749+aDeQ/ZlTlRoYy1DcYQ+Op5jDghh6/V2zXfQ3V8c=;
        b=f7XqeWKLugiMx03Vb2/P16Q1Uc2h++jt5TPg+ocLAlfglhy12OSzJiPSiPx+TivMeT
         3RKdTXLYBZGDao6yyEHvPhnRcY5WKpoaD1i9hstUDDlqxPBMfoxekJKEd947d4HIs3PM
         /K0VXlrMfQ4tds5N5oe83kZyHs8lSqrbF8951geKaH8kCewabJpb724F5oWyMtL1Nq7i
         8AtIA4sN0h5lEnsP3Mpy1FYZVf6qAmtyu9h299ArK67pGzsVjddr2OVVGAbM1/B5Kc/D
         JkOh9E6njcDRmnN1/HHtg9cEbuEaGSR4aBtm4G4BTWDUfOysTl5bkLk2MrWrS4KD3fPT
         BEHA==
X-Forwarded-Encrypted: i=1; AKwUvBy+aLiSzBlOB/IMBIkm4Wmo6LMQBBzhbl5AiTGehGmZcBkeHXVZQwiKcsYVe+VpAP/5FK3jKQ+cxcmT@vger.kernel.org
X-Gm-Message-State: AFq9FYKl0R9zSO2/L5W9GAcfVfMAV2hcqIjt6MKv3rYW0+uWiCJjxvzc
	CO6QYTOc56nM8PyBTj3licuRUJLPV1X/C3XSABBzVEYbkLMmm1K0yfuUDcSBpxN+5XHiM6psiZn
	egytrVZmBc2t0nNrMVvSLg8j9mqKdHWY0LOnDL2ghMvsYBa5LIwueAwV3BgQqXInF
X-Gm-Gg: AYBFou2tfWdQ2X542JIJn+oNmsFPZDNX4uaja8Yabr5a8AFUHxJvmGdUym2ikMUCyMx
	WdsoZ8bp9sL4xLzvZ/h1qdEtPALkXcTb3cEzvm5b0rjq/mROfW8RNb89hSGcKGQ+rMn8yfH3rIX
	nUt8yYIOdUih69XAc/IO7kQn7l81X5hUdDijWWuUgUYSxWhEqmcZW+oyPVuyI0qjRz6ncsUDES+
	gfV9jOSyBW21wyc3J2H5YLYGJg5NrXAQm23eu7h9DBTTm+T3tI7EDC2TEpdWTdL2dhct3vAFEXF
	SqnwBPFUNXvi/xgctvwEXLBd9zBskCEADPxZVcUJrq0vf65402VVdTPkzonswUXIsqG0iTuzb4A
	LLONXmX/Nfy9jwXaYzKK4MA==
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr1016265285a.6.1792660695072;
        Thu, 22 Oct 2026 02:18:15 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr1016262385a.6.1792660694557;
        Thu, 22 Oct 2026 02:18:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1eecbcsm86476966b.7.2026.10.22.02.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:18:13 -0700 (PDT)
Message-ID: <57720aa4-4e46-4406-be78-06084b55b086@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:18:11 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support
 for SOCCP on Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com
References: <20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com>
 <20261014-soccp_driver_dtbinding-v2-2-09d9c1378e9e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-soccp_driver_dtbinding-v2-2-09d9c1378e9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX2wFx8jCeMWoh
 1WEFT8wZfnWxav+N2XhVh3z1u5IWcNO7OW0yni2tXSetDxtYVZLlUjdTN30z5PqtEfcfsIeWZuv
 XtU+sSwTjw4/314sAGWs7NvqPjN2KAGIzrHmR6hLAt4oqu+znnPfHIAVBOSM7HQ35SvhswPnBhW
 oObf4B2nn3IgZ8m4iLiiBqBur2FlgIlN8sGcHN52wnIis036HacQvnCx5FFtyZdB56OxbTr2HuB
 Cx00309JXs4PuzhW7zXwmnPJ9SoCfnnV2FV9jWun9M34+Y1AZE157hQnJwoH6v+LkoQRJXVssQt
 lBjefT0kuJ10BVmq665hXbgv44SpV/9F9MWBTXuWZwhACXqPhZVKNt7cLhCr9vB8HMXlgKjECZn
 44LJXOOJJiZrMq+qJfutC7dkzS9HjSSGh81oFbSsoBHX6BxoI5qG5tLkN0U2hBe2IvtgvXBOevM
 KDmfgXAWZKY70qqTy0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXyxGGJCvD6owY
 /thaVpB4ptbkXEuSpjzML/0lkHWJUpvu1zGhyyQbANV0t1564om3h+3IloDQp4elvF4CRilbJXZ
 IRggF4/qMtBA0BiF1e3HdU4dLBMxG8c=
X-Proofpoint-GUID: eLZr1CCq2CX2vBNCsLSIgBmm0yhJRc9n
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad9d4d8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5PJkfhtApdRqCJaq0lEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: eLZr1CCq2CX2vBNCsLSIgBmm0yhJRc9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 10/14/26 1:46 PM, Anurag Pateriya wrote:
> The SoC Control Processor (SoCCP) is a dedicated control processor
> that handles hardware fencing for display and other use cases on
> Nord based devices. For Nord, SoCCP firmware ships without a
> separate SoCCP devicetree image. Therefore, it takes a single
> firmware-name and memory-region.
> Add support for SoCCP PAS loader on Nord platform.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
