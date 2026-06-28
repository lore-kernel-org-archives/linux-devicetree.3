Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4723C28CF5D
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 17:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782667869; cv=none; b=HK/9iJv9283Q6P+CaUeji+cgMgO8WvN4jbuSdgmJW15BNrK2PKu8bo6a3uqMPmnvEL8LnjtxTJSw9+P9MokqCUM+Jpl0Qg2HNx6qr5bH4t5erqYcDOsYmb10rgiH4C/r7E/8qRZwv+1RvOfgKq/dveif92OQ0phjUeXA6E0aS+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782667869; c=relaxed/simple;
	bh=ZT4Oi48MQ2edPaWjW8khM1ET81+4j1v2TQ4M0MI6hX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7hqEtR3iLVzsrBDhkN6YcT54Kb+jnxbB31poeIk5UYh4DbWpwHRcYR92JBXmHjEUaxkGSsfrhI109DQIk1YQHoLcZXNmB43sKJTP1MD8NWzTM2p5LKrzed4ETOsOzUAdXnWDO4DRXlTEU25oZ74rcEeimjumFpx6ZcPCNhv5FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzVjkylx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ha8k3us2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzVjkylx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ha8k3us2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SET7Cc046368
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 17:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/LYGGwI5goWOdRY7GIiaFjBfkoZM/HlIDwQhWdcH2Ro=; b=NzVjkylxUjSWlaA4
	g03Tq7LAV2Yhm3AjQYZWm/oEjfM1/OvIFu7/0RbkV+K5MY8GVoELRGPrnkxclIFV
	cTuuQVXx1t2jrD+DSSPff1jpUChZyG+DsaZ5+XgeYObuDVxXLJyGa4ou7oUNM09X
	3N9r/nuPYEw/Piu7NUaakINNB0pvBtBdIir9P7MebKCZhIeF1oedKH5ljMsH8L9X
	YqozeKwYCVBe6J/4YeWiyVkFPms85ZVLFikjExrXM0Edsg1RLGiWOKRAXbs3GMcD
	WZ8/IZe7BlVyKBLaCSkiRc/w4zwqs2QJPCXsAYeNDdBJZ/rIBJx3kDxpEGfRoYU2
	5RAvvg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8kc6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 17:31:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e538afe65so4905485a.3
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 10:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782667864; x=1783272664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/LYGGwI5goWOdRY7GIiaFjBfkoZM/HlIDwQhWdcH2Ro=;
        b=ha8k3us2yjr7ofmbSD9rt3FfuEqUoVZURiuUlj6HDSX/WxNlTQyrget+R6/oDMGpbD
         yk7ujqPBBd5sRGpCleSMFrBvNVVHW4hLUlH4GD3UKTEGnrdOA9OmQOzVHCCT8m58xG2r
         XtL4Bbj9YDy2la+dpXzG4zjzwwXgWmuPJHvfjY8N7BlFDrHa8qOVi1WzZ6lCFfiJ6yA1
         8rC8J//QOK9MgKi9ZP1S2c6jMck9ukOEshtvCutw0/dbwo2h18r83y3r8xbN6C6Xw59t
         DdFeYprrVB+JR7OxZ8X3H+U7IWYE4bReGFRn4xLnPv0+EW7WMb6wt1BK86IimGnVQd62
         UgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782667864; x=1783272664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/LYGGwI5goWOdRY7GIiaFjBfkoZM/HlIDwQhWdcH2Ro=;
        b=GN2oMB5+/bG/u0DRQWeWPkPZZglaMAS9GdR54YoaD/XZurjo+6en62IPZswhSETuhr
         w8sIf+Mnb7kILc5hTTVc2jTfTqTuR7saXY2tF+XaDTJuNQauKqoFmLoJCiGBNtW34LhE
         43w4rhMKJ0JWRiNNWnQ4v4Py4T3z241XgdwMcgXB5DNZb+AYqicfvlWJcIs8WJ3uQXOn
         8bYzb0g0jEgMyYnNnPzXIt5gTVRfSw3/1bQmdwpfRB4Rvawy2pDVUEeUCz9jAUwROyWp
         zH9TcUlhT2WYLr9Ep3BouL5oG6mBwazc1uwedfZ/HTzepsse5zJSTcSU3yFb4VfAYLe+
         KPwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vO/tyUKrz974wj0ZUniV1SQ1aNzHgNydyK5wcPQF/m6XV6S3CsWRegG4PNNXk4bqhSqYMt07d5uKx@vger.kernel.org
X-Gm-Message-State: AOJu0YxOq2UaKh8CEyPralzZzEjmb+7hGbqQzPZGHuBfvz8LM3gGd2Yn
	jfQxZD8aD9V4UB3eeYu70OixLjzQNq6Z8ZVyittJ2zyTbB1n5J48PMaxDfGdvqIN1WHtXzUOx0R
	2d4GRIDToNWwh4bVrI3SSxcmT5HyLfGviRsCxiqULCtpgYf3s/azmSmERL3WZcFTU
X-Gm-Gg: AfdE7ckrlTQQhCs8x9TU6yZ/ByX5ShheB8CZ3kcrlclLxp25iun3z4U8hHvvqF3bsA8
	8h9XQlQGArWL2nxOZjHET9GMACBDxpq7TqvnSdLLbuNCkXAVj/ykD9I3dFHRRBLulYfez7ET1cZ
	3ZEB76WYxTEL55JGYK8KDzGoxohb6TZ6m351xkHMG0W/xp9bCUfM3mOKa8sbj/XyEcgcVAW+qvM
	Cqjx1wQ4B+HtJ1aF5fozIp6u9Sma5HCTGP9ZXVQByB9zofLJ+1PVU6qIoehBceVbnIKuJakVsRp
	YEJco3lqb9sQG71V4pwLXaKWmrDPprKE/PQDld+Gq9zLjGSHj6Qa3gf+b0fq0GXbHiW5fGcjzFW
	9TLPEzi1jBew4cATGimO3RBd4zKaf1Vvifs3oTJMB9N4zQDTUQ7v+mZ7rVTafE+8bUnw4bys=
X-Received: by 2002:a05:620a:4808:b0:915:7e22:6f1f with SMTP id af79cd13be357-9293a8a8bd6mr2058531885a.22.1782667864506;
        Sun, 28 Jun 2026 10:31:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4808:b0:915:7e22:6f1f with SMTP id af79cd13be357-9293a8a8bd6mr2058528285a.22.1782667863990;
        Sun, 28 Jun 2026 10:31:03 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:670:107a:d931:c86f? ([2a05:6e02:1041:c10:670:107a:d931:c86f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4932f100e4asm144355955e9.1.2026.06.28.10.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 10:31:03 -0700 (PDT)
Message-ID: <8e7a604a-4cd2-40ec-b1a1-ae5ac68c4189@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 19:31:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Sebastian Reichel <sre@kernel.org>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bryan.odonoghue@linaro.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
 <akEj6XEByCOkuJaY@venus>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <akEj6XEByCOkuJaY@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE1NiBTYWx0ZWRfXxzVGzKKhCer4
 vbj7Dtb5MJBxHVUgtQLLroZpRi86j32MBzPsZz2OvTRsv0UASY+KeJrqLgIsiplx2U9AvNnViaL
 IogOcogb09MlaZ/3iYSTd1nFaMihBGI=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a415a59 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=bjHr9k4kyxrlvEBRdikA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: H3_KAtJUCSC8MMErDO_QpvJRyWYqUk6y
X-Proofpoint-ORIG-GUID: H3_KAtJUCSC8MMErDO_QpvJRyWYqUk6y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE1NiBTYWx0ZWRfX3930HYqoUcIc
 97gkqPsmmPfyuk21AE+PahmM+4GX7SVEFn8uviur4GFdQwRu4LnlGuiLhI6uidFjtdp4mHq3wgz
 p7XL7Ta6l6rfUcmfrs2A0oMFdYCXQpkAo9zXspTyE8Jzzz0KFkGIxPerA8bwhW6ivAipRwLChuh
 sokPWk5GJYygkyAZBhnzb7bDzjcSCu4ydF7fCzKIQ9w0tzeHqnzMSrOo1a4K4Xu+SMyrN98QxUf
 3O8dF8rdW+MiWgn6n4Pn8BzUREUftaN2AzEz6rKO/Pl7KEJZCz+Eq6jWFEidAd6uFATVRuKxgUY
 sMXhiXnOrV9Bu7SGbPl5XZxAUjAwA4i1ZDkMI3lp5fXv7gkevzuWsxn9tHgPxkjDBOb45e4Gc3S
 mp2G9L7MgV++E/EhNtENUKyF0/aUuDFGYe7oxB1QTRc3ydSlWTwSBs85eNAxhYav66TJxHJntuq
 NpWqiCJc4/UhzvQu4zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280156

On 6/28/26 15:50, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Jun 24, 2026 at 11:08:23PM +0200, Daniel Lezcano wrote:
>> Expose the Lenovo ThinkPad T14s EC environmental sensors through
>> the hwmon subsystem.
>>
>> The driver now registers a hwmon device providing access to six EC
>> temperature sensors corresponding to the SoC, keyboard area, base
>> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
>> are exported to allow user space to identify each measurement.
>>
>> Additionally, expose the system fan speed by reading the fan RPM
>> registers from the embedded controller.
>>
>> This allows standard monitoring tools such as lm-sensors to report
>> platform temperatures and fan speed.
>>
>> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
>> ---
> 
> I gave this a try and for me the fan data is always 65535 (i.e. -1):
> 
> $ cat /sys/class/hwmon/hwmon66/{name,fan1_input}
> t14s_ec
> 65535

Strange, I have:

fan speed=0, temp=40000
fan speed=0, temp=41000
fan speed=0, temp=41000
fan speed=0, temp=43000
fan speed=0, temp=43000
fan speed=0, temp=44000
fan speed=0, temp=44000
fan speed=0, temp=45000
fan speed=0, temp=46000
fan speed=0, temp=46000
fan speed=65535, temp=48000
           ^^^
fan speed=1903, temp=48000
fan speed=2345, temp=49000
fan speed=2367, temp=49000
fan speed=2417, temp=50000
fan speed=2431, temp=50000
fan speed=2430, temp=51000
fan speed=2441, temp=51000
fan speed=2450, temp=52000
fan speed=2457, temp=52000
fan speed=2458, temp=53000
fan speed=2458, temp=53000
fan speed=2458, temp=54000
fan speed=2460, temp=54000
fan speed=2572, temp=55000
fan speed=2788, temp=55000
fan speed=3009, temp=55000
fan speed=3229, temp=56000
fan speed=3424, temp=56000
fan speed=3610, temp=56000
fan speed=3631, temp=56000
fan speed=3597, temp=56000
fan speed=3594, temp=56000
fan speed=3592, temp=56000
fan speed=3592, temp=56000
fan speed=3588, temp=56000
fan speed=3588, temp=56000
fan speed=3594, temp=56000
fan speed=3594, temp=56000
fan speed=3597, temp=56000
fan speed=3597, temp=56000
fan speed=3594, temp=56000
fan speed=3597, temp=55000
fan speed=3594, temp=55000
fan speed=3594, temp=55000
fan speed=3592, temp=55000
fan speed=3592, temp=54000
fan speed=3588, temp=54000
fan speed=3592, temp=53000
fan speed=3590, temp=53000
fan speed=3592, temp=52000
fan speed=3590, temp=52000
fan speed=3588, temp=52000
fan speed=3588, temp=52000


> This is with the fan running:
> 
> $ cat /sys/class/hwmon/hwmon57/{name,fan1_input}
> fan-controller
> 2564

