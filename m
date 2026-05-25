Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970CD3A9D9B
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 07:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779692807; cv=none; b=U9gTdc9EDMrbLGk9n0m0CtWYzy5o28v6sycmEPE5XWmKxvTMKwyEOmL0wK7oTG+1Y1SdWaFyrkPEQ1xM4O/ImFUreBRdqVJB2ggScUsqRlY2+frycFENZdMLyGfyZoy3MLiyD1eLxCt8hhzU2ys0YoaLitr2iZeHiFstQtu4UJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779692807; c=relaxed/simple;
	bh=m9oogMcTFdVycGrltx0hH1QPpPdlBZgo0o40YOuoCZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/Q35bSAx5BmIY5qELqjAxSW/QMk80ohr72cmCotNWLX4w3+xP/LsMOl1lDj49eiGT/r1oR3pe5rzoU+e/+QV5LRyP/OCL9XIqF7G+/iOheHfj+ite5ySPgb1vbEW6Tj+UBFXe66IibTmtTrWt35Js/J8R5IAGjOV13KIZBQfV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VBavmqBT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HxMi8EV9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VBavmqBT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxMi8EV9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OLElag1428192
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 07:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PztoOF4NbfiDG8yee7TktqGlOi6z/P5gJ41vD8fwEK4=; b=VBavmqBTPXTLJHsp
	avOpVTI8iw/wpN/3SASQZA+myXg1PGacSa+Yt4zGJVE7AohDiFaOROFdsro4jMYN
	AB/csJYymjpLHlVpQYjQFMpjVIEgiVxmeCLIUNtc7yECkatsAn+0rU6Opn93TEtL
	FtBkD0q9Fxwy/Jt8NxDE6f1lAGLVyGsuNur5CfWxOu8bR6j5gyc3+ehjV0N2m3Im
	haV+xzYQDIrD5cvPedQKacRVBszRIO8d7wMpXVXV3IHbT+qjqRvqMLbeq1UfuPKR
	fUTefWeQSE+v/7bs3X3vvkG9W72rlyWLDWyNh0ZXibqOs6l88u7sWBAE6KrEGypr
	ImupaQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmnutv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 07:06:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83544d05c5aso4552303b3a.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 00:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779692803; x=1780297603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PztoOF4NbfiDG8yee7TktqGlOi6z/P5gJ41vD8fwEK4=;
        b=HxMi8EV9w5vZ1iZOgdo9jZi3U8qpy94e65gplbtC/2Tx/CUpNwC16SHlElSRpw0EdO
         m+2qXoQ5u4qvrrkFN2pnPQKFkuNO2frMgy/dxHH+0UESlqxjnAlkAaSEMqEi4QPDtyuy
         XhTnIkch/Nm8dDSWaanJ99QpZ4bSJMPXPuoR7x6sbEwrAzUcnaoJxzvHCI7h5JQ4Hwjg
         +3/2M1QlwUZe9PKzRQWtq45xlcwTA0+z06ll3Q1kwYYMMPupikiuTmbJUgYUNdGIel4L
         ImITHxnzm7DQcQTGmTYEJF4sWsWb5uaec9FMMdJtEgKFkVbZXc2KbZRS3LzZFzKhtN3f
         6x9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779692803; x=1780297603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PztoOF4NbfiDG8yee7TktqGlOi6z/P5gJ41vD8fwEK4=;
        b=AJiJnsYxaIChCYLugOu2p0fZ1+gvaAfoDiKo5mHacG1tY/4RcH02vwgHRZqcbgqqFk
         f08ZJpyh7OS6i5eD5DiHuQdNDIgsDqp15UsGB4/IB6MzvnvQ3fUnQ4dKj+8nYeF45gDM
         e6xPrhshbb/aHRbp9Dn2MRHQOxkCjNdKxYkmAOnfyVJazBOStkMROtZzq87iTORnZzCK
         rE4sTq4bkDrr8XYJYeBlcwmoR65hTw2R3oRQyB6g0ffq3So08fDEjxJ++y+zQFW7EP7C
         8CBjuFTgvuMMU86sX8UdzW3aIm1sLTnCf828Qd0HFXDcZ9dYHdyV5oJnfbJu+gtLUx4O
         Si8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/c4i+Qudtp9ES2tkLDxBuSrYCgp3U0r9ZQ4rxfRIou/7CjNt+UJ+aksWlA/7QOVl71kBTBd9iW3jDb@vger.kernel.org
X-Gm-Message-State: AOJu0YwEpKUzUgDPyT5CAjOMRqpt8uk/8KVesBTfUOqu4CT8+5FUJbHP
	itmuXcgub/ZfX1fstrnxvbnJJCSX4+BYA2+ixF96f8FhEpJ3VFlxSJEZyXBFF/uUIeiyOab0hoI
	R32VqFJlkwDw+vwFAaftmu+E6JCAlWJBRmYjkRPqGb5PQmPc9WNAkxipwyVGglC0h
X-Gm-Gg: Acq92OF2b942vWVrBNhNRtnmHsupykr2IGrW0Ovvuxg3of3KrQnWKDCALFSmnRB9U5U
	38dkNHS36QMSTM/0juPS7rI7ETtPB3fxc0TIOcXD2KLRk2k8SmS5+By6q6QJ5UpPpNPsp8nrQm9
	Lf8jFAAUtuSXz09a40Te9vUzOUVEtBWucj78eZ/dsqe9apAW+/OfuNOlrkOuK0W9eKHOCwq7A+3
	OnJZldSI/zzuSPlO519ljkmEvH6u5G8f0Yz2uEH3I8m7bJl7hyQblIWroo6akblDz1zNHiUWR1v
	Ufcfu7yW5v+vALR+lE+S5RfXfJrFu69udZ9Vl4qINsw5qVv/GmEMh4nU/6I4lnzgZOXANbp3PTD
	0WF6VXXsD5ZaLsgOMYI4zF4fyI0axHoLaUlgwXasU43UAXlWUlpgR/eyfnIP1F2U=
X-Received: by 2002:a05:6a00:22c6:b0:836:900e:8743 with SMTP id d2e1a72fcca58-8415f35d58amr13665911b3a.36.1779692803471;
        Mon, 25 May 2026 00:06:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:22c6:b0:836:900e:8743 with SMTP id d2e1a72fcca58-8415f35d58amr13665874b3a.36.1779692802978;
        Mon, 25 May 2026 00:06:42 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fbb66bsm8423647b3a.45.2026.05.25.00.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 00:06:42 -0700 (PDT)
Message-ID: <66335474-d600-45ab-9ac6-e946f24142c8@oss.qualcomm.com>
Date: Mon, 25 May 2026 12:36:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Bryan O'Donoghue <bod@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
 <8bd4365e-0171-425c-9738-0b186047cb15@kernel.org>
 <upcLoSPzJejUNhFiNYlTVH4d8Sh_Pv2o9OZfXsY-CMCDKw19_ci2gL9B3ZwqL1hV1pQeQMLDL8tNLbPzs0JIIg==@protonmail.internalid>
 <2a496bdf-4728-47b9-84ba-063712a6e5b6@oss.qualcomm.com>
 <0a197b43-a672-4849-91c7-6e5bfe3175f7@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <0a197b43-a672-4849-91c7-6e5bfe3175f7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2OSBTYWx0ZWRfX5n/J5KqfuGUb
 TK31t+cZo8hW6bvRPRtWxH3nRkMGsx3Ztqpisb0YPIpuvM8+Hl6rAjxJLMbYaKR5IXS+Uf9MgVp
 fJlMzPl3iFxXbM2aVlC2VNcpYGpjCpzxJQFfNQULMcKyKc3Fn7fsGAujP93ORY8svONDonYC3nF
 AAB/QUETdO6hd5UcW4vVwqxBU/pHyd+x8hvzp8wbXQ2mgLqTiRUiTPMUNQzhM8Vn3dtZm/9re2F
 zu9vzsTtm5X6SWF8WmcFFhxd7nTRGrqnw23L1V9HGYSIYldY//i1F40huhqN8Y3w5po578R8ek+
 fdyQQbaXzHm5KXlHFRg7IoGa6UzLD840Vwg3MfhTAU6IBRQ5MWkpZdzapEh1xs5uLlYqrNcQWxB
 ns8XKdEZUX7hL94j4wnvmqbpNJtSk9UlXE06TrlJPh/XpdpDu06Ekt74ebzw+lCvxxTyDbBzZKv
 GLJ+lsslR1A3lqO/W3A==
X-Proofpoint-ORIG-GUID: u-LYElcCtglBjjFRLXOgx-kfJk3SLzvm
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a13f504 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tk3pCZAdYsx0TBu0sJAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: u-LYElcCtglBjjFRLXOgx-kfJk3SLzvm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250069



On 5/18/2026 5:51 PM, Bryan O'Donoghue wrote:
> On 18/05/2026 11:23, Jagadeesh Kona wrote:
>>
>>
>> On 5/18/2026 1:05 PM, Bryan O'Donoghue wrote:
>>> On 17/05/2026 18:33, Jagadeesh Kona wrote:
>>>> +/* 1200.0 MHz Configuration */
>>>> +static const struct alpha_pll_config cam_cc_pll0_config = {
>>>> +    .l = 0x3e,
>>>> +    .alpha = 0x8000,
>>>> +    .config_ctl_val = 0x25c400e7,
>>>> +    .config_ctl_hi_val = 0x0a8060e0,
>>>> +    .config_ctl_hi1_val = 0xf51dea20,
>>>> +    .user_ctl_val = 0x00008408,
>>>> +    .user_ctl_hi_val = 0x00000002,
>>>> +};
>>>
>>> I'll again push back on these magic numbers.
>>>
>>> At the very least you should be mentioning in the cover letter log why you _aren't_ making that change.
>>>
>>> Just reposting and hoping it slips by the person making the comment isn't too cool.
>>>
>>> Why can't qcom update the python? script that generates this code to enumerate fields instead of magic numbers here ?
>>>
>>> I get you don't want to do it but, just ignoring the review feedback is no OK.
>>>
>>> What gives ?
>>>
>>
>> Hi Bryan,
>>
>> I haven't ignored your comments & already responded to your earlier comment on why the bit fields are not
>> defined. Most of these values are static settings we get from PLL HW team and we program them only once
>> as is during bootup and are never reused again anywhere from PLL code, so these bits are not defined.
>>
>> Please find the earlier responses for your comments below:
>> https://lore.kernel.org/all/b92a2cbb-fe8d-4378-aa02-d91e2e4dfff4@oss.qualcomm.com/
>> https://lore.kernel.org/all/009ecdbb-2297-44eb-862d-233e3290691c@oss.qualcomm.com/
>>
>> Thanks,
>> Jagadeesh
> 
> That's not in your overview letter so generally I'd advise to include things like "did X because Y" - "didn't do Q because Z" anyway, how does it make a difference if the values are static ?
> 
> They are no less magic numbers that way.
> 
> What exactly is the resistance to defining the bits ?
> 
> I'll state again - when a vendor is submitting something upstream where that vendor 100% controls their own documentation - there's no reason at all to be presenting magic hex numbers - even more the case with generated code.
> 
> Just update the script to enumerate the bit fields, I honestly don't get the aversion.
> 

Hi Bryan,

There’s no standard interface for these bits, and bit definitions/fields vary across PLL types.
So, common macros aren’t feasible and would need redefinitions per controller. Since these bits
are not reused elsewhere, IMO directly using values from the hardware documentation keeps the
implementation simpler, avoids unnecessary abstraction, and makes debugging—through direct
comparison with the hardware spec easier.

Thanks,
Jagadeesh

