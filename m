Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9553515FA
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 11:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755021; cv=none; b=Qm9+4KgHxBZjpLuyYbsNBjzshev1jZLGf7nKXUtjEGFteNuROnJm/mmKBDwxiKrLOp51vkRMcuwcvCnMlsZ+n5F8J3KeSSjlQoNseCzO3wMRkFmNTK67zTb0VCV4mQg1Zv/Xmu5Hv6c4jyrdO8367ogfuM0BUmblKUzVdAziD9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755021; c=relaxed/simple;
	bh=5zMP7IArrpQ6Xa4Y9ntfsERpVQIAEaFdp1G14Flm4uU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHasgggt+UembSqJ6Zvyr/4oaDaFKdhLy8EpWM0XuC82svoGmUihuFZ6QSCAefSxs5NlRn8+1ZWodQOycRjkYBuvCrpSwgP1cDEGFW4xec9J3czTaBCYJaCz3BQl1Rjd7/JS6JIv9VLfaSQMhQWN37VITUo2nwYlmZgSPFOchYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0K5Zghw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXj/RXFP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0K5Zghw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXj/RXFP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673AXOp13759351
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 11:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhi1uU7Xn6WTgizHjN2RJSbjsbctqcIUEUH41J8KyPQ=; b=o0K5ZghweMLpYkqy
	YMVg8JD9ORHEI+qLuucNYwefqmVhgVL1SUGbaLPaKlT/4hQ6mBlB5ruES/x8i6bg
	ywlV9MmtdCXcx7e9w24s40CUU1bet9dSaN/tcAh5TD6CzcSxeI0O4mWl+nE/a6rH
	9Zc+p7qbD62DCwkQEAZ2uR8WO1gxRUQBC5tkrUC13HjbYvI7I/L0WDAB/3+joSxy
	JRAXJr3H7WWPpG30olfs2iWchZMgLpn4N69dRu+PwSd1YYAbjtq44pSrNKKcd/IO
	JPkznvngASOulk1H3zESH0TH8oymtE+/IkbTVZKDTu/KvMLZMA3YhvxPwNMu1XIa
	n2HMuw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrns5vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 11:03:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca860baea9fso8419543a12.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 04:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785755015; x=1786359815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhi1uU7Xn6WTgizHjN2RJSbjsbctqcIUEUH41J8KyPQ=;
        b=WXj/RXFP+vUVlhuqAa1EI3Cn1OL8MljqO5i3W+gqj5TCntlyBXMSyOsc7WHVVDKLkj
         a5OX2dmmFDnkfSoDZsE9nFWORty8hQaiMZH4W/DK2frpqHCpSjjlbKWNUb4CHb3A0OBM
         vYbaOygrCDB20+Q0H/18CkCuFrjCIHgozr8EkXirfMeDRZgytvTd7fKAl75mB8XGlmPn
         bcTmMFUrj82t/+0xX3y/f7G6F6FXWYFyTvi8LIxOZ3iYxhCelCONNJ1/pmuXpdTrhAy7
         8d39KwkoDL+9TXIrhswRC0SaiSPl4jbAlWQkn6f77E0NtMqFDhZhApb4TZFAWAtb1IyA
         mRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785755015; x=1786359815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhi1uU7Xn6WTgizHjN2RJSbjsbctqcIUEUH41J8KyPQ=;
        b=CITgjDu/IsSOnHE6f2p1oCvqIFXWCH8rQQSaXf5793i7GYbMiSCZC6VlAk6YRGEI7K
         1J2GEencwOCi1LqQQf2+e2Ttzy8CiGkimNdW9jILMMGvjciASnXzJoNiTnuCvBw1lyQ6
         qNyuDqyCY50hGuGt456Gp/U6gzEMghTNyVM8+2FzlJhKSYLO+FDKNCN+9/Zrg3WFSPxR
         VqtfISdzmMCbtwkMkSmXdzEzh/cwDILSJhABHFHmFfo6evKH+faBm+ZFuxwoimDLX7eL
         Xb998ctKnnzG3oLTvxBjrq46HAau99RQIeAgp42nt+IYyXJHIKWck5B4+vKbkeWllVYv
         SVDw==
X-Forwarded-Encrypted: i=1; AHgh+RrOqtTFuNQPLzA+Vv/I5KhgC+sZOBWsUSMUwgl0Mm2mxHg1O4wlx4mOF5hXhxW9asyDq6NXoo2bYDou@vger.kernel.org
X-Gm-Message-State: AOJu0YwnHMxfuMwc4r4LF57r0Ko0zMVQDUeIQ+4OuSmtC1fzvFQoV83R
	kFCEiaFhSlU01I00DT56/oHW0SdgK+AUQWi9OE4F/vuFiPYXV2n2CP+c0kp7cTavvhI1rqcNPfS
	q1DrlImzHsDYHHtcEddr1iRCQF7/+W/SBaEF2rcF3iB8ekoc8imOG5zcGOyLqErpY
X-Gm-Gg: AR+sD10DO8tz9t9pmoFtn5Agrshb2mk6FDlpNa/4/Nt+uqlbwZw6PQxW2bor9m1lpA1
	nnYNmkMpruSchxwLs+kzjGL1YUGxeZzJATmL5BUe2YE/z0jz8KveGTUFM1XuGDGxfkTr6g4/N2h
	HdH/jKYKgqGRAuItFlC+0GUdVJj6DbLctlFl/IJ41Ha1Mh4LMbP5iTMz51ZX2c986sAuLRivss+
	qJ3v/Ny09y4RsASXqG9pxH8XbZXo06C9NzFP/kccr4RlZr3juhFuw36RmRWx6UQ/MCN39wJyGJ7
	8vYg+h6bnR+pj/oDgKZY4WcX3XVWfiL/IaZzx84Hk+O+cOrfMYM4AnuXqw0dFTD1xNjFsdqiDWq
	dmbH7fzuV9XNmTdBscaRNTDB0HgKl
X-Received: by 2002:a05:6a21:103:b0:3c0:9c1b:d0c0 with SMTP id adf61e73a8af0-3c92a99a476mr9183317637.75.1785755015300;
        Mon, 03 Aug 2026 04:03:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:103:b0:3c0:9c1b:d0c0 with SMTP id adf61e73a8af0-3c92a99a476mr9183285637.75.1785755014787;
        Mon, 03 Aug 2026 04:03:34 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04491dsm49107229eec.16.2026.08.03.04.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 04:03:34 -0700 (PDT)
Message-ID: <d5137c66-8895-4b08-a089-42e16fa211e1@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 16:33:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] irqchip/irq-qcom-mpm: Program wakeup timer when CPU
 cluster goes to LPM
To: Marc Zyngier <maz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-4-3d858df2cbbf@oss.qualcomm.com>
 <87h5m26hqv.wl-maz@kernel.org>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <87h5m26hqv.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5OSBTYWx0ZWRfX3GkFUfz+9oQq
 ZvJr6lSozZ6BbV5+rKPpMiziHK3Y+VH5q77zgRM1I/1w94NWCCn9Y5A9vbIugFTyxz1xS34xLXx
 cMYa5jmj2fcHgJJu1WXSRiyGsrNthgE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5OSBTYWx0ZWRfXzvMf/Ekj4U64
 G6FkNHmJGJ9qqCn+lN+GXUBBwgln1rMsEfmaBm0CN4RWrAT6prKRx1T7CwMvm8hVX5z8rnQn4Bw
 fZ2Rx3T41zrdDF2IozelUkx++C7FFy5XZhsNJzuA3ACD3BT43XC3khgNyqmMdXq6ghZQjcQnkv+
 QPUHn/5wMhr4SntgoU7ulIiKYYdvumzQqkdLKMxqZTu5sVJQgXxJPp2R2YkHRJJEk5GG3r6A6Xp
 VrINMK/F2KiVfMmi2mt75lweDvykVRFPswyu4RPTKnl1TEW86O0xy6U/9jYz/q6KS427yG4g4H/
 ZHXURX69AupsqS7ceq5ufkv9Bdbx5Tb67LhCgkk1wesHRTm4XqFRjgVhiw+PmWJIhkKxainFLyc
 KxjN+Ej4X9m9GlssAwKYUaDAWCHK4+FVOy8Nes+CuFDOz2oCFi73AqZTyaem0wJ1HOKVVGyYkQQ
 Krnck8xwbxf0zBqh1Og==
X-Authority-Analysis: v=2.4 cv=Zest8MVA c=1 sm=1 tr=0 ts=6a707587 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2w1JuJCqnWd_qW_YTkwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 4b-61GpwaPePMHpLXUl1u_zq8m1jz2ud
X-Proofpoint-ORIG-GUID: 4b-61GpwaPePMHpLXUl1u_zq8m1jz2ud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030099



On 13-Jul-26 8:48 PM, Marc Zyngier wrote:
> On Mon, 13 Jul 2026 11:25:44 +0100,
> Sneh Mankad <sneh.mankad@oss.qualcomm.com> wrote:
>>
>> The next wakeup timer value needs to be set in MPM timer as the arch timer
>> interrupt can not wakeup the SoC if after the deepest CPUidle states the
>> SoC also enters deepest low power state.
>>
>> To wakeup the SoC in such scenarios the earliest wakeup time is set in MPM
>> timer and the Resource Power Manager (RPM processor) takes care of setting
>> the timer in HW.
>>
>> Add MPM timer programming when CPU cluster enters power collapse.
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>  drivers/irqchip/irq-qcom-mpm.c | 44 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>
>> diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
>> index 763eddee99dc4cdd5edab22ce54808528f9ef165..f43c4a1c35f78b6cdae194dc7ae88c5c307ada94 100644
>> --- a/drivers/irqchip/irq-qcom-mpm.c
>> +++ b/drivers/irqchip/irq-qcom-mpm.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/io.h>
>>  #include <linux/irqchip.h>
>>  #include <linux/irqdomain.h>
>> +#include <linux/ktime.h>
>>  #include <linux/mailbox_client.h>
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>> @@ -25,6 +26,8 @@
>>  #include <linux/soc/qcom/irq.h>
>>  #include <linux/spinlock.h>
>>  
>> +#include <clocksource/arm_arch_timer.h>
>> +
>>  /*
>>   * This is the driver for Qualcomm MPM (MSM Power Manager) interrupt controller,
>>   * which is commonly found on Qualcomm SoCs built on the RPM architecture.
>> @@ -77,6 +80,13 @@ enum qcom_mpm_reg {
>>  	MPM_REG_STATUS,
>>  };
>>  
>> +#define USECS_TO_CYCLES(time_usecs)	xloops_to_cycles((time_usecs) * 0x10C7UL)
>> +
>> +static inline unsigned long xloops_to_cycles(u64 xloops)
>> +{
>> +	return (xloops * loops_per_jiffy * HZ) >> 32;
>> +}
>> +
> 
> Do we really need arch-specific code to be literally copied from
> arm64's delay.c, without any comment or attempt at making it generic?
> 
> Specially after having added the same stuff to rpmh-rsc.c 4 years ago?
> 
> See a pattern here?

Agreed Marc, there should be a more generic way to get this information. I will
work on it and post.

Thanks,
Sneh

