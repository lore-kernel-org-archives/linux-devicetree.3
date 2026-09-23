Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0619D51CF4F
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167255; cv=none; b=dfoZMowpGF71UNx+WVWYdjqsZnFV6kWoA1D9zWjEZ9xjTSV51gCVHPslDNXfe3Xvv1Y4xSRNXyp8+mlNtWR6c+bDcmdWOhJcs9ww26838h3bbuW5AYvSnfRxP/epGdFbvAvzhPG638v/K9LMaX8jg3wfweW6LqPagw0/37I4JRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167255; c=relaxed/simple;
	bh=ra3LHdA+5xvPhAgvEIGCp8+5b17NgjKWDPJ9xc6kah4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HuuYtWZnZKWXDYIMHGq175IP0uDQsWvEqQ/WCCSaDMXypTKh60pYhsbLGbK1DoRZfzQTUngRMo65kGOVxH9GN1XevMLX8UxAnS0E5Xu09fZlijqYK1DkJgZF0PSPbJv8OB+TCeJv6uUmbZkoNvZcf8Tz8uetRoigg7tAwK2eBYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxz0zWpN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N5YKWIPM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxz0zWpN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N5YKWIPM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbjlQ099342
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XP5ekwUxYsFJiFFQNRBI2Jm5dW+Kv/6VqPxiUZsZRlY=; b=hxz0zWpN5UW8C3hG
	rYM5CjlV8Acc76LEgiPfLtQ5eYBQ+b8WHpv4IIA5+OyJlYTzCFD75ZT9go9tUQcx
	pd/TSWmGr3hSpFMVTj4cz+nQlZx9VY9oDbY40XvjjzRgnky9waw9FdWAFr7BhrIq
	tauIHX+ALbTdW7bEEuiyn1ag81n+ZjLsgjQaAjms4G6X9yWah3HG9skgFJKoDkSe
	Ojw/S6Rb7RXvEboQfwX0aAnMrDPHmOfL1jHUJfnOUdNomAZFXqrWAcu8b5w1cYC9
	rhi0WB1iUzj1PPGGtCa5E9iGpqaN/hyK9gdS/Lyec3N2ab7hI3twvZs+m/f9QtIE
	v3d6cg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c4cg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:40:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530e0def61aso2540871cf.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790167252; x=1790772052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP5ekwUxYsFJiFFQNRBI2Jm5dW+Kv/6VqPxiUZsZRlY=;
        b=N5YKWIPMmU0Ha2rPiMsnLIs2G3p//iPEVBJh3Dlo5EKgiyLLiZjcVh77B77ZUHCvfi
         Fhy5jbxkMJ4I3xKI02jl+JhhrdgFQtaeKjrLFSOIQOTOrKV0UIlNHgN9d92msIyE7/g9
         wo0nmA67ruq9OULgY63KKdJflx4GQMkTzZNmiLtS7phi5soS65Upn60z0FASbUSayFGS
         nRYrZPyAIUcj1z2pMA+ReubMGnStE5laGEnWmcCRzhDoDX72G7KIbLbimnsJObXLX3y5
         Pf9t3za0Kk044XPeotyv3psOwWFtUeRmwWiWyO/PL7uy4byeix6BP2MIV561RYmhxhl5
         Ah8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167252; x=1790772052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XP5ekwUxYsFJiFFQNRBI2Jm5dW+Kv/6VqPxiUZsZRlY=;
        b=cW0qtMd1Q46K+jHBuR/X6cfFY0wO9fvMl0Q5App7qlDVXnfYOzk3yPpBlLgSLNgOWV
         wVY08jyeTbOnny2cczrMf05Z8IMTxRouGWjwWMZXgwS1+iryfONQ4kfbIHOlUhSfwYrw
         /9KEEnwhb0GiIUhmirJCTUTWoULfxne47eN9VbpGcm5XlpULi5xcLAjf+pqGWqcgp5Sa
         KkPsfMDNYLLAzAfu/xI4eNLpMmZemWWEJ71cpummJ8QeVGCZGdApo/jELikbWbEkjNma
         ACEbz2epv27KXJJaIhEmubB4JCWeS5eGX+YcSoG7jf2B3gQc/izQ5kE5ui/4+5Ja4c64
         ftRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTKyVbZOttAj2H4izODjc709MPYMzgCWkSc0OqmstDvcrZqFU6ZUmyrZKIPSM/rrKFFM6wSY8FZkoX@vger.kernel.org
X-Gm-Message-State: AFuF++mIZ392VbgwZhwMdSd5Ma7CnXGbHg+L/IVlHb1YbbHAIMd7saTu
	My8vLIYmGyZk1kxCviaTNVY8Yy4V1QLbtyTbgoz2zry9puLh8TI/fbaN0C0QzB6PRmdXY8MrIqP
	RkIkdn/WiBx2It0NbBhXylR0rLTMm3wGMy0OB4+OKHtzkNmPMzh2z0NiOqb+rxePU
X-Gm-Gg: AYBFou0L6elnJwGgqP+vDT/1IS3EJoEOCm1VFAfRLyUyfsYwAB8VF6HltV5675zoOJm
	cZTknJ939zv6XIY5jixhJLvdp3v47/6UVFZWRGMUrglcBu/p6Qx2G0akC/o7oi7gE/WX7XbjkFW
	kir7QN0yWUOJ8b/vOXI9JIV8RYFoEybzytTnUNaBxeLLGaEgio0+LV054Mrs0E/ORjNdYjlqhzh
	24sbP8i6/fDTUrKKzpvQZ+8m7gbgSMkFdiohFySSNBp5T3KJYkfbQ09rD/vjBqnzzM2OvtqCgaj
	Dq0mWu7GAyU7s1wWfAjmVK+wKVXY5GDHU0jgid6O67M0sZjEgduay0pZvABEG+7rM61fnoyY9F7
	HXFNg+Ea74HT4fOM0x6Cx2g==
X-Received: by 2002:a05:6214:8624:b0:912:3334:f40e with SMTP id 6a1803df08f44-9140c50a449mr32719866d6.3.1790167252036;
        Wed, 23 Sep 2026 05:40:52 -0700 (PDT)
X-Received: by 2002:a05:6214:8624:b0:912:3334:f40e with SMTP id 6a1803df08f44-9140c50a449mr32719466d6.3.1790167251395;
        Wed, 23 Sep 2026 05:40:51 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38bc04esm1615096a12.29.2026.09.23.05.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:40:50 -0700 (PDT)
Message-ID: <79fc7d1b-98b2-455f-9a3d-d93602bb2bf8@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:40:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
To: Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
 <20260921-nord-gpi-dts-v2-1-4f297c983b94@oss.qualcomm.com>
 <16f1b504-c414-4072-98d3-49f60d552028@oss.qualcomm.com>
 <CAMRc=MfBGgJXhn_c6RY9qhe-JAYjcy8vZOeKgK=cSpOW1ap0zA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=MfBGgJXhn_c6RY9qhe-JAYjcy8vZOeKgK=cSpOW1ap0zA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX/W/GylYgEFDA
 2WDN+oIYZHvfuyn/D6PEmRO41OAKDC9FdgS1upP4PHyMuRV1NTTWoJ53U+bx9xfGbGPdIwYGGl7
 3uWSopz+5D/gNURAyJPNdK9/j4FXH5998QKYYoczqUIzxDD+Wijc18fMJjlePZw57xmEnBq82g+
 x2HGzLUucyJXl9vbQUIdVm+29AOxOsbraSdVYp7FXZY0u0d/k5JlLqu1E7WsCGbX76f4mYz3IFs
 iiIH1BQhb/5RirbJGw4/c/fIk3z4KGX37CaTz46iyk5Wx+Vl2+bEYLp8u/SN2zPVEYo1bWOBPGc
 u0x5fJRkmtQEXZeOy7HL1uCtZVnSNGb2nk9/VAXs66gvfNrTWhGG5CO77T2uAPLTSeDvGCiANyN
 cbpBhyKTLspkx07uXC2NTMK0MXk1+DihNv2Ve+TlQgJTsrEw/mdbVfJI0e5cbkr/IJbyevmMtJ+
 s6aFGWHwCJQLigsni1A==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab3c8d5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=uF-LihhT4cVmO8x6xb0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: PbLSmtiaeC2Rtyl6rk6nFe29YK2GMz4E
X-Proofpoint-GUID: PbLSmtiaeC2Rtyl6rk6nFe29YK2GMz4E
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfXwdeVgg4rgRZ6
 OE5czn1p2XdY9H+MtaVT3hKajJwVMXCXibPUSNhJjL/3LLpOsMOE82DbxKBIqVh4gHDblh8M4Nj
 G58t61ZgLSIJy2Z44gU202vjg2AWTrM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230050

On 9/22/26 10:24 AM, Bartosz Golaszewski wrote:
> On Tue, 22 Sep 2026 07:34:25 +0200, Mukesh Savaliya
> <mukesh.savaliya@oss.qualcomm.com> said:
>>
>>
>> On 9/21/2026 8:16 PM, Bartosz Golaszewski wrote:
>> [...]
>>
>>> +#include <dt-bindings/dma/qcom-gpi.h>
>>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>
>>>   / {
>>> @@ -909,6 +910,28 @@ soc: soc@0 {
>>>   		dma-ranges = <0 0 0 0 0x10 0>;
>>>   		ranges = <0 0 0 0 0x10 0>;
>>>
>>> +		gpi_dma2: dma-controller@800000 {
>>> +			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
>>> +			reg = <0x0 0x00800000 0x0 0x60000>;
>>> +			#dma-cells = <3>;
>>> +			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
>>> +			dma-channels = <12>;
>>> +			dma-channel-mask = <0xfff>;
>>> +			iommus = <&apps_smmu_0 0x15b6 0x0>;
>>> +			status = "disabled";
>>
>> we should be keeping GPI node default enabled similar to common QUPv3
>> wrapper node.
>> status = "ok" for all the nodes.
>>
> 
> The pattern across Qualcomm platforms seems to disable the GPI DMA nodes at
> SoC-level and only enable them at board-level.

For no reason - the DMA engines may be reserved through TZ config,
but for the past (high) N years that hasn't been the case

Konrad
