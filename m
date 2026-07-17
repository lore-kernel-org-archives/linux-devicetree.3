Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160DB3C4161
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784281178; cv=none; b=Nkn7bnWXujBzNr4BMoJv0XqyjvVj33CmpuIrgWTFeAyEbw8++pFFr1igr6vqk0QZdYzjK26/05dOjj2lPcGCSZG//GNUbzLx9nTnWNs9JIPBNyLHJIBhBhuqBoE4dZ6kJxMkVhr2NGD88AbpuK109FcYWUFgGucpTNqS+bxAJRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784281178; c=relaxed/simple;
	bh=5gAME2FTMRdONT+mgbmdMkVf+H1uNJGz1uz6g7VeeHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cPB2MilxJfDtxM/It8ooGy8wPTe4zdCjpWm9Q8sTMnx2bMGdkjmYV6Jd61AGdY9O/A0Ah1zB2zmEWp1deNvEBc9bISLcRQmV23gL7WKLSIVvrDJo+JRMEMKZUdKtkIDStpeLuOrAFtjZ9lHU/1gcIb/cb02AN1ggkh+N6cnC3R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XyCvOPv6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iu/9H75m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XyCvOPv6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iu/9H75m"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cSaf851587
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jyqbs5VX1AZAzGmoe0ZpX2cAHCbvIOHvWU/YH9+EhY0=; b=XyCvOPv6Ve9aebdG
	NilvDjKI67gpPDWhyQYvg15Rw1S5iGinQ1094mRc1wh1fD1E6ZoBs4/K3v8P35CK
	xsPRwHCF4fZ11Ej7nCfhyln5C6KM0NaTFYqfn1BniQppT3qClRfO2TqUVMd+36Xt
	KqbY0hETPw1RTwLrPG7JuFeZzad4DxBoXbfPnI/74HGSCx4OFPYnRiLZeF5T5mVF
	vz4SYe88L01spNaZUgB/RWSgwXrVAPH2aN9f4m++1eyrDxg9LCsw1IriPnkQKJo+
	nyVTfYCEPHkavL9z3ubF9QsfCNetE2YBVoC/jSiT3j3vptfNvb23IgzqgLNiIVea
	sr6ttQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9p8png-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:39:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930a312222dso44003585a.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 02:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784281175; x=1784885975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jyqbs5VX1AZAzGmoe0ZpX2cAHCbvIOHvWU/YH9+EhY0=;
        b=iu/9H75mZRSJmTD8dOXsZ5NvmEhiyP8wB0sUM+wVGgm3WMX/Rg8aDCYemZPqES9PuA
         qeTXg0nXVt/dBLSiOAyfj6De6xoZccuCgr8MT+aUhc90IixuCtQXSwCxK/R3EB6Kljlw
         eSTh8uq6iK3VDcb2gITDDGIF/S1JP6nbgE7J/4CoHm9sHvWnUZOLkteuOgLyE5/LLXyI
         rCI8uBGKu2HAZhiJ6Q9yPua01QVAiBsHlVqP/eUB9SsRWbhz2M3N/XdJm+If9VCBJqXn
         CoWuUWDxHXNKSpBb7Dyn+XrylyopnlrGw/V3d9BNGGbmY8ld88BTKuMykl0j51FRa2Wm
         1kuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784281175; x=1784885975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jyqbs5VX1AZAzGmoe0ZpX2cAHCbvIOHvWU/YH9+EhY0=;
        b=caO1GOt6E6d0Nxg1xtrr5istgsO9DOJG0Kojn7ElW8K2zWA8ijXHDqluDJlKVZL4F7
         jXbowP2SgvnzM6X0JOFyYfLL1BLPwoxEDUXX2qUuCrLCAXZbKeSwYZYEEgjR/DUSpfjF
         XGKty7k9r+4h2amzUkUP5stU41/fnW7Wt85cAs4P9SG4ud+DCr3qoxe62C7X+9b27n/f
         q227QEU6FY7VXB64zj9coTFqvVWyeyav9s/eNrhl2kcjFANyUF5aZQu66B0NgGhBEEcf
         +CDaAo3tjb4MNH8su1ne0AnCIPYX2+1oslWLEwG+taWXj/RfpYM6xyEwVMSL9jQWPjkW
         92Pw==
X-Forwarded-Encrypted: i=1; AHgh+RrTGPNR/we22FxZhQ0KRKQS2KXIF/qxvm5tYrca+MB4hmONUkePma3dEIKnhtnJMT/UeBXnxegtMHTA@vger.kernel.org
X-Gm-Message-State: AOJu0YymhQ66G2GlR33ILI0eOFZi1w7XKt1LvUBxdwvx5pXIeJGkHE5G
	rl7gC3BXxBWw9iAO2C+vmsdgh/GjaNVed5xivMx2K62uigQ9siCZkOoRtVPhjECLuqwM1rx9JmT
	oLIHHiOZzAxAv8S7/XQnn48RLXIAIOQLDt28VP4X5CvKceaNoptBCUngUh8dqtBb/
X-Gm-Gg: AfdE7cmropgKuF+CRSCpEB1cnWmfsexjzbRiOWtgFu9biF+ohAaeyzgiX1Z+xjs9p0b
	SrWGlFEfevd5LFgad5pP59RNEGGJb0euoKzX8PC5uO3M7JSAZrh83EPSZKtg+FPGXH5VtOUgQpS
	zGTFkHvTarFSiCsioi2n3KdNQlgjng2obeTpK8gw2C0JrYN7xC742kmhugmTmFdpSEcgKHq1nYM
	td+unGThtu1aHmaCBWFnc8G/akgIAoFYkLSdvqfGndkcyf761cdfq64X+k67XUFTNeERuEhZR9e
	DUUn3JUjLf1Gl5mDXnbcJ/ixjVyY0ElRZjAQUNojNO08WhXmC081+fsPsxFZ0D1YfWItSf7T0Qb
	vinSE1kHYyfvItqhr4JlrENPC
X-Received: by 2002:a05:620a:7206:b0:92e:5ef1:9072 with SMTP id af79cd13be357-930b3e657famr117868185a.2.1784281175412;
        Fri, 17 Jul 2026 02:39:35 -0700 (PDT)
X-Received: by 2002:a05:620a:7206:b0:92e:5ef1:9072 with SMTP id af79cd13be357-930b3e657famr117866385a.2.1784281175038;
        Fri, 17 Jul 2026 02:39:35 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a63b41sm47264766b.29.2026.07.17.02.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 02:39:33 -0700 (PDT)
Message-ID: <f4dcf2af-1be7-458c-9ca8-1dfcec4756f4@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:39:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: agatti: add LPASS devices
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kenrel.org
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223133950.221234-4-srinivas.kandagatla@oss.qualcomm.com>
 <07cb095b-7765-4810-a8e3-db2bd9ba6276@oss.qualcomm.com>
 <db2942d7-720e-46de-a614-d9469a72d69a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <db2942d7-720e-46de-a614-d9469a72d69a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vLxifOxZW3fc6fowiit_idwSEcJeO24-
X-Proofpoint-ORIG-GUID: vLxifOxZW3fc6fowiit_idwSEcJeO24-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5NiBTYWx0ZWRfX690Izmm/BbRn
 btmG6Eq94p0jw2a/37Ni9KwqWmimygxLGVV8Bo9SzLOW9mrIh7+CHnibSHar+ri4V3J8K6mU8IT
 m+Tw88W//7KLsJO9j1LDdfJHWXlav6BfBg0NdR+9LsExARY/4Thf3mrO+8gagRNF3gzVwED9a+v
 UmA7caaBdTIcGZKUDM3JEhjowSgi9Gpj/Gyz6QfpvGCG9iQZXfQrFt26Wdzf7MpzDmu2vZNbH3h
 aGgm9dlrfvulk67rVVf6MrknZn0d/hl64d2Vck6lU+r+XKab7hnP/Qqo+p/y51QrFHgFKooCwDX
 GgGdDFABf3b+hJg5f1U+q+oxpj31wBUvt1zLSVeBleMzOM39a1hnX8uFqNW6B3RY8ZMOtu5rehL
 mn+YlhWpIEjtRf0mleIqddXEW/BwFIbzZoaLDjQlIrTKl2nlN7dNEpJ6dptsS58ALEnKzHj1BFE
 hTmETO8jy5xH4ipTFtg==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a59f857 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=N_t_Gz8xgAOtm4XUUk0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5NiBTYWx0ZWRfX8zsaIhqZ8c31
 4S7x03Ftvp1mJY8nO/2PUBpCn4SxDu6+igI9CV9KJlCgaesfoVcHMTUEeKRBcEaZDbIyXQKxiSc
 q5yW4rLStvZ0kui/pg/zm2iUvoXIvZE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170096

On 5/15/26 10:29 AM, Srinivas Kandagatla wrote:
> On 2/24/26 12:28 PM, Konrad Dybcio wrote:
>> On 2/23/26 2:39 PM, Srinivas Kandagatla wrote:
>>> From: Alexey Klimov <alexey.klimov@linaro.org>
>>>
>>> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
>>> controllers are required to support audio playback and
>>> audio capture on sm6115 and its derivatives.
>>>
>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> ---


> I would suggest that we use the existing mechanism which is more future
> proof.
> 
> 
> Please suggest otherwise, I would like to move on with enabling audio on
> UNO Q platform.

If you pinky-promise we are never ever going to need the other registers
(or if we do, you'll be able to represent them reasonably), we can go
forward with the established practice

Konrad
