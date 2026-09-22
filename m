Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5C32FCBF6
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077957; cv=none; b=fkv0QXra7VNDFJl3M0+7ikoOZSE7LT6YfKpvIRzPPsdKMyO27S+dJUDGwUaUr7qDhIPQf2aOvTwyy14txTDAbVqlfQkgXgfqF9tyDlOZCKQiJNu/GZ9nK8LLKVebCLkHqxRvxOeJB7KAx07aG+2iRi3yVaCcDLcNuR+iunGh+lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077957; c=relaxed/simple;
	bh=T89j8VKqzweQ0KLy+jjZG+qbjjoAhGr42G/i9t9i+Oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4y7ily+XBW3SFirznSdFgC8XjDUIJUGnjRbSshc54yWq9XcN9KPNVH3KtGpz4R2BQCVQzpAGDe3f3Qamnd1c/D+9fTyfSj/Qv10wE1iXV8wkUtvuvLuRlyqQgI/u+kLl6b/NoZGXxi/WTlIxJzuQ+IaiSTxSDEjVj7aklVGMXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NY5A8ZMO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNgoCpW2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NY5A8ZMO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNgoCpW2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPhiR134476
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OSzVe56P75eSef8q8l3pV+jAAl+kO19DnhJhuOgKX8g=; b=NY5A8ZMOqBmyeT0/
	lk9wp+3ePbXrw2rSN9eAmhEiMu+WRypitsQmSbGcGWP6o9s/ZV5eE8ZrkzfKnh0B
	evDJMGGnciHbs7JEy88eCIzt61vFcFEIyXv91sokecPUSrGVPoTtHm0iyXWz7bGj
	DEJBooOBgPUkt66cHju4sP+E+QW/SLQUN+k9QkydAK8FWSWmT3PYMZ9OnsCBFnfi
	6m4RNHYiSgrUV8VdbUWNnybNd24B84y8JUsMeyuPYA/odgSVT2BBlNmZQKQ9/eJH
	AUF8qk8gPFLkfn51L+9VsUBtJa3SOHShxIKg+k4akLoY7MU/HKUv1Utb81jTYbER
	kxwWXw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj9qgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:52:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9106a836457so13042196d6.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790077954; x=1790682754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSzVe56P75eSef8q8l3pV+jAAl+kO19DnhJhuOgKX8g=;
        b=dNgoCpW2TMdBYCL2mcgYmOOfVhsC9bIX2x7NMW8sGP6erVPXUyOkiKHH/Yz/b2PkY4
         phW3gdf14gWqosseflsIglOi/neglni7o5tsKh2k2wyuC9g+ThN5uaA6ZqtLQz/FKhEZ
         0DU2q47GYmTXCitlrNOkiH5171WWfdCnm74idh5yX/KMrXssX2TcdNUzqjRorqtMnHzH
         apOw2TW0LuGKRj6jjNx8r6QzhdAAjHnFRvHS1xdeqtMYjEEwR5YnjypYXqaRgIp5vnBN
         l0eFJU2imOc22UDHY00Hq933Tazy5TI0M9kn+GglwKKL/3iELxOyCmqJbrz7cfQ1eA0L
         BqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790077954; x=1790682754;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSzVe56P75eSef8q8l3pV+jAAl+kO19DnhJhuOgKX8g=;
        b=FidLF5sHV7GKhTbICOe1PMqvOLufI04zne9qfVLbZIeU+zcUhE48ZYIk3sDX+zUmEH
         Q9z0ONd10LOMgDEIeNgPz7/XEqH9W0Kt91BubC9kwt59HvwrRHjYkjNZ+edEi2iotyNN
         6BZZogLyLsHk3je8NECFjvpxl0Sk0Z8rANgh3jg4egk+aiEvx/6EfW34VvOKU0R8CB/l
         hlJqwCfTnaRnzJDc+oiJrRRMnvq+QWHCyHO/ldV2qRI0RycoW+SCrm2cczEjlA8mLvJ1
         k7RLcJxKvMVcM0m00ok4TovuPZ2/Fgec7WnN2VR/K4E/HIl77HMu80XKA+2zBwH3Z9Zi
         N9qQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaOU8U1OLQrl2/DKOl15zN60Os3B9sD4c5JuqTmyo+OE80X60X7MLVWaamI5s8/tlavAiwcaqb58FG@vger.kernel.org
X-Gm-Message-State: AFuF++kruRFcqxXcgaGJDeSLU4p4b4ABUomnrDu1fZ1tkMSthKH2TxiM
	+7GoVEyftjW+8Mo/Vnn2hWkLXm3JuUcdvO2f9QpiC74nMcxrZ/k3tgDBRO1xcVKT2WrCcPQTQaS
	CAq9lfvWTeDmgP9GokkIlC+FEPcKb77+/TlUVXBpIdyuACUxV1KArSbxziTWj3mnt
X-Gm-Gg: AYBFou07mAOp+VQWMqzmZ5cveQFjK08a1er0ZOrloq+I3IVveEf9Nf9jHlOu4mFQP7Y
	XCvoTweIac36W6bdQEUNYz5tr15gqBNwe1inZZvxHmhtI5FKmO/Mj8gLsF27cRI0TSBiE9iRTcW
	zrZ5KK+K+YXNnWc9dOPgJFAJpshV568S5BKt2IBWy/HMLqkLCkuntMX2hn75UHPNpl05xff7F1F
	BrtHJT/mK5LY4jnAQxZGUP+BSgeNrTHNi8RXNFeY37AzxIdweO+/mQuKLyo5Ta+ygwt3YId/uhW
	l/Fbx/vzwNt+piBHhzByaI09yIu91p9k3nvuUpOmocY8f0z0WSrn3mUb8RKp5sIqvvFUNPsKkGe
	gXZvO2Sti/+NN/I7TnezAjQ==
X-Received: by 2002:ad4:5ca8:0:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-913fc9782acmr52216516d6.4.1790077954219;
        Tue, 22 Sep 2026 04:52:34 -0700 (PDT)
X-Received: by 2002:ad4:5ca8:0:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-913fc9782acmr52215976d6.4.1790077953615;
        Tue, 22 Sep 2026 04:52:33 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5e6dbcsm72096666b.41.2026.09.22.04.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:52:32 -0700 (PDT)
Message-ID: <94dc2136-cbfb-4be8-b74b-9d61b94e8cdf@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 13:52:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: Add initial Valve Deckard
 devicetree
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org>
 <20260922-topic-sm8650-deckard-initial-dt-v1-2-c25e7759d04a@linaro.org>
 <bc3d3df8-a2dd-4ac5-8064-d54d4eaa3f6a@oss.qualcomm.com>
 <b2112da7-dbb6-49fa-ae10-b9e4d47d4495@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b2112da7-dbb6-49fa-ae10-b9e4d47d4495@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gGRUllkuCY168V9luUDcY0ZQLANO2Kuj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3MSBTYWx0ZWRfX70oq4oSQA0A8
 cIHpaae6rGg8kBWLjSx3GLEVItDwpCIJ49DwweTThAe9iIub2BSB3R57/X/TvQinMabJgFA3Wyu
 TFa731J7mHx64fZqBf54FfXmTYws7URjMnS64DEZOdZM/jF/gGWCqlZwzj1JePsBcsNqHuh/3dY
 YpImorMWM5zCnTj8ByIpT8RcBMVvJdqJLn3Dvmpu8xtvDLa3Gyfu2xOsc6zYHI0D8UoMDdLrv4i
 wF9CBYq3hiX1h0Ua2gpgFbxQg3QmKkZ2F509xr07zgP8YdGCPP0u2kkCTX1ob0WY6Kf5ryC53GF
 XModcYsgmxgtDkYfZn4Mx3B4rl2qw9iCB4fciHAfgFd/P9HvGh+G5o7E11cCriF1TIriVNYjTEO
 eBArqhCqRT4EMOA8GtH74erfWWbo09Nx9DC2VRmecuNejQsNCS98ZvS+mLt4H+0Nvc48bE8f9fS
 giJ9WjB9cP1Yg9jtuRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3MSBTYWx0ZWRfX97z4VkA7D7lR
 X1I7WXudqFsLRhjl3tgvBzRDDVwSRdL+5s6lPQSY3BHpZIvXyN3/oqsxIq6pY7DfjwLrD9l8s5R
 XVsJE5FmDFlA2mBLAGuoy2o4l5ArqS8=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab26c03 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=E5H8lzb8i-VhQHAci44A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: gGRUllkuCY168V9luUDcY0ZQLANO2Kuj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220171

On 9/22/26 1:46 PM, Neil Armstrong wrote:
> Hi,
> 
> On 9/22/26 13:39, Konrad Dybcio wrote:
>> On 9/22/26 1:28 PM, Neil Armstrong wrote:
>>> Add an initial DeviceTree for the Valve "Steam Frame"
>>> codename Deckard. The Steam Frame is a virtual reality headset
>>> based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).

[...]


>>> +
>>> +        aop_mem: aop-region@81c00000 {
>>> +            no-map;
>>> +            reg = <0x0 0x81c00000 0x0 0x60000>;
>>
>> 0.dtsi
> 
> Good catch

I typed that it's in sm8650.dtsi and then realized you removed the
whole memory map.. I was under the impression I ctrl-Z-ed it but
apparently not all of it

[...]

>>> +    /delete-node/ smp2p-adsp;
>>> +    /delete-node/ smp2p-cdsp;
>>> +    /delete-node/ smp2p-modem;
>>
>> I think these shouldn't hurt even if your usecase is different
> 
> Right, but those describes a pure firmware interface.

Yeah, but it's also noisy.. perhaps let's at least remove them
through a label reference

Konrad
