Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BE43C4576
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271487; cv=none; b=tJSkxn+W0mUwRzI8IOvPXX7SRn9ZcOCnGUCGwnoAmG82YoI9AXjQADJ3ZHVPFXUNEy8gJ6HkjrJHgjh4V8YJPpc0TxbM176y9FWhwkpCg6oBgLraMb7OtsSQQVwcbLdZZVTWL6y2HoYjPUlnNaSg/J2KYdUUTTaDd1N1x8yh9pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271487; c=relaxed/simple;
	bh=7bX6cKydqlLKq+aZ6OGqGPq6vprZBaJQAym3gPj6g/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jS7yJSI5Q8mscNt5Ai6Wl6RPp4MdAoEZsoo+dDJk0HdeZ1wYYffrrOOrKCt1hGWfTxBY+hyQK79tncH5+U+csM2/Cg8sX+aJ2XFPzTW9V2/u/K53w1VwNqiiNeA7MuwZfRcrSJueRDy0KfpIXRcSprXTiOp6s1hm3o8yflyWOAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1SR1EeF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLfavxzS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1SR1EeF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLfavxzS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9oZXN1178265
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dDZvjKCBPo1g7DZhZyRN4lACTVrjxsf6J5Jrfia13k=; b=T1SR1EeFL3Fhb+57
	QAkUpoc1pytr6ujYs/oRaMwh6M2zwXVfHGzZSVf4KVg78Gft45yoZEh4cAhRrUKj
	s3QcMFTda5CEkfEbQ3p8J1+t16laFxPwvAZOuPE1kADaOW1ikB9QS+aF3IiBZ1HT
	oO3pXFkaIUF21Cl3IMVrI8bAr+hquuLq48fzhhCCvYjE70vISGGjc6Vbd5rhZTyz
	aZrKc2ZLfSUiXyKBpOQhG9dmCw3jtIEv3hR+FvvbMYcBgswxoWGl/nfBnHXLJZ3g
	IwYgvOEDaDqZVGSBFOitXhRy3mblEjDgsIFqRhNhHjV1lfRh6En9qe/fuG4fStYp
	JLruHw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6r1rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 10:04:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e62562b6aso14928831cf.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 03:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271484; x=1779876284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2dDZvjKCBPo1g7DZhZyRN4lACTVrjxsf6J5Jrfia13k=;
        b=WLfavxzSOcnZ4xSgPyKOrtYMZya7ihBKlGiByyOG6uVlDdkHlRVHANl1eLSZDhMS9y
         SFjfZhST4xy8wC3iBBpiXmxj+u4A9x1GqS1ODHJabrCLXzEl1Dr3i+kKOghyx6XTQZwY
         sOhsMkl3OqFEd2jSVVF1J68OQEPdXpUc1oMs4SMtwtDOwuOrZnZ+pz0PFkYT1KJIpEo/
         oyFJ1o96YoR0j2tsTFV8i4DTNbVac4hVoIOC7mNIJvd8biuvo9JPmmJnRRbv6wD5F/rL
         lT8g5tRQ4A5Ce5wACykHSSts5eKY7PT0sNRfutCKQ3qgE5NSA2OX169NvBI3w0ZzQtpy
         Oaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271484; x=1779876284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dDZvjKCBPo1g7DZhZyRN4lACTVrjxsf6J5Jrfia13k=;
        b=H6p3op1RYsba0Y706KRoSpwLgUqVFV7Yp7FZeWhhsRDXMm6MTaXsbQgattEGj979mM
         +IzdkfV3TDRUV+ohLkHz1DqsOwaVn33mWwaIiZzCS4GboKgpMWA77R+Y/NERIHEjuZ5J
         m+tDpodUO5561KfhTQS4swdp2lvsFh6EVLfJlC+YIxSNxg+DVES9ULmjvNWrUZICpxwG
         PbNgGZaXa2fhOQh6cBRWqH8BkGlEuVJLDF1b91dobEc+tWqtZH0J2Zq+pePimIp1kA6S
         U3RhGSU85QS6f6Oh2ybAZ0yPe+S/95/CTUPbBvPdlpljWEvVAO8OLd5nLnuAFFnTjsPF
         NvEw==
X-Forwarded-Encrypted: i=1; AFNElJ+NZg1rblBOWbMN/yRGYDBNoADAZHToQi4JfZPWqloYDu/BXzzNIsZPj/y/GeiQQLDflNek71oUjH9l@vger.kernel.org
X-Gm-Message-State: AOJu0YzaXGGIQE2sh4nCthlfFoEJ1Sf7h24Nw9WyfsqTOzRZlansCrHh
	3baLEaBth+5GdxrlKsYSk9chtfLZZJueXsq/Nj+HG2DmBQGOMQ7jdYP1NXCj9jkXMfTrHg4kWY7
	RsFN+r+XgpZmBZy8cLyR98VmfzL8jrOLyB8O3AWWHQ54aTInD+mc4ExIz09Zls/C4
X-Gm-Gg: Acq92OHIPBY4+MesOg4YyXpoyWbGWtb+B2QetKsgwvx0JFO2R9iqrIDZ5i2pkA4NqoZ
	9oF7FIcsHigcRcE+5HnycRouh+tKGWBDaVnycMvg+6s1vUMdQ0tlm8eMJcTyG1ojUOn9j4Nt7KQ
	T/vAsSUgcgeSYSTmTIzrHCuI3UQYtDBlNXNCHUXVjjOq8eMri6sA9rGqnFC5wrB5rMQaOwQEQBp
	TO7iVJojiITaGQQrQ5GOHnWFd4F/5i7qKwz7cotjfRVxf8WjmPRRcqO5CAe7oFOGKWsBRhc3pRs
	GWhxIunMp4WXvvLDb0vnwopZRGiBJGqvvRdjwY8Md6jGX7eVu5NsN/2KPrb5cXmNLUVigo7s3mi
	Auodvmdqaw9I3uBJ57LvV2gxfildbHaq/TuF8jpaykoRBkzNKTt00DpC/dTtNdcCISqEigU6IwI
	uyqek=
X-Received: by 2002:a05:622a:1207:b0:50f:bea5:52a with SMTP id d75a77b69052e-51659e99e40mr221403071cf.0.1779271484013;
        Wed, 20 May 2026 03:04:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1207:b0:50f:bea5:52a with SMTP id d75a77b69052e-51659e99e40mr221402731cf.0.1779271483554;
        Wed, 20 May 2026 03:04:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311670b9dsm7624144a12.21.2026.05.20.03.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 03:04:42 -0700 (PDT)
Message-ID: <20a0ba34-0558-4a80-9b7d-2fca13a2f05f@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:04:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom-soc: Document more of existing
 legacy style compatibles
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
 <20260519-dt-bindings-qcom-soc-naming-v1-2-005d29d261ae@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-dt-bindings-qcom-soc-naming-v1-2-005d29d261ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CETDt9wfab6zP7ZKnm8WOT56I05LO7lT
X-Proofpoint-ORIG-GUID: CETDt9wfab6zP7ZKnm8WOT56I05LO7lT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NiBTYWx0ZWRfX9CDLjrjl+IQY
 NnjUv84/mTvOHTV7jryDOiutB1aDzU9bHswl5GtusSWs+U7M2eI8dIaBbUuK5BKj6y4gFHLGiO7
 t6qGm3oXNq2apfHA7JxWoL3QiMyl/8WeZLM4FxSniqvtpERLq3iAhnnV7+vt7liED29bQ4U2QiG
 dFlyEbD6fpQ9hJ+Scb4JDMZi1EOSrpRfo5wh/pS8Ih3uN4QgtqxMY7C3wr9oFVVU/HcwvWvMra4
 n1e+zRQmUAklQXpo9/ElhIb+A/b6QQ6ZVJJDkRnwj8J6L6jZGrTlMwOHGFOLVJ7jdpS7J4z4CBu
 b6GVm1Su+0PhpP+SZNgGL42cof8PIE/qA09YTgd9Qg3y0OUr/k+B0AQK/3GojtpnAJ1snNkV038
 QGIbupiOt3qSOSL8tWbm4xfRHxQfuc46o2AgR+rbDLcShTqn2PjZUcIn1Xn5Wc9r4lqpDBSZ6Ec
 y04kRhq/Ze8/VFwMScQ==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0d873d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BoalkX-kHbwzbhiszqwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200096

On 5/19/26 10:03 PM, Krzysztof Kozlowski wrote:
> The schema misses several old style compatibles with SoC component
> trailing in the compatible (qcom,IP-SoC):
>  - qcom,apss-wdt-x1e80100
>  - qcom,apss-wdt-xxx and qcom,scm-xxx for SoC with code names
>  - qcom,kpss-gcc-xxx
>  - qcom,rpmcc-xxx
>  - qcom,tcsr-xxx
>  - qcom,usb-hs-phy-xxx
> 
> It also missed qcom,ipq806x-ahci.
> 
> None of these were flagged by schema, because they were used with
> fallbacks and the schema checks only for single compatibles.
> Nevertheless document them for complete picture and for future change,
> which will apply the schema to fallbacks as well.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> index b5f3a750cce8..d7d64e0e146b 100644
> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> @@ -40,12 +40,20 @@ properties:
>  
>        # Legacy namings - variations of existing patterns/compatibles are OK,
>        # but do not add completely new entries to these:
> -      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$"
> +      - pattern: "^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"

There's also x1(no letter)26100 and the new x2 ones, so perhaps

x[12][ep]?

Konrad
