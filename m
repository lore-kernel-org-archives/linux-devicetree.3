Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA65E353EDF
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 05:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660773; cv=none; b=Sd7gTn3su0P8jQ+qMrOo3OjCvSEFQVAhLS8oSn5nxUBhhTMNUgTnoEZ1QXwoWdEvCw3wtJFQGMqlJI/mRwvDBBJWkoB3tctJk2CVOUaRI0KucPKMrbf7fznBE7JZsgkfUx5sDBQ/1dk+v3FsSJ5TDuYWMnKtHU3VSzrR8mhbLTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660773; c=relaxed/simple;
	bh=WBrK6P1J5Sn8UyafewpSzbEBsFKxbWX5+iAjHib2raI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wxi1OroeeQ6ibN9YTRbtz6mnwLmrPSJW7Ed0ORd5ylYuHuC8nCWU+0xskxvdO+rqK4kWOzNNqP+hDTFuwhB5enWvbrSlu5lhGg+CGdDxJxBNko/uHYSpL7K7hHjJb6AOjAs9r0YM2D+Z9AnjQ91Hk+XDbGiVwuUKludS6emGNOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WbHSujlG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJkCSU17; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WbHSujlG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJkCSU17"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T470b02685996
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 05:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+frg3gm10voRSH4KNBjLaqR7f6wGIX42XHmruDIkxw=; b=WbHSujlGrgDr8OaY
	WMmlKN6Jo9lkdsIy5AwBBFCxU9rhpxCN5ZEjn3/UGeC4RWJ30NVrxqLlmJsjDeaR
	XlG6wSbZExGK8jqW7aPv+33FL8X00noxrUd52MWHaBlq49eArmAXLTWLceySBuHg
	KTSK0i6qhSdiHbOJCZKQ359lZAtGNYXf5iCYO3JmVXRosY5XPzYv4yrr8juoBrgd
	xvQqdUM1eZP2achlYfNlAZ/9v8VWDZGg0SyYWYCyObiZMyB2Vz5aE2f/A4uDuq6+
	rZCi6YSE3psWytZ6wv1Bo6eU8MbZzB5Ha2CZo2qG58cQYs3FydzxGQQhXDzKdFMM
	H4ISCg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mjh0nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 05:46:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so97858285a.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 22:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790660765; x=1791265565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+frg3gm10voRSH4KNBjLaqR7f6wGIX42XHmruDIkxw=;
        b=aJkCSU17L5ha0nMHgNNdoAgfxblO1Ylv1R7mdmasqxzaGsAHZQ9OZAA0KQ07e2WiUf
         LYqzotpLWt58Kkouf8F+T20gpELyQEMT3+KSLq6D/YWab1giJ/Hd50OuZn9d2/YO/avd
         dJhRjSBmeBR9mMGjHDmb+amluGI5nw3vH02ieqSBCMRpSX3mu/coqqPLNLwZaQcr4TRW
         SP19d1kncJFJRrrJF1OH3HK+U1lRDGLfJ9iWVIZnwEhsNSoefKdC75tVKRoau02/MYHh
         42b62kyyDc62UR5PVT9bhJDZiKrx27UYpyiMsuIW9mtH//Tq4XefLORQxlSltCmv2SYi
         XQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660765; x=1791265565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+frg3gm10voRSH4KNBjLaqR7f6wGIX42XHmruDIkxw=;
        b=LWRCee9Dq1aDDRbp8Q6RYgDKQRxLsJONPCwVLMHG/PP0ZkMbhp8ynhViBnQ6RabNc7
         R6mdfS9q4Fwq5DWtQqjij8OfcZMosj+8/rT7h7GuJP8bfsQov67OCAHtBrP2GHY5DCoj
         Pyhr15Bga5C1j0MZBDrL6nJW6OHblBC52xTK0fjV0gNxwPqY3nuedoWZHDL1ky5HO3or
         SJklMleacODgBZpU2/a5Xd4Wkjz28J7vXnLgfBPyhIxdz3fAsEohxQV0StzB6APwvesE
         G5u0Vfe4YezkBY3sLM4KA1J0GpRfF8JUtXy64VnlMC+wNAT1Y4RPIkwFZGqLg7eF1t40
         adaA==
X-Forwarded-Encrypted: i=1; AKwUvByU+UiVtkhAn0ANYVLhjyE9wPdpdMR2NM3pYXs78YdY2aiU+q+OAowKo2Xdk981QjYt9/03so6jrjpv@vger.kernel.org
X-Gm-Message-State: AFuF++nLvCaiq6bG8zD/L9KUvxTmJ/QjgeGQjt5s3/eQDUOjBWbuVstW
	5Ye5QS1WUWvYpvmw20gOq0AXnoj9F9Js/8is5KSIUGLnskbw03W/Q2blXH+Q07YXkqFoFE+0QB0
	ESvDDGzzv702bKkAJz4+wNyEd3TdKHBghN/OiSTJw3/UKmDcIrRn97KwJguGQNpvtNc/yVJEp
X-Gm-Gg: AYBFou0nM/AILTWWu7iG26Jit1+DUS4a8VQxpLqiUnt6pk2ZG+AFoSAu3veUJeDmWfU
	lt1VdGyPjACEkG/kIVzmclW8DeXVxq5lmWOZpYPWqc5sVItmS3sZ3yMLCdIYOmwYQGqASMuTQ5p
	keJr2kOT/rvWgRIA/5DLO4H6Q1LVNbsjLGgEVGLzl0RDleCp9n9mXKsjFpljrgdFbbHCXYu5vwX
	A8UZ2GnSJBlZ8eL/DHPTVJ3wWnblGKZGhMCoMuEKHjRqGp2jU2n7IL5+L/uNNkILX/if0i1w0LH
	Bu60KFZ6NfZNG2cuP5THYOJW/CIbPfKBVrR5U+/T1D7ZjWSrjo9kZSGgaAt1aB4suncCPGlkW6n
	LvCJq8qEtaUuvnsV+HmqUBBvt+Rh5dNMLJj9Ipc8+aRDF5wICyPdrTfTYpblTwg==
X-Received: by 2002:a05:620a:2b9b:b0:93b:c6fc:71e9 with SMTP id af79cd13be357-93c8bf447famr274500485a.25.1790660765546;
        Mon, 28 Sep 2026 22:46:05 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9b:b0:93b:c6fc:71e9 with SMTP id af79cd13be357-93c8bf447famr274497985a.25.1790660765060;
        Mon, 28 Sep 2026 22:46:05 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00ed06ea7sm31492735e9.4.2026.09.28.22.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 22:46:04 -0700 (PDT)
Message-ID: <8eba263a-c233-42c5-842e-7487ea36d5aa@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 07:46:01 +0200
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
 <ed99f62d-cf90-4ba9-89b3-08dbe7f7227e@oss.qualcomm.com>
 <CAMpQs4+hATFf+0w6Wq09RoZB1JJ5L_GP0aWxcGAeraTW7Gfy0w@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAMpQs4+hATFf+0w6Wq09RoZB1JJ5L_GP0aWxcGAeraTW7Gfy0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMiBTYWx0ZWRfX+vVtbGe5UWhj
 5LyraWPzAiRlciKmL+lao6dUvYobYC8v6yNOX5RS/4z9TmOjhKm20KCbcMAgwXThUKvF0/VvJbL
 G9t9/ErUmF3ONJczr1QGDMIQTwvqVuY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMiBTYWx0ZWRfX6IC4IIk4blIP
 vrc88Y0ieKNEtZDsCKfj6Il52IC3qacoc8datKE42+j6/qWgF9dA5w8m2Hsb+XulBSGn7XfwvGQ
 ZFV7yVI5C8IUomvkL9MVJyKCmUY2sY2gAUB82Zutuf6toAhQZrxba+ot+4OVL60weu2mttFNJDe
 nfOmLP9YlYmc35Yiq6zgA6/Boefpk9NOK0u6adJVYL6/YkSZtBqJuVajgZAq8MMQeYfYTgN55B2
 ZCLJC+6UOhynTVHhyhjsDwqfOGGyjd8dfdeh0xQjuWoAjqLIH19peTIViNVyCjZkE7WbIkIIjPD
 r6ZK1OtbcQDWDqX1bUrWdcOR/kIQAmbcZM40dkSVSku105ls/fbRls1oA8P2nL6ve5OB5MS9MoY
 +ibtg/L8cQROIjWjoNuYSgMsOdcfag==
X-Proofpoint-ORIG-GUID: 4CCDebYbbxp0irR7jKtKNKJGXpdZzqep
X-Authority-Analysis: v=2.4 cv=OdgNnRTY c=1 sm=1 tr=0 ts=6abb509e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=Ewyx0iL5S_KfCDCwH-MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4CCDebYbbxp0irR7jKtKNKJGXpdZzqep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609290022

On 9/29/26 05:06, Binbin Zhou wrote:
> Hi Daniel:

[ ... ]

>>>> Please make a less cumbersome and implicit checks here. For example
>>>> count the number of sensors and then do the check against.
>>>
>>> I thought about it, and you're right—I made the logic here too complicated.
>>> Let's use `sensor_count` as the counter. Is the following check logic clearer?
>>>
>>>           u32 sensor_count = 0;
>>>
>>>           for (unsigned int i = 0; i <= LOONGSON2_MAX_SENSOR_SEL_NUM; i++) {
>>>                   tzd = devm_thermal_of_zone_register(dev, i, data,
>>> data->chip_data->thermal_ops);
>>>                   if (IS_ERR(tzd)) {
>>>                           if (PTR_ERR(tzd) == -ENODEV)
>>>                                   continue;
>>>
>>>                           return dev_err_probe(dev, PTR_ERR(tzd),
>>>                                                "failed to register sensor %d", i);
>>>                   }
>>>
>>>                   sensor_count++;
>>
>> If I'm not mistaken in the previous version, the loop exits at the first
>> registered sensor
>>
>>          if (!IS_ERR(tzd))
>>                  break;
>>
>> Here all the available sensors are registered
> 
> The name `sensor_count` might be a bit misleading, but here the loop
> exits after the first success:
> 
>                  sensor_count++;
>                  break;
> 
> Let’s rename it:

Can you clarify why only the first sensor found stops the thermal zones 
registration ?
