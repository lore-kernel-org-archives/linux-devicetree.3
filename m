Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6255C46DFF3
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151353; cv=none; b=iYCKSjzmEExiIzYw9PFW1YMkIcNHtr0uAx5nfHGByVbE+40wpeMkwvO2pPM2ZtOt+CVAOjD1ifqmSU/0yWOlAliDZagXM1yiSwBh2NTYE7eNiaKKtE+oYtnQZ29TwZNSaHtD89H7Ozh/4w9v9BP141CdGLDNKbjhr5cKnL0JEcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151353; c=relaxed/simple;
	bh=Arm8zT+/JUhQkGb7yad6BvTCVvWlZBkot9k6kvbpgZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IaK9GuR2BL352Fsz+ALbLKZZzwNm/OpjIHnKUkyQvuvdgeIS+X9pSX2Nr8MWdF/uzNkJDyfTrFP+osF0LYh1bcmQJtQeiTY3uMOWUg9y8+mMiABpX6Agtl0tLaz+oOYMDcDIwfBaBCAXPXAAmpyGE85gdZDeOgR2UoGv03C6kos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCx6575p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fOtjS6Ag; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCx6575p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fOtjS6Ag"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79QYP2697487
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EgqVn5JCTg0Wh+1+T3L2Kw7No/Apzuy2f2xoTJEufq0=; b=GCx6575puVozFU4f
	I5EKrRfK8kuUJkac1Vm+uvx2r0babcdryEhpN/h583+8jtloZDVr5te0hA732sBb
	UTsTnPEJtRYTnQmeOXJ8NQpRTifYxznjKrQCDRPZRZFcPyIb2xxwj2vK6fuM7waM
	Jq0SL1xSS9PbACfMVS3C2v34oIN3QNjps/GbMIa5j9+Kz3VA3IYPN5UZaqWEeFMo
	Yoi7LXXWUoO1TLgEnk+FKwGskzbJjVEMTqIFibsw+Y188LtsQltZALvthNo15r0Y
	/E6Hq4ZBohHi/xRGfHbqp0DCsCUa+kFZOKdREKa6SbujOQmenMQ6wb0NoYi1ZqTA
	VWNpAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw2v8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:15:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9393ac4961fso96068985a.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790151349; x=1790756149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgqVn5JCTg0Wh+1+T3L2Kw7No/Apzuy2f2xoTJEufq0=;
        b=fOtjS6AgXEougG2a279yT9PqetxT1JkHH6iELjC0MDPLmoC+b09InBaIeKVIwnCCpR
         r/m+MgaHoeSHR5TImSWtCNAXFcSwuFdB8N0JxXzc2bXfQt6m19ugdSgwX1VwaOAXpDkE
         KvTGbR6552VsvqovQYuNUslIE3i+fY9ScjzuxWIoHrB1hOLfI4jY1W04NNF6Urr3gscp
         n0JFHrViDgtnsrKP1Opd6lp3qvy5xcEPXzKmhpvDaU2xcHzrV1nrDcMnhaPoyhbIIT7f
         r0IRYZnr4+5FeNrJcWD1+QB7AKfCBAa1Mk65ltz2DgcXMBN5OEzc/wXxz6UrN3ALGY8Z
         TykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151349; x=1790756149;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgqVn5JCTg0Wh+1+T3L2Kw7No/Apzuy2f2xoTJEufq0=;
        b=ppEMKG48MH9bj7htnNJgl9MZmSG9Wf2OGE32dzb5ypDWaZPD+4sA3Z9s02CukIMC2A
         C3S/d/XCNufS6CDeBjBFvKFMswSMD5y2WJva13kFPBVEvmsqnbtIlQmXo5wX99XKu7H8
         I2K6XF47NIeRHx8cIfr1qDRX7UdsGw+ujoX/0XtpCSnbd41UXwW21FoolaGdn637KBIj
         VL2Irc2PIjoDOb1Osn3pRK2dX3Nx/L835XbcblH+4sHu9RHtARgEhOHgH/EIFJjH5qf7
         bphptvD/z5VoEk3QeGxuwYAvsdN8yFqsbeGNqUkqrnLa24DvrKinPYCMFRUTfLYa7C1b
         J6zA==
X-Forwarded-Encrypted: i=1; AKwUvBw0PDCmxysoENyLqcS3RZfjfbcAuceSaViM+nH9OePJ2k/6+1OY1Pyi9nykT2yoFaXWxAU6fhn1WB/3@vger.kernel.org
X-Gm-Message-State: AFuF++kJO02SgFRiWTDKaYD/O+1s85yGqCei6k/jY8lFz/BAp7RjuyAo
	9idWVvwgQ1nRundYDz0TVUM5QM2JzFewleX0nsDpb3HvqYBUGD3Q1Dob6YGRAODYcj5SAt12WuX
	o3iwhSYOrowh2wSlhsCeHX/1Zsvzh2V/LZvjFihrpvKbFmjASrSApm/T6+PC5xiNF
X-Gm-Gg: AYBFou1pMXiJn9zxy9NIlm/Pjd9nxuiCNLOFJarPa2kfthwq1MX/Ff1qv/hAGKBp4WC
	QIeiuGpiEL8a435azPWAgpAseR/s8SxjhtA8gL3hBponD/bfYcSwOZzSowGTSWW7eiXTgiRuXq+
	sb/O41X5gTMmATpi6/y92t9h/gahOwWy8KzheCUOZdB6Kzot+uErfuGYy3XLJh6FIAbeacSvDi+
	lCv7zLdeB1lgLFUseNnESPB+bygfDruU9G3pCgDNtOZQI1oc1+5avGLX0vSEZBSh25lC63EJN/o
	Sb0IX3pFqPAj7wcQweUGAUP4KBdJEuuYji27JUG+xeRRxVtJ7mwj36qcY9JNtt3qdHLoCOzUCCi
	XAm2j+3q/Xz/5nD7WtSdWdajQBmsiLh5E7cvSY+V9i3mQwRE=
X-Received: by 2002:a05:620a:438c:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93c251af1b4mr282503285a.34.1790151349432;
        Wed, 23 Sep 2026 01:15:49 -0700 (PDT)
X-Received: by 2002:a05:620a:438c:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93c251af1b4mr282499685a.34.1790151348996;
        Wed, 23 Sep 2026 01:15:48 -0700 (PDT)
Received: from [172.20.10.5] (82-132-216-202.dab.02.net. [82.132.216.202])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe0c3731fsm42528615e9.2.2026.09.23.01.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:15:48 -0700 (PDT)
Message-ID: <8b62c6b1-3055-4787-87f3-1ea990f8b546@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 09:15:38 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] ASoC: SDCA: allow building without ACPI
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-2-srinivas.kandagatla@oss.qualcomm.com>
 <arKDa69Aggoo32CE@sirena.co.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <arKDa69Aggoo32CE@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfX/lelu/ARLWaD
 L5S3blmv1QbNQh0UqyvMoNbrtiELvk53YFJ4cndPd9hl/jpXy8PEywAgD/Q1DphvRUoBdUjIL2s
 8ZAl11amrQkgShtxzGgA/5hczWYo3lQtiD/ykcgybykAgM0Op8GKnz9ce4DfHyBJDGgIUyG2692
 BomWjPxXNm+vfhdvNCp83CM62nbKmhvRXjLuO9y4TgVtO4e+UYsjOJNiKdw5TK0aTSdFulGI1Cn
 Hi2cZY+gm7NWdehKAFZTI7Cl7tW+AI56IdGSgeaXBI9V6F3wRV7nysgUrMyBD9Bvnxxv0l9Imzp
 TLvvCj+mPF2r97Q81E0K89JUo9frjzAMQGrSesaDXZXIfJxKXBnLn7dRWD5hK1h4mem1QucYBS1
 8uX3kiKmOYKzLuxsGlbxefr5+VldNcM6ytr4+2iXQ/KS8Y6QlXF9D4727Ziam3yBQjG1/lwnUHW
 wPEZBaXeyAYiN6a6veg==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab38ab6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=GdRps4uEH5l7/IE9oLSJdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=vW_vOncweQm3iN5ZsRUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: SbuoOLNxQYNHuOypMWKXmfcyE3GzghDZ
X-Proofpoint-ORIG-GUID: SbuoOLNxQYNHuOypMWKXmfcyE3GzghDZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfX2cElGQl91mFc
 Hp8n0uqGAnVACbAaCL+CUi9dfqevjZ3UkuOFXJFw6utUAVv6pPQY6nniNQ2eD7LBC6dP+Guex4m
 AR+d7CBvIq+Ojat3ZJrZErI3Hmhhk2I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230032

On 9/22/26 2:32 PM, Mark Brown wrote:
> On Fri, Sep 18, 2026 at 02:19:06PM +0100, Srinivas Kandagatla wrote:
>> The SDCA class driver is useful on non-ACPI platforms where the
>> topology is supplied statically via sdca_class_hw_ops.get_function_data.
> 
>>  config SND_SOC_SDCA
>>  	tristate "SDCA core support"
>> -	depends on ACPI
>>  	select AUXILIARY_BUS
>>  	help
>>  	  This option enables support for the MIPI SoundWire Device
>> -	  Class for Audio (SDCA).
>> +	  Class for Audio (SDCA).  The ACPI/DisCo topology parser is
>> +	  only built when CONFIG_ACPI is enabled; on non-ACPI platforms
>> +	  (e.g. ARM/DT) codec drivers supply the SDCA function data
>> +	  via sdca_class_hw_ops.populate_function.
> 
>   $ git grep sdca_class_hw_ops
I will remove this sentence in next version.

--srini
>   $

