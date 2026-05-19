Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E784352004
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186956; cv=none; b=aMW/Dzmmiz4N5UJf11neDNggsMz8ZqJr12WbThuSTONHef5VXMFKe+yhcHL0YTZX4AsAxzsr12SCWoUIYqfIMJI3l33O266txl2zbEpLpd26EadB0RuThxPm2YO3lCxrT/KHGUHGwstY8k2kE7TeJo1XA8UOAH7qDt+qFdbza/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186956; c=relaxed/simple;
	bh=BJ28QJ5EGSf6/hdTjCUG6rChBi+ee/XSn/fFhwIkwng=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DfJHE+UV1Vux41abZgt8a+Nk2JWaDxEeQDspIIdQXogk1Y+mAAnKYhdCYQn5EqAF/dhUN0ghSt/pPaZKU2F/kSMW3O036jfY4wORdpZ0S+4gYnLRZG3KLRBNcEWvM63bWhO4eGLeNra4yARChQTK3J1BxNh4cL15/vcozh+Gmfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8J5oJUy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvYVAxVO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8J5oJUy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvYVAxVO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9kvg91257084
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DFJ1rbWn+aj570gFCWE8mOVRecu5EAmldLFu6NIllxM=; b=J8J5oJUyPx1Zo6rs
	HOm0qgMVulhJ23YFOWOQjwv1m82pb3hz/qFIm6Pze5wfY/C9q0D6DnJiBBTlJfIM
	rpmZSs5buggTV8uSmLhrIrN9+LvB0ZCy7kmmGAKumrQKrny1FXD8kGXW15kNHgOv
	bfsbVemUkjAVMCe83RJznDE/znbt5eJ/2imYAWCkGlQ8gjQNdOfQE7toD2FBsf/r
	OfBltj7P9HoBxJZ6e9XQwWSdBtMGS/jFZLFPTSdQP5kaycuT+bgTsIFNJqJVMjVD
	2hxiODFcEl27C24gLyyJPuci/B0WFVh2Uz30UMebaIiZaFila4kdwL4wtYEtc6Ta
	MLF9Wg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8nhj85sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 10:35:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d840206c3so11719251cf.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 03:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779186952; x=1779791752; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DFJ1rbWn+aj570gFCWE8mOVRecu5EAmldLFu6NIllxM=;
        b=PvYVAxVOpAbg9ul+CBWwcTsV1TKTEbQL6pLbswarlabPfScrLRuHCZtU/OQlF6VuO4
         5CmKof8CzT11fFGFXO59Mc7e7BFgtPrNqshfdvSeCf4VECXXOxyPlx/Mq54lWSikj3jx
         3y8o9yqb0JV4loUegl4x+8v56/fgsn3MoANpkqQnrRXTKKrFxYFYVNQquqNh6UqLCkxc
         RZMumsjALf5BKFjsbyVSC2dCa7LR7IWsc0CIJcqJCsio4cAPWVnhEHezml/BRMqIM3Zz
         UaBGy2ffDKE8SQ0wUc22D9Z54CBHcO9BCWyugo/GNfBznEWYKqJHvnleV67nvfmdrT+/
         TkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779186952; x=1779791752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFJ1rbWn+aj570gFCWE8mOVRecu5EAmldLFu6NIllxM=;
        b=rpuE3MDJN/nay056uA9NO+cpy1UIgf+CCHgSkvX0FkkFSp7YA54lv6iuvgzFShhDWY
         4kCngN7tkXVMJAvIXTuaGAaPvWIpjSxb9DiD/sCgWdCV+F/Lm9fXp7lFtQQ6a4ezbTVF
         Dc9DPZ35V9bV4FYwxfRUQ7JNzhve4KS5gEGPEr8oZiPAgkmiLEvwgHX38kJBxyRwpCrb
         BfFTpXvtRDgPMLy2X4CdPaRNgT30jo6qf9J9QEOB1bF/LYtJ79iQwailin1F2kNJSfpL
         CLJVWqS0eYyjNH326MabF5P8UenN45jsTPSRoXOf/nWyI6wpCkt6S/Q5y4DIgE6fS2+n
         st2w==
X-Forwarded-Encrypted: i=1; AFNElJ+zy0jHE9p7F4OkTb1GzQZZlj55UytTq0O/VTk1fdKuJ8ojIZ9ur4ggyA9v+7dJZTr0DYmOmT7YugJR@vger.kernel.org
X-Gm-Message-State: AOJu0YznnEUu+74kZG6vlC2YRI5KWXPPc1BATfrwDY8Gk+WIep1jwWFA
	Fj+chMf+JFKoBCUcRZZZNLBkD8vnBI2CDsx01EhlaxcG3rdnXhmz7FyQsWXdvtbQWUlxhnGzRiR
	QxL6EmiQL/mgIMqAD3PK/cupmZorM91dzm4M2d8mfoCPMsQQHvBTIcA/sg52vZDxT
X-Gm-Gg: Acq92OGAOHK6CNtqamofTGNglAXHnpFi6eY6bnRYfLG22FXRL8BS9P0LbrTqu6xVT3p
	Vs3DlTs1yCMH2h2Kb74QUNJA7RwP10uvmvxrIsItIzHWakDv2cG9fHe0fESfuCtShRn0UXz3cJE
	tOsaZKBW0jTpxRE1LFM6LwnOn4zpC3ZXYGCPpZg02TegLlNhsQ4pvaBi5k76BxYlITXXJcHAH0Q
	8c8oDzs1yIGKJz3V/vyRkwQYegbaeQzo5/KnGxxAIYJDPmYCJJM9o2h5dzs1rKssJxWl/Qdr2Cr
	uty9+zJNRR+Pgg0CI/pud2Iykc3fl/4U3WWxhn0NNVAzY5Goj/BYxE+cmzYILUhv6fXtpGFnslP
	WladtwK5oImmfcwbaGhLEjpnixt063cUxLrkz3v7gcaE53jWHaq0hym3BydwiyC1eMVEz5JbQ3t
	PMJYE=
X-Received: by 2002:a05:622a:4a:b0:50f:a53b:9cf with SMTP id d75a77b69052e-51659fadfdbmr200593451cf.1.1779186952516;
        Tue, 19 May 2026 03:35:52 -0700 (PDT)
X-Received: by 2002:a05:622a:4a:b0:50f:a53b:9cf with SMTP id d75a77b69052e-51659fadfdbmr200593031cf.1.1779186952067;
        Tue, 19 May 2026 03:35:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c31494sm683369066b.20.2026.05.19.03.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:35:51 -0700 (PDT)
Message-ID: <7c1156e4-a5d1-4914-8b64-b1b54686a9b2@oss.qualcomm.com>
Date: Tue, 19 May 2026 12:35:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] USB: typec: qcom-pmic-typec: Drop redundant header
 includes
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260519100014.282058-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519100014.282058-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mY3ZB_kI-fnt8kdLOhhwky2xR6sTJC0P
X-Proofpoint-ORIG-GUID: mY3ZB_kI-fnt8kdLOhhwky2xR6sTJC0P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNCBTYWx0ZWRfXxmn2CmhVg0lk
 SWvYY33K4fuNgVLKfvp1Ie3i0KCBciCbGHNDWdOxebfL7ath5HuBUNZZG4Z8vgFpqgcoEqk5ANT
 C9twHa4e4Hk3lj3kR68QtdchadgGzymwbQKhk+o50VM60IqmhyBeiTnoGeY4gDwDUt1TgQNvgZR
 m0KxQsJN1MCmOlH62PKYxZUjoAh0DcfSFbvHrMd6SIIA/HUpXX+4JSO/e01omJpN9O+l1tL1qXC
 /pm1QZVGPaJH5BT422aW5+5NIVIDbsOvdFIjqx16Rka5b/w3fbBylen60fhSZ7uzkob2rMAC8z9
 oo/cRQ+H73wBk/rBjToxMA0F/I2Ru4fIkB5cu1ycKqOA35mzrmn6IVzL7Ad6KBT2Nhby+gB6XJ+
 kpBPv21WjjrW+V0gWZKGDQpsQgo3aDyCXYryzX4OW+Pe7ufbT6cAALcLv/NiDdRpWjfXjPdmzTO
 4+feOQl3A1zDrIQNnRw==
X-Authority-Analysis: v=2.4 cv=ToTWQjXh c=1 sm=1 tr=0 ts=6a0c3d09 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0HbNSHcTcvsgiZiMWyMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190104

On 5/19/26 12:00 PM, Krzysztof Kozlowski wrote:
> Unlike other units in this module, this one does not request interrupts
> or regulator supplies.  It does not use OF graph, USB role switching or
> TypeC muxing APIs.  Drop redundant header includes to speed up
> preprocessor.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
