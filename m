Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858CC42901B
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107712; cv=none; b=lBXno7DNG9/diz/99MaWqF+1T941tx2s0Lr/stR0fpHPyjPY4urP6qcu46YRi0m4KxnNRHEKvJCuDB6h0lvvRF5tR+/nAuMSyRtPofetdxwfOxUMQ7wydkjkvxxlfaXgBcl81il+6h6a5VjtOViyGfaDienagctDkjhUHEM8ik0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107712; c=relaxed/simple;
	bh=L6ej++8UpylgEjQY/DX/hMRSU46kfmdMNZsHvr8wlHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QaGirEAZxfad5Z6foAG0Sc9nz1vbiAQDrUNDv48+P8zASJ6zcNrln2jUOLOGh7en1gaHdXgmcsYaXzlJRITkR3FZrL8th2zheGAul5VD6wxHj2tGAG6Nf7NlQmjqi1gQyGIlyHwFWcDZE+PrwrRe+Xv9wfAqINibjedqpuQ0OpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ls5F5+xQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6IW4RFT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ls5F5+xQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j6IW4RFT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lHcn2621111
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AP8nMGePrwJBuZJet7pj5q90N1nit7OreF2IYhy7kTk=; b=ls5F5+xQYYJvWcQ/
	0O66Ivkk1FBj2m6Bh89lt9n5OGFuosp9buKJNfGsL2jBeu9+uARtOi5ugMKLqc/u
	G4yBvkrGJOWKuTLvgggwUYt1tnXJC68mqIfq0X6/z/J5CsfdS4R7Sy52RBzJRnrL
	iljUtzmTZJiayZdICLboolI+T7RmC9HUlnRkQxSJUQFzXDoHeZ+LTSL+fwj4PY9D
	28FwJkY/B3cjumHM5eXYNAzW2Y1Mo4rin9Ho4a2b4AmJ+P2dKvKhLm/UziFt/MC+
	rg3vmmK/sy6TVoyB5iEpRsRH5m+sg1rl41klNSNfwnRN24M0m/BYKb5zrupiqeWa
	9qYHLA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vhk0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:28:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ead919557cso15421936d6.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 02:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784107706; x=1784712506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AP8nMGePrwJBuZJet7pj5q90N1nit7OreF2IYhy7kTk=;
        b=j6IW4RFTgpet5kR4nSwyk32x+9oxcDk7D+t4dgUUHghl2XVA8iXhlCRuhyHywVb8TV
         jRvhlzij2ucIGiOrN7ePBg+ioMR8p3UTN/3jmk6hy8etierVJ9VCf+++crwZ3p0cCCE/
         Stqrau2VgJqXDILKbf6H8ixVF2g14MsCLUe/Qivvk7bQLhyJEHX25fBpuBP1fPgNMA4/
         4I4I63Y7VACpy9zWv6npRYssmBoRJFonInjoCf3+kOF3LjGpm2QcHfTD/YTIQBdtOXN6
         wO7nnDZVZ4y2MEFVWJn6zXodxWy0Qwng/kIk4e1/zQf2NCYQbjGfrGmXOmc0iFghruOU
         1TKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784107706; x=1784712506;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AP8nMGePrwJBuZJet7pj5q90N1nit7OreF2IYhy7kTk=;
        b=Ted/BQC8UidPnQp0C+AYoUUW8KQltEbvFWt28BwNtEvweM/hUIYBfgMmHnsliNeUjc
         d0Rl/D1KILaA2QQMfKC59rkb3W7RwHLfnH7hyA2Jkn2zMGB4BCRIoL24ZoRYCShjKFZE
         HstTWILZ3Dt6RczLjVZKSAG3TUXq9tjaZOdaeyF/v6Mb3ReiCTPr9Aq7IAbyB9ctGYVE
         LR9vBwZcyIK4lrVCMEpS0BIUsVfNKFTIkkZrxT3d0BziWPRGF+rzBWM74rsFxvBqnfYA
         6RAIXF4rFAYnOEs3UlP0T9kbqVdF+ZhlB5+WjOFo06ZfdBZiJaJr6UIl+V6AE4p3v1V7
         XsZA==
X-Forwarded-Encrypted: i=1; AHgh+RrVlyCvHSbHT0NfqD6CJ1dFSGnwtyrNC/+bEZuMsZL/cjYuaGjOJ83LAgz9IffbVE2IGx8yKlb6nEEV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3+7KDzyMSXhXMwNr5k9xHMWUWUG5mYPfsBNtvGXFRieem/FYK
	p9i0AZvvPU8oevbPE4Yc4RIOl4FaJthMewjbkIhXeMBNN/jh9YpWujLEQ3YTRh89fd28vS70/oc
	GcdTRRxlfGdJ0C1lAYJeyhbbRQWbY/w/rvB/8YhkaNsemO2uxM4+N5cAo2aW7olg6
X-Gm-Gg: AfdE7cl5nKetOMvBVTvlLkp9roeklX2lDPkvwjvXeQ804ZDKLdGIB1I2J93gTkWH09F
	QWpRoWx8lxMJ9OyD3vsyo/LX6NmqXTgHFtuEatFGnaz8g6Utrju18HZ1xQe/mOVhkUe0knHDOeq
	/BLuHsu6lYowRHoqC3x/yj9/hpxTzIbfkx0toCrIGMm1M1V0i/sQFxTEnI6Fgt/amPMNCY9eyRb
	LngiuAximxnLmCt4ur5WSrVHM7inR3W8Bm2nWTPdBrBmlZKLrvt//SwWwgjM0wyzzfHrHGb3p/I
	yWFLtxUvQrGfsAdF2kl3n3Tz/OnAd8DUmBMdj976oQEhcn8hGsMlhorY3jLFPEN//3+xARJOG/U
	RaaNPsq0JrWLs1dewXuB2d/CiAUIoDVrGcgo=
X-Received: by 2002:ac8:5d05:0:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51cbf170c31mr134548141cf.5.1784107706462;
        Wed, 15 Jul 2026 02:28:26 -0700 (PDT)
X-Received: by 2002:ac8:5d05:0:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51cbf170c31mr134547881cf.5.1784107706012;
        Wed, 15 Jul 2026 02:28:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c165a9b7c73sm300603066b.9.2026.07.15.02.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:28:23 -0700 (PDT)
Message-ID: <3f5430ae-7c8b-445a-a980-22c8fa8122ff@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:28:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm2290: Hook up MPM
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
References: <20231215-topic-mpm_dt-v1-0-c6636fc75ce3@linaro.org>
 <CGME20260709114143eucas1p18463122323bdeae8e63b1d13cd626b55@eucas1p1.samsung.com>
 <20231215-topic-mpm_dt-v1-3-c6636fc75ce3@linaro.org>
 <dadff7a9-bf04-49fb-8c55-5605e99be7fc@samsung.com>
 <CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a5752bb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=hD80L64hAAAA:8 a=KKAkSRfTAAAA:8 a=MDPXCrVRUyKAm27fIg4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Vz98IK6qu1ViygCmF6B2iOX5a3-JYeCw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5MiBTYWx0ZWRfX12rd1Jlkf2xM
 piQpT9IaWAn07fkBmUnd0vS8pcIa9eGU6DnZBnTUkuPnTnkd33oxH/GSOevCO9zGK3lZim7ZUj/
 aN/sN/LmxoZfyontb6urxw40YUk3sy4mrTybOxyaETRk/hNMZOPoBZ2bkkEjVM3QqtgOcjhONXy
 51frKtO3FhVoU4vgjtsbZJ5UT9ZzI479CORItxx0GJdfAtPSFXIu4OVchGekRU/gwO7eJy+GTjS
 fwZgAdY7Y9mPkbseKOzxsy+9PZ5Fzzy7wl55vJSKQjxHdY6tjZ3w5667mFIvUBSHjKJMwwViJrY
 JQ38vT3T9eCusTNdWCrImOabdUWLrko1r9uEYKhUaiQFhNZoufNXsotcbBB5+Q2Oec8OkIW1U3P
 ZDzaQuPOwBL36D7zwSI78d+No4sgzohSYlyklk0kIZ0DAgKYLb8sbFhLuDKqWozgujl8aRAq2bo
 e0RIq0uThPgQ/AqZfQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5MiBTYWx0ZWRfXwC6ZR4AIf5z6
 HReCKHIYybyd6IDXsOGiYcAWjlY1sJXveVNh0jAGw322qwm6n9fJMNGyx7EoADHpgUcO8Mj56U0
 4Xa/UZvsQMNkqktlPR3WweVyHHjighE=
X-Proofpoint-GUID: Vz98IK6qu1ViygCmF6B2iOX5a3-JYeCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150092

On 7/14/26 3:04 PM, Ulf Hansson wrote:
> On Thu, Jul 9, 2026 at 1:41 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>>
>> On 15.12.2023 01:01, Konrad Dybcio wrote:
>>> Wire up MPM and the interrupts it provides.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 42 +++++++++++++++++++++++++++++------
>>>  1 file changed, 35 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> index ce04d0acdede..0911fb08ed63 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> @@ -199,6 +199,7 @@ CPU_PD3: power-domain-cpu3 {
>>>
>>>               CLUSTER_PD: power-domain-cpu-cluster {
>>>                       #power-domain-cells = <0>;
>>> +                     power-domains = <&mpm>;
>>>                       domain-idle-states = <&CLUSTER_SLEEP>;
>>>               };
>>>       };
>>
>>
>> This patch landed long time ago in mainline as commit e3f6a6994041
>> ("arm64: dts: qcom: qcm2290: Hook up MPM").
> 
> Without detailed HW expertise (still learning about the UnoQ), it
> looks to me that the HW may have been modelled upside down.
> 
> The power-domain-cpu-cluster should probably *not* be the consumer of
> the mpm, but rather the opposite. This is how qcom,rpmh-rsc works, for
> example.

I think that's right - we only need the "CPU_SS going off" notification

Konrad
