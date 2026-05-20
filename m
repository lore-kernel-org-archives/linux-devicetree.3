Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6168015E8B
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287769; cv=none; b=mMscfvpBifjkXOFqHbZe+X405X7zM56VwGVJbm8Xn3W/bESGpPy5NuOUGERem3T13fgOLu28hVyu+mvHHrDBK7ggptPGTrpQaLx+MH41L5HSSoIZW6or5Glfa0v9mvWn3l1aZAv7sXgKtAekPbrgnZfskEM4wZXc6DGgXwjNvVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287769; c=relaxed/simple;
	bh=U2yc0KcbhSZBDY/xYEY4BJ0bMe1yyN4EPBb8fIWxpbA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CRZ8yOGUE+JvP5lsujoQnnNJOp5oMsh5XNHvlGOBiRJbKiVjxbZQ3C4LTM/r2AUj7MpVuCmjmyECtE5xojjSa/8lQpwj4zhJHdQ9+MiVXHI6LxGi+w5LC2Lahx9QAOTL+Wz4Rdg6osxi1/JuHtmMsCtCJGBahzYVZV/mZlUwvyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6ItmrlD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O16GWU4u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6ItmrlD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O16GWU4u"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE6SbY118975
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8D1RMRGTDklreIj360k58wLO9RFfoVV611CHARC27Ro=; b=N6ItmrlDHmFSOX09
	XlWAE0S2O8lB4mHWfLrDXEKxnJ61m5hUpB10GjuGYrsCWsqtIWdtuP6quhVrN9X7
	fmQ8r4KWkUrNRpZIQiG95iKT//2JtDtjbJtq5mOgZEywwghJ2ynHUGuA7pR7qBtF
	9ZAB+lG9m60kMs1z1khZPcm0je0eCRfsYSplonk8gd8EcL6XRiff0UaRMCHE3KZS
	g262Fa7xB7Nl7pUMsotS2reUsCP9nWO8dfov2gTIWycmFlQkc+9ANZVucC2taTTf
	l2mWc0b3pF6RxT6MYd17JQvfyUVvbxozX50IAKUn+PrUgrKXqgD3II/MPdOy9WPq
	OuZJBQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee883y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 14:36:07 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95fc346e02dso9197562241.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779287766; x=1779892566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8D1RMRGTDklreIj360k58wLO9RFfoVV611CHARC27Ro=;
        b=O16GWU4ugdJ69+jF0BG9TaBGEkFrf5LVUZsbtgnRWSEB70dCXin0vtZgQ+UfA899B8
         fRmacpiIgCoPZX2caDfi44vE7W8S/Mv9cphqlM83DxOpT+9T9bid8IKQdZZh/qbhuYb1
         uzp6dT7iT0mQYil6Z4JzUjjXTcYkVZnFb3JA7m5s4bYfWqEz+OMl3KCY1pJD65HcFABu
         UnZ86LAxF48d8aBlivqrbxETuEVgzwYykkAIjSF1+qmDqU07ThtWFVQCKw74DB1LBm0v
         /I1Z2CPakKFYAUQhozmZw0BwXCvvBIzLAuuD9onjN6LwOF4mLy+EmduaA3ncvjcyUftD
         a7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287766; x=1779892566;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8D1RMRGTDklreIj360k58wLO9RFfoVV611CHARC27Ro=;
        b=f506nOqvxYUrj80Ev6s50QxeSpIqCeWhgKlaoJnBiq0xhz1GMe1//4D4mJa0eaEMb2
         t80FqP1jnDLK9eGDkwULicS0kAhWeVVbd0YJ037Ne5qkoxCBDOH3a4PAXwRiJNDK4CMt
         4VFtIi7Lqxtr1pwCaGahEJ/MoHGtMqld1F/fTI1ZpWq5jyyHQJpI+Jqtmvj2XDTyUttr
         TWxjsL2Kdys/j92i9he0uS3deVpBmS5AIorsSMeTqNLLAQH25F/uJ3/Ed2wn07lYfeQo
         X6l1kgWy1IKtWxzdrFz5X32Hhqi+U3HAzkerHw9AgoiazONzc35uUiZui4mH4l3ROko0
         0aWg==
X-Forwarded-Encrypted: i=1; AFNElJ93Y0r0chdiqflAk8HWoDiCikuXUBAx4PGFjeU8YwFhEy4YI1CYrGjLu5JDjKNvOENhDSDQmlNYmRl4@vger.kernel.org
X-Gm-Message-State: AOJu0YwJxakFZfP7gRfMffVEM+Jl7GSirTbu2h2HTSWj8cx9I2hDAkyh
	pkZ5AjPYQMoYdusV/7yKfbShUNPrUOuvONqm2jQx8n9fHTX+ppr6mDLKLYpWWDkmLFM4Vx/JD1J
	qZ0gmMSpNNE2M7HLZM/3TVksm+9089doFx0kTMaTUSJoEMKyPq2QmxzmskE2w6iQdA2Qyj2hD
X-Gm-Gg: Acq92OGNVKGSSjX6aex+sh/AqvaUo7KaEh1m1avXWXior2W0XsVjYdJAFQye02Ux93n
	N7ZmAPFXN2+rXFngYD22vCYkT9Hrj5RcvvRPaQhkoE8/9KDRLOA+WH6pdGqQeBcb793KLj+uHSq
	BeGQWJ9g4rW/U2ld643EzEcFBPMGfyUYVi0iGePN2DqJlTMHzgFkaQK2BcjEW8fd96Gu99qj9+z
	baRYxZciM3O8yJvPJvJRH71Wiio44gyXMipvTdPjNHXZeK+kUBLtfpE7+0iB00XRcY6yrsySvaW
	eut2Ml7jPpphtjXTZHy86rAu5BIo12xnq/2Ap8SZZb3j5uk7+NQEGUINwFx0AaKRUyFWeLKLwFS
	W0fwF7KG5aWvvO3d9K1hrWMI3bDnSAAMwWIYJ1Rzr4IA9aaT6n2dN0NnEmwM=
X-Received: by 2002:a05:6102:6e85:b0:606:49d:1861 with SMTP id ada2fe7eead31-63a3fb9d96cmr11783769137.27.1779287766547;
        Wed, 20 May 2026 07:36:06 -0700 (PDT)
X-Received: by 2002:a05:6102:6e85:b0:606:49d:1861 with SMTP id ada2fe7eead31-63a3fb9d96cmr11783718137.27.1779287766047;
        Wed, 20 May 2026 07:36:06 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc46aab1a5sm3305396d6.7.2026.05.20.07.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 07:36:05 -0700 (PDT)
Message-ID: <a066fd7f-666a-4b83-84b5-1fce7cd0cccc@oss.qualcomm.com>
Date: Wed, 20 May 2026 20:06:02 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Document
 Shikra PAS remoteprocs
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
References: <20260514-shikra-rproc-v1-1-9afdedeee002@oss.qualcomm.com>
 <20260514100608.4E1C8C2BCB3@smtp.kernel.org>
 <2f490d31-07c6-435f-b96b-0857471c03bd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2f490d31-07c6-435f-b96b-0857471c03bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MBGxug06GmcMM-YVAB7DTGXUevk-qDpY
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0dc6d7 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NYVHFnyteZdQxSc_kkUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MSBTYWx0ZWRfXzHX5GJjgq/oS
 rhqDMCqol1AGSrE08cLd4mo537qlI4SIfAz87qob3cuXuAUtfEtrRCIzgQ7YC+/WPKE0t6TYbGv
 7ipjcQuqAIKY2jIVM4KTPud9HU6qlYza/kpUhQ/BU5rNqepUWI5mZzrCsh7k6nYmufdqE2npNe4
 Pyc11QMFjb/qGb2nECz3n6XEsGEJ+EByT8wf+g+NElpA+Z8BMXrnv+vp9OnRPWVMtCmOWCUBwef
 qPVyTeqqQdhk7Dj6kj2s/h2bUx9ULtyoHKs6E+bC1ph6gLjG5eosFbtz4qIWJnkX3yosLfim5Ph
 KzPPozMzLbuH8Xw3dY4+PMkh5o9lNPPuahqgYBuC1c9k3+XZVyfJXksog9JHPaAmzcXzmG5Grml
 yKwNQvQUXFqZkFQWOzJgSHluE81EIlJuj6UpcA3B8Lo4ovN82zNLMJq30DC+PcfTsOcohHIOzvM
 MTKoQmJ2JNrxEMmx2ZA==
X-Proofpoint-GUID: MBGxug06GmcMM-YVAB7DTGXUevk-qDpY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200141

On 5/19/2026 2:46 PM, Komal Bajaj wrote:
>
> On 5/14/2026 3:36 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential 
>> issue(s) to consider:
>> - [Low] The device tree binding example provides two interconnect 
>> paths, violating the `maxItems: 1` constraint inherited from 
>> `qcom,pas-common.yaml`.
>> -- 
>>
>> commit 6b248da80633195199f478d98724a0590dfdff63
>> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>
>> dt-bindings: remoteproc: qcom,shikra-pas: Document Shikra PAS 
>> remoteprocs
>>
>> This commit documents the bindings for the CDSP, LPAICP and MPSS PAS on
>> the Shikra SoC.
>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml 
>>> b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>>> new file mode 100644
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> [ ... ]
>>
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/qcom,rpmcc.h>
>> [ ... ]
>>
>>> +        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
>>> +        clock-names = "xo";
>>> +
>>> +        interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
>>> +                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
>>> +                        <&system_noc MASTER_CRYPTO_CORE0 
>>> RPM_ALWAYS_TAG
>>> +                         &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
>> Will this cause a validation failure during make dt_binding_check?
>>
>> The qcom,pas-common.yaml schema, which is included earlier in this file
>> via a $ref, restricts the interconnects property to a maximum of 1 item.
>> However, the example block here provides two interconnect paths.
>
> This seems correct — interconnects constraint in qcom,pas-common.yaml 
> is currently set to maxItems: 1. I willl update it to maxItems: 2 to 
> accommodate SoCs that require two interconnect paths.

Revisited other Qualcomm platforms hosted in upstream, and it seems like 
we don't need explicit voting on system_noc from remoteproc (voting is 
already taken by scm).
So we can keep only one interconnect entry.

Thanks
Komal

>
> Thanks
> Komal
>
>>
>>> +
>>> +        power-domains = <&rpmpd RPMHPD_CX>;
>>> +        power-domain-names = "cx";
>

