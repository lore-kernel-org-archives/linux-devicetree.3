Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9505B392812
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778671433; cv=none; b=X2lVhQT1tvMeywkWJuB28yUcrwxNl2vNeijwmpWapiEQC+/SAGIhc/32YVF4BJh2R/IZA7HUSwnVvTE9s+hnub1/TKVnGSv2GOQzCvGhXbOpzdImab95/qGxFFKXEbjCYweofHWRJ9fXaHF2Hxly+roeSu/BKx89jbXX5u2mN5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778671433; c=relaxed/simple;
	bh=E6AJPL1IVOQ3biHg1haRta3p3zX/mjoXobHKjSTBXBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5p1rxI985C3vCtfNyb2LotTXPizzxyIJNVRMwYFSvZQ5iTx5Pwidz9j4FNf3ahVB6YfuK8Pj4bWlytwRd74FEVgl6qoucVWLpxTIUYStWmHhiu2VNNXtG0+HUgvJ7JTzgzm3ZJi5ThLIKCK5srhM4dmdH40eenf0piYbKqW/2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ELsk7VWy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=choILXfl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ELsk7VWy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="choILXfl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVGQA3430119
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XRL2cuykGlS3d8so7WuC8Fpb4c5xTJU7q6YYlpYpow4=; b=ELsk7VWy2qpKjICT
	FzJac0QLduBhm8lUhUCK96TeEmYcDa7pXX0C3+bljKPG4FXVoilw9SV8/DW6anM9
	Xzd1rPzYh68Q6AFGtBv4wLsfMwZOo3lH9OFYxM/f6lw9eWxA4C/Sqv3QDHzWY/NL
	1yD49wcPjOqDo5kijTJqfPgvyO3NmJh7MoAE5fNNRisWbsGEcsaVkcasB70ZxRGm
	T0q+BrcALunCOtKgShaZhyVGN9/914CbkCfED9F44Ff4N9tJs1ftE6LyeHPQTcxd
	6v40bU6C5lFoaPEWpWKQ5mBji6TBE3BPJ4a0CDMxm3fiavtR3bAR+tGV+Lwjz3XW
	JOKs2Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcg5u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 11:23:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514ae0edeb6so92362521cf.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778671430; x=1779276230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XRL2cuykGlS3d8so7WuC8Fpb4c5xTJU7q6YYlpYpow4=;
        b=choILXflWQfoOtC+PxRIlEP++t/XWqqBpPH/W83UijmwGVssLSR8++/WTFJBgaNX0S
         5NUN3J97oI0xByXaUYqKLtu/u9BoTcXblEw71IC0vAUC0K2A1HJ1JR/b9VaX4UdrZ9LO
         J4uKkHtntEqwiX9sBcxYi6tM7HJvKmfUHCvlmQVtiFFI48PGBJRHQjY3MHNJF/kKHe+g
         JTnlOEOKjCGY9G1PsI+zB7hLfxwVmrG6PvSaF58gfkKN39sd6Tg/bpQPL/4jeQVCdmpn
         9+2bVON9CBzAWFsGjsZfNj/jQV9X/MeL0X8ukyeprpVe/rkm//O4A0eCxXoTOuvLoi7S
         NaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778671430; x=1779276230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRL2cuykGlS3d8so7WuC8Fpb4c5xTJU7q6YYlpYpow4=;
        b=Wpq4+RVkD9CuzdvnQevVCze7MuCeZud5AqUEV9BrsbjRWTX482ltiBaxAIuqvKc+Sw
         qXFmnJtV/l3HU1oSPRaKPNSlZKOUB5OykUWQ+7LCc8m1cLDyWa4Dl1cAv9IfWsJhtP9j
         ujCloFqQm0klv8mzACPjIdLXTJ4uHN8B3AUBcmIi+t7D7+0U0ckZWFxHC/oBQDCHsjR7
         ozR9Zn/XSK/p/TqAJLjjpOEnSnY+e6EtXmMG1Mdxlxh+Nr0h6wEGA//3z/uCciFzrcEC
         KjClE80aBp0siMGPstYF7UzEOTdnaL+HwLq7Al0VnU1t3yMyQPSqw+g2pxY0iuCuXwn4
         zjGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gYXgQQTcWeSBI5uQr81An6ouEaSRkHUFeWrM8vb3Ly19F6jjdhNUaCfLSvwmsqIiz1OnUBlb6Wvox@vger.kernel.org
X-Gm-Message-State: AOJu0YyiZMxZ3OKN9T5M9cO9N6Dt5nzj6vmoFmfNbX5KePW5sb+oaK7F
	nUlwQWATjVOY2DdMYp0AGlHhGYVYfpCRJ+paJPv2/SrbjV/aA2HSRmrDvbT7z7JRmtohwl+tuRB
	Qo4IKnhROtqx6ks7V0vmD4ySvnyJ6FxXz/TgtcOQ9TROTPzl9lMECCAgLcpwqIqOW
X-Gm-Gg: Acq92OF1Ys3fXZ3KIePXs/QogWWtP1oOXXWgxhYDR/8b/r40ZkydmonRt8+LdKnyuYq
	A6cp5EXZWCEXLCjXZOtePm6v69kPfben6E0EjVj73sk+6CoMF7bvYuxI61syb//oqGLUhwDvmMw
	a1wrjCm0exuQZ3n4A4jbyDSkgIJI6yuNyc2ffPvOuuhSihzZCzorssZr3FqXHhwC01P8RUPXxsn
	J7Xa/6SLUhVFT8MoWEKh1ghv41Px8EJKPk2EvwIJYvW1/oER3jENo+DvUNbqvnLaSNQ1ERWI/j4
	aSkI9SOnnZYcYcveXYUW2TdZ8lFYi+I6pKaqYgmDO/pDYAGm2GpW/OCiowIK9YM/Hmvqe+TChv1
	7wjrtk1ZwCTzTaTeUe5hVUZd4v2qJJcHJDkfaACM0awrPZRbvY3541BldpwxbD2KN/XwARbAZaA
	dbhzcHGeAw2zbI6IsJycFHqCf5fsybY3fYXd7KXKMBIVwqkOXcgcZylFMzkU0B3A==
X-Received: by 2002:ac8:57c9:0:b0:50f:39f4:3a2b with SMTP id d75a77b69052e-514cf036ea9mr92135461cf.41.1778671429769;
        Wed, 13 May 2026 04:23:49 -0700 (PDT)
X-Received: by 2002:ac8:57c9:0:b0:50f:39f4:3a2b with SMTP id d75a77b69052e-514cf036ea9mr92135221cf.41.1778671429293;
        Wed, 13 May 2026 04:23:49 -0700 (PDT)
Received: from ?IPV6:2001:99a:252:3300:d706:9b57:5996:15b4? (n2i9bzmlzk2z87merp0-1.v6.elisa-laajakaista.fi. [2001:99a:252:3300:d706:9b57:5996:15b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b325sm3888437e87.79.2026.05.13.04.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 04:23:48 -0700 (PDT)
Message-ID: <b951a99a-bddf-4fe7-8ed0-4861d93aaf4e@oss.qualcomm.com>
Date: Wed, 13 May 2026 14:23:47 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/UXD)
 MIPI DSI to HDMI driver
To: Sunyun Yang <syyang@lontium.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
        mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
        tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com,
        xmzhu@lontium.com, rlyu@lontium.com, xbpeng@lontium.com
References: <20260508142500.4922-1-syyang@lontium.com>
 <CAFQXuNYq5QYAXRzcUBnyvVh5ofPBVYONCs1dM6qPgK0BDja5Ow@mail.gmail.com>
 <vly3gbft3k76mrcztcn6vxuqadz647hsaz2q7qpmpofowofodb@nnxrr2cdueru>
 <CAFQXuNZKoahwq0zoWg860Z-amTKEefBFuen2fDG1htKjzE7ymw@mail.gmail.com>
 <0636aa3c-5240-44a7-a551-4740956ba5cd@oss.qualcomm.com>
 <CAFQXuNb8w-+xEYeDSxaqK-2hxdu5ADo_Vtvy4iVBzSgNzRmSuw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAFQXuNb8w-+xEYeDSxaqK-2hxdu5ADo_Vtvy4iVBzSgNzRmSuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 63YGfgu_ds1DxgHCyP448B9edRKjCMn7
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a045f46 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Kz8-B0t5AAAA:8 a=VwQbUJbxAAAA:8 a=H94J8E7gSZs0rZod3-MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExOSBTYWx0ZWRfX60uI9h8BHlCy
 3MyFRa9FsOtJEtVa42iMsflP0Wo5syQOVcJ/PembjAK846bxctdZhh3zViuVyK6s7dJtEPQ4Qnu
 TiWx8CFF8aqiyu3yoeVH7UBQmnT16Vs7LRCmX374iwkSiTC4Q5J2Y/gRIbgiheXgzMO/ht+WVjc
 Tbb8uXfCRnR5Tb3RwlHPej8fmvMh56/cNq97PVJ+TCFX3qfynvlOoCUkOAGtzRveFNEmI7tZq7U
 gkbcTjzFd65ESxnuy2UuRxpMAhlLnlZ38fDR4SDvJXWS8BxBGSWnV9iJey8vT6gNH7WsPfmRlkO
 SC2mzYSP2iW3otbaU2orKm1TbhYhMyStzw2tt4k6zHOuvILXaY+fygqJE67g8LvbYcG9WqO17mA
 DV1Ea5sOU3CCvoBMpQF7r1cj2HrHNiF6gWer0peLxHVkF+tgaSucWN/to+4kCAlqw0PCEFrMqKI
 n7d5iXGCY6OnDnPwrVg==
X-Proofpoint-ORIG-GUID: 63YGfgu_ds1DxgHCyP448B9edRKjCMn7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130119

On 13/05/2026 14:22, Sunyun Yang wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年5月13日周三 19:10写道：
>>
>> On 13/05/2026 14:07, Sunyun Yang wrote:
>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年5月13日周三 18:24写道：
>>>>
>>>> On Mon, May 11, 2026 at 11:28:06AM +0800, Sunyun Yang wrote:
>>>>> <syyang@lontium.com> 于2026年5月8日周五 22:25写道：
>>>>>>
>>>>>> From: Sunyun Yang <syyang@lontium.com>
>>>>>
>>>>> Gentle ping.
>>>>> Thanks.
>>>>
>>>> You've posted the bindings on May 8th. Please give maintainers some time
>>>> to react. Not to mention that you posting the bindings 4 times in a row
>>>> (once together with the driver and other 3 times separately) doesn't
>>>> help maintainers.
>>>>
>>> Sorry, when I submitted the patch on May 8th, I received bounce
>>> notifications from devicetree@vger.kernel.org and conor+dt@kernel.org,
>>> which is why I sent the patch again.
>>
>> And some patch trackers will now have incomplete series, others will
>> have duplicate entries, etc.
>>
>> In future please use `b4 --resend` to resend the whole series at once.
>>
> 
> Isn't it recommended not to use 'git send-email' ?

The 'b4' tool is generally recommended over raw usage of 'git 
send-email'. It saves you from some of the troubles and catches several 
typical errors.

-- 
With best wishes
Dmitry
