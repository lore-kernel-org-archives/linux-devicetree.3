Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442A933C518
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035701; cv=none; b=p/3M3e+gGw0ykwuTIStj4Pp+/OeVTqNOuxxGzMM22O90gzZRQ1ZFoLQVQgv5tCHRb0v9f4oZS1WeDw3JVricAeYW4DWnvjRhLo4l19XiGhdaeyK31YS8fMqY1K8eIElr16aiCZ9N//ThnGD+KkqS8bHn6sKFHkt9ktHc/OvWISE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035701; c=relaxed/simple;
	bh=tlGyvOsQ9Q6fmk2zG00jdlVEr+FBACdo3u1quHCsNRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VmiJD60i3n2vhLNJOfTuHER/p016K7a9+q+8axHb/iW3AVVJQu0ahOfHZlig/Z8/X1jwh/QKBQPqAL7RM3LuouQTwmaG/GXajKkuWRn86V6yBx6ENaspw1qcmZ5+XC87B0+leOntnzW+c34yJpmm3jTOMyyJkDM2ANPxyikEN1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A303t2Yn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJhBVn+x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A303t2Yn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJhBVn+x"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6314O6db1562613
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 09:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hz7N9PkiX8JrIbiQeN8cLDfCplbzTBEEohid3YxCQIg=; b=A303t2YnmnedJUN3
	8kxrcrVp5vKYWMkkolXJvxayCp+4xuYLZ88XcsrViQW5MV+ROQE8hEmm4F/PyQOc
	xIMxQ1HIPqsmMGbVI6k3tH0BEjeLvS64LKFUQ3666EE0VMOm2MnkGx6/sswIEt+d
	a4MDzxou9KIPMKO9SD7zT07Y2Y2igoO5Cl3kxhup4SZS/2DC/AkrZkF+JkpldKxw
	5vFG83SkrHuU0be+4W8c4RS0A7dJXQd9uPpwd3+A4raYUAI1R3+Pnemw4IiZpWjU
	g7UeUouilno6+g4poLWjo+SRSQbra/IiyCio56wenH78uFAnFdGgqAzyKY1DsH7y
	iVylHQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3s4cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:28:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954b9b5da7so20783886d6.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 02:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035696; x=1775640496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hz7N9PkiX8JrIbiQeN8cLDfCplbzTBEEohid3YxCQIg=;
        b=IJhBVn+xcyhhz5oOrYW48KLle1hLzRUl5pO+f8LdivVAUZha+OxH8sG4H1IGOpYnyU
         FWJ4t5suX9FjY+Kcio0B4ojQQH6LPC6gdJg3EUt3V2o0hbP2JcFy6B187xGH2u8e2kHU
         FUeWK/RCnqfG3v1t4kCLkSBCaZqMR2z86jU3JqktWbmK2jM7h3bBoUx6w2cZWnXTDh2O
         YPFRA72h0D1AZmfrB0hPs1b9EYuN8d+h6SOWpCMiwfESne62NtQkzpVY8/UvY6vvGerc
         HC3idayiVAB9rN0NRXAeMLzHqtRHAd0hgnhJULxrN/cMGa03ZNRJD89J/h2f0pLerHkN
         T8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035696; x=1775640496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hz7N9PkiX8JrIbiQeN8cLDfCplbzTBEEohid3YxCQIg=;
        b=c1UWEQuDTqnzZLQQo6ia5FxJhY8aUszkx+HTZeF3dXo9CZ4yC8QUOcP1L/u74/tvLA
         hja9AwZcYY5E4eVAfPFb8tMCHazkusvfYDFvtY6a0yKj5sPSVbsi4Q+YqAi5CGcWVRrf
         JhL1vHZcGENqnjhXkyb7MduIgwdby3PLrX5hrkZHtMUrtwJxLjVEUCP96U15r63pbcrg
         uWpMkOucFXqtdwOGZp+ueGKQGKEyA5jZLuDh23RWyEuaZnjim8f2qALeSPCv2cs2NgMc
         UcFCE0846FfdGEixwRCtyqcpmCDuZ8HVLAfQFaiTB8jolvaf0tBnN+tkkVgeuAIThW2O
         Dc/g==
X-Forwarded-Encrypted: i=1; AJvYcCUIuCuIkj17y8rNAjg5QG/BHCbQXBotL8r4T74s19PIRLvpYLlleXPhbmZHGWMmhDfRVAiKBEM77Ac+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyir4LgJcL9ttyh8Dd6KEk20AaU97MQewjzno7oCInraaQyiYUq
	ME22iSiwuvngGvEIqeJ51MliA5R2x8ZY8VRjlU7YvsmN0fq+5oSDJXoRJdFA1Q+eZpqoWXAG+/+
	5wbn4xtUO+W6sQxbnx0+/y/kXHUr9aKt/Z4Y+oMEu/SlE1NMKKeMkJZlNzV7h0Q/R
X-Gm-Gg: ATEYQzwyjyVZoR19UlpG/lCT2pvkdPEmzMS3ax1J+SdgyMO60Mty6WzUX0dsfYuW3T6
	3WTd0XjYjIYCPLclQX3FrD1Fvvz+7ZYuxUcPdw/09PZhkzb6+nai0HYu/STIe3YwpJApjM0GmeF
	9VUeNj0FALmbbf9iNWEad9fUjVWOT+n8TyE6Yj2Qt0bIVnYjjXQetGvi12ZUEPF92J0p4KQQ5um
	MLL8mPQNqJ92pq54BB9/qAZvGqRJX/ARNFh3Ktx41u+zN91BA9zHpAMP8lKUvnXyRzLjA7Q+adB
	1duNVnyWoluah1wPY5gIbtdc0/XfnZ2T3YaNNbnq0nMBCviV707sOyIKxZ7CNRHWmbyicriPm6P
	ZdjI2YE89Vhmi6GXuKznqXL6qnP3CA09j6uS00Yo44727gej9KrMuawSb97hpkgfHTlNViZifv/
	y9/v8=
X-Received: by 2002:a05:6214:5184:b0:89c:5285:200e with SMTP id 6a1803df08f44-8a43a55cfe7mr28850736d6.4.1775035696593;
        Wed, 01 Apr 2026 02:28:16 -0700 (PDT)
X-Received: by 2002:a05:6214:5184:b0:89c:5285:200e with SMTP id 6a1803df08f44-8a43a55cfe7mr28850556d6.4.1775035696097;
        Wed, 01 Apr 2026 02:28:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae23f18sm490825866b.1.2026.04.01.02.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:28:15 -0700 (PDT)
Message-ID: <df008f79-a38f-4cf2-902a-a147b1665668@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:28:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ARM: dts: qcom: msm8960: expressatt: Add MAX17048
 fuel gauge
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260401-expressatt_fuel_guage-v2-0-947922834df1@gmail.com>
 <20260401-expressatt_fuel_guage-v2-3-947922834df1@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-expressatt_fuel_guage-v2-3-947922834df1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TdqCbaP0gZTksDgkcZIqIkUict5vWqQb
X-Proofpoint-ORIG-GUID: TdqCbaP0gZTksDgkcZIqIkUict5vWqQb
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69cce531 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fMfskPNpDUH_GILrBU8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MiBTYWx0ZWRfX070LplQ0zUWE
 B3/6zB4z7F27vQG4J7oMrtjbDLQ/bS1ocs/0uvvpx/Ek++BakdG6IxzNnA0UuBNz1lYvTlKJrdy
 zRTBXzJyjym/bXo9rJLdSRyd8BX591y2bM3BMgMLJvUYSZJbfN4tnN6xLnSp93AZyW7NuSiP8Ek
 RuGzLkI/+OTvencIWfZsP/2B6jCnznulwy6DMcJjiJiq8hOYfkrKWACfk78UBj3h4Ct9oma04uC
 2yZDPWH/zIcTiYC0pB39T0i5WPzR0NifEqOxg+QqfWjaaFH9+AGghqoITSOplTazXmWz+re5EJ9
 2VvhdT9GKdQljWsn4DnEmp58wP9Bw/dzDmAQVl7baV0IDioL48xXR4jcqXEj8NwwFwf6MrWavxj
 5oTnKDkjDYh9/k3INXWmuwXTkqXmWv6bG7GDS7S3+DgEtPWJoui0GF+xUr7ZoRdhfiFWvfgVsuv
 yLyTIXTbTkgpVAjXtPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010082

On 4/1/26 10:28 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add MAX17048 fuel gauge support.
> 
> Tested by comparing battery capacity readings between upstream (mainline
> max17040 driver) and downstream (Samsung max17048_fuelgauge driver)
> across a full discharge cycle. Upstream reads ~3% lower throughout. Both
> track the discharge curve correctly:
> 
>   Upstream:   95 92 88 87 86 87 83 82 80 68 60 55 50 45 40 35 30 20 16 10 10 5 5 1
>   Downstream: 95 94 92 91 91 89 87 86 84 73 64 59 51 48 43 38 33 23 17 14 12 8 6 3
> 
> Each pair of readings was collected by checking the upstream capacity
> first, then moving the battery to a second expressatt running downstream
> Android to check its capacity. The battery was then moved back to the
> upstream device for the next reading. This swap occasionally caused the
> upstream capacity to read slightly higher than the previous value
> (e.g. 86 -> 87). When this happened, the reading was retaken after the
> value settled.

Ha, nice procedure!

Older phones used to chew through batteries on bootup, so perhaps that
could have had measurable impact as well..

[...]

> +&gsbi5_i2c {
> +	status = "okay";
> +
> +	fuel-gauge@36 {
> +		compatible = "maxim,max17048";
> +		reg = <0x36>;
> +		maxim,double-soc;
> +		maxim,rcomp = /bits/ 8 <0x62>;
> +		maxim,alert-low-soc-level = <2>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <67 IRQ_TYPE_EDGE_FALLING>;

interrupts-extended = <&tlmm 67 IRQ...>

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
