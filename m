Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100088;
	b=SM1ISxLb1LiRNusnMAD25wvcPYrbqGXhmLDcCxFNV0xYGBgqcMd/lejYTywGIuVzPpUN
	 2nA4VHBIvzeIIZzp1WH+uOEGeG+acnz4gO7r0bI3zYAABKXnnaXACE56THYjB9jKGcwo1
	 QrlpeOziqjyw/7E+z/mefnCcBe1tj7FFRwbDvBuiYZvUIJ/jl6SFYc9UMNmsshHHFRIOW
	 ZOYOLypq0Uty0uoQk3imHF0tUZRW5hEnLQ7wni9By65M6ti6e7xYLj2XH1zDsrjdIyGMK
	 NxzzxE/d7r08lXKHauygtFCzaCakQ7Aa7ckLCwEK5LqBHuk9CNJwRGxc1HhUKFW8Y/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FxapVRMKpDEsmmZXHetp6RGC0wXUKkGAJ98ScQHvhUE=;
	b=kPWqS37lRAYmJwAXeu0jy25L3IVBV/GLJhgyfUQlxvzdZpVBN/XsgDUtL4sqvp8PoxRt
	 xKJ9U41VP+M159CdUBedkblRDHpBbo86XDz+rkhN24XlGrjbt/8vjgcFSCv7cCeinDeLK
	 e8oE/fLQ+NY9+NeS6izLfjlJ2h8bx5C1LF9u6+vCSuI2wjiguWNBBuxgznNAU4LGo24jr
	 sLbnqXO4hfqAeaI3/8TtqvjdqOSxA9jgowpL7L5ZcAt7+L9YNI0Z6Lk56fnEXQ2cTJfif
	 XsZ6BhI+BJ39XjrJzsLHXUIeKWH4YLtoCiFlCo0jWfZy59vXyXNqQojvYt2t+7xcZew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTm+q2if;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZRlnZO2G;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0B2606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A0B2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTm+q2if;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZRlnZO2G
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdv6p1614507
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FxapVRMKpDEsmmZXHetp6RGC0wXUKkGAJ98ScQHvhUE=; b=cTm+q2ifSDhFLe38
	o5RQrj2a7BeytWINEZrGxgVix/c9KLH0ChWmpYI1ZVcfBpQfui1+Ojr1QOVeFB5F
	tKfb37U+IoqhxwoXDsT2tyPxlK6eg/6cgwTUsNLKJCeTrz+2YntAq4Xy/9oANJI2
	OpnNlENmOmxJ9/6AQDoXZIKBfAtutNJj34ogYSpqtoP2TNQKSpeFBpg1C7lzLgjK
	6koiyGGzPcII5dwagV2WQeieCMPgx4Ka3CDIWse/6SnKoDb5seuoc6zff5WjlMIM
	LqYqaD6KEf2dgBMTW2VtmBpADBVAU9Wzi7Dl4hGUh+JKGac41qcD+LHuktvhRiVL
	VQdl8Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5rw8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:21:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53568f05f8bso12957761cf.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100086; x=1793704886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FxapVRMKpDEsmmZXHetp6RGC0wXUKkGAJ98ScQHvhUE=;
        b=ZRlnZO2G8o++1Pw68odli4RtmINIpboM5Ab10jMnEtkJ8FPuO2B9vq2DO+N6cdPhgx
         d1Uld7atEk2VpaPfwTE6yEsfscDLulZngmp8nkyxgMlS8zymj1Zjr+t7uKf1WtKh6+q5
         qBLXnWlGFRWh59rgxImgmsIMsB6RlY6G+4euubjs3wothqiFaTDNeElqw1oe5b7LUPn9
         RNr6JfSqg43KKWZB0IVZWe56jxXP/INm7iechKS2FRIPiW2gTriT7m0xoHXaLKo4ipi4
         Z1owamNkEp/24MdFd1UC6t3I6WMqDcnXEiKHvUCFdRlY1k4kMwKl8h3ANYbbIAH6PPnV
         UbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100086; x=1793704886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FxapVRMKpDEsmmZXHetp6RGC0wXUKkGAJ98ScQHvhUE=;
        b=j1CMVJr+kGDg6/ewoHC5JpqhWee1w0zLpiqQjGKcY5KXZ1MqYEJGSExVMFtkXBFB0I
         kpqjEX6DW4f/WZs0Tb/F0Z5QydjYA+2n7gz+a0ED2wIYtApzdZoCi6Pf4FOx5/8BUl+Q
         81pKSBFGpj0di/dMKbupkGXYdvcBUCSTrjL7yIGUBqhChu8ToYqsFzkfNXNOs8RpBBEG
         0P2YMx2kY3VHuivnr6h8AB+JyrXJzQL+u6pXX74vlZbtWJ17JPRMVB8MMCt3KeW8+mGQ
         Zpx6VIVqFyAi27Eo19fbv1os6QgsYasffoyFi3T2OFVo/VFgRrrSMSxtnjfNKlzT9Ttk
         A85w==
X-Forwarded-Encrypted: i=1; AKwUvBzaqSSW6WniZyeXfaJpNXNIuvWKmJ86Z4PPmdqvrynda1vxkA26HNk7/xGKu7PM9Baas9JQVPcD9Anf@vger.kernel.org
X-Gm-Message-State: AFq9FYKCaN2ubnAIMkQ8t+jIZBvV2TIi2pmQnNTp8ZtzESU058wCUShc
	fTl4MTOkh23dkS3KVYLcxLdIAg59zp/FQOUgrmNIIVhJRRsV4+93xaeG77of3FmOxf6bE6qLCDu
	tZeYW9LugFrRXE60sikiTEYHx5aRhaDLz9lD/oAbqq1P9rauDn1+njpWogTHSkesz
X-Gm-Gg: AYBFou2J4u0PbMxa31EJDIBPzl4JcmLwKM3pldwXVCi8cI9klqpmIuLUl83msldxAiv
	ld6A1B81nvxA2PlneqYbPLHWjB54nTaZj4a1QsLBrBR66sPODC8BRz8e/qep939X1ftcj22AO/0
	iCv9Ec0AZiaWllgC5niLCBDnaXW8VNCL17fWMzgeV6zVlrXFr9UfDTbRtkYwhsHVBTgXryCjflo
	LmW3oB/on6mRWQlhzRadffb9tpuBl5exq541kppYp8MxD2DPbk/HC8YkBXeJCcidG2Ls6klp6Du
	js4+7TCoe62OYekXCPty1bk2Yxc5GqXAm6T1Uv38HHBaQbZpXhUYFgWMG35PI0i1qK3gzfrb2dZ
	PwkDfLfgA8hQMCVsqIBk+3w==
X-Received: by 2002:a05:620a:8703:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-940ef672271mr1462773185a.0.1793100085752;
        Tue, 27 Oct 2026 04:21:25 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-940ef672271mr1462769585a.0.1793100085311;
        Tue, 27 Oct 2026 04:21:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a4e208d1sm118196666b.85.2026.10.27.04.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:21:24 -0700 (PDT)
Message-ID: <44dc3838-63f9-4718-9aa5-aaac223a81f1@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:21:21 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
To: Manivannan Sadhasivam <mani@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <0303224f-4c2c-46ec-9866-5ea1fd0fb4a3@oss.qualcomm.com>
 <20260825092715.5794-1-wei.deng@oss.qualcomm.com>
 <isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24>
 <83b67ab2-ab68-427a-94aa-881454f457ba@oss.qualcomm.com>
 <CAFEp6-2KDxDrfTZLN7KPRg=aavj8nqQr7ftna23n9C1Cpbwwbg@mail.gmail.com>
 <e26f0360-aaed-4e40-b1b2-956c92d34db5@oss.qualcomm.com>
 <CAFEp6-0b15kV6ehMN4Pv24UmMo7xFYr=H396dvdD1Teh7h+K+w@mail.gmail.com>
 <at9Dn2N-PmLOPaeq@debian>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <at9Dn2N-PmLOPaeq@debian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXyLMIsyXi1CZg
 8cNAsIC4dOhwWab7kU7Jx3VLfivH8MSJKkj9w4uOq88aUlRDGkBFOkLLUJ4lxBdU/PGHkFa8SV4
 GcwVpxButnRqCcQfbv/iYH/09YcmFAk=
X-Proofpoint-ORIG-GUID: DbPYAfkFBpuPVq3A3pWHlrxeo-MnFjiC
X-Proofpoint-GUID: DbPYAfkFBpuPVq3A3pWHlrxeo-MnFjiC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX7kmeGApGeSol
 eFiromYSpTyjR7rD2QsWnxGUtU1SGkjFcok1f7MpGs63kNR0muGolc2uWeDA1KC6tQMieZxegDv
 pF5c5l0BJHj1Lt0E8jtUI6y+v+fjwSwPVIxdyUlrOLMvWGvuMMJ94WP61FfVwSs+RWP3xrp2Df7
 5ob+8nO3jTBgbo64g0KXD3uEA9BKbP6hyeywXliG4jckxQjoULdCn8ajScCRPHTWkAnv/AfWvH0
 hspVc6t2eJecJZkXeup/7DLhbfb0X81pd4iGpyLl/8TJiJN9qamLw2mclbJObH8CnVy5m/hWzjW
 BDZ++a9UCTop2lzH8ciUXhg9VkypkV9wrLTPZl1NZfwwOnItfaeOEK+OiygFVSfy3FP9OuHtxNB
 uMqc5EvOw21aqQWukasMaygKWTs54h2KPUXY19H1/TuWBD1odRWYQ8e7p7HLZJMVZZrEfLQH6S1
 LkAyn6g9u5RJnpRRJ+Q==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae08936 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5fzcQa2O_f0PTkyQNbAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

On 10/26/26 1:13 PM, Manivannan Sadhasivam wrote:
> On Thu, Oct 22, 2026 at 03:08:44PM +0200, Loic Poulain wrote:
>> On Thu, Oct 22, 2026 at 11:34 AM Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> On 10/13/26 10:13 AM, Loic Poulain wrote:
>>>> Hi Folks,
>>>>
>>>> On Mon, Sep 21, 2026 at 2:38 PM Konrad Dybcio
>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> [...]
>>>
>>>>>>> We are adding M.2 Key E connector support for monaco-evk [2]. Konrad
>>>>>>> suggested moving the port/endpoint anchor nodes to the SoC DTSI
>>>>>>> (monaco.dtsi) for clean DTS layering, so that board files only need to
>>>>>>> fill in remote-endpoint for boards that actually have an M.2 connector.
>>>>>>>
>>>>>>
>>>>>> This means, the dummy port/endpoint node will always be present even when the
>>>>>> M.2 connector is not used. I don't see a compelling reason to do so.
>>>>>
>>>>> I don't really see a compelling reason to defer re-defining them to each
>>>>> device DT either..
>>>>
>>>> Adding an empty port/endpoint at the SoC level is problematic for
>>>> uart, port is not always expected, this depends if the uart is exposed
>>>> through a connector or to an onboard device. So we may end with an
>>>> unconnected endpoint but still have a bluetooth subnode, which can be
>>>> a bit confusing... Also why adding a port/endpoint only for a specific
>>>> uart in the dts, and not for the others? This is a board/SoC level
>>>> choice to use a specific uart for M2 or not.
>>>
>>> From my perspective it's removing boilerplate. Currently all USB and
>>> PCIe hosts already define their ports and endpoints in the SoC DTSI
>>> and if they're unconnected, then simply nothing happens.
>>>
>>> Both 'ports' and 'endpoints' are an abstract property that signify
>>> 'X can be related to Y' and I don't see how that's a problem here given
>>> UART is very much expected to be connected "somewhere" (with the
>>> "somewhere" perhaps being external/a pin header)
>>
>> Yes, but in the UART case, where the connection can be represented in
>> different ways, we can end up with devices being described as both
>> unconnected (no remote endpoint) and connected (via a child device).
>> We can probably live with that, but if we go in this direction, we
>> should consider adding a port/endpoint definition for every UART
>> instance in the DTSI for consistency. The same would apply to I2C once
>> endpoint support is available there as well.
>>
> 
> Yeah, that's also one of the thing I really hate. For getting rid of
> boilerplate, we will be just introducing dead nodes :/

I disagree about this being a problem, but I won't block further.

Konrad
