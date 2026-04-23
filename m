Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745103DEFF5
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 09:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935372; cv=none; b=H+Yn+0umQIJ8gRP+058r/XQdHm4g9MgHUJm0BOAN2BHnYHgO71bxRI5RxGw044GlvPjD9ytiG4gIOy9r7YUDZdlvRHysO8YzBdhCcDTAmAnab3KtwHSy3IHrQ2JicrYIDKGVTPPi3uen3yrjNLr77XQzXYt9uhvO0N2nY0iZZw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935372; c=relaxed/simple;
	bh=c+zQ607ek0z0r5Iq+EEbFYzPCG3ECLJv9UZ5qo4VOXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQ41xsK8sast4fYZbOqbO7OmzWOHFGz4Ow0HfU7+kB6boTboy1SqWIJWkT76wUrSBIRnQLsOoKExiFPXSG3BOCuUro5hIdZEkL75LE0IwdRhYMWcqy+fGHbz3rBLtCBwQntbc5Eh+b9eZD8rKx1Zh8Qmjrd+SjWHP5AGoK4N0Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AAlzlO22; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X4b9aATX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AAlzlO22";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X4b9aATX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uOxH1565832
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 09:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VKUxyYhYoKUUhVjntxIRATeX3jIIRiyfX4vIVIvtVCI=; b=AAlzlO22d3DqYzTe
	0h8ABowdhqiXTFnhiJtqk0Mzo0V76pkr1cL89W3oRKFq+AfjDn2AI12mlIc+VrNy
	wyUbn1oAweZkxW2nPoGevLIkXokFg8QKpOn5gbpmHejC3zMp26xAHg5R3830jiz0
	EbFXQF+8qw/YoCEfglG1zyzFPQhRAAg1wtr8ctz21kdLtOmf9FkowSKcnJswDl4+
	SdrSkQ3XLNGF4Rikg9sg7j3WgHHdhp18gQcSZWnaqGlinduIbpr6E7b40l1Ey7LX
	FoprS2YNn7qbLtsIXftkEnw2Vs21sE9QpTdFMmCpoaUqO+tsVM7Kr3yYaZP19603
	Hn1ozg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wu6ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 09:09:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2e91add2aso56111295ad.1
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 02:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776935368; x=1777540168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VKUxyYhYoKUUhVjntxIRATeX3jIIRiyfX4vIVIvtVCI=;
        b=X4b9aATXP6WtOvVO2fznDaBFINHmgHk2zboAkohvf4DY9S0Azf4btFiEU5zXtbPMAO
         XVvdrlSIoL8kIejZ6PPPxPKP7ySZXaNC1FxZHauPtWcBb0Noej+ra3tvSDU9jVyTUCNr
         mT7EP0QoKyJybIQfA5FtU8pguUSf3soZVLIfcGOprjWkYY4NwgtV3Vh4FDZ9/MRyQoYz
         NczZYJMdHCKnLfkgAAag2hnw1Lzc+ywE4XXvbbsreYbxT1CcE4s7nuJJJV8Q1gEsNokj
         FTq/P6WVugE+EztsVUN3I5GBg+8cmAnjG5cGqBtDt/+HrpNs1+nMUpX9rUkEooSkRLqy
         6sSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776935368; x=1777540168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKUxyYhYoKUUhVjntxIRATeX3jIIRiyfX4vIVIvtVCI=;
        b=iQDnFLUF8G/ZpCVs9aJjADeaGTDc65DuvU42pfSZkU3fNAa44v75hEW6iDTiDwxOBz
         AkpnMRHpIz+bOZJPfGJzbrDydJ7aN9TlCsixY88iW5yYERLI9herxFveL9JF0htvMvYQ
         NW6gy1S1OncaII2oBf9xCvbMF/O8wSbMJEzSOziOM+pstvjjSO0tAlGErBiJ9U1/fc1M
         ihX1s1x5dD8f0axKJBvOb3d0vdkmE3Sr2Ic/36Goy3ltXFrLadaxXSoE5g/leSb8FnV9
         DkA54GKdqFzYmFubIGA9hSfvIUCqDUxjLGgvDhNsoTcFJbKRX1fLbg0KBSvrpbupNhB4
         Ctuw==
X-Forwarded-Encrypted: i=1; AFNElJ/mFvPKO7GB8AFsWpf98WNHM790i/HXIomKr2U9bd3HxJSbCZXq+zW1fAFLIkalvEQP8NNdnB8AhrF5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8DcGK5NJ+ZNoyDoGJd/LfXv2e4J3XI5Xsk3uInLBH40socBPY
	MFR856otO60ZtitgVg07MR9YwJ8yb9MYl9UgzFjX1tbInJM6AYr6BcIQgZn8PjL2LulTBvamMbp
	+pQheSbij8iCC6ZIPAYX9xgYKtI8kDuX/vMUzN0nTrl7IHMlDmD39tqGpZPeBOEy2SrjaM0BtGQ
	A=
X-Gm-Gg: AeBDiesalm3NlZ0rpUTcV21pUO51KmUh/eGTab+qWo9JwWM2yRs+/0UbtpHTJmJMQCk
	Dx5vJYZbxwecYi6eCPV9UaC2Acgok6WIrLPoDOQAKNTyIz6hRsAryoIhYcVsYR2zRcnCUTTr4Il
	ZSnZdKWYrwQ0qXXmGTDBsUJEmGFcPc78EeWo6cIA5ReU6qW38T+cTN47fEMQ3LuzqeUWTAyI5ci
	IHHfGUOaZLf8VsU7nrV2tN05gO1qKa1MrUKHgkFwDCecFWr6S0vIR/00ePKA3zNayhfulU7pxfi
	QFIes4Z/gYPZH8OIXfV2/t6qyJFn0xcEKCYsMxGoLl9145f3spr6JjJQ5mM2eBb6DYsxLZ8AAmJ
	XccboV7NFS6UJ5Tpm7iVYk85Z4wm4JV00kgz7di9egHPjEVjOE4yxxM7KfIbs
X-Received: by 2002:a17:903:17c3:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b5f9f3b367mr292339905ad.29.1776935368312;
        Thu, 23 Apr 2026 02:09:28 -0700 (PDT)
X-Received: by 2002:a17:903:17c3:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b5f9f3b367mr292339585ad.29.1776935367828;
        Thu, 23 Apr 2026 02:09:27 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4cc47sm193066335ad.82.2026.04.23.02.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:09:27 -0700 (PDT)
Message-ID: <6dd5924a-7ec2-4080-8666-b8f06d103563@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 14:39:21 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA4OCBTYWx0ZWRfX1lnXiMte71yQ
 UWZhkeuHk9TylDMkjSfselZS0yZAqTRbqnswhr7Ed5QL3JGeE+y2q3JbX5Xlrc9x6KYQdrlVyqe
 MGE8Pv6pXfyrTN4EYzajMLsnesol8KgeJ85N+MWoTMMJfLnZ/MWka1wJCZtBfHlVqNgdoqbyTgu
 d9AhTpgoPlmDm20b1iizZOsWJwFKZb2jtfCU3sG1OOJybA3BWOYznZmIPtLnI1wX1eTP2jFikgT
 cSP/pGtmKzKmD+tXWtQ8e/QBwllA4uloLcnpipRisVM2e4nRzfZG3jvgAudDQJydRDetLkQ5G1a
 V55RtX3HEgjK/1/Gfui0CxDJPMC/r1VtlqBaTQITg/ZMP+NLeEKmbUg1KRvWqf9gqUt6nU8bIhh
 iHa5xRY6cEkIym8PbHo5mSfJlUuTy47M9uUyDA3P/AkHG047L9okSkv42k3PNYnp2Y8YfVkaugM
 Qd+Rb+E1LyqnjsZp9TA==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69e9e1ca cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Gv3PURsRAAAA:20 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=gFZs_BQnlhRWUWx4DtgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: vyewUSj8eDkz0tm26hsfLsx4a72EvE13
X-Proofpoint-ORIG-GUID: vyewUSj8eDkz0tm26hsfLsx4a72EvE13
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230088

On 22-04-2026 21:09, Nickolay Goppen wrote:
> Downstream [1] this region is marked as shared, reusable and dynamic so
> describe it that way.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
with fixes tag,

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 4b47efdb57b2..36b419dea153 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -494,9 +494,12 @@ venus_region: venus@9f800000 {
>  			no-map;
>  		};
>  
> -		adsp_mem: adsp-region@f6000000 {
> -			reg = <0x0 0xf6000000 0x0 0x800000>;
> -			no-map;
> +		adsp_mem: adsp-region {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> +			alignment = <0x0 0x400000>;
> +			size = <0x0 0x800000>;
> +			reusable;
>  		};
>  
>  		qseecom_mem: qseecom-region@f6800000 {
> 

