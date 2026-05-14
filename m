Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD203A7588
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756320; cv=none; b=QetA9CUmfuWF5k7A0hCixfq2PIqEJPlxa2AIA2VvqYw80yxuQcO4gbiKGk5nt5PfylbFw3CiEBB6JbLee2lrr0zwVhSE46CrlXULScFk5d9+/gAgpxmXWmv3ozufxq9ldN0SW+mY0evAoT7BIeywNQ7TxG/D7eNJUXQ/VNPhQ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756320; c=relaxed/simple;
	bh=6XTTjsFjyY6iJQHy7meB11Yd/k2CmMWBewbbry9SfHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLOgpU7Oboqwg7iJ0zOdXvUwF6PdAE1xjDqNqcjfLVeN2BsScA5ARCufOLkOhaeZ4WgcXmIok4jIacgxa1YofXrhn3vc/QJCPNC5WbDt1QKta1lX58lL7wuTRLP8Zpqv7IL6k7j9ttwmstMDD3DPIctRuEPBBnuK0a8EzIFsrXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPXgBkWK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNoI7gRE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPXgBkWK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNoI7gRE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9juPe2463964
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4tnR3SQ6CQJ0n4VHz7KRV07D8f4nSkV1c5YHTLLUWs=; b=WPXgBkWKfSDYOons
	V8Zyw6lnEntoyM8wItKqcCFNOVKn5LY4QFrIYhl0ZZjFBpthZxifv3XziZDSR6dJ
	nKP/sTwxc8+RSp8oXz759YxnXKiAua0IWlZG/Epxvl1UzHyFG+wz/EC0Osg7VQMN
	fHV14RMDE7KvkjvZlyqC3dnjaB6IrOv62jHUz/SaIFuur/SXwatPODS9RHK5l15z
	PPMFyr6BpmzP1U6ICljUF0JUIU4L2irkLVtN6NY+N8lhSZfwShSgGe2AaZVzbAST
	Ypf7sRnSfAh4KjcwBBVzM7sEx0/Un2brxq81bZwZypCkVG78RBedibz9vbj2x5aZ
	a5Giig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v88ytu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:58:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91056376aa0so29887885a.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778756318; x=1779361118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4tnR3SQ6CQJ0n4VHz7KRV07D8f4nSkV1c5YHTLLUWs=;
        b=WNoI7gRERsQK8PIUTWWLFb+66Vt8sgQDgM9DCfQNw3AUU8w/uJBSuu2SQ/3UUVluNN
         msGBVceaVyizNXF3fvWUEOCrfZxWxfWlV3qJ45KFmhPF0IneUzofH0Ezq8tKgTgn6mII
         NFihB7A4or4U5vfeGbBMYazOjpQPK/syZO41x9t96ytxGV0R40Cn0hZDp8xIJ58wVaYC
         359qebJZU/W/6/ZFB6elBSIrgvzo5M/kue+3MoSeCj/syKpxR5CV3L6rYV4oFJApVfKG
         1sXFc7iHKULBKysQX7PR3T39HM/c6MPKB1gEkGbecZ4J5gq8/mSz4QUOzACzsxBHtyfE
         PHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778756318; x=1779361118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4tnR3SQ6CQJ0n4VHz7KRV07D8f4nSkV1c5YHTLLUWs=;
        b=G53t1LVeCpQdxlZCqO9WI06CeITcxsTxWTKmUwkUZVQikEMj0GMIdUdUFEWLe0DyIV
         It1BAwvgvmVK+0PdPO6rEnisVgZ6zF1G4MZ1E6HDVltuP2IwMXhPBI2oPXiaeidbMtMd
         +OMr20HNnv8N1lisWoOry8/npVlKDIt3jvFOhp4rqwD50GQYFJsYDij8iqbCQntDNWau
         YqJ/U7CK/O8qBSUFeNv1NHVvu/TI2PQfGzUxSC3JV0BcwVeUg/UnGhIjcRq0Ji8fzisb
         KDkk6wHslUIOq0j+FgsynbVvVf3T4gycsTjIDX2K0dpF6y7kuLjcONJjWp4urtGLDtSE
         2WAw==
X-Forwarded-Encrypted: i=1; AFNElJ/fENLKGTE71kmp/gta6p9LwZTMT5o4fFrtWPI4lND608/N3nRt2OOaCvBo01YR1gdh9t4tDUASpCwn@vger.kernel.org
X-Gm-Message-State: AOJu0YwWhWoGq2bq7llWkNeGTcObM+mdqA1qdFPpQb/gfa8LfKG01wIZ
	kmrVp3KRbFX3dL1GdHuxN4OG55BgRP0NdqZcaZ6U5X4P1FWhe65249+P1Ye98GvAGQXVzpkWPnl
	c0PTPTZq+SLHbDgvqxvSSaJ3o1/OdvkKgWabdo89QDKb3bHhwpj/rPeujf03kOvTy
X-Gm-Gg: Acq92OGnf1ZWNB+lNv8QzSLOolXpY2qRe7CF+viJYwBQ/G1ROyGfgSVxkCC8mUz/xW9
	fEZHpBccinq6o8VWzbIhCQEHAPNCIUozIR8ZC1slOSWmf9srQO1mwmNLmJ1+QzYybQ7PXpso5yo
	GzhaguKllSuzFHmDOa+lCh5f3OvjK5WO6KkEr7jc8u0uqBM5B0MD33ucTsBjgzT+XuIGP7prBZ8
	bJ7IIuLN9migtFbS5rlVddCvUnWkL+rAUovIN+E+IzhDuSXS+LSRRoCDnyNQoLjkeA12HWhrYs1
	RlCAdKxJjpKsNkEo6cizjB9+6d1HQdWl6F/12x1RCx1p+41XTVY4uPXJu6bC1tSpFOpIDhJbqjb
	lJZcsCiM/vWOdAHF05jEsdQ/AYxy5EyAN3v2sZGMTpV+EZMNuS4znxo/m4w5MNV8FUrMYxsR096
	8uYFiOIJmaKXyvEA==
X-Received: by 2002:a05:622a:608c:b0:510:144a:636 with SMTP id d75a77b69052e-5162f682709mr64383611cf.8.1778756312882;
        Thu, 14 May 2026 03:58:32 -0700 (PDT)
X-Received: by 2002:a05:622a:608c:b0:510:144a:636 with SMTP id d75a77b69052e-5162f682709mr64383351cf.8.1778756312468;
        Thu, 14 May 2026 03:58:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e8e5sm612419a12.4.2026.05.14.03.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 03:58:30 -0700 (PDT)
Message-ID: <f0738454-abd9-4a58-ab2a-df3479b78e95@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:58:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193
 shutdown GPIO polarity
To: Jun Yan <jerrysteve1101@gmail.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>,
        Wei Xu <xuwei5@hisilicon.com>, Robert Marko <robert.marko@sartura.hr>
Cc: Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        Enric Balletbo i Serra <eballetbo@gmail.com>,
        Romain Perier <romain.perier@gmail.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
 <20260508152435.21389-5-jerrysteve1101@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508152435.21389-5-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwOSBTYWx0ZWRfX1roor6bD9si/
 ifev6gknqEf79y8IVNu3fk4RZd17gV9069EkLnEZqjOkNOqcQfG9Dx6HtGwaIiYMx5c0y7hAarQ
 T5+e62kzwnQRuN0+KHP1fNKyfybaE1Bs3YTyyGbywXsR0tnhvmNkk+OR4EvJ1CRhxHWDOZj2BOx
 //6RxaUisJV3BKfgq/A1eQxeQQ5z6rSCdnCinb5XY/tsN+8THRNPvtGS01kG+ofRb/ypuT7R+Hc
 UrbrriOg+XZ2yRXV3oFUbc/zIl6ObO+Jk+sPcOykV+Hxk1dQ4XpoUZfpLmB5AFXR19IAcymlA0x
 Q4pxxm7P8eZJ0ACZE4YmszaabZa5Koa26Fn4cfw8+2KZGaO/1ECg+VyzL5LQOQsAkEUoJ2jh/HF
 I+TXIhGUVr3RUk2S2GluM7BjPxVgAPC7un+h272YG1wX7nX6LEV0jBdZGL/P5SGyB9ZcFobxUAH
 OBCtZD+VPKFQn1LbUaw==
X-Proofpoint-GUID: b6z8AWc4isWn8eABUj-0mI3lA8y0rqbp
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a05aade cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Ffu13P_rAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ZVWV2uAXYixwFVVeF7MA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=PkESTBlHdS-WH8rZy7fl:22
X-Proofpoint-ORIG-GUID: b6z8AWc4isWn8eABUj-0mI3lA8y0rqbp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140109

On 5/8/26 5:24 PM, Jun Yan wrote:
> The sn3193 shutdown pin is active-low[1]. Correct the GPIO flags
> from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.
> 
> [1] https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf
> 
> Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
