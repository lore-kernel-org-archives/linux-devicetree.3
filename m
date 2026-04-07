Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3AB3AEF21
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 11:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561874; cv=none; b=HsHro93msb8hyX4w8VHUIeIVmOX8h5BhKF5UcdMZ8XJq+3JhmaGb1MvJXdwwd/+xvyZqcrs7u4/EzERLFmKuKUliTyFToZih6Pfdkb1L2dVwZjzrrIiI6U9e8B9cljla8KvunF9tdvfURYjhZqLohATDjG4kKQcPjBU1uFEGOTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561874; c=relaxed/simple;
	bh=AAUWU3T40RCermjXyQnc0ic39PRqAOSXpaPxtOW5EnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUxwy9ITpj+aRn+q58Q9qzmRa2V8TJoHwkmy5It/5Ovq0ITSQMlJKHeS+xgILSJGK/3jRC9swdRFf8GX6S79tFhuRESf8Sn9HAr8fTCdlPaI+t/juNnyzRZGVvHzXdSOALA0eQxXH8Z+D3uqoUNtTtVqgoM8VVDEedVWyvlCx0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WEWboJXZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TvkdBxrA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WEWboJXZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TvkdBxrA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376gUWT492494
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 11:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Da1nHTgd+EuceiG6ERbILcBxiDHJ4mriLzYuQQqHCEk=; b=WEWboJXZaglsNzZ+
	5DmB8RrFoRDVyoHh8FtQHBaJ7PHhfV1/CTHqUwGOmglV4gdxs6Y8JvxM6w2FxxPL
	8H6QpQ0yQvSThHXGUxO6xywHSUf/rwLliPLfnz8P2rYiRQDOfxMsVA0ovoJXr/xa
	rBth0jsgWSMCobJZmspEI5lWAEM5X/oYiomy0wTbAId/+dNPpUHLw4S+fSlxyAAU
	k/RmZTjId/15Fsi1kxiXwlV5eQGzoKhUaGVAihcRcba8Vv8aOS/p5wwZvbebj9dc
	PPfKV27lKdhew1jQSnRw862XxB1Dm0hr69awQ5XEyeHdG6pO4z0E6swgipb3TTkj
	HMLULw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8tfat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 11:37:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89cd541c0edso27641976d6.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 04:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775561871; x=1776166671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Da1nHTgd+EuceiG6ERbILcBxiDHJ4mriLzYuQQqHCEk=;
        b=TvkdBxrA34+g7t4wTPunndN0JYYDY0wp7qumo24Dyc8vRpsKa+1LHeENgv8TpANCgg
         GjN7Me3+6WM8ZVxNpY3FZifaymAA4cB9oV7UMU5Xj7XzNgJZao3kcWOyx9yUvrfQBRyk
         GBW9ec2TsHi9FUNHXd2I+F47fWDDdIMxo+seu+O0Jcpcl4B0ugt9fsBfC5vkC5FA5mYE
         nl6gPmpeou95EzgF2sM2/dKTPwkb2kDk8Y2lqgZjKCxOiQT+sh9UsXGoddLaLP04WwFu
         WUUIwXnWsfIVhvh7eNxxoc6bIyCvkCOlbf/1i3e9GAIFfd0qrVbbClmUpzLw4Si61wQn
         Ma9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561871; x=1776166671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Da1nHTgd+EuceiG6ERbILcBxiDHJ4mriLzYuQQqHCEk=;
        b=S9FKdxYsoxDuIdg3rrCwQJMbPyIJa5C72h57kZhp0WOxtepIUHbHpHOeBgjRUsLwQA
         1bB2wd3nq0E6M/eB0aKEbDmPjGMkwS1d+dudHuVqHrf5X8HkuP6XvtvsHcPeH3E0BcFt
         VKeDc8bwE0ClsiSuz5yLs2pWs8fjgRLkES6oJIUBrQ+yUr4KunJBg5J0tfzBYR2vIZAo
         nq4kbBFFOIjCY+Sl7Yw1Gd9omO9CbKbqDvjHZYLoz+lCXe4E3s0dhEoGazNCokogwaa3
         mnXx3cCsH2eJz8VfLDvdMAWbYoeZwMWdvBzNArITOfrx/dYiRTMHoO7fPCFfM3POPknT
         9HSA==
X-Forwarded-Encrypted: i=1; AJvYcCXbNMfn6g2dpqxIabZyonAvKkbzrgAt3PlWSwEryrWjMpgQc+KSdAaY6cSTIPBPrdZ2Nyt/YIGzpC4Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxIcq1O7I8A5LQxJFrZJe4onWugPyoid1b7P1q7NK/GKaPQvWIO
	Uy/FGq5DUbAn7gbog7Ax236onuYiTDsTV1PC+golFP+QzqojGkVaAuJSgUTIm5mWWOmlOVDzv10
	tXa6EmLFxMFb6eNdVnkmpGfyDwHbo5/zRUJLJKaPe3goXSYEnzae45ZHLPrUz0t3j
X-Gm-Gg: AeBDiesYP6CYf3DaNZHkjVedU+zTAZfVkWero8V4fCt+7D1bHmFpkhcrNnhIXp8Qi9s
	PJVMIaFqgRyIlfFZGhDJLOWHFJmx7oNHa1xptUMtb5XknnMixQDjfs1mKZUqR6dX88Y4sjLHo9Y
	NRViIYLf1jFaV+GtlyKw5e+h1EeOy+rEFhdsqvce9T2gYDBsYJZSlH3mOcA9up+gLIQHcFSzFph
	HlmwlrqQ8OaEM/U9XvmajF62wEEOpnUKc3LMTYiR/IZIK8ux48rmkR41d9GWX9xtTBeCvhWKnMN
	uK62RgegJffoRL02W/5TLGSK3GHcpffmeEZN7ZrI9mTkdVWEVDu5VoZLjySsbvpxG3Ql1oUsnLA
	+U5plN6lFbUkIXyDAmvqhc4bFy+YLAyurjL6X5aOarjo13HhCU7ke+DY9wr2CrdyDLDeYgutJbO
	EouHY=
X-Received: by 2002:a05:6214:d4a:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-8a7023b5ce4mr195756596d6.1.1775561870901;
        Tue, 07 Apr 2026 04:37:50 -0700 (PDT)
X-Received: by 2002:a05:6214:d4a:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-8a7023b5ce4mr195756216d6.1.1775561870430;
        Tue, 07 Apr 2026 04:37:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d02885esm547639566b.60.2026.04.07.04.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:37:49 -0700 (PDT)
Message-ID: <05bdf5ec-ec0a-4a47-b03a-39a89039e7ee@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:37:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: kaanapali: Add USB support for
 Kaanapali SoC
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-2-krishna.kurapati@oss.qualcomm.com>
 <f971b7d9-8e88-446f-ac93-c3506bca83bb@oss.qualcomm.com>
 <3a415fae-bafc-4e23-bfca-564bff90cf2d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3a415fae-bafc-4e23-bfca-564bff90cf2d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 250Qfif1VksE3PvjfY_nvEv9oVfSRQhf
X-Proofpoint-ORIG-GUID: 250Qfif1VksE3PvjfY_nvEv9oVfSRQhf
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4ec8f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=P3oJegwuExavWH9XlUQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwOSBTYWx0ZWRfXzp11l82qBcPE
 0YvrYK7YnFKc97tgu7HRbrGprL/21CyqLszqHaL5CIr/a8AvJs0pb6dDxzyRkmsa+maNwgumhUV
 E3ZOozhXCMlbcm7vy5+/DpseReD++7C8FPH6rprgnYTigi4m5ztQGv8oRWY2D9dhpsdf66E/dqZ
 Mw5Kc8mkGc+hQX/ZQMIgdsVap6biSbBDVseZ0q7FqscYFe5l5Ct+jQNEjs7pVE59qE4vPlwQQ/Y
 aPyv0uOTmyh7oy1CUJL0WHgQUpnSitC3qpJuM4NxX1bZqL6R9DItS8dKbV/h5yBWcyOfW52c9RQ
 yQTMD0PMzdYJ6X8I5qqjJVPTdcsaU5KquMzA4Lcx/rv/ppYp8Qf7nSE08brPcih0TS4rNHl8wGQ
 ldCBgPtQY4qEOTiNDAPgZyNGgHv6M6Awod7nfza5QSqpcneni4afYAHT65+oUsxsAwwjAO2XocA
 EODRR8nv9wv1UCwVlJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070109

On 4/6/26 7:52 PM, Krishna Kurapati wrote:
> 
> 
> On 3/30/2026 2:48 PM, Konrad Dybcio wrote:
>> On 3/29/26 7:52 PM, Krishna Kurapati wrote:
>>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>>
>>> Add the base USB devicetree definitions for Kaanapali platform. The overall
>>> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
>>> (rev. v8) and M31 eUSB2 PHY.
>>>
>>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +        usb: usb@a600000 {
>>> +            compatible = "qcom,kaanapali-dwc3", "qcom,snps-dwc3";
>>> +            reg = <0x0 0x0a600000 0x0 0xfc100>;
>>
>> Following the woes on Hamoa, can the platform suspend and wake up
>> succesfully with the flattened DT node?
>>
> 
> There is a crash on resume when I tested but it comes up even without my changes:
> 
> [   65.263890] Call trace:
> [   65.266489]  kthreads_update_affinity+0x94/0x158 (P)
> [   65.271664]  kthreads_online_cpu+0x14/0x84
> [   65.275951]  cpuhp_invoke_callback+0xdc/0x1dc
> [   65.280514]  cpuhp_thread_fun+0x11c/0x168
> [   65.284717]  smpboot_thread_fn+0x1e4/0x24c
> [   65.289019]  kthread+0x104/0x124
> [   65.292411]  ret_from_fork+0x10/0x20
> [   65.296156] Code: f94002f7 eb1602ff 540003a0 f85f82e8 (b9402d09)
> [   65.302490] ---[ end trace 0000000000000000 ]---
> 
> Hence I believe my changes are not causing any crash.

Oh.. that's.. not good.. I was hoping someone tested that..

+Maria, Jingyi for awareness

Konrad
