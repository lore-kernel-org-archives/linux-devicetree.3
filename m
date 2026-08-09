Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4508E346ADA
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278830; cv=none; b=jakMHAMlldaipCSCWD+wE6LuewqhXh2XwIaExRNhg2Mdvc5tEU5tZPZB+J+3Morx+dcJoYxSBrG0cA6jJKoLDKXT/wO4G+gGsSPsD/NABdc7nSC9bg+9a0ZEtvBYyBUSulShQHEomPeP1SAfuYT9HywtiiAFlVVqieDEckDrIBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278830; c=relaxed/simple;
	bh=510uDvyd32sgzhlGwCfHMT1JRWWiRprn1MywQxgm3J8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ijGS7Y5E1oTnaOZQ6mb4PNQ3W05F2U3nJ5fg38gxnvQVxrO4EAADTxpBlkrac0iFSKhaP5PsFXyno8ra27KfkJmZgMvtfrK4dYvx8ulblHzzq5CJ19VhcurcuGWU/vkJj4fc8rPTWsfFX1JD7Tdm1poOt15LDmOiIZEg3FkJcwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVQ8uHC3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NthjEQMD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVQ8uHC3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NthjEQMD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1V7L3838762
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 12:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IrQTEGA1d6JWldRyNS6hURK+2Oil921Orn6sio9wxXY=; b=OVQ8uHC3XxA7Q8nv
	XVGk46q9ZuwlwnDZTmfQ/bk6+36LWyl2TFmbWnuqA11kgxHJKEs7HQKz6EK1e4e6
	Vcr6jLRu7sgzUCREkzclgY7Vkjgi4lFYMIFzO0vv9RnnsrKdXcrGbCKVpZr1SrPA
	yjvrY5+Z5banNVDsyFhd5HDqRYhuEmfa+D+0q1mcB6ToeRsKFp1zRLd8FZyP7JQL
	ha3qZnt+aKs/mOlJ1RW8OKoVIeNHI5m7C71C9ZJbGdTzYSdszyA+qAJkMh6SaAc8
	iHOjt5H0HBn3Ievggl5+cODUR56kKkMfT8QdZFQiyCs/OVuWmgUQgfAsX85Egr8W
	uFDbPw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwt5gk336-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 12:33:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so2915967a91.2
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786278826; x=1786883626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrQTEGA1d6JWldRyNS6hURK+2Oil921Orn6sio9wxXY=;
        b=NthjEQMDOKPlMK9gv4ep8oAZ2y4ZUpBCVNWIPzYL8DFZF9JA+EYEP7VdsePsOCPTbg
         gdtCguCplDK3D5dGtdAeETPJAkk4UtqoCGMM0hPgykFggzWSiNa7wH30zpA4b7EA1OfV
         AD/oI89r33jHM3QaQCUaCR9Yzm6uzTRYSDybjyOr4keMlfPJ+CH/o5HsPIM2eZgTCZZg
         2a8sXM4c45jjDV0iRkICAN5bUTGgXr1Xqj8Ue7jzB7QNmLc9GBi/HqLfrS86BCi/9Z5V
         2Gt6gYuF45kFMKA4MhikEdKas5J6f9bZwOJnC/1ngvolhLVZL41sob7Y1USTeVG1lDox
         ETIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786278826; x=1786883626;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrQTEGA1d6JWldRyNS6hURK+2Oil921Orn6sio9wxXY=;
        b=O9JJSLRMju1m7L/9EJehwWdmelero7UjbQ9xpmNo/YuDtjFWDE4G9UmARzaMKLnXqZ
         WJJRyit9wUxyDujL0e/Lo+SDqcplwT8mr8hcga3wx2BH157JPgUp5PbCXOZDsmmfCFMH
         pp78+Hi7rNG1xj7xcTGc1+QhESn+NmG6Z3PAm0D61sM0kF1bMxaeVkVml17NVQ4Y7hYP
         9nNVE6TQnvJomv6/OJaMK+leYlNuwb94CcGqMZVoUYEI3K+SaoNcR+9YU8vVoL1lcTyP
         Ji2BDhVX7DFJ6abxESNbMzVmIv0XmN9Ni8+jtX33ZVexlv/nEhCOrRwfHxsNbHEOPyZf
         j3vg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7z94s9uGIFcl9j1Gbf5Y18fTWv4GV5+zmIp5FKXuVBvweNv7Cbg74EilfFgKlSgx29pmjZF/XTKrv@vger.kernel.org
X-Gm-Message-State: AOJu0YytCMdxOwvtRO0gyRZai5LNjhBn/kzots+DdbZbMvHBgrH9q50l
	VaO7kaLPYb+JvBHasrVLULlD8FUs0sWWpSpxkZxeI9LwlbsZIzb3aIp1r4Xp9jBKHodcqlSV61f
	vVcv7nWAtZx4XbckkMxiXamR7I4vPkRygPZZRx7P23bTefVGonmkUSHP4AKhZDCDXVsuRfEYZ
X-Gm-Gg: AR+sD13yFiH9pbDyno7buLYCtbih6Iq8of0HZGmWS1XIGkvZA3jeeX2st9dKIXV77wz
	fSyeLoS29Ht8T9hLCu+TMnVZw9PKhQdbe/b45apa7njYheKvD5x6A3lhQvqrWy129XN9/WKfNJ3
	oJl8Tm0C2rmwV6fwPDGobQ2zO9Gm00dIQMWmw2XuylbF1Ca5sW+dBkzpMCBrdmD9qnUc/B5eGsh
	25nBHwqlkE9ttSZD/XNqz+FEOSeiQQBBjPO3Co/LLKkagPEHjr5ecpBw3Zh9tPBtx8WlnHvMC3Y
	iM3h+ssR65b3Bte2Wg/OYRWCF8Q/bgaX7v1BAQPX5AnWtdmRXqdLwmWZ1M/vBFLE8CgPmvi/p5i
	/MP23b+sHPt/For4CmDdNl3vZAFvTehI=
X-Received: by 2002:a05:6a20:d38f:b0:3b4:8bc6:138 with SMTP id adf61e73a8af0-3cbc03b5526mr19993951637.23.1786278825823;
        Sun, 09 Aug 2026 05:33:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:d38f:b0:3b4:8bc6:138 with SMTP id adf61e73a8af0-3cbc03b5526mr19993897637.23.1786278825370;
        Sun, 09 Aug 2026 05:33:45 -0700 (PDT)
Received: from [192.168.1.16] ([106.222.229.34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec128a0sm34798229eec.25.2026.08.09.05.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 05:33:44 -0700 (PDT)
Message-ID: <e8694124-ee41-4695-aa87-a4ff4ee602b5@oss.qualcomm.com>
Date: Sun, 9 Aug 2026 18:03:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
 <20260731-b4-qmi-tmd-v7-9-3befd44403d5@oss.qualcomm.com>
 <amyFARId5K-Izco1@linaro.org>
 <34998a81-864e-42fa-904f-2e5f3490fcf3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <34998a81-864e-42fa-904f-2e5f3490fcf3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6Cbhx9l c=1 sm=1 tr=0 ts=6a7873aa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=x3UvaR+l8cLCJ1uKBUlNag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=y4XuuB6ikNK3uoXrSYsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDExMSBTYWx0ZWRfX9kuq1WwFN/j6
 HRlUMpLWs0A0TJq8XHuzfhQBfsr5KXL8NXUQwC7PMkCRQ7OBkdSsuDrOsEZSEvwgMPVKgkTFYiU
 CugJ8KkBA7pn3O7Cj5I3LBOnharO6jA=
X-Proofpoint-ORIG-GUID: IEx0tyheNciEfVG6BG6gXF9ORshnIbeG
X-Proofpoint-GUID: IEx0tyheNciEfVG6BG6gXF9ORshnIbeG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDExMSBTYWx0ZWRfXwGjQs6i2VH7/
 kR8v5jPs5zjLuTUCES1wMRDBi+9HexY5UQ2g5XblcAcMTylID7WxKb086Nw8ihe80EjxD++4dLJ
 P1RvulemG5RFijOdWhk3kp2WMdvh1/sGHeeDqNW54lprySmAj9YpOxLXAAxS6zhNEn+pO42Ge2s
 GzwmPy78gXvuCr8vabT9us+pAncwDQZqfei11tyraK4YpPdU3pNkctqE2IuDBzhfXUTwBLoOp/T
 o7kfVmVph688GKn2b6ayEbWwM8iKs1x79bHNpzKVTmHJmGdBSEHykWMzRU5GyRpFfp0HX4ZB/10
 13O5F7KuMJ1JSsZpfqq43jssmQrm5EM1WT2d/fquj+mb01Cqeo9lQ5gT5oDeKvMYFYuguvVKOTa
 +6vrCvagh8fumhJhp2+lHJ/Aj3yofAT+Yo9JKUIyxjHPP30M1jPx0Kuuo6mjVyxfXS+4D9JDNND
 wEINGgtax1oY2DRFZMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090111



On 7/31/2026 6:52 PM, Gaurav Kohli wrote:
> 
> 
> On 7/31/2026 4:50 PM, Stephan Gerhold wrote:
>> On Fri, Jul 31, 2026 at 04:03:49PM +0530, Gaurav Kohli wrote:
>>> From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>>>
>>> Unlike the CPU, the CDSP does not throttle its speed automatically
>>> when it reaches high temperatures in hamoa.
>>>
>>> Set up CDSP cooling by throttling the cdsp, when it reaches 95°C.
>>>
>>> Add polling-delay-passive so the governor periodically evaluates
>>> the zone during passive cooling and steps up cooling levels when
>>> temperature stabilizes below the next trip.
>>>
>>
>> Would be good to mention why you are treating hamoa-iot-evk differently.
> 
> thanks for review, will add the reasoning.
> 
>>
>>> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 32 +++++++++++++++
>>>   arch/arm64/boot/dts/qcom/hamoa.dtsi        | 63 +++++++++++++++++++ 
>>> +++++++++++
>>>   2 files changed, 95 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/ 
>>> boot/dts/qcom/hamoa-iot-evk.dts
>>> index 9fa86bb6438e..a146be1cb5fb 100644
>>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>> @@ -1684,4 +1684,36 @@ trip-point0 {
>>>               };
>>>           };
>>>       };
>>> +
>>> +    nsp0-thermal {
>>> +        trips {
>>> +            trip-point1 {
>>> +                temperature = <105000>;
>>> +            };
>>> +        };
>>> +    };
>>> +
>>> +    nsp1-thermal {
>>> +        trips {
>>> +            trip-point1 {
>>> +                temperature = <105000>;
>>> +            };
>>> +        };
>>> +    };
>>> +
>>> +    nsp2-thermal {
>>> +        trips {
>>> +            trip-point1 {
>>> +                temperature = <105000>;
>>> +            };
>>> +        };
>>> +    };
>>> +
>>> +    nsp3-thermal {
>>> +        trips {
>>> +            trip-point1 {
>>> +                temperature = <105000>;
>>> +            };
>>> +        };
>>> +    };
>>>   };
>>
>> Please avoid overriding node values like this... One quick rename of one
>> of the involved nodes and this will be silently broken without compile
>> error. Nowadays dtbs_check will *probably* catch these, but if you
>> override values using the label reference you would notice it
>> immediately when compiling.
>>
>> All those nodes already have a label you can use:
>>
>> &nsp0_alert0 {
>>     temperature = <105000>;
>> };
>>
>> &nsp1_alert0 {
>>     temperature = <105000>;
>> };
>>
>> If the same pattern is already used for other thermal overrides in

thanks for pointing other nodes also.
For gpu node, will send separate patch over current series.

>> hamoa-iot-evk.dts, it would be good to prepend a patch to fix those too.
> 
> thanks for review, will update this.
> 
>>
>> Thanks,
>> Stephan
> 

