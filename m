Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C75386429
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781786198; cv=none; b=YXY8cB6HIuSlkF6TU6HtrJH0nTuqrYPHeKZIgL+OsK13FNtCaEDqK3Vq7QF1q9U3LIShk3mXu7nTEK3GbP7Q4owSIgvVPvpqrxRTKjtllZCsgvL63CXRLzUpfoccPQ5ydGoxpDuJ34xFHS2YxWZJC0J36JB9Fu1Xc05/69mnaPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781786198; c=relaxed/simple;
	bh=K+0x3UrBGShhz8wCrdR54NiTLNqYO3w0UTI1bSEaIM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OI9s5Ua30WZiiMrt/2E5Qx7nvNRK6fBtcIQOvRlrRWLAEL67dtxLZgAFY9oFByWiv4YUa4QM0TitFrYKyyKAq4C+pr9UNmvi+y9+A3OBey/+S1jlV9fJGMZUTJ/pqcrHiJSWu89tgPi1l45bV5TwxFGUKuSOdzMz5cn41fHAPjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdJbdFXo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4P2QA36; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdJbdFXo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4P2QA36"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAreBk1054879
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tkVdR6Y285QvRNSr/VNZJ0GSaNwFXgkHm0HQbf9tgGU=; b=mdJbdFXo3hnbRguk
	RZ3ovdXwEe20SpX4nlDzAwxVrsdG7Accag0uXfJBIaGAx1i5fFOBdAyvnUsW7/FQ
	FlLt44/5TFigBDO/T9BvfTfLRC3nh3NyIW673vjTuhymJgc/LjFi6brIDQAjxMUE
	9JTNbQ50MwS+dyF7x+ixJT6olK31U+x10uSnMJTMiJcJThJ4BXnt0PY//FrmZnb6
	j0Ogb5IouehBonXtnld870ZWUXhI4stXYqybJF9lEwbrG1gWr3nLG21ZAGNFdbkZ
	YmjIsdi84yBVNWAfk4pIbptGkZk48XMNRSXwakzkz+6ow3vBSshVAQR8emPkzdGY
	Yt9bgw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2ccg3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:36:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51768072950so12382121cf.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781786194; x=1782390994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tkVdR6Y285QvRNSr/VNZJ0GSaNwFXgkHm0HQbf9tgGU=;
        b=Q4P2QA36/csfW0Rf/5nGYOvPzU1em4bIB8Zs3yG1hfPWoPBM8Btj0j8QXqqCaCYjd7
         ezlcRxmEgtvN56D+n1FG4n3dihbYxmEUelmMqrGsmboJdDUmC7k+czRpW51yQWdl8mb1
         f+QYCbdcDTvnCcYjoDMO03AXT/gdZ2sr2omwadNl44LiXGBPcIo3FUd4IKDUNaplWPrS
         VkUZlBchOWi/iH2yVucD4N+Op5DC92PZacdPC4jPYifXKMPfwKPmbaxv0Lf5GLeXUXfU
         HRAD2PHf8vybBMf2l3YoJEs+UoRKeK3WgMYlWPW4kQgIxc7i6uACPpWLfPF1k6ja8/zP
         JfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781786194; x=1782390994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkVdR6Y285QvRNSr/VNZJ0GSaNwFXgkHm0HQbf9tgGU=;
        b=djn7tU6k0CtoYAlTVdjvX/mxEXs8FJiGWYmYtxq3SqtA9Y2hqp6KidUYcGqAt9Onxn
         xqKaOIcphn6d+SAQPAxQcpN/HmMbmmbo5CQmzzX0Oi/Y0JKl7QA9ExWsJqSr+Svxb/9w
         MdlmMshovVzSqZraOKdEezDdyIYFNiGZhHyZ4EY3JVlF4HJut2h3qGIiJJnI3SYH0Wpd
         cYP93sYtLJolLeDp+/9qF6pNYef5AvxwlThBdXBLkSrmevuIFtHWkdnwmGpj3ka3J0ml
         nHjT0Gd5AeGwogTPhRVtnZ+UdlMPoFp9PkAcbL3fFoesKP+sdHsJYsuQbkLS4horIW1P
         5g3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8frYnn3hsY+Br5cTM5PxP9D01aQMPlwkqEsSzn38HFu9HdgyElqj2jRh17mS7dBjxTopffccXYOZ3Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ34cABI3Wo3O8MhBR11Tj4DBtqYxsWELjp6ElbxVn/YE84PNW
	HTBZobzPirrxKl7nR0ILBv5phgkexlqrR0gEgJ6lEIf3GNpmYaA3iD6NpU4yC09t3fUPMvfUVgE
	CfU227HxPoIOW5AKQuSX5QbzwnLsvr6LLzxkjMpPiROenROWgiQLuN+Bk68XzJLKl
X-Gm-Gg: AfdE7ckWhjuDLY6EG/Np6OfbHmA+kkGh31RMMkJvdFJYDPM+7UqO0zw2H1TUoHbbs9r
	Wanfc7suLwcnhlXkkxKyENK2HlwM9Sy8ccQllO2gWhQzpPIPgWqG4Nm3UMRQl0lc5tn+l0FLWIc
	L/bTAVHmoveTcpZI0v2fwE68PtsAfTAU4/abWx9D/7QC6/+2OFLRXCT5r1KJYrdAtBxyCe/C6aa
	A+UoDQqaxhLIYEbZMc5IaTg6YoPwgemJFJY8vyOvYkWaVEmBPKel512ybRCJWo0GeyG/LtCMTnR
	8XcJ97hK9wFrXn10L5qKUMInfXzweN40ei7wF0ezpFo8FuYm+IlyPt8xov9Hj2anzN/uuokygGr
	QPnBoJNkAsfmVWh9SGqHVf6JVzVd60uAIFXhnnMsv/6oCtyxlp4XsGFCWhZnd286Ob/RaneFILo
	o=
X-Received: by 2002:a05:622a:8f0b:b0:517:675f:3ee8 with SMTP id d75a77b69052e-519a8df0360mr119058901cf.12.1781786193873;
        Thu, 18 Jun 2026 05:36:33 -0700 (PDT)
X-Received: by 2002:a05:622a:8f0b:b0:517:675f:3ee8 with SMTP id d75a77b69052e-519a8df0360mr119058481cf.12.1781786193346;
        Thu, 18 Jun 2026 05:36:33 -0700 (PDT)
Received: from [10.111.165.239] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f4ff32a3sm96189716d6.36.2026.06.18.05.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 05:36:32 -0700 (PDT)
Message-ID: <226a55a6-babd-47ce-b261-35b982d5c7db@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 20:36:27 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: og0va1b: Add OmniVision OG0VA1B camera
 sensor
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
 <20260618-og0va1b-v1-2-dda71bb83009@oss.qualcomm.com>
 <1a57863c-831a-411c-a0ae-da3d4f1fd6a0@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <1a57863c-831a-411c-a0ae-da3d4f1fd6a0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDExNiBTYWx0ZWRfX0xhioIkaQ1rd
 PrsZHAUyZW6nI44RiAtT0c4eKeSPtPJSOQOEL71PoJtj01UOQ6DyoR62NgfOR5ygz3Uf0vzgQeE
 h1yrztt5oS10msohE/+RyCibny69LjNLtebmXpONIuWS0+l4dW3bgw53ODrUDZPZvXNgwtKIlwf
 6pf9eUIgS2Q7SWsfQmn1RGI4E5jRdjxPCAOxtuNJar0WtWNNOckEsP2338XYuh7FA1GOcAAr4Un
 3SY7vJ165Ap27BfAuAg0TBq7VOF14tiXyKiSvgX03SKkh5c5NDlKMWpoBEsG5jm2CtQWWfTWkmQ
 +89UGiSRzrqxKuOd0lDFPvkyUmXOhgHHEE9HtwRMF1hrFODIfdTOZa1eoeyt98YEehsNLnBg+v+
 wiuIDkEe1REvq8mCZ1dR5bGHH+f6dne4l2XS8W0rZ53UMeZEbkfvcCVCdovychtSMbrzD2JRE0h
 q52sTP2XlYL6jpW36sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDExNiBTYWx0ZWRfXxbOtc7u26Dax
 vSRejlSTZhx9T4CRiRFoMe1uZ+A4z6MOOaLyinxVl0OQNSleFdC9r3lsVfqnwKYW57R7rPKGrbi
 IbSjoOGh3OaAyc24CpCYizzvIHdbUhc=
X-Proofpoint-GUID: cgntlPRcvP_sQjZQtHhuK9BPf-Sb7LQY
X-Proofpoint-ORIG-GUID: cgntlPRcvP_sQjZQtHhuK9BPf-Sb7LQY
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a33e652 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=HvsU3PRRA2NteV8Xgf4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180116



On 6/18/2026 6:50 PM, Vladimir Zapolskiy wrote:
> Hello Wenmeng.
> 
> On 6/18/26 13:37, Wenmeng Liu wrote:
>> Add V4L2 sub device driver for OmniVision OG0VA1B image sensor.
>> OmniVision OG0VA1B is an image sensor, which produces frames in 10-bit
>> raw output format (Y10) over a 1-lane MIPI CSI-2 interface and supports
>> the 640x480 (VGA) resolution.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                 |   1 +
>>   drivers/media/i2c/Kconfig   |  10 +
>>   drivers/media/i2c/Makefile  |   1 +
>>   drivers/media/i2c/og0va1b.c | 867 ++++++++++++++++++++++++++++++++++ 
>> ++++++++++
>>   4 files changed, 879 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 
>> 5aa846c8479b20651291d5bd2e316308310f826c..85a06eb9eacc410a565b80d56979eaa565515d0e 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19891,6 +19891,7 @@ M:    Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>   L:    linux-media@vger.kernel.org
>>   S:    Maintained
>>   F:    Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml
>> +F:    drivers/media/i2c/og0va1b.c
>>   OMNIVISION OG0VE1B SENSOR DRIVER
>>   M:    Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 
>> 5d173e0ecf424f2f204f8d426be818e44357f8e4..56680772f5f47b4629c4e17f5a5feba08b1d94fc 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -363,6 +363,16 @@ config VIDEO_OG01A1B
>>         To compile this driver as a module, choose M here: the
>>         module will be called og01a1b.
>> +config VIDEO_OG0VA1B
>> +    tristate "OmniVision OG0VA1B sensor support"
>> +    select V4L2_CCI_I2C
>> +    help
>> +      This is a Video4Linux2 sensor driver for the OmniVision
>> +      OG0VA1B camera.
>> +
>> +      To compile this driver as a module, choose M here: the
>> +      module will be called og0va1b.
>> +
>>   config VIDEO_OG0VE1B
>>       tristate "OmniVision OG0VE1B sensor support"
>>       select V4L2_CCI_I2C
>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>> index 
>> e45359efe0e41e13e3c0869e5ead7d6cf4aca3a7..c60851c7fe07e3bdc511c5f482525ba7a044f48e 100644
>> --- a/drivers/media/i2c/Makefile
>> +++ b/drivers/media/i2c/Makefile
>> @@ -83,6 +83,7 @@ obj-$(CONFIG_VIDEO_MT9V011) += mt9v011.o
>>   obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
>>   obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
>>   obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
>> +obj-$(CONFIG_VIDEO_OG0VA1B) += og0va1b.o
>>   obj-$(CONFIG_VIDEO_OG0VE1B) += og0ve1b.o
>>   obj-$(CONFIG_VIDEO_OS05B10) += os05b10.o
>>   obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>> diff --git a/drivers/media/i2c/og0va1b.c b/drivers/media/i2c/og0va1b.c
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..f0505b7ba7f329ad57ffafa8f90a24204f002d3c
>> --- /dev/null
>> +++ b/drivers/media/i2c/og0va1b.c
>> @@ -0,0 +1,867 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * OmniVision OG0VA1B Camera Sensor Driver
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regulator/consumer.h>
>> +
>> +#include <media/v4l2-cci.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-fwnode.h>
>> +#include <media/v4l2-subdev.h>
>> +
>> +#define OG0VA1B_REG_CHIP_ID        CCI_REG16(0x300a)
>> +#define OG0VA1B_CHIP_ID            0xC756
> 
> This is the same chip id as of the OG0VE1B sensor device.
> 
> What's the difference between these two sensors, and do you find it 
> possible
> to add support of OG0VA1B sensor/modes into OG0VE1B sensor driver? Or is
> it just the same device?
> 
> Hardware specifics described in dt changes also does not show a difference
> in comparison to ovti,og0ve1b.yaml.
> 


Hi Vladimir,


Both OG0VE1B and OG0VA1B belong to the same OmniVision VGA monochrome 
sensor family. They share the same resolution, power rails, reset GPIO 
behavior and power management framework.

But they are different:
OG0VE1B:  8-bit RAW, lower FPS
OG0VA1B: 10-bit RAW, higher FPS
and some registers are not same.


The DT bindings can be reused, but would it be more appropriate for the 
driver to remain independent?


Thanks,
Wenmeng



