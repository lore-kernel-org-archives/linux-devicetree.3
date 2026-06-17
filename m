Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501B9175A95
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 02:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781663516; cv=none; b=Ur3LQTQErlqwOj0e6Nn/DsyER3Cyoe0vS70/lT48mUnNOBukzgEtDL2UATTxe9E2ohw1nlcnbLYS7tUJPqIK/lh6BmSSmqgXBuj/guUuemh20CX4OyKOgBDfAi11tqKlFQGYo91xnvY4PnoqJ8Nyk0CYR1yvvwE5/9eLonr28o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781663516; c=relaxed/simple;
	bh=9xTfNsMwsoqVW8f/dN+Sm1Y7gmtdsAqJSTBi/b/aFyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLow5IAf9J2XDfpKcyVLgfDdRQYoJ5SvX7N+RSM/iw6weLsjwJjTjqiaRotv0EMQTUZec7bAJ06gsqF+ly0pY0x/6QOWhtdYzS5MjDsLOymMu2pjkXHUiZE5zQS0t2krD84j/15LertYdSXV2KRltp6ARhFMbmOw1nAT+HK8PII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNqdCJh8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HE9Xqhcm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YNqdCJh8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HE9Xqhcm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLWA781816345
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 02:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sruMAy16agfp8+dLmVTyeBKpDyN3AMqjiQRv4woF4yU=; b=YNqdCJh86UFj02Tt
	WFx6BgsBz0oO+vy4cqjQiVPgdGMILtG+l87/FtJiSmMXGfpSEiouc8918JMnMk9g
	jwf1T4cbHqkLcnjNL4fH2kVHI94kcA3ChVcEGaaD5tmOKgHgOYWUsH0ojcYFv0MX
	ccRq5DUkJrLiIuRNzvwjvPgSbdvX/9hr5ygR06lEv6qTZQ4FNXEu6mFdfNuWipO+
	tVZAc3uLC5DPajfmgtlNt/VTjfNevu8TY2+/j8fa8Ga7yen/UD5+XQ2hm2l8D9C2
	p6ibTuJATpXtp/eVpUTP4EpEK+CxtQKi+IdLOos+zS2jezRZArqhp0Eykv6BHlEM
	jSlOXw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euefbrvdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 02:31:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37c9127e316so481324a91.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 19:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781663514; x=1782268314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sruMAy16agfp8+dLmVTyeBKpDyN3AMqjiQRv4woF4yU=;
        b=HE9XqhcmBQcQWDG+Bqw43JrRPhNvDnuaAeYfWpN49H3YgsvJzSBAU7jWphImzs/lQB
         UUk2gAPuF4itzKcySHguVtCBgD8dNfql1x8FIV31Q17Ak4MygWN+Ef6d820Vp6rKJAc9
         iv53yuZeiBwXb8y2Jp2F8SOinWx7QGf9k6HUcEzDIsBIlTWfnV5b+umdrKJ1dr99YahB
         q8foHA+FSbIoRArw3+jBLtu6WgkEXwuv/apH+E70OcGi3H5W4wLVTSvL7fu42me0JC3c
         2zgTXRPSXaxwqaR3V2u/+5JZQCSD+men2iHEg9Ptn8YOshKaBeFBCS2TTc0jMO/HlFj5
         vKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781663514; x=1782268314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sruMAy16agfp8+dLmVTyeBKpDyN3AMqjiQRv4woF4yU=;
        b=DmYb8v3/QA3a3E4/BwVnZLw7viNav1yim4ggkyCR+D/lHfcl9pPlvYTGoYP6pY366W
         DTHrySIdksuX53bVUU2j7GRDE48copMQ+kgB5/o0c86ipqrLxJZkcFBCHh2kS5rKFT2U
         SXLMcQWJUP0ZveubRib0dw9AWwz2yKPo/pWotZasqZQznYNQEehAhEXwJBaWBRorps73
         STEsO/DMpIkaInRKqRxynx2Wb66ZsCxCLRnrdrvFMwZJPLcQ7N4TEwvPccd7kh/V4IM/
         y5QQiwZPQZwpcmsEgnvY0CZcne4Oji1PI15YK7ZuCl651Jwqn8yZBni4PWnsMJJnHuag
         yVjw==
X-Forwarded-Encrypted: i=1; AFNElJ/2oXo9BfU5YQPqHZ9xCUpLSn+LR+eeSnGtYbobqR6f9g32pRdknMIXQxn44ogSsaKHjk0EykLnhPkm@vger.kernel.org
X-Gm-Message-State: AOJu0YyUIyCjnFvdHSfOuqS1bHUdFmyzsVNrNZarNzNepCqQa6TrGbcR
	ur75lJEmDOyTM4Xbi73IQ4pApz/rzC4D+UTxrarSKdZnr/QzJP7lDseCG8BU+MZzpcMkUoOMlCV
	0meJB+Q9bzjmkMfKBxC8AABaQMG/PVSHqaYTmX6UtjBWwPIrdZGQVjFZxSRr2kd8i
X-Gm-Gg: AfdE7ck5oEeJLKn1e2/B5nCXMjjStwXY60ePuUc7u77xVE+bHaciAo1N3jHkF9F9zka
	QRu8X2HtTlciD5tCD/XEg0cksUxKDgds+ddze7BH8icWyEaYdnXHMsgaTMevxS8qVJBpPj0VeT2
	NIV8IOSI0IU8zEtxHBY2MvkNhqllzkJBIgvedk9tKU4EQoNks8pHNmFL9c+l6tSVCoUZCXOzcbP
	gBHgrB9DqDKeA3kfQnBZ8efjQ8kFH6h8sVY8rRUpg6wuwh2vMYKYYw6+1GRsGjL7EOuGze/rp0j
	Q3kqM7i4LXn6wtnPCcXXkGyFsR3VqurTHlHQpyqoIxTDtyL5Gww4hYso1Zw9H5IsZ6SbqDkn1QS
	IhLGDE+LUenSLd/xRGPgFoEGSdOww74pg+V6v4gCcn5qGk4QtHFsLpIWQ6BoeoR1pjNDA7OavwF
	Sk9hM=
X-Received: by 2002:a17:90b:3146:b0:368:a27f:9083 with SMTP id 98e67ed59e1d1-37c93319f29mr1924433a91.7.1781663513873;
        Tue, 16 Jun 2026 19:31:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3146:b0:368:a27f:9083 with SMTP id 98e67ed59e1d1-37c93319f29mr1924378a91.7.1781663513384;
        Tue, 16 Jun 2026 19:31:53 -0700 (PDT)
Received: from [10.133.33.63] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8665186aefsm12630035a12.15.2026.06.16.19.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 19:31:52 -0700 (PDT)
Message-ID: <1bcf00ae-2558-4c3a-970d-aee1da0c06f9@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 10:31:47 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] input: misc: Add Qualcomm SPMI PMIC haptics driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-3-d24e422de6b4@oss.qualcomm.com>
 <eb693705-c0c3-427b-a924-5aa907fd65bb@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <eb693705-c0c3-427b-a924-5aa907fd65bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XMb47V7N37KK8w42c_A84IGbDvEuSmPC
X-Authority-Analysis: v=2.4 cv=IeC3n2qa c=1 sm=1 tr=0 ts=6a32071a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=-Z37uosrcRa51fMA2KUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDAyMSBTYWx0ZWRfX8miyhBQk4nwj
 op27cCxEP1OK+WRaPgil0xHOmJs4KeyspHEZBc+HZKrglNpRPAwqv3tmR9Q2//dk5EwcbdtetOG
 cHncMQIhQKfMyyrG9dUmdD9AZxiW/rQ=
X-Proofpoint-ORIG-GUID: XMb47V7N37KK8w42c_A84IGbDvEuSmPC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDAyMSBTYWx0ZWRfX2oyuD/QfB60p
 8ohNxDl/DJONwPPXsq2b6K6deWcVPLeCZn2+UA7bgKL8GnLERdGkJwqwE7iHSKNZAujwy5OIQA+
 /Vh+xNa+UN3yHs+1Ss04gRaWSzkLSOm5QgtKgam814RbzJZXUvOWa14/UcIZ9qAt6fB43yhuMm9
 SskzT6kYP4m572jtUS/Gyrb4xYLoXCk26wnysWop360ItS7fcpidnTB1WGR5gMWWAR3TrPhVyO6
 QNqsLYoPexkClGUNYuI9J6eDL9IsfmsppcHf6zwc+DfD8OkU6UDIVWwjI6LLp0Nt/Q9KkA6mVko
 jGXigPY0Yv/k/DONo/hrqyhDk918FItvp03houFq5ZDp6yE1nwRgm8P2V43vXPO+sGvXjkxCBtA
 kXQfr9OGgUV5Estg7Oc7feuaJy0KOF8k93AHMhWMXR6wf2tlK9r5pFS8aDO7EyUqj6E+y14mhuy
 Vwpx0ZagCs4UKyQ3Aug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170021

>> +		ret = ptn_bulk_write(h, HAP_PTN_FIFO_DIN_0_REG, &data[i], 4);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	for (; i < len; i++) {
>> +		ret = ptn_write(h, HAP_PTN_FIFO_DIN_1B_REG, (u8)data[i]);
>> +		if (ret)
>> +			return ret;
>> +	}
> So if i'm reading this right, the first loop will always write
> 4*(len//4) bytes and the second one will be entered at most once,
> to write len rem 4 bytes.. should this be an if instead?

I should put a comment for clarification. Here’s some background: FIFO 
data writing supports both 4-byte bulk writes using registers 
[HAP_PTN_FIFO_DIN_0_REG ... HAP_PTN_FIFO_DIN_3_REG], and 1-byte writes 
using the HAP_PTN_FIFO_DIN_1B_REG register. The 4-byte bulk write is 
more efficient, especially for waveform which has several Kb data, and 
it helps to reduce software latency when loading effects and reduce the 
delay in triggering vibration. It also helps prevent the FIFO from 
running dry during data refill in FIFO-empty interrupts. Typically, we 
use 4-byte writes for the initial 4-byte aligned data, and 1-byte writes 
for any trailing remainder.

So it still needs a 'for' loop here since the remainder could be more 
than 1 byte.

>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Configure the hardware FIFO memory boundary.
>> + * FIFO occupies addresses [0, fifo_len).
>> + */
>> +static int haptics_configure_fifo_mmap(struct qcom_haptics *h)
>> +{
>> +	u32 fifo_len, fifo_units;
>> +
>> +	/* Config all memory space for FIFO usage for now */
> What's the not-"for now" endgame for this?

The hardware supports more modes than the two currently supported in the 
driver. One of these, called 'PAT_MEM' mode, also shares memory space 
with FIFO mode. However, 'PAT_MEM' requires memory to be pre-reserved 
and waveform data to be pre-loaded. The entire 8K bytes of memory can be 
divided into partitions, and it is configurable, with FIFO mode always 
using the first partition [0, fifo_len], where 'fifo_len' is set via the 
'MMAP_FIFO_REG' register. 'PAT_MEM' mode plays waveform using data 
preloaded in a memory bank defined by the registers 
'PATX_MEM_START_ADDR_REG' and 'PATTERN_SPMI_PATX_LEN_REG' (they are not 
defined in the driver). Since PAT_MEM is mainly intended for 
hardware-triggered vibrations, such as a signal from a dedicated GPIO 
triggering a short vibration with a preloaded waveform, and although it 
also supports software triggers, I haven't found a suitable way to 
support it well into the driver under input FF framework yet. So, I am 
currently allocating the entire 8K FIFO memory for FIFO mode only. We 
can adjust this later if we find a better way to incorporate 'PAT_MEM' 
mode into the driver.

