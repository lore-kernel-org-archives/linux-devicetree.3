Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A803D6473
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176165; cv=none; b=f8t9EHk1aWlK5f/c9Of6KFcWLrpAmv8MQVGXWSgv1PcqFIGgsHmgCt9fO60aTn1gxTOmpVvRa2VStOjr2f7k+vWToeJ3lw26ep+rTKs4tn15qcQHlXrGiNFzS9LPu0sERGRfK6HXxswt/fIZuYY22yUd3uC7nBerksqX6BQvil0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176165; c=relaxed/simple;
	bh=4LDLD4bL2RKuEubdKyGkbcldX6+fZfzLzJAR5i9D13k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aSvcHr7sbi5reut5kUGtcNOhHo0i4JYaaz5JLo7z20y7/u28ZnP5sjwU2jNvE+fQ00CpWnl2P4u/1XIg55004yzobYv571f6y3ThIL2kPyGH35MTfPmdMgS9yTCRApQoi6wYVEnxprTKmfjuQZz0wbq0FeTu4jTbrAEd7DOsLic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HrsgcuV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYEe0vyC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HrsgcuV+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYEe0vyC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xLNt284246
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AbcWMSpbWcxDG6Ak1C1oDrao3F0+2Zx3golBpAedkmE=; b=HrsgcuV+xnXdPyEk
	BtYiOemFuW3XN6tCBv2B/Log0zbYDuh8Krt0kqC876AiV5bFj8ign7oDErGAhHJk
	ll7aHj/nY4x8VnyRHnz3Q3UDb5viZXdFR/zsFuOTbStKm1iOI1u+Q663P4qqaO2S
	rEZq7J+LkXcUOpa5hYFEgwjqsVGLJ/BinzlGCFKPApTIf+hEBrXPiuOXJS6BLR4N
	HAiW6FNwX8m6ixpp0kbcfNMUjtIZlpZDGOurXHBpmhNrqDdO7FJpEWlusbXCML4a
	LoVbZljZ9mJxdutpyFOP3O19LnBU9p0QBnck2ge2ig9OW2eeyDk5h4t6qJYK6ObM
	FrUMqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6tk43x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:09:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517865e6219so17079731cf.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781176163; x=1781780963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbcWMSpbWcxDG6Ak1C1oDrao3F0+2Zx3golBpAedkmE=;
        b=MYEe0vyCWutoLlWUjF3tcrRyXIc+UtcGtn+nN1/FmUFEuJM6cTw+EwY/6aBvuSMhGK
         8lvHDKH8F7UBZtpttvszawSDRldfO6KOPSXgfCJHX5li6KFHbPhf3fPO+Zmm/4sOndap
         vbhPfs9ouvjK2qsJeApl+ThcsQWu8YR4mX0yKuuLbIWkiLIa/VsL4E6Gr3ime1B0Jp3c
         Kh1MqffWA1q/RmdwdBNf2P5Q5XSiGry18dFZF+uaWsaFfFz56vdi3yh30k2Y7ZbYBNr5
         cuMNajcPuCl2rEK/TgHechEghMyOXYIqnCXCVf5ox/bBbdpt9oeEqupzrqHYM0WeUfmv
         HC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176163; x=1781780963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbcWMSpbWcxDG6Ak1C1oDrao3F0+2Zx3golBpAedkmE=;
        b=gBbuPcssc3KAoeYqk86+VNiKs82PvED/VXQfXcLHA4abuE/hY0gKyOclpmUBBltyxM
         Q9ibvVYc+KXdDCwNP3qCxq/jWYhO3zmdFlG2pz5cxB3p72xsLdJOVH9iD1vJxoGLTP2r
         G+SfqFCDQ734zrTnWEhyCcl2pUp7/evxc8vNnnpkXnLb7RXUgIfJr4el10bZYHu/nfl4
         SXdWoSlCBslcZo2F9TId4Efv1Lc5WnWt+8DgkOpjg7mDnNP0m+vjCeS5gnKpe7HTR3hr
         G0zxnnO1ehsPYf0X4dyzRZgMvpMPIlkxQtOYAof+deajeiEfaA1TB0UyX0D58knTb8tc
         5uJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/S/ZiXt4uJhrW3lp60EEIw98mOiNhgwMmZyCXjPazpBNAdokYu5EETd1/hPsQM8nyB7FUMRzW5XW3M@vger.kernel.org
X-Gm-Message-State: AOJu0YxYKbEsW0fPYMb2AuXg5acbr5zcsicNK2l0c5+IQMn5L1uYrUk4
	Vlnufyc1KQeVLYIgXF0kKMFxvdcRxoy+5FszSZKw1J16+9Y41u4cL3T5lwXIRmsmSI/6zI3Ytl1
	eZWgKcm0OltngUhs46lYDsRbxU5bN26W8mOAwymeCQpfBqeZD2e3VbQkrnwTegJ52
X-Gm-Gg: Acq92OG1P6sokANQIkz+8lp+mlZb5KZw/IgC+NrdloJVjtMyLAndKOAvn/6v+TDIgo8
	q7644+qln2Oym0O6N0qo3oJCnDITBJOwv44qH6C+DHuvUlc5ThFN+tF2ENMKNGvcPbLbw5VHmjj
	ezLVJj4hawXyKb2AckPvUvx/qDaipGo69UiRLDHSOa9HBosy5YOp2ObWlmuZtjh70PtOmtEbKap
	BrWkYJxspZ+GDJWDUJxV5sQTckvJ09NX4BCdFxjP8xZRD2B/pWT5PMkJIS/evNtOquUJX7LOObp
	HwWdzHaV7PRZp6AZ7GyG/AjpSf7+Xxkfruoz2qCLqn3ri7aRAiXc8oqnSccXY6+HPSYLScjoJ3d
	RD+Oj9d2CnqfCPk4YxngOPRGVASqnWXBM7NNPYFwPAaIJPoNdBT9xtonT
X-Received: by 2002:a05:622a:89:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-517ee27fe16mr20241541cf.7.1781176162800;
        Thu, 11 Jun 2026 04:09:22 -0700 (PDT)
X-Received: by 2002:a05:622a:89:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-517ee27fe16mr20240991cf.7.1781176162261;
        Thu, 11 Jun 2026 04:09:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb60b99f0sm49789266b.55.2026.06.11.04.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:09:21 -0700 (PDT)
Message-ID: <22e69b79-6dbb-4e43-914c-7800eef49013@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:09:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
 <b86e9f5f-a7ec-489e-829e-6e07c62841a3@oss.qualcomm.com>
 <31525025-333e-4845-9dfa-df68a3df3752@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <31525025-333e-4845-9dfa-df68a3df3752@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMiBTYWx0ZWRfXz7tV0glqEQkp
 yZZxgdPhHupWJr1E3f5hH/Qhqq8dB7qNi588RtJ5t9a/a2tjD4BtEUE2vmQu6LlZJo+4O4W6NLO
 CeDdpzESImvpmUMrx82j6yM4Q7AJoO4gXUvtcg7yk4y4sIvfCe1PIunlmAuSv8i1B62lnnG9FfL
 u/1IzbymS/97jvWeX4cKZfHghjWAHhA0hVLmb/GryYqfGtIH/bUtdTs3+yYc44mMbbAI/PXXax/
 EwT8NNI4H5znrem3Y/EN1pyQccxJwXolZk+MjuzSIpwcr64L2MR+4devmxQnUw4ozo5bg/4Mq7R
 B5SoEGYOVyMdwV6yQPmIw2hV78kX3ySR/XXYSvCk/G0Q/ni4CMGUD08sTUL1gYpzYUqkPGSm0Wl
 JN4kW7UbEcpr8sZ+kRPdN8fkB+FsCW0KRl6FfZY9uNGcTzxzFLd6e9xXAGJ+qosUs+/tdcxwSNG
 oWMv8mLeF4rbnMIdfUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMiBTYWx0ZWRfX++2eAfUCb0b1
 lpAFexjPMGEZo8tvRyX0gId/pLPjPb5hlbAHH8d5nm+CtDIBg3V1SIlDeyll0isS2fLLMVS7z/O
 +rJ4RuznsA0bnSJdS3DkfEckMHK90EY=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2a9763 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7GRNE63i-pEe5CX7YLEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: kjCynwIdK8xD8cYsjYJ2vpmPVLNZpJ-z
X-Proofpoint-GUID: kjCynwIdK8xD8cYsjYJ2vpmPVLNZpJ-z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110112

On 6/11/26 12:52 PM, Imran Shaik wrote:
> 
> 
> On 11-06-2026 03:10 pm, Konrad Dybcio wrote:
>> On 6/8/26 2:21 PM, Imran Shaik wrote:
>>> Add support for missing RF_CLK1/RF_CLK2 clocks on Qualcomm Agatti (QCM2290)
>>> SoC.
>>>
>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>> ---
>>>   drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
>>> index 103db984a40b950bd33fba668a292be46af6326e..0b624ed4715c75042b92ec49c073b281533cace4 100644
>>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>>> @@ -495,6 +495,7 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk2, 5, 19200000);
>>>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk3, 6, 19200000);
>>>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(ln_bb_clk, 8, 19200000);
>>>   +DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk2, 5, 38400000);
>>>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk3, 6, 38400000);
>>>     DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(cxo_d0, 1, 19200000);
>>> @@ -1262,6 +1263,10 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>>>       [RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
>>>       [RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
>>>       [RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
>>> +    [RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
>>> +    [RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
>>
>> Is RF_CLK1 19.2 MHz (with the other RFCLKs being 38.4) on purpose?
>>
> 
> Yes Konrad, as per the hardware connectivity, RF_CLK1 runs at 19.2 MHz, while the other RF clocks operate at 38.4 MHz.

OK thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
