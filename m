Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECA643A81C
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 14:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784902947; cv=none; b=Rv0qMiXtcCTn7RJRDomfkkXt1FbCp2Np+BMbjy+JcBygG27auno+0ixO7SAprupig/3ruuZ19pCuFcCVFErH+1YsBiOk7/Lu6yR1MJN1hYGBGzhU1Wljj449HiuJX4sLgt+7JOe0i2lj9c026ERSHbegFY/1ibOPOWjLuoHqS8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784902947; c=relaxed/simple;
	bh=SiicBPU5QXPJBP/Y6OP3MPdQKCvcgt1j9GtdPh9+O0o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PFWOO243Rau1wlxQwCx1oMpuZw2NSSJ7p4vzKCX1/zALabzejzP5W8e+puytjGlGXOYO8l6eyLxCEg252IFq3ktV3PSoi3kjH5lfaPOqm9HGHupUWrFLZnvGIQemDD9107Riyn1sY7Z9mFwSuUHmSBULFyUQzfOUbWx3RFw/6zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7N08H6D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjVNhVFF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7N08H6D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjVNhVFF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OEHTSo3467898
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 14:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qq+5HQhCZYPHRe9K+GkskIP8n/de4bd59tspZT/HD5g=; b=T7N08H6Dveazr3H0
	TRI92VgrnYOorbW5cYO5aBygzqSlRCkUuITQzXnnE2sGzivu2l8ha7g//eq6CAQe
	Ff7It4qOjCcvMWqsH82vDcw5GI0V/S0dgf7FhkhJJoQwO2ZLqx+mMAOyDbXvOCYr
	dtEgUxpMG2XnOpEkYAj7bZYpwdokqzWLYAXI/uSwzhqg9CAB+pSsmyyC+AStgvit
	G80+mzg9FVHNeRW04bWu3QxUZiOeKwVaLQMPQvpWrJUwW4MrNmvsNMzpEzXrZGUv
	BDD2l8jhWDTz52e94SClDIMl6wORnEj1+Sm60mXa+jx6jkVsmSiFs+N/k/kBVYaM
	KxyK/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm9pd00wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 14:22:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so8285811cf.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784902944; x=1785507744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qq+5HQhCZYPHRe9K+GkskIP8n/de4bd59tspZT/HD5g=;
        b=kjVNhVFFzZrl+7I7Qgu+JSorN4TgR+37SPA3FoXoCvVfOkx8MKRYtaojNS+dcBUVqw
         /O4DVF+3OjSye1ZGx3yyy+rz1S9djTvN8pigYHbITnwNgy0UyrHo38i7mVNFzpfrup1h
         Scha5PNWnf51HulaJr+1ePITj/YrWEWBgBaqkKnSQScxd7F6GMqh55RhxbAwf56lN3xT
         ghcK6S+e9U5rdSctIxZb7N9a4hX8ct3LiZ/6Id0UMsPpxVMvpA5i4wSxlKYMOE2kUMrd
         6CxXCeEaJ1LRaxFGohnYCO08OFEUE1LoeQ4sYTad8AhY2omFqP1+PKYpDw1VsnGVnzRW
         lCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784902944; x=1785507744;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qq+5HQhCZYPHRe9K+GkskIP8n/de4bd59tspZT/HD5g=;
        b=D2JSCwozWqVNiWniqI+6QXnMvLBqjrCLcsJyL+uDDSql7E+HRp6IoFUi9F0bPxvAm7
         8zH4TUQ1AUPUkYpCVDYtD61iAeAag0J6fvb7l+J6601HdyVmRTiXIkrg5uAjm4KLeZRp
         IMcCuLiLqgJcKpU1xuR0uRi9sVeFmogvbTVocwxIPSI8G8F0LgAOqJWq4SP127kbb7/U
         ft8SKsKZMHiz1lWoFWlroeddgQ+OsPSkuBOxJg9Wg8UXlqrE+Hkf427gOLxy7uGxuqae
         KdNEcsyX8zTaHcpdTkbMFyJ0XJgaSIrwB/B2UbX//QRES0OvZgiz+Y/fjWONwaIBjTM5
         2ZSg==
X-Forwarded-Encrypted: i=1; AHgh+RozGQzckMj0DjTPwPy5PSS7gqLrql25uV+Ha0/1O795XqC/r78qRNWPPpXoRrLaT4UFi6lUOgDxoLKZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxKbVl35/uIj1ADB83z5kKvpPTpGNi24MGB0gvfAzkdVl9YQNNK
	5jCXzcySYulp3ypgwQ16Tv0c5AEeyYCJBFK2BVKGRGVeiuuIwYS3vyuXVISwFL7Ifk2ddoQka2c
	F5DHcyn0JkOIlmrN6bt2IcTg5fx2Wv7Lt4EXd+kE+S450ltq/IKiDvoZZHR8hdq6S
X-Gm-Gg: AR+sD13qrg5/480mzONxK5X7Qe19ZXtWs3aEItskGM/U9yppCF3kpWLLl6JUYB21n7E
	NuimqZOzUl493yxtzShDmGy7pgnusI7RoyEuwtyxpY4ljFK6xjKuu3v1Rw2er58EoBiRaiRR9NV
	SdBT0vUbM9TwfBHXHQX9gA/dPUYzBjJfsy2UO02hew0TocgyAOuuOX9sJgElacn7u5f4PDJQzsX
	J1XILRL/+gMLwr8+mZ2mldoyN4/U/wuX6mB+Az4bIE1GWk3UMrQ4qEK4Sk4QJSyDk1ajAhGctri
	5FErAFyReRq6Okn7YpheTD2WxSzvWSfS0Lxz9UBLT67/fkEn+d8J9LR4DDrFxGJj/W4F7iURnwX
	b47c+4KBsYih7PtyvtU+ewDu36VBcMZOfS6v84du3nmwk6mwAFbxad3GyFEf5wyylRnAZQvJh5S
	zqsyR5dycQx5EM809PWNiu7gQNObTyA0igGl4FvMot5dMe0Icnc6n+8Eihmw5lzK9aM1w=
X-Received: by 2002:ac8:5a02:0:b0:51c:1590:8e28 with SMTP id d75a77b69052e-5283de1c72cmr75388871cf.25.1784902944458;
        Fri, 24 Jul 2026 07:22:24 -0700 (PDT)
X-Received: by 2002:ac8:5a02:0:b0:51c:1590:8e28 with SMTP id d75a77b69052e-5283de1c72cmr75388381cf.25.1784902943917;
        Fri, 24 Jul 2026 07:22:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:8e96:3679:b9c:de47? (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32eb7066sm351985766b.42.2026.07.24.07.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 07:22:23 -0700 (PDT)
Message-ID: <b690426c-94fa-43b8-a805-7413e45f2849@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:22:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: monaco: Fix CSI I2C controllers default bus
 frequency
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260723114844.63093-1-johannes.goede@oss.qualcomm.com>
 <111bfc31-7f02-4875-ab58-e92bf1ccc44d@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <111bfc31-7f02-4875-ab58-e92bf1ccc44d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8OdBmQDD4UIYU8YE_FH4iAUKxG9jHuep
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzMCBTYWx0ZWRfXyynwJhlovKCA
 XeKRoPjrkR7wUgnNFZQBxcBT2ruvdS8/vZDa76TK0h4QYZucM9AY3njutFzADhzxWSFy/FF4JhY
 cMoBWlyyRPcHozHwZEVfbSq/6XmsIWfeAY6+XX3c0qTkJpPuhejUh1bVd4gM/yj7zAMT20suj8h
 Ps0dsFHD9ETxhrH75CyKq+bUH/ffc+wMEnpagR0a0zqfLazsLu5joxEUgaFjMPJDqzJVsjoeDO/
 m95tp6oQxPsI3t7qT9EMEOag8HN+RcePnSN6loiYRz7SV1/hQJQ8Qn/GriSwhMcgXgY1L0og2Pk
 I5GsNvzI/cPfRDx8O885Bi79qFa8Z6VilDvsVxxiwf/b3IFI9UBeDlpowrOE9ppK/OZXudZXJJM
 gi/tbdDgOqi/CjEuxVJmJVO3PugJhTj8FU4/T1UkSW0HuhLIJXJ5rVBElEKfiEZZzDGA+7izpCz
 AHp9Nqo2DxRxbojff7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzMCBTYWx0ZWRfX4dhkyad163Ht
 1Q6OHBQ582xfEUKTrUI3LanQK216CkjoLBbtRdDdiKzqX1fL8cAq90b590Z2cUdmKAMZ7HB3jjK
 yhVE9gcpfddAo392mcma8CX5AAvEIOE=
X-Authority-Analysis: v=2.4 cv=DLW/JSNb c=1 sm=1 tr=0 ts=6a637521 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=qOlS_0BcxAoBgsU_PeEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 8OdBmQDD4UIYU8YE_FH4iAUKxG9jHuep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240130

Hi,

On 24-Jul-26 1:42 PM, Konrad Dybcio wrote:
> On 7/23/26 1:48 PM, Hans de Goede wrote:
>> 1 MHz is quite fast for an I2C bus and not necessarly reliable, change this
>> to 400 KHz which is a more reasonable default.
>>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> 
> I guess this is a question of what's more common among client
> devices. I assume you have some that aren't happy with 1 MHz?

Looking at ACPI tables for many x86 devices 400 KHz is the standard,
with some devices going down to 100 KHz. 1 MHz is pretty much
unheard off.

Note the official I2C spec is limited to 100 KHz anything faster then
that is an extension.

My specific reason for submitting this patch is imx219 sensors on
Mona sometimes failing to initialize at 1MHz which is kinda to
be expected when going for 10x the I2C specification max value.

Regards,

Hans


