Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA48401A25
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539959; cv=none; b=YMNe/Z3wuHfKAHShvxMcN9GMBnH8FmKgIjxl9rHUUrzs7Fqixibr+GnjrLc22CV0qNgA24OZDdredPbgRrMVDNZlG78vF5cDcxyhATAu2RYjZEuSLL0aKVFEExrg2ph0uxS//E+FpObhfmVOMTI2otTjHsFI8XQbnAACsFy/+q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539959; c=relaxed/simple;
	bh=F3eTEyyX8vqYgF6JpQmVhqOM/J7F/hWIelPIekPRpr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H0UA904G9wNCTRxGQ6QQdJQ2uyfmbJ+SPbFVFZop+aAf6G4Nq6QD21kzOLzT2pSSAnDBqTUr2mbWNy/g1ym4RIzW0hMkA9UHUKjo12XZ8vuxhxPY/mnkZbzqy8P03LelQ3hY58wTyFt486pFmRqju6cVDns3wD2p/p9S2XM6DoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eW17fcup; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NuugipBh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eW17fcup";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NuugipBh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QFA17W481345
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 15:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HP/KSnHmsoNZJmmczSRBs8L6e8y2zB6VvhL4IVs3YvM=; b=eW17fcup1Q5slPZw
	BcDq+ojHV9j+4CCxmyQSV/amf05RDF1uAuWPKMXceBB/QESwDByPCO8VtoU9vl0v
	v/oHEDhf8T0y3OKk1Hi+Q0akVXDrN8nFLrfPSMZMs7rjF8bZeS6sjBkEyd065bH+
	pTYG4U9yNe02BZCZ9W5EdVJTq+W03f4JE6LWUZ0UgPrnvHFCBEJtNF2L9PnZ5MyQ
	Vi8UkDxF+0yIR2y8XICHSDBracfmsvo+0MAhKQH8y6CjqJ6XJ6dqT5YShHriuVpS
	rYOm7j4ygiJ2s1xDy/yHFE8x15F2UaFOEWKLe/kxCtqxFlDJQ1Jqe/GGR2F3SduB
	/QFgHg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4pymkf62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 15:45:58 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-604e9bdda95so526729137.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774539957; x=1775144757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HP/KSnHmsoNZJmmczSRBs8L6e8y2zB6VvhL4IVs3YvM=;
        b=NuugipBhQLCZHIzZKXsqjLOJnSNe0iR35egr0WO2T/oUlZp2G371pztih+nXW+K1JG
         29ClCKxPkXMYULCnTFPXYWyIV08ogIKn+5B7O2skuf7H2leI/ytyPbwCzwMnhHv4IANH
         HDPHQRMDmmMtBFLzj4JxZKgy6JDCSsi8uol4rQjlhSij3GNKpAkGc4/2sSmJYLKbq8/c
         MLQagV8nyVkaigt9sJIHH75KWfDPGL1I0JPozm3c7IhE4pE0ntnsAlgqCmZOwEHo31yc
         AoWnQDFoXFzyctT40eN25AQ48hsc6Y0Wxz+eUaYskdY3xL7sGk2xGrWTuCEKAj/5X8H7
         TfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539957; x=1775144757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HP/KSnHmsoNZJmmczSRBs8L6e8y2zB6VvhL4IVs3YvM=;
        b=E5A0/RzGFcPI2kOESoEuukNUgklTuJRJT50HraBbxY/AnLP+N2k201u69zvSaWmJxP
         BpaNLjc17XhsSF0wIkX06l1knaqaqhACUT7op3HcPhCuS2oIS1enGsZzJ6w3G6KHIqmy
         ZEJXYzK9Dm5hvpSjUTIU7FsJEBrgU7V2/thCU0C/j8sZR9B0dujDK+Zk0fiRPoXtc7KT
         82qqePqvIY6pKbt1BcOoKOTtU1vUagYDYV1wblbjcIa+hrm6Fl64rLXjk0S7BJMgPgj7
         d3Gv5g9pNnfVoRt5IDNHEpa+0AX5WdtGVQ/y4l6G065pakJ9BxsV/sAqDPZ/lUR9N63/
         6LMw==
X-Forwarded-Encrypted: i=1; AJvYcCUO3xVOH6o2ku5iKzN81t7Al5egtlBuFK7N0dcBf7SgPsZy925qtLSYIgKf0n6IS1UeOhWECFA8L6f6@vger.kernel.org
X-Gm-Message-State: AOJu0YxRxQdBgH49DdIX1ECj3LP35iOWJ6wNuSH383aNoJHDK6iyDOe2
	arnBfkfa8uhX0OxJ+asusO3pvIkkttp0L4ky4rvTRVztZ7OD6uguymV/PWV26dGxs0iU65cwLr0
	dok5NpPFG5QmLkEAkwGaHEQsRWLxUfGGLhFuIw4JRjS5U8F6ZPF4m4USzphT+obkI
X-Gm-Gg: ATEYQzzXBOM8SzR5wEguDv/IGLJ3nzeCE85ozJk/jgEFUaotPOSg0HqjVH0Vi5txBLC
	ZMEjrDnUok+a68GOpvjdVWZRJ0LRt7S+xyzzEZqcNuIWl44hCIsg+7sXy5h0/e3BmFwRM6e/V1s
	sDoWk036ABaFgh8NvVfuoDjAhj+LMHwuJ+ZQ8qE6pTIb/V1ClZqXzVoh5SuOcwTzFQhyZFPu9k1
	LbYIYQr1Pw3rr/mB+6w2lRvDk5oJ+AltlXT8VT8EBK0JJNBO+D0sIwGqm/EECOTZoNunixsFcCM
	ZVL4eSoelhSPOGW85VIlGpw+6nAMz64om+ju34Wo0ZddZ0kvxxgtdAX/lmZZ61ClSArFAQ9maq9
	+LqFgAHdJdXWQFN+JN6EcIuQ31caT7xzMSFT+3zYp1zlIJxNf
X-Received: by 2002:a05:6102:580d:b0:5ef:ac78:3c77 with SMTP id ada2fe7eead31-60394891e72mr3856995137.18.1774539957016;
        Thu, 26 Mar 2026 08:45:57 -0700 (PDT)
X-Received: by 2002:a05:6102:580d:b0:5ef:ac78:3c77 with SMTP id ada2fe7eead31-60394891e72mr3856968137.18.1774539956563;
        Thu, 26 Mar 2026 08:45:56 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48722c65989sm71694155e9.2.2026.03.26.08.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 08:45:55 -0700 (PDT)
Message-ID: <8475743b-5439-40f3-add5-f179c1044889@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 15:45:55 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: monaco: extend fastrpc compute cb
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ez09xvzEq6GUbF8pqtLonAQ4FybtzttY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDExMiBTYWx0ZWRfXzneVfBHnrBeI
 /3jSkIaxZSPvVj2UGjes3CC7r0jcMNyuLTJZjWvFK0q/uiZFk2bPl68ytvo5qXkewtwa7vaRs3m
 CC3PYrjNhalHN5Nr4BmG1in+9O4t8+2MFt0yZsVQdc1Bfz3RyN9RFOZC/OqdDDOwW+xnB/+ocHB
 Fnpr2Gc8EeEyrQVULPmzc8S2Pi3RkXxHxktPwh8/bnMqv4bXqkP0EnwXZusgk+DXGqQrHjcbex9
 yvZtAflhUrCspoqY3GZbvBUlprhLUE2oeZ83rhExVHnVXCPtbCm9KU7gbPaQDzH2pzSmNpZ4OZr
 APmdikSUZyTgn1pAu+fCJmGEEDL1b5xV8Snqjsn+8JgZelcwEwuLXmRIXK89F+lJUrR3JUo8F51
 oRt11YEgzmF4xFhK0hQlVT1shAJahXXb8/4dTe1x0OmrxHg3x/HPv+vghOqRq59c26DfkEQw8D/
 70GhMi3QvoKcX29qYmA==
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=69c554b6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wzoI1WLMGo6dYPb-mgEA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: ez09xvzEq6GUbF8pqtLonAQ4FybtzttY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260112

On 3/26/26 3:41 PM, Srinivas Kandagatla wrote:
> For some reason we ended up adding only 4 out of 11 compute cb's for
> CDSP, add the missing compute cb. This will also improve the end
> user-experience by enabling running multiple AI usecases in parallel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Changes since v1:
- renamed the node names to be decimals from hex.



-srini

>  arch/arm64/boot/dts/qcom/monaco.dtsi | 49 ++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 10e799dd4a78..38fbd44c7d8f 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -7739,6 +7739,55 @@ compute-cb@4 {
>  							 <&apps_smmu 0x1964 0x0400>;
>  						dma-coherent;
>  					};
> +
> +					compute-cb@5 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <5>;
> +						iommus = <&apps_smmu 0x19c5 0x0400>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@6 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <6>;
> +						iommus = <&apps_smmu 0x19c6 0x0400>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@7 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <7>;
> +						iommus = <&apps_smmu 0x19c7 0x0400>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@8 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <8>;
> +						iommus = <&apps_smmu 0x19c8 0x0400>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@9 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <9>;
> +						iommus = <&apps_smmu 0x19c9 0x0400>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@11 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <0xb>;
> +						iommus = <&apps_smmu 0x19cb 0x0400>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@12 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <0xc>;
> +						iommus = <&apps_smmu 0x19cc 0x000>;
> +						dma-coherent;
> +					};
>  				};
>  			};
>  		};

