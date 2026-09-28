Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C714BD78C
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601788; cv=none; b=nMVNj7SYVmgSdo6nIzY7k7OTB0qWxZkYRRcfl9vFcQy3G0OlkLZC6QTOOHMmCaDG0Fq7e7tds4XMm0hn1yGxPBm0wa7eUob16xYcyV8v1bXZnz+NGoFAKWC/nUrD5rdt2bDTdKlAKquMXvUvBCEA0KkPH9vMzZn106TODr41d6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601788; c=relaxed/simple;
	bh=pizrIKeHoQjsnYL5ZXGAo09+SOFzIbhMyKVL4gpQBR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DR4X6UTfSGP6DmCt5dJS+u+svsq/zHnFGUjffgvvBkaGx5nT41QXKBb6PseFXvpl3Ygmr5bp/JPXpee58XNTQ6DHJGEclaDtqwUvQjq8ijB2A1TIPHhFVaEkJC69Tj8xFXZvxyqPPGoCRjTgu9tjuKC7P0tP6NwhPRbVwQoKbb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eoSTGtzn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gr/r/li1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eoSTGtzn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gr/r/li1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBANCK2294774
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	guc0q09pgXgZACQ1ISwNuyv5rDXiyX6HQAUQRihUMs0=; b=eoSTGtznprCCnquk
	sNMPFxiBUfHdwOw5CjVxLwwHRgvOdFf/HAxaOkc0ws8nBx8PubrO3ogsF1Mq3PmN
	ixIfEzYc82CW2sCEBcdebYKq86X+bolLmVPiYB2TPyctCRdsotbl1O1Jb8caSVI3
	0Hqf5BKuYRzmoB0pRSapmV1b1ed8ggH2JcK44LpkQtIUtzrJcPibTJVowA7PMo/s
	bCcj/KQgR+Tag7qRaEv9quRlxlgfWTDduvSkGOOyk0tJ70MRbxFhurCjHZcTVNte
	V/jGvnNF/MTHX9MYopNlcLxfZg2eMAJHq2W0wg/i426G7Mp0D5HGmoAWo53r8HRS
	INeRiA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubhqed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:23:06 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988a14fe152so101496241.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790601785; x=1791206585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guc0q09pgXgZACQ1ISwNuyv5rDXiyX6HQAUQRihUMs0=;
        b=Gr/r/li1kCFthxKqoR4lGYJc1l3V88mS+vdsiZf8gHWH8NY/yPgN+CveTKRCfLZUru
         3V4uL5bu8hkqMiVAQ6TV5gjv+qaweDoL4Az2aw5iSNpN+dXbBuZvZl8VR1VCwrzLcwFa
         PLO+a8tKqnPgSr5LWXFbrF1E1xREEEkYnRPrASBYcrfdAzEmszfnibEpU6siuMnEI0UW
         dBQ6LSJ8fQmAtIFHxqJiJLRtVxMDWcwhlmopGMFYmy2CNkYcLK6I34rrAWCW0Y0s0MYj
         C3XT5JQtPw/2tYivtb+Kg8HVKNiIp4NLD/DdCCl5CBPLbXik2nZIK1egsyoCWG8eDT51
         af9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601785; x=1791206585;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guc0q09pgXgZACQ1ISwNuyv5rDXiyX6HQAUQRihUMs0=;
        b=ZpEiWSEvgwxmIxZflNRcwrRTJMd+Vy+vyp4/pdf5r1qpnJZms1XEtHcYQyeWl1q5ZN
         /J/c3q9gQ4RXzp4XJDnPsuB9+HKu3ut8q3sJn1kFPDFJUEJ/8pkCnsccNA48RRmLOaQ+
         apwA8LCzhKbfVoHa7WbhQPiAc/b70A6ja+Wrnnbg9aHX7Dj22GsRMir3oFQ3fkScJRQm
         AJKdq75Q/Bo/zM/m+ftDhMGQ1zflCPlQiQLiSimv0PmY1xvyS6IH0cQCOEkZTJfZyPQW
         WzCEWm+R/H+dLWAxRdzTeN8QjAb82j3c35JYhZBr/LI/uQOkLzGdafXCUxEvp2zE7ztd
         mDIw==
X-Forwarded-Encrypted: i=1; AKwUvBy+JwyeQNsce48pwBKRnfTaYUQj54P9P1lAKCSM2WXdit/rlAusnS4uzhvEKXbH/V41mvcNynDTXfhA@vger.kernel.org
X-Gm-Message-State: AFq9FYI9vPeMejQKoe35sQdKOKwu7XaXRCSB+xygq/mNL4pH1ux57XkS
	1Ucmwnf5SJ7K1gQp5tb38xJKiJxIUrddFKQDs83w4ZCXNtO8jeWR6KFPso0wgcRW+gGvHrsogdJ
	pqOFW8J84oShYTEQPmRJ3Nifd//FaF0/PmZx5xPiqlPbgWJ+hqCYdmPleJfV25/Yp
X-Gm-Gg: AYBFou2SP5kxU8caP6P+asL3jRTW+6dikArMZ86T49u5st5RT+fEhjb2U2JP08a3kkq
	VXUbiUsVqfoGrwmpMfU5QRwMVxmnlQ/lZgf1F2zdqolAYFuJH0m+fTauLuiigw6dfCqOPWeT6ag
	8KYtHYQumfIH6iEDGX6U3RI+X8yHrTkr/v/vCAFyN49hdJW+Nc6kH4mDBYlt/K4rxueoUvYoT9F
	dIV7rf/iPG+zLX6LcP5aOjG3N6nWTO75JfCw+/S7SB9/tStrzf0wQgE+GeuiC/Tp6LeX54SHz+1
	G9qkEU6dpgnE5x4wETD1j91+72EQTtfrbPIX0/SACihtx/b58uGJo3hWT/CO/eS1eMbTBu2kvWa
	DPl0tCecjBMQAIPVXlg==
X-Received: by 2002:a05:6102:442b:b0:7a7:196a:84e4 with SMTP id ada2fe7eead31-7af1ebf4fa0mr4105648137.28.1790601785028;
        Mon, 28 Sep 2026 06:23:05 -0700 (PDT)
X-Received: by 2002:a05:6102:442b:b0:7a7:196a:84e4 with SMTP id ada2fe7eead31-7af1ebf4fa0mr4105631137.28.1790601784507;
        Mon, 28 Sep 2026 06:23:04 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.7.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c0d538fsm4208685e9.1.2026.09.28.06.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:23:03 -0700 (PDT)
Message-ID: <ed99f62d-cf90-4ba9-89b3-08dbe7f7227e@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:23:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] thermal/drivers/loongson2: Correct thermal sensor
 registration loop
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
        Huacai Chen
 <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
        loongarch@lists.linux.dev, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <cover.1790561983.git.zhoubinbin@loongson.cn>
 <502911659e15a51c4e98c11f3cf476dd5f92e75b.1790561983.git.zhoubinbin@loongson.cn>
 <0aaf7166-378c-47d7-98d4-1004fdaeae7b@oss.qualcomm.com>
 <CAMpQs4+uWMfFib7MhRcc7o-QMXkFrFCtdcGj04y56u44JL4iOg@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAMpQs4+uWMfFib7MhRcc7o-QMXkFrFCtdcGj04y56u44JL4iOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jSHpqMAKEqsDhoFsp1UEzGFId3gnPbQq
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba6a3a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=K71sKCzDSiMJbZmyObbiAA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=84pesApZu4OvMfbIMCsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: jSHpqMAKEqsDhoFsp1UEzGFId3gnPbQq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1MyBTYWx0ZWRfX0zanvXDZdQ2S
 /C4NHlrDJcP5Ympn8AMCWPfz9QUICF9C8GeKYaOMEi/We3dCXDvWN8hw1Z3x+VUnd4mRXXSvJAX
 8kjkZ656R+H9KdU8b02LTXsuVmu68OZs+CxBWdcyWYz+20KhIUY5ySVkqa4ew74zYJ5NHKk5XdO
 +/ZfWiuK8ySsJ56lAZjg9LvQDQH7Ex6qAf9pSeXRbRf8zKxV3uOvSKhJEdJTyPw95nIm5mH8X9q
 Ln1Pt1VPBhAiTQ4te3w2Sd4yl4LGt3BB3H+BX1PFOAAMuQYlq9GwUyB5SRRF+M6eVFrPYSx2nAK
 pCVWgK6PJpLVlnxebEJrBlmX6WiOAo1NyrziKL2BSLp8BJTPpM7z6Eaiq3tqBfrfEsVslFoM8RE
 ujK1lnMYSbrb2OaDS2t3Ew86V1sF0WuKd7fcgjiDAYE52zUhxuCqwEEcR4+6q0ughounWwLbqRY
 iiarNNdtO7bm5wlEemA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1MyBTYWx0ZWRfX6WMtEogI4z8c
 xvW9hjXfhn/WBYJ7XzlzGO+1tSUiMRolgVlKvfTNcmFuP2GZuere2/QkFeoZe+kOjjpxitLvUUZ
 kU5YVYa0kmJqHrKI7pU+bwRW7DUAL44=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280053

On 9/28/26 10:17, Binbin Zhou wrote:
> Hi Daniel:
> 
> Thanks for your review.
> 
> On Mon, Sep 28, 2026 at 3:15 PM Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:
>>
>> On 9/28/26 06:44, Binbin Zhou wrote:
>>> The registration loop in loongson2_thermal_probe() incorrectly uses
>>> dev_err_probe() when the sensor is not present (-ENODEV). In that case,
>>> the driver should continue to the next sensor index rather than treating
>>> it as a fatal error.
>>>
>>> Fix this by correctly handling -ENODEV and only returning on other
>>> errors. Also add a final check to ensure at least one thermal zone was
>>> registered.
>>>
>>> Cc: stable@vger.kernel.org
>>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>>> Closes: https://sashiko.dev/#/patchset/cover.1783670011.git.zhoubinbin@loongson.cn?part=2
>>> Fixes: e7e3a7c35791 ("thermal/drivers/loongson-2: Add thermal management support")
>>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>>> ---
>>>    drivers/thermal/loongson2_thermal.c | 8 +++++---
>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongson2_thermal.c
>>> index 4d40fc706a53..99b7392fc68f 100644
>>> --- a/drivers/thermal/loongson2_thermal.c
>>> +++ b/drivers/thermal/loongson2_thermal.c
>>> @@ -160,16 +160,18 @@ static int loongson2_thermal_probe(struct platform_device *pdev)
>>>
>>>        for (i = 0; i <= LOONGSON2_MAX_SENSOR_SEL_NUM; i++) {
>>>                tzd = devm_thermal_of_zone_register(dev, i, data, thermal_ops);
>>> -
>>>                if (!IS_ERR(tzd))
>>>                        break;
>>>
>>> -             if (PTR_ERR(tzd) != -ENODEV)
>>> +             if (PTR_ERR(tzd) == -ENODEV)
>>>                        continue;
>>>
>>> -             return dev_err_probe(dev, PTR_ERR(tzd), "failed to register");
>>> +             return dev_err_probe(dev, PTR_ERR(tzd), "failed to register sensor %d\n", i);
>>
>>
>>>        }
>>>
>>> +     if (IS_ERR(tzd))
>>> +             return dev_err_probe(dev, -ENODEV, "No thermal sensor registered\n");
>>> +
>>>        ret = devm_request_threaded_irq(dev, irq, NULL, loongson2_thermal_irq_thread,
>>>                                        IRQF_ONESHOT, "loongson2_thermal", tzd);
>>>        if (ret < 0)
>>
>>
>> The [no]error paths are confusing and prone to error, eg: 'if there is
>> no error then check if there is an error', 'when exiting the loop
>> without registering any sensor, then we assume tzd is -ENODEV'.
>>
>> Please make a less cumbersome and implicit checks here. For example
>> count the number of sensors and then do the check against.
> 
> I thought about it, and you're right—I made the logic here too complicated.
> Let's use `sensor_count` as the counter. Is the following check logic clearer?
> 
>          u32 sensor_count = 0;
> 
>          for (unsigned int i = 0; i <= LOONGSON2_MAX_SENSOR_SEL_NUM; i++) {
>                  tzd = devm_thermal_of_zone_register(dev, i, data,
> data->chip_data->thermal_ops);
>                  if (IS_ERR(tzd)) {
>                          if (PTR_ERR(tzd) == -ENODEV)
>                                  continue;
> 
>                          return dev_err_probe(dev, PTR_ERR(tzd),
>                                               "failed to register sensor %d", i);
>                  }
> 
>                  sensor_count++;

If I'm not mistaken in the previous version, the loop exits at the first 
registered sensor

	if (!IS_ERR(tzd))
		break;

Here all the available sensors are registered

>                  break;
>          }
> 
>          if (!sensor_count)
>                  return dev_err_probe(dev, -ENODEV, "no thermal sensor
> registered");
> 
> 

