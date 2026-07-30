Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EB83B058A
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785393312; cv=none; b=ad6fxumLOkKGrBPWhZCoaU0WHudQOm/hbgGHWLaHNDlUgp7/ymbXowhTC0wGqDN8mqVOrYWQQzYzs6NwlgXPQAT4t4CTo0c/caw8pVLZmoRk0a0KjeV0rJeWW2fMI11KdirydpkpcLoFrnZtfo155wZyAx0uYKd7bVaTFs92i3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785393312; c=relaxed/simple;
	bh=mewM66ZLTlHEmLK1Hcz5yw2R5w0+ko7k8tpOVMXWRy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JEM1b2mbsni+a7LmLfmrdroRTGUCMmrL3sKQykQ+xoVhSetiLD6/gOiavf/emolOfDNOJiVLZfOw7FIYQtTXPjotFrM8OF8X7SOTd2Ey402LamHstRqDU/TGjLAugXDAADS4RgzZC4tYi0W9k3z64QINtygE76cfap0tsyjWkXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7FrDJph; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3mCeQao; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7FrDJph";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3mCeQao"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U6YkoN160848
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qP93TzLbWOaUvYhroXnuB8Gmpj93U1Om94mHNyVDvo=; b=I7FrDJphBaRS4R+A
	ZQf8QipTYl8mwfT6YEWJWEWlWrTo2vaLSzoHZGm9HHKpiEOMC5nTh66HEMnjFm/Q
	bQqxgib/ZM5hPGZtchWwzaRsKrY6EyqIojs9fvbTQmC6WGDm0RxF62u779Oj0wuh
	N3hho22wMpbHXsjX/VaxrvzwFN0Cwv1PH1tveBOC3ggzn8EJZMXrBKwUJhYX9/C1
	FGNfshsQNL0ARk9E/ssmKdm11FZpxxde2aK0d/jWEYIJfRmgUlAgx443Sfc7ld0T
	XA1T/mUCSK1UfC8u4Rz764dVWp3KyDA7oDIaI7OotActudHdKDNHOIKqBM79qAcx
	lnkpeA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr1far022-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:35:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848544a8496so2118739b3a.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 23:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785393308; x=1785998108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qP93TzLbWOaUvYhroXnuB8Gmpj93U1Om94mHNyVDvo=;
        b=L3mCeQaopl+aJZNk22aNMozjMHQDXF93S2OCIoZe6B3augQA6VV0ZCiTAVjYwtSqZV
         pWDw+NcKKgPabSx0SK/0aquWlaXsMYNUq+b4N7Kr/6syVnTOCGE+3l+gTjNRZLu/yMqH
         JtoSoC6cOv1Vy/MR0IrDGtsvdr6ZqFUqv8WKnM/wCtuQNDYpgxoMtau2TR90CM6cYnZE
         fjrjYf4yR80BkjMvT8KYikA4A0/gFaQGJMvEEBnCiippwSqLghvM/gHBS52ymvJ/V2jd
         zHasN66jq6H4ySPU1r9AMuR4IXnvNNxV9EcxpliMX+3wo1DLgGl9Xa2WWsK6bCy9USvJ
         H71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393308; x=1785998108;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qP93TzLbWOaUvYhroXnuB8Gmpj93U1Om94mHNyVDvo=;
        b=ZXsQjMEjLGwFba/aERzG1kI5NLvQ63Nd3zozWRFZV9HyBOUKAs1BJGTOFTM8hFgjMp
         uddnpJ6QZTdVpLLFudyrepjmLvapprwkDdfULMO4FSHl7ECeyDvH1zkrn6cjh4LFeVeZ
         O/FcRxcgiDy9LKBuPSmc5IPJzNT+u5BxcN64ONgqjmJOBUiBc4nSMzdOQ6OzcfiDLM6R
         lDZ4MM2yfxy2yqWz3Eh3zZuMPnChCVhEQSNmQEl8efqc7KLnUZak8Z1GzOdkD1x8Go3P
         ogW82//yaEdJUUcY0zgiR/fSJjbrmmeD7sgTB89rCsgSVKg46n2EBxdXVq/+obspfBt2
         w/HA==
X-Forwarded-Encrypted: i=1; AHgh+RoAYhoMFNnfEiQ2HCatyMa1yDhzBdcWwb3R0unaMI6DxU82hUl2FnTSyE0vBJs1cSXvnjKsviGGTIiI@vger.kernel.org
X-Gm-Message-State: AOJu0YzRnmkNmQj9ZAdtiPbnU9Ggdm9QiaVnvhM/AxztDd4HfDhYTBLw
	3vPQdsIs9KxoKRJRy07/SGcTkRA5sj6I/J0Xjmd57Dm/L+h0lKkUhgnNCtk5DRlCWyo+qR6bVUb
	RtFel7ura+EA4A1LUdKDmKqAfRJ4c/3b+lM8R/VyIuu9WxXK7L1yKAMFnxnXZCxDW
X-Gm-Gg: AR+sD10UQcgYeymtHKlO80jVG9QgvdUa2CIqAu9WD+aSVmy1oluGmkeTSGL7bW8FYJm
	pONId5uoiMAvFg8oK7tkZQOFtot3kXrRrcsUBS5y9//bAbPSCgSWoCRLPJjs3Bjmk5GjMmIuud0
	Tgx97gMLhGrrwvPr9e8vhkI3TkKGw7KvYycLVmcm1jrnwxnLF6+wV6LAaykKZt7z85zhppGYPn1
	ufysFNPGYpGPni/VUqbkEFrYJGR6Wyi1hpExqjNrqt2hGgVHGQCwYNG/tgoc/eulwwygt/4+r5m
	w5Hkbx6WN20/b39Cl6l3evR7HCYhk9bByFlErdY+X9QHXE39WTw54TSpI6rShjWemhb5aRDKdoV
	co+1+SNdIrKmSPQMBpdUNnO6ThXqEw3/2kBUogyJR1GwV45Hgl3xcCaPAzf3b+PiRr9c/4uPpRW
	WmHqJsforTnwlXIw==
X-Received: by 2002:a05:6a00:c82:b0:84e:4d6:78fe with SMTP id d2e1a72fcca58-84ebc1fd427mr1449750b3a.3.1785393308238;
        Wed, 29 Jul 2026 23:35:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:c82:b0:84e:4d6:78fe with SMTP id d2e1a72fcca58-84ebc1fd427mr1449728b3a.3.1785393307812;
        Wed, 29 Jul 2026 23:35:07 -0700 (PDT)
Received: from [10.190.200.192] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03d068fsm2466787b3a.56.2026.07.29.23.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 23:35:07 -0700 (PDT)
Message-ID: <96411e0c-f357-40d5-81f8-14523836280e@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 12:05:02 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] platform: arm64: qcom-hamoa-ec: Add fan RPM query and
 LUT calibration
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-4-771abd65ee1a@oss.qualcomm.com>
 <eb8731e2-6cc5-49d1-a746-3c81563094f0@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <eb8731e2-6cc5-49d1-a746-3c81563094f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA0NCBTYWx0ZWRfXycHcDwqVHeIX
 pay3dZsdMPBsLy+B3HQc494iRSC6Z6iKIUSibzOsNtyusRf4Hf3LaMsmwrTEOeu5KXKjLyXuf5M
 Je8JEEmP/8Cqkz37znrbk/CB5spudOSb1D4UOIr6jhOKAHY0q0tq8/jKk1q6CN5OaFiGrBkWuwp
 sxEiiQtu3AXGTR0KurQoJ4zmCosqSf0pQ3vDRMj5ly2PkpOM/iU+MYmxmcJdgZErua6U8PvdLjk
 gsIS2TBu30ufKQPDCJNKrKasDShSxqoQv2VTXBlRg/kV+oD3FnUKHUBEtNgy+l2YQBuQt2GI45L
 9yF+vZVtOoIJ/2z+VjHCOTswVpQuusKfSpC9E3yszKWOPVfP/sWj4HpC3jKAA2vBeuJumVHpRfS
 LdvGZfNu4NmKOsBmi4nPCxIBlu/2SdFvX5Dug0xj5r7TPp9adhPcFjnZ90o0Dfw3RcM2JwuTtPH
 PbHEJpT6lLXvr34owyQ==
X-Authority-Analysis: v=2.4 cv=Rq/16imK c=1 sm=1 tr=0 ts=6a6af09d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7VuOU095dllZ8ezsiHsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 3TRnkanRJ35elA1yp7NLMhsDLJ7TSPvv
X-Proofpoint-GUID: 3TRnkanRJ35elA1yp7NLMhsDLJ7TSPvv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA0NCBTYWx0ZWRfX8B56lIdzLdJT
 cJZtsJt1VJ8523kTs/SAfPe5PmEYwAnF1qBl5wNUn/yN8V1aLrbbCQn7DIXKtOUPP4wVF5tRV05
 ZoxFOwE+Yb5wmAmTlhmvwFEAlByQPHY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300044



On 7/29/2026 4:37 PM, Konrad Dybcio wrote:
> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>> Add the EC command definitions and handler functions for querying fan
>> RPM and programming per-fan LUTs (lookup tables mapping SoC
>> temperature to target RPM), and introduce a raw i2c_transfer()-based
>> transport for the two commands, since their variable-length,
>> sub-command-addressed payloads don't fit the smbus block-data model
>> used by the existing commands.
>>
>> Fan LUT geometry and temperature breakpoints vary by board, so encode
>> them in per-compatible qcom_ec_lut_config data selected via
>> device_get_match_data(). Add configs for the Hamoa CRD, Hamoa/Purwa
>> IOT EVK, and Glymur CRD ECs; IOT EVK boards share the Hamoa LUT
>> geometry but are bring-up platforms without a calibrated fan curve,
>> so skip_lut_set suppresses the LUT-set command on those boards.
> 
> So are we expecting every single laptop/device that utilizes a
> compatible EC to require modifications to the driver here?
>

Yes, currently a new board does need a driver-side compatible + LUT
config entry. Will check on the feasibility of moving the LUT
geometry/curve data into devicetree instead so new boards don't require
driver changes.

>> Since the LUT values depend on each fan's maximum RPM, which varies
>> per board assembly, calibrate it at runtime: drive the fan to full
>> PWM, wait for it to spin up, and read back the achieved RPM via the
>> new query command. Run calibration in a work item at probe time and
>> after EC reset recovery, and make it abortable via a completion so
>> suspend can cut it short. Track calibration completion state so the
>> LUT is programmed once calibration finishes and again on every
>> subsequent power-supply-driven profile switch.
> 
> I don't want my laptop to become a jetplane on every bootup. I
> doubt anyone does.
> 
> Konrad

There's no EC command that reports a fan's max/rated RPM directly — the
only way to learn it is to drive the fan to full PWM and read back what
it actually spins up to, which is what calibration does. It's bounded to
a 10s timeout per fan and only runs once at probe (and again after EC
reset recovery).

-- 
Best Regards,
Anvesh

