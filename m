Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584245;
	b=DHZzLXhQN7SZfOdKROPdNL3Ydv1GEkDeJPXwtEX8cZsD6GJsEQgEfZ91aCBYNn3nXiKS
	 KlOpw0+HY7enIC+4jmqu9CQc/8yM6aYsHi3CkdJUmjgIXMtoIkD9NmRKh+0QMLhAU6PCr
	 GWlcJ8Eqq1ILQnGAxTkODyj1u73EKNgosnv/PrRJ9XG0ik2R0z6vTP4o22wnNz5HjAsjF
	 qG0d5NIwS8+b1r6VeLJtEHvTzU0gZNi2Ynxr3Ue/31ZUWgdbL73Mg41gIvx8Fpfc/zgC8
	 rDv76NjOe0eVFAhv1YRBg6DQiMSjQKDxN6RdpQ+akxhJLJlXZpMK3N4fKa0SzCfURvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ixcvH/kR8aI8LVI1g0qsTfp5WrA8ifVMYqIlgJBOEts=;
	b=EQFgkicPfpgyicwhuZ7UW7mwwyf6be32vpEp6i2g5Sdq2isFrlERP175kfH1Wi5eQWcK
	 D09sX1kEOTyZw2MNcLYL2z9EuT8sJZEmTYhje/+oNxVkctEdPvgpeod7KiwBaoK2eckA8
	 HV7MpkyLlEJKqSctAw/6//2fueiJwoFB9kIV05QYac37lSS/QCLPL7rYCo2PR1gs1PsZR
	 HAwhF0LoyA/SxxDOsMJVdN3QWeUelcwA6x34t60IYKnMGIR409qUL8C18jhyFrEVCKvr9
	 ibFcyN4K/EeI8ZxN19h/+J/y3V+mOTB40+VpUGe8Myy8+3ZyBfmTlxZZ8IHVjvlOjUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=byJITNCR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CZ0DRmwm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4C1606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E4C1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=byJITNCR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CZ0DRmwm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgBwL325206
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ixcvH/kR8aI8LVI1g0qsTfp5WrA8ifVMYqIlgJBOEts=; b=byJITNCR1lDDSNII
	70AynwwagMDUqWmWDlVM9q8P4d7qU4i8KI9jo3twlfP8ZOUl2KL3T1NxMRp68tuD
	lo1btB4YsjKBfFEnWTdtshB5f/3BQOxRLkdx+8Sd2hle8v1ylo5A5SYyVuxW22ss
	DJiSyqhjv8BECLsihRFUA75aRtqWUzHpFBKCM5QPOMh80DeswdHklXlA+QWXjiPH
	7Q+m88+Orc7rzW01rQbJK2rPGLeKPr1zZPPuWa/r69cuY2xuCO3YY5KYP26PsERI
	xu2HFPgzbhv5iM7TF4Q5ilLdjWmgivWb4lJRszV1RfA4AR+UPrzpTRWZkoOtTAzA
	eDjw4Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v3tw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:04:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so1682391eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792584242; x=1793189042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixcvH/kR8aI8LVI1g0qsTfp5WrA8ifVMYqIlgJBOEts=;
        b=CZ0DRmwmkI83ip0A/aEHVjZdQ95u2HLsXR/I8ERHnaau2uUce2JgDiCCjrHQj4ElwV
         TJd6Rne83YpICps49rnkUjbUMn0QOnl6qKjzoSfuNzzyjCbWEPYit2NV6wETr2Y75yJ6
         AIv/yk4aZHcb8jA79dPaHOZuIb8zl+khEX/VT4fOhuyxUmsrdnQYZmsADGMCZDHQkLB+
         pGKAGeQiDMCh9oL7K6DGkMVEWk0IBJav4Hfwr7fyoWbblYKeQLEILqmeZ68rhMp6VChH
         WiKc1jOVPBz1oQaDc3GoHjA3mMw/5QwUZqWRRw8bSu5EBToxaZ401lVGBKrjsZBYjEMy
         DYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584242; x=1793189042;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ixcvH/kR8aI8LVI1g0qsTfp5WrA8ifVMYqIlgJBOEts=;
        b=SHeVhbmEIr+H3sTj97aJ37zM6tv6Bqy4CwvSssk9eB3+tSP8UnnArqWbfRnMs8ea1p
         TF+lD1umm1OTwd0Sy5vVk1oe0wNZI0V1CGg7MK+CA8tGlGxjic55w2sXMj1lNwvFVvWV
         A2BcVc++mfgl3fca89i2rbmZzpTGIEmRw4UO3pwY9iEhV26mxsEcntsk07CLOWtRsvSY
         ixxxhOmcOAc9e60fcTNM1LVaSrVHXWUOP9QMJdtnrEFwfaSYmoLNRfigIs1GJZShRR7D
         qsWJqrFe89EoEJXzak8PLT+gdpgSd+iMmX9SuZzCfEFGxz9YFiUf2bI4zM0KSYoxKJ0I
         OvVQ==
X-Gm-Message-State: AFq9FYK7HgGoHZse8s011+Ee4v+6o7m0TrotUMOh7GRmHxHPH3+q1CRe
	SVBgXwYTptnj92tQAttAlBcCYOSqjabHcxc0h71+19PHsae93ZsGMgVRAYO4aFLKNPoz0i0ayul
	2dF+M+XwSIHNuiCLzHKQA8Cr5C4EUmBfHNnIob7nbKKnHBcaQf7oR4h9DuNVbyZKLQev2gaRf
X-Gm-Gg: AYBFou04AAdQtieZhroZCn1dzF9YkrQi0fCbSgFYKVQ0xEyI8SX4J03IiKAzGqSvwuY
	/XJINuAMsRJf+gljyRliGpRlrHGF6vreIguoifkIIj7aoeOG8JMfGCCEoQmMZ3TiqZbFakW3Sdj
	RGSVpUQM8HqKXjDGxVhud0xOLJuejA4Ki/HwPJ+fINLCvSS+nYqnH+GAsG1+CJTnWxr4Zl1v8uc
	D2uCjzaf9CwsS0zB6Ow4BuIpPitA0trjzmGBmYkKAVeX+GIOiWeyQdGYNoQ1Boi5st5dkWx12K7
	bOHb+LzrY8E1ShhinZPP3oz3dZO2b+BE9wAvERiIePgpAHVZnSuSqJICkgMlrHSunMkj5eMS8cV
	jpkTl2QhswtOyO5iBwdlX7+RO934KUN1B2A==
X-Received: by 2002:a05:7301:2514:b0:34b:b410:9352 with SMTP id 5a478bee46e88-3674b53165bmr3172156eec.1.1792584241804;
        Wed, 21 Oct 2026 05:04:01 -0700 (PDT)
X-Received: by 2002:a05:7301:2514:b0:34b:b410:9352 with SMTP id 5a478bee46e88-3674b53165bmr3172112eec.1.1792584240944;
        Wed, 21 Oct 2026 05:04:00 -0700 (PDT)
Received: from [10.217.240.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm14718312eec.26.2026.10.21.05.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:04:00 -0700 (PDT)
Message-ID: <d4d8a3f1-b1df-4486-b79d-e8d406c91e69@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:33:56 +0530
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
Subject: Re: [PATCH 4/4] arm64: dts: qcom: shikra: add LCP/SRP ECC interrupt
 to LLCC node
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-4-aba3cfcfbac9@oss.qualcomm.com>
 <sashiko-outbox-171515@kernel.org>
Content-Language: en-US
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-171515@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX2DQnl/chQBll
 c1+1q2WZZG+L3I01ZGBqSu3Hj2QeukpVvyHyLIBCDJ89jAThRwp0nP6hFk+MpB3thdAIX6ORTt1
 oW4mg3jnda3wENE3D/StuMjeLcGZmD4=
X-Proofpoint-ORIG-GUID: aKtQouzcL7h2CD-qygr1Nsmehrl43upD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX/yWaydQ1froj
 V3Pa2ash7H8vLnSvV70iCv5LV2OnbNVfPwU57qlIldELLF+luKccPE2B+4fVLV2dwY/rDgpM+7s
 cdWwgpBGTaHmnbsjm37wAIfk6nEDgot4lH4GzBTDcaNcDRLzmrklYypU0wwmOmdtnqTMoTKSJXV
 1bFsBSg/Kn66OgjT1SeWopm+zLgrAhOY2sPfq7nEEYRgjTu3QOtDzao4D5WEsXyE3Ft9R0CZV2Q
 V85Wbvyo+UE6+Z3gas8BLWuMV38iy3JKvvsfJICsY4pQ8YhIv+CFgJ/FGeNleNPC3Py7mDR9DYl
 tnomKyIpkrxnG+ZeEbcgaN8gYrrEKrTvUEcuSqlaRAF/6X/qR/hQ9C1IPD6g4XT83blnXjQkRqj
 78xKpC/rGuV5fMRwAEP+6HoFlUAXNpz+TAYTprJsqtvTLg1+JTmiPOYv9QxDy1Ww01CGgU8vrIy
 wghqwKsqydTNRd4jgiA==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8aa33 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P47hWFwCXEHhMTGuvmUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: aKtQouzcL7h2CD-qygr1Nsmehrl43upD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210047



On 14-10-2026 21:38, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] edac: qcom: UAF in IRQ handlers due to asymmetrical devm vs manual teardown
This is a DTS-only patch; the driver concern is addressed in the
response to Patch 3.

The identical race exists for the pre-existing ecc_irq INT path which
also uses devm_request_irq() with edev_ctl as dev_id. Fixing only
lcp_irq would create an asymmetry. The correct fix is to convert both
IRQs to non-devm with explicit free_irq() before
edac_device_free_ctl_info() in qcom_llcc_edac_remove() — that is a
pre-existing driver-wide cleanup not introduced by this series.

> --
> 
> commit fab541f0482e82717fee45392a6aa89253bbeef9
> Author: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
> 
> arm64: dts: qcom: shikra: add LCP/SRP ECC interrupt to LLCC node
> 
> Add a second interrupt for LCP/SRP DDR DRAM ECC reporting and
> interrupt-names ("llcc-ecc", "llcc-lcp-ecc") to the Shikra LLCC node,
> as required by the updated DT binding.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 2623e139196f6..ff572c003b396 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -1108,7 +1108,9 @@ llcc: system-cache-controller@e00000 {
>>  			reg-names = "llcc0_base",
>>  				    "llcc1_base",
>>  				    "llcc_broadcast_base";
>> -			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH 0>,
>> +				     <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH 0>;
>> +			interrupt-names = "llcc-ecc", "llcc-lcp-ecc";
> 
> [Severity: High]
> Does adding this new interrupt expose a use-after-free race condition in the
> EDAC driver?
> 
> In drivers/edac/qcom_edac.c, devm-managed IRQs remain active until the devres
> phase, but edac_device_free_ctl_info() manually frees the payload object:
> 
> drivers/edac/qcom_edac.c:qcom_llcc_edac_remove() {
> 	...
> 	edac_device_free_ctl_info(edev_ctl);
> 	...
> }
> 
> If the newly enabled lcp_irq or the ecc_irq fires during module removal
> (after qcom_llcc_edac_remove() frees edev_ctl but before devres deregisters
> the IRQs), can the interrupt handler dereference the freed edev_ctl?
> 
> drivers/edac/qcom_edac.c:llcc_lcp_ecc_irq_handler() {
> 	...
> 	struct llcc_drv_data *drv = edac_dev_ctl->dev->platform_data;
> 	...
> }
> 
> This could lead to invalid memory accesses, unpredictable behavior,
> or a kernel panic.
> 
> The same race seems to exist on the probe error path if
> edac_device_add_device() fails, leaving the IRQ active until the function
> returns:
> 
> drivers/edac/qcom_edac.c:qcom_llcc_edac_probe() {
> 	...
> 	rc = edac_device_add_device(edev_ctl);
> 	if (rc) {
> 		edac_device_free_ctl_info(edev_ctl);
> 		return rc;
> 	}
> 	...
> }
> 
>>  		};
>>  
>>  		gcc: clock-controller@1400000 {
> 

Thanks & regards,
Mohammed Faiyaz
