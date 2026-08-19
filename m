Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC10135CB8C
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787118662; cv=none; b=Z218jXJOnudYHtGETOP2E35lxTEX1STHT+0qnH2ePr7cuuxxIM/ZB1P+fTRgtEMSr4lZGeNG/609dFC91mZv9N+WSHrBK0rh7fE2qSdpFCW/aPlgFw51S0FHY7h7kArKtTw+/1TSrh3vBueJ3I2T+DGQN+f2ucDEquN0eNhds6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787118662; c=relaxed/simple;
	bh=b4Wyi6SOndJWDr1nvfDwCFA84uIVGowI8AwiCxljYjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ba9KmmiSQP7KiDyZyUTohMEZFwMJPSlZeqFIDnO6bhY2RUyHlIqsA/1qkPSzmN4F7l8dZdhCpkXKiMz/FITRhbEJyp4ON2nyCydY9YBWrjR0syvZXpEii5SN2SY2z9pdXHnH089IlhHbc+acfPnUzP0UwXDUUAJDrnu2JuHvko0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5h+Tm+N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ck7o/Yr5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5h+Tm+N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ck7o/Yr5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5I5qs3067099
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ojm2+u9vHv8+sQ8wnLowKabjsVDJJmVlvtgKrDJSMuU=; b=b5h+Tm+NRxgoI5Vs
	ipeYtg1F5HmRB5ZyWZFhwpECHFsEUpxPDja+/P3B3fMqrPFWlBlpbUBBoIk9CcIb
	tInEaY5ikGxQ1N8qJVkH8dgdASWVJeQkog7prhow0nk5MPYfxNb/kbECYDa70NQD
	FUIiPPQN4jhVLfjlLS0Mwosn9lbqGwjZ4eqzIu18ev4ijWKoVYb0GhmgrSbDLWc/
	VXQiR9T5PkG34+GlAXuO26QcOyCd9S2QuyPLFnPM5l9wypnNm8pwVKIYBo00rH7o
	RZ6AjSX2jBhkj066rmGYfHtSnyrQl4Cw8LkGUCLRLh1qv7nxfh6ujLSeGiKqkBa/
	G1uqRA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm9hme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:51:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cceabd70f5so14156395ad.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 22:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787118660; x=1787723460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ojm2+u9vHv8+sQ8wnLowKabjsVDJJmVlvtgKrDJSMuU=;
        b=Ck7o/Yr5/atZVWjy3lCE8uZL4ztC/JWNgs+gj+YSnsdpPFa08yQMy2q4M1KsPSxn9I
         64WMCc0+d/PGgI+BovQowodPo4EVTSJ7QZO5n8VCPePQBWnxY2NdpDi5/bF5nXuTJhXS
         g1dIt/8+EFqjRW0l22SO4MPPexuWKkN7zQM14G1fdr88MY3YYZ+Zg7/191DGWA/SHLNl
         rN4Hiz5FXTicu6VYFVOJWSFBRa672+Dx+/cVEfVioJMBaCBon9jeeK0AzCzTZ/RV/SOA
         zLepnYWRyK40i+C+8KSznxqxn2EQQOTLQfZ5gvbC5BQaI5jAGAOA+A3r4XNWq//7woRK
         9mtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787118660; x=1787723460;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ojm2+u9vHv8+sQ8wnLowKabjsVDJJmVlvtgKrDJSMuU=;
        b=Umf2RQL2/2Gg/g1a6LS/8JxvAkjP3qi9fOwbILjPFzXpAg1q+bVKXw8pMvLcU2+hNV
         nNRaReB11iTY+C3aI1g/TCBPgXiXKtiqc460i1sgOIXe8hc9IH9o5JrsmcZL1KJraCuK
         IoD9qozkTWkFg8KVr4P43v1Xus64Lwp7ZewNoLdFzgVg3y5oXFAJkS50Aj/uBtHdAeRQ
         DeIyV6pVyrWpL1y6ceSw52Y1F3Y6LmgwSAxJfKZP6bEAblFZ4aV9dqAJcq74KdWkolbc
         HMEicJM3I4/MgjVqPr8ntjku2b4BT65393Wu81ihC9g50nmtyWLUBypHSV9s8IHDpxvk
         9JBg==
X-Forwarded-Encrypted: i=1; AHgh+RpgDDvSC4mwEB2EIvaCdIgouhe7/U9jRrElwAsM6L5OyR6jSaOWu4Rly6R/meKjv+/J1bCWz1N3JkI8@vger.kernel.org
X-Gm-Message-State: AOJu0YwTHQreCvPFM4fPqi8FCcApQZ5B7a/uTj8P4UoKBWRc3p20dVCM
	7z/giG2MgZGJFbg2T85xvJFcsvp9+ErHREw82cGUmL7BlUggIIam5MJxnzmK5TtwuKiCUzyqIJS
	SYD9GYm4SwT2rceXpb8ciJluXwdniBoF0WyxQSYwavjFn0/iyPb7rOjKLchPrGtOe
X-Gm-Gg: AR+sD11ZYmKHPN2fKsJjGXMT/UjTQhNDK47x1bXfceYyjWBv5uKWPa9UgTqO/eG22Qm
	74yvNH+Jb3OIPXK/CFLciwaufi4zkcvxopFO7ti4QGSU/GRxyTbNbSlsOXZcps8Epeq9qaAMebd
	sBzOWKc5muQNvlbAfbsazZkPQqx7G1wMU/Q7PlBsZBkrQKP+C2mFwevEF6lH7nuw+L0c2wr4JC4
	DVeN2GQE5wLWIENp8QAomS1cUIcCI/pAiHIXiu37tta+8iRU7bxmGjLqRvzDrT4ONVLprCP9Ql0
	bwuRH99xvbDY0nZCibhpwQPKLNH9Izl4hVSTQwc4nTC1uEWMCcwrtBgrMYOrVUa9+BB7fQ3xBbv
	kUgclJxGL7HQFdDpeDsH5mSFt0Gw=
X-Received: by 2002:a05:6a20:3d19:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3cd00dcb3dfmr5032696637.2.1787118660008;
        Tue, 18 Aug 2026 22:51:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d19:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3cd00dcb3dfmr5032622637.2.1787118659611;
        Tue, 18 Aug 2026 22:50:59 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15544d5basm211672a12.10.2026.08.18.22.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 22:50:59 -0700 (PDT)
Message-ID: <5355d0f7-4987-41a7-9640-886c90b5a2ad@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:50:49 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
 <5hksiunlpcuv6b6eu2tx5furtzhsmutlts25vi2t62totceedg@r6fagkhlflic>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <5hksiunlpcuv6b6eu2tx5furtzhsmutlts25vi2t62totceedg@r6fagkhlflic>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA0MSBTYWx0ZWRfX3vF22eBidJmy
 nNB3UDuXGtiAX9F9wYuJM5/sPdOl8XtizS7u3EMFc47a+QU2lvijFYIqSIGamiq4BtUpN/aD7wA
 BEl/mHrHrhjVExP4Mvj1s+yUNKxsp7RDTpqJtq3hwMG5JrCJovYkiL0P8+Oy8goG1LU0vQI8lHF
 OW/PGZ8mJSqhAg+vjEgih9PxyRctDlhfoI9+ZXGG+MnBiMpWaJbtN8N6aD8k6RORko4C5hRV3ii
 yHK31OTIpCUhd8racGFoVlhM5lwJopznjogXvR8uJgYiaGy491AFvqA8J2BD8pZNHD2rO7H4t04
 0KTbvdEFzbQrLKPFMv5GrWnXfFR1Ri0C0Rzg0PK2rNLhB3xPFqKOzANucfA7Kkw0Wsopf5qKLRW
 tW4A6Lz4zsXZCXsRtEsDdwTNxlPCzAM9fmqd2InXvIpFm7fC6Nx3NoTpvHa+QmF9FTbFwL4HyyA
 2WoY9U7IF4cHFfx2cjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA0MSBTYWx0ZWRfX1Ow3Xm6WDqUD
 hLxtF6CczyKduUaK5834VIvrOvwKEX2fQzXPcnmyhqeY9pvCx/c8eN6V39pcbKQKWILCME8pWrm
 EJb1WW58yoAzH1Edy5JsQXpKyatcCgc=
X-Proofpoint-GUID: DYKNxupiNPL1ABdbS3os9qCDPmSuI1VK
X-Proofpoint-ORIG-GUID: DYKNxupiNPL1ABdbS3os9qCDPmSuI1VK
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=6a854444 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=BEJFxvBaT2hUfSgglMUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190041



On 8/18/2026 11:31 AM, Dmitry Baryshkov wrote:
> On Thu, Aug 13, 2026 at 03:44:53PM +0800, Yongxing Mou wrote:
>>
>>
>> On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
>>> On 7/20/26 10:43 AM, Yongxing Mou wrote:
>>>> Kaanapali (SM8750) and Glymur use two display power domains.
>>>> CORE_GDSC powers the main display hardware while INT2_GDSC
>>>> powers a subset of SSPP blocks.
>>>
>>> Can they operate independently? Does INT2_GDSC need to be
>>> powered on after CORE_GDSC?
>>>
>> On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should
>> generally track the same state, except that INT2_GDSC may be powered down
>> when SSPP1 (VIG2/VIG3/DMA5) is unused.
>>     - CORE off, INT2 off
>>      - CORE on,  INT2 off
>>      - CORE on,  INT2 on
> 
> What will happen if CORE is off, but INT2 is on?
> 
As mentioned in the reply to Konrad, we can't do that. INT2 can be on 
only when CORE on.
>>> If so, perhaps changing the clock driver to make CORE a parent
>>> of INT2 could be the simpler solution
>>>
>>> Konrad
>> That would still need DT and binding changes -- DPU has to reference
>> INT2_GDSC directly to gate it independently, so it can't be hidden in the
>> clock driver. The two GDSCs have independent GDSCR registers with no
>> HW-enforced sequencing, so they appear to be peers rather than parent/child.
> 

