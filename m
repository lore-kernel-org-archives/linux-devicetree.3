Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCB839C635
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692884; cv=none; b=Ck+fzOGgvPOh+f974gCzsaWAg2X6VNuguKAsn+x2pxhyPcjhvedadrL36dZipZ86bk1JmTVMQ8o9FZQ3ryKj/2znZZsgH076WFLnNONiD5eSFsq9Z4DuBK8XV7AoAJmmAFJ1spirEk/meZAEuIN1BNg/Wyrz669+Qr11fFVfh8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692884; c=relaxed/simple;
	bh=v0IV5J3gGx2xBoYRV1R+Z4M7mKLMB7/0g67CTqMH8I8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4+2hQWB4NKDGPxLCssTfhm309mO8kXZejAvMrmlpLYIWkrqQ32NQyMgYceWUH3qYajRG0rtoShvbmsT+bSlGj6q3IV+8zw6SvtYDsaSOH6DWXIuzqBNsiM9h4t2i8IqBEUT+f+vOgtjzazDw7A4yIGDNHTwXQfeLpab2kBHEeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=geUkzH8u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M/xXQC/3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="geUkzH8u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M/xXQC/3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DG4t8r3007654
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	64CGNQDAMolvqQS+n3X5oH42IZWBrRm8X32aGPTCYYQ=; b=geUkzH8ugbIpy1OO
	62i4XuoCUdGn96ZBmA1yo51A95Momi59EYOGcFV5azv0uDMFXc2rmYbqJYfnnv+J
	M62iehyevwymqhPa7j71hG3u6PZIvcF1FSAqNZ4OQKjaafGN7Qnt3QTbpR5P51XR
	fyAIeaFfZ6Y3r2uUc/dK3GDBPAw/dLJp9MgmNStewb031BeqS+x/yCj0JuetEtix
	GctQFROAkvXEOYTNQxSzTk7Lsiigt+aJtIG+SFE1Ul+1VXuzD31kJX8Jnd5mGYI2
	DOK7nnzuXE5UYm+JgYHJKjHKo0cCIKveS8Zza3DRK8cILZ1iLvh3WfjhxVcHNq5x
	hS+kLw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0hs2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 17:21:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba268cb5e6so62930415ad.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692881; x=1779297681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=64CGNQDAMolvqQS+n3X5oH42IZWBrRm8X32aGPTCYYQ=;
        b=M/xXQC/3fN4ep3debvkLTw8+QIXB5WRKdN3B4P6i36neUziYsuuz9RZuxq3KnZsck7
         UeMw0DPPI4R7znq5VAOWw9x8FFC6wdT45jBF7kSEUX3pxow4m0G5gsFlGKJGQJ1Vl4nc
         9fn85MVcfzSXEz7aAI1UYL12T67DiayEuK4kFxa+0BSMT25h/axYNXlVwDzbjXejEVJa
         5331ZM5RzU+o2pYen/L7jlQhQa/lsSgXg5WWf5RBd6ZxavLPboWwxKCo6QfPJjTEpcE3
         337JGjSOYGTHZhmFjxg/mHDfGHMQH9sO8jyX9ZEuwA2w3U5QSwJw4163+ylIpyplwOy3
         DYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692881; x=1779297681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64CGNQDAMolvqQS+n3X5oH42IZWBrRm8X32aGPTCYYQ=;
        b=a7htbnAIekpHHArhSXcsDQU8eZJhy6R8C4tcLHmA1EcYBGMSBljC5RLti09zib3xE4
         9mttwRBY+mjKnO8gsQWFSY405AzIkR9TqHIwDvAUjeoVQvP2zCPRN170dUQasFKe/mH1
         8pO/z7UqINVxF3pvTAV6EVQY2WpFQZs1NwVjn3SfVRHcqjK9+ku6s3F8cQwtjZYzbo+/
         oySyq2XtjIbVAxoidF/WyXrqMOzdskTK0j1t3I5Askdj2MyrD5IbJRUdRLjfaZFB71Ag
         0lbLK1cnLojPT5IJ2E9rLmch4ACwTky1dYcI2ooqhdv97xKT/kWQVfBYVlXtDxi2hm5z
         YxlA==
X-Forwarded-Encrypted: i=1; AFNElJ8h35fmZW+iJCGH96dsoPT/WxmJh4sDd2zQtQ/wsaUP0e00PHIAn+XnV2Wotrr4jWcIQDRsyAXhen3T@vger.kernel.org
X-Gm-Message-State: AOJu0YyDTYXA7kxJ6eqPPBrcJpuixZ+FRcZvfm3xEb82PzkHofzLqAKs
	Z5x8HMK2Zp/p2YVM3gFCofhj/k//sIebI1vj1+pw9+4sULtacyL0k79aSMhApFRTY/q3zFrb36Y
	SQbPws7iG4CmuTRmArhMzL8LqssMFUj6uG6wHteicLgjmiAd8Xur8P/d+vq3zvoIg
X-Gm-Gg: Acq92OFjx+a9GgRBawjKLtrclzbU5jAGouAcvBB+BsY9WgmGnwUDGkAAssI7iqXwzqv
	vxTC5tJOmw1duH/encVtqq4/VLLllwnxbmHbaO36OmzEeKqQ6IfJQRH2havLcYxESRLOjE4AxGx
	XgD1owGUnZHlPmfgp+P2jTXOHJRH8d9rTeWU1DyysrbRW5eS3OgvY4lfP5AD+9uYpwU81ZNHGdr
	qiKSLOY5fzNN6nsKhtu5Ui98EtePyrHcdljFI3YD2a+VEtAPpLRO/LltJchrbv8jCUAGVamwNUf
	pmNhFpNj0GzJBmqqPIC+cvZ6/NRCDcUWEUGCQ9NCyNSGF2e67w+a2AF2ZoHSjFlgTLYMD7IyWPe
	c2S89VVYJDDBchG5X4k3uBmBAAcqjeYoPpY8MOTVQk1iMzMRU3DE=
X-Received: by 2002:a17:903:f8c:b0:2bd:147d:c712 with SMTP id d9443c01a7336-2bd27133c75mr48060925ad.1.1778692880450;
        Wed, 13 May 2026 10:21:20 -0700 (PDT)
X-Received: by 2002:a17:903:f8c:b0:2bd:147d:c712 with SMTP id d9443c01a7336-2bd27133c75mr48060635ad.1.1778692879972;
        Wed, 13 May 2026 10:21:19 -0700 (PDT)
Received: from [192.168.29.116] ([49.37.147.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d271d1sm174203325ad.11.2026.05.13.10.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 10:21:19 -0700 (PDT)
Message-ID: <3ba11863-e7cb-4697-af67-44a26b19ca8e@oss.qualcomm.com>
Date: Wed, 13 May 2026 22:51:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] dt-bindings: crypto: qcom,ice: Fix missing
 power-domain and iface clk
To: Bjorn Andersson <andersson@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Neeraj Soni
 <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
 <20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com>
 <afmuncmBrrvddHTU@gondor.apana.org.au>
 <b8805117-d54f-4e42-a7d4-6fa18af63e69@oss.qualcomm.com>
 <CC0E438D-5544-4BB8-8512-7F93A7FA4DC1@oss.qualcomm.com>
 <af6MsD1wDs9EZl5q@gondor.apana.org.au> <agHkmKq-q7_6m4nl@baldur>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <agHkmKq-q7_6m4nl@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfX+h5b2w51AojV
 pEAz3P6L1JG0qI6V42q7Zq7UAjFWdarVT1DncdrjXyT0w9iCA9x298ZaOYWrmOHuEMLNAObt7Bh
 24K5H8UFwPwhrvOGxOBqelr2Ctz71hNvzCf9ptvTaVAm1tf5KPk4ITp7eJLNQ+E55cuyKAe6ZiB
 peUtu4lciKyMppudOVzPvlCep9jiNtCQgq5KZvDx/pBHGdqSd7f3Ro9JKeaxv9dSIfXUhCJcSga
 aYpuUMJoMQVcWADQXeuCMVMiCQpjqhAEtsMdPYL7HXyZgu/rWWoRmJhlt9OE5tWqaB8qNpza2Ua
 Wk0svwalpMl+rkYqlIVxgl5RNnOqxP6bGzCmUiaUAzMFYWrUEHdmEqUKstu8N5k/+PRCfad7B5+
 XgN6R5ELfMgCU6pNwKB6idiwbHspjwd3gjr120y9YWj/qpo1oSyT/+AU3uhkXll1bpiOB07Fyzc
 155AdkNEm0mLxRucPKQ==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a04b311 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ck3DHw2mBQFJDQxCZQbCAw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=FNyBlpCuAAAA:8 a=EUspDBNiAAAA:8
 a=ntcFNnzPSak53SQFYkoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=RlW-AWeGUCXs_Nkyno-6:22
X-Proofpoint-ORIG-GUID: BfbaECbsxxKPA7FPw_oStf3gSY-9M125
X-Proofpoint-GUID: BfbaECbsxxKPA7FPw_oStf3gSY-9M125
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130174

Hi Bjorn,

On 5/11/2026 7:47 PM, Bjorn Andersson wrote:
> On Sat, May 09, 2026 at 09:24:00AM +0800, Herbert Xu wrote:
>> On Fri, May 08, 2026 at 08:11:45PM +0530, Harshal Dev wrote:
>>>
>>> Can you please confirm for Bjorn once
>>> that you're not picking this up and he
>>> can pick it from his tree? 
>>
>> Bjorn, please feel free to pick this patch up.
>>
> 
> Thanks Herbert, I've picked the binding up.
> If you need it, you can find it at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com
> 

I hope you are planning to pick up the rest of the fixes in this series. I can
see Kernel CI Robot reported some dtcheck warnings since your tree doesn't yet
have patch 12 and 13 from this series which have the corresponding DTS changes
to comply to this DT binding.

https://lore.kernel.org/all/202605130731.Gi7H8zjD-lkp@intel.com/#R

If we can pick the rest of the fixes in this series, the warnings would be resolved.

Many thanks for your support,
Harshal

> Regards,
> Bjorn
> 
>> Thanks,
>> -- 
>> Email: Herbert Xu <herbert@gondor.apana.org.au>
>> Home Page: http://gondor.apana.org.au/~herbert/
>> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

