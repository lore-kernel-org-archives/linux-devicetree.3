Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D224248DB
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239844; cv=none; b=dshfXRFy+irl3VaD4XMLfvh9yuwK0J27PhEnhdhYTteSFvEJWb9iamDr+YSEhBWCtK16Per0SqNB3yuZOrrlnG7gxvNcgkxORqMD5LTmrIXRAzeKJFZYm7RrKHS6e9lw07srAHnJh3nEHiFi30yXBBGft3iGLyaEjnuFURw5WDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239844; c=relaxed/simple;
	bh=R0+18gj6AnYazMfsiaMDRPWrwMWcw8U6uKMcltuMf8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7P4cJP2GqxX0j7jcSgQbY9M2MltW0bPaUQhKMNWlWu6DXpRCWuT8bKL7VGJ0J39nHe9mOxxZJttQE+/RA3MJZzkjK+BSHdcYmu7y1VT19SXVW9y8OwRthdIRV9A35V8ZZQk9wUQtuDMZr65vXFwA4IqizOHqTGmRINowea4Aug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l7ni2vCJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YLdroHoM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l7ni2vCJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YLdroHoM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O62M7J1475883
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLrrPrkJ4fjcOP/Rnsi7DYLaNzI7GpqYcTDrq2fiqkQ=; b=l7ni2vCJN9YvMB07
	qLu2e3Uq9aTLmiwhr8hiDZV5fzvT1rkomp4zWKe/7HzQIYNa//uUt0Ej/iYuNRzY
	PJLmXJ1AUk+hBUEeDnlmo3QwxFSRf629dLfMyVSAHxVGHXk+pt+5TC99bQMuCUOl
	2TtX8dkMlBvevxlJAHK6SbYkchpOM6ppyhsYjP0G177PLk3d/EMn/je9Jog0UrT8
	M7t2IIWoZmLp1rySAngE1ZXxsSIO1DbYqhnAHPHXgmZiOW6Hzoo7VEPjpf2e6gv5
	PiU6Bf9ewJq5xjC0YRR/zSpObhkUmvwQFr9nr7SxY04VF1oEhMrZlnvTyFv6DSF3
	Y4QN+A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8agn86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:50:38 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so2734234c88.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 01:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790239838; x=1790844638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLrrPrkJ4fjcOP/Rnsi7DYLaNzI7GpqYcTDrq2fiqkQ=;
        b=YLdroHoMxM3GZPpCGelPi9/PNmojUAHW5TZzr8ukBOmMYluBEtBZQxuKe4p0E5GGT3
         ops7Fr3Pj3XepQs4bzLR23J3bANJ+Mrdxhr+fQYMC4b8hLxscbKMkPBvIWx820gNN9LX
         b7ZcsVFBtUtVykqoFbly5/PM2dee51D2VN5q6zph0hl+jfFYcOfIujqKd6VNOn9vwPPC
         3ZQgSqvTh23geSIJrQ2Cua6xFTEYcsI4N9XWh9DgtFqs8mgarKgfnJIFQjaWscZ0nbQr
         44t0ltWuB9O0DTR6XFQeLVTg1az/XVXWoiDeUPoOxjJef/03z1bmqt7vnWIx5d9NhlJL
         1UDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790239838; x=1790844638;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLrrPrkJ4fjcOP/Rnsi7DYLaNzI7GpqYcTDrq2fiqkQ=;
        b=VDfP2DcmQ4XA2N8boKSthiMlIAYVXe4J2rEOXg7h5WSJJjFfSmhbjGtbNYMD45hCvG
         oxSfjQD2zS3NHl9Tk3lZ4zK0bIRv4ILXLJrUGLBkBoKLk887MSY/cIqoTTzQKx3yeVvL
         5BO60d1RuEX3dGF2AoZMRjbPZ+iQPcCdDcVBUqMNH8LOHmTnUOTAX3JaBIygSPPqkPs7
         BoHcpIDzmcpLXDz+jr6hFQDmF7z0wVtiBKS0MHPt7ukO8aP22ykhUbqtDhM33ZJEi57F
         xz5TpRGLzPUDHMzx3Dm6fbSrN7EZZgyNxa2pfHzGAgFwnGfX/Rj048M2zc98HsIo+hsk
         fNvg==
X-Forwarded-Encrypted: i=1; AKwUvBzY9iQQrMoPiBGhaEkMe7TysjR//JrE4EjLMbGDcXy5FNT9OTCUoiHkjG2SSiZet5yTC10U6+V+nFvf@vger.kernel.org
X-Gm-Message-State: AFuF++ku8ZNJPQUm8HEhG8Jn4+dPcyaPmRf9m03wzEsrYpPNvnu564ZY
	wGxYXdBwn/ZL6U/9PVaOLPmxadO5/e3Fo4LjOyKkFnQbb9omo7o2GqiopM8YnSEsGTRlmuF/Z2w
	av7xWDej+LpzYiBw1TKMmJeVqpHMscglmu0JgOwL82E4lj3Omgt4POyRXdTOQ8/Ip
X-Gm-Gg: AYBFou1IpdTv+5szL298erxzM+rgyJ9w1VNoWQVtAdDu+xDM+T7oeII1nIg9gzRRPYo
	98+DRtYo09tzuAQAYPeY6Gsn1TU0TaNm3aWan3CoT0eQ9edwjZDQME8mXC3AVmKD8r6VSV9xpEV
	RzZTk24anU62H3UMfFWbNYnBeSdbkSz4qW6nxJUSJl02vQsBB093woYiAagKalrqGsaTb8hLGPE
	UMHPk12lWrvYe0XaQi2KiUHOBxwiHCeelMsN0EdNFk+1VATzMCjM+KIV2XAMYJYyXgNKYjOHysB
	gT3mzb8yc0fRAfXo1zT3t1SD01uFakpmv1VB7+coRHeldIG78iGjwSH1313SxiPv1ndyduugyHA
	XiCmmlSf53O3C78B9+czCyjQ8ifZr72JP
X-Received: by 2002:a05:701b:451a:20b0:143:2970:bc5d with SMTP id a92af1059eb24-14503fd9bd7mr1416368c88.29.1790239838295;
        Thu, 24 Sep 2026 01:50:38 -0700 (PDT)
X-Received: by 2002:a05:701b:451a:20b0:143:2970:bc5d with SMTP id a92af1059eb24-14503fd9bd7mr1416336c88.29.1790239837691;
        Thu, 24 Sep 2026 01:50:37 -0700 (PDT)
Received: from [10.217.219.38] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98209ffsm11372800c88.4.2026.09.24.01.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 01:50:37 -0700 (PDT)
Message-ID: <09715ff3-df00-4ba7-8d9d-52b15e8b86df@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 14:20:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
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
 <79fc7d1b-98b2-455f-9a3d-d93602bb2bf8@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <79fc7d1b-98b2-455f-9a3d-d93602bb2bf8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfX2fGXA0xmON2K
 +gWEefm3LWtlnP0n+t9ttJE53ZB09qWVzZ/nUnvO6nqQsdiry0PQszST7Q/zNq5VkD8/rpn8YMp
 5o7t+Wv1OehDbfDEcsZ1Sn75+QfuwSE=
X-Proofpoint-ORIG-GUID: Rl4llkinGmoXZw6xagFKsZrVifEQdsgt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfXyeqCQgOx+/V4
 G8hYpvE/fK/JIheQh+6eILN6ihUDdWpVRwdl8JqbKEU6lhmJ+YPaDBmFuXSsm20zmEGWoQrtwDi
 TTtO2/63FDKnMgHnBs9ZSfTLh6f4dAlNqrQ/NpDbP1oIhweyWWk3xVlzB82puTWGxSSHqyUv+wA
 Scjel6MEyKO+dS9nb6JB72VmyCadk37WSPV5KqINwg5J3nyED4MwhaLcrJFzx6vFcKCA0Ts4z/q
 Hft455yNgdhYeiXpD86se4rYXwynwjbND+dnpfjLKyJqkF01lHUIi3p+t6gU2cRkz671Y450qOc
 ct3rQKjii9YmTWiqhokb2palfFHdIyRlxGhE0wlNSMnVw3No1LjinEYQenQRv0GbaxUVWS0+n/c
 gK0LndnswNVApSLGH3O1+egmOCl4iGWFh+uRJcEt2x7Qvhr9QhH+QQyACZt+U2+nBa5keTDgZZJ
 ZS/3GZrQR1p/Tj/fsNg==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab4e45e cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7w9Oa5uRL5oMzCgKYUYA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: Rl4llkinGmoXZw6xagFKsZrVifEQdsgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240037

Thanks Konrad, Bartosz !

On 9/23/2026 6:10 PM, Konrad Dybcio wrote:
> On 9/22/26 10:24 AM, Bartosz Golaszewski wrote:
>> On Tue, 22 Sep 2026 07:34:25 +0200, Mukesh Savaliya
>> <mukesh.savaliya@oss.qualcomm.com> said:
>>>
>>>
>>> On 9/21/2026 8:16 PM, Bartosz Golaszewski wrote:
>>> [...]
>>>
>>>> +#include <dt-bindings/dma/qcom-gpi.h>
>>>>    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>
>>>>    / {
>>>> @@ -909,6 +910,28 @@ soc: soc@0 {
>>>>    		dma-ranges = <0 0 0 0 0x10 0>;
>>>>    		ranges = <0 0 0 0 0x10 0>;
>>>>
>>>> +		gpi_dma2: dma-controller@800000 {
>>>> +			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
>>>> +			reg = <0x0 0x00800000 0x0 0x60000>;
>>>> +			#dma-cells = <3>;
>>>> +			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
>>>> +				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
>>>> +			dma-channels = <12>;
>>>> +			dma-channel-mask = <0xfff>;
>>>> +			iommus = <&apps_smmu_0 0x15b6 0x0>;
>>>> +			status = "disabled";
>>>
>>> we should be keeping GPI node default enabled similar to common QUPv3
>>> wrapper node.
>>> status = "ok" for all the nodes.
>>>
>>
>> The pattern across Qualcomm platforms seems to disable the GPI DMA nodes at
>> SoC-level and only enable them at board-level.
> 
> For no reason - the DMA engines may be reserved through TZ config,
> but for the past (high) N years that hasn't been the case
> 

There is a reason to reserve this from TZ. Some use cases require GPI to 
be available during early boot, before Linux is up and running, which 
necessitates keeping the GPI instance enabled.

Also, GPII is allocated per SE, while the GPI instance itself is shared 
across all SEs within a QUP. Given that a QUP typically contains eight 
SEs, it is likely that at least one SE will require GPI operation.

For that reason, my preference is to keep the GPI node enabled by 
default. However, if there is a strong preference to make this 
board-specific and enable it only where required, I can work with that 
approach as well.

I think it would be better to align on the expected default behavior 
now, rather than revisiting it later once additional users start 
depending on it.

> Konrad

