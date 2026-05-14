Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03C73A4F5C
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741288; cv=none; b=pkCjoUHXMXWpiiYigo7zxpOkJslkR7A9vU3PV+8SLy+JGiJO2bPRcZyxn0GKpEp+vzE6JfIRFFfkiRULNQUJxXZi8TV6QnvxDsRkjsCbNCT1XZNR81CWW5vtPfzwOCpggwg1u98xcMddqi/r6494fCcNP+CjGUsJdV/yZ0cM5I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741288; c=relaxed/simple;
	bh=qpYInB19+KWB5dpwoxZNhko/ryAESkSZ2TXgzDKRXSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bxO7oJLvHLQ23yBd+W8Kb2gaLIPl7F+1mVaVelY3ro0vnJwF68rVpyey26HURmuuf2ebqJ+TQga8z4iRS0mn/vBa0kr4fr3P13e5OwMJQpGxM17eusKhWDDEDNw9nClqOyKptekvcMs1KhKwOwrk4UGcbC5Drhah+3Ci1uRQkYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BxFwvY9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=avVTcypT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BxFwvY9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="avVTcypT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E5SDL72004007
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1dIqx3AV3aEYA3aesXchj0hVPbQX+b2MuE+8b6/BrFU=; b=BxFwvY9dmeolgFNT
	rxtfCdlUKx0M67AilD/55CfJDr/7/jIa/LJgMnmnuiUC3HdG1PbTeFJVsq1ej0F4
	v0r6Joo67UxwLAsVyF9vrnBnwahlb4+QJ3a4T9UX9k0Jz4BhoB3Skk4UdGmNIaVm
	llflerEmcXADzX7fiTolPXIkHPmWE72n/uA9RtOzI66mcaP2lws9fTQEiDbsw2nH
	WjctpSSSDZ6x+gXfPJ0wS56FreTRM9USM4ZoGFnvhPn+qVQyr6ypsNaId1O/oIab
	Z8u2UpDSIqz9F8cIPRvIQaNrDu1ne316JJtUCP98BIqP5yRbhs1DW7FnNiLhhXsz
	EPQ41g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5899r82t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:48:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8292e18166so2395803a12.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 23:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778741285; x=1779346085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1dIqx3AV3aEYA3aesXchj0hVPbQX+b2MuE+8b6/BrFU=;
        b=avVTcypTd2k3brioJDqSVx+mvA7VyzCNvvgss/MohQxQcsdnInXJEHIIzgDUfJAtZt
         pUN9hssXVlkEXjdsOPGnih16P0irYJdYg7AfzYzw677/3lpem2+3HNqKpCAciVSVgppv
         J0xRH8EIC+erEq8H5lhxfQ9/7O8SzNOsJ0BYfkvWcAGiV/NMd1UYu9U8azZepDgX417k
         y6xt6hhrRqIo/cbGnnsPNr9nt6/sot3cpjbeurVDS8S2VgY4t8y3tKoobgPeRESspxLu
         XFM8nCQsxncj5YaNQQae1C0Z0ajW6BSXWYUouSffRS6wAGXulQS5jjKK6iNKtHxw4Nuo
         Xmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741285; x=1779346085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dIqx3AV3aEYA3aesXchj0hVPbQX+b2MuE+8b6/BrFU=;
        b=eAfVlEivx2+HofDyR466S2dKMZKKSkq+mTwDGl+kbbtZ0p+VDGDypXp+nUIAzLoviN
         vchFkveFcjOWQN847sL1k+dUE8y9hq3E1s7dA+J3APd3EgP+/1H2N7p+C/+SCvlQke7q
         JE36vszGc/dNM/gOXUbdF0+vUWRKojDHpjl/nPhHoD3nG2EjwRhUhLW2hdPsUKWk0wyN
         jSTNRmYRkBBhzsSY+M1t6MICmwvLLw8amCi0LzhFQ3FB+xPIbZM/+v1pSQDNWRdIdwUB
         guUtclI+tWpxAwQ7RJia8hGv2TpzicLPeIHpj4ucAHT4Sr2vLXJP/o/VUsaINFjnfxQa
         Krkg==
X-Forwarded-Encrypted: i=1; AFNElJ+sQ9zdOcMo9hshBnaaeJa+vvHqbt3hb5HtbCU7o0gcYMBkpgM+Kh3NlpHQoay5GTUvgZExLrVL98D0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyudv2IrwVbjKIHXWLkqimjP2IjLl6GD01gjayOzJi4MZguwPPH
	RxA8967CTd3hJz2d8ZxCW3QUTC2v+yG13VvnMuj88VjS9VBhCWEMBO2D72RClHXCS7XRXI2QPFN
	bRlsZPFxxcZ0CmUrac0Cv7I0trEXlM/EZZtJORTh44nA36WseudS3ZlRqO3yCvEmH
X-Gm-Gg: Acq92OEOfvX6+CFutMiL7nXgRGoFmj0c1T1TpsllglV4QO1++qWXPL6ER4QNV0jVgNb
	73YQIfl2lngCTnuLUWSSnEA7juPUt6kZjhTMlmQxomMsaKH5ePXo9nyLNrQpa6JCYxyG3uWnQwN
	KKdB4thexv22tLFGp4MkSvSs8nf6YOnmYJf6EL6NUFG5EFRlM5NSaz6JM2Jm7I4O6WwcCtCiQtt
	pMqN8nrPhbKL5FjnWQ3nxiH96RnL/B0e6loQwZAkSFk8WwFclc5UEDvUZglX5jHbLoSQQ0g2X7r
	lKl26fDE2BGcJ8+Az0H6xf+FUyfoB3Bxr4o+SzYehaVRIZi3fQGEDiHHl7K2RfrR2h3m2sWImbi
	2aHIxE2AneE6fU0DqU+1x0Dsduu0MwNCqYumi5xwrxnOC7pS7sfQ=
X-Received: by 2002:a05:6a21:33a0:b0:39b:f12e:d53 with SMTP id adf61e73a8af0-3af80681dcdmr7390013637.18.1778741284357;
        Wed, 13 May 2026 23:48:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:33a0:b0:39b:f12e:d53 with SMTP id adf61e73a8af0-3af80681dcdmr7389962637.18.1778741283620;
        Wed, 13 May 2026 23:48:03 -0700 (PDT)
Received: from [10.218.12.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196660f9sm1952912b3a.10.2026.05.13.23.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 23:48:03 -0700 (PDT)
Message-ID: <e6572f5b-3686-46ca-956d-c06a7363cef2@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:17:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-6-13e1c07c2050@oss.qualcomm.com>
 <iun4ziuei3tzvr75qbbqgxytto6vptvtd7j5mr5ol5aqviaafz@5m4yxgnqjavc>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <iun4ziuei3tzvr75qbbqgxytto6vptvtd7j5mr5ol5aqviaafz@5m4yxgnqjavc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA2NSBTYWx0ZWRfX7LOSwbUloZzB
 +A5M2jNu1k2yZDxAa4p0rHX5Oh96xXc4d0q/YRrev5sxZl+PW7dYh0u6L+0kj/YExBHv0OKnLXe
 2Fn+3DpcVxKvttvvul1ydmFE6tL8MPI+Y1MM9SFLrtFAUjHd3J8KNYwOqI8zV3qC0Z2Q4ltJdKC
 RNt5SR83YsrTWDgZvgDspO7aSWoWTnF2pRoe2rcZM9RoY6XLXYtdY1lI1FOTP5kB+Gcmk6FgSuQ
 OTI7zQjwNTN/ARVVLyP1VSSqyS6UX6hcyiFR42P2HxeYXmCqMnCphD425MoAv/fSGk2LoWSyAfC
 kASfrKWzlPNcOd9NvG2rbcgBOq76BqT6PYxr/Ykl6LMUchd5tNGusUUNtky82h2ktbRNYM/f5L6
 MwEgbn+XT9hleYfs90ol+xkxbyHGnt2efULsyGhOHVC10yJ6+xUae1PxQgsNuS+tmshb13/CuWY
 5sVpT8rGjPBASPxLN4Q==
X-Proofpoint-ORIG-GUID: FM0iU7gEV55Rx3n1EWnAvvCcy0PgiPWO
X-Authority-Analysis: v=2.4 cv=N6AZ0W9B c=1 sm=1 tr=0 ts=6a057025 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oeV5rHmN1k-fxemBOLwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: FM0iU7gEV55Rx3n1EWnAvvCcy0PgiPWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140065



On 5/13/2026 11:23 PM, Dmitry Baryshkov wrote:
> On Tue, May 12, 2026 at 03:53:20AM +0530, Akhil P Oommen wrote:
>> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>
>> Unlike the CPU, the GPU does not throttle its speed automatically when it
>> reaches high temperatures.
>>
>> Set up GPU cooling by throttling the GPU speed
>> when reaching 105°C.
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 165 ++++++++++++++++++++++++++------
>>   1 file changed, 135 insertions(+), 30 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> index c57aea44218e..5089416ec32c 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>> @@ -26,6 +26,7 @@
>>   #include <dt-bindings/soc/qcom,gpr.h>
>>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>   #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>> +#include <dt-bindings/thermal/thermal.h>
>>   
>>   #include "kaanapali-ipcc.h"
>>   
>> @@ -7045,13 +7046,15 @@ nsphmx-3-critical {
>>   		};
>>   
>>   		gpuss-0-thermal {
>> +			polling-delay-passive = <200>;
> 
> Other DT files use 10 for GPU thermal zones polling interval.
> 

Sure, let me update.

>> +
>>   			thermal-sensors = <&tsens5 0>;
>>   
>>   			trips {
>> -				gpuss-0-hot {
>> -					temperature = <120000>;
>> +				gpuss_0_alert0: gpuss-0-alert0 {
>> +					temperature = <105000>;
>>   					hysteresis = <5000>;
>> -					type = "hot";
>> +					type = "passive";
>>   				};
> 
> Why don't we keep both passive and hot trip points?
> 

Need guidance here, we are keeping passive at low temp so still hot trip 
is needed for such cases.

>>   
>>   				gpuss-0-critical {
>>
> 

