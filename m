Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DA1403E81
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 08:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499939; cv=none; b=URAdPdSGH53OvZ3q2A8y4baiM5Z71d4h18HNbD5HPWoJdPBo5pyvlkqzik0+5Mhd3x0xZ2tgev/0g6pWvr47No7Ui9qQgJsujFsXILP/MBmKkl7FAmxVTLOZFhrasz5RNKS9hH4Ihb563/T2lCaYI7Fkw7c1kE0Wqz0qzAqEoUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499939; c=relaxed/simple;
	bh=bgB4zWzbm5nPnDgRkckzv5MlzAsLHswlLS4WHPbWaB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uwCBix3hmmuipcBqm+v3NP/Pv5z+GWbq9OouGW3ThlawBUq5tvKaoDmxJUBZxrR5qcsYPaN3nzSveb1R5oQ5s3pAxDyZKo7B9dVYDN0kLaTAVfp9uUm0PL1Z7KDsnT6uQ3aGksL7ZWy/Ubtalk/4qAAKa20oz5poGW+ZEWg7cj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DerzV+u2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpaLE8KK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DerzV+u2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OpaLE8KK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668895FJ2070552
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 08:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GZt4yKJAJwIgvmsdUsVQCiNImI+HU9ORBaWda9zrk+o=; b=DerzV+u2wiT66Lh3
	OsswmCwM5fUK3oTANpYnlSvRZl2YitbN8Q/LveY4SFP39eRkc7uQX6DG/19qYZlI
	gXym09chIOTAAsDTMQ2dk//HTanp0rcAFm/5l1vQETmsttx03RLKHoKhmvWa4Nf3
	+L1DOj0DbBJ7mIZwVcjl4gGM9i9hx1oKW30gNa1w+42e6DB4boppobf+JULRRKh5
	9fdaHLtM+H+DjpFQoavXDkY4EryyakPVe7AdwpYleYyR9dahKNQSaoTPjim0sc2W
	CsM4Ld0XZ4d+FgHrjc0JXe9GV72FJB+jibLysEt7nuNYX+ZOoEV0wabJZ/qxiZ6J
	eX8JFQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be59s6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:38:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so9836961cf.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 01:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783499933; x=1784104733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GZt4yKJAJwIgvmsdUsVQCiNImI+HU9ORBaWda9zrk+o=;
        b=OpaLE8KKdqV1L1TRgDYPoJOumjUHR82AAEc5VljF5XpTa5riC39x390CYZh0doHMzh
         iXwbFAmV5YJmmnuEbExvkcaS+SAEWhFuP23UiAwv+Kkzf8Nn90/2G9cjZWjWj++d87ay
         nWalCNKD2TRM2LeJ1psLMpWITUIM6x/gOnZ6Ue0ybQ8CVfzijXxvf3YDSUpHnyDR/GvL
         dYuy9OjE/dGXvYvQiX+ysfWGSMwbN6KwdcCpjTQzQYVOk5UHx/2Z5rDANIwkA9sSSuQQ
         EY5WrpSISddJlYdHlQz7K8UXw7TfJ/YGr2ep7k7YyvsYNefXFT0eBxuIB8p/OGCQfF/a
         x2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499933; x=1784104733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZt4yKJAJwIgvmsdUsVQCiNImI+HU9ORBaWda9zrk+o=;
        b=kwbovPsHZrsNd/G5rzx5btfuKqBjldtony6+btKYbcDF1U+odgwq9x1NSz+7BMMJ5H
         +Sv0S5kkJ3H1uRrqLU6zVPrQ/o/jwwble2z8exDcNZnNouDWQ1pA+xMXB2aKEsfL2uSD
         4tCePf3T33xmVuFtagMkpb10gnSca3UvtA1VQMg8a7M4gYWVskgAVLgTUVnNCt6G2aAr
         IjvjvDtJP0s/qkC1BHO5kUNqt60pqqNHbSOY6zCpVZp6Yb7SYTkZARl8ax7N+hv0mEd4
         qUwd6WrJzYFHreJn2KUxiFuw/VP/FAOJQyGLvyuoz1vAjtEj3ZP6Hs8NU1xsARn0X2TM
         evMQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSxoCeToskmRiB0SZ/hlBTL//1J9RgK6m7X11dUDYL4iy/sHwp0XwvLCK4+OELD9TZONbAApUh1kAD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3onpa0KfeoIvre3xkVMINmJZj808jMaOmC6U3TYPzKglQHaC0
	ojfipebZxR93GmndE0/FHrW0vaGPjzsGWXdZn2gaLRG8HzgYKd+G9bQ8uxu4FN+oPzVQ4bPk2f/
	kMnEo8Sb7a60JOS1osRLNuLHNgNRRwfxHvMTUDCXNzHBkpCRr7/P7EHgjXPI0IaOl
X-Gm-Gg: AfdE7cnYAh8mhfIyRl4Ff7vN/W6J9aWqKmGLWmPA8xGNDxbnkTmmMb3d4Nx8vf7HMGx
	vPKSk1gRlEZ+Yuup0YAQKDBdS9HwgRUMwWnLpqOjjTUO8917kY8676WqJ0CjNmZ+buq94zeEIQt
	w/xYngJLccXmT05xgZ7PvvjLG9PRgXFfhs1oCXUsaJwAnMG+a+nK0Z2UBRGOi9rO3vpRqJsgQjr
	OwQRctmgbhuCFYgOhRGW/Ddv0Gyau9d2VjZyyWYWKgYhujTCTb5ymXN4NXx4vorkils6k6HejGo
	tZgKfM1jabhQwW0DznxCVn+g3EUv+dgkc9RmFdjY93UxL/dzHAc9EWXwYBmunK2Z2Y7QooxnFWJ
	QEu/nTTPdOgJGBTh4hvBZVO8fuy2/fUY5D02yS+kq3KpN
X-Received: by 2002:ac8:5d92:0:b0:517:875a:d634 with SMTP id d75a77b69052e-51c8b39fac2mr16427681cf.2.1783499933092;
        Wed, 08 Jul 2026 01:38:53 -0700 (PDT)
X-Received: by 2002:ac8:5d92:0:b0:517:875a:d634 with SMTP id d75a77b69052e-51c8b39fac2mr16427361cf.2.1783499932643;
        Wed, 08 Jul 2026 01:38:52 -0700 (PDT)
Received: from [10.111.138.111] ([212.136.9.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb482f7sm278181466b.59.2026.07.08.01.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 01:38:51 -0700 (PDT)
Message-ID: <ac9c6ace-31f1-4bd5-9d81-ec850179e85b@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 10:38:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <20260707192228.14647-3-daniel.lezcano@oss.qualcomm.com>
 <20260708-wakeful-cyan-caribou-35fd09@quoll>
 <bba69f4b-9a09-4e9e-98c7-3833924131eb@oss.qualcomm.com>
 <c2e5e168-bc94-4b17-87e6-8974bb83be3e@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <c2e5e168-bc94-4b17-87e6-8974bb83be3e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e0c9e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=kc99uptPwIIcf-mWtqsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA4MiBTYWx0ZWRfXz8gaPYEWZzju
 hY9gLe2h89vLoH8I7NJsS80ttchDXEw205SFPJjNVI0XXNWpU44nHWGu77ynAQsgoy7snFjlqLu
 gkt7MqRa/ZdbctoraycomaMqrWKNnIo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA4MiBTYWx0ZWRfX5MYLc8axW61q
 pB6TyEedQ0+LkwhgbPs0aQ2Omr4AqJn3iuJxBsb9UD3pu2dUdwvn/WwwfrFIUaL1UkE6UdTSg3b
 rIm22RUjdzB3oR+po3x8xaqtnsuiXkrWtuAsdYRtaiQKca0qCng4TZlvtEiC9iE9GIF0BzpNVG8
 KpQH54mglJyEZmf+yJoT7USTlq7qCY01c0VvF8yA4weilJmYpwXYMqE4M8YMMQBpxh5vkfDUUM7
 aYrBuMTSo6L17+wZLWfhvh80y5rN83WUBC04G7FIarLsGcZmWQ6Sucl+xUP3vv6VM+hqO0LZ0y/
 mHMqH5m1qiEmWdgaM3CX6TS8hcpQ+5A/+cvkf29fUzpMFRkRMB9NhEXYYjsYniemW0185JLJZOs
 C6cEzssEico3turU1Ew7UzbNNzNAZIy/24CAIcjAWffnXqnfCR/2IjImk30hAQNpIuXw0W0xiPo
 f/Txq0Bx3Kec3OY4r7Q==
X-Proofpoint-ORIG-GUID: Rgdt6OyG4kufqcYqX-OWPepHmAR7FJ9p
X-Proofpoint-GUID: Rgdt6OyG4kufqcYqX-OWPepHmAR7FJ9p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080082



Le 08/07/2026 à 10:24, Krzysztof Kozlowski a écrit :
> On 08/07/2026 09:31, Daniel Lezcano wrote:
>> On 7/8/26 08:30, Krzysztof Kozlowski wrote:
>>> On Tue, Jul 07, 2026 at 09:22:27PM +0200, Daniel Lezcano wrote:
>>>> +static const struct hwmon_ops t14s_ec_hwmon_ops = {
>>>> +	.is_visible = t14s_ec_hwmon_is_visible,
>>>> +	.read = t14s_ec_hwmon_read,
>>>> +	.read_string = t14s_ec_hwmon_read_string,
>>>> +};
>>>> +
>>>> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
>>>> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>>>> +	HWMON_CHANNEL_INFO(temp,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL,
>>>> +			   HWMON_T_INPUT | HWMON_T_LABEL),
>>>> +	NULL
>>>> +};
>>>> +
>>>> +static const struct hwmon_chip_info t14s_ec_chip_info = {
>>>> +	.ops = &t14s_ec_hwmon_ops,
>>>> +	.info = t14s_ec_hwmon_info,
>>>> +};
>>>> +
>>>> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
>>>> +{
>>>> +	struct device *dev;
>>>> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
>>>> +		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
>>>> +		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
>>>> +		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
>>>> +		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
>>>> +		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
>>>> +		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
>>>> +	};
>>>> +
>>>> +	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
>>>> +						     ARRAY_SIZE(sys_thermx),
>>>> +						     sizeof(sys_thermx[0]), GFP_KERNEL);
>>>> +	if (!ec->ec_hwmon.sys_thermx)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
>>>> +						   &t14s_ec_chip_info, NULL);
>>>
>>> Last time I commented this looks like actual ABI break. You did not respond to
>>> that, so I assume my finding was right, thus:
>>> 1. binding is not correct (although driver should be fixed, not binding)
>>> 2. the code still breaks users
>>
>> Sorry I misunderstood it was a question expecting an answer but an
>> affirmation.
>>
>> By ABI break do you mean:
> 
> Existing ABI contract is changed in an incompatible way, which has
> observable effects as below:
>>
>>    * new driver with old DT will fail ?
> 
> ^^^ this one.

When we are incrementally adding features to a platform and like here 
reverse engineering the device protocol of the EC. It is difficult to 
give a complete bindings as we are discovering things little by little. 
How to prevent handling all versions in the code when providing 
iterative completion in the bindings ?

Is it possible to have something like sysfs?
	Documentation/ABI/[testing|stable|removed|obsolete]

but for DT bindings ?


