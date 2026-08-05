Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCB8377AA2
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 14:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939645; cv=none; b=WLU4Oy2M8y92UvqqlVVb2qjh13bKDpfZdI3e7r+G9RuDzEFvstikfEJ9Ms11/yUi+aoQOvngIYaEGUHWyiTCdSiB6iEGH2UqX6+pjZpZBZLRgO/uVQg+X+3a3PrqmG1KMcRytQG1Kkub8OTqDb5XT+JkT5gGYmv9lM/RplROpG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939645; c=relaxed/simple;
	bh=4Y0tFjjA0/7z8h3f3x8tgdl7HewpEz7kO9BZNVLeTik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzKQgHe3M8OH6F+TQhtw5ew0rg0BHCboXd/GA/Jp4swxpc+mEwQEq8fEsAlcghniw5HYjk1lktNnuh7H8BqMM2z+e9PyXkg45Z24yRrY3qMuy8RP8ofSBWmZB9nJ3xq8cgqql8oHwIt1oP6ZK5wu7u8ON9tLUA3xbnybpElEKck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIUOaSr2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDx7GHUU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIUOaSr2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDx7GHUU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Bvg422824203
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 14:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sFnhszp0nvBl6qh+eKSVvt6CGsw40dTVojjJ48+8wsU=; b=XIUOaSr220OU6sEl
	oFqJscrEwmf8fskI08lCvteTcLYJ8X2usLIbEo6VRpP0o9sWfD0VjnrW1xIyHKhY
	4HiN/eHN/DLAxAMWw3yn2UZfhB5TOxD9PoI4dmZxIdphBUYGqyFuDyR8vKLbJSYA
	+Wtwu3LOnaBBqiGIXXC/6RwYmCxkM23JFMe/JDH3LNOHauhY4KRjZUy3eQd49B9f
	+3+FXznM6DRuvZNENfeAT3nAIdixJpzKTVsUnItaH/uJfDgvHWfH7vurOnehHnOo
	NeswxPM2bJD8JHPaN35PlcStAjdTZ/Tvvg0ktbJ5ApzfmcakKI940KjHpura1yT7
	T7nn9Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv2c098b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 14:20:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so1093390a91.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 07:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785939637; x=1786544437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sFnhszp0nvBl6qh+eKSVvt6CGsw40dTVojjJ48+8wsU=;
        b=CDx7GHUUm4YQgDSbIL50Rm2X0POe+Ka5roonbt7Qfx269wbVM910URsUnLYtid6uVY
         we+iZ2ir9zO7JUyhk7mH9KVncK9XFsXF20CdV0Ym422I/IBMxvAnQffdzfVltbfOy8z8
         RR3HxNfeJ6fRLn9plFIUicklfZPCp93gDoZkDcXBr/sZzMBmQOL6vijD+h74snYYcTrE
         1GUzsetFBEGCUzqVDZj/UxixATxPNRzC4yEMkmKtniN/X+rpiuTOSwsNV0DKs4LViYgJ
         QGolJmnKxgvl2QgGFoU0cdB0XRxyb62QXstYWwmUli864t2noJeWneV6zVjs7/O1geaX
         IGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785939637; x=1786544437;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFnhszp0nvBl6qh+eKSVvt6CGsw40dTVojjJ48+8wsU=;
        b=aLhbtSoUQ2KP9ptEZPEusOGrPHVcx4o2kZ4qaVgcRKon6lGMvE0S+70ZxYE5+r1xNX
         fDeGZMJgc04BiWpJ979L1FvN1GWjhu2Su4HPpofGVUZWrl3JV61ewXgCSvfA9Gzq5aAv
         Cl/OjTHq/XrfGaUg938EOkUJC1qnslG5GL3hDTIFYf1nfSSTlgwXAe8+tDCK/HbHDyp5
         ZpVjetOH4Z3M+XXLOdm5FxPcRYUc8xoYoAGShfr3GKACzJl7lK7uKGXZR/fgrJZ9aFyC
         5Xca+kWKCiAT4oDNtjYKSheMx5IsueHY1FvhJfH2To5rADzA3XejDtsbYMGB1kg9dJEW
         Y3uA==
X-Forwarded-Encrypted: i=1; AHgh+RofuiEnzAj14QmnDdlgDugoJyVpsTd5ynP2sWeo01cO9ZCUN3TpMBLjkpB46QeAecB7SynkCFmZR3xA@vger.kernel.org
X-Gm-Message-State: AOJu0YzvV3S5tcIhEf09yXFvhVBVEJxQMtJLHGmOew4NMynrtcvTnbN7
	Ogc4gvL878q+CZT6lM01gtLh8pDZNhk2nYlOvZn5ge7z/WgRlKWhci2QyHMgAY4rGyGCulncftr
	As4ZOfViArEP67qUguVZqHuZ78vJPMlMYwlegWr00YYq8/aRW9tsgvaMhHGnIt7djfHmsfPPN
X-Gm-Gg: AR+sD12joV9zTVkUGh7SgrC2zxopTdzI0pmCRJM9ygglj+wcGnp15dqBvNcJINccYBX
	yDvYQdH/so53d2LER5E1j5tLtVt7AlTgBZj2XI2uSiLuSzLTbWSfQvNgwBbrCp+Tw17+Pq9eyD9
	0jmmIm89o3S3+TF4XLeZKV1Z+RqqfiqIhorwffIgCJyrhI56HL/TKvHmM/+W65auUyO521xy3IY
	6sy8GhcJCefIzDW79HxMu0XZwZipijiKvC59jzv9Vc4vlE73onS9naiL3eHmz991XD0RCoiFBN3
	iFT+rqYrme2PhamvNaYEvLzBdVo/i+SELkVgEs2urUbVbPQD8Xm8Nq78984AjlpmW0OpK8iUh59
	6Z2UvRzQW514tRMQNPRdCpNU=
X-Received: by 2002:a17:90a:e707:b0:38e:5ce1:ae30 with SMTP id 98e67ed59e1d1-3903c65f978mr2895118a91.14.1785939637203;
        Wed, 05 Aug 2026 07:20:37 -0700 (PDT)
X-Received: by 2002:a17:90a:e707:b0:38e:5ce1:ae30 with SMTP id 98e67ed59e1d1-3903c65f978mr2895082a91.14.1785939636705;
        Wed, 05 Aug 2026 07:20:36 -0700 (PDT)
Received: from [192.168.1.6] ([171.76.80.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38feda512f3sm4894793a91.11.2026.08.05.07.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 07:20:35 -0700 (PDT)
Message-ID: <188cf07c-2b37-4079-885b-d1a675bb6328@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 19:50:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] platform: arm64: qcom-hamoa-ec: Verify required I2C
 adapter functionality
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-5-771abd65ee1a@oss.qualcomm.com>
 <20260728181442.A7CDC1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260728181442.A7CDC1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ArxMyB0EOqn5gHpQWktWGAqx3qV1ODqq
X-Authority-Analysis: v=2.4 cv=aOfAb79m c=1 sm=1 tr=0 ts=6a7346b6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=UcsMPGGDBby+oECK+wqMZw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=CFGf0PpD_GUA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8FJe9Coq-pJ3FNODzwIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExNSBTYWx0ZWRfX+faF7KKQjyGX
 QiqAt+NvRarV/NnlNy1+wCuoL6DNXBuogNQpF+zbLatSVb/M+G2er9swU/XYX73321eFnX7XKY4
 QfeqRUiaRS4QK2Y9sj65r9mNkXx/dZY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExNSBTYWx0ZWRfX7/NIBsVGfP9J
 eNcUiYIIi3Wb6m16e2wIWb64a7XY9WZaB2jEWLGH0FHIyRtW2aUwGDXcyatJUIvf1EQsZ9gbwP4
 HAR4Vr9XPvqxcXsXUc/9qwpHJZAoUQvLJQSV1r5Dmw0RXsg1QAcOAyPQ9fkuhqEoheocsdq3gHP
 1BVP0XOxg3gI0UyprO4rb3olGad6Z7QeW62SRE7O28vgjO8PsuFW+wCcPCD20S6T+YymNkS86yL
 DDoksyUwCuA398bCI3N5W8fSYhj9b27aGoVYIdldECphcECzih5jpm9kMq55eaPm5LliqpvGl+Q
 jEt95BDNsUn5Vb9NElMPkTR7reG0oyRqdzV6aE+tNZVs+MJWIDjj6SiF/OkiXIjy4UQgOoapEKG
 R5Cw/PboTFY3xGv3ulA2fn6BbHn5WS77shq5VS3RbUXT/8taLqSmSRQyT/2jvb37xv0lz9xVzwz
 1ZWiKNGU2UxApnZECtw==
X-Proofpoint-GUID: ArxMyB0EOqn5gHpQWktWGAqx3qV1ODqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050115



On 7/28/2026 11:44 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The IRQ handler is requested and SCI events are enabled before the `ec->ec_cdev` array is allocated, creating a race condition that can lead to a NULL pointer dereference during `qcom_ec_probe()`.
> --
> 
> --- Patch [5]: [PATCH 5/8] platform: arm64: qcom-hamoa-ec: Verify required I2C adapter functionality ---
> commit a6f49e31946f2ee0f2b44aae1db005b085a4d77b
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> platform: arm64: qcom-hamoa-ec: Verify required I2C adapter functionality
> 
> Check the underlying I2C adapter supports both the raw I2C transfers
> used by the fan RPM/LUT commands and the SMBus byte and block-write
> transfers used by the other EC commands, and fail probe early with a
> clear error if it doesn't.
> 
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> index d0c45d9970eee..a420a180a1948 100644
>> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>> @@ -1195,6 +1195,11 @@ static int qcom_ec_probe(struct i2c_client *client)
>>  	unsigned int i;
>>  	int ret;
>>  
>> +	if (!i2c_check_functionality(client->adapter,
>> +				     I2C_FUNC_I2C | I2C_FUNC_SMBUS_BYTE_DATA |
>> +				     I2C_FUNC_SMBUS_WRITE_I2C_BLOCK))
>> +		return -EOPNOTSUPP;
>> +
>>  	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
>>  	if (!ec)
>>  		return -ENOMEM;
> [Severity: High]
> Could this regression result in a race condition where the interrupt handler is
> requested and sci events are enabled before the ec->ec_cdev array is
> allocated?
> 
> If an interrupt fires immediately after devm_request_threaded_irq() and
> qcom_ec_sci_evt_control(dev, true) enable it, the handler could execute:
> 
> drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_irq()
>   -> qcom_ec_restore_fan_state()
>     -> queues ec->fan_calib_work
> 
> The asynchronous workqueue function would then run:
> 
> drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_fan_calib_work_fn() {
>     ...
>     ret = qcom_ec_fan_calibrate(ec, &ec->ec_cdev[i]);
>     ...
> }
> 
> If devm_kcalloc() hasn't yet allocated the ec->ec_cdev array later in
> qcom_ec_probe(), couldn't this cause a null pointer dereference when
> qcom_ec_fan_calibrate() accesses ec_cdev->parent_dev?
>

I'll move the ec_cdev allocation earlier in probe, before the IRQ is
requested and SCI events are enabled, so there's no window for the
handler to fire before it's ready.

-- 
Best Regards,
Anvesh

