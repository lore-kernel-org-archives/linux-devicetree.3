Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4332F8E8B
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277230; cv=none; b=luQj9GOSai3f4kUkM9TcXW5J6ywyV5NOPNvFQXQyjAqUgAllpGSzloZRpnIF6hjn1KBK6PNwBtkksH5oUqblJlBVC3VltQ2xs8nVxNvjyxn5d+do8pbb7CSsiA5LzYi8dmAQMxmF/gT37GgNLdbJXLisbjvB6Uo0GyU7pUSbVO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277230; c=relaxed/simple;
	bh=5mweL13Xvi7aC3ka9r7V/CZE6DjWraUDvHAd/V7OHVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jo5XMu8b+srS14ISHnPVV8dYMZKKoAnFpZOre1CoLgoeBN1Zvd0C2oSi8pBafI+z5Kx2luVByy1b/Oabtg+NkHXJQXdkTEhzZatAQJujS32mERREB1g1InN7SefoO5wRTxUCjkAyBlHYB9K6FAHejRPbXkU8whmziaOP7INLqmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bjaqrLMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=duOsTEg6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bjaqrLMR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="duOsTEg6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7CU0R2065134
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NKD+goykCEWe7P3VDwM4HDQDAaDkCtngcJEhO1J07pU=; b=bjaqrLMRChx1UJAj
	B8kV6Gb1S5Me1buGmKtvQPqBHfGBXfSoV06zU6alnNvX0KF5+z23Eekr4Wrlq8iz
	Ah0vk5Uj4wsTc7cp6HxLGhQluy43lVbXKca6T7Im8cPk2avrvUuScNc5hlpzPI6q
	50PaMy0x0MhPQzfiYA9YNyNHl9QkOmn61jC2Q3xjwqSJcSK7IFYLAPp2GzawaZ2Z
	EG94rlNTD4ILMYuK5els/mADZt9F6TMjJ8G+KNTsrWO/cKzyCIAs8xrPm/GLM0Wx
	dr7e6RQSg5BE9YwgmXV+EucH1wZOlzLk+GqNfGWz6O27c9KauOBhxkKDEQVyPg5p
	HBTk1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t4f7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:40:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50ff0bef198so134797721cf.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 04:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779277227; x=1779882027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NKD+goykCEWe7P3VDwM4HDQDAaDkCtngcJEhO1J07pU=;
        b=duOsTEg6yNaGqUhPdDr9Pur8kpqMOtxVz/a0Y3zMQrXTAXW4L6ovLt6BUMjVpuinIC
         wGxDP9rsqdsrV+VgYBJEB5/qjssG8MdkreW66dE71RgBLQI2QYQHyvNu4czx3/FutWpM
         6rgm8g1X8dvOPeF6YwCU26PF3GhfE5KgkcGG3WL8/9b/kzy+7k96WN4BbvXZspY/nvoS
         eItg5WGQiMGVezlDYTXENzNT/IL5sXUGY9xfcQlAHDkhr5xmb/AXSgNihDrjfm2kTnby
         XidFaOzYodKO6c1lvcCsjeN0Bu098KdOb5euZmGKv/66h/KTqZI770GiyG/fq58yRvnq
         v1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779277227; x=1779882027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKD+goykCEWe7P3VDwM4HDQDAaDkCtngcJEhO1J07pU=;
        b=Ri3hKaso6Cm9f+Io6SYZ3Ob81CTldsa2qPB5tLHi6Ipwpav41PAzTaPTWjVWP9klLU
         FDz7HILoLOzFiAepqQwKGmqMmrp81381uJovX0Nc6csfH0ZiIO//i7iaJQ0T3a1FGg8D
         Xm60KL0ee6xW2fWHeTRT7Jwz9H102M7OvQFW0VZAEpdbcfpdG3z57yqZGT9UMRcnound
         rGTdOkBFMsqstM9+G/asiSzutJSd1HQTJT5FgjD0tx8AQRulnwar5i3ROZLLVwwK7rkJ
         tdmdjuvJKw4frhpjiHF2Wqm9nGRVXdpfCMVrIjCp2CsPzEAZLsNHxrua+gAj3iKRd48z
         P0SQ==
X-Forwarded-Encrypted: i=1; AFNElJ9N1G9lhX2dwhT7nHdh4bGdg0AahtuHxexrviljdyqVVWISsxbJ/vV4LN2NBe+/CZDpQgVq0PP8NeBV@vger.kernel.org
X-Gm-Message-State: AOJu0YyZF34RLuy6EBKmSwc5HcvSEGbSlS5OIflloX1Bw/8FYOw3SD5u
	ayPrWM0zGAOtxjM3VrlCNcJoEBOj7I+Wdsk/l21IowYczZmnGy87Isu20dnyRgqxgQR7/gmido9
	po37aST2IzfPJd/NE5Cg+iW3ypvV9UKb8ROxlphl6ygl5mcRa+LOZlFsr2bHPPq9P
X-Gm-Gg: Acq92OE/GblApK58veg9pXf8VEhI239PnYeXTMxzxGfiaJVVPxc/mfqhBIxe2AxdWso
	zc0RwLI7fyY20yizBSiOsq535ISyJH1r2IdRBkdDZD6vupc4VGb/Q0whgVCxe6JXaTSDe/NPSrY
	35ChUpLPmnVerOKPcjnYnkfS0KIcMSuKMDSpA2apjT6T+tcsKcngFomoStD0+J8mwqe4dSfUNhe
	eJt4qE53n5Kq8NTx9lMDsrlb3XOMO/B1LCPV1WieVCxqQO2ysGxhFEROEQMbO88j37+GfXYriaR
	dnHaLb3Rz3xk23H2BFIJsm8kLu0M6LkrijLQ0sdIwOm9WHE1C0M7mNZZNaWyEVpZah0bZVA/K48
	SeY0WihXVQwFugEdGzSr5As0GvV9Poa/A5gNLaozlqIG9SH9D
X-Received: by 2002:a05:622a:5c9a:b0:50d:8056:da41 with SMTP id d75a77b69052e-5165a002bd4mr327620091cf.2.1779277227247;
        Wed, 20 May 2026 04:40:27 -0700 (PDT)
X-Received: by 2002:a05:622a:5c9a:b0:50d:8056:da41 with SMTP id d75a77b69052e-5165a002bd4mr327619641cf.2.1779277226827;
        Wed, 20 May 2026 04:40:26 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe537c788sm372948175e9.12.2026.05.20.04.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 04:40:25 -0700 (PDT)
Message-ID: <83a1cb82-add9-4896-8fa2-8550822b795a@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:40:24 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 5/5] arm64: dts: qcom: glymur-crd: add Audio sound card
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
 <20260325035338.1393287-6-sibi.sankar@oss.qualcomm.com>
 <f097c75a-0c33-499b-9910-b23182d4472b@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <f097c75a-0c33-499b-9910-b23182d4472b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _EI0tn8N4N2jlPbEfHhNwr6fx8BpbcOZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDExMiBTYWx0ZWRfX779E71HKFDbU
 WvWrHXvtz6oOIjTZpDHaViFQapkBP+/Q7VCfdGV0J3s9D0CN3wtvmdS2KGPMbp6E63CkEqTvRpT
 EUubQxNaadW8Dvf4YLGtBWYefQ5yL8OXhDyDUPxvB7KA+eF958WUy+5JnNQhGUyq9S0AEIT/D7v
 BWEvPR6+T2gwyEsPr8sCI7aZo87LAxJfWi2+jhudry9F++i6MdPnecsmDGD9eT1sZyBVyn81aBI
 M7xuW886XG8tkUxfm7OLtXdU93e3TTtQGYs0W9AYdbQDg89+UdN1Nydhg5NMhCFiEVzdZL+uKDF
 vMo1jDGn69XfMXVZLOPfsVN8uEyRqrfeMUr4NJBCqydH5zcElDUit9jBRaP6XsKBbst9VzM4aIz
 HaENtluY/MfGRcLaY/tSgDnX/5lacCmkaVDoQEAQJxHn82dv8vCRrlnwcComTxzH2WTAWLHNu6V
 /0HODE/4VnWV80vLk8Q==
X-Proofpoint-ORIG-GUID: _EI0tn8N4N2jlPbEfHhNwr6fx8BpbcOZ
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0d9dab cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7MBKnE05AAAA:20 a=EUspDBNiAAAA:8 a=Wz4qH61WVlOTaqajxdAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200112



On 5/20/26 12:29 PM, Krzysztof Kozlowski wrote:
> On 25/03/2026 04:53, Sibi Sankar wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> Add the sound card of Glymur-crd board with the routing for speakers.
>>
>> Add device nodes for the sound support with WSA884x smart speakers
>> and playback via speakers and recording via DMIC microphones.
>>
>> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 110 +++++++++++++++++++++++
>>  1 file changed, 110 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> index 690b90e3d6ce..88a5c63e8ac2 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> @@ -118,6 +118,54 @@ vreg_wwan: regulator-wwan {
>>  		pinctrl-0 = <&wwan_reg_en>;
>>  		pinctrl-names = "default";
>>  	};
>> +
>> +	sound {
>> +		compatible = "qcom,glymur-sndcard";
>> +		model = "glymur-crd";
> 
> That's not the name which was already used in Audioreach topology and
> maybe other places.
I agree this should be GLYMUR-CRD as per
https://github.com/linux-msm/audioreach-topology/blob/main/CMakeLists.txt#L24

--srini
> 
> While it is fine to use whatever case you wish, please also fix that
> users of this name.
> 
> Best regards,
> Krzysztof

