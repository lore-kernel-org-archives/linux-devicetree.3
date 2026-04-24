Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD1F18DB35
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 05:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009587; cv=none; b=Gwlco3EPV8klCDTzBaUM3m5uF8aDzRekh8HB4HyVymAbRdCT8DzTlWRCDsF4nna0Alji1+0+M5svN4UKzQlZeZNDMuhjfJyAlMJASpXRP9SQMz6ZXcyh/JAIWKIwI1Poh8RoekktCs80KAftRAt/xYjBwoXZWuOKRWfenRGbO/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009587; c=relaxed/simple;
	bh=6h0E1rgdxczYU0CT5P2lJCAiRg/cHchvRh282wnoUjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4aDhaERxmr8AvSS79kpchkY0dYyRRkAYW4irhDGo/GLvKeShXMweOE4Jd/oo3pE+jX8Iym2Pcdi0CLNMbQG4rTrmuIjw44YEkxPo6bWHX9I8dJTCp9AETOR+Up3hoGaFAPyn/3gKUu3nYH/m0FIhEOHkRaJfFb2gF5xmSm25SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rm4qOSEb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fBW5PAwq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rm4qOSEb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fBW5PAwq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O2ABSA2710093
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 05:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9gUsVSvv3gW8kZzUU59zczVlqNb8Y6Af8gyP4aWpdqk=; b=Rm4qOSEb4Y/2PlLc
	nX65NWUC8pwzCNLangZYdFEZhYrsAhtUkHraBeFDRZRJzRDQhpdjqSu4XG7n6wRE
	/MlkC4wTEPIgUEHFU2RQQ2ds2OXlfY6NAH9HXwnxLEfgamkAOrbZXfmfC8x9wS+Y
	jAM05X1WUdt6da8y+64jVVLVTtxZ4RqdFeyenD6mI3i7wc/spvmzzRbpt5m2KOau
	za+i/qdT0/HkIz18qcxb8p2iUxKoj0iO40TP1gq9sIY2Ed0gw3QxHPN4bgDUfXxY
	II4ZGIUlc6CYKtmg4PWjJT4vLrstCFpKH5il4MWYIm9d6Z9Jk1/ZQvwFwlBQ2UIw
	eDfznw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqqu9te7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 05:46:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f9f49e4beso3839117b3a.0
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 22:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777009584; x=1777614384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9gUsVSvv3gW8kZzUU59zczVlqNb8Y6Af8gyP4aWpdqk=;
        b=fBW5PAwqZMEazfN8lZgWOERhzJRjG7GmMJtCLW+KV9MPJrcRnBvKW8o/bZWES00cBj
         mCff0qY5jP/dAOHNJv5z2/r1xMOd0X2JzqnIKLPK1yUoo3frMMzIX09EA/k2uLzcJeZd
         iB5z5c0mr756tlmqwRLgpxjrQMBuohQDCxRCZ4Hbp9+k8zzLJJrEf2MEiHUzcZM+cpd2
         MkndTcbGpAJCPHDFe7GUg63Tnxj70dZaLVOoeRoo8W4/NmF0c+fdRQ8g9kNmpKhpUqlh
         LvUxIY3cK1kJ+FvONOBoFX2PaA6MdCQKXQp0ERhlq4L8/aZfAsO4py0qQYnmsK7Avjq5
         PCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009584; x=1777614384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gUsVSvv3gW8kZzUU59zczVlqNb8Y6Af8gyP4aWpdqk=;
        b=nerUdmwE8Yebkctu96V5eXsYHubTyV/ACAaU/B1M92e84vTNRMpqBvuGfXvhTvQ0hI
         f64uHytMyrBJkMrSLaz79BEX6lLt15T2ax+xlecra8Fx84UUwBUKv8BX43vXUxCOOGsE
         Wr0pWfM0kqt+6yTC2MGB2ho1GloZHLR5yytu0Il8O9QUNzbkNI+TFUIyuU1a9lFrI4f6
         n/VJl6nvNjtRf8g52j66R2u1nv12xSa7UzyzojA18oRiEZAPSCbbcVfQ1C5BT0kCBjFd
         WdpChIewBVeCfElI5R4fx4FvmJi0f5lwtU6qNCy3MNpUnaTIq/CgFmcnpGlUp0YkFbre
         JFdg==
X-Forwarded-Encrypted: i=1; AFNElJ+XtCICe6ivxUxacfEHH5xAlctT60ARuCECiT3r3Bi3hKaoPWdVj4s5YSBJJ8naGYIgNx5w7TyF36Dr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4zs37/QYHSg7TMl4fNtqPRtSE0ttDltDFCfkcN4JyMNfql0aT
	kwzXf/pXeiIjMxixZmvoMwzpQKVEbggO0/yWzQerEYv42icuSnJGk2e8Rp+H57e7TcvVMR5cXuO
	EvtdxTSS182wQfAiu36sva630UgZP/K9O7ntDJsWVETSllsoZHEmItK/D4r5PfMQ6
X-Gm-Gg: AeBDietpBXtmHkjfbbpacHuUuwIahTIl2+DT2OQhs2pQD4RxbOKq9kA7Z29Ac41fLhE
	wTUjGq596RWfZFDykyFZEDw8H5EKRqaw5gFFOqvPN3QuqRm5CKrBwD5OmhFuQyBJ7BEMjZLVVuz
	KDQQFidNdyfWBEYGj15Lpis/84layN1jqpUetBNxl/MuttSJym/wgJuh7AHFMOcZ0AQmn3m/qHD
	lY35S7QYlfr28tRjgvBWJeT42b2CxVP6XmWs1fNmzRLKahrzqaqGx0zEA2TMkYYiYmXR6Bzdtzk
	qFsDGOoptsfhwAw24gsA00rahSztUdpLlAEgOSYdtL4wNoYJjtotKHqFQW1IlzjyVNkZURrOhmE
	laSlUMFfTVHvVQ0i4C+jdTTf7ocSCR4ZUUzNJnY14YQ/++h6KVuPAMj6t
X-Received: by 2002:a05:6a00:1da1:b0:82f:2319:7d4a with SMTP id d2e1a72fcca58-82f8c91a5d1mr28410109b3a.31.1777009583690;
        Thu, 23 Apr 2026 22:46:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:1da1:b0:82f:2319:7d4a with SMTP id d2e1a72fcca58-82f8c91a5d1mr28410089b3a.31.1777009583197;
        Thu, 23 Apr 2026 22:46:23 -0700 (PDT)
Received: from [10.218.15.94] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819e5sm23122727b3a.2.2026.04.23.22.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 22:46:22 -0700 (PDT)
Message-ID: <dee9cc4c-2495-4214-867b-98344c847441@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:16:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Add WCD headset
 playback and record for qcs6490-rb3gen2 industrial mezzanine
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260423071951.3181130-1-karthik.s@oss.qualcomm.com>
 <eab2d0b8-a949-47d8-b953-fe34bd2fd869@kernel.org>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <eab2d0b8-a949-47d8-b953-fe34bd2fd869@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M4Dt1b9Rq6wr1gPgrAdneJ8srWFfp2B4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA1MCBTYWx0ZWRfX/UDdYThg0Wlm
 Q245JGHCMmdtMpmuqHjvp5ZV85sVxLF576q7VC0fz8SpImcwUrdF5ZEY9pQwGO5KoK0Wjxjhsdd
 6lAIB2EqdK08ZsJ/woInRLa1RpUNNSvXT96uNHszlCs0zEvsXwZiPUdm2b6qNNcmyWQkzDqIRUh
 qgj5Hz3+eIEoHkfMbhsfmqCAF8kKPzxhbnY1MzcBYUgU0SNvyNrdodHNF3pxJupkXrB1Lt15SyY
 NB484Pw9+Oi+86kqTtPJT8SMu0td4nrouaLsz2xMPlo0oM/Ot1u6OlzR+5zqTj4YozBIqGdXbVd
 XQD2JSHvh/WXvjrmss1XBNO2wxfboCb8C2dCCjGCQvcfvw5dRHeC+RWzA+gXSdAg75vvRCPUH+Y
 JCQ/rnq4boiDYaUUDQYyjABRlpXW4OWUbIyOfFOXOx7I8vC2tCIZSgHpfoFqEM1YB4vtgXy9c9E
 RPK6wEZCvSGqrYgju1g==
X-Proofpoint-ORIG-GUID: M4Dt1b9Rq6wr1gPgrAdneJ8srWFfp2B4
X-Authority-Analysis: v=2.4 cv=QJNYgALL c=1 sm=1 tr=0 ts=69eb03b0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=AUdvcLI8t8Vz5Mycy7wA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240050



On 4/23/2026 12:50 PM, Krzysztof Kozlowski wrote:
> On 23/04/2026 09:19, Karthik S wrote:
>> Add WCD playback and capture DAI link to sound node. Add WCD
>> codec node and corresponding soundwire nodes to perform
>> headset playback and record.
>>
>> Changes since v1:
>> 	- "audio-codec" node moved before "regulator".
>> 	- renaming node from "audio-codec-0" to "audio-codec".
>> 	- dt-nodes sorted alphabetically.
>> 	- patchwise run on the patch and indentation errors fixed.
> This goes to changelog, so under ---. Take a look at other patches how
> they do it.

okay thanks for letting me know, will change as you suggested.

Thanks and regards,
Karthik S
