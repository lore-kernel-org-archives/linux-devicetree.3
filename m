Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65CE3E0234
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419924; cv=none; b=HXGqFTOdGnzir7GhYDlxF184IU+UI13SM6TTj5iTZdibPbHh+9bwXh0xA8a0im7MnhIJlp4vrsM4Re9KWfm9lIV4yk5xJXlPNbpUz+TNctcmwKlQlZFUOYxbtS1g+w5w7MmCoyWwGg2QppWjTsj8KOmIb9BZNg/p3fM3FAAdkSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419924; c=relaxed/simple;
	bh=9FaByEYQ1+f7toZfhp8ANfaJcWrdVoKguDXFfomYHnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KILMAK0+kIWh0QJTzv8ZMPnOzrL2Vuv7lxahG/UExju8i4YaLQM6MKW+eYrRyDJ7qGad/lY9ODcWXVmJq5XIIxju+fZRbgtDeC9jYlSjglJxLpA3tdbhjEqyeNEh2ttYBT7t7rCU8f0JVUK2r+c8uS0fd/saz0q87WfwMQwzA0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=illqUTys; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2txeiaZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="illqUTys";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2txeiaZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DeKh3243142
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 10:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XP5y6yGHt3Ajgb88Dol1E8KHAvk0yQ+E6gY+cGfJFsU=; b=illqUTys1FEjtQ2r
	JJiO83qoOAGwu4d2azr51/L4o3C7r8f/xXVuJyNxm+Bdk9qwucmgiqpd8hz7Dzgu
	ozJWczUxVBhw1HlLltKhXOWx2DQEMUCyhO+x7vZ42c5v7nzidw3z4dlgUNCQsYRV
	dLyrz4M5Qdun6buzr/xoMvKPOuzcJQ4HpRXNbOvhRKnxxVV73S+WQtNiy4pUQk9U
	UbbMNHxXorVebnIbf++hcPbluekhyhHQ5E4SH4YQyNtqxpWnQ1XIPbdbCyA1L3yk
	HxwoOo2xVuf+IbRGW+exPm+ZaCm2UVsWFEtwPeT1fbCTbZricKqstwjD4IJ70/gb
	GQrcPA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11rqd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:25:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca3b314193so9576895ad.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419921; x=1784024721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XP5y6yGHt3Ajgb88Dol1E8KHAvk0yQ+E6gY+cGfJFsU=;
        b=C2txeiaZgravPS2fywlur9+W7Uh66Ui8SaHcp5R1OM80RHbOgcdG5brheiBGGKaqDY
         Y2glyF8HgrOCBS84zHJRldUmkQ/XagXwGBQ8ZiI6McAIrAa7+KRUJkhbnqj8U6Os9IWS
         B/STy/75rTNd3j11u3nw4Jt1GHGP+CqrsROvoS3RwxLG+1e/zDaQfajUindx6WTRFOfe
         nA+PZNi9GV7GoEEPJsMsL1L8ACs4k2OO/s2O9+EVrraNZ80oPauLYKUFRsEnziK4Zx5O
         w9sMYhxFHpb940CaXu13XEaEocNNQ3jzg4MJJx7OBcrqUQK0RZSFZBZ8AZ5AqlfBjdHS
         zMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419921; x=1784024721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XP5y6yGHt3Ajgb88Dol1E8KHAvk0yQ+E6gY+cGfJFsU=;
        b=QAdjFsNuHmrJ/ieZSrFiR9NunH6r+N4K6MtB04fVaDnaAtB8rvtEaVrfCxnkhFLLju
         Jv+rFJe5JvApWtl3daeq0VkDpHWhWKXC87mHaBXSOgD8KEVrNqbI6da92fEhT7/QDmex
         J//hPLfanejJmvgBSOrIl1VrlaF8qoqAU6e5uHEoSxJ9De5IqTWnPBXdda7dx3L2Fymo
         GxrzwUrQyJoLZvTYDQkD95ycjrrnOAfqjQxk2qRytBB8HLxXo8hv6W6V9FQd/PRFk/7y
         CyxQGykLqXIfXZk5OWIxvaGT0A5Ph9lgzCaaNcClu2PoPCCWFOopNtMHuqWSrs8GvMrN
         L6Fg==
X-Forwarded-Encrypted: i=1; AHgh+RqFv04J5hhMXVlVd+X64GTSqlf3Qc+EJZFCHIPskEncsP3cBNC9btEPvMa9w/9prd8MyJ7EPZ3iv4YR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5XM+b3ExTUprfJbc9LjbjAhkGSlclge7yEBwSAhl806SPHf3D
	KdLa2gkM7npEDnud+cSrZjNU5FUfm+RzhDsoZghmkB79NzPVtKcgU42aUirTbYbLdHMvt9ddQcF
	IlioNty8JadeNhoBOnj4q/ps90W0Ufo7GJgKPv69QfySEZF3ssUZUr4SPQGtIMRQpc9xY5Ilf
X-Gm-Gg: AfdE7ckiR0H0rczDYjEnjtY+w2g3N4/6DdfSVvR/qgswzR1vYTvg8MM8y1ZOXke+qR9
	Tm+tUcHoSo+/VwmWBQkt/wd4AlOv9G7ev1G//PaKIdea757EjH7giTdOCTCqkH9E1OqMo/hy1nT
	vqIp5tZ4zCtzjuSFgOLgge5VboAQ1Qrj3HJfgUh8qDN/iOsam1WuJa5NThUPZitSOAHiKdZq4VR
	dzHY4ZgrIXTWk3NGJ3R3Ywhz/bivhdxRKwMFHQsBwOS1zOx1l8tS0kuvfD3f8PFEvz8bYF7KA+B
	gD8D2xzhTJCyXV0KoyKiOJy5Z1La6WKdSe2Fhy6uLMUg+ZZO1JXzRCCLPoSxoX9AtskkqW+sJkH
	gP9Dn2Hg0TIe3vLI6PKs9XbnZ4DWFwfvoagyj9X2ijw==
X-Received: by 2002:a17:902:f60e:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2ccbe4004demr49315115ad.2.1783419921186;
        Tue, 07 Jul 2026 03:25:21 -0700 (PDT)
X-Received: by 2002:a17:902:f60e:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2ccbe4004demr49314885ad.2.1783419920605;
        Tue, 07 Jul 2026 03:25:20 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9bbsm9319265ad.4.2026.07.07.03.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:25:20 -0700 (PDT)
Message-ID: <9dc4b29e-e9fb-421a-b789-eb16a68ff915@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 15:55:13 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
 <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
 <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
 <e7eho7ezujbrdzgumshapf2r7hu2jaujib7lvotrqvcj5er5ut@xpd6l2kgipqu>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <e7eho7ezujbrdzgumshapf2r7hu2jaujib7lvotrqvcj5er5ut@xpd6l2kgipqu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cd411 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fbyXy8itprBkbsvVMWwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: EIhoLZu_rIWegj9uYnazbTGur_DS8WkU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwMCBTYWx0ZWRfXwKa3Uwsd1837
 p02UcAhBbsQlNltn8swMeEQHzh3rrvPKmBzYLoxXuiBF1wuoxzi/51YKoC7tOzMe79K8JhguB4x
 cseM7pKqBKIei38ggPeEkgvJvn/P3dQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwMCBTYWx0ZWRfX/ZikFl3eeD19
 m6WRnrK5uT9sEoOuYgfx5IUeoNwInuPeo14uJmUNTWJnRjZ7ZllgeBuYNHAcC2w/zryDGqk7J36
 HYTZpCH7nzrHa+La1Tbs3LXFf5g3cRaHk/nyls/lbeDapNRgT3pDDeHm6m7wNfnwTHkuwsWVrhT
 3/LnA72RvK8CgUg1YdJ0P8IW8/JithdieYLtmVJ0q9mjBvSCucl+EfkRsYd22Fs/+blubTebRGV
 JVnOVGCJa8/4QP0E/rcHQleNgTvVUMMmWEG0fhOXnG9Puyk0vGN6tNFD7T0oU3xumBcMG/bhHXB
 pjQmgjoLvMuNOe4uMGqlfGP+/A4DWFhiPL/24hSasyRHXpbybaQOjXP/+8yhZVBPWASub1BpF1R
 HRbiDQHSOujQ6NnrH3g+79/iyijboLbJgd6iWXeMRjLueNHvQVExu7eZsq15xN9v02F8AvnHCnQ
 t9FAAD+0Va+KOzZEe7w==
X-Proofpoint-ORIG-GUID: EIhoLZu_rIWegj9uYnazbTGur_DS8WkU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070100



On 7/7/2026 1:04 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 08:11:35PM +0200, Daniel Lezcano wrote:
>> On 7/6/26 19:47, Dmitry Baryshkov wrote:
>>> On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
>>>> On 7/3/26 17:42, Dmitry Baryshkov wrote:
>>>>> On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
>>>>>>
>>>>>>
>>>>>> On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
>>>>>>> On 7/3/26 7:03 AM, Gaurav Kohli wrote:
>>>>>>>> Add Device Tree binding constants for Qualcomm Thermal Mitigation
>>>>>>>> Device (TMD) types used by remoteproc-backed thermal cooling devices.
>>>>>>>>
>>>>>>>> Qualcomm remote processors expose thermal mitigation endpoints
>>>>>>>> through QMI. These endpoints can be registered with the thermal
>>>>>>>> framework via the `#cooling-cells` property on the remoteproc node.
>>>>>>>>
>>>>>>>> The QMI TMD protocol identifies devices using string names (for example,
>>>>>>>> "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
>>>>>>>> `#cooling-cells = <3>` requires numeric device id in the form:
>>>>>>>>
>>>>>>>>       <&phandle device_id min_state max_state>
>>>>>>>>
>>>>>>>> Define common TMD device index constants shared across currently
>>>>>>>> supported platforms. If a future target requires a different mapping,
>>>>>>>> additional target-specific constants can be introduced while preserving
>>>>>>>> existing DT ABI.
>>>>>>>>
>>>>>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>
>> [ ... ]
>>
>>>>> Why are you using only those TMD devices?
>>>>>
>>>>>> More constants can be added as needed.
>>>>>
>>>>> Kodiak is one of the supported platforms.
>>>>
>>>> What would be the benefit of having more than thirteen cooling devices
>>>> declared in the thermal framework and having only a couple of them mapped in
>>>> a thermal zone ?
>>>>
>>>> I agree there are more TMDs but if they are unused for the moment, why do we
>>>> need to add them ? Can we do that incrementally ?
>>>
>>> That's what I am trying to understand: why the implementation uses only
>>> the selected two devices, if the modem on Kodiak supports others. How
>>> can we find out, which TMDs to use on other devices.
>>
>> My understanding is that is an initial thermal setup. Gaurav will add them
>> step by step while setting up all the thermal zones instead of sending a big
>> patchset. And TBH, that will be much easier to review.
> 
> In such a case it should be noted in the commit message and/or cover
> letter.

Thanks for the review/guidance. Not all TMD endpoints are relevant for 
kernel thermal zone binding — some like BCL and cold temperature are 
handled from userspace when needed. The constants here cover only
what is needed for modem and CDSP thermal zones on the currently posted 
targets.

Will add a note in the cover letter clarifying for current tmd's.
Please let me if this is fine.

> 
> 

