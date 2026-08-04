Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2420C3F164E
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 14:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853182; cv=none; b=aO8hR+9eS7O92QOD7XzDOubO1MF256+fSXin/cQ5pvrHaB5/g05TiYe5YhSwfOM2y/JYpdNvrrGN7JFUCqzvLdZfgv78uX6bOXsDpVUg4V9PFq2ZRGYiD2ystXntIozsPZ4EvsPM+ylAUhS79C8pxm8fMI/8JmAHLcR703xZre0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853182; c=relaxed/simple;
	bh=O8BzbCBcjhGwVRbtwuRkH7SD+ZtA/43OKIVWt2hRWig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b25ao7hqfeQm1FQJNMN7ZvPSAsk9iH7Lc/11uqagr13RGKlru1KBdMGMmtz+8H9DUMzbl4NJdOaHS+VkOkdgMmTgRe60i2+Q8rJiGTZp7bY+jmtv1OpkoLaZu7RWnH8L1JRisQyeQPks8bQwcBZ8ZCDvhplOmuLIjYSFPzBDpWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RokXGYZa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgF2mCaI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RokXGYZa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgF2mCaI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXTnL3830769
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 14:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XvPnoApYmZ87f1/qec4dvX+v1zVKWXvBvSzu/BPNQhg=; b=RokXGYZauFUft47+
	qld1gi20gh+J/zXd5XWmR507blMz3qOl4MjnwW39H4jMmNrRp15MFqZu1ML+aj2w
	TspvZmof8cnNMk2h4AjEGs9Ec4b4kONIJ0JDmEHhzfy6JgCpQ/3Im4htbGTtzH4q
	Vt9aGr7VuxpP+48N0NvAqRw/+l/fvH7NXylvCyqpKWHO9piz2wu5EuF8qEAEeXPa
	hi9TVduaW3vQqN2zqmH0BYijpldKPVwvf3uq72t8pnoZzR5CnEfXps452PleZKqJ
	Touv4wW3RsBdt7nDfmdm7ME+fTH3maaNKuuAAW2ikP6y76FMaw7KP4IVOCcqbiPK
	4/1Qsw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu5hqu1wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 14:19:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbe62e01567so1067062a12.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785853159; x=1786457959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvPnoApYmZ87f1/qec4dvX+v1zVKWXvBvSzu/BPNQhg=;
        b=fgF2mCaIWHI67mmh0zGg1ygQTzGZY6/LdRB0+Dm58rHjspJ/NJgjkzqcmEKEbabYuk
         NV+sxff3BIhMWgXgsWpeaHapePoYfgDq8hTd6zDtutRn2XLZrpRFlSCaQP17ZWTWKvtD
         C5tbQ/E7T5wqlls3ghCiZ6lZpcL92X1IxC8jM4R+GwOuCene89M5stGy20LYdv7aVLJx
         GoRcF4j0zYGcRSoZKg4skE8dNX/I/+IT4afKECLxqZX0d1iqezFIqwasrKJmXpsYxY84
         DBN8rIId9ghZlG7OCfBgStaRnBTDhuQvsg5VkIDN5URlyMb/1muAgNk3dlG30QAnGSPZ
         2nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785853159; x=1786457959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvPnoApYmZ87f1/qec4dvX+v1zVKWXvBvSzu/BPNQhg=;
        b=LiKIJIcpFm8W5nh4I0KnWUYTIyiMTTym2qIuQI3xdi5kt53KpkKqS/bYtgme9M4+e2
         SPWqkVwbj0KLpHWEZ1vUfl0pt5sP90Yh7P0rFOl6p9BSzSWwEf/yR3X/0rsSNnimJb2g
         0GjhiNLv8tlbb7dpsfqmcc4JLQhkjDEU4eL/SZoz5TN7zCh3FeC3ZeJhA6HUF9jjv716
         qNloV8iWXywbxI2e7HL0tsm8gV3QZGbxmwTRLF3MClk1YVOdolY7O0kkCTvTQOH3M95i
         WevdWyJn1OvjBWHaFhDiukTpJ4ApImDKJggO4HlkG53p7Y3WgU+Hba+NXTFydatdcn/j
         TFnw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/UbD7gXUygs+No2EQhQH7Jg+z11qoJTsEiwXBuovPGlu/+bYI/lGdWDOnsgvgFY+pyy2RblF3Ii0D@vger.kernel.org
X-Gm-Message-State: AOJu0YweC3sZM0pzCWD2ddyQNzaWsA8ocZ36Bq02VtX3Y9KSm6HhlFq1
	iFtr0CjtX0RnDshkfjanaBA3VZQWdPRYkOSyRYOBg1gEo+Hhb0bQ0Em0VNLUYh7g4IWkXuEDhOS
	Y4U412yZkR8F0nJrZO3xoLsO3sDufeJiRndse13P3a4fxNPQAlCIC+H5ULzoyaiF0
X-Gm-Gg: AR+sD13G9zcaU/VcwzU+TPruFGtewyTW2rZp+aJlrtCbg0ItTsorms33/EFYZgyb2V9
	PpVPkvuaB7E8BdS3txyaZRi41rCyI4Xg92xIHE3O8yAb71jRxu1rZkbRVJFuSuj/BFyNROVpdyU
	h9OF/rQiANZJjz2zxvfl2ypNujHQuQIQ0rbqWcoIGM9fjULX3ostHTperjOmw3CRKmQ5OSGEoLW
	sKmC9jk4RpG346JYIzXpOTdJNV/gRuRAyMKUhDZuyR8kAjFASNWXljFzpr7tX6h6V9DYZ4+Aa7T
	p4I+6nBp+OuZrgf4fv6b57DY1wm89xoG0iGjTInQSjj38mRJ8K+S/3ovpMhy6nLpXgjOWIEqSOi
	JSBT0uvpUDo6JY+DPjKQ+mpKhheJ1JNJ42g==
X-Received: by 2002:a05:6a20:db92:b0:3c8:e140:63c3 with SMTP id adf61e73a8af0-3c92a839c3bmr14175339637.37.1785853158747;
        Tue, 04 Aug 2026 07:19:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:db92:b0:3c8:e140:63c3 with SMTP id adf61e73a8af0-3c92a839c3bmr14175300637.37.1785853158190;
        Tue, 04 Aug 2026 07:19:18 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be4dsm7297294eec.16.2026.08.04.07.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 07:19:17 -0700 (PDT)
Message-ID: <71b1436f-acb9-41a9-acee-96a1aa79170c@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 19:49:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 02/12] power: reset: reboot-mode: Add support for
 predefined reboot modes
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-2-889281373870@oss.qualcomm.com>
 <20260803095903.CFAA21F000E9@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260803095903.CFAA21F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExNSBTYWx0ZWRfX3fd+ttT8Q9M3
 pEUMiYj47xOcRWhq7v21H/pw+LmCnq/IwJWGuJGiBXpFuM7+lsyI9maeAqWR1MeHDR6cqLOFjPL
 AQcTHPbYxkDGLul+N0bJuhBzar8O334=
X-Proofpoint-GUID: kz0U0mH9oAbdNoxm_YKigK7_ty9Vvruf
X-Proofpoint-ORIG-GUID: kz0U0mH9oAbdNoxm_YKigK7_ty9Vvruf
X-Authority-Analysis: v=2.4 cv=EoniaycA c=1 sm=1 tr=0 ts=6a71f4e7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=598FUc-ZneajLAHzYwMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExNSBTYWx0ZWRfX2s+lA6r8HLzq
 +jyZyyAYUwe17jbxTZTwSetEAwYhbvoDnT9zvbmqSZXO/YPQ/e+ZQjnTmDVY5f+cZHbu5rzhYAE
 NE9wBaGkaMZkkAo1pp7oX2b3ZyXD3m5sQADodtlzZa5twPVFhdxnGhM67BBgJNUOBvxEkZXWJs0
 c+IEYVoSGWH6E2ScWymHQRP+buDn/FxqzM972PIgolaXME8iYQfkY0oBfdYQC7QVqnjMvHjOOG4
 AGKx5zf/f34oKi9Y6E0kBnS3l6gfTD1V6UfyYkc6R8nwk6LwHLWvOr9jDObJCO0SRlizRKqjE8E
 5hkq3f+bgma3bWkOfVkh3f9q0CApvxG782vXYVF0zblmS1AwK+Oel1sWqCt3rfHP6XLecqCI2YI
 1XLKPxvaUSRCKNZ9020QiptEZPEO6JxT9rsPnkpB+u9HJGMy19Vsxh99MeoBZ1KUdMGEdFmfbZ1
 iLJulYcFZZtILKGyTiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040115



On 8/3/2026 3:29 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [Low] Duplicate predefined reboot modes are not properly deduplicated against DT-defined modes, violating precedence rules and causing duplicate sysfs entries.
> - [Low] The patch silently changes how device tree arrays are parsed, skipping valid properties with more than 3 elements.
> 
> Pre-existing issues:
> - [High] Memory leak of `struct device` in `reboot_mode_unregister_device` due to a missing `put_device()`.
> - [High] Multiple instances of the same reboot-mode driver cause sysfs name collisions and incorrect device unregistration, leading to a Use-After-Free.
> --

[snip..]

>> +static int reboot_mode_add_predefined_modes(struct reboot_mode_driver *reboot)
>> +{
>> +	const struct reboot_mode_entry *modes = reboot->predefined_modes;
>> +	struct mode_info *info;
>> +	size_t i;
>> +
>> +	if (!modes)
>> +		return 0;
>> +
>> +	for (i = 0; i < reboot->predefined_mode_count; i++) {
>> +		if (modes[i].name && strpbrk(modes[i].name, "\n ,/"))
>> +			return -EINVAL;
>> +
>> +		if (!modes[i].count || modes[i].count > ARRAY_SIZE(modes[i].magic))
>> +			return -EINVAL;
>> +
>> +		info = reboot_mode_create_info(reboot->dev, modes[i].name,
>> +					       modes[i].magic, modes[i].count);
>> +		if (IS_ERR(info))
>> +			return PTR_ERR(info);
>> +
>> +		list_add_tail(&info->list, &reboot->head);
> 
> [Severity: Low]
> Does this code append predefined modes to the list unconditionally without
> checking if a mode with the same name was already populated from the DT?
> 
> If a predefined mode has the same name as a mode from the Device Tree, both
> entries will be added to the list. When reboot_mode_create_device() iterates
> the list, it will create duplicate sysfs entries. Should we check for existing
> modes and deduplicate them to honor the DT precedence rules mentioned in the
> commit message?

This is documented for pre-defined modes.

> 
>> +	}
>> +
>> +	return 0;
>> +}
> [ ... ]
>> @@ -183,52 +284,36 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>   
>>   	INIT_LIST_HEAD(&reboot->head);
>>   
>> -	for_each_property_of_node(np, prop) {
>> -		memset(magic, 0, sizeof(magic));
> [ ... ]
>> +	if (np) {
>> +		for_each_property_of_node(np, prop) {
>> +			memset(magic, 0, sizeof(magic));
>> +			if (strncmp(prop->name, PREFIX, len))
>> +				continue;
>> +
>> +			count = device_property_count_u32(reboot->dev, prop->name);
>> +
>> +			if (count <= 0 || count > ARRAY_SIZE(magic) ||
>> +			    device_property_read_u32_array(reboot->dev, prop->name, magic, count)) {
> 
> [Severity: Low]
> Does this condition strictly reject properties with more than 3 elements
> instead of reading up to the maximum supported count?
> 
> If a DT configuration defines a reboot mode property with more than 3 items,
> it appears this would skip the valid properties entirely. Previously, would
> device_property_read_u32_array() have successfully read the first element
> and functioned correctly while ignoring extra elements?

A driver using reboot-mode framework should handle this case imo.

thanks,
Shivendra
