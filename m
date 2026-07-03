Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD1C390C89
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068419; cv=none; b=lXgEKM0p4AEhi5+GWoOa374uGH9uRPfTd+0URbBjiz1fb0Wqy9SI0lJl/3A04UVg9Q2BD3PqPWxsRZgFzC4BV4zyQ5XyEpl4dbzdwMU/1FRbiGHfBEadSQgLLhWFTkrLQojAJvmeY6H2nKISuflSomoPYNJvChu2vSRvQSrmAUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068419; c=relaxed/simple;
	bh=Yh5sN0fooPWjve1pyIXuMVFhw1LAYLqgKlqoMYjWzuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lj2V+OkmV5w+LnuJWNNd/zNZl0sYdnn1oggjAVOM98MwB0DiS1tbVk8Yn0P8PmRezDKzOjXqHbr+WETEBnTmAzcND9L9dVMCyprjps7XsHM5cZgRzWYNcjSmCsSId8Gy5WkeXfkqsEAIlt2F56lTkUVUC1cqjjHJ7hzAB+nGYag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q0NHziIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Su41Kk1G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q0NHziIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Su41Kk1G"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637IR0w3194821
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 08:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B69zEZt3iuxyMdtFtu+kFz/AGfO4nc5UwvvoATuzTCM=; b=Q0NHziIf2STsPAIx
	ZUNVTQ3sSlF55uDRJB+s+lzjVb4Q6NhovInGi6hPIUEzKiH6bZHjSCskI4Oo46jE
	Sq7jiS7kmbDCx4bs97cWF/doxvzCRhtbp/j8fbvqbWl5/euNXXZgt8HWrcxl0vyb
	Tbl1wSw6DqJ6Php1LzYd1MZo8Nhwdbwo2cQ9JUSQgIUEvnNqo1xmkBPOGEJ/FA0F
	mXycevGCW4ccmj8mrETYQBswdyzERfYD03Xum6UfwAZNT5/soYLOYNSxXU5mfzAo
	muUkEjwmC0NlT8CSj3QYA5JYrznhjfZ0P5+85d8qfsRIrAQuR+460IN510dhL4E4
	5jSK/Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyrag6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:46:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9d85160caso4810655ad.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783068410; x=1783673210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B69zEZt3iuxyMdtFtu+kFz/AGfO4nc5UwvvoATuzTCM=;
        b=Su41Kk1G09jcrl6MjFKGJU6HFuIDGpyCdFZdsSAJEaJrrRo1ES4/ysUG1v4+QuygnV
         USFtI3nmTrb4Kbb6fiKmVaGugvoEpgIsMaalRX1/q0Y8NgfQt66jq/WDRGHg8SYpAW6H
         Ia1H1wO5yP0ip4dQd5LWhE6SEq3UAjCm/1Ty3eJ5pybdEKa5/ehpADniOwAoRL8Je0vp
         ZaBlZ+iMoLCotwDbg7pI05cN9ufR749I85VICB6oNs1NEdJQ22g/7JxyHOl3ncwx+m42
         SOfyXKER+XcO3y84ws5KI8eUj3AE4uJTsOITxXUa3v5TF2nbnKfvAMAo424I4fpuCgJ7
         Qxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068410; x=1783673210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B69zEZt3iuxyMdtFtu+kFz/AGfO4nc5UwvvoATuzTCM=;
        b=YbkfmdyWUn78HgEXc8HyRVHmAUKxqPMDUPRVQX60BF+wABOkojmTaNdFbFmVjaQmGZ
         wbzeIvbK0o7+m6JaoGndGPkeNOwrouetpsBCRF0UHRqqki5jbBKrnJc/hDwt0vbeqgm5
         sxqeiKO9BJEda0DuvlPwPr4QhNeumfw1OxR6Vrf2bNg5Q+UU1yytUI7NQ389Z3cPv9yn
         xrOCP6xbL2mZuJSfYx47l4zVYkjrm6KBbDUNkQubsJrGQlqzPFJ3JOtFaHs4mvTUy8SO
         FAN8lzfo5u29Bg3kXZA2La+lOrtFbXaNReoS8n6YS7xowycKQx8q/8SEV3XNjKt1kxzP
         edCg==
X-Forwarded-Encrypted: i=1; AHgh+RpLbEBsN7hwKH0Q3I3N4oy6MboMqMgsjYyU7iIkBdQv1xBIpdVNmiJnx97ZhLWrNInVFY0MnNkWmApT@vger.kernel.org
X-Gm-Message-State: AOJu0YwV3DrJe7OL6YkAH3YFdPaZfwZRsRNY9DlwTPaKfnYDeHO9lSiQ
	lPqu4PvDs8eiE9dtFUdJt0N/YhlWK06/q/VoIzwiQXHrhlYH/ib7zNyS/BfbR9deLzR1VYnykoB
	zDIlvmuq/7F2+OU/0G32CohTHVMScFmygk3N8qYDMLqfq7U8vzEfiCzFPcdPfm9U5
X-Gm-Gg: AfdE7cnT38gSwL3zpOsCDCjniJj9bvm4cLYH7DqTrRl8AZtyh9m1ICaMmSyC4EKMzjn
	ExQHlB4d15g9RyThsB5BMsP34JFO8aFJqc8G7TtaQxDDt5HESopduH5lC1P3sk2uQ1Sovk0aNh+
	1+AVjhbUYD5lscNNjMpnW2I5098aaB91YBXsRPbpQYpHeVD2nDLZYs5X7xMBQYK16G5RNPNE+PD
	U52zkA8qR0Ts0ewNqo4SdwxCO2s8WEOuD27d8CYkCmwrQhVu16GmqsdtjS/W2huVd7fwuf10KEO
	AhB+Njkv3Cws1GkL70AiY1m+yPuVaj7tzDhQsr/eKtUugxT6L5GW6Fg6J+Yz+WPeB7h7D6wU7TC
	Rt49+QAehYpP7hnK1gDAlZgVuXznoF9HGfO63Kybb
X-Received: by 2002:a17:902:c40d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2cacabc2ae9mr36765245ad.7.1783068409974;
        Fri, 03 Jul 2026 01:46:49 -0700 (PDT)
X-Received: by 2002:a17:902:c40d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2cacabc2ae9mr36764955ad.7.1783068409489;
        Fri, 03 Jul 2026 01:46:49 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm21512940c88.12.2026.07.03.01.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:46:49 -0700 (PDT)
Message-ID: <afd17a5b-ab71-46b9-b537-c5e9b98653dc@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:16:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-2-4d8e1504ea75@oss.qualcomm.com>
 <87jyrgqe5m.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <87jyrgqe5m.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4MiBTYWx0ZWRfX2N6u8kCZZ35p
 Iu2NTckwm/XdI4KZKvpqxhUGETor1OtyYiCh7zM7n1RIpFJd012Q675Pbc5QB6raSPP+K3OZ6ia
 lheyFek+Ry4x9lL/1EWJKMcmSeBMPm0CKm6PPe2PDtqj0FWUhZhBQdloqyZyQFd16jPtO3UHrSv
 KS/qIiPqzUfpH9WHQStXeNd4+BRpU/nLyHjBl02m9oMeLNIxj/THh+SPy9/Hy4EDoJskNlJRm5s
 htDAv3/BjF7BnZhxI0kiajWy1i+gd3pOUTDRQ93sSBTAz94pvCfUJnxDSdGsBbeXx4EWzAIRxyv
 q/xMdVEL+a8EnduqcVs/QDbYywdL4hP+2mKGmVVxxu26GuWSfMQ/Ca80X36Do8dctCAc6USZy90
 F3W6+LtTg/qeYqCbfMfUmgr8JSyCyW55M+KrPcgX46cboOZpaXxRHYGwtzo88S9HBA472ddbpba
 Ff8bttIvJ9qqHMj0HGw==
X-Proofpoint-GUID: tLsqQ3G43ELl9Jk7VA02ZrV9NI3TJCLD
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a4776fa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=xKoXzObbE768e6KogzsA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: tLsqQ3G43ELl9Jk7VA02ZrV9NI3TJCLD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4MiBTYWx0ZWRfX3l76q2rTVs9F
 yXIGuYQanqyDrN0COi7xeMTeqa90WqIEhJIDM7QDUqqC4ypW/6bGm+rd/oWS9doxoLMpwWqHjSP
 HjkicSNeKPOOySwjKAru/3yMupfCttA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030082



On 6/30/2026 8:16 PM, Thomas Gleixner wrote:
> On Tue, Jun 16 2026 at 14:55, Maulik Shah wrote:
>> -		for (i = 0; i < pdc_region[n].cnt; i++)
>> -			__pdc_enable_intr(i + pdc_region[n].pin_base, 0);
>> +		for (int i = 0; i < pdc->region[n].cnt; i++)
>> +			pdc->enable_intr(i + pdc->region[n].pin_base, 0);
> 
> This needs a guard(raw_spinlock_irqsave)() when invoking
> pdc->enable_intr(). The probe function is only invoked
> with interrupts disabled during early boot. If it's called later, then
> this still works, but lockdep will be rightfully upset.
> 

Patch 3 of the series moved guard(raw_spinlock)() within the pdc->enable_intr().
I will merge patch 2 and patch 3 in v4 series so that lock movement and newly adding it at probe time is captured in single change.

Lock is required only for old PDC HW versions (v2.7 and v3.0) where enable bank is used instead of separate enable register for each IRQ.
Adding lock like below will apply the lock unnecessary on HW v3.2 specific pdc->enable_intr() as well which is initialized to pdc_enable_intr_cfg().

       guard(raw_spinlock_irqsave)(&pdc->lock);
       		pdc->enable_intr(i + pdc->region[n].pin_base, false);

To address this, lock is still kept within pdc->enable_intr() which is pointing to pdc_enable_intr_bank() for PDC HW v2.7 and v3.0.

Since probe gets invoked later during probe, i will keep guard(raw_spinlock_irqsave)() within pdc->enable_intr(),
even if chip callbacks like .irq_enable invoking pdc->enable_intr() may not need _irqsave() variant as it seems no better way as keeping
lock before calling pdc->enable_intr() will apply for PDC HW v3.2 as well.

Thanks,
Maulik
