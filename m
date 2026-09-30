Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE56D4E4C50
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772909; cv=none; b=QocKIcYdksCHw0oLT9SFuedKn9p5lxtWWycsduGWeq5/3naOBgHvPrhmFmMKZEaKGa4TVdc3uEQzaBqoaR+9iAMTYItn0zOZ8oK91vW5sGjrSIbKxe6Z0CL8CzVoMcOVO0o/1KN5vXl4FbQ4lu4yqfHeGVgZx28fu41zNuH8sx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772909; c=relaxed/simple;
	bh=Ic2qFMQrtdHrOuKTgXc60cQIRArJ0xNCZDGOG5y3oPg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IhF8dblzOSzyQ5QJO5abm1dmVjMSG2mts2GGeyz9teTxGIY4JsvQqYYjo7WnVlBaAEnOaMvlO5OlpDhkEgYm/o5GWIgDimY7c7/ejcQazfTEueMFyFLtaM0DBrNcJSrHMg2uxQtr8Foua/pNeK4rXoD+SN7igawxBPe+WPqxPhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SGIe3Y/D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSK1Hi79; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGIe3Y/D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bSK1Hi79"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UC1uJQ3403522
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nLZxX/P3cORqRfG3m1LU3APd16KiMYqBQy2nKdjCkno=; b=SGIe3Y/DDCRBVqYc
	JpH2YrZwzYxYZxozDGA7bo9hvjBKS0a8+yTiS4xzc++gFhYhiKnr1tNZUyqqPjlM
	e9Jf/cOQeOnaUK05aWXBM6Coq/iWqJrPvKXIpwKfxcYPy0jWxk+HJ16IQENPwlWK
	IvQK6gV0ilYZ6rvAQODxQ9flTnqn/3ZPzQz0AYG0kvDIG6e55XDckUnZs4WpPkQb
	kwu9B2nULaLssVGa7NYNsiUpN+1tDQLBVLQfsygEV8+CXb9gSSgD7nKArTuApd3q
	WwSBy3FUUckHcOCkeHBEcg+a3OWMJC5NIb7Kihcz+2a0EAjX/Py5R8RJR+SJallM
	8mwkMQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rj2tw26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 12:55:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4dcfb2f81so410402a91.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 05:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790772899; x=1791377699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nLZxX/P3cORqRfG3m1LU3APd16KiMYqBQy2nKdjCkno=;
        b=bSK1Hi79e5PUhCOjyYwisL5IgFs1VqxCvVbRjckQrssd3MrMpdgRo7ZOiO1ven8rwo
         9fUj/GPyNVaVWv1imJUvE1q8c5LXVChN85gFC4adXvdKvKRT7Gx7pTEo15Q54gdwWz2v
         ndeILqR2kxYnsElDQDYEc+sRnLJIEPMs39AfMuL42eQTKj+kAYxFbpieSKk/34vo2kCN
         to1Ds34B2NTEqHQjhgkquH2GHYRiX0H1eVabQNoq6/0/E5OxLl7FTTcSmFB58Sfl/M99
         ua3MQUCfLL5WJLWL1WpKoTB9Wyw5I2kC1qq8mE/oqJHlpvvdxMFK/n8xp6/0E6wO96pt
         T32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772899; x=1791377699;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nLZxX/P3cORqRfG3m1LU3APd16KiMYqBQy2nKdjCkno=;
        b=gDCEOffUXhxwIHdJKg04UzdgaF99b43VLXjMVTjDMf0XIRhncVX5mP/UceKxbmW9Ca
         md4aTwGYP15urC5TgOEV1TAwJwQ5mGGAI5W/YS1orgu68wNEUqFRscKKJgNrM8uDnX7i
         Oin0vY/LVhFApymhiVtdkjzHbxO7GFZovUdTaqG16onwNjAkHKtPwrnlXEGu8VORQmQx
         2VLDQmIJ56jlFPIFfbPEi04luIXvAsWNwJ1sRfLo5XxuUCsGuOVgcCJy40kHs8wvUXnq
         SOYII2IWYrXoS4y3yQlLcuI6UlvoaCRoWqXSmyS4l/5DbPCZoRPzVjmi7piBuFIpgUcM
         Hmlw==
X-Forwarded-Encrypted: i=1; AKwUvByILe/3jxXE9/AYiodowGKnsPBrUxTqXZ5aYqCQCS1mQFRyeJ7dOhoXB5cfnFHr68o2wYobwfhyS7nQ@vger.kernel.org
X-Gm-Message-State: AFq9FYK8HhwFjg5I3vzuTupC5SWMJ+gCjksBF12U0Y2nqlcp1vEnnGSG
	svYBJyFw1Ocwa39RCoCBSN+gOLaJ3AZ8DISpT68OUPUtN66BuWEXoC/PEKrCUZ3JhaQaNIVVY9o
	oAFjC1s4oSD4/SX78yI852WFxfZw5IVZZX093yED586jtBxtT1kCOStETUx+eNW14
X-Gm-Gg: AYBFou3H7V1b93YxvezWoCEcGsVvHIRAMWLkupeX+W+zVGJ3yBwrqzVrPEswAauq9xa
	gbcHaXc1ST++nL7XgqVvj7ZhDY658ZitwUhmuV11Rbq44qlmUn1VeLq7aCbEtHDTGpQCg6hk54T
	wjU6FzQnqj2LLPRh6JufotJIPOP+J+NqbnkEs4DBWDVCHQuBA6K6z20x8pjdbmyLUCC4exzhQPI
	dvl23n/A6fOr/pl58JgeW34EhvVrqcMj/uDuTiEKL+WRRJ5hB3dea8HMxrG6IF8XFN3GbLmioH6
	M2J0wtS/UAWRmPU1T0q/LokFbQr1lNeWIUrj0L22Kkr3OBbDnRLru79++X+P1j+RUe2LAbfsQyL
	yX/6q6HsEx4QxUVCu3lbuItoR6HaQif14Yioh6bPc2QT46VuXwzsf7wXpAzJEDEg=
X-Received: by 2002:a17:90b:4d05:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3a4d276edf1mr763363a91.13.1790772899338;
        Wed, 30 Sep 2026 05:54:59 -0700 (PDT)
X-Received: by 2002:a17:90b:4d05:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3a4d276edf1mr763347a91.13.1790772898774;
        Wed, 30 Sep 2026 05:54:58 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce16abc2sm3270351a91.9.2026.09.30.05.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 05:54:58 -0700 (PDT)
Message-ID: <04f98e0b-e54f-4641-8a07-eea7a998c2b1@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 20:54:53 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: Re: [PATCH v17 02/11] media: dt-bindings: Add CAMSS device for
 Kaanapali
To: sashiko-reviews@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org, olteanv@gmail.com, media-ci@linuxtv.org,
        vkoul@kernel.org, neil.armstrong@linaro.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-2-dcf3fd37f76c@oss.qualcomm.com>
 <20260929060809.5DBA61F000FF@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260929060809.5DBA61F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 49OYjyGbpRm_kARUXuui-bGJYscCkPn8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX76XGV9nF8Rgo
 V186Dfk+Zh51LHbLqSN13pSL08zQdc0o4xJy5x+mECoZMq/P6uw2O6FljMd5GBOpOGBVD4a8fOr
 0RsyLnkUwPZNQqRDUmJU4cYj0DEqjUzF47NmGS6NF6/p2O1zPVtoU/wBsPzs8Ru/IIsZtxXyEbs
 XGouSkJ66h0/I9ZetlKO+OYtIyAeGtLj3IL1iqakd3LTI5pn2j9I7LyDaHHOWoBTD62YP0Tvffo
 AmlyL3gPUmCEsQF4t6peu0zKwkrmZQRxYwfCC5HvVX1PzFwEdc7bm6GN8bwL3eEOjWfq8PLjGDM
 MhYSx41B93j0GcKw0MIwRcWTQXOnw8qLOlhsCm00geXUEQf/C1jXZKNFMFayoWdV4uQ+ftviL5+
 136IH1wzChKEiCRwr+Emm9rYoEqbRtEhYTH/7xM4E5oepWMt8gauC/jqhBqs0T3nHlFsvPYdy4O
 +hbeI/9BCUP56xcjpSA==
X-Proofpoint-GUID: 49OYjyGbpRm_kARUXuui-bGJYscCkPn8
X-Authority-Analysis: v=2.4 cv=Ypya1IYX c=1 sm=1 tr=0 ts=6abd06a4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-qPLxJttfSs1q3B3DocA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfX/lziiYR5x55T
 NEQ9VT4LjIxZUpyzjBn41JLMC8GY6K4wswauCR5Banp8Oh3DNwYZGYMdApC1U2F/W1Qc4LjSyEu
 MNtA5X0MFgsCaAIQcv3PYn8JT9HtB5s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300051

On 9/29/2026 2:08 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] media: dt-bindings: contradictory port count description vs schema
> --
> 
> commit eaf675a1ac25eea3cc950df0432cfe59f97c1517
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> media: dt-bindings: Add CAMSS device for Kaanapali
> 
> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
> platform.
> 
>> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> new file mode 100644
>> index 0000000000000..1f8b18517e13a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> [ ... ]
>> +  power-domain-names:
>> +    items:
>> +      - const: ife0
>> +      - const: ife1
>> +      - const: ife2
>> +      - const: top
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    description:
>> +      CSI input ports, one per CSID. Each port receives the CSI data
>> +      decoded by the matching CSIPHY.
>> +
>> +    patternProperties:
>> +      "^port@[0-5]$":
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description:
>> +          Input port for receiving CSI data from CSIPHY 0-5.
> 
> [Severity: Low]
> Could this description be updated to clarify the port count?
> 
> The commit message indicates the platform has 5 CSIDs (3 regular, 2 lite)
> and 6 CSIPHYs. The top-level description for the ports node states there is
> "one per CSID", which would imply 5 ports. However, the schema allows 6 ports
> ("^port@[0-5]$") and the nested description mentions receiving data from
> CSIPHY 0-5.
> 
> Does the "one per CSID" text need to be updated to match the hardware layout
> allowed by the schema?
> 

Exactly. It's reasonable to remove this misleading description "one per 
CSID". We control that one-to-one CSIPHY and CSID mapping manually and 
the real multiplexing result will be different.

Best Regards,
Hangxiang
