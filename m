Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741C641A780
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431021; cv=none; b=qHoF6tKVSjgWWpgTaCL0BQhp+egVy2SAVmt/QTe1J39TFuLllrst7kQ2Bv6yV2Yh3ovj/RXlIZO9CAkUmcBcdSwJ59uqOxu8pl7E9BC7m5ugdaicPK9z24kYsYkyxcHHy8vmc0Lt1QtIDyKe4ih+VSu2irUa4uZ8cSU1IAZKI00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431021; c=relaxed/simple;
	bh=stBD+/sH7V5qjHYx7BWshE2WoVnRJsFQkt4ni5EA50k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sbok5uOWytntjn1L15h3v5h7Yz3DewNPMpaf/zTzQPL12S0uAWMervCJIQVyZdOq5CIfbF31RVurEooPWzK+q4UK4gz3QEywubMa5Ym5mlca7DLRKI0od+CRcRuGXKzYSmL7A4j+9idFzau9r1a8sQTUFAxZAGCCYVfsxWtkry4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNpbvyt4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fs+fHH5J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YNpbvyt4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fs+fHH5J"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8cSW3755347
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9FkWytPKEFzcW2rOJ03A4Ztr+w4t/jCKqLErazbBHHY=; b=YNpbvyt4gFzUPtHE
	istfF5KOIEMLzuE85OJ2Ge7xATz3Vv/XfMe1y5+sGwHC4ziKsHJlFSWQiTlad8Ll
	93VuN0dFQhbsgND2WyzTZe46Y7wyNKxDU62oH/89BmuGqqE2mgKRW0ODGlS2o4gr
	4/SQkthmw/RI7JZt/mwaR5DznmOnLZq2y/r4iObwgBZVZA/M4kHJpPAqES7DqyJo
	ztGfTo8kINJBBPY5bJmV5MuvlcuoZ8Hkc5spqUPtoPd5PJyN+Pcvclkg/GKvKZwH
	TpFTDzm7OeBolfDverDDgb5vni3G4F9HSnnvJAGn/VCLNAy65lpYtZezJvsbnOof
	642bqg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep1b29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:30:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ca5d2474c7so98099235ad.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431019; x=1784035819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FkWytPKEFzcW2rOJ03A4Ztr+w4t/jCKqLErazbBHHY=;
        b=Fs+fHH5Ji7JaEqhk3QuzSN7X2j7pp71DGB/z6hlSEuMNkoEiQBDxYyePqajTGgO7gP
         mop7noUnvVKMp6yk7dOsgSp1IToSI7CibiQketE2or/uMbRVpkx6qR3Lw5QdtIw1STxn
         ERDGGRd4Q4rdughJZkp0NEjGnMSVBG2hHbmf3MfxmSb8wVYitF0Sd8lue9gXfAb7EoGG
         1Sd4tzzj5DuHHHLyifnEY3KqM3ePYRNK4M+jfHrv798W6OXBwnrbtpit9oDIR6AM2PeM
         5X/US4me/ZnfI9vfojuU4PSazPrOAKbyx9vkVDovglf+2PFL9AWpgsOlOulcBspORnDo
         XMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431019; x=1784035819;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9FkWytPKEFzcW2rOJ03A4Ztr+w4t/jCKqLErazbBHHY=;
        b=eK1eVntGg8adgT2hdDajbZ+wzLgMvMzFi/2Zwg0f6APGBubabVtAdVmTMBXI8O4nFf
         e/0whIJ7h+V6hgof/qdiVYdJRw0jSU1gedjkIua1eQj97CTzeyTvG4/owFsRF1v/ZJxO
         f7l/eoktXtB96g1y2aRQ/tehxd834jvtnlg6aMXiQSwkcaL5V+AQIMH0DUARPhx2MpDf
         FfDQSUXbENIlWu4y3fdpvMuk0UUBW1YPXe1qGCO1R1tMP2tdOsSXNeX3gToXy7+XtOC6
         Vx3lJw7gaHsdMPGTKRaSiVOZa/2Vypr+0u9PWFUzy8e7XUIgqDipRSdaUXlLMsJHEMkU
         pEcg==
X-Forwarded-Encrypted: i=1; AHgh+RoyGJJ/PG0umdqvtL7A4ewYci3l53U6bTvOIFXGNNaB9LXZ3QdCOLfbN10MtEGQPNsLngS5VVBhjjXQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzT+crOHdLniXEoxykjKKUln+S5U2+Ejcf63IG24JnNLMOKUG+h
	4FklkLqq6XUORZYV7ldJI67m2L9JN7RB9NssmZRJvGK37XL8bnXHi7ALDDL4n1iLzRxHijOi4N5
	/FfSNKUst3OYZgc7ip4ujI5sXi/fMLso2/C8Sym+os0s8qoRMT79v5SgPQcE4s3VpP45vR2Id
X-Gm-Gg: AfdE7clTx7L+Cnchu7CEELlT1BoOium4uCK1Y/74EZc1XuccnHseTqOSLjltXsMietJ
	5pS7V+GM/E+UhqFKvMP1Du/pPiHYXwDq2slDT5/IwT5aXABCAd2QBO0DgpOlOq9wD8M98ok087f
	yyNRvlEKc0jVn97UocDrHQkbp6tdKx9VbjYTcGjAApgtjizFqjytzzNJ6ralXr4RB39FcDcY0A1
	3yIASlUVV8vO8iJfZfkjnrpY8yaehniEYiuvb3cEBTNqSNbYvdKAYu7nEliLNdtpsiD3WJMOHCY
	PgKMOs8uBcXAy2hfiBsaTzsyjB7eKsDgcpjbQXQg7TFiRP1Yo3Rae3nO3XPzioeTQGX7JuiTbvr
	l+WxQN6B2RdukLWdcvjn6ufAvN3xB832somJMY2ncDP8=
X-Received: by 2002:a17:902:ef06:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2ccbf0518aamr53343865ad.30.1783431018940;
        Tue, 07 Jul 2026 06:30:18 -0700 (PDT)
X-Received: by 2002:a17:902:ef06:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2ccbf0518aamr53343365ad.30.1783431018416;
        Tue, 07 Jul 2026 06:30:18 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb86bsm12315575ad.11.2026.07.07.06.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:30:18 -0700 (PDT)
Message-ID: <d8f56740-5274-496f-b77d-8d3790789ebb@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 19:00:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: Add header file for ADC5 Gen3
 channel macros
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260614-adc5_gen3_dt-v2-1-32ec576c5865@oss.qualcomm.com>
 <20260614081244.C2AD81F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260614081244.C2AD81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hQ8pLpr6rpHQXvzYPr0AoRwxTSHUWt8d
X-Proofpoint-ORIG-GUID: hQ8pLpr6rpHQXvzYPr0AoRwxTSHUWt8d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfXxHDzA47Hkz7u
 2N11/XM5xxCXCNOCLDv4uxH0jm3x66L06DirCVN8NKm5S1TqAyjaYI3jmIUv7klY/6sXaGgnnL0
 IvMwxcFFjEx+2SqE8RawQMerL21UpAhOFYMn7Aa3b6tpOHXg5E188cBRmMCZN39UtSkysublrA4
 Q8ZcCWtl2zi2+vBo4e2+oyi76/R6wDWwcj4K/Q0SEAfN1Me8tMyfbM1Zwl9QLdAJ9XjNr/QiUMF
 NtTxeH7YyvtDz7EooT4B27NjDtyVqtjyPJ4JKgjk3LmRnMCBaeKlivE9hSR4AqsOMFr56wlswgv
 YZx/cIZdRevrc5oIzwBaQ9fkRz7fKtejgO+a5YLF028Sfl5s7hT12kG2sT6ytQHz5XcnTY227WL
 jb+p9G6M0W1y8zE7k0mRj1r9vHOuXIAhQE8fiSCOzrX1jCIr9ahR8yPw3TRZSeq7m+1U/RPEcc8
 cnI7nF2cl4VUX0O9L5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX2kjHtNiOJIoP
 DvI4SC/C04zT3q9Q+miyUMUbGTB379q6eTOhXJ8KYvzsN8tnki8o7OhON/+uoK3u++QktPWwgvn
 zvDSwOsg/DfeAIVtuAA1nCwYpR9Sz7w=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4cff6b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kEwMdB4yzSm1prmz-DoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132

On 6/14/2026 1:42 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Devicetree binding headers for shared hardware components must be placed in `include/dt-bindings/`, not architecture-specific directories.
> --
> 
> commit 7bed566fe71218ad2ab3cd2babe147ee1d601536
> Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add header file for ADC5 Gen3 channel macros
> 
> This commit adds macro definitions for ADC5 Gen3 virtual channels to be
> used in devicetrees and ADC channel reg properties.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h
>> new file mode 100644
>> index 0000000000000..aa8e54d7e786a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h
>> @@ -0,0 +1,88 @@
>> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __DTS_ARM64_QCOM_ADC5_GEN3_H__
>> +#define __DTS_ARM64_QCOM_ADC5_GEN3_H__
>> +
>> +/* ADC channels for PMIC5 Gen3 */
>> +
>> +#define VIRT_CHAN(sid, chan)			((sid) << 8 | (chan))
> 
> [Severity: Low]
> Should this header be placed in include/dt-bindings/ instead of an
> architecture-specific directory?
> 
> Devicetree binding headers defining ABI constants for reg values typically
> reside in include/dt-bindings/ like include/dt-bindings/iio/adc/. Placing
> the header in arch/arm64/boot/dts/qcom/ prevents cross-architecture sharing
> and can break dt_binding_check validation, as the schema tooling expects to
> include these headers from the standard dt-bindings location.
> 

Based on this discussion earlier: https://lore.kernel.org/all/d10e2eea-4b86-4e1a-b7a0-54c55907a605@oss.qualcomm.com/,
these ADC channel definitions should be placed in the dts folder instead of
dt-bindings folder as they are hardware constants meant to be directly
written into registers and not ABI constants.

Thanks,
Jishnu


> [ ... ]
> 

