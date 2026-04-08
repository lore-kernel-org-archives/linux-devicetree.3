Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6E037F8AD
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639076; cv=none; b=e3ptudfFhesNA/8ifwqAW1AlqFBu++fGAqXGZQxTJZuQFCYJHnyMK8AXvqNg1GDkEKO52EnCmCmHq0uTF3RupVH8S/h1WNKQwZSHqnGhM+5yMGjS9jmhy+pbwr6sKLxmoLFzMPZpJfyYgJ55SywoP26NxiYK35RxW8p70P0Iyv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639076; c=relaxed/simple;
	bh=HUed/dhaydIvnnUHj7ypIcRoZk4roX0S5GhB3x9jLL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAXvCx85uUXDgk82QGTDn5a3mtE2k/GppWmC8omU4z2axkAJTrBd44A5gz6caiJBTjczJMlC6eFIDm651TFEJVRlnhtogjFxXDfl1nYW749vSIq4CCRrBaMUN8rd1W8az56lnymfeWNV0qDu3CEksNszTlUhbywUQu5YJPfwp3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=br9uzubD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEawwizv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="br9uzubD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEawwizv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63839pC72412018
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0AeKL/p9nb3rN/38p3OZFH/nGNxNec/v4xjSMhP9RvA=; b=br9uzubDSgwF/TTg
	ZCKSAoCO7vPC2/iFMmIZVXFcsew+G39sNG3A2pLnDyiRLSLT3cR9T7pfX3wOecaD
	fG/ApIqGkYBMbZd21YAvmZzZhkkMIOF2cgOo4ZH15SBLSu5m2VMAYp8rnzzUuktU
	QIgnhE6PQbBPy1mcmdHbHEzvg+OP48SK9jUIuGZcSxm1CzSYuYN33z4hr0BSBmgb
	S01HNQ/5jBkaNe7+5cz6C6uM1BVRTJdaMEqlmZQ9lhcm2HnXTCiItm4zNeZKKPRz
	zgRCYpYuVffTe5qIvNyt8vmkDctE1rFHRNM+GRkLLSeezNlRPijd+yaPNquXALhJ
	9BC7kA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vaym9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:04:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b9074bd42so19023461cf.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639073; x=1776243873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0AeKL/p9nb3rN/38p3OZFH/nGNxNec/v4xjSMhP9RvA=;
        b=DEawwizv9TcwYxCVCMePj7cixCs1bkGa4B3tBmrBg8B1Hp4fyv833e7rsSnaWl7H/3
         O8+q/MIO+lZTRKX+VpjH3CPuQaLKUfEu3merGeRyhAnHOp5N4CDPDivNCk1ynxGgmK94
         C4Wc5rQtJ8YMtHX0c6mKx6e8Q7NELhD5TemRKsriM3kMRDdearBaRZPIpi0bNRnroDV9
         NotwDyQYrd6VBUw2/MdbqRKQeRNQ+LGo5sJf3cuy0YPPGQ9JJeh0yAN9Y8yf6xmRhHFE
         mYzl+P4wAs8QxC14cmvZ4BBEuBFuSJ1fLOsUiYe7d17HgF3r9kdiC1fgtluLTRMqV6qd
         lzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639073; x=1776243873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0AeKL/p9nb3rN/38p3OZFH/nGNxNec/v4xjSMhP9RvA=;
        b=DjDfwsxZsFMJhUd8w9aGjes+VECGlhL3HDYGKM+pZCIZDIV1IDMvyL3oYRItvi0KGT
         rVeHz20efkvSCn2UFnnJRSM2rQXL/aVKKdENT2Z6DPSh7c3FYvEYUu+QOrZPekD9sNxD
         3cigmZZqKneqTFc6rz8v0dUwOzeluypE4p40FgIvmA/FZPZjiCdGk5f+xxJzXx6qxGEJ
         Fxd7p/fFRPrC4euo6rxrWijp4jrp9PKF7lgcNm1RwAlMlE++Q5DOjQj42ss6yeVJSBe7
         hkhrp8wTNLAsBA/8aWzSO6ZdO1VtzY0iGXU3GwO3erVEHcXZBweoPsMo6eeNgugUh/8x
         C88Q==
X-Forwarded-Encrypted: i=1; AJvYcCUd2HZK9TuKSSAZ2pjeiD9ejqUW2pmZ0PknXMLI+zjxD61eELiiw4jjlgq57pEdtP6R2y5pTTnmg4+l@vger.kernel.org
X-Gm-Message-State: AOJu0YzLaoRPZv0aAj2lwZlWpl+/3FHqqqYVUdIJ3KPLIPLMeWFMtcAH
	v5idDR9Wo/CzB6ErQ61YdtPdewSQu80lzOTacGe4BYgehJ2hgQ4Gq8v4IECPPPOTWFgSSaPSso1
	dUkSs5+nFpPeTA16Ujw0Jzx+rDXtCma1N2pV5uOvcga9UjCqLdeyVjlINYRCGQPgZ
X-Gm-Gg: AeBDievN3TVrXLxqbUZvzrY9kNDPBY37pnZ/44tJT4xCo64MMI7sXMqrJbVsStihQMG
	gUO9qAfI6rC/l4Dm06NVXP9aliUsEP7DDq1mOnUXo8neyRx5/0LD0uhRFuSNFOBSCeJ3r+rNEK0
	3ZczTwuolsGd9XL62aNrZNh/WQETslaocuy3xDHFMf0fhNk5KWuQh8LchF83SHKZSRkEaRQrG68
	UGWlOVAcSwBejcac7gVc45uZz8YqgRKQSPXjWrRQtMfwOoIPuzkrehDkMzhn7yj+qoTnBxxUt6/
	l54gzTapsn1j0lbbpVZzSTKLlDdaB7YSdKAEcYu/gg79d4hewlxrHPZbwquRFiMHZWX6OGWZe+D
	L34XomPhjt2ba0dAN+/lOkAVnQQ6SFsEygKNn7PZAmlj0i5iokDPtm7QfGGUXbuEVSCma3MVcWm
	NY7k8=
X-Received: by 2002:a05:622a:988:b0:50d:a978:6ece with SMTP id d75a77b69052e-50da9787155mr47481031cf.1.1775639073157;
        Wed, 08 Apr 2026 02:04:33 -0700 (PDT)
X-Received: by 2002:a05:622a:988:b0:50d:a978:6ece with SMTP id d75a77b69052e-50da9787155mr47480651cf.1.1775639072712;
        Wed, 08 Apr 2026 02:04:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a787fsm4910134a12.14.2026.04.08.02.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:04:31 -0700 (PDT)
Message-ID: <eacef785-dd08-4eb6-8c96-4b7b2be0caee@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:04:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Correct
 GPIO_27 label
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-7-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-7-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MSBTYWx0ZWRfX2n2R5gM2aF7i
 na+vVaaClWHpxFPDUaHIJPkBCA7HfseibctxxSjTpN4QgRBjf+eqfGnJEtJxvpYvmT0rUcdNoam
 UBYzg2xsPlUy0xhRWTXoelwG0vBEXL0UyJJFb/eihuQckFSXswJ2WLscuUjoYR/gMHbaCuWniCr
 cvpxAQKhN4g5zfReC1YNmCfwXRew+VwUHzzqZTHhDLW3JltBo+Zx7XiuWNjSU/zucBSuS+TD1AA
 oXWeaiaAI36rhTdVEzSMxcMUPUfqoK6z9PsnVgb7v1Eialf87zHD+0GJrzQl31p7Sg2U/q3kGcI
 hyNQxiQon7hJs8WAd4MtY2nnUl84LKLO1G2QK7C/eyoJ4OOkQ+39aMsqYQSco0D1F1KnvlR853P
 Er/qUcMYpzKL680SWkg+BLvOsgTH3zfcfNsG32PC5luB7DFmirSwp1Ljb3mVqhOpNKfiSM3PISq
 ebWjmgU/AjjTEip7KZA==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d61a21 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=EKIyG-Q6h_8_r0hVQdIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: EovpTd7csLXR0JTLNX9cJPErlspLmCoq
X-Proofpoint-GUID: EovpTd7csLXR0JTLNX9cJPErlspLmCoq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080081

On 4/7/26 5:19 PM, Xilin Wu wrote:
> From: Stephen Chen <stephen@radxa.com>
> 
> The label of GPIO_27 is wrong. Fix it.
> 
> Fixes: ef254b12ec60 ("arm64: dts: qcom: qcs6490: Introduce Radxa Dragon Q6A")
> Signed-off-by: Stephen Chen <stephen@radxa.com>
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
