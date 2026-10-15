Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EB4348C4B
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055204; cv=none; b=R92qc2zKRb5eVCdAQWilvgp+nxRgzZJ8fQHHOLgvCDXvBP00m32RVbpyy4YNClCTO6Qncfeq8f7T4m055oppHZRVoFkMbIt9dKPISLdb+DRiHlZ6WIWbIoyKuP+SqRoxRyBlcaOBoFDWyZr+oSODcJluFOr7vAwpR2OiP/Ig6EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055204; c=relaxed/simple;
	bh=hRvmS7HUGoD8xJPe1ZdyMzwjqKR/gvUwFIWJ5Wlb7gg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ICteJ5G+XFz3fVOg/K6tcm8KtMEtjqPxllMEwz8c5N2jNhk5TU9YohZZNCdGk2cmQUNnWCHHkBOQtd8zIHVzuuP2zIb34c9G3z/jDzXnO8/kaeQ7FzCDRMEEovsjKq9LGBGFsTh51cSpCjxD/K/U+qCvR+LNLPHzL7qTOLkZ7QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWuzVa9v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tb9coyoy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWuzVa9v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tb9coyoy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7GVFk1682879
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Io4/K9Sj1XWPi0z9IBC3bsZlbFqJq593ZpSHYazw4OM=; b=mWuzVa9vP/kfK4Ze
	sDTpL6cPo1nrikdg/NS39MX7mhV2JRjKl/LpcQ2fTmFzKTxx5Y0IhWwnkUTu7KCD
	BNpaHIgHzdOddPeH36KsI1kJ6AQLl8JSyZLoyJS3d4RmSXoaJrFl9g0EoxkvAe9b
	BZU5DxCPMc9/kNHTYohR2sJNJPFtOKjwYFv0aRFQ/urP1ep015g0w3AGDGLQF5hP
	LVjBmDOl5NuTXR0e3GcZ4Lq7CVsg0nGP2PNPpFi0clsUGgq5A9+xwgL69DwsQsS+
	WPvsAQPlysP+qGG3ybjS7JPAKdeCxmxwrGEo//z9f5btISh0q8bofYD7gs+HflDk
	BGvCjw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb03q69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:06:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5350d8a2368so11335831cf.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055202; x=1792660002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Io4/K9Sj1XWPi0z9IBC3bsZlbFqJq593ZpSHYazw4OM=;
        b=Tb9coyoyDKNux7BeumhjIAnMfBlY+i190ULR1pasHFElBL5ISYt6L7L2zwel1hsXaF
         /0OafpZb217yFq/kR1AJJnQ2AZVnJqxQmBusV6X5n2jFhJCwUJGIUdI4QtFZe1vmsbQW
         vc8Od1a5SuaXp1VyKFCtlxnbsjyIgJhBZ2Jr0rE+nel3xinWRXjDu1ExTaq6+A9m+E+G
         yM7V8w5bwFLkeP3zIs6tE00HlOZeJVrQEKYTml03hmd4kbErEesFTzshZk1nYAwqw/Ol
         qABRWn7d5FwfsPFsXV2dx7+WEUr6K6Ng55PHj+9Ih/SNbgE3VqPCvQKHoYRwZcfAI5uf
         4F9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055202; x=1792660002;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Io4/K9Sj1XWPi0z9IBC3bsZlbFqJq593ZpSHYazw4OM=;
        b=FHFlhDcmybs73DuHpsi2LGgOFptTyCeipTq2+nFxeK9IK7Rq1zIK7zrw27S+3ANXSx
         Ixh2OHAxhCN35CPSuTqW7Dyao4F6KtbvNGJQB3BqHCw4ikeiUyM90TL+SFWGCqYalZmn
         BMuFteYkBnf70tElEYapxn5XTa8sBmhsiGE7D4qykVEx5dk35BTadDPTm613WehJy4++
         tL9p5SJ9OdQfxa33xXBoiFjOiY1xsWqyTvgYraQIbaeYgGVeJSJpIzI9rVjtU6PSygkF
         S5Y4sRBGtB0x9SAnYvrXaka7wy3Qt9s4+urI6K0is3t8OEeu8dlsCs5bw8AxUzX79QhU
         BVLA==
X-Forwarded-Encrypted: i=1; AKwUvByJKdbFb83F7jFfknVMRskb0gu6OdBxKTP8Iplnyt4JA8ehtKCUSkNpu2z/BWlWyIScZ2nEgUlNplPk@vger.kernel.org
X-Gm-Message-State: AFq9FYLCMK2N3uudyDFxAiUu6XhNe7MeRYQ/fMBeQyOL20QOQ0PPKNqC
	0Mg3LYkekBYit461VLHbhAnqzKVSLq80BFiovdM9lcrGVojXmZ1EFHYUUFlDvnLxULTG7fMaNuP
	aq+PPFKaz3NijuvUu7sW5sqcC2jamMwmjK2vG31kL4QdnqPfSzgppp44nza6uVbUs
X-Gm-Gg: AYBFou0K6fPMuPfS+4d7C4z/X77TMyAECSraQHpSRWJ+1X9CVbibGFvlWJlUjwK8KSY
	WyofM8kcCUAQx6wIdBZADgrKiFTO45rbpQ4vw0Uc9YbUdR4gJupEAvgumxQnKlAAvhY9S2BElfF
	BOvLSURNwVD9+PCfMaumn3rL9J5qJHJ2WemKz8mHUvPWM9/LikFs5QR/qtzK7pnuD4jVryNPH6c
	9cOUm2kUVtv8PNM/wN2vU5pHGr7srxFpa4lZxs+YR8PFgbhdWH/1LdaqRAsouhPxks+pPOEJJp0
	BEVYCd1vP5/pWroe3ZJii7LPKKdvOUmrYfk4UZEOE/6FOQPCtYAcB9rolrRX7MnZ+x1RRgncyDE
	0ZJMP+aADah5BREVI7J6Xjw==
X-Received: by 2002:a05:622a:1487:b0:535:2447:3cff with SMTP id d75a77b69052e-5359fa5726emr359124261cf.3.1792055201855;
        Thu, 15 Oct 2026 02:06:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1487:b0:535:2447:3cff with SMTP id d75a77b69052e-5359fa5726emr359123701cf.3.1792055201159;
        Thu, 15 Oct 2026 02:06:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6bea622sm100933166b.5.2026.10.15.02.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:06:39 -0700 (PDT)
Message-ID: <1ee9b624-4580-4650-8e48-d517ce9eee3d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:06:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: kaanapali: Add CoreSight nodes for
 APSS debug block
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-0-c2a8c3225a2e@oss.qualcomm.com>
 <20260922-add-etm-devices-for-multiple-qcom-platforms-v1-3-c2a8c3225a2e@oss.qualcomm.com>
 <f34b2632-840c-4761-bc35-deed96b9405f@oss.qualcomm.com>
 <b410aa8f-c4a0-438b-a02d-765da25dc160@oss.qualcomm.com>
 <686fe87e-63a2-4358-a6b9-8b2107b369e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <686fe87e-63a2-4358-a6b9-8b2107b369e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad097a2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Fxoanj2GYMTtFSnlM7QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX6hWxCz0jcLkA
 wSKB99faHGZUuQUPJ4gJ9Z/fAIWeCzJ1YCY7ES9u05K50XweBPd3SZydyUS/2moEM56iTo1nJIY
 htUXw5wuaoRq2Ill9VGAMXSibi8oz9g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX6sW6jVJc4bgB
 VlWiScZzXP/fkkbInwLrifa/tMYd7vbKtingL6PLrQuqixHcjf+XzZU2km0CXcatUGqnuGPtw5b
 Mgi7/7zyC8uiqZImwoJIJ/gv2nTY4Jfx6GZH+5fpkxM8FGFJFLmA8IiQ3OMMnX9QAafktLt6c/1
 59HQyMlqyASNpdfyOIEO6iA6QrGLkKLbl6GcXgCYldlDr3w5kIWze0MN30ikwvL5F411Y5sgaoH
 BLEsl4yubWfJo+bchRf04OEtpuPeCSJ7Lufuru6rAn13yfet6TpovSrOMFQR0eXmukgky2InTqy
 gQI7tPzlu96gtecuos9UlDaAy5/py2DR0J7+JxK8tuRXnBJDCEA4BMh19Ngsy/K9dlrCE2o0biB
 qhKOW84UmXql+5JFPSEWdiQqyU2B+BjZu/nlmRdhi2Zu/40B4bFHDk1vIPfVZWwATpBFqXDupdT
 UmcyHg3X3/Vzw3rk1bg==
X-Proofpoint-ORIG-GUID: 71SUNJG_xkj5r6TtSBcc5NtJEEsy-GHI
X-Proofpoint-GUID: 71SUNJG_xkj5r6TtSBcc5NtJEEsy-GHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 4:26 AM, Jie Gan wrote:
> 
> 
> On 10/14/2026 9:23 AM, Jie Gan wrote:
>>
>>
>> On 10/13/2026 8:49 PM, Konrad Dybcio wrote:
>>> On 9/22/26 12:35 PM, Jie Gan wrote:
>>>> The APSS debug block is built with CoreSight devices like ETE,
>>>> replicator, funnel and TMC ETF. Add dt nodes for these devices to enable
>>>> ETM trace.

[...]

>>>> +        tmc@1d029000 {
>>>> +            compatible = "arm,coresight-tmc", "arm,primecell";
>>>> +            reg = <0x0 0x1d029000 0x0 0x1000>;
>>>> +
>>>> +            clocks = <&aoss_qmp>;
>>>> +            clock-names = "apb_pclk";
>>>> +            power-domains = <&cluster_pd>;
>>>
>>> Is there only being a single cluster_pd a mistake on kaanapali?
>>>
>>
>>  From psci map, KNP only has one cluster_pd shared among all CPUs.
>>
>> Hi Jingyi,
>>
>> Can you please help to comment this part?
> 
> Hi Konrad,
> 
> We have cross checked the cluster info.
> 
> The PD configuration for these two clusters is identical byte-for-byte and is based on cluster_cl5. I believe this is why they share the same cluster PD.
> 
>                 domain-idle-states {
>                         cluster_cl5: cluster-sleep-0 {
>                                 compatible = "domain-idle-state";
>                                 arm,psci-suspend-param = <0x01000054>;
>                                 entry-latency-us = <2150>;
>                                 exit-latency-us = <1983>;
>                                 min-residency-us = <9144>;
>                         };

Right, the configuration is the same, but ganging them up in a single
power-domain prevents one of the clusters from going offline
independently from Linux's PoV

Konrad
