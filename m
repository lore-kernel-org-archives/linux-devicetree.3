Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366AA282F35
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011438; cv=none; b=c3VXkke27QtnZhBa4+HU73Vt6OL0w44xUN9LWgY9ASYzpyVB9WeP07pnN3F+kx4YJDH3WJ3wJ8b8c9Bve3bscmdau+NNurLy98ogPwBTVEuw0FYlyeBEUAS877OB56Qhiaw92T/q8p8LbgMM/GKUWQFEvqZL2sWXzsDZaFTrfNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011438; c=relaxed/simple;
	bh=KRYfsk/GmXVNGtS/PPsItrFkz/Fpb7nExo5NBBcViYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=triu8LJaspyKMljQ3GAYorloWAeuyC5C1FhbJdgOcD+ngVzsiLW3cFKhLVVMQTzCQ5roM1bEVkXIAypnefWFPTv9davj87SmNwKuY5ewXsx8KRVH6h9eQRucVuWZ38ocMqAbR8a3i8WT20Z2PUG0yC5KWp0EvvhJEZZYlGRI8Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mu4ip5bh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PJ42frEx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mu4ip5bh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PJ42frEx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClKJP652176
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 13:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkHFj6Qo495pjgmFOkOfPVQH0xZPeXZfvpX0xr+9B2M=; b=Mu4ip5bh5bQSCRnY
	ct82BbsltaP526UqST9WoCQvRzfqexnIlzzvSR6fFPkfqYX7VNyQ7CNek93y1DcL
	KmIghn4bdmmgRofk4lhp4IPi0PpSdSQffnYnOS7s5/T+lFyPcGnI9dpIdknvBEol
	dVxRAGQc99DR/MBTnhGwDY9tbEZC5I7ObhdMQBIyheKc8g5D2bHml8BBoT2f3a3e
	aYaVIDgsA1TdI3CCAdrz4e2vLVITLOmjXN21mSSSzuaYBWzglCwSantI5q9qBRJW
	88w/4KLNaa7dWJPAmPx0pzPDfg6JPk+H+Ay7GlyHE8PBl3fxpjnsqYuXhosYJgtF
	EKoBxg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0ssbyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 13:23:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8428419982eso4824447b3a.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011436; x=1781616236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WkHFj6Qo495pjgmFOkOfPVQH0xZPeXZfvpX0xr+9B2M=;
        b=PJ42frExys0h8mx6NR4gA0p4UiJksx4KbYb9+GZiyAybBqXvXhsAKiTHGeHMyTjeC5
         pWQPq/dMyHqcCWekWz0pVu8m60k5hZEuFbC1JpmLHwPxLmfzZZE9VIq7OdNPr1XwtA1h
         Red0fuTEeHURCQtCIneEOe+wOn27hd57YyNB2ep+WM76h69pDLa8w3R5dfkmIT2ocRKW
         cD7m6+wJ51Xl8P8otRggtL8rlpeSNPEqkdH5dLaFpgN5FnfPbi7HLaJkgczcDx4ddTQh
         5/kRvWc+hsZga+YmXL7UoBOW21Ky6y4n61MrvcfTvlTVIVjDdcB+w6gN5OEib6riREdz
         16JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011436; x=1781616236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkHFj6Qo495pjgmFOkOfPVQH0xZPeXZfvpX0xr+9B2M=;
        b=o6nQCu5KSiNHOhuEXo1wHTBPFWiiHgDSCeCezlazkNRL7psPsjSgxju2YebwdU6L8y
         /wpC2Y87PUviV4LEUh6kTaJGKIPfTekeftPTeKf/EczC4dupee241rmWSY3to5Lhjk2w
         lirwQOhkZnU5d9oxXnmd+yKoSSd5nI9+qv2CsTMqbCH6W6ipg6y0gJmg5Udvl534PwpX
         IPhPrUtGVa50m18ZLzViqhPn7Dl6KodafYcNBBWbsOX2RLcEmkc91YzdmT0iUL8JlRH0
         yiHKTOSdTDLVktDdInWsYkntrBy7vFgkycE2Yl6xW8xvIZyz66Y+Dum7iZ8kV6lMzFr3
         cP8A==
X-Forwarded-Encrypted: i=1; AFNElJ8aO4gu2ODxzMor3dhrsGG4GCPSyRa0BaSxUhu/dyo/gNy1HRvh2VzN7uS+OIkamUllGa/ExggfmKHZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyDGY4zF1G8LnwOVf3hYziBW+FV0wQMLI0GbRirO6PHA1QYOR2Q
	EGheOnhC5hURPpq2uUOP7ovfZOJKbopKUh44NQvQp8RthZq39ZDbu+PH4ruFqdfiXikfXU7kl5m
	8guhQoKgIlDnO2XO8f2N/ZnreiTwm4oVMAVHJDgDNLFX58+svmqYiHnw+O/jNgvQr
X-Gm-Gg: Acq92OGR88PptrWduRx5cj7xUWuUqfhgWnt4gsfKT1v1R04BGRWsKQrF74pC8OsPqyU
	uRJkIc9JyINgsHS3LBeuMR6e8ReWNeJcDimnYiO0tZLqH9EEcoBvwuU2IEx6RDWELxLvpxa+IB7
	ahrBssnkR+YhysLGEQNoX2ingo3o7wniW6L9urczhexOaQc3o+nqLCRQZ7B7JkPkxSHdr8oxrjd
	C94Bi2Y8BbRTZEd3xGxu/5w6z388FJqTihGNAqE2eyAhKqwYWRQP3R6MsOTdL804WJLHNiofKp6
	x8/IxP5k1lQM5EuJVLL87NqIoW7IeXgq22dJrqXyTSY0owWN9ez1EJvdYJTCacLx6TrX/6otChc
	sCE7Itf8lShdInKeRmULB2oJVf9mLFSC+fhviclb+xVeeof4ueHP5kswG95L7dzs403c=
X-Received: by 2002:a05:6a00:808f:b0:838:127d:a167 with SMTP id d2e1a72fcca58-842b0e6bb0bmr19975889b3a.16.1781011435786;
        Tue, 09 Jun 2026 06:23:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:808f:b0:838:127d:a167 with SMTP id d2e1a72fcca58-842b0e6bb0bmr19975821b3a.16.1781011434968;
        Tue, 09 Jun 2026 06:23:54 -0700 (PDT)
Received: from [10.92.193.107] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bc5sm20261369b3a.43.2026.06.09.06.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:23:54 -0700 (PDT)
Message-ID: <8f045340-a6c8-41c7-b1c7-6d9b87b05d90@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 18:53:49 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <7ea2f2cc-ef11-4727-810c-e32e815bd973@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNyBTYWx0ZWRfX6hShZ3SDkNwJ
 LWOJxaVsVo3CoQEOCVrz6IBxGBnmk88VDSVp1m3KS+mIhucSrfc+gsk4uZZwkLLwVQhPAk/8e4/
 zPMOHj9LQ4Pyw4hC1D6ZwEH0yT/PxZsyxd32iKIdPFOpE7Oxzt1ba9CuofUFvLe+O7kq9kJTxBr
 N5l/0HlR1B/+XE81++aRb1J3f5n22jekyfgpaRY6d5t6seCwP45Az6wRfAMyOMsQVIfqgXd++Q+
 z0n4MNdrd6KFZWWfi6O7VYgT95ojuyHuWRqisWl5qiMLZdwR+ephbMiT7l5azn2ayH4fBOvHMcd
 A5b9qxrx7IXROZqqYK8IdqLI9T+iCB/W9v5ssz7clHeFjOqMW5HQqKv/BCA25xTeIOnJleTlmAh
 WwSjBioFgvknT2M6q/0Zo9NlSXcwrrTYgUFwDnVxvL0wAZMq5zUYZ1MKIwBmRujWMFvJmi1nzcR
 rvj7FZxc5l3NmGJel+Q==
X-Proofpoint-ORIG-GUID: wyMtEAXq1C49eeHQrq0kOXAEIY3Ysr2I
X-Proofpoint-GUID: wyMtEAXq1C49eeHQrq0kOXAEIY3Ysr2I
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a2813ec cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bEeoLGOZ4EoZlHOPchMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090127

Hi Konrad,


On 5/21/2026 4:46 PM, Konrad Dybcio wrote:
> On 5/19/26 12:49 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>> based power monitoring and limiting capabilities for various power
>> domains including System, SoC, CPU clusters, GPU, and various other
>> subsystems.
>>
>> The driver integrates with the Linux powercap framework, exposing SPEL
>> capabilities through powercap sysfs interfaces.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +/* SPEL register bitmasks */
>> +#define ENERGY_STATUS_MASK		0xFFFFFFFF
> 
> GENMASK(m, n), across the other defines too, please
> 
> Then, you can drop the _OFFSET defines as FIELD_PREP/GET/MODIFY
> accessors will derive them from the mask
> 
> Please also use lowercase hex, file-wide

ACK

> 
> [...]
> 
>> +/* Constraint configuration */
>> +static struct spel_constraint_info constraints[] = {
>> +	/* SYS domain constraints */
>> +	{ 0x10, 0x70, BIT(0), SPEL_DOMAIN_SYS, POWER_LIMIT1 },
>> +	{ 0x14, 0x74, BIT(1), SPEL_DOMAIN_SYS, POWER_LIMIT2 },
>> +	{ 0x18, 0x78, BIT(2), SPEL_DOMAIN_SYS, POWER_LIMIT3 },
>> +	{ 0x1C, 0x7C, BIT(3), SPEL_DOMAIN_SYS, POWER_LIMIT4 },
>> +	/* SOC domain constraints */
> 
> "SoC"

ACK

> 
> 
>> +/* Helper functions */
>> +static bool is_pl_valid(struct spel_domain *sd, int pl)
>> +{
>> +	if (pl < POWER_LIMIT1 || pl >= NR_POWER_LIMITS)
>> +		return false;
>> +	return sd->pl_name[pl] ? true : false;
> 
> return !!sd->pl_name[pl]

ACK

> 
> [...]
> 
>> +static u64 spel_unit_xlate(struct spel_domain *sd, enum unit_type type,
>> +			   u64 value, int to_raw)
>> +{
>> +	struct spel_system *sp = sd->sp;
>> +	u64 units = 1;
>> +	u64 scale = 1;
>> +
>> +	switch (type) {
>> +	case POWER_UNIT:
>> +		units = sp->power_unit;
>> +		break;
>> +	case ENERGY_UNIT:
>> +		scale = ENERGY_UNIT_SCALE;
>> +		units = sp->energy_unit;
>> +		break;
>> +	case TIME_UNIT:
>> +		units = sp->time_unit;
>> +		break;
>> +	default:
>> +		return value;
> 
> nit: maybe setting units and scale explicitly in each entry could
> be better for maintainability, but potayto/potahto

ACK

> 
>> +static int spel_register_powercap(struct spel_system *sp)
>> +{
>> +	struct spel_domain *sd;
>> +	struct powercap_zone *power_zone = NULL;
>> +	int nr_pl, ret, i;
>> +
>> +	/* Register SYS domain as parent zone */
>> +	for (sd = sp->domains; sd < sp->domains + SPEL_DOMAIN_MAX; sd++) {
>> +		if (sd->id == SPEL_DOMAIN_SYS) {
>> +			nr_pl = spel_find_nr_power_limit(sd);
>> +
>> +			power_zone = powercap_register_zone(&sd->power_zone,
>> +							    sp->control_type, sd->name,
>> +					NULL, &zone_ops, nr_pl,
>> +					&constraint_ops);
>> +			if (IS_ERR(power_zone)) {
>> +				dev_err(sp->dev, "Failed to register power zone %s\n",
>> +					sd->name);
>> +				return PTR_ERR(power_zone);
>> +			}
>> +			sp->power_zone = power_zone;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (!power_zone) {
> 
> I believe this is only possible if ARRAY_SIZE(sp->domains) == 0,
> but it's not obivous that it's to protect it from that specifically

It will also catch a case where domains defined without root domain 
SPEL_DOMAIN_SYS
> 
> [...]
> 
>> +	/* Map spel domain registers (energy counters) */
>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nodes");
>> +	if (!res) {
>> +		dev_err(dev, "Failed to get nodes resource\n");
>> +		return -EINVAL;
>> +	}
>> +	sp->node_base = devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(sp->node_base))
>> +		return PTR_ERR(sp->node_base);
> 
> devm_platform_get_and_ioremap_resource()

ACK

> 
> [...]
> 
>> +static void spel_remove(struct platform_device *pdev)
>> +{
>> +	struct spel_system *sp = platform_get_drvdata(pdev);
>> +	int i;
>> +
>> +	if (!sp)
>> +		return;
>> +
>> +	/* Unregister in reverse order: children first, then SOC, then SYS */
>> +	for (i = SPEL_DOMAIN_MAX - 1; i >= 0; i--)
>> +		powercap_unregister_zone(sp->control_type, &sp->domains[i].power_zone);
> 
> Could you try adding a devm_ variant of these register functions?

Powercap framework doesn't support any devm_* API, you meant add this 
support in framework in this series ?

> 
> [...]
>> +static const struct of_device_id spel_of_match[] = {
>> +	{ .compatible = "qcom,spel" },
> 
> The compatible must contain a SoC name

ACK

Thanks,
Manaf
> 
> Konrad

