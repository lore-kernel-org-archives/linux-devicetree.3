Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150A23D3CE3
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011871; cv=none; b=gYcskkmThffEqESsIKgg+INi2RDoClmGNdbiF1D1GmHErIsWAsAQsFJRV5Bvwt85/Ueqvn94tw6csdyKliPDzU1U5rVkCFkULWkq/2hhGwLx0SCfDoEw0/ThdOtLTsjGPFT6ziHrb381HajZOlJdJ5jlMzHjPrg88IPBuZVC+Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011871; c=relaxed/simple;
	bh=PciPETuIrHifr8R1hM7guiG4dpObdPvFcrjqt2Wz96g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mEE7JqYlHWXvZjvMN93HSPPcVFUV2Vtp2UVrb6r3bRirFUs4Ev78tC0x+v4Oiovm2/o0/QCfbidKf97PvaFdPHXT7YCWNnt65aD97nI9VDFNWKfTlJN/nRbhFQ/KVigDgrvRttfQs+1zp3FHvaFx3MTTNlh4H70YM14Ch3erC00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IyKCWtXT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCf0LeOH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IyKCWtXT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BCf0LeOH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmQ7l2625109
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 13:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3rIzOQooj4MOQACqpysb+d+qYmh7nMWfhScfIEjQME=; b=IyKCWtXThJnH3jGi
	FBuiLBA3+AkcvNWAMTnTJVj8H+CRQgbUNoUModwQuoMfMIoQwwuIMLAwE163yFoD
	IgXBDUf9csguFsdEfijrL1tABqEpNcloP/NgmM2/zAWbJLEqU6uIrGfDZUjZhit6
	faHNnBwoK2zpb/SRLUHLncvLQUGoBT7irXmIL/YeLJt2a5BvBe4S8oKrU+i/LGhr
	IxU5BpGjUNE5LPIpVizYuDQy/HM0bm4+/G3SzJHP7NVudRygKLFFal5r7PpeBFq1
	XoBq3v7En6XLHZqsuiJi+msDHmvz6qebpypF/xom/nKR410qskGDh2G2YSTSKvtr
	VIlnAw==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds9v94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 13:31:07 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-440f7f49404so528152fac.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011867; x=1781616667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3rIzOQooj4MOQACqpysb+d+qYmh7nMWfhScfIEjQME=;
        b=BCf0LeOHWAf5JcEv/4tsNlnROUOY65+gUZDZcS5b00gQoEQu/fg8JmLUSWEq6HhUAQ
         pvgJyPI7enx3HepqHioERZn3P/MrSGfjhDDamFrn7S+LEldxLzsyi3h8ghW2ZAs/0n1U
         kn/znkRTk79y8HiXL382go+4k68360fsMcImLrD7Ya4ONdMeB9KDXIamQpVBjPzAPV4R
         ry42IdHtlMbAc6mp5ACkAA2APS43zRBOk/5JoHanuVio9VqOCsCn3SXiA70Utd7Z3LdH
         SagkoOwwXpD/kQ0EhpgJOiPujWsut+aHGlvoKGxIX1FeJ5LV/+/MTEsiTQLci5mnDBB8
         VxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011867; x=1781616667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3rIzOQooj4MOQACqpysb+d+qYmh7nMWfhScfIEjQME=;
        b=b/2sKWrftm5vOPlukHbb6C+icPRulq9B0LuKG3/A0aymlZM6Z/4PWHKb7IDzklMMTg
         Q25KG3k2S8TMvfH2ymrIaEHsVTpDM/KeXnvGaLSsk+LRi57P2+2WF6nZ6XRo/hrqulRO
         GmtNLbYP85GnvgfVA2gyew4LI02OOnu6lk+OuHcl1i+zFp3XJrEWZnypjx6qR3FzULD2
         Ne072lwlWQkDmbtPNLy9ULkKu2uHlS81jE3yGjDAj+oR5qkW5k9pkt+QV49tNhIe4nqh
         00yqwSEYtejz4JIYrgmiOpVqUElxZ/TVmfsGtaQ9+vjR8HydG5G7NLML4vDAlrO0VkqZ
         RgtA==
X-Forwarded-Encrypted: i=1; AFNElJ/M+ryL+7VI2PjSF6O27Ce6TtYU1deex7ctT5LxYl19oQ0j5ukG52VY3VQnLAgYHGk+1LnqKd9mSIBR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0hwiKJzNZYu2XF934SLt6WqkwUg9yxHN7w4BL/4CG0NuTW82n
	pTfeZrfVJqHfOk33aw0zrKW5Fz1fZdoHbOmX6RWFGd9V2iJmwSID4VDA3I91rIw9tGjgPnhOrWl
	ugLgcPKIbWbR+UIx76bPl1tmjDZXJLbqDwnYG7mHHfUXU2tElxwnLfMhOLTnzsL/Qtns6h1AU
X-Gm-Gg: Acq92OEe0h48lvon0mJ1v6wBGjGmzzB6JjlnV+Fo3reVP/cWJ4eWpUWfj4BfAEhU+qo
	QWu05YwXzhCuV8qBZ2t0nYwPm/e5XIGIZDvuR/rc2Epc7wIuMgT9IjGojVoBdE9d1/+/7EC4Lpx
	Z4stXr2vXC6HYz7f2KD3O/6rEyWMgu+wWIcQ2zsKdfaPRUJUnYKC/Bo0DRAbQXTG6LQkECikEfY
	luhPb0BCPjXtVIC/KgnB28sPVZRzmTCZvSHbR36gb1DQT7biO+rOV4iwZo//gm/24LxaLjlxmmp
	p/51Q6iGYNtBhtNvhfd5kczc+Od4fBmG7AbuIR7Qq7XxUH7gn5RJVsv/YsZJbgxI+bA6N4B0Chn
	Ow0weEFAsi69r0E6PtqUropIxeBmJKXUB9K4+EXnYLuwlGyI+Nhul68hu
X-Received: by 2002:a4a:db85:0:b0:69d:513e:1a69 with SMTP id 006d021491bc7-69e68bce04bmr4357195eaf.2.1781011867316;
        Tue, 09 Jun 2026 06:31:07 -0700 (PDT)
X-Received: by 2002:a4a:db85:0:b0:69d:513e:1a69 with SMTP id 006d021491bc7-69e68bce04bmr4357168eaf.2.1781011866448;
        Tue, 09 Jun 2026 06:31:06 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055500875sm1029528666b.53.2026.06.09.06.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:31:05 -0700 (PDT)
Message-ID: <fe5ff2e6-4c54-4b21-be5c-0f06bf0e6696@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:31:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
 <7ea2f2cc-ef11-4727-810c-e32e815bd973@oss.qualcomm.com>
 <8f045340-a6c8-41c7-b1c7-6d9b87b05d90@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8f045340-a6c8-41c7-b1c7-6d9b87b05d90@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MheBO_HohZcNXTfKo8gyJvdaHAuR_rFj
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a28159c cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VKwP4syk8cgDA61-jkoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: MheBO_HohZcNXTfKo8gyJvdaHAuR_rFj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyOCBTYWx0ZWRfXzzt44PTsSVIX
 W06Y10FJnifXPMh7gLvt16sMs2kkjtcXpAA85BVQoC0sqhfNBOJAe8bgy3CBqTKlTrbXnZlaEYp
 5s/W5sG26yFSMEFin6jMGT1t94U/ruGvR+38qInk170yXbeAwel7olZSGiCv14aFQbtCeWdJyd6
 lfhhZKuomwcRJ5VInq+vafpGGMWvIFEZkbA3DJ38kiCzjTvgpaIRdIPRjfhkE6lYNUzd/+jut0D
 tKITz1i/1K1zulurk0FSHBcBsQuAM84/JIlMEPX9RD11B9c0fle1HX5oKa3j5GqfS2TFulNlIAw
 x5USwZZhS7wN/ykrUaPZe1Tm0md19m8VM2kcGiA+eGIo0C1BZPPv31Z1ylAgWC8ugikoc+8Mm1O
 gdUgHLwGRSyaU6ObOL8feTRKraGOx+Ip5mCAm7CrTbcMcA30Y8aTMIJ6W/HBLlxIaLrJM8SGS7J
 coXkPbDLUAviPd8FeBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090128

On 6/9/26 3:23 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Konrad,
> 
> 
> On 5/21/2026 4:46 PM, Konrad Dybcio wrote:
>> On 5/19/26 12:49 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>>> based power monitoring and limiting capabilities for various power
>>> domains including System, SoC, CPU clusters, GPU, and various other
>>> subsystems.
>>>
>>> The driver integrates with the Linux powercap framework, exposing SPEL
>>> capabilities through powercap sysfs interfaces.
>>>
>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>> ---

[...]

>>> +static void spel_remove(struct platform_device *pdev)
>>> +{
>>> +    struct spel_system *sp = platform_get_drvdata(pdev);
>>> +    int i;
>>> +
>>> +    if (!sp)
>>> +        return;
>>> +
>>> +    /* Unregister in reverse order: children first, then SOC, then SYS */
>>> +    for (i = SPEL_DOMAIN_MAX - 1; i >= 0; i--)
>>> +        powercap_unregister_zone(sp->control_type, &sp->domains[i].power_zone);
>>
>> Could you try adding a devm_ variant of these register functions?
> 
> Powercap framework doesn't support any devm_* API, you meant add this support in framework in this series ?

Yes, this should be fairly trivial - look at e.g.

drivers/regulator/devres.c : devm_of_regulator_get

Konrad
