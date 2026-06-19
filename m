Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B1C2C325C
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 06:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781851518; cv=none; b=buWm5J7DFn/6GrVRVUU2cXtxBDZUKNwpEHl78zyneFjXkHXfwK4xAWr77seLeSK3vyAVnRf9smFK/+mn1WrT8PIGmL+ZJtqlLLFSEZ9BZ1g2CTQAKrpYf99hOBC/5CfwJfO0plzih3KLZ5GLVxaZdGlhvhxWNNYmCDoxCapXlcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781851518; c=relaxed/simple;
	bh=VvdYi542VVA8C+Q8HCRrmxb9lDjEJqxG11S2VZLN9Ek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BctRc3TnF+3e2oUja+VqM4CK7oYF75utbpY+eg2rDu8rJVgXAG9koEn+oylJ/d11yHqN2htyizfQzFbDH6HsbSONSUyDDx0K3MGZ8NrfV6xtpCY1/LKfkN+SdAIa2hzvjhm00P7GYitRq3OajcGEzOJFH/R2UJdMXTykH288FC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bm+po5Xh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9o1lrT9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bm+po5Xh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9o1lrT9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2sdhS524418
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 06:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6lkZ7tEMewe+zT45oVBiLxcf7tLC6xWFQ+vqhyQwRkM=; b=Bm+po5Xhdr02gEr1
	0utyOZxyYcnCqf+zuae/FNkqputt/d4Qy8PTlQe1hE9Idm79RVMUxtiZJytUVYhR
	ZQGkK61ciehoSYLl2KLw1OexB62DIZA1JsEvo/ltHxkclM6nBq78ZCw5qImVjt0A
	rtV0Sw1iKz6/Oill820DYDKU6VVOr7PncQVYi3cs5sQH74Xm8UADleoxhhwH+lNT
	ACbtD06ey1rrChFzOBKl1Oc1oYDlUR6KiMH6CsXjy9gTYy/PJDIywCkxxDWhwxDF
	K1cf8JbDX1nJYF9Wx4u69+/OjtfxFaGFi0xR8wQUccWpJrLESNJx8A0HZT7aEA4C
	/8RgSQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evgtmkqjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 06:45:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8611b27631so1856572a12.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 23:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781851516; x=1782456316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6lkZ7tEMewe+zT45oVBiLxcf7tLC6xWFQ+vqhyQwRkM=;
        b=Y9o1lrT9zI9oXj06DAy9463vTj8ZqVDz5zsHHOyTnnTy0Dz9VdpCDb8K74TanhM/Uy
         Jb2X61nL+6frF5RUojjsppZtl7bs+38mAkKQ3tZih/OKK+u/dlAcyERVuIeTvZz8rQlQ
         8yd9Wz/7/MDZ3i33nM/oTy4xlUbNnq5NlsTlcto0t0r5u6tLJCcHxdAoWPUuFRyLvjQG
         J9bAa8brur4M9v1rBC5z9hw4a2ilU9/lgTh5e/c9E/hV+ffgiB1Y/jU0tRxL+24R52yR
         Qjn+h8g4I9CNuO9g7kPh0bXuU4+Uk+Otu4YRouQTzeNwVra3Nsh6OtzBJUA3Yhxq/eT9
         fiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781851516; x=1782456316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lkZ7tEMewe+zT45oVBiLxcf7tLC6xWFQ+vqhyQwRkM=;
        b=namLupwpNsx9wlIwalRQOSPBY9icvc5RBJPkvr+QJVOC0hC1Gox1vLefsgFS0IEG2r
         aqgFHm8cvIA2cdIHK7LfcJNbRat+3xcRSQgJIktglj1KUW7cpZTJdh/LsOWY+57IRTIL
         /VRYhi0XMW6xY0/i83+3N09B3Ct5HkIy/HKwIBil3Zu0c5SUO2wY6WiDifM38ATjSDWc
         armghAjGaZppvRN/W0vc7SPJQvdqpCHFp7Zrm+JB3nzlFrnBrnNdQnpcAw5b+WsbfziM
         SQdRqJtXfwNGiuncZptmJA+mHnaqK4iDTowwRALKPHJNnvMy7S/b9S3uNU8Jj04tl+2b
         hHig==
X-Forwarded-Encrypted: i=1; AFNElJ/JpPAjJUdtW3caGoNZxwwvxB3l8PQv10kmW2j05bn7GAVkudHhSNuyP36ZQw4GmjvI+JwJxPyWKW5U@vger.kernel.org
X-Gm-Message-State: AOJu0YxNhbHopG/ZH/SMVNMKwtXw2Hx9oRqXUBsqhHT7OlW7HySneBO7
	8QTKNgj1nOYdT5AHU3cQtbqZC702QXUJmUB93GzTxq2dI8WPIc9w9Oiqwam6QJkcaqEMolKKq7j
	IRjYjq7sv7gWzNe2zT0x6yBkgfJNElrBUeyteRpcvUpKcEECzSyi4AqStdEmNgkqO
X-Gm-Gg: AfdE7cmLtOOfIJ4uUaCdKRPh+AJvXHT+Y2sD2fDfwLwR8I63pGLX9wF2ysFtSv/RzQ3
	It8FfnDY6TV2tcUB7qwDJ8B0hFmkXxS/QTRa6eOPM3W10I+kgDWluaFdjzrnCbTi7Ry1G6tnQH5
	7/6dMiV10akwCkv0k63W676pSuSjznY4RO1TSEzHVxZLCxkEXS1DeszPvg+Z3TsH6yPcSzZ92fb
	w+mtghOZa0q0VlqLMQvdnYX582Xqad8dIzmm+QTAVqmAsf3VHlTUKOu1c1cHIYx2uPhD30Q5eN+
	bUBFL+k9ZYtSmBA5P88gnZ8SQPRAqdEp6ezBRSzpdXP+ZBLYZUT5bI/9r+PGyZ4aExsfOtDui/m
	BmJ91CVE7BpQ1qMKFVY5xVyTD6aGdBpZV5Z/xxmBg
X-Received: by 2002:a05:6a21:9092:b0:3a2:e089:ae4c with SMTP id adf61e73a8af0-3bb3364fe14mr2290188637.5.1781851515965;
        Thu, 18 Jun 2026 23:45:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:9092:b0:3a2:e089:ae4c with SMTP id adf61e73a8af0-3bb3364fe14mr2290138637.5.1781851515412;
        Thu, 18 Jun 2026 23:45:15 -0700 (PDT)
Received: from [10.92.184.233] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a890ad726sm1286070a12.28.2026.06.18.23.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 23:45:15 -0700 (PDT)
Message-ID: <487f0ed1-dfc2-4f7b-94ce-60045017a663@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 12:15:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: qcom: Add support for Qualcomm MBG thermal
 monitoring
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones
 <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260601-spmi-mbg-driver-v1-0-b4892b55a17f@oss.qualcomm.com>
 <20260601-spmi-mbg-driver-v1-2-b4892b55a17f@oss.qualcomm.com>
 <7478c540-a5fc-4238-bba0-5b04547f57c7@oss.qualcomm.com>
Content-Language: en-US
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
In-Reply-To: <7478c540-a5fc-4238-bba0-5b04547f57c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: S52vW2mlphUDhXvwEBFmNJTyCTrQVgQb
X-Proofpoint-ORIG-GUID: S52vW2mlphUDhXvwEBFmNJTyCTrQVgQb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA2MCBTYWx0ZWRfX9rBM319facgz
 N9rc4S7nl3qZkAxvAav62VhqoabfC6M03Hgb/e46ah/v1GBwfV+8187cHr6VmvWWlxfbzdGC0yO
 o0ZxWXDb8nBsNwvvMQ+507wGN4LVgZvMcIPEgcXkxLjc6TOWk9rwQq1uDfCnhPvI5YhxSFs9y0g
 Yvjx8+P9wEwt+3rIBokCqVCapdFPtXtRWY6UAwq/QZ+86wdEZoKTogkFFco/XSmevcM9sDA3lVt
 tBZg2tuqhw1CxiALd8GONw6fTNoFpF7mhZqwSoUhHdO8vcS0yU3/Al6nveLuniFQWPlaw25ZfO9
 muTfFPUjW31G6491qlkHPAI/CkuNv57+iIgrVZItvKkvK7SLcIi2RX1ejQGzSj4u3n435DTuKnd
 zPy5WXTQLFzTn5aQYeQJ7m09plLubeQxT9YbVlf8rYkXwQHgZgOlEg/D20vd00kyK0U/4ZltWCL
 sxPI3pHSyb0xYr+r/zg==
X-Authority-Analysis: v=2.4 cv=Qb9WeMbv c=1 sm=1 tr=0 ts=6a34e57c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=bQejZYuZTa88olzWoIwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA2MCBTYWx0ZWRfXxRsujorVECAm
 MMOxGZ5k53a+w5MUTvNQAcpAyw+xrNsNnvGb+aNpYhRqRMRkGtU6Wv0lT3DEymJTrYMUs/TVtjE
 THE5bw1aXXzBx1V9QvzYAj9RmwqqSIU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190060



On 6/16/2026 3:40 PM, Konrad Dybcio wrote:
> On 6/1/26 1:01 PM, Sachin Gupta wrote:
>> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>
>> Add driver for the Qualcomm MBG thermal monitoring device. It monitors
>> the die temperature, and when there is a level 1 upper threshold
>> violation, it receives an interrupt over spmi. The driver reads
>> the fault status register and notifies thermal accordingly.
>>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static const struct mbg_map_table map_table[] = {
>> +	/* minT	vtemp0	tc */
> 
> The struct is defined 2 lines above, the reader can tell the names
> of the fields

I will remove this in the next patch series.

>> +	{ -60000, 4337, 1967 },
>> +	{ -40000, 4731, 1964 },
>> +	{ -20000, 5124, 1957 },
>> +	{ 0,      5515, 1949 },
>> +	{ 20000,  5905, 1940 },
>> +	{ 40000,  6293, 1930 },
>> +	{ 60000,  6679, 1921 },
>> +	{ 80000,  7064, 1910 },
>> +	{ 100000, 7446, 1896 },
>> +	{ 120000, 7825, 1878 },
>> +	{ 140000, 8201, 1859 },
>> +};
> 
> Please add a comment stating this map is not PMIC-specific
> 

This table is PMIC-specific and applies only to the PM8775 MBG block.
MBG is used only on PM8775 PMIC.

> [...]
> 
>> +	/* The HW has a limitation that the trip set must be above 25C */
>> +	if (temp > MBG_MIN_TRIP_TEMP && temp < MBG_MAX_SUPPORTED_TEMP) {
>> +		ret = regmap_set_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
>> +				      MON2_UP_THRESH_EN);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		ret = regmap_write(chip->map, chip->base + MON2_LVL1_UP_THRESH,
>> +				   temp_to_vtemp_mv(temp));
>> +		if (ret < 0)
>> +			return ret;
>> +	} else {
>> +		dev_dbg(chip->dev, "Set trip b/w 25C and 160C\n");
> 
> Should this be an error print, returning an error condition?
> 

Yes, this should be treated as an error path. For out-of-range trip 
requests, I will return -ERANGE and update the log to an error-level 
message in the next patch series.

>> +		ret = regmap_clear_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
>> +					MON2_UP_THRESH_EN);
>> +		return ret;
>> +	}
>> +
>> +	/*
>> +	 * Configure the last_temp one degree higher, to ensure the
>> +	 * violated temp is returned to thermal framework when it reads
>> +	 * temperature for the first time after the violation happens.
>> +	 * This is needed to account for the inaccuracy in the conversion
>> +	 * formula used which leads to the thermal framework setting back
>> +	 * the same thresholds in case the temperature it reads does not
>> +	 * show violation.
>> +	 */
>> +	chip->last_temp = temp + MBG_TEMP_CONSTANT;
> 
> Will this work fine if the user tries to set the max temp supported
> by the hardware (i.e. is there headroom for max+1)?
> 

In the current implementation, temp == MBG_MAX_SUPPORTED_TEMP is not 
accepted (temp < MBG_MAX_SUPPORTED_TEMP), so the last_temp = temp + 
MBG_TEMP_CONSTANT path is never taken at absolute max. For accepted 
trips (strictly below max), there is headroom for the +1C adjustment.

>> +
>> +	return ret;
>> +}
>> +
>> +static const struct thermal_zone_device_ops mbg_tm_ops = {
>> +	.get_temp = mbg_tm_get_temp,
>> +	.set_trips = mbg_tm_set_trip_temp,
>> +};
>> +
>> +static irqreturn_t mbg_tm_isr(int irq, void *data)
>> +{
>> +	struct mbg_tm_chip *chip = data;
>> +	int ret, val;
>> +
>> +	scoped_guard(mutex, &chip->lock) {
>> +		ret = regmap_read(chip->map, chip->base + MBG_TEMP_MON2_FAULT_STATUS, &val);
>> +		if (ret < 0)
>> +			return IRQ_HANDLED;
>> +	}
>> +
>> +	if (FIELD_GET(MON_FAULT_STATUS_MASK, val) & MON_FAULT_LVL1_UPR) {
>> +		chip->last_thres_crossed = true;
>> +		dev_dbg(chip->dev, "Notifying Thermal, fault status=%d\n", val);
>> +		thermal_zone_device_update(chip->tz_dev, THERMAL_TRIP_VIOLATED);
> 
> Should the assignment and this call also be guarded by the mutex?
> 
> Konrad

Yes, agreed. I will update this locking in the next patch series.

Thanks,
Sachin
