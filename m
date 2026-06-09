Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E51831354F
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014079; cv=none; b=FaMGFH/jg30752mnfnjCxKO4Rh/JL8XCoLcYBlhuTDFclkF7VrN2kn//j5kSyzsv9Y+NnXwkWhvLgKbNti0S90Mlz3VuHUyH1NHNkWNO9Mp90qlDYpF3NIC4QbueTy100DkzLWL/ceVN09K/y1cyQyE23EaUggAFup1lKAaiOqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014079; c=relaxed/simple;
	bh=FmDYsp2scSZ3q54ZHGgu4ZeWYbFYjiOygsbrYNCfSmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GxCD5qXNWMP0HXRreUeNGH/WqoMVEA+51Ix/iqa9SNowYht4CwyC07OFInKTwTpV9gR+cedTzawRyYdmieimVCiaYSNrQRZHBsr4JsgUQ2Z2zCL1yXZszuRwIzENj5A6tUU13BQHGKmWBmQjfzTZaUKCN14wi864Yz4BKd7bgqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CuuL3/D+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YCwZzN16; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CuuL3/D+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YCwZzN16"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Clalk2706244
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 14:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RFeXds4R5J9h3sAk6YnSG7bweitI9YW6z24vpi9kFXo=; b=CuuL3/D+mCccoNjH
	5T9SQwC6HOXMLJWquMrPX3L6NRdEnwcaOhhyiFaHda1R13zG5vomdkLEBdp+HIdg
	aVfbtWyaO+AcQ2xmTMTUXKyf/4rLihm02xWJ0RX2UTBDDw/Bk7tASAPVGu0+foFi
	e+QpE8kdDVngz2h7qOszfqSp+KL1yaV1B5IrDst9H4z9MgMr7FJzfpula1htzR3V
	cFFZ68dFWlNkSJ+LAf0o96Eg4vX1P3yZxg8EgAXP+sxm+xHpQQ/teVyZVxIknFf+
	/tvqvNqqqfU2go0Yh7hGPFTs5q/GandbCrbit6/9/A/s20y66DAXFsRKd0HUDAb/
	mqk0vw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt1h2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 14:07:57 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c5a5133221so208452137.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781014077; x=1781618877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RFeXds4R5J9h3sAk6YnSG7bweitI9YW6z24vpi9kFXo=;
        b=YCwZzN16qx0ZKJZWPmitnsiq5yQxm95bNwKTHiQyiFSx5T6sYb6BKriWu60f/lCQb5
         7t14XH7IFe91w++Vir16k2HsPCOBJIPl/7p6J4i484BQrntjM3HvGaShgauahsWYZnGN
         HbJkTXfH1rzarFgQHkKaeECqqvLWIKTL5SHUdDkrzpdhEoWWZ3WM5bROZRS82kdOO95M
         9uEluoCfByKK1IOIk4eZfCD6pFkvK06AnTqqaOi8Sp7n/g1S+/t5yi/yqOvw3HtKAZx/
         1EyxH4YOODplKL6aaYw815EkAEn4e7qgKzihMi/6Zxkhe26xHjzDjjXXPQhXu20yMuSI
         kq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014077; x=1781618877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFeXds4R5J9h3sAk6YnSG7bweitI9YW6z24vpi9kFXo=;
        b=RtzM2wk2z9KBu0eBF2NVtlW8t0XMc8YntR4Z8mzF5PQriGTOHtg3BpCOecICirgi8X
         5Jd25OErshb6dJ46P9fd64p3TG571QaHh2W4Gl9sQcIGgEDOfPUS7mLfdHljE3NinAMy
         OvgSeXerratXmBQ5yUS5x031p08nROtKwyX0gsT+342MbI6W87ij2+R+/psaacnc4eqr
         szCr3uNN1eYjFQaCt45ytnR7SHtpRKMoUl54QFohiiUaVawUPsWP3MLUf3ywqhv9L8Ns
         XemBW77EmQDXmXo37LiYl05tGbyvb9rHEqzPkXApynq1AuFm7Gq+PuhFR/qqfHqIwxE4
         OrJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MfJSmJs36zrR/HDYG6qKFjOumYo5hy8TmEcuUqgYKehIkQBnlVeuyJUydirwn3tZv0Df+89ptjs5A@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt+awKsjJjA4q+r0D6c6aCerE4CNmdpDA6Y9tiPv5fA2wtZeRJ
	0aSnAcSmwOffefeJa6TCG74Wr/xC+rZio8upWasxBxD881FzRaywFltOAYEPpeu1nyuoyjrt0I+
	Y4YBUxKc+079yZ1Uoi8HYhgBvBX2YGoX0QySylFb5yF3ykRhHlER86RipAhDzuLqZ
X-Gm-Gg: Acq92OEIhENu1/RqOqVeanADDYV6cE3CrOD7X1eEUrsOt3RDanCj5+qPfW+xH7NqZFr
	DItYF6KRYbkU6e2dCFOJJIPGu0wKjDtnOaY7Rzj3NwRN/vptS8P+vH3/PVyz/HxZACYv3Mb98ec
	5eo4GwQLdWPkJQ/MPflKOiMYCMcdap0eqGvZniTTKjwqImtV3xeLvDQWRMUpMfpozalW7KhoiHV
	qdbJUhErr2HsGkFmiRodDpEgfi4HLjEmPxm8dBEe0eAW1M4gVRHJU+WrJ4koncYQYZthQmXfxlf
	CBUyTSYM9QbJfD2IRMIlAnQGsQ/vrkVIT0yAR1dIvfkzUPQDhg2aDJYMDyrCSa0dioYtxWi3sgy
	wVoMRkW4HFSb1wnTVQXwrzZWHD/dAwRrhERF6L1xMLpsG1zKHtKaab5pr
X-Received: by 2002:a05:6102:548c:b0:633:3bf6:977c with SMTP id ada2fe7eead31-719160955fbmr459854137.1.1781014076933;
        Tue, 09 Jun 2026 07:07:56 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:633:3bf6:977c with SMTP id ada2fe7eead31-719160955fbmr459805137.1.1781014076231;
        Tue, 09 Jun 2026 07:07:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517714c5sm1061974666b.2.2026.06.09.07.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:07:55 -0700 (PDT)
Message-ID: <f32e83c6-ce78-4495-8fd7-a2c48e977fba@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:07:53 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com>
 <bgcrs7ijonskkobvidzoldixqy5ctmvp3hdzntsvfpj4wvjfgq@inlchk3nhogy>
 <b0ec6352-164c-4492-a0c1-b29a07e5e7e5@oss.qualcomm.com>
 <dttcqv63qc6igab7zxlg27ckt3irmjnzhjgcvq6oz7ays4q2ld@be5kp4i433f4>
 <5c1f7955-883f-4fa8-a0e5-513a987bd3a9@oss.qualcomm.com>
 <0710caaf-ec73-4c4c-b6cb-7fe716724f4b@oss.qualcomm.com>
 <13349811-31e3-4658-911f-6f93d74efaaa@kernel.org>
 <658358a6-45bb-424e-8d8c-5b0b09cf479d@oss.qualcomm.com>
 <569f9eed-09b4-462f-b90b-9d8cb7867148@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <569f9eed-09b4-462f-b90b-9d8cb7867148@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LvGoUrlmlF7VQJ_KJSagkb2XzdOXNO0e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzNCBTYWx0ZWRfX3dcs3mVFTtqA
 cSLagSsAVjsR3Vyf9B9u9y9tnNm44Nwh1Ll5ATgxtaidHLZ6vRxD+3twF4yOa+2Hwsm72GIvKcG
 kGsfYkXuTX49cfzaf7kRAbQ6ax1G6ejqPfnHixe+SdKLQPmHs2J5wPXsgVBefeFUvQ3Cdz1ID35
 jH2aYAnt0aboQAVNiTW0VcJlVDzd9uliV8W1m5TBlzgYxFpO5mkF05ek9cA8QwqCPze83vEygSS
 G12+6VS1bZ11Ap0h2v20LX6218KfqRUX375ei+Rw4mmWtSKV3PC/U4z8WMbRIRSqMVJ0Rp5RkqD
 0v95ypjO1VviMNoibg6E1uQelvzmx4AFGLYWbR1WL4uQrruICztaqdiKmAiNBoYXbBrmZjGZgDe
 +yK4ava1t8q9O7LzKNIkJj8eteR8uvANwgZhdeHMkj8YhwzicbIsdA8FVgZd5+1sH0Xzm0Omv+F
 P//eBTerXYMSkDWqprQ==
X-Proofpoint-GUID: LvGoUrlmlF7VQJ_KJSagkb2XzdOXNO0e
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a281e3d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=XrpWG4DannpcGcY-z3sA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090134

On 6/9/26 3:41 PM, Krzysztof Kozlowski wrote:
> On 09/06/2026 15:33, Konrad Dybcio wrote:
>> On 6/9/26 12:28 PM, Krzysztof Kozlowski wrote:
>>> On 24/04/2026 13:09, Konrad Dybcio wrote:
>>>> On 4/23/26 9:16 AM, Krzysztof Kozlowski wrote:
>>>>> On 22/04/2026 22:08, Dmitry Baryshkov wrote:
>>>>>> On Tue, Apr 21, 2026 at 08:41:14AM +0200, Krzysztof Kozlowski wrote:
>>>>>>> On 20/04/2026 20:02, Dmitry Baryshkov wrote:
>>>>>>>> On Mon, Apr 20, 2026 at 03:36:17PM +0200, Krzysztof Kozlowski wrote:
>>>>>>>>> According to user manual / programming guide there is no separate PCIe
>>>>>>>>> phy 3A and 3B, but one 8-lane QMP PCIe Gen5 PHY which consists of two
>>>>>>>>> 4-lane blocks.  This is also visible in memory map, where the 0xf00000
>>>>>>>>> is marked as the main block with additional sub blocks for each 4-lane
>>>>>>>>> phys.
>>>>>>>>>
>>>>>>>>> Describing the sub phys without the rest is not correct from hardware
>>>>>>>>> description, even if it works.
>>>>>>>>
>>>>>>>> Is this the case for the other bifurcated PHYs?
>>>>>>>>
>>>>>>>
>>>>>>> There's more? Oh damn...
>>>>>>
>>>>>> In the previous generations. I think Hamoa had one.
>>>>
>>>> Any PHY with a name ending in -A or -B. That means:
>>>>
>>>> $ rg 'PCIE_.[AB]_' drivers/clk/qcom/ -l
>>>> drivers/clk/qcom/gcc-x1e80100.c
>>>> drivers/clk/qcom/gcc-glymur.c
>>>> drivers/clk/qcom/gcc-sc8280xp.c
>>>>
>>>>
>>>> And, quite predictably, some PHYs may not only bifurcate, but also
>>>> tri- or quadfurcate (on Nord).
>>>>
>>>>> Ah, I did not check the others and there is little we can do there -
>>>>> it's released DTS. This cannot be easily changed while keeping DTS
>>>>> compatible with users, because probably two PHY nodes will be replaced
>>>>> by one with different compatible.
>>>>
>>>> I think no one utilized the non-reference configuration of those PHYs
>>>> in practice. Should a device like that come around though, we'll think
>>>> about what to do then..
>>>>
>>>
>>> What is the resolution of this discussion? I have impression that no one
>>> objected to my patch, so maybe I should resend it?
>>
>> Qiang is working on a proper solution to this. PCIe3B is nominally used
>> for a secondary NVMe, so on the occasion that someone has one inserted,
>> this isn't really a huge loss (the Yoga laptop and the CRD both have
>> a primary NVMe on PCIe5 IIRC)
> 
> This still should be removed now from the DTS, before you get more users
> of it and any change will have impact...

That's what I meant, in a convoluted way, yeah

Konrad
