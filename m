Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB96346766
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 06:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850776; cv=none; b=YsB/DMK0UtZjWsMKkqoev41z0ndwfCKIlQs7NrREF6GxrvLbW2465JbTQPZCbaQjdgVQcdviuUfmNVBSJU9pDWDh2FAC7so6xg53uKO6hX0wVxwy0WTVZUPyQGJbiQAHezWBDZEmU2cK1EBFjUA5Q63QxvsjjAclg9hPikx4yhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850776; c=relaxed/simple;
	bh=7fCxURM1AGQCmDMGRSEptUZ+VduxXhPEEzz+5OoRHzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJ+HsgMhH/p+J9ldS2qOXisOQRGFATbR5/7lpaQKU1k6jzW+yDGKHviJLrueZI+daIz4PemVpos7hNF7YrKRuZGih2jUEkVnEuUo2fzlTr5TAIdF3YZa6Yt0EzdsyUSdmLXX9awDeXdgs8GBmtbIhPEqh+wmOIYkLYUWcExamSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yy64AojU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DH8T/Kzk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yy64AojU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DH8T/Kzk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M4hj2712507
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 06:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85eScO7afUK1ow8GKsvDySdIJKfhsGnJ4YOQKm+uKGQ=; b=Yy64AojUyOvoPBzl
	yOLjDgc0IUvTrGCCLw0u2A8rZaTosTsd3/fDTYB4QNuGG9lmCO3vWdqeW4DgUaGW
	f12zDlt6YnppcyoGX/ApqcuIqcRlDnyyoe1u8fMU/ur8oeM55aR1c7i9HqKpJfuJ
	zxtE1h1hz1aRIYt45ISnKQsgSoAMPHj78Kiqg5Yewqh+Okwzt2/B0ZJbjTTR0NDH
	BbrJEu2LAVj1Cyyhf872f5r4xSklTi9sooPzR/e+SLRzApcjXEhf9WncUf4IW2U7
	KWUNVfips6SI1gzqrD6diGHffJu8S9pa2L2fHzhhfDh7BOS5I0LTqBdcGOirzhJE
	dYYYlw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqkwnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:59:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fa40fed05so10549551cf.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 23:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788850773; x=1789455573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85eScO7afUK1ow8GKsvDySdIJKfhsGnJ4YOQKm+uKGQ=;
        b=DH8T/KzkCmDPeN45EZo7KGPNt/6W6Xc6mdqbjnLWqyJdWKme/8JEAun49zO9+8I/YL
         n6yZrZwlK3+f5FedG1XfSp3RVDR6CKt8OGh3KUo6rvpOQdreL7Is+OQnsXcDGzylfwDy
         BO6P7DiHFr/izJ4yoqOL39m1kav4NrDkFULm33i5fhUuCeDxIHMs9TKZnb9vAc0/Q3oX
         cHqhGUMyiiVWE+VDLWX0X5F2k81A4mjtvp+7AUxI2HUuF+PM3kfMkk0XCN/HarlfspR3
         XBWeZI/5Ivqoabq3iwifvsY4v1gvCRTmIQVXq2q3oicfu/CWkxFHjWdjzJkoNKMX+CRI
         yCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788850773; x=1789455573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85eScO7afUK1ow8GKsvDySdIJKfhsGnJ4YOQKm+uKGQ=;
        b=mYA1QHixcJGZ8TrdkAqMsptR9laXMK1+sHnRWoDhemcF6H1la4y2LR5hEoGUcy9pJ6
         mREVdMcxbrpHrlneNtIVL4Nt3FilOp8p1Hhm5QjG22zTl09auCQtm1z+oZaywxqOLxQY
         OKmWsanKf5g9KwQ9eipjETlC1o/HH6XS0x8a/jY4sBMOarQTJHiA442GEznI0KwQrH0M
         6T6H6XaSZU60ujg285RkM/FQsXnDK8nnU9qYI8zMeUV44aigOkwhgHw8/Sm5ca+KSvAp
         T5QfOpKVxWS2BOT/q2H5JENYQcVGtUo2KNhqwXHXrHE2V7fBqqbgej89aunyUDT8xWBC
         kB+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwcDPi8Jbribyp977wqGJAVVhMePFlHvQjMyBzvj0OW1DN70G5Kgp9k11dh6KqaGRjCHP7b3FVp1uzl@vger.kernel.org
X-Gm-Message-State: AFuF++kxgzBr9m5oeXGOEaeLusRk8X+EkysLQGilE872QZE0orPkodVY
	ppvdbIR+0m+D0Taf5Ul5DxSrvTk3ZTpAwsVLZv5z4Rx0y/vuAdhXUwfW8Zkj4ORzJitQflgRyxz
	YZDS9+5/BwVsxnYH/vL0dfdzCAu6s1Z/vxppeHEnFPA8iRauFR/ys7P5Ymh1JeTQI
X-Gm-Gg: AYBFou3J9aORAyD0vmKV4k9jRSJ8h6kFljpQLzAOLZl3pJQPUm3EDmzqtufTkRLXLvM
	vRV6mRhWs7AFBaNPDnWQgrLXmJBW20C+7sBBkj6aZXL8twrH7XFTHAINcDqvJbbBeNq/wK2lxb9
	IUfH5Ld8eToCdQ4nDcaWVxH+6Q76L9gywNMOrPk3jkDYPptq9ZbqSuTbW6+b+6yLKdqLahCjOUO
	ejjjNDKDPppj5hdJaksibknzOTK+2alKv71tEBMxZomncJhONUqMd4Ofdv5YZkxJEQgG3pKmuRt
	PfK9jSu9oR0Rcaz72BJTafA6yhFlXca7sj4rErWzxlLbaN8IpA4VJ8si+IP4kw9/kPR6yBwXnoQ
	QKSpINR5t+i8SWdp//RIKbQ==
X-Received: by 2002:a05:622a:180c:b0:530:4156:8ad4 with SMTP id d75a77b69052e-5305613abe4mr224744851cf.1.1788850773519;
        Mon, 07 Sep 2026 23:59:33 -0700 (PDT)
X-Received: by 2002:a05:622a:180c:b0:530:4156:8ad4 with SMTP id d75a77b69052e-5305613abe4mr224742701cf.1.1788850768302;
        Mon, 07 Sep 2026 23:59:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68e8f2fsm5735990a12.19.2026.09.07.23.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 23:59:27 -0700 (PDT)
Message-ID: <9678155f-d1d2-4592-aa95-28ebcb412c9d@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 08:59:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Lenovo IdeaPad Slim 5x 14Q8X9
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260906-x1-ideapad-slim5x-v1-0-7ccffbe6bc4a@oldschoolsolutions.biz>
 <20260906-x1-ideapad-slim5x-v1-3-7ccffbe6bc4a@oldschoolsolutions.biz>
 <2c524de2-22bc-4bb3-9c20-ffe197819acd@oss.qualcomm.com>
 <84e545b9-3c81-49d0-9ac4-1aa84eabd3d0@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <84e545b9-3c81-49d0-9ac4-1aa84eabd3d0@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MSBTYWx0ZWRfX5b9c8H+tBGkD
 CW3AGdE6WgXR2yEwDGqo2YwxCVzOiEWVkiLuMZ3/o4TuvVC0vp/6C1dA6bLxYTExcl6bP0TExms
 lBpECLdjkL0RWNze3BPQQKXDr8v89mFabTW/kLW/COFX1oF52aEXOO8pwpoPlO12X+cO5vwieJD
 m6cprVjU2QEvnoTOSeqb3jyg03GQzPBzhkrJDc2VH4Mk1aCucm5dBzyJ59gy8Le+kEYHBlf1WUJ
 ibfEguCb8/ASt+Bgv64MKPYn+UMb/ZbA6HvQdJrtHYC8/eLkXMHJMMjfyDka6BMVcxU9vsoLJJK
 uVgIEc/oX6AAZljNoxej0ZRBfXRz2Zq9xOtoRXjB4dsvK96GeSk19wQoUAWj/E+o8R2e+OLVTKi
 egATxE3EikSoFtRdj5x08cRjlvF71tyTT6uWGI65iRRukQDYLv8HeWBOj/PZN4nscg7QsStH4J7
 N300zZJKwUJUHHrFgHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MSBTYWx0ZWRfX9VEaE/5a6PrM
 OMDI71T6MWFJqJNQS45FDP9b9mdJwMp6lIJF9FSBtVoZaHBuZpfiAr6TEgSKUcQA6bSpIJ/VQiw
 ucZqMwmPp7nMFwiuRsz5GOwDESaF01Q=
X-Proofpoint-ORIG-GUID: xYURGUM1bIwA4LIZPfg-NkR_IPbCMGEN
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9fb256 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gxl3bz0cAAAA:8 a=3qvD5ysIgNNsp0o9aF8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: xYURGUM1bIwA4LIZPfg-NkR_IPbCMGEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080071

On 9/8/26 7:18 AM, Jens Glathe wrote:
> Hi Konrad,
> 
> On 07.09.26 11:14, Konrad Dybcio wrote:
>> On 9/6/26 2:22 PM, Jens Glathe via B4 Relay wrote:
>>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>>
>>> Add a common DTSI plus LCD and OLED board files for the Lenovo
>>> IdeaPad Slim 5 14Q8X9 (machine type 83HL) on X1P42100. In some
>>> regions this SKU is sold as "IdeaPad Slim 5x"; the "x" is the
>>> Qualcomm suffix in Lenovo's current IdeaPad naming (i = Intel,
>>> a = AMD, x = Qualcomm).

[...]

>>> +        vreg_l4b_1p8: ldo4 {
>>> +            regulator-name = "vreg_l4b_1p8";
>>> +            regulator-min-microvolt = <1800000>;
>>> +            regulator-max-microvolt = <1800000>;
>>> +            regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>> +
>>> +            regulator-state-mem {
>>> +                regulator-on-in-suspend;
>>> +            };
>> Why is this necessary?
> 
> I had a debug session on the Thinkbook 16 with Grok where I chased stuck mouse via USB dongle after long suspend. This is what resulted from this, PTN3222 losing its state on deep suspend when the vreg shuts off. And it solved the problem, propagated it over to the Ideapad 5 device trees. I also observed that on the Ideapad 5 2in1 before. Never seen on the Slim5x, but I got that one after the change was in. So, yes, IMO.

Alright, let's at least leave a comment for the future reader

Konrad
