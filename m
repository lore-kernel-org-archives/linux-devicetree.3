Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC67392C28
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263049; cv=none; b=IceL03HsS1QYdg4a08Ux5WAI4SRWyw383N9D+z67fwsCp85C725VgHoPAQP7AP+qiqzq7cR8eeMIZw4d7+iMpN1g4ZFKLPz/fl5IrM0YINWFD85vZC7L7psu3AYkR7L8h1DjW/N3Qody4HeZbRbi299b5galZy6yCfW+PZcwRes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263049; c=relaxed/simple;
	bh=ESQv9swMgF+A73SZiIV+mK+Zcl4cSN0aeDo49vaUpfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkR7xzMsNBz6eBcEhcR95QE8puFv6V90OPK2UGQ0597bcubL5mRzAaW7XZIirbGAJEFViVoMPnOcYcayDga7soqwTLesNrgrZ7uZlK9HuDLyhV3/XqZXYs6Y9WbdNa8NFGDRj5pXDDDOzsUKCoCsz2joT7f7cU6qAtDPm3+b3p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ml0qEZ26; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HPEUlz/C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ml0qEZ26";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HPEUlz/C"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NAlOxo2173767
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eS3W0Qutu509HKHl+odXAY9S/E4l//j+Ms9boQGWRs4=; b=ml0qEZ265+GEaV1x
	E8Sl+M8YDBpFj2z59ALVEPdaNaawHA2foGbqDhyA22jUD4Sx96+EXEiAiDzgAp2y
	8lxH2snVfnWAx+vyO1VXPPVKFaVZEiN+xkwCAeLYtlXn8fOAsOzc4LZBF+UZLpaU
	PLfOsxh+VYUOUXCs1rQi8QZB3mnzgXT52euB3HT0oTAdcxp8MdY0wsKQzAgAQuVS
	a0K0q7mz4q69pvbfL2XCdyYOQqgNw5DbUPP2LLxXc8xcShfwKDtOTyEICT7zLXei
	LRsl50Nw249aBE542Ll+2Bkwi1PDKq3J7uljTqcBf8BReYh19p2O+sxRW+/hSTZr
	M7paPA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8jxtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:50:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c8669dae2so25855056d6.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263046; x=1774867846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eS3W0Qutu509HKHl+odXAY9S/E4l//j+Ms9boQGWRs4=;
        b=HPEUlz/CuWYHtUe1e7jXb448ku0pVng7tAhNjz/CUx6jcUJlXyojx/BOuDwkfdwUMq
         5fR6oas8voOEA3vOqH9sACbiyQWJxUxcXaEqEiEb4xljQ8FMUnGowl5t6LW7M4lpJOYb
         CrJpRCvHgmI35z96wO2a/wej0tCc8eee7y1Meb0dM/RcMMEDrE4c/4xWAX0Dx3YaE8ub
         Dm9XTrMX+8vp6/ufUz936kGICp5iMDIH/G9iST3w2rFErooLTQWPP3DKtVzxWyoBjHO8
         oAsqcmgjTLi2+TcnVsDcCihKLullKM2OOYTXAW0+aPmGfFzOO95fAGXV0gN/RoookAbU
         oaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263046; x=1774867846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eS3W0Qutu509HKHl+odXAY9S/E4l//j+Ms9boQGWRs4=;
        b=h6VSKHHb/n+C08q+O5EXplYc1aCa04ZQ3hK5yBRMBOInr/iFJOBw5t6jvNITSYDGD9
         2fx70vbS3o/KTCIHkSumkGfwoYLDuXc6Mh7TlOpQg0euOjY5HkoZgaL+3tP9sNw+ddLI
         q2ODLNyeTJDml8zeCEKuG67VFZDDblDq4oBrVH9SqypXt+w/qv6JULRuemby4PlVRu4Z
         nXfi0PMyDh9Jv5ExmH59k+nMnam4uxG76cda7GtG6DXPShefHSrCxqgf16f4gbOzEENE
         53UtlRmTWXwYkLzVE3fZhostEAlauIp2z2DruN5oYr9v9ZAmgpM477X9SCX4oaXcvvHh
         Z9dg==
X-Forwarded-Encrypted: i=1; AJvYcCVld1ds8CvWfCIYCfOzIRjVotc1D7EPm8jhDvePUwSIg1VVsBP83/SoipJGEcl7an12q1yClY/M0evT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5LuIKaNAcWcCC2pJ3X3Ys1aRQalruAEPGE9u9VHPe3om48nKd
	hWEXlvUW3ATZI+em3BDE0/GN5rd0O7fLYNCwQnto8IJT/vcuNVBy7ugvZUkDqj6523eGWpS+es5
	t7QmQmAje5jhvod6lNwgvI6lCBslc/zaVHWk793EHU+0htOK9682lyMPMrm82DBjG
X-Gm-Gg: ATEYQzz8nWFsXrsbl58BNH6miDL2wy36D26aL13fC4CixbCdG7g9EyJybtgjF89DEGT
	8Im1lmRCNbPp5oYykYQwvm/rJG9hFbqZHyAl04uRLRKmuvFEIndXmZd97Mhm0X8EHhtlbi+fnBL
	gqslmP/cT1KamRfvXdx3EGPMYR5EO80IfW5SZjuX3eWbuMYNLWsg974PIs4PmXyl8Nv9Fwfd/kj
	/sorGKqJx0/ZqX/7UCsocojDHMKZjfqT3s3tA1DZmLchlQECISH2+ih1M72Vhke2xIKpqdNTskZ
	wjaKOazUCRu3AD9XJiAnqgIjjriimWjiaSfJJOwSOGHwoesTpGIqpRXZ6z9rq3NzNakRiEHTLgf
	zihIhYsDWT1AHy7wg4epKD+HZUCq2FbPMhkwB/NB4loDHHYrSnV/hsekT14kxaHgDQl1kNLkHLb
	liswo=
X-Received: by 2002:a05:6214:27c9:b0:89c:4aae:408f with SMTP id 6a1803df08f44-89c85a3e99emr142461506d6.5.1774263046229;
        Mon, 23 Mar 2026 03:50:46 -0700 (PDT)
X-Received: by 2002:a05:6214:27c9:b0:89c:4aae:408f with SMTP id 6a1803df08f44-89c85a3e99emr142461196d6.5.1774263045823;
        Mon, 23 Mar 2026 03:50:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8ef74sm469525166b.25.2026.03.23.03.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:50:44 -0700 (PDT)
Message-ID: <3d3d2d1e-e286-4234-84c5-97d93a96b504@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:50:43 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MyBTYWx0ZWRfXytazSZ3RY9Bb
 DD3tKv4bQmXwt8RSubgBxASYf7v7I+nPxt+Z/gUSYTSKUcG5yqWKvm2wFe4KLwHT+c27XlrQ5wn
 Ba7acWniSnp58xDIMHJFMvLISCxC6Uxzh/ctcqY6i+8mkcUKLcFXEFyuBeAyy/c28Axw3uw9dhg
 11LozuiX9UwT9T30c9oPTQs7d1gHiwCJ02awKFlN4R1WeTUuiBIWUtAi5Hr1viyMfKxaDKDwBay
 WKMuryJ7twej37MfsrWohx6KwZ9Mmbk0dU5RY+33zfUCCh1f350fq516c5LNhKuEpGfX3aQ66JO
 0Qv6woBuZ4upOUc3I6wOFgT8QPi9IzNzr4d6YAloKqHoAy2OOHWDDcfRuJVMpOwRao1WkDQ1CKd
 RUu3pYt41laruZpOrIGIQoxCnybtQg0F/jxZpSNsl0ILM//+j5tJr6IAzDsHVjFcGFtWnVD+1t4
 VHjAWeBm6MFsu8efiZg==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c11b07 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=aS0zzyRBlZboKq-MBaYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: n2NtC3pGkV4tBFWnAVGNF1sYQS095xCy
X-Proofpoint-GUID: n2NtC3pGkV4tBFWnAVGNF1sYQS095xCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230083

On 3/22/26 5:08 PM, Abel Vesa wrote:
> Recent discussions off-list highlighted that the GCC should vote for the
> RPMh CX power domain on Qualcomm platforms. Without this, RPMh may not
> aggregate the correct load for the CX rail, potentially leading to voltage
> drops and system instability.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
