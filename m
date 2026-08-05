Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6282D46EC69
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935534; cv=none; b=QEADNMjOdkkS6LQ8JdrdG9xAcUBOQVk5eZ13h8tqj3fhKce0OS7VJSoYjtpDI9tQbEoLVLTUM8VjvdWNBbCnfSLoQG2s5yrYEPjQAsrjOJPfBLM6dFU2GA50mcdwiQEVHEqINqmLuS3+ka0GsEc37R5J9nZY4+O9IBgXO+hv2Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935534; c=relaxed/simple;
	bh=okRvk7wk8fiNFWabVPZLEc+avP6ZTexalVgCnz4QZrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BzNwlePqAnl23q0XPnsSlIQ+9ytaViq2w3KpS9ZHTaDFDNYGlu69jIIGeLW0j9KASfXKtC0MfHhRcZIpXCaGAD2wu471Ri6e+0GjNyRlY1Gxcto577WcWZem/aX3FEqF2891/r4tOT3FPysdCN0gVd/yzxG4sCqK4HlfhVFIAyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXqflGcE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQ540sOC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXqflGcE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQ540sOC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675CfoFV3472142
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 13:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNMW/HTyYhx6wnj5ciNM1Y5FyT7dUxK1xbeA5F1WQHQ=; b=cXqflGcEqucJ9kH5
	kWph1JUc457N1Cgcpj2AsKoiO7EYtjQqh4zzc1g8EfuJvyD+oTklvKnQYtyAO8sc
	nUxLEmS7G//fCTxSTOm/W61s/rYoM8YX1DgIgiUrdMEhUi7l/av8A5NTFF/Jc/J7
	fSyOX2T/RFeZDeqLztDdY24uy3Ck6NpbfK5iWMBkxKC0WjcCm7U4ipGUwmlbQOkJ
	lNWHrIqYPJY7UpTOsE+TCX5GT+Akub2adFC7uzdrHAtGQf4HkXeqk/jdaQBoEiZY
	TaoSGGZoEiWGBlNYtMRw6vKcyaWmDl0ZBoGBgIiEDcbY7W+HD3UXJAEzEdLpLRWm
	/jnZjQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5dk03wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:12:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso1452002a91.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785935532; x=1786540332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XNMW/HTyYhx6wnj5ciNM1Y5FyT7dUxK1xbeA5F1WQHQ=;
        b=OQ540sOCehC7u63xxuUqMy5XeY7ay58VxUz8lutjIWIYI6fgGy2OFBNr8CXDWqwT+W
         XEFa6X/rNGzDjXdImY28p208s9DPq92HHtdbF6eQL9+rr5/mjFfbWnhr2d4MrIVyL5AU
         sBYl1vBB/Oc5S4BC9D72yBnpQGYtR4C8btcKMrgBbvg/hOcKg0wWqewtVzK5X7meGC4N
         QFPZ2C6g5zycwkChc9t/iWZiTIdw4l0Hny/vSmrX7o+bdJxxcg0curRLUICoeZ2zGB8R
         g7OZYopDQniHj3Icx91TIkjUKHsxnyrMmbZ5ODSV8VOP3AQ4L0LKifdjHOSIOJ01Gdd+
         Q33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785935532; x=1786540332;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNMW/HTyYhx6wnj5ciNM1Y5FyT7dUxK1xbeA5F1WQHQ=;
        b=SF7zspuHhevqVc+5sDabuoaYC4ixYEY/Kfp91xKUY01/JY+3OwMmwrzQcRKeQu6ovu
         +vO5kmYmpISB7yB1wMK00CCjM9J/bFDxT+qz7D1jeGhusM9fn1GA5/R4tDvOcF9ham8i
         wihs+bkecPuBIQraZXZNhqF8fvQnDPdPuzUZp4kTElhmEhH1BpR/TNiTOsWqhX/c/OGg
         edX0BMuZ3UzqyJvYdJ6pag0xZPUipD4JvUxeLgsR+rRzUdv0eiCQYjoiagJp+ciWs1rK
         DshCTsaShxPC0V0Mzo8DJoVQVCSZX8/Ukx1e6GdviwoM48v2iZbZSc5d+kmL4aFSMOXR
         p2Jw==
X-Forwarded-Encrypted: i=1; AHgh+RrumNXnYs/Dv/MOTzUw3jezXMaojnAm8y7d129dnht/lBGB3urnYvTjSUvLE3CF0YRabEr1H+o2lmTo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr+0LLE/qrzmWxvd8zqdyXFOFS9RSpYnW6r1bcmKVDstXFFwgz
	GSm+rrPuI8F0GlyHrdQh9VY1wQKeDCgdU5IJHKBOIGTulmH32psm8hChpsH4lwyHVGqh+8GxmZA
	G3Ue9gigIySTixEFzOcDfiQ7DhKkYh4KMabiIYQUS3rCuA6SrKDsY32OY0SH9SSnI
X-Gm-Gg: AR+sD11uerxEbIt06G/T523evg9LmXNLYNRrtSz970Y7p5jIr/Nj+W4MXCVDht0mwX+
	7I4e9ccm3wDrOQkHGMqN2075tBShLFXmWOHSxE/ZDsoLvZf3msJNjU7MoCTz++IV4kgcZM39vmL
	DTBq68QxjAOPP9j4JMy5nYdqapYqsxe/WNRCGwhQ6eIeipR0nARPv1Yc0rd1Dfkx9ttep2R5mp8
	rZhUoRtZkmJTiABAuOyT12toM0gqiEfmR2iwZVruVzoFrswpt/Twp+gyItlpGv4LRl080kiTg/F
	mxJBgkRMz+dnG25tHowhMh6vs7CXq9jlS7Uc1SRocIx8F1KjoESf+vuon8KGUDmK+fegeqHWPye
	sjZ+EzKHTzixvzf4jZ3z44K4=
X-Received: by 2002:a17:90b:4a8b:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-3903c5d317fmr4871708a91.15.1785935531707;
        Wed, 05 Aug 2026 06:12:11 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8b:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-3903c5d317fmr4871633a91.15.1785935531069;
        Wed, 05 Aug 2026 06:12:11 -0700 (PDT)
Received: from [192.168.1.6] ([171.76.80.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fee06b438sm4798153a91.16.2026.08.05.06.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 06:12:10 -0700 (PDT)
Message-ID: <77111ce8-03bb-4b27-bc50-e2971f61e864@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 18:42:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] platform: arm64: qcom-hamoa-ec: Switch fan profile
 based on power supply state
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com>
 <20260728180503.AF4E11F000E9@smtp.kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260728180503.AF4E11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LldYcwhrvPCcxCoLNJ-v65g04H2Z8AeA
X-Authority-Analysis: v=2.4 cv=Or9/DS/t c=1 sm=1 tr=0 ts=6a7336ac cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=UcsMPGGDBby+oECK+wqMZw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CAxV0FKDwrwO14KtjZUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwNiBTYWx0ZWRfX11UoVkubk2qm
 8uKEu6HwOj9TyQMpzIg+7DR8JJGcxU1k7UZ/M0zF+kqIn08wXY5FiMR1sL/3eUKLGOCxEWVm1cm
 39VsdKcDGgFJxP04hu7BNYwttfziPyh/hrqbDVh8dmbi+VbByc7j54uU7DmIVg7ug8uyKOKSTGs
 V0yKViMABqnWVmhZnAsYRBbz6vmoCtfkHCWtDJg/fLmbAc5oL0UceX2r7E+544CHTAnvQieM8B4
 eENMylrsTs9QbiJYwkXi0I4OCBl+l2UQrTUw84qXud212t1C2yaudBdX5Crt2/SKf8HSieSSxqI
 GCVn/kFDbkiRnbcyxhx5a3QfuCoiEYi7Q/1ZeRHJCGSLipO0yuGXgjISDzyGovN74gJpRHq0PtB
 U/bBOpdsCsRAwBFcIYy0Zygviq3GTaujUv//Ze2d7DByww7Mt6ehMgF1Ua57zIQfaPbQxw3zfQ+
 eidpELwr2DnkZ69qCRw==
X-Proofpoint-GUID: LldYcwhrvPCcxCoLNJ-v65g04H2Z8AeA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwNiBTYWx0ZWRfX3iWn1eDUWPwn
 oBHXjtXqElnMzY3ChYORFP3oUtbMOl97CMWTE/essqldVpPg0uEPUnIvvccJjE9w1Q5t9HVzWqG
 s+n1KdNLsp/65Rl2nk+uOG/A6o2sI6U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050106



On 7/28/2026 11:35 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Missing synchronization for `psy_work` during suspend causes I2C transfers in standby state.
> - [Low] Missing Kconfig dependency on POWER_SUPPLY causes build failures.
> - [Low] Unused static function `qcom_ec_get_fan_profile` triggers compiler warnings.
> --
> 
> --- Patch [3]: [PATCH 3/8] platform: arm64: qcom-hamoa-ec: Switch fan profile based on power supply state ---
> commit 14490e0de249214f9c1b00a4aad8f89c2d05843e
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> platform: arm64: qcom-hamoa-ec: Switch fan profile based on power supply state
> 
> This commit adds EC command definitions and handlers to switch the EC fan
> profile. It registers a power supply notifier to track AC/battery state
> transitions and queues a work item to apply the corresponding fan profile.
> 
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> index 4c745b78322c4..f6ff77d4e8f69 100644
>> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> 
> [ ... ]
> 
>> @@ -351,6 +359,140 @@ static int qcom_ec_send_soc_tj_temp(struct qcom_ec *ec)
>>  	return ret;
>>  }
>>  
> 
> [ ... ]
> 
>> +static int qcom_ec_get_fan_profile(struct qcom_ec *ec, u8 *profile_id)
>> +{
>> +	int ret;
>> +
>> +	ret = i2c_smbus_read_byte_data(ec->client, EC_FAN_PROFILE_CMD);
> 
> [Severity: Low]
> Is this function called anywhere in the driver? It appears to be added
> but never used. 
> 
> Because it is static and lacks the __maybe_unused attribute, will this
> trigger a -Wunused-function compiler warning?
>

It's used in the very next patch of the series, looks like this was
flagged without factoring in the rest of the series.
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	*profile_id = (u8)ret & GENMASK(3, 0);
>> +
>> +	return 0;
>> +}
> 
> [ ... ]
> 
>> +static int qcom_ec_psy_notifier(struct notifier_block *nb,
>> +				unsigned long event, void *ptr)
>> +{
>> +	struct qcom_ec *ec = container_of(nb, struct qcom_ec, psy_nb);
>> +
>> +	if (event != PSY_EVENT_PROP_CHANGED)
>> +		return NOTIFY_DONE;
>> +
>> +	queue_work(system_long_wq, &ec->psy_work);
> 
> [Severity: High]
> Is it safe to leave this work item un-synchronized during suspend?
> 
> Looking at the suspend path, soc_tj_work is properly disabled before the EC
> enters modern standby, but psy_work is not:
> 
> qcom_ec_suspend() {
>     disable_delayed_work_sync(&ec->soc_tj_work);
> 
>     mutex_lock(&ec->io_lock);
>     ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
>                                     EC_MODERN_STANDBY_ENTER);
>     mutex_unlock(&ec->io_lock);
>     ...
> }
> 
> Since psy_work is queued on system_long_wq (which is not freezable), if a
> power supply event like an AC unplug occurs right before or during suspend,
> psy_work could execute concurrently with or after the EC is put into standby.
> 
> If the work runs, it sends the EC_FAN_PROFILE_CMD over I2C. Will this wake
> or corrupt the EC state, or potentially deadlock if the I2C controller has
> already suspended? 
> 
> Should psy_work be disabled during suspend as well?
>

I'll make sure psy_work is disabled around the standby-enter write too,
same as soc_tj_work.

>> +
>> +	return NOTIFY_OK;
>> +}
> 
> [ ... ]
> 
>> @@ -630,6 +777,17 @@ static int qcom_ec_probe(struct i2c_client *client)
>>  		}
>>  	}
>>  
>> +	ec->psy_nb.notifier_call = qcom_ec_psy_notifier;
>> +	ret = power_supply_reg_notifier(&ec->psy_nb);
> 
> [Severity: Low]
> Building without CONFIG_POWER_SUPPLY will lead to link errors here because
> power_supply_reg_notifier() and power_supply_unreg_notifier() are called
> unconditionally, but have no stub implementations in the power_supply.h
> header.
> 
> Does this driver need a Kconfig dependency on POWER_SUPPLY to prevent build
> failures?
>

I'll add a depends on POWER_SUPPLY line to the Kconfig entry.

>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to register power supply notifier\n");
>> +
>> +	ret = devm_add_action_or_reset(dev, qcom_ec_unreg_psy_notifier, &ec->psy_nb);
>> +	if (ret)
>> +		return ret;
>> +
>> +	qcom_ec_update_profile_from_power_supply(ec);
>> +
>>  	return 0;
>>  }
> 

-- 
Best Regards,
Anvesh

