Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C80480947
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330203; cv=none; b=sNLuOUcMkrSm3HX0lV3CiS6l7JA7+SCMF7BK7gzhFgCXvpqoCa2eSEAuo07yl1xSCQCGB4wtkGBepkx1FzdtIDQAmsaNhE8/4mw7oWdRu5YbpKqJ2rP14ucleZKwDS3nU9/vUVYfLT7fbZUYYpM9iDJXHtKCTkKvtlcG8BkCBgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330203; c=relaxed/simple;
	bh=/YeA6e4h90/TYAApBQ5RFPCojqWub7XeOGXkeguNddg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1klceRI4OPG68QZdbBHwXW7upOMmhDwAaTAzGSyHHyXfGCzG1iDr7C041FeXQZiqWBRGqs2yzEAloByozHC5LTjZ59SwVtIZ1AzdRFVJ/+JPMFuNLBlSlzRv+g4QhZxesJHKAK9YsUNpsvx7UKCuTVPhMrw08znnqSAloBUZps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opC6dvDf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bEEAoVJW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="opC6dvDf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bEEAoVJW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBWhQK1910476
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tlh3rnxfJkXfV5KarGkZfL1Q3S+pBYhT9xp1RWLyIIQ=; b=opC6dvDf4y7teSIq
	f1gZnd7WLAx8MAXMbfxooWoZlq+OgUkKeTEFcLhao8AZlmjo8kNpYbBz+O03AtMT
	89w1oWmt4iQnJkwyMKmNyW1FpJxk1Z75bSnpPhT71QOaqI0nCWCZIG7n7gZAv2YU
	JqDJJkLc5Mzdm/mQlq17YUTZutsubQxjumWApDHuwcWH1vAOr0NYM//2d+p4gVqd
	zIrWAX59UsOANgV6LQJ85bqfNh+Dltm3EFvdjtDS6KmsX3bMieEYFQ5fPbVie7UI
	AsdoKYZZgLjuCXn8vs5x9STsc5JBBPRjdpt2JF1KCzHRjhc3LwDCO8yOLlQ23IVL
	Pz0N7Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgr68bjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:03:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso1560687a91.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785330198; x=1785934998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlh3rnxfJkXfV5KarGkZfL1Q3S+pBYhT9xp1RWLyIIQ=;
        b=bEEAoVJW7hBeKuLwerY/7vNXT8Lv95w9Nbaqc4P77hDC8MLllq8kJFiMDNiasGZJ0h
         Qgp9usvixjWO705BEnrowjnONvPkDS+kPFWKuZKg2g9xdfDzwIaOpgo8CwFwX1s9dV3I
         KhMRw8GZChLzhgeYGapwbWjYAg5QMhIjObzaEsSNj4CYeSNrw1hculAftkiATSum6/BR
         YOd4PyuKYNbxaAiBrIJ5/5rdUXIOAwisiydCHfPG8sZH3Re/WX5XofVK/p0IWhNGGc51
         bzDEsl8mgueo3YuNxmUcdMy+bEzttvkTdbh1DI51BkjdYrqwOXhbhyn9TWH6sPU1+kgy
         pZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330198; x=1785934998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tlh3rnxfJkXfV5KarGkZfL1Q3S+pBYhT9xp1RWLyIIQ=;
        b=KvZ81l99YF0Zuz00djiRckvrmL/MVtidWqz6/qu3AdTerzdLNI4UpjD5UWiIyYYXHB
         ILKOBbisFa3uBtBDOq9/ggc/lgriCWmCXF8c/s118F5BMz5qSmtOLNT3/gGWYEia+oXF
         ZHj2zYty/lRWEG427GNElhjccfdyNL5JUM5Ixi75KxOJ7etekc7HmYsW8Oq65DiHtsVM
         2pz5rmjycIKJywSnaoR2EE0bCzOr/CTJVHKNBqeeCn6Ri7INTL+e3DZrQITXz1XPHd4J
         y6RGL2KVllVyL5AO1TG3fATSxak6Bi4YaPTz8Fl27vCQoH4x0BcU3kk1NOmIQXsqATCz
         UT9g==
X-Forwarded-Encrypted: i=1; AHgh+RovNJ90+07x0jwnkWzqPYnxJ1ZqaVo6vMx560ap8aDSM+yvTOjXPGlBG+kXyvVh07KP8VR5j0MaSqcC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywho+Z290Ww3Ze+z8pCVDAZs+sOnEWW5+DW5n/7BicqIM/BXJwg
	/qsM73eu12gYJNFZJ5eF+h3yRetIJcD98poqajqSNa3bn5lUuVg+Nypb73M2exZRTd6BF5MMZVU
	YcfbPLiytLA4REj3Buo8Dm1sJsrGVQkMXyFkXVi07FG2DAKlQObkqPpg1Xm1RBiJf
X-Gm-Gg: AR+sD11GkFD0GlQ6HS4m+iQM6MlvD8+TCs4zs5y0kAEp8FyRfLEEdW/4/VBgylI1F+S
	luUu9UIbokZ/YfeQLbWEknbOnBvO0kemEuOpD+GuAyUEUIeC/W8+ZBkcOxaVfBEklupgvBEfex8
	5vcswKEea4JmIF7lFyx0jusCHTZKeSrS3rh62+gEtY5uvCRb1tQznqS3GR7MX1948nFoggtWMTn
	o5AYw9IRuB7Pbo+1q3NPVap/XO2DZEdYuRANLj7WZ4xKKf16MS3vQPV6zvFCRAxT3Q63Uktdvxs
	uaqi85vfZX1fxD700C5PkOms5Ioxic0cycpxEnlMi/dixxa4G7HkHAwGvwcbMH46T9LMhhVezsF
	k/3pDiw6OYlREUOFeD0yvRQ7TTi1Jx18ejazh5M/8qmKRh1meTlFqtrIPyhVLhzs6bOvqp78+Zy
	mo+CDMQPJ9TJMb
X-Received: by 2002:a17:90b:55c5:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-38f6a1b8aa0mr6429838a91.0.1785330197195;
        Wed, 29 Jul 2026 06:03:17 -0700 (PDT)
X-Received: by 2002:a17:90b:55c5:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-38f6a1b8aa0mr6429771a91.0.1785330196459;
        Wed, 29 Jul 2026 06:03:16 -0700 (PDT)
Received: from [10.149.71.180] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642bfc71sm2710478a91.11.2026.07.29.06.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:03:15 -0700 (PDT)
Message-ID: <95133f63-c7fa-4c68-9db0-2123cf754f50@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 18:33:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] platform: arm64: qcom-hamoa-ec: Add SoC junction
 temperature reporting
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
 <20260728-ec_add_more_commands-v1-2-771abd65ee1a@oss.qualcomm.com>
 <94081897-2e6a-4c8f-bd95-1961ca843478@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <94081897-2e6a-4c8f-bd95-1961ca843478@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwOCBTYWx0ZWRfXxTto42XAwZg4
 Rt/W/Y8ZHGWUBU3puPZNtEkJN26bw8uJ/r8cSMipLl+llRgZlbp7H73VTVp0H/yZEhcVZUX0HVR
 wZUvDZ1ZfoN7LOwMgNM1SBcMUttsEe8Ht9V23EZ9c6P5X7GR9FZ9/8agmBM8KjqiAiE/TCw4mps
 yDja3OwlvMKhqtzXKpAgbMFgmBEG6q63qYUfbw3YDt76MxosA/qI91BkevOvh8eLphvyg7CvuQH
 4zaNSX7Q9ez4W9Gld9bhuhh6bwzkipigysCP7DBSx7tTdVdmMzEhek7yIknrLzRemY1Tvn+nYBl
 9Dx3m8vkik1btvTchp8zjxIUGMWEjihz3JSBjP3EM1AQ3pdRQ/zQJc+aOOzEBg6g/ZibM+1g2/K
 riDl+VvOFJdwygrMlnseP5aIunR0mTZzZ0JjsOrfRtGg6ruQaJUHWWDPuujHCRnQGNiiGNTrcxL
 QcJKf9FHnVm51M6M0Rw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwOCBTYWx0ZWRfX+JCPjwn1aS0m
 GU5fgISDuOPu5CiRCdwgh31Z9JU+dMTT8HrKAhL59dWZ3EtTlmFFtTcz7R7OcG+v3uVVG3fuysQ
 Ngy+yvTSm98tzzJk7ybe/TgE+XONn2Y=
X-Authority-Analysis: v=2.4 cv=Cv2PtH4D c=1 sm=1 tr=0 ts=6a69fa17 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gdiicE2fkixeoH3Uy70A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: WJ6LFdZ61lvYU_IqI1-q120dFl6tshvN
X-Proofpoint-GUID: WJ6LFdZ61lvYU_IqI1-q120dFl6tshvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290108



On 7/29/2026 4:29 PM, Konrad Dybcio wrote:
> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>> Add the EC command definitions and handler function for reporting the
>> SoC junction temperature (Tj) to the EC.
>>
>> Discover the platform's thermal sensor to zone mapping via the
>> qcom,tsens device tree property, average the junction temperatures
>> across the mapped zones, and periodically report the result to the EC
>> over SMBus using a delayed work item. Serialize this and the existing
>> EC command sequences (firmware version read, thermal capability read,
>> SCI event control, and the SCI IRQ handler) under a new io_lock mutex,
>> since the delayed work item now runs concurrently with those paths.
>>
>> Re-arm the periodic report on resume and cancel it on suspend to avoid
>> racing with the modern standby transition.
>> ---
> 
> Missing sign-off, have you run b4 prep --check?
>

Thanks for reviewing my series.

Ack, I missed to add sign-off while splitting the patches. I verified b4
prep --check did pass clean here. Will add the trailer in v2.
> [...]
> 
> 
>> +	mutex_lock(&ec->io_lock);
>>  	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
>> +	mutex_unlock(&ec->io_lock);
> 
> Does it make more sense to simply stick a guard(mutex)(&ec->io_lock)
> at the beginning of qcom_ec_read()?
>

For this call site it'd be equivalent, but a few other callers (e.g.
qcom_ec_update_profile_from_power_supply(), qcom_ec_fan_calibrate())
hold io_lock across multiple qcom_ec_read()/qcom_ec_write() calls plus
state checks in between, for atomicity. Pushing the lock into
qcom_ec_read()/qcom_ec_write() themselves would self-deadlock those
callers unless their outer locking is also removed, which would then
narrow the lock scope to a single command and break that atomicity.
Keeping it at the call site here for consistency with the rest of the file.

> [...]
> 
>> +static struct thermal_zone_device *
>> +qcom_ec_sensor_to_zone(struct device_node *sensor_np, u32 sensor_id)
>> +{
>> +	struct device_node *tz_np __free(device_node) =
>> +		of_find_node_by_name(NULL, "thermal-zones");
>> +
>> +	if (!tz_np)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	for_each_available_child_of_node_scoped(tz_np, child) {
>> +		struct of_phandle_args args;
>> +
>> +		if (of_parse_phandle_with_args(child, "thermal-sensors",
>> +					       "#thermal-sensor-cells", 0, &args))
>> +			continue;
>> +
>> +		of_node_put(args.np);
>> +
>> +		if (args.np == sensor_np &&
>> +		    sensor_id == (args.args_count ? args.args[0] : 0))
>> +			return thermal_zone_get_zone_by_name(child->name);
>> +	}
> 
> I'm not sure that's the intended use of the API, but this is NHI
> of_thermal_zone_find()
>

You're right, this duplicates of_thermal_zone_find()'s algorithm almost
exactly. It's static in drivers/thermal/thermal_of.c though, so it's not
callable from here as-is — keeping the local copy rather than touching
that file.

> [...]
> 
>> +static void qcom_ec_sci_evt_disable(void *data)
>> +{
>> +	struct device *dev = data;
>> +	int ret;
>> +
>> +	ret = qcom_ec_sci_evt_control(dev, false);
>> +	if (ret < 0)
>> +		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
>>  }
> 
> This should be a separate fix. FWIW suspending and resuming on
> linux-next/master currently gives me:
> 
> [   43.754787] geni_i2c a84000.i2c: error turning SE resources:-13
> [   43.754811] qcom-hamoa-ec 3-0076: Failed to read EC SCI Event: -13
> 
> Konrad

Agreed, will split the devm_add_action_or_reset() conversion into its
own commit — it's an independent correctness fix (also disables SCI
events on partial probe failure, not just on remove()), unrelated to SoC
Tj reporting.

On the -13 during suspend/resume: that looks like the SCI IRQ firing (or
its threaded handler still running) while the I2C SE resources are down
for suspend. Will dig into whether the IRQ needs to be quiesced/disabled
around suspend/resume here and follow up.

-- 
Best Regards,
Anvesh

