Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233575;
	b=CpoKS6bPbL4e87BrvrDARcIdxGlKrPRSaxENqTCk9uPAHzG6bjWRNb9WwRCg+0kGpKfA
	 uYU0oSDlJZyfvRyHSNmDYgzQLrJSvU8sKUuQqQbm8iUdofPHmfb3VlOLAeMIHeSYmrYxP
	 Xh29DvWwAnN7SonfgVixPKWqwGqjtVigxJOEwf3namDbUDx20MEnR9grICyojvktTv8ny
	 iPw2dDrpdbio4Wv/eERB0bQx6utDYU522VSWGVK+EIqHFMXnepGItfTAHFF7vzymUg/pE
	 dqp44qwbCbJNy4A+Vyvsn2l//sNikjnE5Qu9i4cYSOJcev+KqczRr9AIeR/a6UIWOvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233575;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Uz8j/5ipZtwfQQUYQ+aW/z8tSUvToqrz9ei9hJvoW18=;
	b=EKP8kDwnF4ZL8WHPmzFV28rZ9B6CMgvcBpFLkZ2RJwCBaVvLQGPdmK4EsvYpEiFoB8e7
	 OAhkAuZprr254CASey8j7wK7ydftUR+Yyw4TGL/hvhL3cPzEuwnfSah/vOcQ5QxjUKg/6
	 ndbqzMzzFxTH00W8ew5TTZJN5e8kQ+BmkpCl5fg+8tzsFqM1oT4PwoAvZWmuGL5a2z217
	 3XASUecrSq8dU9lZIapUMaTJZ8SCCsaFxn+GwgqOJ4EsW81UCt6MJ+N9y0pF/FXqlOHvP
	 rruFAMV+EhyfvrJ/bEVA2lPJqkZh8tK7uiDUg6/72JrsyG6Jw0USDu/SD85/u2/T7Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b7bf1Oh7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVnOQOkD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8B9606D807
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 14:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A8B9606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b7bf1Oh7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVnOQOkD
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFDVJ022892
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 14:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uz8j/5ipZtwfQQUYQ+aW/z8tSUvToqrz9ei9hJvoW18=; b=b7bf1Oh7IQsoIVX6
	A9bTlRfFlN9+11ut6kbR4bLZ+BEtSBQC3OSJAQfj9nm2dB2OUIo77CYvyRPW1KSo
	8/JG2XtlngOsTyqDAX9UQAHSoNSr3gz0i20O5d1+iBHYN6POSI1CBtVt2JPEh6E8
	vwrnnHFribo92Td0weaceLKPykVdboLdEku5RxJVlNSsGIqctv5e8RNEWKFZNtwj
	M5y5ytR9Z9ES+FmEaHz1wb/1x5xjSg5v9nRUIkDBxBlt+1kOGmKTBor9WdblJHnE
	kc9sa27v3xN4SL8p9UHqrpjHOtUxanaX5fW7YHlYmddU7GuJG58u2128nXwJTHr9
	g4Kdbw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydgnfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 14:12:54 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2c5352d1eso28103137.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794233573; x=1794838373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uz8j/5ipZtwfQQUYQ+aW/z8tSUvToqrz9ei9hJvoW18=;
        b=BVnOQOkD2SGC0naeR9MrSEHmz6m261/eVmhm+NZAzvYp/drSQwAE6icUfhZTQsBZh3
         o4T47MecBTjwd1Prdppogsqit+X4Rc3eaoZAhee86nQthAo8Y5YRQjfUh3Xa4rDE0JUO
         bYHW3LIUq5I0m67/IQ63u2fCaGCtIn9z+4rxUZh4tqP9KhCSrmtG7IE72sgxYkKgky9x
         yUq5E2BOhecFlht5IndTfR2rgP29WQ0nRzd3t2OfVfobMTZpv4FOaLS3UM7FQyCfb/K6
         PJ/5wMAmvqJlUnDU7fJF5ZqXcz/a7SmH8w95bVHRRl860RciCNXvsxesoVQsYfvfj8xl
         ap1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233573; x=1794838373;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uz8j/5ipZtwfQQUYQ+aW/z8tSUvToqrz9ei9hJvoW18=;
        b=k0YQzS4hWkKQSP3ZkcMkxjxvB5KxGElycYbomhHA3UGMQ1fN47Oq7HDweWQ4JTn/3O
         vRZEKIT7Bo3z/TFAMhcRBf4r+A5E1bK/Tvjkexf8XIy9AQjVVKsnwWrCBhCe0TZvoPy6
         B3sWHvpSwekQa/MenWkn2szvVl7qDM3VryjowbsPmqDhtdmqX0GWZWa3AEYedM/7ByOS
         4tYqXvZ6hLDtdvyqSmhXPq+8Xfw4crW4Ja1T3wmGftRANfjKtY/zjlDjk7re5vPK/iwG
         IyUgwh/mE28nUa2iUOQEIvc6HinG53zmn27USNkWS09U7WJmxVUfK85UFHF+HEyJG4Xc
         C/lA==
X-Forwarded-Encrypted: i=1; AL+hErEKr/e76D3us8aqos87u5x1GfvuCWoDEaVn7QlKdogyGHgYe/Ncq3wm7c65cEe0F9AOZtEsTR2dmpUZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+fKsjSVb3GcsnYObV0Qd7LMeH3Ql+bxao9NLl7aox3owvbuZ7I
	QAuyMuGOVxaNvr59dLwp0ZxsjhHqXFqAh2XmqaTuNK2h2RCSbETkaRCFwVarBLwRQPGypGzj1ST
	L7OsptY053j15uoapsdxUxpHyh3jIl9/ow5xWTmJpbxGpUDvkMHdHrngKDrLW05V/
X-Gm-Gg: AYBFou0bkBRN62IJJ+sVJBRCiSBTc5qmJAPMCnoqDsL/w/q+oTGXkwQlKU/at/Ebj8w
	1WkSPKHno53gBkecKt9XawLYvRry2BR/rVxU6wlKnoh4Xkfcn/GiAZheE8ulenl8d78aRV8/EQC
	axgqPDcqvJyPK+nSzn9udErzzJ4I9i8sghBxd9h6aDuuKKpwdhrgO6TwiORNTeT9q4wFogoPj4W
	ASxk009Gcn0DKbmy5vpNNDEUaDnyorFdhN45KmPcXuW6bAQxWmylzZtHmldQBAgbbrJJwDZCHea
	YJFjAuZNvnMRiLoYBboLB3nxUfamtU8fYMH47Ak3GQdDEdhsttwbf6p18pJPU3+K4d8XTMIwMgt
	d6q+HrZjgHC8Vs1mmyW5gDRo8HQZBangGDVXpncR3w/X78Lupj5u822695hrdAjdvLm06fg==
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr982130137.3.1794233573574;
        Mon, 09 Nov 2026 06:12:53 -0800 (PST)
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr982104137.3.1794233573125;
        Mon, 09 Nov 2026 06:12:53 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea56f2sm1736102a12.8.2026.11.09.06.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:12:52 -0800 (PST)
Message-ID: <08a43e54-6f54-489d-9ba7-6cfc6eb173c4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:12:49 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform: arm64: Add HP OmniBook 5 16 embedded
 controller driver
To: Rahul Pon <theflyingrahul@gmail.com>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109104914.1534-1-theflyingrahul@gmail.com>
 <20261109104914.1534-3-theflyingrahul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109104914.1534-3-theflyingrahul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfXwKLLZUlblMAy
 nduIswmPvuGu/OofF6yVBRi9W44R1CzsNNhd4gqm8lf3ygDNNfe4pwiL8H3yPkpe2Cki19M+wsm
 LFv6XtevBlGDb5q+rOucfP1nZnbl4Bk=
X-Proofpoint-GUID: 8VMHqYnW7yeJjj-rB60rcEj6VV4L_PnG
X-Proofpoint-ORIG-GUID: 8VMHqYnW7yeJjj-rB60rcEj6VV4L_PnG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX+Fc9hScPMFEN
 5ZqNbk3bPucsumb9Oc9UX3QJ6jrTa8KF6a9gBN67J8Ua3erOLdJmJtS5Wi7kIOUqziIH+ZUsTbg
 25Axd7srZmwU3Y66kPkmjlKFJ76CCzV6kaoHsbtH+TqEKFzrw7KPUNmSzJ+o6U8Hc2ZVadYmjKk
 ck+oHLfFkhmjKNEI35wM/pKPuqPcdbysaWJNWEFzjJC975gBbjPRdd/4qcJbwOEZYySiT7pT1P4
 GuJTkK7zA20NytQbISp33OTP/XVilp+ii8sYG4CH/TD6TLhgbZgCI1LeFevTFOBpoqextAbr4pF
 PuvThoWuFlHBCoGGf9ED0i4dekdihV4q3IbczD+3TM+CrI1ozJdAcd6NUI5EikcL7WCFAcngslv
 /uv7TE38+aj22rI2ZiXW+64ap0iL45F7jNO+YfhhOBrQQsu8Hp+ZsgKBuNd2GHtxQlKngbxIWv6
 WLi46YsXSK/AiezG0XA==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1d4e6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=0yDvZPlJ0jkY2xphDlwA:9 a=QEXdDO2ut3YA:10 a=KfD-mh6vjfoA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090056

On 11/9/26 11:49 AM, Rahul Pon wrote:
> The embedded controller of the HP OmniBook 5 16 (Snapdragon X2) sits on
> I2C at address 0x76 and takes commands through a mailbox: wait for an
> idle status (0xef), write the command and sub-command (0xed), wait for
> completion, then read the 32-byte reply (0xee). Its interrupt line
> signals events, read from register 0x00 and acknowledged by writing 0
> back, as HP's ACPI does.

[...]

> +What:		/sys/bus/i2c/devices/<bus>-0076/kbd_backlight_level
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	Rahul Pon <theflyingrahul@gmail.com>
> +Description:
> +		(RO) The keyboard backlight level of the HP OmniBook 5 16:
> +		0 (off), 1 or 2. Only the backlight key changes it, inside the
> +		embedded controller. The attribute is notified when the EC
> +		reports a change.

That's already reported in <led_subdevice_path>/brightness

[...]


> +static enum led_brightness hpec_led_get(struct led_classdev *cdev)
> +{
> +	struct hpec_led *led = container_of(cdev, struct hpec_led, cdev);
> +	u8 reply[HPEC_REPLY_LEN];
> +
> +	if (hpec_command(led->ec, HPEC_LED, HPEC_LED_GET, reply))
> +		return LED_OFF;
> +
> +	return (reply[1] >> (led->index - hpec_leds[0].index)) & 1;

"& 1" -> "& BIT(0)"

Konrad
