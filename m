Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B89547ECD0
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 13:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777988850; cv=none; b=tOlnZvdcRQnZefqyOh9kMyTJ+PpmQkDEqCI+mj4BfPck+m+FEd171I2ER+i0qPIg5AgrtPxuvVl1Umb1lcmO8yjgTmZRz48Hz2LLdXUFb1o0gMQbIrCHbHx1qLuK8pwQtAaaU82BzfpYwx57l2K2OPsKfrmPLd/uwJwg6k9Otfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777988850; c=relaxed/simple;
	bh=X0lJ93HuV+UQAuwXDcwrBvXaZUotHEOYc3plzcPp+u0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DI3cxNsUNCKtqnC8mOIcJkk5EkTWaCKBhqbs33EFlU1Ck2ASlo3/NKCYT899zy3eoxZunonxYGeDlu33P9G/i96dEXOUuBkuO769qBgHWAsui+4jJgp9wO+uhi0Q6cic3Q1A4l754nBngtKMnJdP1VudvgcYnZczNpEu76YDank=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+21tP3w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gh3/rHO8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+21tP3w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gh3/rHO8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64595YCF4028241
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 13:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rl0ti4q20LzWc0i4p3ljvY3l3C/vISHSfDt1Ly+KG44=; b=d+21tP3wBchLVwVP
	/FbQD14AwZdOxm2vroESniRXZHTZ3948vZ0VRZwGTDQuEDuWlrSqB7XvaEbcF8B8
	e8tW4RHT5csriqWL2lhWDr83ps1uyjvdlOJy7d3JZK8YZ0wiCARAYTLr5ZftSGF0
	6y9qtjbSx9p6pcmHAK3ejCV6kt/djny8rTQCdoYSh/4IBvrpzpYJAtvw0zfoWO3U
	8zcAReSSM5F37RgovsPDzNSAo1JVEPuxhhVzg8SiolqUV7ioRu8GZsD9zD8GWgrf
	Y1fL5JMAzXEHLqyxQPdExzoiUmjCuxxgmeesLHBVu51I1/rBEoamfu7JVbb0rqAX
	9pBM/w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dydm6s329-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 13:47:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fb22422efso1493764a91.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 06:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777988846; x=1778593646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rl0ti4q20LzWc0i4p3ljvY3l3C/vISHSfDt1Ly+KG44=;
        b=Gh3/rHO8xtkdO6M/JPOYvYfQ+7JmQ6cPhB1XjJCyU2zcinMqh5lGxMJ6jPKJDgBnbe
         WUl3bztX6m0vt8lMzfKViE5mdRuh6lqan/eYY70UirMAp9997DejTuP6O5ieHNzO1j4B
         3q4uyc0epcnJ4/0cmB1oW8R+CiA27w4OSDiAT/34ZtNrHC/DtbQqJlYJnNUAIK6SJgvX
         brJk5EFRCaKIzUy6XKgexIfnK4QwOMDdtgBCwF+I9G63p5rNBRtWuXYJ6yQ11Ftr9voq
         ExeCjn2g5iZjtGo+Am2Becyor9KtcOpt0Ubmx31LjvGfCNOCu2auv4IpLb2j6r4FiUyS
         QoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777988846; x=1778593646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rl0ti4q20LzWc0i4p3ljvY3l3C/vISHSfDt1Ly+KG44=;
        b=izvBd45BMP2424dJEzlD7gnN7ikt81YxTLle1yqV4trwCdpZLkZLDwGAR3OLYo48KL
         F3pWyWtoltdV8eG9RYWIPH4tpNAKo1LrSL1oQKctxyG4Evp/POLV9Ty6JIXRSh7z9A9r
         uJWzAnYmlsVi3SyaTWX7MYlhLMolzbpVSxPYr9W3wQNJQdQYN3amsXpQM1NDEr4fATJ+
         aDDpp3lRP0Eyu8T4qv8HoMywrSSGVRvSMAsAovg7BWOCMqce/5obzttEurEyKQkloiKM
         o2xYD8IEryxP6IUeFOzJVt7yNdhwXjUT/rZLK0xUeXuMX84n6YhiEcWrPK89iI2wsGoX
         nYEw==
X-Forwarded-Encrypted: i=1; AFNElJ/7JA6u59H3Po6uy79D5lwOaU62GbnzqpiW5j9wTIH76w9+RyPQpt4AdYuq0Mi3VVCVTldRP9OFVyJW@vger.kernel.org
X-Gm-Message-State: AOJu0YxLAP4RprDxSnzOpSStUhtBY50ENxALjRes55pn5INm8A/9KdjW
	XELd2u0VQrXN5p7mZ5URKHOabcpwe/f+sGxqkMQNWWhPlMe66JjDnZxyVng1IHb03Mi5IUThRNf
	RDxJ6ney0JqBU5SNIw8Q92bKPKJftZw9LCSJ3+JxF4ZFhVH+kiTtfHgkMhxIDhvz5
X-Gm-Gg: AeBDieuBSlD96jUby6nDmKpfc1lrhNWtxuA+xkTmAaNuqobxkSBxiPIooou5AVoelc1
	OLdcGYTX/HdA3gyAxUlqtdBOKHVL2ALcshLbx/OQdR4HublZQQdXrGBM83/X3MK0QjW3WmIzREl
	YQNW+cGDbOVcNlB6kZJV0+7TGtgdY4j5Yhq6otldNF/EBFmEVcnrqNa3rvB1xpskTMxASclIodr
	vJFk3zO37PzlBzWE7I6RQsW5a76NW8/FB3eaFQgoAJf5+A79/Aad3Q5AmhqCrw2kbGW40x5sCWK
	oeKEQCxfVH0ae6Z9iJyrLN5W7WP8lcKaOxAkxbH5mZzUeaZ4JURFHat62Z4vREOEGhhCwPnvsHj
	fAnJk2kHMZXMcYwB+ATd2ZVPnxtTa86f4FilK45WIC7e8BwkdSNEXWaE9/EG6
X-Received: by 2002:a17:90b:3d12:b0:35f:b204:c62c with SMTP id 98e67ed59e1d1-3650cb63481mr7629130a91.0.1777988845037;
        Tue, 05 May 2026 06:47:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3d12:b0:35f:b204:c62c with SMTP id 98e67ed59e1d1-3650cb63481mr7629063a91.0.1777988843143;
        Tue, 05 May 2026 06:47:23 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.27.125])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8024ffdef6sm7653976a12.29.2026.05.05.06.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 06:47:22 -0700 (PDT)
Message-ID: <7461207d-aa05-4272-a9c0-360e6abfb0a6@oss.qualcomm.com>
Date: Tue, 5 May 2026 19:17:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <36ghmwuwqgm3d432nkklw4igl6wpr5snug7jpha6ioz52qev7f@4g5pxcjxx5rg>
 <6cea3306-280b-4f01-be46-28e546cebbda@oss.qualcomm.com>
 <uxklfc663dzdjxd5e7gd6mftddty2nxqypoandbwakydgrjhaa@s5mskp2tlfch>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <uxklfc663dzdjxd5e7gd6mftddty2nxqypoandbwakydgrjhaa@s5mskp2tlfch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEzMSBTYWx0ZWRfXwmeASgVXNt4k
 F8cd/vZbCiZp5atXb8XYl1GJYU57lUCqf2MPnzidjpdNgNHWh4BWY1XiFUChV3PmUueGIPZ00xe
 fQT/aKLrQf1ecF35+JYbR6oxBiqlKZNTeNia5DMQxH0h3QCkkx6MH0phe7FETbGtcKvqKU3csVv
 viCdT0QTEtNBOBrwUUSsGIYWJdkf/1ycwaFvKgAZlxEqIiy64peja56yls1X7NLXy+6BagrRIkG
 sPPhGNTvbvvEDh/7em7qk/xcxO2TffjV+n2uPPVgrEUm5/XHwH1HMjy6RZ53qp1u0PT81VhJ5/H
 mKHOp5KeldJ2aXnZ+IuXYssG1iQs4MZm8AtPlo74O/umDS15K6rXO4WfKOy1Xh/ep+Gs2CfL4Uw
 ue3zrguYj1TvA4G+ukyCX4ZjBG8aA+yyZzITRvcTOu8/4vNRyzEy5R0/XSf3I3AZBT8tFxkls56
 BHrafWKtsIrXgcI01Mw==
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69f9f4ef cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=9uzW0PS53YT52NB8YZ7Mfg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7OoR382vXO5eJJLDGIEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 7M5mYTcQIyteqZe7BvdLSnt4OmKlHcDy
X-Proofpoint-ORIG-GUID: 7M5mYTcQIyteqZe7BvdLSnt4OmKlHcDy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050131

Hi Dmitry,

On 5/5/2026 4:58 AM, Dmitry Baryshkov wrote:
> On Tue, May 05, 2026 at 12:56:15AM +0530, Umang Chheda wrote:
>> Hello Dmitry,
>>
>>
>> On 5/5/2026 12:14 AM, Dmitry Baryshkov wrote:
>>> On Mon, Apr 27, 2026 at 10:35:02PM +0530, Umang Chheda wrote:
>>>> The monaco-ac EVK is a new board variant which shares the majority of
>>>> its hardware description with the existing monaco-evk board.
>>>
>>> No, this is not a good reason. Is there a common PCB? There was a long
>>> discussion for it for the Hamoa / Purwa EVK.
>>
>> PCB is not common for these 2 boards.
>>
>> Also, not sure if I mis-understood you - You had mentioned to have a
>> common file for both the variants [1] in the earlier version of patch
>> hence refactored it this way.
> 
> There was an explicit question if PCB is the same as a prerequisite for
> the unification of DTS


Thanks for the clarification.

This was discussed in the earlier v2 [1] — even though the PCB is not
common, the majority of the hardware blocks and their wiring are
functionally identical between monaco-evk and monaco-ac-evk, with only
difference in H/W being 4 PMIC in monaco-evk v/s 2 PMIC on monaco-ac-evk
and the rail which is supplied to the SDHC controller.

The intent here is to avoid duplication across the two boards rather
than imply a shared PCB, similar to what was discussed earlier.

If this approach is still not acceptable without a common PCB, can I
drop the refactoring and keep the DTS files fully separate ?

[1]
https://lore.kernel.org/all/8f79000d-ccbb-403c-871c-7a36423c9eee@oss.qualcomm.com/

> 
>>
>> [1]
>> https://lore.kernel.org/lkml/7r6373fo56alzqa4e2zzdnsgwfhgdkmbhxe4cvdo4p7fg3zren@eyiml4uedfbn/
>>
>>>
>>>>
>>>> In preparation for adding this variant, extract the common hardware
>>>> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
>>>> include file, and update monaco-evk.dts to include it and keep only
>>>> board-specific overrides.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>>> ---
>>>
>>
>> Thanks,
>> Umang
>>
> 

Thanks,
Umang


