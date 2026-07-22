Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6377533AD8B
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784700575; cv=none; b=b4wkUeokHYD58q2KM+9ITxEB59d6masIP4s9YEGVtESD+4i4PQ28ZAtAz7LicVRVRmYEg7ZoVKEyRR+Y6BGeNtWXvQC+glpEZ3LIOvoU8qxLfDwg5QM57uBZd8y3DJyw/Zo4R5HeaWCqf+SfBvV53WnTMW+oQzda0KmdNqhHN4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784700575; c=relaxed/simple;
	bh=R/cX8nhN8PUwkQfDndBPM/71jgFRBDk2eNytHU2iHDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MvdNnjnUPgMpAkfOccTUC9EwMhuXOdXQanW7/2DmfO5J88FCmky9fTHgNmfyuBJiBn4nEJft6V3nJSj35wDModqBhJmn9ttY2v8XMIW1rCBzy9ZX991CvJm9IBLR5NtQUfS6LNYNAAgi48MXAtC56kANtZXatDvzdcCscyWwoOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JmaPVjun; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFbLeF9h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmaPVjun";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFbLeF9h"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53uCv4055654
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBDFrsbeu14tmNEHgR9Qu4YwB5hCVrBW3fi5kmCG9fw=; b=JmaPVjunahDpMya6
	LY7k4i/ADHQaAOeX20f5edq1wXbeVNSjbsXTHxdy2t4ogX21gZydeXuAF7c0jNul
	0FnI+7bHpwQh5wl6XGzzQ0kl4KEZMO3kqVxNgXVtbvsGJjZ99SEgEt1fg2M8sWHa
	xwPx/lMn3nOWhnqoYRBxwXkWBjMsi77AdfPd3pke57/8xqkR5m/2WViAexsCIwk1
	kJnIHIlWj9ftlL9rah+YN+o487fS6dNPEMr9UaYr2lrJ9XMrPQGsNBSceNvNKroz
	pIYDA9LqKcNSh4lGRKue2HDjMP/G5ktNozuOJ4doEBnTfRcgkDcwZrcF5FfZ7/Dp
	LK1wkQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdga4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:09:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so5627205a12.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784700572; x=1785305372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBDFrsbeu14tmNEHgR9Qu4YwB5hCVrBW3fi5kmCG9fw=;
        b=cFbLeF9h1RMDbadhu0f9cGt+UE6YO6Uoomk4XciNdMR2J2RykWt5oy/r6engr/isoE
         SdSDwmX2FNujTu+Ay6x2wFyNPSt3zaJr+YQR1nYsLx8FBhymJC9ko576IK3s38xRalgX
         KwIqAywUCoxDKBfPfnPXNYkJ5XfVAet9rFnz3H5Jj5sKlUkm4nwzOgV/NaTyCK0yZHEJ
         h0tDPBFYDLyfuM1n29FBZRkZog/0Z/L80W4y98j3zifAj3o03oqOxIGOh2E4tMici1Bc
         M61R1VtKvuHzqI+yiL7yaOtMuJs/4Oli0VYou/2bWjBrFBBvgI4ggxFzLGpmrp5U+460
         4Lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784700572; x=1785305372;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kBDFrsbeu14tmNEHgR9Qu4YwB5hCVrBW3fi5kmCG9fw=;
        b=ACI6mPgoDecikB5ydhI/iUwZh01wQfLwzwg3iAsOcvoUajbINr6eu7z2LnqQOaEXc1
         k6DqLpV+FKLK0EiH96YyuuD+dzpCl98giMkiFksFTEIGLqyuspKpRETSABhN6xGqjH3R
         SAt+aDFZ5lzJbqmboJ5N6ye2sbHx++ft+P3LUn27BFeIYItEFTcTAPE3hL+HbBfgrA+q
         BgBHsFNaAZY1sDTuexjMs2I1jIRyRnUmytmmkstQYwIzlGhp9VsX+TyhPE+BdoZyFFgW
         hENOnIWYkam5sgOcjEMdESi9m94n4eUdyamrL5c1cs4aYcQ0NU7KSEMGZK5z46GY493p
         /hBw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3PWwbKP8BH+H3Jrpu1vjNifnainNrzbXQKMe0A+VnqyVCnh9Ry7HRRZK+CSogbd1aaqyyYIFDNdJR@vger.kernel.org
X-Gm-Message-State: AOJu0YzUKcN8GXfklJPcTj2qPRLZFKXarelhB1S4UUb0WUKH/Qp/xXOn
	peBsE3LrqkEeRl/7S0wNsl04jvbxjZC4WrbMjuvK3mtv6Dvqlp0v6d7Nc5BRQaRrNj4RdLh5AXz
	PSpkm16YA9GAHdJFapM8GQVfaY+PbUvEirSeR/mUre36uAwU3ATDlSiqjmNU30TDV
X-Gm-Gg: AR+sD13GsI15iWMlxX8MhvK29lOLBbvbcZG4JN3yC5Y9/T/asgR8RtOUNoteDZ1BNS0
	XowGqxow9PG1G7onusgqhOwFhmcek4bX+KJBsz7/hoTYqFysd5okBKyoBH8fp9jPCP/JUU4je43
	q/b1PL8vF7jlgDmdRjgp8+CsLeu1JVCFYpoxA5ngvL6eTf8zANobET7Chj+FoOcOdn9PLGbA5eD
	rLqFRkxubMMwbg9XxOMwGeUJ5fkdiCGjne5h+xzL0YzB9D0kxOMUVLxeEDOLg8bKzaNmTLsiaLs
	3uft8Sczb/UxkX9WAaOCaF0vVq3oqMkAP4bMUbR/RmhxBfOs+vGFFyKQCyxY6AzlO/YLSYFPlTe
	5a3eTG1m1mrpBKG10IL/bC/YNhJJNw4IOgQ==
X-Received: by 2002:a05:6a00:2302:b0:848:2f6e:e52b with SMTP id d2e1a72fcca58-84c2951315emr21779749b3a.63.1784700571936;
        Tue, 21 Jul 2026 23:09:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:2302:b0:848:2f6e:e52b with SMTP id d2e1a72fcca58-84c2951315emr21779726b3a.63.1784700571442;
        Tue, 21 Jul 2026 23:09:31 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ee1e6sm565937a12.12.2026.07.21.23.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 23:09:30 -0700 (PDT)
Message-ID: <25280ee4-b847-4206-93f9-9ed7b23f2275@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 11:39:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 01/13] power: reset: reboot-mode: Remove devres based
 allocations
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-1-e7453c548c21@oss.qualcomm.com>
 <ac030bd2-6b14-4b55-b277-422514da5f32@quicinc.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <ac030bd2-6b14-4b55-b277-422514da5f32@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NCBTYWx0ZWRfX0/8rgDkQSdK+
 DKtWmkXVl+BsJ/JVk72YnJNmG7LoghZ/Oq2RFWYATGBfk+jeYrC1tyvNz1quW9RuEExMJxCNNPj
 ITq6dALtvPBAdzriODV/N5daRPJ2qPZoE0yk2LvsY/01TXXdEAeqkfBQRuf5Q5Q77xL+kW0hJHJ
 BiluvNbR+4QBkaM+Sp1tmlGHJamTJtJLA5PkvGITR4U3T246vPWOqqmI4/ydlICotsUDzh2buCf
 +bqQIcNRcE3XTAVCqzKNb7pHkxxPiyoJa/lh1bXmd0VQUrXqOIvfeODma/TKv3qXGQQ2UwNRQvw
 jT1OWZwKHlGxON5H5jOfzuM0jb/0+lCbQ7sjOiM5uF7tDGkCkPnVzjBSfTaRnNcQLrOdfQRZQOk
 vScowFMtPsFc5KPIgytBsA8DfP3K1GtQ56UMgloxHOXn3k+rGmXx5pAqO29bikjdxCv6ZQIyOOc
 Eg/wYz70olG4jB7MKtw==
X-Proofpoint-GUID: QRGFUJQVuOcdwBHX5F2RhYQHsx3fMi5I
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NCBTYWx0ZWRfXz5LEPP9ZhmOO
 8bpc8xxid9TvRSi1NxseENYn3/Ls914isur3kGTX9Nx3hxEjOOR5jOsZwofvObig4bgAeH7PRCi
 drDGEth+XaxxgJeGNsqoDA2C52CTq1Q=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a605e9d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=LC1Hwnd0PhZBVGXlRGcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: QRGFUJQVuOcdwBHX5F2RhYQHsx3fMi5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220054



On 21-07-2026 23:30, Pavan Kondeti wrote:
> On Tue, Jul 14, 2026 at 10:46:29PM +0530, Shivendra Pratap wrote:
>> Devres APIs are intended for use in drivers, where the managed lifetime
>> of resources is tied directly to the driver attach/detach cycle. In
>> shared subsystem code, there is no guarantee that the subsystem
>> functions will only be called after a driver has been attached, nor that
> 
> You mentioned driver may not be attached.
> 
> reboot_mode_register()->reboot_mode_create_device() is using
> `reboot->dev->driver->name` directly for creating the reboot class
> device?

Will review and re-word it? In current design, reboot-mode needs a 
device based registration and dev->driver->name is used as sysfs name.

> 
>> they will not be referenced after the managed resources have been
>> released during driver detach.
>>
>> To ensure correct lifetime handling, avoid using devres-based
>> allocations in the reboot-mode and explicitly handle allocation and
>> cleanup of resources.
>>
>> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/power/reset/reboot-mode.c | 32 ++++++++++++++++++++------------
>>   1 file changed, 20 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
>> index d20e44db0532..7a74f72a8313 100644
>> --- a/drivers/power/reset/reboot-mode.c
>> +++ b/drivers/power/reset/reboot-mode.c
>> @@ -3,6 +3,8 @@
>>    * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>>    */
>>   
>> +#define pr_fmt(fmt)	"reboot-mode: " fmt
>> +
>>   #include <linux/device.h>
>>   #include <linux/err.h>
>>   #include <linux/init.h>
>> @@ -10,6 +12,7 @@
>>   #include <linux/list.h>
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>> +#include <linux/property.h>
>>   #include <linux/reboot.h>
>>   #include <linux/reboot-mode.h>
>>   #include <linux/slab.h>
>> @@ -168,10 +171,11 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
>>    */
>>   int reboot_mode_register(struct reboot_mode_driver *reboot)
>>   {
>> -	struct mode_info *info;
>> +	struct mode_info *info = NULL;
>>   	struct property *prop;
>>   	struct device_node *np = reboot->dev->of_node;
>>   	size_t len = strlen(PREFIX);
>> +	u32 magic;
>>   	int ret;
>>   
>>   	INIT_LIST_HEAD(&reboot->head);
>> @@ -180,19 +184,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>   		if (strncmp(prop->name, PREFIX, len))
>>   			continue;
>>   
>> -		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
>> +		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
>> +			pr_debug("reboot mode %s without magic number\n", prop->name);
> 
> Any reason for converting dev_xxx to pr_xxx here and below?

this seems a slip from old design, where driver dependency was removed 
and reboot-mode added fwnode based registration. Will update this.

> 
>> +			continue;
>> +		}
>> +
>> +		info = kzalloc(sizeof(*info), GFP_KERNEL);
> 
> The recent commits to this driver adopted kzalloc_obj().

will change it to kzalloc_obj().

thanks,
Shivendra
