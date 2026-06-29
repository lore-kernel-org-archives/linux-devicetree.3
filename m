Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E277431715A
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782709415; cv=none; b=uWpyJw1lkvPLHmaoplGn4m0i2ZMhg0xdMpIT2aEWvtuMqU1m2tOlxYWKD4rdSP9wMGSaybUDPB43zKiwwmmCD4bJdWkOyqME3UpXPyryPxtEtNlN34Z4I5wBZoEI5ITRmm4TnxlhQ49zJsqKXWtq6CuBFMrU2qKw8j0sHRQI/jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782709415; c=relaxed/simple;
	bh=8GGjHz2/I206+Fi11Ux2KHZMbQvRYWzNU1Gr6HP8wZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJF8Kp6GcP0BAroMEK1obhDanZGZeW+jiU+r8apJGlI4U4c/QLX6ibO8rth+1JSeFPlZ8VhOWzXTycHWQfWZf+MEPNewOKDj3BTub+u3qd19R7ApOvosqe1qJDSuUdvGfWs3hkNxheYhbukPKbUALN40fjik5iT3GRJPn2UV9cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GYYZqT6G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c9N+vD+T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYYZqT6G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c9N+vD+T"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NOus1766940
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W88vWECRU+wrMD9oJnjg+rbsRkfPT9MutHVGHqUs57c=; b=GYYZqT6GAgh/iKVv
	PHMl8k/9bppTUz6ZLT6n/6BHY/t3yDVI2Dyj9X7MaQhyrmg+erO2XqmL7MBB0cnM
	9nh9bi593YU754NyB0hntP+68pgjUmJoWjHhiYpB9PhirnFKeviSaq7nWsINfV9m
	sbH2xAv18wohXAE9tgJpMcuyBMgd/F+eXA04IK/yVZ9qsY0q1u+oc0m7wm05KaAF
	BKzMIX+J4sJDhzE9avTvsqxKznBC5dIPB8Cns4QLLF5VkWGw6h9RkiHe0h0ynYL0
	met+NUZQP2kHRKez4dxMAG61fBQJ5CrDfcZaLhp3dCOKuXh5kDbm2Gw1NY3LKa6k
	b1VXdg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a4jv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:03:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845ea8fd3easo1682660b3a.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782709412; x=1783314212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W88vWECRU+wrMD9oJnjg+rbsRkfPT9MutHVGHqUs57c=;
        b=c9N+vD+TDAsuf0diE4Nw9f6UsnlHWcih+jGBdx/oF2mkaBDkrsAGpNC/guCjxgafi6
         V52RkJjwkVB9uBB3BofcYaQu7Kf8tpmLRMXtPQeKmECa/abIob46qkriFSzNlJ8EFBkj
         zYsHjlHCskDMO3e4oJnSKrzOgvhrpe8GWk4UjqHNLz8pZwNHy5I7ohFKcS1LFAmJQqQR
         MRACTsa0bwRw8MYfDrtz6IFwQrN0917KIGh547YFxiF6v9V2xeI/rkXPtm2Nypax2aw2
         hutijEZGONpOoOp9xIF5qqQR5rbKuncwrS+67jffPgKmgaSHEsMiwmsC3hF5DClyUAY2
         QHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782709412; x=1783314212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W88vWECRU+wrMD9oJnjg+rbsRkfPT9MutHVGHqUs57c=;
        b=kTToSVthTJGMi6/q8Gh1FpkramI6C75vRNqQqZRS1FOYH7jo8+4PSVWraInUWlXMm4
         lSQohtx1wpEWnivtVEyuDw7vXJfSbzC8Q0CldjHwUYLyOxr0xcWS1Zkke1oFZ21AuHF9
         VPf/BZo2pS5Qg9Q9q4EuTSD/RSUiyGCF22G2NqpE0U4HwsJXy6Hie3EkfUr6X/7OAtyV
         6KjYcU+KTBl8WDwFtgH/nvEiwLRrGPTWj1qDN+NFJcqEA38SzVkDMva6n7DO0tRnnVWd
         H2dQlPEpE23bqF6LQI5HIZ2LweLQ8Ge+ame+wuqVV7zedLblLR7UVx1jbtEevV+hNw8P
         j69Q==
X-Forwarded-Encrypted: i=1; AHgh+RrNZgrfZX3xYi8HNxhnnxHRMOZWmergd9qnxgVEg0ynMx/UsyDxUnVRhINZDiZMxtqOO795OkYYn4nn@vger.kernel.org
X-Gm-Message-State: AOJu0YxZNVt6kjOV+09z3N+ynIZcjWdCzt7tOx7nSvsHhYSJdknUlVur
	PY62hQzX0uOhO1L1/FCAM2qicCvkPAB3l7kDX3+VLhUaCioR9mDXUR4qEJgagatQzXTrMNPP7QC
	xZTm5vU3D9gR3N4SnZo4RUfjynkUQJtO+EHeVSZWEWrC30kxSKBTnVDC1csICNaBh
X-Gm-Gg: AfdE7cmlz3ND96nPOVlwBS7XJfdbsq34jwhG5wj1d6B+BL4MnGzUhQdd2kt7ts8ftua
	HgB5OaMJ4QEyFlCniLcaRq8p+LdbnKkbauws3jnYDbW3FrEj/1xd6dFJls/aUUxUcHTrVNZzSN9
	UQKkQ30WTcsBNHTylYIpfij4Je3mHHO23lkefx546A5HBi2J1XVPzhz49LsnUnibJPJLAbX9k0o
	26rZurDYOyJOqvT4ARYGxoWprKew136X6phlcF8K5pK2W3nhTCpsvqLu87V3SivAZgFMEDaNtKl
	4Ulnry6Mr26Oa6XMac72rlZ0gIO04I9df9j2fJ6IwO1v503XNbK00rwqYz1fignjNonqfQ9Sqn7
	TGxJiWd6nnVZ1GBrANW3HS3XRGSzjlmrOK87t6Emtq/Qj3DnMcA==
X-Received: by 2002:a05:6a00:450d:b0:847:1b77:6eb9 with SMTP id d2e1a72fcca58-8471c5c5170mr2872772b3a.9.1782709412452;
        Sun, 28 Jun 2026 22:03:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:450d:b0:847:1b77:6eb9 with SMTP id d2e1a72fcca58-8471c5c5170mr2872754b3a.9.1782709412036;
        Sun, 28 Jun 2026 22:03:32 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23ccsm11615264b3a.36.2026.06.28.22.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:03:31 -0700 (PDT)
Message-ID: <d8659356-1b47-4423-abd8-76ecbd466507@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:33:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ASoC: qcom: lpass-va-macro: Add shikra compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608172023.2965292-4-mohammad.rafi.shaik@oss.qualcomm.com>
 <3a0890b2-f9c3-439b-a392-fd13e3da850d@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <3a0890b2-f9c3-439b-a392-fd13e3da850d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MSBTYWx0ZWRfX69B0RuZvmXxF
 ZSSnCLHzI1jHWqkW6CiMb53FPlwf1nvu8/Z8lDGOcTUR+DHzeUcEXb28sIA+6DVL9NvaUkef/RM
 MqtdvA1xtR25ch8uRNTSoyv9LdoONf8TKk4x5OcFDHaYUSzRDIioUfHwAcYuWcNUj9z7JXyfURr
 m+w0FJkVTjzV5JPK3nNpDCf5iY3prkUYOwGexRIDU2LMuNkm+R3TTv4+gjcsRHbVkJL9C7aU/lZ
 3CgdKGnBd8vyj6v+8CO2ZxEhV2PfAsrouOV5coh47IL8lHUyTdBvKmdbP+YrXRzj7QMLSCFgFN7
 03oUm37vf3oAQgH8eXgDMVBpOcC/SnmcP4HLHEHScB9RvcjHEvuWEJI7Xruoa7CfiRtAG80CiUO
 jKhtcbWwrDDrnEYUD2OGYMnWovFDeueFT110uMIvYIv2VA+52yUJFQk1RCnUhZk2BoS7pd5WtZe
 1RMXgJlyjEG+Wmc2gMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MSBTYWx0ZWRfX0Z0ZJSXiJida
 aVd77weQkgRM0K/DwcqJMR0t7E2lNX23/073Whux9RTy+Pwk/Fdv2SnYpBnH0s5cubfI3vOY/ft
 vJdyjlr8zT33ce08k+Wqj+8UJEHoGFQ=
X-Proofpoint-GUID: _q21hB255ffIR4PQC2QVuwhdDZB1280R
X-Proofpoint-ORIG-GUID: _q21hB255ffIR4PQC2QVuwhdDZB1280R
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a41fca5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=G8B2rSO7KOTdLhCsa_sA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290041



On 6/9/2026 2:45 PM, Konrad Dybcio wrote:
> On 6/8/26 7:20 PM, Mohammad Rafi Shaik wrote:
>> Add shikra specific VA macro data and register programming needed by
>> the LPASS codec v4.0 implementation.
>>
>> This adds a shikra regmap/default table covering the ADPT register
>> range, wires new match data flags (bypass FS control and ADPT block
>> presence), and enables the ADPT control programming path during TX
>> decimator bring-up.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +/* ADPT control registers - Shikra adaptive filter blocks */
>> +#define CDC_VA_CDC_ADPT0_ADPT_CTRL		(0x0800)
>> +#define CDC_VA_CDC_ADPT0_ADPT_GAIN_0		(0x0804)
>> +#define CDC_VA_CDC_ADPT0_ADPT_GAIN_1		(0x0808)
>> +#define CDC_VA_CDC_ADPT0_DH_FSM_CTRL		(0x080C)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0	(0x0810)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1	(0x0814)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2	(0x0818)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3	(0x081C)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4	(0x0820)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5	(0x0824)
> 
> Please use lowercase hex and drop the parentheses
> 

will fix it in the next revision.

> [...]
> 
>> +static const struct reg_default va_shikra_defaults[] = {
>> +	/* VA macro */
>> +	{ CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
>> +	{ CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
>> +	{ CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},
> 
> lowercase hex likewise, please keep a consistent space before the closing
> curly bracket
> 

Ack,

> [...]
> 
>> +		if (va->bypass_fs_control)
>> +			regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
>> +					   0x80, 0x80);
> 
> regmap_set_bits()
> 
> [...]
> 
>>   	case SND_SOC_DAPM_POST_PMU:
>> +		if (va->has_adpt_block)
>> +			snd_soc_component_update_bits(comp, adapt_ctrl, 0xFF, 0x00);
> 
> Can you define these magic numbers?
> 

sure, will define and use the same.

> [...]
> 
>> +	va->regmap = devm_regmap_init_mmio(dev, base,
>> +					   data->regmap_config ? data->regmap_config
>> +						: &va_regmap_config);
> 
> data->regmap_config ?: &va_regmap_config
> 

Will fix in the next revision,

Thanks & regards,
Rafi.

> Konrad

