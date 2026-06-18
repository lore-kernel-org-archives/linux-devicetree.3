Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDB93EE1DB
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791242; cv=none; b=WSdtVDHjGFYmGEKXoiBuOApP33/cPAlWej1oy4t1rNFJdyFQ/LkxobHpsmIQIclqEqNr06wuPM0bMXPIOKixbf2uTL+vRjxvUYhIT1tR7ZkgsESW+xXmvo0CS/e6yEgXtZlwTKnxP5ne82GmaZkzwZRmCCTzhOkaD1WuixJomCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791242; c=relaxed/simple;
	bh=9m9kUKtzlx7aPIOvj1jMWVnkjRGf74rrjTx+hbwYRsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GpirrePvUNczob0ThA/O9DRJVsb8/M5rLmQqVVgIQwqU01LEF92rotYTWFBWcokkjpF/FwSbatyPJXQn76yM5c/ukueAta6zaKnmAR8BufogpEXQUslVTRyDdJw1E3A7pd88THAX9V03OVKpRW2dBj689+jyHngEBQWIywik1Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=faKm31EY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eEt56tYz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="faKm31EY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eEt56tYz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IDrjCJ3009865
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 14:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UWc7TmHqNqNxyP/iYB/ehqVttOI55ybr69ddYW6Rkxs=; b=faKm31EY90HTLDiL
	s1Q31GLA3s2gnWzZfUhLbhB15e+E9DJX6ke3ccS1HpMBmJb9jCbOLEQ9eQfqXsGC
	sr5JynN2TH3/idEF2mqdEOK614EidIr3n+XBXJPG6v8icv8a8nBFFhRAfT58T76a
	4gxAtIMjGZMsLgVD6mDPsVHBdeiki1LnRU0C5v0z2fJpdvSidgrczTuAk7U7pRkQ
	xIvknQKQDxz0mgjNPern/vIc0ZpA4c61rlCk68z9gytE5yG4u8liDb3n5lHmscL6
	91xe3aLdDVYAYfIG1eI1zPd6YiX4Bc//GOfLbS1BhpFgEkVoBpSsQSI0d3lB6bSF
	Fhz5fg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evgtmga2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 14:00:40 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6605694a059so1868828d50.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 07:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781791240; x=1782396040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UWc7TmHqNqNxyP/iYB/ehqVttOI55ybr69ddYW6Rkxs=;
        b=eEt56tYzkhPK+kO77M1T7XAmj2IzkoJ0yyJCARNY2+FadTuOZWgd1zC01e/Blh08GC
         oSLf/XRem6YoTqhYlFOEJ3hcpmIEH8HbdKSYXWRqPw6jX6Ok2HMbGqwhmTSH0GjxwNtO
         LQNUVDffj7S0vGiENlchqD9zavyIO2LFG8kEYuSwFuehQxwJARHLK+gakO//7ShqxJPu
         ENrHcZbUB59gufmw/Vu81JM/XWQ4ru97sCwFv9IEm1WJO8qsUmXFnJH16qWdVbCPRHEW
         mubEZl6AddPDxM+Kwp/pG12jz8wmf7qKbnTvoTAmxR3yChPQ1/36J/yFuyViOWHBQl0a
         OsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781791240; x=1782396040;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UWc7TmHqNqNxyP/iYB/ehqVttOI55ybr69ddYW6Rkxs=;
        b=Rubw104hnIIIF/Nu+s1tMofL0WCloNNZQTHtxI4R3FdC4kx7SC/6Xh2e1w0Cy7x4LZ
         xPAXSExuFCXlJdSbT40idFC15b78vahULSzw/XYXPvP0Y9WKv3rZOYjL+tzBH26PtX4p
         5HI8uSgmX4/BeJgJKm7ssW67HNfxvMmxRzwH1PD0VzHfpcmTXexfFShrNC7bOq4Z7dw7
         CoQFCb+CMs45enY8orZpuFv7FrP/oi+t0vmttRYKoW26GWA6vT/NVlLFyecIUS2mWH1E
         VRSS/W9kal870dtC8HsJCWDctGugZO6ZaGRe2ihKKKRfNvmzweVNwbmmGg5v/r6PXimJ
         eIWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+e7aCi+CaysBpxCRoeIPVTuT77c8Sb/2r1JoZZC9kiwr/msvx2VWsV2qPpzoazI0e/TqAHndN3fq4K@vger.kernel.org
X-Gm-Message-State: AOJu0YzarwreWXMGhBRGCJJpUYtr9AOMQj8wGjcXB313+nD04wQv6/5u
	iByXS5ke0BOFQzO/rXIsTX+CmSknt9JPkFcTULlYG8tawQS28iMqP7A42qAn7TKrpIrQmSV7As1
	5yJSGudR8nJxMtpVG19HnPSNo9NUQlCzzNKKL0TtYKq5PhSc0CpT0wUCU3Uv7uhvZ
X-Gm-Gg: AfdE7cn8N/qnCUTmbSsDVMms83R3KaUIr38L7Ma/cbR0C7jkcGeZUdlmtFpbYK1A/NO
	+B9AoWp6/NZjYZmww9XlAVoQ3Sl+98NkiP60odF6WbNNnWggTOhS2iJwFnRPB3NGyLHSguy/8sj
	XbdKOmnrxgGxHJ2UbnRjpGq9aRG+698Hbvd2wk4HHF3o94XKKZetMJ844oiLcElZpEXr5grFHNd
	w/Odxlf1VFR00k5kGzI2g+OdoLrQvklwdhgcVXjjnqpjJlt3PO+jUYEMq4ythS+KwNdZ/AJiT9O
	zydtxAGf8o5VZoN9rU1pvfj51Jzy50vzuu0V5UMPe11WYhkvD0IWvGrdlBTSbjZm6ul/61dwpbu
	/hzRefiaCywTuTx0Bsc+zXmljD54C63Bug8REq8xQyPBysC3ZDVbLzPMuZLCNG9XF+ipC0OdMti
	0=
X-Received: by 2002:a05:690e:1906:b0:662:f227:6230 with SMTP id 956f58d0204a3-662f227730amr1966322d50.18.1781791239444;
        Thu, 18 Jun 2026 07:00:39 -0700 (PDT)
X-Received: by 2002:a05:690e:1906:b0:662:f227:6230 with SMTP id 956f58d0204a3-662f227730amr1966229d50.18.1781791238551;
        Thu, 18 Jun 2026 07:00:38 -0700 (PDT)
Received: from [10.111.165.239] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66274e2b181sm12345595d50.15.2026.06.18.07.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 07:00:37 -0700 (PDT)
Message-ID: <7c25faea-7e86-43d5-9aff-2bf6f609e311@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:00:32 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: og0va1b: Add OmniVision OG0VA1B camera
 sensor
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
 <20260618-og0va1b-v1-2-dda71bb83009@oss.qualcomm.com>
 <1a57863c-831a-411c-a0ae-da3d4f1fd6a0@linaro.org>
 <226a55a6-babd-47ce-b261-35b982d5c7db@oss.qualcomm.com>
 <178178854034.861173.9780571180496261859@ping.linuxembedded.co.uk>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <178178854034.861173.9780571180496261859@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fyAgsU_nwzuDz22Erz1AaIIoXr4FOR84
X-Proofpoint-ORIG-GUID: fyAgsU_nwzuDz22Erz1AaIIoXr4FOR84
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyOSBTYWx0ZWRfXyhowonWsKjJ8
 cyoSezHVZ5Gnl/D/4VXQuI294VPsdEE/CpNes6W3h4WsNhDKrgui+l1NrMQ4jcGuQKz1mliqZ78
 z4c9TWALgIybhtLlIey+CcaYBy6FTuwdPdcNQ3zQMWC5gNBs574lKUIYk2lK7NDoigTReFBYwj2
 yCQJM/EcmopGG6xjDp/+LYS5uKA2b3Vs/89EcHdIR2tu1d7oPCY3Kvy9t9Ww3kxKl1cA2MaJV5a
 0dNzkIAgk/s0pxJUzojeJ0tyKVFc4gr894NkS644ipibiJf0TgXk8BCxdd7fOwJXLzpRO1HPM2R
 bHwzhZXI7JbwXCSKXit1yHp5xXmwjcUC2iM//rrtVzHK3Vp2ZGT3ReD3MgL7T3lhZTVrB0Ugp31
 zDf1+39N5+sGwCxpu1SI0iBUlXH1+n4d7zyjOudz2EfSeE/GH93+rCJLTrdD8Ggs7+K1blqSQjz
 zjiKr6PTBLwW6I8XT9Q==
X-Authority-Analysis: v=2.4 cv=Qb9WeMbv c=1 sm=1 tr=0 ts=6a33fa08 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=VsaXS-_fMXfK9Rll_5QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyOSBTYWx0ZWRfX7laBiRxr7q11
 RwuDOttLFZSEVm58aOqegZcJkkLtKVKpnRGABtd9AHGoH2v/dT/8fK7KFsxmgR9h345xA2hhh0Y
 GNAqNkseBbuKxb0nZnzNh1AkUhgwx9o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180129



On 6/18/2026 9:15 PM, Kieran Bingham wrote:
> Quoting Wenmeng Liu (2026-06-18 13:36:27)
>>
>>
>> On 6/18/2026 6:50 PM, Vladimir Zapolskiy wrote:
>>> Hello Wenmeng.
>>>
>>> On 6/18/26 13:37, Wenmeng Liu wrote:
>>>> Add V4L2 sub device driver for OmniVision OG0VA1B image sensor.
>>>> OmniVision OG0VA1B is an image sensor, which produces frames in 10-bit
>>>> raw output format (Y10) over a 1-lane MIPI CSI-2 interface and supports
>>>> the 640x480 (VGA) resolution.
>>>>
>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>> ---
>>>>    MAINTAINERS                 |   1 +
>>>>    drivers/media/i2c/Kconfig   |  10 +
>>>>    drivers/media/i2c/Makefile  |   1 +
>>>>    drivers/media/i2c/og0va1b.c | 867 ++++++++++++++++++++++++++++++++++
>>>> ++++++++++
>>>>    4 files changed, 879 insertions(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index
>>>> 5aa846c8479b20651291d5bd2e316308310f826c..85a06eb9eacc410a565b80d56979eaa565515d0e 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -19891,6 +19891,7 @@ M:    Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>>    L:    linux-media@vger.kernel.org
>>>>    S:    Maintained
>>>>    F:    Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml
>>>> +F:    drivers/media/i2c/og0va1b.c
>>>>    OMNIVISION OG0VE1B SENSOR DRIVER
>>>>    M:    Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>>> index
>>>> 5d173e0ecf424f2f204f8d426be818e44357f8e4..56680772f5f47b4629c4e17f5a5feba08b1d94fc 100644
>>>> --- a/drivers/media/i2c/Kconfig
>>>> +++ b/drivers/media/i2c/Kconfig
>>>> @@ -363,6 +363,16 @@ config VIDEO_OG01A1B
>>>>          To compile this driver as a module, choose M here: the
>>>>          module will be called og01a1b.
>>>> +config VIDEO_OG0VA1B
>>>> +    tristate "OmniVision OG0VA1B sensor support"
>>>> +    select V4L2_CCI_I2C
>>>> +    help
>>>> +      This is a Video4Linux2 sensor driver for the OmniVision
>>>> +      OG0VA1B camera.
>>>> +
>>>> +      To compile this driver as a module, choose M here: the
>>>> +      module will be called og0va1b.
>>>> +
>>>>    config VIDEO_OG0VE1B
>>>>        tristate "OmniVision OG0VE1B sensor support"
>>>>        select V4L2_CCI_I2C
>>>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>>>> index
>>>> e45359efe0e41e13e3c0869e5ead7d6cf4aca3a7..c60851c7fe07e3bdc511c5f482525ba7a044f48e 100644
>>>> --- a/drivers/media/i2c/Makefile
>>>> +++ b/drivers/media/i2c/Makefile
>>>> @@ -83,6 +83,7 @@ obj-$(CONFIG_VIDEO_MT9V011) += mt9v011.o
>>>>    obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
>>>>    obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
>>>>    obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
>>>> +obj-$(CONFIG_VIDEO_OG0VA1B) += og0va1b.o
>>>>    obj-$(CONFIG_VIDEO_OG0VE1B) += og0ve1b.o
>>>>    obj-$(CONFIG_VIDEO_OS05B10) += os05b10.o
>>>>    obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>>>> diff --git a/drivers/media/i2c/og0va1b.c b/drivers/media/i2c/og0va1b.c
>>>> new file mode 100644
>>>> index
>>>> 0000000000000000000000000000000000000000..f0505b7ba7f329ad57ffafa8f90a24204f002d3c
>>>> --- /dev/null
>>>> +++ b/drivers/media/i2c/og0va1b.c
>>>> @@ -0,0 +1,867 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * OmniVision OG0VA1B Camera Sensor Driver
>>>> + *
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries
>>>> + */
>>>> +
>>>> +#include <linux/clk.h>
>>>> +#include <linux/delay.h>
>>>> +#include <linux/gpio/consumer.h>
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/pm_runtime.h>
>>>> +#include <linux/regulator/consumer.h>
>>>> +
>>>> +#include <media/v4l2-cci.h>
>>>> +#include <media/v4l2-ctrls.h>
>>>> +#include <media/v4l2-device.h>
>>>> +#include <media/v4l2-fwnode.h>
>>>> +#include <media/v4l2-subdev.h>
>>>> +
>>>> +#define OG0VA1B_REG_CHIP_ID        CCI_REG16(0x300a)
>>>> +#define OG0VA1B_CHIP_ID            0xC756
>>>
>>> This is the same chip id as of the OG0VE1B sensor device.
>>>
>>> What's the difference between these two sensors, and do you find it
>>> possible
>>> to add support of OG0VA1B sensor/modes into OG0VE1B sensor driver? Or is
>>> it just the same device?
>>>
>>> Hardware specifics described in dt changes also does not show a difference
>>> in comparison to ovti,og0ve1b.yaml.
>>>
>>
>>
>> Hi Vladimir,
>>
>>
>> Both OG0VE1B and OG0VA1B belong to the same OmniVision VGA monochrome
>> sensor family. They share the same resolution, power rails, reset GPIO
>> behavior and power management framework.
>>
>> But they are different:
>> OG0VE1B:  8-bit RAW, lower FPS
>> OG0VA1B: 10-bit RAW, higher FPS
>> and some registers are not same.
> 
> Can you identify which registers are not the same?
> 
For example, regarding the CHIP_ID,
OG0VE1B is 0xc75645, while OG0VA1B is 0xc75641, including the test 
pattern registers.
Since I do not have the specification for OG0VE1B, I cannot perform a 
detailed comparison. However, based on the current observations, OG0VA1B 
can be integrated into the OG0VE1B driver.

> Mapping between 8bit and 10 bit or different frame rates could easily be
> managed in a single driver with exposing different capabilities based on
> the variant.
> 
> We should really work towards reducing the huge duplication that is
> happening with copy/paste sensor drivers.

Indeed, will do so.

Thanks,
Wenmeng


