Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4583481229
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910119; cv=none; b=kmDXQtRPm28aYHZM9Ea8OsIGWQpnVRR5+hvHNal55KQtlzN64AS0XcW+1pqUZAKeh0a7JmaFx+eXZ5ZWQcJMS5oRR4W/G7jFkZeH+psR24LepGudpAoaFX7Al5g29jATfezIqQ+FyTnBvJSdx4OLa7NZHmqqZcuyni0iXVSdO5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910119; c=relaxed/simple;
	bh=V9/Jnx5MzODZ+45ajiX0Eb++XQ8vVE7dhfehBSnkp9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dQ6mCJDQUktvpjkH4pFSFzJjcc8mWQO36+n/SdJ7bIyCawKammXB/dNlbW6vIcVw+d5uZ+OsJoaQOE5UmScdcvpQsXwfYJTEi5t4In9d0MLyp+WCYVdJdxCq55kqc4wFR8B9UAhFP7m4Ak9UECw4CkNSLgveag3IBGEkdmUgMdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFsZf9ep; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTsTA/7P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFsZf9ep";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTsTA/7P"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8WZs744296
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 12:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0iM+aBdfeyeVdfRfQMgUrQ6dZ7uV3WS3/3Rw/+vDw0=; b=mFsZf9epPnrwK4A/
	mojq5N0dryfGcnZChXiyo0ECSMDqfhxGbpAhkfTzvvakWrZwRSxySI/R0NfhQSiV
	dP23W9YXrJyk4CzBIlfYPF0ZSDXLqmJ1N3FGUr0cT4Zg1XUxODreU/sja/urKBNw
	oF1k6a1zRSRRND9iTOmQXA4XJBaCvb5WsfqloUQj4MhUeIhnSmPLYHrOBLivgasz
	YC3KeJdDdsdPMnnSfpw4MvjaAJBgUCnzF0E7bo3SVrKXemf6Gn+V2IYxs/QIIkAQ
	8aOSYs7uQvAjmyze8HaII9VCuUPoFYkNJIRfBfjK+115M6sKLbMsnsSkf+XxZMNe
	d+Shjw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0thhrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 12:48:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21be5bb4so3030141cf.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782910115; x=1783514915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0iM+aBdfeyeVdfRfQMgUrQ6dZ7uV3WS3/3Rw/+vDw0=;
        b=QTsTA/7P0GQncAkGfkr5+0dCfqTd+ijQJDW7ODjBDyK1d2+9LciInpbElDhZPaPSv+
         +shPkqVapA3m5haxZcPmGyQj9orTHWfCq6woNsDE/jpqBHvAoigfIe3jq8iAZguBHcHM
         cZBVaLkpqWKSY7+sMvhH+oiOqa6J5DkPEb41YD6jVyA84jgFzvK22vdt0APtbZLuSeCK
         bb7FTegAygmrjhTRzPNM80ChneOGVFUgI072d4aUge06e+1eaz5U9ZG4pEkyZwIHLcXT
         oxJ/vkPwjy5nLoY1mfZMDTHjpWp+hsHoUyvofgGUjeTx0GtGdwb/XHgwEt4KCydnU5xs
         eBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910115; x=1783514915;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0iM+aBdfeyeVdfRfQMgUrQ6dZ7uV3WS3/3Rw/+vDw0=;
        b=QutapdKPCGdWPxdkjy9k+5YqSgCOLGjRhsWth7ZYzn7B0lYq8QD+GbU4zJXi0ndV3G
         NOpZSyZlwGqk7c5X43wuNDgbeYZ6RgOsajlk2lBMdx1AOjhaYXNKRZvLtu/o6IWFzlKp
         0Sp2LrN0YryepuBT/B8kxe1qnGyqVlfW00hIAvuK+4S0XS/YfPBfTLex/w1G+ovKwPEj
         cX741ZC3dtrJDkAAUjcKu5AzMa4YjlpGUgsrZu+eaft2/NAJXtPQeoGwSvb5GVeS80Hb
         On7TpEimuPUoiYuBliNjnh4xLSjSNHoqOjeJyNGR5Lo7K4/k+nkRlGzLddY7FmAfh7Q6
         21Cg==
X-Forwarded-Encrypted: i=1; AFNElJ+rC+n9mVxi//eUwVcPgx5FvnSJuOh1GXt4pV23liB1I2Xp0t7DGrB9DKoTokYajkXxARIqeW6uvA2v@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrv4HT7Xor+Uzx8A72hLdbLEaEEWO8LU3ZHX0Fe6LsC57EUClY
	zjQ/mvjo1akl3GnQDlcJOjMP7aJh7f91Bv04sYbiA8H5vVB+V2+FYpkKhhz0fLVF/9fQAw0nCrq
	q05N5saT92xYIsRBrzGysseRZKb6PtReaTPjn5+S6ItkraHBaMK0RtQYoT4lvH5Qr
X-Gm-Gg: AfdE7ckTdKwAAd4R0DIYbkfZ258GQGmrg6mDytcGyorIkiIMUEkLHEAmTVgzvl68hbf
	cRibBj1Jtqyea918bhRCMNoIXxDa+ARoxW0MObSra1mYiTRfObYfe/K4u0Y566W5Wtdr28/Nurf
	CaSS5BUnLZaR4lu57nELLcWZtqy+ordPhjBMmt7OjDj1BDzzhfJYSqevFYOGOzCUesOTc/edS9M
	Fk06loCy/+zfJig4O7o9j1ydbsvlEH9UdVbyjm0vFBp4cR5anHBo6LcRrKh3V5stDmZKGBYz+oF
	hdB44ZKfyK7/fKaVuF9sR0QuiqnUAZDPoaf/AQAfmr2OlePjW5o9xNo5xTDYALP/8mKn5C71Gau
	sWAJ0oyol8UajBR0i3lH7B82f0DIqzZTPuao=
X-Received: by 2002:ac8:5ad6:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c26a45ba4mr14246121cf.2.1782910115225;
        Wed, 01 Jul 2026 05:48:35 -0700 (PDT)
X-Received: by 2002:ac8:5ad6:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c26a45ba4mr14245681cf.2.1782910114612;
        Wed, 01 Jul 2026 05:48:34 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d18735sm271634966b.6.2026.07.01.05.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 05:48:33 -0700 (PDT)
Message-ID: <976824fc-335a-4f47-a4b6-29966137f2bf@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 14:48:31 +0200
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
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexey Minnekhanov <alexeymin@minlexx.ru>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
 <337d362d-93de-4e81-8141-a51fa75d615c@oss.qualcomm.com>
 <e282acd6-dfcb-45a6-977d-eb71b2619b7d@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e282acd6-dfcb-45a6-977d-eb71b2619b7d@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: K8LW2WMjUvP0EVOVlLtmMNXoleMyd7kS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzNSBTYWx0ZWRfXxc0cFmMw2FlV
 M3SXdYsEG7x615rweR5YdJrUeW/+pohK0Hs7uhUFTOv7r9U0jNcLTJzOFx2IEALRwtc4YsGeNVk
 lJJufFLsajlLODmyNnyoxxP4+Et3ZiQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzNSBTYWx0ZWRfXwenx6ofXL7ZU
 gaCexBp9CuG+ZGFdcP+LddcMxk5/zUDJBEgVlUbeb8LZpSVrWaWsnH1M0SpeX9SCWINNztMWySP
 MKT2UgOKocdS6n3mum4TQM4++f0bTM4jOD0bY4taX6kkg9ck5uIPYssURV6LODhwSFh502+RKCq
 cMJVZVSrihc/erM5qqHIbG0bic6nuaXkrJ9d1kBH0Vha6Z1EbBlIUUwUX79ZX/cGyDFFu6GqIFv
 GjA7ZP088eFjN82yYSXGFnUEObjWSd8FJ3pwPmBbqQV5lPqSJfFDsYH9kQzSmEKwZj4p0WGBtqh
 RVQYqdfN0R/YrFKw8XD9OF+A+77FlxL/g6aWtjQbsBBMe/E0LJD25dV9+1Gxq3XulDaF2RHivrg
 qRVXN5nFBeT7UuR4RmcyRYV817fOgWNYlK6zuXc+woqMmXmcavPSDCSLxU+kfcoZoSesxyEZRbv
 +CMnG9uzyBfGdcjj6zA==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a450ca3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Gv3PURsRAAAA:20 a=OuZLqq7tAAAA:8 a=1Z6vLoopVQRnxGewFmEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: K8LW2WMjUvP0EVOVlLtmMNXoleMyd7kS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010135

On 4/27/26 5:20 PM, Nickolay Goppen wrote:
> 
> 27.04.2026 14:49, Konrad Dybcio пишет:
>> On 4/22/26 5:39 PM, Nickolay Goppen wrote:
>>> Downstream [1] this region is marked as shared, reusable and dynamic so
>>> describe it that way.
>>>
>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
>>>
>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 9 ++++++---
>>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> index 4b47efdb57b2..36b419dea153 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> @@ -494,9 +494,12 @@ venus_region: venus@9f800000 {
>>>               no-map;
>>>           };
>>>   -        adsp_mem: adsp-region@f6000000 {
>>> -            reg = <0x0 0xf6000000 0x0 0x800000>;
>>> -            no-map;
>>> +        adsp_mem: adsp-region {
>>> +            compatible = "shared-dma-pool";
>>> +            alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>> Please make this = <0x0 0x80000000 0x0 0x80000000>; instead, since the RAM
>> starts at 0x80000000
> 
> +Alexey Min found out that on 3 GiB xiaomi-lavender RAM starts at 0x40000000
> 
> 40000000-855fffff : System RAM
>   40080000-41bfffff : Kernel code
>   42600000-42fd0fff : Kernel data
> 88f00000-8abfffff : System RAM
> 95000000-feabffff : System RAM

My docs happen to be silent on this subject..

Do you have a device that has more/less RAM to compare?

Konrad
