Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898B42E8DEB
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785942625; cv=none; b=cZG9HWv/yGvFBRWYKJNPWHwkJMiGVomexuw/Z/KdLt8O0EomCbLKFsDbzRF0hCs5sNuIwv1DAj6iCgNucNYJToVb3lWIz+DilfOci3+YL2wjxfArLALRyE2h/rfOPhgkBlPk0Cu4StthPCq9EJamZsIBaLkFUnU5oKiDmC8/wmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785942625; c=relaxed/simple;
	bh=L+5tXYPtUhRaNL0B+rgIRcgv8+FzWrIwWS9NcMN3aEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=etHVRt0J/l7n0eJbh1L7ktiyxy4RrQzTkPQurz5W3uH4M/6GqWozd5O6uNTifevJxwHi11W/GfFwXNpR4QCuPaadnZkrw7YtleG6RSnmhUay1hCurcih4zrRg6Gg6gFnp+uj0GQT99W7f4HxhUSxaOozDBBfXH5v//6Nr2t/tDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=koZwwlGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtdEIpZ/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="koZwwlGB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtdEIpZ/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Bv6S12864919
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 15:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VQtXNJQp1VB5MSHelQbg0WHY6EAG35/lwGSn0XAXIxc=; b=koZwwlGBCetyD3er
	k5gRz7bToU0NORNDqCJyyTzsDpQDhaerHwGO3U8KUG/KdWBRVEUoHQpZ0Ea/ffWp
	LTNJohZHDEeKrMEpaQM9As5xupE65IRSU3Ibu6wKB7e5zlJGzNe719oA1rrqZVu/
	dGpWodZ7XApPcGVpdMVqAjRScWGj34m9Dnrb0uAQd1RGNrK0iZ2nbIDglhpeTKGQ
	u9tqkmJhc7eDGPBc33pRD13ywdrK/PQgUxxWa5zQSFQMkxmqTzuhEiyo1Ih2izAy
	4Tv36iJSQpgtBaxwG6LTJzaMPhKs+acSz2uVpyFkUn02Uo2mnRikBUDVbYLtujdq
	rFbHWQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv2r61cnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 15:10:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1249511a91.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 08:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785942622; x=1786547422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQtXNJQp1VB5MSHelQbg0WHY6EAG35/lwGSn0XAXIxc=;
        b=EtdEIpZ/Gt+DeknxGV3LOwspwOvZsUa5DnV+t5732YAAwC+xajjE3juPB3c0htJ8qA
         Can9DW3CDmpPcsB2dP3sOSq168fzb9mJKYSIx0VzWjRP3cmQWnlTbujMSDQBW6Z3NHv0
         7/vIj1DNIHoavcjw8CjtTkApaTJfcrBLLugIceAZAvdUWaMs+TGdDa9mnfCzqJvOcjdn
         gJKqWkevCALPJrmZGV2LsyY1TuMWtDKf9mrpHCpeaHFpZR+LSEpb9dagAS+KQHC/anXI
         6nm4YkZYoqNrHBmiDOWvfnekl/sXh+5t1xzdzZBMLbkZy6WVZ6KQHuB26jE44zcRv2Im
         lPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785942622; x=1786547422;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQtXNJQp1VB5MSHelQbg0WHY6EAG35/lwGSn0XAXIxc=;
        b=E/ppYfPC4b4iZQBTdSEas8rhPi3+sGKyfyhAFsZrFOUP6Bp0dgSIeOsvqFlTjPgG57
         oATGHUhc92q7AEXuc4L9etSykL1Vk0lGR1HHlQ1wehVg+9RaZa5STwc8mpzXGCD1n8Hz
         yKF9dpuQMvP5jPQDMTsQcpwwIWvW1loIowZJ0v4lEU8supzne2tzoHAVG44QiKqiy/fQ
         z47bP26ND+eUAQ5oQev4qk7KZKRB+FU148N7TuG8BBABrvOWHNj9QKMbQZC0/idxxbT7
         FLS4HmNGYyZA+vwqzI4CHZqF1QzDAOBfunFaN06kNPyiU1MVDbeQ1fVjmugvYcFp/aua
         cTJw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5w9LNR1NrcFRCsdtVRmF0TPIgkDwWaF/qMjNI0V5bGWby2WENTqVHcsV+2AJIGwk4oeTqn1Me+RrS@vger.kernel.org
X-Gm-Message-State: AOJu0YwHKoeIcA0kKd/8AoQsHKL7tqGSl+zrg5pT7z249YehV6GNE6us
	ZLvCBglDBLTDKnXnwH5MRgoAY7faImsSzgbQQeyPwt4gznA3sjvX2KqmdXgBv8W05BoA9n51f5g
	VWH+2asWdu99yrCEVDKdmjlAMMKFD4JOI+Rwcnytpe/iOrxAk/Z7Cp9UjUEL3//gt
X-Gm-Gg: AR+sD12XW/wqFCqQ0RJ/ttTkfxDKLuDKuvqxDVNSrIynkuCuhznjIF0PGsiZhuDa4a5
	OXIP7Up1KfHdWBXDB7q6AeU9gEn3Qvvg2UIxX6Q10CmDqM0fgFihb0o07e4FuYtJ/7EvPxEOceS
	taT30SWYepKs0uWZ42Re6ZAaC1hGybOpfKZfIjIgd37L4o9yR+hkwSkRyUFLPpQGUgaoI9Lh+jf
	bJO3fN5Vpb7ohwwsR9ucMd9Z2QIKtNBZKqXQXGail7YnUMywDDokLehgE6YkCBPgV0oOFr1HPiS
	pwNc03dVLWYjcD9W+TXTfrx8IxNdaWk5KFpYwfhosjkoXYU5KdH6TjZjxmcf6SgN7ERBUpxiAGE
	xaIqeeujg/fyF+j5MrXrUl8g=
X-Received: by 2002:a17:90b:17c6:b0:38f:1a2e:6e56 with SMTP id 98e67ed59e1d1-3903c59330amr7100315a91.9.1785942622276;
        Wed, 05 Aug 2026 08:10:22 -0700 (PDT)
X-Received: by 2002:a17:90b:17c6:b0:38f:1a2e:6e56 with SMTP id 98e67ed59e1d1-3903c59330amr7100240a91.9.1785942621794;
        Wed, 05 Aug 2026 08:10:21 -0700 (PDT)
Received: from [192.168.1.6] ([171.76.80.242])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca50ad27sm14996315c88.2.2026.08.05.08.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 08:10:21 -0700 (PDT)
Message-ID: <dd445279-3e1b-4d2e-9a6f-e73b67c33a10@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 20:40:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] platform: arm64: qcom-hamoa-ec: Retry I2C transfers
 on NACK
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-6-771abd65ee1a@oss.qualcomm.com>
 <20260728182642.AFF0E1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260728182642.AFF0E1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WrIb99fv c=1 sm=1 tr=0 ts=6a73525f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=UcsMPGGDBby+oECK+wqMZw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ajF3hhvFhjBU8BI-8GAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 2SuytkB5LmX-VXu9_9StrPmz4P7bBbdJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEyMyBTYWx0ZWRfX4GFbX8Z0RhzE
 5nKKtyva5TieAq7PasZzf+Vqss8UfE5cQNpSMv2L+QZn8QGE5t1U8k8is0RcPhRksBP581BIzM4
 +M35R/iSqP030g7m7o+hqh39DkyG/0g=
X-Proofpoint-ORIG-GUID: 2SuytkB5LmX-VXu9_9StrPmz4P7bBbdJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEyMyBTYWx0ZWRfX3GkR0/6ERcql
 z/godTF2nCoy77+PBhubP0VTP1wwekCtPwVWHokDdQo2vaYCj32B9Cey4Wm3WJl1lvCGtw1qjDE
 QxpOWJri6hEeoJiRvFp8XV9AJms6hvfypeDwVZwE/ZhFMCJFnWWmbV0tDCDUHSAI5M5gg9ovlqv
 8tQP2pxioH3q7ICyW+XJKAuliEd1UsPNLBN07N/MMMBqU0dYbEO/oS1W4rzOk9dlit6LUaUEdVE
 3JtzOl9ta5wKgbub4y0gLSs4+L2vm3q36UXSt8xM2ikf4qjSuYyQfoO9Ra/4PrTWdPYSjF6i7AP
 JtW3Ma7vJ7a/kmuIUYdh5zoRY0FRCYO4b148bA8KJ5QBLXa/8STZBXG+JJkG+s361ClLeQTz54H
 4wbJyGU10ZleCBSMc1K4cdZlE576F8fvSd/E9Bt5D0iDdY2cB+entqqSMVtJIllj8ilG6dzvhyu
 roAK2gw7gPJSnv83Jxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050123



On 7/28/2026 11:56 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The patch adds retry logic for EC NACKs to `qcom_ec_write()` and `qcom_ec_read()`, but fails to add equivalent retries for the numerous `i2c_smbus_*` calls made throughout the driver, leaving them vulnerable to the exact same failure.
> - [High] Race condition during device removal where cooling device callbacks can execute after debug mode is disabled.
> - [Low] Initialized arrays of type `struct i2c_device_id` must use named initializers rather than positional initializers.
> --
> 
> --- Patch [6]: [PATCH 6/8] platform: arm64: qcom-hamoa-ec: Retry I2C transfers on NACK ---
> commit 42a41f4860b9d5a24932df8c69069cb7fd89b4d1
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> platform: arm64: qcom-hamoa-ec: Retry I2C transfers on NACK
> 
> The patch adds bounded retry logic to qcom_ec_write() and qcom_ec_read()
> to handle EC firmware NACKs that occur during busy windows right after
> boot or during SCI event bursts.
> 
>> The EC firmware NACKs the bus instead of clock-stretching while it is
>> busy servicing internal work (e.g. right after boot, when it is also
>> emitting a burst of SCI events). A transfer issued in that window fails
>> with -ENXIO even though the EC is otherwise healthy.
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but since the EC NACKs the bus
> right after boot and during SCI event bursts, will the un-retried i2c_smbus
> calls also fail?
> 
> For example, qcom_ec_sci_evt_control() is called directly during probe and
> uses i2c_smbus_write_byte_data() without retry logic:
> 
> drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_sci_evt_control() {
>     ...
>     ret = i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, enable ? 1 : 0);
>     ...
> }
> 
> Similarly, qcom_ec_irq() reads events during an SCI burst using
> i2c_smbus_read_byte_data():
> 
> drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_irq() {
>     ...
>     val = i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
>     ...
> }
> 
> Should these SMBus calls also be updated to retry on NACK?
>

I'll add the same NACK-retry loop to qcom_ec_sci_evt_control()'s write
and qcom_ec_irq()'s SCI event read.

>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> index a420a180a1948..122ae27c2b483 100644
>> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> 
> [ ... ]
> 
>> @@ -281,11 +302,18 @@ static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, const u8 *subcmd,
>>  	msgs[1].len   = resp_len;
>>  	msgs[1].buf   = read_buf;
>>  
>> -	ret = i2c_transfer(client->adapter, msgs, 2);
>> -	if (ret != 2) {
>> -		ret = ret < 0 ? ret : -EIO;
>> -		goto out;
>> +	for (int i = 0; i < EC_I2C_NACK_MAX_ATTEMPTS; i++) {
>> +		ret = i2c_transfer(client->adapter, msgs, 2);
>> +		ret = ret == 2 ? 0 : (ret < 0 ? ret : -EIO);
>> +		if (ret != -ENXIO || i == EC_I2C_NACK_MAX_ATTEMPTS - 1)
>> +			break;
>> +
>> +		dev_dbg(&client->dev,
>> +			"EC busy (NACK), retrying read of cmd 0x%02x\n", cmd);
>> +		msleep(EC_I2C_NACK_RETRY_DELAY_MS);
>>  	}
>> +	if (ret)
>> +		goto out;
>>  
>>  	if (read_buf[0] == 0 || read_buf[0] == 0xff) {
>>  		ret = -EOPNOTSUPP;
> 
> [Severity: High]
> This is a pre-existing issue, but does the cooling device teardown have a
> race condition that could leave the fan stuck in debug (manual PWM) mode?
> 
> In qcom_ec_remove(), the driver turns off debug mode:
> 
> drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_remove() {
>     ...
>     qcom_ec_fan_debug_mode_off(ec_cdev);
>     ...
> }
> 
> However, since the thermal cooling device is managed by devres, it remains
> registered until after remove() completes. Can the thermal core invoke
> qcom_ec_fan_set_cur_state() during this window, which re-enables debug mode?
> 
> drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_fan_set_cur_state() {
>     ...
>     ret = qcom_ec_fan_write_pwm(ec_cdev, state);
>     ...
> }
> 

This one's tied to how the cooling device gets registered — devm was
specifically requested there during the initial driver review

> [Severity: Low]
> This is a pre-existing issue, but does qcom_ec_i2c_id_table violate the I2C
> subsystem API guidelines by using positional initializers?
> 
> drivers/platform/arm64/qcom-hamoa-ec.c:
> static const struct i2c_device_id qcom_ec_i2c_id_table[] = {
> 	{ "qcom-hamoa-ec", },
> 	{}
> };
> 
> The subsystem guidelines state that initialized arrays of type
> struct i2c_device_id must use named initializers.
> 

Yeah, I'll switch that to a named initializer instead of positional.

-- 
Best Regards,
Anvesh

