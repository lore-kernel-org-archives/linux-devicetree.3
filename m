Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03FF3D3486
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785406092; cv=none; b=HIJuLU745UEshLE6hvKITL+U1IeMAT5tWJEWGShu0aRCSNxAPHilM0A0V2wo/h1ebVsWUqWfKbwLoBbSItP9ZJ+eBeOA6StHMLfRZW/gBbPnMD0U0OU36WLYsD+bR10WZyvAeuT3x22NLxReN8OrpUKo4U2aq1hjuGr8Nk+HLsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785406092; c=relaxed/simple;
	bh=Qbd9OP9RaSmVgWE/08xXchOAy87JHiIPy3Xt7XdRZyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JmC9aKvSyzbwexre07kWemKJ0uFTpsM+WjdmuyuRk3w/KkuSWXLgNouYRaxLfcJvMkf6XrU9ECFZJsPcLHljVmZ444RMYHau9w/VD2bHdETCS/fdb2bHw8bYRZgEZ7zGgWdYkMTd0poKI77lKpXrqfn03l5hDCR66hFIpZyAmFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ogDo6z8C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lz/HOT+Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ogDo6z8C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lz/HOT+Z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA2Z3W748922
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2l/iWVzzYUmH93s2wNbdWFoLyvXQJu6s9IWrGf+BUl4=; b=ogDo6z8CKj5k3R/E
	lBLT4WAu6qWnsJG7MmcE+3xNcS1QY6XTl9Q3M/ht/i3/K86rMzk+6JMk8tCg+ObH
	U3x9106Jw4DdfLxuTx5EVcnbekC39xIAoOpLn2WfuTioRwAD3AKTTaoIAerV+2Mq
	jG7GAlmeVQlL8OOlry87vdjEtgsfi/pDvMBkC0KTSCHr3g7W3xg6FS6qsUQIFCd2
	tRnQWflcih6pW9ISoaN589uS7cZs6zSyUdYW5dyzgG3y3Q3BMpT5KSWdI2sByJH/
	MynyDk6JcWOJ/eUZ3cNUQFfXdgGi4DtIcq49UXFlIFaKmNqnDKZ2uP6BdyBiybjB
	0bHuyw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3jv0ahf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:08:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84870e7f498so2100087b3a.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 03:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785406087; x=1786010887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2l/iWVzzYUmH93s2wNbdWFoLyvXQJu6s9IWrGf+BUl4=;
        b=Lz/HOT+ZqLw4qtczknU+ZxKiInwLjJkpXQQ7OZV8LK3ab/B0Rz7bCUEAxK9qHyCUCn
         AI0skmKuU+pIPcKt8T+uOr0McCih9i8EjGLmN8Kqiy58rGts6CMYXwtAI56eFcsU9ggF
         kKc8ef3bvDquUwE+xoMyWyqURNf4ZHYhm/xW0+2PpnZL82BokqaGKZJj24X3GPgS4bJB
         2XC+xios7Q/XmL6yqvjqB/pfvzV0hA/s0aZvV1q87IRuYF6WiQQY6ccLqmmzuj1LrBfd
         T8idNZrlBp4GtRgzPJZqLc4kLvEHMiTS55km091BsOUI41TTkHwJoVQ4M6UyX8opny0d
         K75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785406087; x=1786010887;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2l/iWVzzYUmH93s2wNbdWFoLyvXQJu6s9IWrGf+BUl4=;
        b=OOuHv+Sr5xjgehqv2Ff8Rh6rSXLhtU+bq33sEri/sJe/I+NHiSBIadhdyJcH2ZmnvF
         Zr1TspfrMRvc20NWQEAcBeVJ6rx1re9D/sdPAG4aRXMLK6aSqe0gAQ0gx5v4PgLO9sr3
         4xOSNAU5w78/bjkXZTL2CK+XWxWqL4zHm25A4bVUPB1zfgptkT8ZEmc7v0vA+iDVRIO4
         zedxz5T90kWBFla9joski0rl/2ggIHKRVYcCH/2P8bSCv4p4lJiWCi0zoAg+0CnZzPkh
         4HQip/55dgE7SwoYr0qcxo3K3JxGDhtkncxoJBIxSkzZQVWp4ckJBkydT1QFpSPdAKLc
         pukg==
X-Gm-Message-State: AOJu0Ywce/bEQNZl4ModwH8RDRRXP69iyEoVnisoKtMbOJHqiJTuSuAX
	Ok/0uK9T2YACYFdO1+Hlvt6oeGY2gPnF7iXd8zIHFT2yX2PNy1ziD9JETKLT8ACkIQskanSztGB
	Kp3WfpSdWH7UfZ+8iiUftY849XhpwnkEO8FDYVO6fVqxT/fBIVvDWL/4P0a9oI6NX
X-Gm-Gg: AR+sD12j0KOEMrk5hSzdNZKQN6dmkatxjaHDliYZKS5oBbxvTENRYriuHg9RYMY5IaK
	t7f8zG0WaP7svm6QCBLZ0Vku2RY0DoX6VigTroMuStDG/utoGxF+5mM1gxRtL/NHxtkcK11cOUV
	vyJzYp74xyPf/s3pzwn++QybrOxM4jfjP28ikjs1Y0V69YSqOvuaLdj51AXkOG8c/+O00oJS69L
	gEXgnPl/DO6DL54pQ2ie6OQurlqsqKaogYfUBqQKwPEd7B0IvrtPW1qeOK+ROFJWw7TzfMi7fo9
	DqBFWvdcwkbyBTGgogtmw2Q6dTwaZ7/hTMLU3MKptsueQ38bEK4glEg87+eP6itkbWpx+XRaUFa
	gvCNHyZ+h7VodicSLRAQ8VQ0KrAzTlxCH24aJRyfPKUY2o/hrLPttU2j+4J6GhLpMr/CfUPg9
X-Received: by 2002:a05:6a20:428b:b0:3c6:5723:5356 with SMTP id adf61e73a8af0-3c900a28d19mr1970044637.73.1785406087271;
        Thu, 30 Jul 2026 03:08:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:428b:b0:3c6:5723:5356 with SMTP id adf61e73a8af0-3c900a28d19mr1970023637.73.1785406086816;
        Thu, 30 Jul 2026 03:08:06 -0700 (PDT)
Received: from [10.133.33.210] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba63f806sm2111539a12.23.2026.07.30.03.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 03:08:06 -0700 (PDT)
Message-ID: <0637c5b9-2cf3-462c-9664-e809cb9bc177@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:07:53 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/7] qcom-tgu: Add signal priority support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-4-songwei.chai@oss.qualcomm.com>
 <20260730081714.118D31F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <20260730081714.118D31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA3NCBTYWx0ZWRfX8rqWh3ERw/ab
 r7t2EJDS8U13UTRVYmcblioKnCyckMcJauQK4gMlvX+T6Df0KR5RmbBiGZsdIaNnjTujiJ0p5lS
 tT/pkQtAqbnRgT3MJhhayC4EGUuNZXM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA3NCBTYWx0ZWRfX93/m1kOZ+eje
 1FqVpT+xDrU6eCtFfDQNCLZ6fHZgsSoOi1MqpV4BMAwdle2AFeyOEg9suRuFQzD2dKgUuSIQ3vO
 59jWNA74QCpJpXh4Cy+/1pIzMDdJmnhk/9iBYxqYelMQUfFfVRmh1o0f5r7GPQ8uk4iaUUwBDNa
 lKI3AUAjvRTH155BqaAiBiTU+kqlvFY4C9BWwvlbWDOcYXdITCQl119U4W1Zyt/zB58ESbKbnco
 aiA8s0x1BG16WsybUk2LgbBsj0fwqqdOk7/tjdfD4l8TE8+P7nawXDHNxbm9DFDFKOOg1VXnif5
 6NL2jlews4T5llhnW9L7idE/jLT/HUKNYVKKI2RYrionCDOMzMO+i6WGZzN342FQ0ONNwYi360q
 YawhzqSFj6sdSw/Vj/lrkuhppqrNkJJ91gBirlbff/vJCzPnERoRMOOygRvR1KTzuMePkgi2aPd
 hdC0mKvMT3eDWJT8waQ==
X-Proofpoint-ORIG-GUID: XSyx-hUs9_vlmxUmc3Ti_tttDUGi8bNG
X-Proofpoint-GUID: XSyx-hUs9_vlmxUmc3Ti_tttDUGi8bNG
X-Authority-Analysis: v=2.4 cv=Tb6mcxQh c=1 sm=1 tr=0 ts=6a6b2288 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Zh2D9iEZmoPOMH589UwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300074


On 7/30/2026 4:17 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] tgu_dataset_store allows writes while the device is enabled, causing silent software/hardware state desynchronization.
> - [Medium] tgu_dataset_store silently truncates out-of-range priority values on 64-bit systems.
> --
>
> --- Patch [3]: [PATCH v16 3/7] qcom-tgu: Add signal priority support ---
> commit 8afece15a767b432d65a919119df2e97aca2bed5
> Author: Songwei Chai <songwei.chai@oss.qualcomm.com>
>
> qcom-tgu: Add signal priority support
>
> This commit adds signal priority configuration support to the Qualcomm TGU
> driver. It introduces sysfs attributes to configure the priority of sensed
> signals for each step, and stores these configurations in a dynamically
> allocated table.
>
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index 9c7dd4a09f027..0e88b437f191f 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
> [ ... ]
>
>> +static ssize_t tgu_dataset_store(struct device *dev,
>> +				 struct device_attribute *attr,
>> +				 const char *buf, size_t size)
>> +{
>> +	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
>> +	struct tgu_attribute *tgu_attr =
>> +		container_of(attr, struct tgu_attribute, attr);
>> +	unsigned long val;
>> +	int index;
>> +	int ret;
>> +
>> +	ret = kstrtoul(buf, 0, &val);
> [Severity: Medium]
> Does this code silently truncate out-of-range priority values on 64-bit
> systems?
>
> The function uses kstrtoul() to parse user input into an unsigned long.
> Later, it directly assigns this value to
> tgu_drvdata->value_table->priority[index], which is an array of unsigned int.
>
> On 64-bit systems, inputs exceeding UINT_MAX will be silently truncated
> without returning an error like -ERANGE. Would kstrtouint() be more
> appropriate here?

|Clarification：|

The target register is 32 bits wide (|REG_OFFSET = 0x4|). Therefore, any 
value larger than |UINT_MAX| cannot be represented by the hardware and 
is inherently meaningless.

We can switch to |kstrtouint()| for stylistic consistency, but this is 
not a functional bug.

>
>> +	if (ret)
>> +		return ret;
>> +
>> +	guard(mutex)(&tgu_drvdata->lock);
>> +	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
>> +					 tgu_attr->operation_index,
>> +					 tgu_attr->reg_num);
>> +
>> +	tgu_drvdata->value_table->priority[index] = val;
> [Severity: Medium]
> Can this cause a silent desynchronization between software and hardware
> state?
>
> If a user writes to this attribute while the TGU is actively tracing
> (tgu_drvdata->enabled == true), the driver updates the software backing array
> and returns success, but the hardware is not dynamically updated. Subsequent
> reads will return the new value, giving the false impression that the hardware
> configuration has changed.
>
> Should this check if the device is enabled and either return an error, or push
> the update to the hardware registers?

|Clarification：|

The design is intentional.

A complete TGU configuration spans multiple register groups (priority, 
condition_decode, condition_select, timer, counter).

Writing hardware on every store would leave the engine in a transient, 
half-updated state between sysfs writes, which could feed a spurious 
match into CTI/interrupt consumers — exactly the hazard documented in 
tgu_write_all_hw_regs().

>
>> +
>> +	return size;
>> +}
