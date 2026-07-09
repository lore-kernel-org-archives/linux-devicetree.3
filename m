Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9618A3A7F54
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 05:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576548; cv=none; b=q1T5L4XmszvgmjOfJCkYOMltg6hTfcoaZagdpWuTfIRmeT1rtul9dfrp2bVJruGj5f4NVDKnmEEQeKjLofyxa8Bm7szfanxCEgtB+WpIO9kANEFMNQv9oKhRG2t9dQfR113d+6VFLNf8yRjpxyONOnVlBU3l3Oei1ArL6Q9soVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576548; c=relaxed/simple;
	bh=sXgLEOgI2SCOJhE/tWVh0lCN5/y6oBCIOWbl2fyUefA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8exE4DmqAEouxf3jMJa+hXFQX/2zm3VI9CWjvFWvsfNOmtxf8XdaTky6XYhupmd5mLYOoYwoGlHaw2x4tAlmt8OYdnJ5Bsbiv234QmpTM5Jrdn6bW6bbEu9U0UPuQKfqs3PqWZMGuRAi4LH2YcgVcsepyfO0vjrkOv2MJ2nNJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ze1fMsuR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Miuv8mri; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ze1fMsuR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Miuv8mri"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N91Xc084296
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 05:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2SdAfcm2bDQkGugOuxGblXVTFcWe/K4asZRKOKIZkDM=; b=Ze1fMsuRHeyn4W+1
	YlNA0umD9w1RYyTxkpudsWTLeSj41d9e84zXLDUs7viAdwxrEhh2WYMHBFVNifIE
	Ovoz1mrUgyDnS9fHEZTzq7xBFlHc09jTvgQiopbi2Wbi/80trFxWhuQhTwjmMt3j
	9QwTLRz79E4OHy2wHH5erokMvSdFOQXIhbjEZw+vitdotq5aA3BaqwHUI5mIAa5O
	wHqDOfueNVyP8oceBmnYhzm+QM+1lO3MIjG/OjxQ9NSdXs+NW8oiXMWcczfuWSAF
	I056P3DAF7oMcrlALedj+HiSweMSOEI4iVmDWOEns0xpsGLjsLEedmzInBCaPVTB
	cxztnw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vt1sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:55:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so30885455ad.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 22:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783576546; x=1784181346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2SdAfcm2bDQkGugOuxGblXVTFcWe/K4asZRKOKIZkDM=;
        b=Miuv8mriS0v965ibXFgEV/if3lXmWgpISmlSeWEdZa2zvWS1eM926/Qw7t3rRdp3XC
         swJpHkJokTtOhjDxHTYQYkkIlQ+piEy1V/+N770m/7HhAEYgsOPjViTqv9hg8CSIYcpd
         mPwtqa0CtVbMhOqgMMgpErRnf1u4mUclRpAuhwIqsZgC3R4I0fSb2FRW5NiGfUN/QSDY
         B2dg3pYN4xn7/3VWQvI70Gfx7381HodfZ4VV418QigL8kbwVARQyVoW4lRVxOirwzFRj
         TQdGW7OMRfDWsSV5dhlyoqPSYbE+D+Mrw9rmZUQjrhkfr99TRpKBeS+8rQFrx7RNSjUA
         nfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783576546; x=1784181346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2SdAfcm2bDQkGugOuxGblXVTFcWe/K4asZRKOKIZkDM=;
        b=dgyjUzioFR41JkdbM5+r3iyESBYuLWdfx8b8MDOqdcb9PaTPCcvJ7AwTDkZFnSsSWm
         ZpXmq9BYp9PFw7CMg10+8iTzlOnANS3TjRjZpXZLJojKXRtTaF0h84v4eOsU9uhy1fvq
         DAftMjGxN6BiqaSDsCpPYVvcFtE9EEFShbl62LytfEu5IGSS08qcIqVchA31qOXcf9cs
         OhkYeakwu3lCahv6nYD3BZassQXYFiFp8z9hLYGOgDlXKLBR/nXwe3yuxGUMJ/HRKl+K
         Rrj8Si0qA1zu5VOvElPVR2DHvmnlIB8tNub1NvFit0eHuIM6+fHf30Sz614tBOENTLNw
         v9iw==
X-Forwarded-Encrypted: i=1; AHgh+Rrr7TOcilZ60cYLDfSfzjXHy2ATZo2MtFveWz2aMoMw1P0W1oclhGKAjnWL4ICg7NVacfyP34BVBr0e@vger.kernel.org
X-Gm-Message-State: AOJu0YyLc0n5oqzVpPn5Fu+fN60tIx0RYtUQDOib/NMSMvoTngZB4Geu
	flwMsrFI9UNq3zpE7qgGeM4sprdH1+BppsUxPydntjLxjIdeJmsgb9xU8cDJx0070RXRBQdJ6cj
	MK0oe7IEx98VJeAxaOaZuxwRyzWGiGgrTWD1Fbix/PwG7eBfZ8OFigdl2AR/8X37g
X-Gm-Gg: AfdE7clHZQjoknR975TK0ymI2XXvwS66alwsUZM/JcJ6Bh3zb5JOi9QSq4H7gtwHluR
	/ukqwWpMYpHgA8UwnU7TPOledNg73ft7wUb0ynmI+wVcrFwNiqcrFn8UpZkZ/1pzbpfaPeIbMPA
	ZvnvRiOuQDKmVHs80RRs9gPM7GcVCyW7wo1KCI8b5bItkNqfrCfFx82feB8/lp4CkYcGcZgDwsA
	AgKXqAEZ2Ro8EDcOslhyQ2rnuG4pLrOnYA8wY+ouoEDwFl7/+rCN0ea5jzeOTsGqYNNqjZWGePI
	a8oxM0QoVPhy4CFxwtw2IkALG8ei8+wrrkecaF1U8JC7IsZymbH0Oyb/NPY/0MuzBBH3DJLDm14
	SsdImnSVgrzaKE6SjggmGE9bG0S89fsAc2FbOzXMWZ5E=
X-Received: by 2002:a05:6a21:a96:b0:3bf:d0c8:2aa7 with SMTP id adf61e73a8af0-3c0bcbc5172mr6875957637.47.1783576546163;
        Wed, 08 Jul 2026 22:55:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:a96:b0:3bf:d0c8:2aa7 with SMTP id adf61e73a8af0-3c0bcbc5172mr6875920637.47.1783576545686;
        Wed, 08 Jul 2026 22:55:45 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5946sm3184667a12.7.2026.07.08.22.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 22:55:45 -0700 (PDT)
Message-ID: <04365920-4abf-439a-816e-3ae6ff06521c@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 11:25:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: eliza-evk: Enable PCIe0 and
 PCIe1 with M.2 and TC9563 switch
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260708-eliza_evk-v2-0-c599246ceba1@oss.qualcomm.com>
 <ak5sfkmrhorCY6lf@baldur>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <ak5sfkmrhorCY6lf@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sNB_S_N2s-MEzGdYFU8DiqjETC08CBT7
X-Proofpoint-ORIG-GUID: sNB_S_N2s-MEzGdYFU8DiqjETC08CBT7
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f37e2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=UtvHBniHWTLL8wGpZJ8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1MyBTYWx0ZWRfX+8QStIOSRGmC
 d6pik8M714hAkt0Qa+jm1y7GI5LkwSJuNOTsHr5DYfuXZ6SGMpZWe4dj0FgnQ6SBLOjlk2HyChJ
 rz8lTZAYSmH40zWDEI21nFt1kdo9FIlAZ8lfFrfDFDZrFPsTIS5/11caEuALCeSslr+yu0V7D9L
 bvqY89S0+TDcRWsWpoyxvaqZRRiu4+GEPDPBTX5WE9yd9gt3s3qAehu2FEQTdowJt+UKHE8qzDp
 XBY/QCks73I4yjcK9E7CWUHzLWd4a32wgCz65BlyLEUEGjQrFXLxFs6sTMy3pgxb1OBmiZhDPG2
 e2v0xYzivFg0NqGOzNnJzk/UMvjwx5bSnZR654FQM6+JwxMVKQkysx+GGjadtV7adnBiM2WaJTM
 r9HR67NXFWMktDZFkkdsMUkliflNFqP2Q/aN/qf8PP+Qj1AKSfJ7TPKsJgzbxF96YfsTaaL6PyJ
 Y8a3x35WzlGyJ9SY+tg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1MyBTYWx0ZWRfXxx0UjNtpLhpr
 aJi66WncowLm+OPk/RecJQ3qhYlUn4ERxUSDUuBQJJyhucYo6KLxEsSRWqVDTHkO/3TAwygzkkL
 Bkdg231qjhx99lbt1ttGmF6WLAxFrk0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090053



On 7/8/2026 9:05 PM, Bjorn Andersson wrote:
> On Wed, Jul 08, 2026 at 11:47:15AM +0530, Krishna Chaitanya Chundru wrote:
>> This series enables PCIe for the Eliza EVK board (CQS SoM on EVK carrier).
>>
>> The Eliza EVK exposes two PCIe ports:
>>
>> - PCIe0 drives an M.2 E key connector. The 3.3V supply is GPIO-controlled
>>   via a TCA9538 I/O expander on I2C4. The slot hosts a WLAN module
>>   (connected over PCIe) and a Bluetooth device (connected over UART5),
>>   modelled with the pcie-m2-e-connector binding.
>>
>> - PCIe1 (8GT/s x2) connects to a Toshiba TC9563 PCIe switch, whose
>>   management interface sits on I2C4 (address 0x77). The TC9563 RESX# and
>>   PERST# lines are OR-ed internally; reset is driven via a TLMM GPIO on
>>   the RESX# pin. The iommu-map covers all downstream switch ports
>>   (SID range 0x1400-0x1408).
>>
>> The M.2 WLAN module carries a Qualcomm QCC2072 Bluetooth chip. A device-ID
>> entry is added to the M.2 power sequencer so the serdev node for the BT
>> UART interface is created on PCI enumeration.
>>
>> Bluetooth is enabled with this patch https://lore.kernel.org/all/20260529175822.3366535-1-yepuri.siddu@oss.qualcomm.com/
>>
>> This seris Depends-on:
>>   https://lore.kernel.org/all/20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com/
> Why send this patch, when this dependency is known bad - when would I
> ever be able to merge this patch?
>
> And why are you sending separate series concurrently with dependencies
> between them!? It's one thing to send patches saying "I depend on
> someone else's completely unrelated work", but saying "here's a random
> bunch of tangled patches, good luck everyone!" is not okay.
>
> I expect all three patches to be rebased and send in one series that I
> can just click "Submit" on next time.
Sorry for the mess, I will resend all 3 pcie patches in a single series today.

- Krishna Chaitanya.
> Thanks,
> Bjorn
>
>>   https://lore.kernel.org/all/20260630-eliza-dts-qcs-evk-v4-3-18cbbdba6e7e@oss.qualcomm.com/
>>   https://lore.kernel.org/all/20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com/
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Drop patch 3, as this is already applied
>> - Rebase on top of https://lore.kernel.org/all/20260708055017.A90C91F000E9@smtp.kernel.org/
>>   and remove pincntrl as pincntrl is added in the eliza.dtsi patch and also remove
>>   pinctrl for resx as this is covered in pcie1_default_state as perst gpio.
>> - Link to v1: https://patch.msgid.link/20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com
>>
>> To: Bjorn Andersson <andersson@kernel.org>
>> To: Konrad Dybcio <konradybcio@kernel.org>
>> To: Rob Herring <robh@kernel.org>
>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> To: Conor Dooley <conor+dt@kernel.org>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>>
>> ---
>> Krishna Chaitanya Chundru (2):
>>       arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key connector
>>       arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563 PCIe switch
>>
>>  arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 228 ++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/eliza.dtsi     |   2 +
>>  2 files changed, 230 insertions(+)
>> ---
>> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
>> change-id: 20260629-eliza_evk-6f30686b161f
>> prerequisite-message-id: <20260708-eliza_dt-v2-1-e6281da26408@oss.qualcomm.com>
>> prerequisite-patch-id: 7654ff4f899ac0094a2e791e7f208998fcc7d5fa
>> prerequisite-patch-id: 9e10dfbe360941cdac0300aaf163149755952f9f
>> prerequisite-patch-id: fecce0170351baf00cbe8f6b302d1def4d99bbfc
>> prerequisite-patch-id: 97cd6cb495fdd198f6de7fbe45ef32e4a638ec9c
>> prerequisite-message-id: <20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com>
>> prerequisite-patch-id: f3615b5c1e2222a2491f862a7fba3994058ecc53
>>
>> Best regards,
>> --  
>> Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>

