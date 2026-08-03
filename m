Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E142571A0
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 02:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785725597; cv=none; b=oCkTP567QVm7KD1eTJqMYf7shKiRO7k3YNt+zQ3D7mzllSJPJRmNMjghR6JAZAYv50wlXuIIOS1TYjPgeX0/eoNbFyV13MEDcnIl8V2U1AmAPo2SPl7qGDyOy9A8YCYIN2F3D5+m/q/Rl25+tmRKgj4LO+ZsU4Bg/1T79np4q4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785725597; c=relaxed/simple;
	bh=Jd0gGTF1r8/smhAh2U3ccCZiQAn4LFxUrjCS0JZ2zPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rqB2cT9eGNv69W1247c2jnEzkbcsYRdVvdW7UC2qk6CzzpXoghld4Ism1XkRLVNUhOKC1X5UQxwJWrE6dqzKHYbTg2N9P2MEZ2lanuX3mIpOKk11rNI1NDalOk/qkvI8eLKmVvcARje0xYPSpePAwFBoVDr4OE2m1pM+I8J7PUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gatzqbvx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P7b7AFFM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gatzqbvx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P7b7AFFM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LVUql3960150
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 02:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqHCtmr4Lfm5m6BXJFpQhucXY3PYw33feq7uNoMpcM0=; b=gatzqbvxzGZPRN+B
	obYckOZP8TPQoXpuSf+3O8xvPFtcxDe1QqxEe8CtNA4XACnElk6KWHBdVLUAxAKP
	WUpEQUcjeog4+c5b2zs+/b9eJOUf8zXwgLrRXG6un8/o4fqEPdgi8OBGj0bsE5ur
	rMRnM1Q3sy59trklr8clinJkBiieuaNgYH4gkZBzRxD9R0E470mctRt2WDSnItib
	SKbuH2qws794KwJTikgbIO4XnVGmRZGzmM4U5PXjlsZfLhRGNluKAwkfdv/PKINz
	Oezt6JfuF4wLgftydFCgGt//iA34pskQOk3eBdTJ46dZaI9dOiqzPjPrBrsNbC9a
	Dotijw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fah0q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:53:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-526da7e3c9dso25050741cf.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 19:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785725594; x=1786330394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IqHCtmr4Lfm5m6BXJFpQhucXY3PYw33feq7uNoMpcM0=;
        b=P7b7AFFMEYjazXUFExX60+xAho+rFHTcrbEW3Z/Iguu+6A8gzOF0CI37IITOojpbvF
         T9TgMfgZUEQXs4YaxLr1k5eHPCKNPGKMbS264KzKb3d2iSWVvMhGkP+AOYZHdFsbEz6R
         8C0hwrxGuL98Q+is5vwUstgKCruwZ5/4SwS/GTMH+Q8FDc2rVNiwx61dgqWYVIPDAzPN
         N/0tuSYX8AxD5V9wuocdgeK5T26y0R6SNUyW04VchOQCadtsWReeDqTD5aMZMEgVnEBF
         OJi8jtvejuIRy3kRVro+apWBN5JRjWaXQ6cTL3sMMyNLycpBAe2p4Hi+TRHggAhfYgnt
         ZWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785725594; x=1786330394;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IqHCtmr4Lfm5m6BXJFpQhucXY3PYw33feq7uNoMpcM0=;
        b=ikkzrhsyli/9w9x4ykrQHCjbWSvPKf84Bvrf5SZFY20IWaSvhWJHTkytYLDh8o2UV1
         A0D9/9TlBVmpy0/xHZD6FEsXF9OKyG9+7qWOTWg7xbMwJqg9WnXkyI29PZ3ooxUmsRJS
         SUdUFwoh5BHz20ykvbRoqFsCeT/t24IwZ2fVFeGQ7nmgw+UBirpoN9UXqmLabexq5/Ym
         y/bns/9uL7lOFpOELEVKKniecw3q6JdT8NUWAThiGzdCgfIaXBBhfCZ2moUmJlS9d2G6
         u1Wr576DlYf9tiZTjzUvvoA2lXWUdi8VgSiWNyODXzAdssynSN0lKYDKJqqIIEKJIAHQ
         F8Vw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3z4kTztw1bHyMIKyMetIYQ4Awv5/7aoEArtk6XYMl3EkvWelyBlQzg+l4Cane8wT+kxqLr7n0lUCB@vger.kernel.org
X-Gm-Message-State: AOJu0YzqcBANEXpoLxB87cp/Wnm3YTmLY/SXo+CiZFsYZDyuyapnWZdu
	jIlxervnzFGonPQYNVTYDbItoM9c5ABCwLDXZJAPpsHeJqhiDk6XF7iFd8qUgooimCux+pFL7WX
	cYebxiPHfAlPITtQvZO99G5vuDMZ8EgZTyhL06ryEehgZuBD1X1U+kKXvkwTlkcVR2aLdUde0
X-Gm-Gg: AR+sD13egykPWyd6nl1rOE4GuCaBGY8qf13FPaqw5p5h+fmBas58HLDfaBsC760ZBtR
	M8As3GQDNR5xKyLalEyNVlEhIZoA6GqK2LRzk55F9Psp/oHzTcnwUMgtvois3sMyO/5qU6Dl0wB
	O2JM91yETwxGF+oJP6TaAdeME4VwBQ+F4EfpdYXUke2qH6+NjeZ4OdRxCxjgXn5QIm3WJQ9YHcT
	96XdBWJUyaVXcj/fkNdWUPsedMJ/kaeeGH5lBUTI0aUjjwr2m+UU3Ys5mne/mbZTgY9zgbB1pU0
	E8EFfOwQ5NGv11A8I38BMt4CZtRj9ARuulP3XueypdKXvpCD5RlTTwxfB0payY9FyZNvXLxiH7I
	tKba83QkiTECCT5eY/kimWrraObr+lygVbFUCDSAna1FrpLO06rXB5JoMDoEHQIGZ
X-Received: by 2002:ac8:58c5:0:b0:51b:fd82:22e0 with SMTP id d75a77b69052e-52b5669dfcdmr167436611cf.3.1785725594155;
        Sun, 02 Aug 2026 19:53:14 -0700 (PDT)
X-Received: by 2002:ac8:58c5:0:b0:51b:fd82:22e0 with SMTP id d75a77b69052e-52b5669dfcdmr167436401cf.3.1785725593712;
        Sun, 02 Aug 2026 19:53:13 -0700 (PDT)
Received: from [10.111.175.212] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52b4e64df9bsm52836071cf.0.2026.08.02.19.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 19:53:12 -0700 (PDT)
Message-ID: <dafbe3cb-ad4b-4c4c-b04a-9b83fbcf2e5e@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 10:53:07 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: Add Samsung S5KJN5 image sensor driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260724-sk5jn5-v2-0-871d3b9a2e47@oss.qualcomm.com>
 <20260724-sk5jn5-v2-2-871d3b9a2e47@oss.qualcomm.com>
 <2b5753f2-d5f4-4957-b865-f06b842af3de@linaro.org>
 <d5f579a7-b04b-4feb-8d6f-ae6e76e51f60@oss.qualcomm.com>
 <2fcdea3f-8588-40b6-9686-52756dd19d26@linaro.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <2fcdea3f-8588-40b6-9686-52756dd19d26@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a70029b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=q9XwjWH3Ny9uqe8eLJsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: LTd4Hj8x6hGkuXDph29VUqVs9zAYm39W
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyMSBTYWx0ZWRfXxJST5JVJlKuV
 x5A/lUbwHCzW+Bvg9oUNOvZ3/wlk9vNdxQkIVJRTwipdwFNNPBadpfv7HOacHqUXR0SrdU7+ROe
 taFlUDYjV2tfwbSUK641u3++hEb5e18=
X-Proofpoint-ORIG-GUID: LTd4Hj8x6hGkuXDph29VUqVs9zAYm39W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyMSBTYWx0ZWRfX8NvsEtca/+3t
 3iEN2R2hYJ+TlEcE9bfk3dWQn3fQNfJNYMI0yglOWXfqZdCRYPar9lqr2rbBP2e1X/k3bQ2N+Hz
 Ed+wogNImwzozBPKb96oUkD4N3rrnsh7ric4I0YS7RO0+AgmaeTLQRVjGiG6ZTe7PfQSDgmnx9T
 Wa22CB9hvuo33otip5wkMuOWw3Aqg6PFyJxYnC4MEAbMUln2SxwcXHAchmTPVh28Cwr2LTVEUOT
 MFInJZeFh7z3geRqJMnxsD72C3t/fpn6e1XyEvv3vj/hLcNWyUlnP2RLV/QfDgETb4I9eA5jKIk
 m9ImxiNQVZX5ubZPSYMcSClxYlxU2J8az+645UZC/f5tj83yJ9XIw9sTXEEa6LPu2rr9PIVmkBO
 K4zI0pqO6uQ8FaKfHkAZDRnfpe1VjmCpHHjFr3JkjQK9mmAoaYtWtrMKycZu2zyC2zurCU5dpsG
 WdbptCevT/QPEQek0ZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030021



On 8/1/2026 1:39 AM, Vladimir Zapolskiy wrote:
> Hi Wenmeng,
> 
> On 7/31/26 11:24, Wenmeng Liu wrote:
>>
>> Hi Vladimir,
>> On 7/25/2026 3:22 PM, Vladimir Zapolskiy wrote:
>>> Hi Wenmeng.
>>>
>>> On 7/24/26 12:50, Wenmeng Liu wrote:
>>>> Add a V4L2 sub-device driver for the Samsung S5KJN5, a 50 MP GBRG 
>>>> 10-bit
>>>
>>> I believe "GBRG" detalization here will be incorrect, if you consider 
>>> image
>>> flips or odd crops.
>>>
>>>> RAW MIPI CSI-2 image sensor. The driver supports the 4096x3072 mode and
>>>> exposes the standard controls (exposure, gain, vblank/hblank, test
>>>> pattern).
>>>>
>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>> ---
>>>>    MAINTAINERS                |    1 +
>>>>    drivers/media/i2c/Kconfig  |   11 +
>>>>    drivers/media/i2c/Makefile |    1 +
>>>>    drivers/media/i2c/s5kjn5.c | 2835 ++++++++++++++++++++++++++++++++++
>>>> ++++++++++
>>>>    4 files changed, 2848 insertions(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index
>>>> 244c7ed5872aa0972a7b055d7e0b19d530820a08..6f6edae5de13efc0cda6c91ab8c9a40bfe2cbff9 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -24195,6 +24195,7 @@ M:    Wenmeng Liu 
>>>> <wenmeng.liu@oss.qualcomm.com>
>>>>    L:    linux-media@vger.kernel.org
>>>>    S:    Supported
>>>>    F:    Documentation/devicetree/bindings/media/i2c/ 
>>>> samsung,s5kjn5.yaml
>>>> +F:    drivers/media/i2c/s5kjn5.c
>>>>    SAMSUNG S5P Security SubSystem (SSS) DRIVER
>>>>    M:    Krzysztof Kozlowski <krzk@kernel.org>
>>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>>> index
>>>> 7ffccba897ae5637bd0cb913e1e04f9c7d0c89f5..06b5dbc32cab328df8d10da04d91a708bff6fdda 100644
>>>> --- a/drivers/media/i2c/Kconfig
>>>> +++ b/drivers/media/i2c/Kconfig
>>>> @@ -824,6 +824,17 @@ config VIDEO_S5KJN1
>>>>          To compile this driver as a module, choose M here: the
>>>>          module will be called s5kjn1.
>>>> +config VIDEO_S5KJN5
>>>> +    tristate "Samsung S5KJN5 sensor support"
>>>> +    depends on GPIOLIB
>>>> +    select V4L2_CCI_I2C
>>>> +    help
>>>> +      This is a V4L2 sensor driver for Samsung S5KJN5 50MP GBRG
>>>
>>> Same comment as above, I believe "GBRG" should be either removed or
>>> generalized to "Bayer" or "raw".
>>>
>>>> +      10-bit RAW MIPI CSI-2 camera sensor.
>>>> +
>>>> +      To compile this driver as a module, choose M here: the
>>>> +      module will be called s5kjn5.
>>>> +
>>>>    config VIDEO_T4KA3
>>>>        tristate "Toshiba T4KA3 sensor support"
>>>>        depends on ACPI || COMPILE_TEST
>>>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>>>> index
>>>> d04bd5724552e88fc2ad39f9bbaf9b4ce1763939..45019ce20a6c34c8139b8247b6904c3abb1a8fe7 100644
>>>> --- a/drivers/media/i2c/Makefile
>>>> +++ b/drivers/media/i2c/Makefile
>>>> @@ -133,6 +133,7 @@ obj-$(CONFIG_VIDEO_S5K3M5) += s5k3m5.o
>>>>    obj-$(CONFIG_VIDEO_S5K5BAF) += s5k5baf.o
>>>>    obj-$(CONFIG_VIDEO_S5K6A3) += s5k6a3.o
>>>>    obj-$(CONFIG_VIDEO_S5KJN1) += s5kjn1.o
>>>> +obj-$(CONFIG_VIDEO_S5KJN5) += s5kjn5.o
>>>>    obj-$(CONFIG_VIDEO_SAA6588) += saa6588.o
>>>>    obj-$(CONFIG_VIDEO_SAA6752HS) += saa6752hs.o
>>>>    obj-$(CONFIG_VIDEO_SAA7110) += saa7110.o
>>>> diff --git a/drivers/media/i2c/s5kjn5.c b/drivers/media/i2c/s5kjn5.c
>>>> new file mode 100644
>>>> index
>>>> 0000000000000000000000000000000000000000..865db808aabcf7d910acbdab8126b9fa308ef875
>>>> --- /dev/null
>>>> +++ b/drivers/media/i2c/s5kjn5.c
>>>> @@ -0,0 +1,2835 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Samsung S5KJN5 50 MP GBRG 10-bit RAW MIPI CSI-2 sensor driver
>>>
>>> Same comment as above.
>>>
>>>> + *
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries
>>>> + */
>>>> +
>>>> +#include <linux/clk.h>
>>>> +#include <linux/delay.h>
>>>> +#include <linux/gpio/consumer.h>
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/pm_runtime.h>
>>>> +#include <linux/regmap.h>
>>>> +#include <linux/regulator/consumer.h>
>>>> +#include <media/v4l2-cci.h>
>>>> +#include <media/v4l2-ctrls.h>
>>>> +#include <media/v4l2-device.h>
>>>
>>> Let me ask, which interface or declaration from media/v4l2-ctrls.h
>>> is used in the driver? I have a feeling that it's unused.
>>>
>>
>> It is required. The driver call many interfaces form it, like
>> v4l2_ctrl_new_int_menu/__v4l2_ctrl_handler_setup...
> 
> my bad, I stopped at media/v4l2-device.h above, and my question is about
> this media/v4l2-device.h header actually, can you please double check,
> if the driver uses anything from that header or not?
> 
> I wrongly copied a definitely used media/v4l2-ctrls.h to my question,
> it was not my intention, sorry.
> 

Yes, you're right. This header file is unnecessary. Thanks for catching 
that. I'll fix it in the next version.

Thanks,
wenmeng



