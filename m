Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656504;
	b=eH4mpxPQfDOO8a0U3LYanp7QG+Lw890AFrhUxqzYCz8qu80RD7TBO/f3YUMHWbEGTuST
	 b2GrHzZxFBIqEPnyZOI9t91RgQ/t00mJFAMJuPsbr6rXsUjy+04Hl6jHe3kxE12qkkD4i
	 0ajNb2ua2xglUibMnGBBVBXaOwLdD44YttsXu1wO2rnhYGDRvjaty1UjB6GYt6kcKNvhG
	 otPdRyF9/uR0irTEkpXoUeAuBGxX57J2yiLOrFhihB98s7z4x1s17lAuFoltzoYJ7tlFf
	 EPX72cOuVQDzwWw+mjUKOpt+eZqpr6koawtPNRImccQUgi4ZA3SaKyGcI9Pum36zeMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656504;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rju0kQfcTmFq0/nuf/5fckzUJMwcIHsYdpF1vEzgPqc=;
	b=Hrrg2Q7IVGioAStjhnMGwqpZR7GmL7M3sgm7VaMGJtSGaHAmGI0c2xLByCSOl5RjLaPM
	 EruK2tckqfGWUiNzQu62IJfGfnlJbJhz7bCVZGtVKGsAZHILsNpiliAGuUroBlt5Bl1TB
	 3T5C+gxkWVpNS7szOmzs8oyrNza1UFa/zg4iaSEJ4iRMqLRroL373M25/aLeLMJSbk5X5
	 /CRe095GTgRBtaIME9we3rl6mPEV7oHXsFpJgIDjxLygzBLBeucWLQGkEwLRZ8QCloLhg
	 4FMglSvUdNqYd7MIIa4TFjuF5UCNBeHW85jDijVcW06HbopRnsdncKC/vg1vjMriiOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cwBZnlj5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kj0xNvvq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62D9606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A62D9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cwBZnlj5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kj0xNvvq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M703dU3076607
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rju0kQfcTmFq0/nuf/5fckzUJMwcIHsYdpF1vEzgPqc=; b=cwBZnlj5GU+HwE9E
	4jLJAB5g69Kn9u+bz8XrvLss4OfO1m3giEycZoDqEeGvr7ZUf2oo6cWXpSPvaC1H
	vygNgPXU3Twxo1W3u8AWZiyHiUpCZwlOmeenufKnbEfJjxwdUlwrShwVbD5QY+GJ
	hakWlGZ/+VUIlMoLFkP5lo/J7oXBbqVbNbOdNqt5DQz8q2c3sxjuslwNXLKPa/2o
	pfefa9Xau+Cxx25EgoGnbAvcAy1mV7AqbsbXO1KEI41b4Qr63tw/2Fc9FF3kDO4b
	RCAB84UkGeOZxPFVEY+ncfX+g4wp5zjh83i+y8erI5njadqq68h6wlY0N3+ID1bZ
	eP2Ddw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a1c08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:08:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a54501a8so4143916d6.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 01:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656502; x=1793261302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rju0kQfcTmFq0/nuf/5fckzUJMwcIHsYdpF1vEzgPqc=;
        b=kj0xNvvqwzksAwfwVxssk9dxUkm2FIKO3BRGKGmmSf5zofslZFI7ElNXsNHcR/c+dp
         xNs+yMTTJFD8oa9AJh+5Bgwq9omuRWeaZTiC4SDgG4NLYW0//FzqIDC5sfHNKGkeir5F
         uOfmJ/JgJUi3wXHuKKjpiOMeIh6/m8KPafXAoKX+aZ7+qslf7mFu9sUkVHyw+mgzx1bv
         XtWudRRTqhDXUniEkpCoC2Lcq4AslJxG5TRuBrr4CoSnpRtITR535uIO52379qolFN/h
         2JyI35n6KSzTWtB3ut9/SVAE8ahKthbxci1+jLxbBFQrWrYYYMOiNybUAgcvp418bgHR
         vGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656502; x=1793261302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rju0kQfcTmFq0/nuf/5fckzUJMwcIHsYdpF1vEzgPqc=;
        b=A1O9gJJ4Tt6LhyzzaPwpQXiygagKSviPWJsZk6BRtuorkLUSkGyvXEccmDbae8MQ0k
         LGv8JV/wsu/6Jfp358YVByXy/imwJPM6+ScpV2606SXwmNWJXGCIKNQabvs5aQj4vmrO
         KHPI360Ju5hqTAkq/NzB76Jnd+kcKFUCUgunffw4NMTdAc1Tsc38e9TAFyijnkF24IZF
         rVfca0CSxnV/rZb3aiYIUJaOCNKU6QO2QzV+A/vuBbhxupIYTMamTGD9A7xmPjrHqFQn
         fiOXv8pg4mBw+jKc8VNzoMg2d1SzMMb+AZS59rY31VynRW+YSRyQo+oN+I0ZA8X7Wh+8
         kAAg==
X-Forwarded-Encrypted: i=1; AKwUvByixzFN2DrC3J1ZHuB78LbUgEo5Q4zEPtDE25DKtpHOOtIYUVGShPmN+HxbbDlV+yAj63PH2O6Swh3R@vger.kernel.org
X-Gm-Message-State: AFq9FYK8VtF9JSyfeeguPHBMv8pvPqZOFicoVuHmbqdvUG8ZfhPGCq2+
	+ICQAklQUI+1u3MB/Ia2khFhl++b3sVrufdsyNrNr/SLtDMN+QKUzl3+necV4j9pahhfwnx2ZaH
	nHqGN7fhbO4IuYq7tqtP65QmY9xlyUudImxT/j4GAPk6KnY+f8SFjGAEGsZ/F3MPH
X-Gm-Gg: AYBFou1DfUqA4ZeJJmPrwBJG0B7nQpCCpibh8S3/qs1yHDi6HoqvZ/QfNWqoCNVf65B
	JdgXE2WCbXfzsOde1KprZH/fcu1xOboIJPI5abBGHQbwnqll7KwLpnzA3bEtfmfPZhsEcoqtyby
	Zir/5x0Y9MGVTkOiiG06EGYa8RaYLlQUEeuG1faT7ts+YkghTdm1d2gZRtQae3IJ21EthM1REmW
	jd/zS+TZ5FfN6uqFxgFt/ZA63vSv2beAQmlhBQ3wQtRgFBClyXNVXEpKf8x2hbiVuQa8S95QTQT
	9lpLvnwwXLMGstIkWh8hqPafffJl9XelGfmO0ZXTpoPC9Ua3NrUcftz9Kc6Xl+MhvEYEvo9VDt5
	4sA/IwJLT+q+NnXpZYjD0xA==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr1009349685a.1.1792656502094;
        Thu, 22 Oct 2026 01:08:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr1009346585a.1.1792656501661;
        Thu, 22 Oct 2026 01:08:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1f0b46sm79569966b.8.2026.10.22.01.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:08:20 -0700 (PDT)
Message-ID: <29d55c6c-5565-417b-8252-7f346f07a035@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:08:17 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Abel Vesa <abelvesa@kernel.org>
References: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
 <5fb086d1-7725-4d8b-a2c9-7627f6da7cd9@oss.qualcomm.com>
 <b33efcca-eaed-4efe-99c6-035afd73dec5@gmail.com>
 <eb559119-4d52-41be-a954-2c26492d6a2e@oss.qualcomm.com>
 <701defd4-79af-4ce3-9c49-d3f4378a9953@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <701defd4-79af-4ce3-9c49-d3f4378a9953@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX3pFtIS6mVT3B
 lq82pWfyr/tdsiZn/YGG5510PI04l/7LWxI2KGWDQBuXqEU79OFh7sIPp8g0GysyBh3sTOXEEka
 CVwA8xTGJ9djKD66M696n/ckpw8S8NaTiZbsj6V7NWynZZo3P3lno2EAzFcWjt3W6PzyZ5AWaYk
 unhGYnt5mONhuBSYGHC1rcZZRnrDzVwMvnCDjsxKndizU08q5javTSCpTxMkUS2ghtaUVxyRddj
 HBW3M7V7ZG3IPgR3sVN53bGac5ZVMmE+KSEGRBTrol2yvc/CeX4W0BajmoVZVt2JXFSTYHi+DdQ
 C3gaV5s4kDM+ZMhX7CpUj7CWwlVd5T9ZtGPeMtipolfoozb+4hhch2NoqHFLj/om4Yq16uQ+yPK
 JX4Zu+Z0O0dDHfbszpNxXUTrOzJrXzbaS+3ogYHFvL5CImDNOJVNT1+5m/1MK+flrydnZ2YITU4
 qYoQEB0JhqIhdj7UO8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX3IwTZoTRyvy0
 S0JI+7ZQTvLhrBg0Cmpcqpb6YgxeF1++4umHgHBqmqFijiNTZD7WYKnZNQ1xeyeKbFca52yR8c8
 WGledvVOWmI2Pt7qJosrmvMPjzxjyq8=
X-Proofpoint-GUID: 5ynzMXlQzHeNLKD3mk0OX5zZtNR-ohwz
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad9c477 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=C8oghTkgAAAA:8 a=aE2qjto-PEiQifxUPIUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=BFEk1I1Cc5IuqT1TcHpZ:22
X-Proofpoint-ORIG-GUID: 5ynzMXlQzHeNLKD3mk0OX5zZtNR-ohwz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 5:00 PM, Erikas Bitovtas wrote:
>>>> Have you tried using the bus through the normal QUP driver path?
>>>>
>>> No, I haven't. GPI DMA support for this platform is not yet upstream.
>>
>> It's a copy-paste job, try it out please.
>>
> 
> The pinctrl driver for SC7180 has no QUPv3 mux for 51 and 52 GPIOs. I
> also tried checking devcfg.mbn of my device using qc-devcfg-parser, but
> it printed limited information:
> https://bpa.st/PEZED3BN3JGND6HS6BOGNHQG7I>>>> +&usb_1 {

I checked the hw spec and indeed there's no QUP routed there.

Konrad
