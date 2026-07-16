Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7603C3BED33
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784187907; cv=none; b=Y2MLOPYcH5owASJq8P1WmuZn8WJXP2/wGSflii/IFTBUXH9W+CZzP0uXR71Zg5X1YEpnz80m+yMqTMfC6Np9NLePcMSDRTRTWDr4GM4yr0BUs6jQSTWFNs6FQyz5OCbJQ0NMZsWmgNIorIrnNyZfqxpQEDVhTOqo74pJdFyJaUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784187907; c=relaxed/simple;
	bh=WFkoATWlYCc7bvJGZ9OZ5oGcqGoyYWfN/F2kt/MqMWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAWoi51UkJQVNr604kvZHfKrslFq0eDWtkvurBSBBDfR4T5Jry5YIKs9ltXp68EdyioDCy6NwUhgZvgQRZxe9AIPY7D+p60GlZ0FRO3uWm195BR2SFUSvJXIaDtgZX+uJ8J6eGJEinygX/BcyhkOIJHpYXUgtrhgOwWYu+HGe1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgJ10oIO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bv/duN2g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgJ10oIO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bv/duN2g"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7XOeE2175971
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vP4P2MRDhAa/J8SMjgLk08z1
	ZJ8mhkaQZHZh+HHsFC0=; b=CgJ10oIOBJfaJZuHFFjb9GHESyQoJ00doLflwBvT
	jM0h6giZo3sapagZIN8+TxgJwQAWy92H99tbu2Abn4GayWGl4IUyQWq6o5xyXOqc
	CEnb58Ynl7jpBTweIeq0pXcCpwkCeNLFObGVHjWgTE903JMIIwixlFepku58soi/
	WnwekJxYAj4mo5NPCXZwleXa2CfHJpPZ13H1mQQgviU7hRhfSFTuTobmtXQVOkaw
	4nTbP+s3+F1iaGgCwXoEKsN4U7DfOptIPUmflo2fLycHSKNfWVMNzJVz3l+eu3wR
	Sz9kjddJOAHbcelw9gORqDg56DY6h6jXXX67gbLyrR+iBQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feu108198-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:45:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88da04b719so2817797a12.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 00:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784187904; x=1784792704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vP4P2MRDhAa/J8SMjgLk08z1ZJ8mhkaQZHZh+HHsFC0=;
        b=bv/duN2gItqjC6NNOGilk4ugusb6XiXAUMcciZio11t+LBr0BrtaqI4GgSkUYNjvAl
         OQM4Tib9kOZbmA51fgdmVLX9/gyZBBNN4r1SwMzO2QkQJGxUsxoCYkVZIxS+BlyFwoql
         tz73fZJOmeEUi6MiAzYzEquHcA4mN508rU6f4ZnYN7PbKWwFcyltL5PDjxPQ/kVtyRIc
         Ku3h/6vqf3/YiJ3rIj0J5K4s7B8Foo8JlJ1yPb0TpxzFvNY0WuQU1mqA04EY0Sp9bKgt
         l/nFlRmzAmBa0/bnC1QGUXDeFpp6aMLSiLGlqcMnv1k0t+4KOBjMH8Gi4Idca8O0hGUX
         Jlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784187904; x=1784792704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vP4P2MRDhAa/J8SMjgLk08z1ZJ8mhkaQZHZh+HHsFC0=;
        b=e8k1okliW0TUwGl9Q41eenMqULPcqPTb1Ud9UY8tBWRU1qh8Wpsexemn9xDvNLHHa7
         E9vBbR3fMlOKSWIO+yWeALI6PSuQ8kaQA0zuP90X7oJ1usW3FKzSAszRyvcKNquueGzU
         mDM2lqeGLK5Hg+d57hM+m7kcWiAznDxkvqH81+EF9m8kWZMD4EuTF6LQZ6hjOc2mxOUD
         ckOobHIG3NNHFEPlytikAmzLpw6P27oXx/kgab/1dAjPEZrANCl7PcFUgGZ7y7Mpl70X
         PCeEqY8gs84lhLIdRuU3gEonzuEEQUBlU/IiA9GQyTIemrdWEkqH9jcZzM1XO44p3DFH
         mg8A==
X-Forwarded-Encrypted: i=1; AHgh+RqJf79wMrrWFag1MXVzQ2TTJHCmYlRfefUcvT33Z7gNhuRMAap30YuT+DIrm4F1hnrLRPE+jnojad6+@vger.kernel.org
X-Gm-Message-State: AOJu0YydC1om/DcOp7IA7x059lB5vSxJSalgT9+eecQSJEc3TtwrpQYe
	AzPyFlUUd9C1THe4JHok/CNfkF3k2frDE4fk+ac058ubLohuUMYKsNZf7jTuohbVc9ot0SiF6HW
	yt2Trl5be5gAzmQ9OZ/+Q/7OBsh8Ebb4g0qmQbnltWo1+aM8WvcFV8zEHRrXn13pc
X-Gm-Gg: AfdE7clsH+wHYHZwFchisk5exllVNyJOFEfs3//q289MTCK7VfsiXDi7tKOpf3ENrh5
	XwmCFIOiY4Hf9oy5OvnP8PwI6ZOLtpJTn/624Xt4v3PnC+h+0bMuyiXGEdrYEMH7cUDmC5skEfb
	Hx9KqDc04rD0Ympl3ZhVuv7OAzfd9soThkTDbKY/+kWjJ7lhDr6NcG1omp6xnFiZ0jrQp4JXO2k
	2hR97qTZpxbZyhvLk9+6YNNY5Dep7HpW+xwIcav1KDPA+G6nI+MWjoxKkXsZxvNKBuUm95kEfPc
	O0daBZ79bh14ZTi74r2BNMlUz1HOjqDw+LRvzRNdl3dmJ3Dfodrm7vjG22BdGhA944nM36cBtyR
	RrAyy72mqYjbU+2IMLWNZrCl9/Ek=
X-Received: by 2002:a05:6a21:510:b0:3bf:6c08:2b2b with SMTP id adf61e73a8af0-3c110b6e0a7mr23007936637.51.1784187904166;
        Thu, 16 Jul 2026 00:45:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:510:b0:3bf:6c08:2b2b with SMTP id adf61e73a8af0-3c110b6e0a7mr23007904637.51.1784187903601;
        Thu, 16 Jul 2026 00:45:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd4359166sm8015776c88.14.2026.07.16.00.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 00:45:03 -0700 (PDT)
Date: Thu, 16 Jul 2026 13:14:57 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Shikra
Message-ID: <20260716074457.72hpdvqbqsphro2u@hu-mojha-hyd.qualcomm.com>
References: <20260501-shikra-tcsr-binding-v1-1-0c136d193634@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501-shikra-tcsr-binding-v1-1-0c136d193634@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: AGrahybiNUZa1o1SH7XLFiVTXMKu5kYu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA3OCBTYWx0ZWRfX5oyLLs1U/x2g
 OipmvDZExZ0wVFECzX4FuOECUDNERRpU4wBB4VZdIG9FBbb2zwomfkQ7DbO7ayc+VMPSv8UAgBl
 XcR4+miZoJ+AC4BsrfQCeqd3LxrubM/yaYRa9VbA91JmIp+rT9mwAUdmh/wdvsviiKpTzmhCtDc
 aRCziz2NasTC0K6aEectbo7SxzpLNgSdlf7BqfgxYoLn1gvbL/32pkUmPFe9ldIWnzAze7Hchie
 2HYVdYn64Kvbvs1X6K/s96Dk4nlLYeWxWoDk6j57+jDWTo8IgdxnTcwKIEJ51pGymcO247W+Wfr
 IGWHofYE11SVslGJycoXXujp2IX7bYbUvYHc8vISj2XkizRUq7LLs1RY2xq2R99+B72ITZZnFe6
 fjbbfv/JE2Azz2XRDiSarpA6ES2xgUTWAuawavYKH7gJxSVLYPJjttU08+4jp/Lj6jjOk7H+QeA
 KkrHlVvMGtj+JdVA93A==
X-Proofpoint-GUID: AGrahybiNUZa1o1SH7XLFiVTXMKu5kYu
X-Authority-Analysis: v=2.4 cv=BPODalQG c=1 sm=1 tr=0 ts=6a588c01 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=En0k0xXHmbUGYgfYSFQA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA3OCBTYWx0ZWRfX4aI7wtqtT+fk
 4nwevWnppmW/+76wOWleblArbFD9p/cUw4ga044LauX5V0wsiHHJ2oQry8CqIyeNkCprZdKQhKF
 nWTDQTZHcpnCsb+JrtiuVlWhmREyE7g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160078

On Fri, May 01, 2026 at 11:31:17PM +0530, Komal Bajaj wrote:
> Document the qcom,shikra-tcsr compatible.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> index 14ae3f00ef7e..51d0dcab5706 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> @@ -33,6 +33,7 @@ properties:
>            - qcom,sdx55-tcsr
>            - qcom,sdx65-tcsr
>            - qcom,sdx75-tcsr
> +          - qcom,shikra-tcsr
>            - qcom,sm4450-tcsr
>            - qcom,sm6115-tcsr
>            - qcom,sm8150-tcsr
> 
> ---
> base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
> change-id: 20260501-shikra-tcsr-binding-fff1689e4097

This change still applies on Linux-next. I see, this compatible  shows as
undocumented there.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
