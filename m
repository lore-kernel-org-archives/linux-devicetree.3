Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA4F373C1A
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431346; cv=none; b=q4t4GVt+Ng7GlaxJeNjZTmz1gmyIC+2ATABlne3vio/aG9g0RJCXp5oBstP5eSlIKTCJ4qU+DFLATDoHIMw99enFLfc/aSsPCZLGZ/i0SMgUwQaAf0QVMDD7jsbfTi2zaVfjIn73CMRe0/DDjqN50t/0iRwiRF2zgYC0cWIt3ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431346; c=relaxed/simple;
	bh=oSe8+hdnJtZBQ9o5XKtvCAaCNiE++K4SPxZ5F94VldU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LA37Cim1oDWTE/A5lVLNRGv6JbvKO2wY3CdEzBOcXwWHGcdEcN6Jg34UA1WRKj1DqVsWqG3eyKQ/Z6atO4bLHzjlPVM67+8mvly0rIt4JdobhLfm6lQpzH+2RhB1AgbOPiI2K36KelQazG80eAxxW+6UTxL5l7pswnT/5aTAYNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fuJfw7oz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JzpC4lFT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuJfw7oz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JzpC4lFT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWd7R1524880
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9jqtCQUFZAVjgBKaSqj2WhpZzKyLFiLrhc9lpSkV2UY=; b=fuJfw7ozLHuh4EkV
	eIpb+Hd5YJmJggCSycnrw39OBX9CvZjQ08bhGK6mgDSgEy1ReYhLiYV1CpxBO22r
	qv29czmP34MzHwAbhkv0bZvInLK9i3zakaABw+nwX1Edbu8C9CMP7wKs9lBbmkfA
	M9TixaPqw7Z5AG9qyaMJYayki+xGJouREDIsFy4CkGzTVDkSQjbaAMjjPz0B3vY/
	RYRnqmHLxxVugJdXFLpFotKS/nI2CK7JXwV9gZ7MKwq5Vi2vM0OStbV7h8s9mhuv
	VvYTYSmMeON2yNiEaCAiBShFxtG5jQBuTCUbxsSeXpKp/yW22OnMcdpxev9IFsEm
	W8yjmw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6yfsbk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:09:03 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-744c091ec4fso8980137.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785431343; x=1786036143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9jqtCQUFZAVjgBKaSqj2WhpZzKyLFiLrhc9lpSkV2UY=;
        b=JzpC4lFTOixqIIR2uZw2JJ58IvABXKwKYDbGZ+4DnJ+hjCoh9hpBUas6YTlMQVw/Ci
         eVU7ISV1uvYS9hTKoCXqKz2GxbS7859hENuJA76OChruaJjL0XhLh6OEbVSFtW2yAgzv
         lIsGuzDOABes+JVtH4zQjyudAGbi4T+PSUw32xE46rNjk8bZnpnNsOswGVwZUms4H5L9
         dXGOGAWdaj9enp1K6vXXED2wWcyEEQ003mcbrDRTcimHrsHyhGcI2ZEA+yaswVBJu706
         yDknPr/Ztb5ER2XOqbPaQUjHG6b3Uf1MAEyufoB0LCviPjs588FH8w1tMzYTy008XcfB
         SWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785431343; x=1786036143;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9jqtCQUFZAVjgBKaSqj2WhpZzKyLFiLrhc9lpSkV2UY=;
        b=WQgUaZvhw5cMgQr+RFCFqsQa5OqsOe7ItRINw+83UVkp/nJKcB1fEwaixDHUcDfcql
         QnzPhhKLIsDqtapqKOXzGT3lGE1LzSKeAPpbDYGtbT42MYI3QIeAZMQC3qBCKyWCSEOZ
         +c8U9NR5tcyaoW1/mIlfEOhslNA0fG9bcAuFknnlqKdSMiD6h5nWiO9jdEU3+UQuLm31
         WsGcKakLZ12wxNJ3vCJf3go8HKxXodzUQw/5DQTuJHMfsZDonIFn2t0cJaU9BxylfLUk
         G67WhvcEOGBNXQh8zPKeJKVk0p3dTlU65zqnUjGEWZYQN2WtGXR3OUcmQRluRghVjNMT
         dvEA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9xQPhh7fjRXvBGoSHszyHwCLKWBKk/fxJJhjq7QmvdemlK3Nw6Zxgwfm5h49GF2BcGwx9CK2lQRLO@vger.kernel.org
X-Gm-Message-State: AOJu0YyPvFAepVdNQFC645/Y4JoJOPIfXnSt9tpRP/jY1BrlVT5ntGNf
	TsSPiMthI3lBwqSHs1pdEF+nCqF/G3yRiW8XY1Q4kY4GQfAkJ0z7i2MvsoZFZ8hVTlIYBjWrIFS
	vMKJkOenHLQgcZI8ydfHJOOboo0qs0saEDpm2gn0Wm0w1Hk2NrSFZaOcBLgWdJoxE
X-Gm-Gg: AR+sD10etUuxVWQfmzWySSHgzZgfXfbyZ8wEt881RJaNXIvxrhNptEgAXFRXr47CeqG
	7bIgxsHFTwj9sttXoSmi5vnBsRn9orX98Z+VQl5Qr/XLT+XaU1+OQ+apVNMWpDcYfVhLgfB61PR
	cp2TA+7HWbAYmYMNZa41m3qfXfmBthLNbKSLVYTxi/vpM6LNak1hKl8uR/9bJwncjVh6JXDICRg
	4+Z4AXUIet6jea/fDamz3QgzKkMI/wok7R09XR8AwLOrwf5fvPTQS4Q6Bs6rN46Nvfpltd3SVtS
	75mW5GvlRKqMrpYZCtwbUT8qJDGVpv0R31hTEFc4d+tzGy+AcPAzmGwjjsx6k52T8dtqd4bO7Ck
	rhxXFutXADwy6m6HYYJN9Umje
X-Received: by 2002:a05:6102:915:b0:738:133f:8d60 with SMTP id ada2fe7eead31-7583e56ccb9mr691954137.1.1785431342838;
        Thu, 30 Jul 2026 10:09:02 -0700 (PDT)
X-Received: by 2002:a05:6102:915:b0:738:133f:8d60 with SMTP id ada2fe7eead31-7583e56ccb9mr691926137.1.1785431342369;
        Thu, 30 Jul 2026 10:09:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb6db7sm91156166b.45.2026.07.30.10.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 10:09:00 -0700 (PDT)
Message-ID: <3fa15948-eb8b-4f3e-af90-5b88fcc44d75@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:08:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] platform: arm64: qcom-hamoa-ec: Add fan RPM query and
 LUT calibration
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
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
 <96411e0c-f357-40d5-81f8-14523836280e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <96411e0c-f357-40d5-81f8-14523836280e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyOCBTYWx0ZWRfX9Xjqpzu1qxYp
 mVT/kLsx4gY4eIkgRmu0/E0CSJmjybedmPls+x7a6MHvm+xSbXXeDL20gD8JEvYGb6nx4R7IEba
 5mVoZ7tjKcdzDeuY1BoQpW38/6YABMYh7YMXu25/AOvToVJEY4iottxmFjjQyZ1kpvaFJlsXqBH
 LDk3aX2voqZRNRq/HADCWBmgAIRD6NuZe+3X+amYEzXEXVcEqhgkYttq/ksr5R97KiZ10eKGbiW
 QniloTGTFWHZ+dwR6uqkHoiWcB254BYz7VZ6uemXY70V/k/KFwyCj9jmqDZrAZSrpqWHVsihr56
 CwJ83rDvxAMnK1PcrgvwUm/JWNDgD/LRGR4JyIcV1Wtme7MY/gtR4uFZayj3oi9vUkUIKorVdO1
 k1SoeAmcY7KrfGoMwRqfiublXCLzGm1EOT5PJZAOlIbcCVWgZffIsTjgaXQEKcEhyNF1v1U16Gl
 SvxcD0qn1pQ4TfAiMJg==
X-Proofpoint-GUID: 2vdJ3M99gsG9kIdcOz1IGHucmU_vGkTz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyOCBTYWx0ZWRfXxcw7J3I789BY
 S2+6sjx90+S9eprtXkj4u4X2A3Cnp5/zAML5zovCvqKbDdy/fvTFusN4BdWq+/zlEFw6KDuct7a
 /rhPUp/rdGat2TMw83M4X8BoFKLna8E=
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6b852f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Vvnin58ruKcyw0OJcwkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 2vdJ3M99gsG9kIdcOz1IGHucmU_vGkTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300128

On 7/30/26 8:35 AM, Anvesh Jain P wrote:
> 
> 
> On 7/29/2026 4:37 PM, Konrad Dybcio wrote:
>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>> Add the EC command definitions and handler functions for querying fan
>>> RPM and programming per-fan LUTs (lookup tables mapping SoC
>>> temperature to target RPM), and introduce a raw i2c_transfer()-based
>>> transport for the two commands, since their variable-length,
>>> sub-command-addressed payloads don't fit the smbus block-data model
>>> used by the existing commands.
>>>
>>> Fan LUT geometry and temperature breakpoints vary by board, so encode
>>> them in per-compatible qcom_ec_lut_config data selected via
>>> device_get_match_data(). Add configs for the Hamoa CRD, Hamoa/Purwa
>>> IOT EVK, and Glymur CRD ECs; IOT EVK boards share the Hamoa LUT
>>> geometry but are bring-up platforms without a calibrated fan curve,
>>> so skip_lut_set suppresses the LUT-set command on those boards.

[...]

>>> Since the LUT values depend on each fan's maximum RPM, which varies
>>> per board assembly, calibrate it at runtime: drive the fan to full
>>> PWM, wait for it to spin up, and read back the achieved RPM via the
>>> new query command. Run calibration in a work item at probe time and
>>> after EC reset recovery, and make it abortable via a completion so
>>> suspend can cut it short. Track calibration completion state so the
>>> LUT is programmed once calibration finishes and again on every
>>> subsequent power-supply-driven profile switch.
>>
>> I don't want my laptop to become a jetplane on every bootup. I
>> doubt anyone does.
>>
>> Konrad
> 
> There's no EC command that reports a fan's max/rated RPM directly — the
> only way to learn it is to drive the fan to full PWM and read back what
> it actually spins up to, which is what calibration does. It's bounded to
> a 10s timeout per fan and only runs once at probe (and again after EC
> reset recovery).

1. please fix the firmware so new designs will have that
2a. if we're storing a LUT already, can't we store the max RPM too?
2b. if we don't know fan RPM, we can still expose a PWM hwmon

Konrad
