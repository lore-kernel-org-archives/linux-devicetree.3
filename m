Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD743DB96B
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419387; cv=none; b=jGoxe+EjncpzuNmBRkc4vN2XEPn5P6cuh+aAfl8O8mgchzVJjVzUbVzTIxSv/GxU2oA8y9QL0yun+BN6p5i+CoZeF4+IGqoZfgwXgaGb0V7Tdhoi872BeAIXDLwXqUY6XiEYfPjNheKJwGaPoku3GjggW80DLGtf/e664m7OUcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419387; c=relaxed/simple;
	bh=Nol2MBFLiaw40O8uQ0Z8ousJfKsgyK1D9m5fxsVh8E8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cZVHXEoAmSXgOnHO0ov4fqCQamAoW3ZtM2ebH/51ZFmxi9F1YDgHRm3r4/xmBC/fX3rzr6GLU0l2ZHCpniNSJEXknySfXwwzNpQIyso729GXpV5A66oWt1feUJrsIKpipPITR5LaKKUVZejVK7w2P21naEkJvaPxLZVC71s+9PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYoHJ2gJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ES89q0pU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYoHJ2gJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ES89q0pU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dt7S3209705
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 10:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VHMjR5drmVIRmI+0gBpVtjOvg1LF3onh6jqP/pvgpJs=; b=JYoHJ2gJXK1AWP3E
	ikrG4NbbsYHW6Qn3Vpqn/E34l3DlwxKePDQ1Y1ePCYeXUuQCrRvjCpZcyKXXYRem
	gB9ou/O9eptfed0y0Z4DUQTMa/vrX1GJryY/odwOHM1wQmSuVDgindjNEGZuUwgs
	p06gWovx5kjv+dflKSk1+NkVXSOCnPUyNugRX61sK1PfT6tyhsZ96lmmhcuLCalO
	nK5pg3ZX9lGq5Ar89TZCgBKq1acuoXP6g9RpQAQ69mjbWvoh8QNaBC6AKXSEY69k
	cSYhyUid9itC9Iyg/RqNMSe2zSJNQNoSRJge7wwLyBm1qgYX/Afz/rHo2miwpIL7
	1yxx6Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdj8vaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:16:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c298a1b20so8230461cf.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419384; x=1784024184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHMjR5drmVIRmI+0gBpVtjOvg1LF3onh6jqP/pvgpJs=;
        b=ES89q0pU0Fq+UYvZpMJ0jGoHQcCJ7O6Qhk1Iry/e7aiiLEDaBdU+Y6hLqqhO/z1x85
         nwCj4xG0rVCbOPS1ITYlSl4QTPDOnlzum+4e4KPpnx2fscga1zwMUjme3XgRNnMrDex7
         DNeIdcmsWb20b0nd6atBoBy7H941Pu06JkCVeHdQZARWtV8bpGnlHeMx1k1ciwrNMSin
         Xa4tZv/7WCh6z/0wNEn3Gko6FJJBDWQRpjKPEUZzTyU520dhMVTR8WZsjAWfE2slAhMK
         3isvNydLfN9Vl0n7UV3ey4IrKTuwffxBIcjDrScfYt3L7cOCCa4b0cpzreS3V9uPCWOC
         7BCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419384; x=1784024184;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHMjR5drmVIRmI+0gBpVtjOvg1LF3onh6jqP/pvgpJs=;
        b=K4ZWeBoCYJvaUCPfh9lqRxmVMhh/++8i8muU4WQkpgxGKrLZOXC688AtbRMtQbil8t
         CpSKEdQOn1coY44afUzrps3de/V908hK6k2eIu7VdlVLGfoA8mq18uZo0cPCpyx9Q/ql
         YNpk+Gq+mQXsx5hTfOzhazi1YtqPd/qgsMX+rGrewuLjU7kUh2IYq9sJ1mnwtAHxLU6/
         tLVLQ+Ufd9auUm7hrJJJcXF+0qfXQ2S2prPfb0DLH/VQJRWDS0HxAq3xgtFhzEu/FfzU
         ad+fLM0H2Z2jAyp5sROaI04djoQAIoKdBAOOEjVYIGOc3reypLbW9V/nW5Ei7Marroz9
         OgrA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5B7bwoFmWmBCM2f3Muf68tTHtXqy70xwU9XzFCAfZIgLBaNO6noleusTZH6gSbgVtdhIv5MzsBgNn@vger.kernel.org
X-Gm-Message-State: AOJu0YzhBPRF/2kRWzzX83yJgZbx4laTZZ7V3Y6qNclnS0yHT/BjuQYd
	LILbQekJoR5WInYLUwrr8crqkz+utDKH5DJEfJKtonpinUbE292Drxm/T8l3+kpaX0y4Jcvst2H
	UW96MwDmcKgce+qjE+Alv94+ypzJ5XnqRSYABmaGrVcgNyHs0UOKwWQF4g/B1ivxc
X-Gm-Gg: AfdE7cmGZPZeEM6XNnq3Mj56wG6pli9Q5a36+YMPySFXD+nTfeMoiTw6oa0TRKgthjZ
	y3MK3qfr1sHdW/Q1A71xOZKVGo9A9O07gomHjWCIOOdo+YEzBJ+xUjQ6LgtRB32Pk+ulDXkvzHq
	eH4X3xjUzQaxYg+ckF7ZLazKtY0Wb+S1NM7JlYNVQL4MpWxY0Z0W0+oQFssiC/MqsJIBP0pMmeQ
	dt0dAnU4Ld839DYel++2fblEoXN96v1KuFc1fLpNHwd/9opJMlzdc2Uj2a4sK6mqA3zwrKuE5x8
	NrszD+BBo9cL9mKdmfAIN2cyaiOMNCRShpR0vlWJZWcREG304mnkIOToEl225CO0lmTykVPrWqu
	WuJgJuJbCaqyIlD2PfhLHyYqdxJTIqtXCIr0=
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr121325021cf.10.1783419382508;
        Tue, 07 Jul 2026 03:16:22 -0700 (PDT)
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr121324741cf.10.1783419381969;
        Tue, 07 Jul 2026 03:16:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d79906sm5807352a12.14.2026.07.07.03.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:16:21 -0700 (PDT)
Message-ID: <b2ea73d8-7fc2-43b2-a9a4-58185d937d88@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:16:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7125-samsung: add initial
 device tree
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
        David Heidelberg <david@ixit.cz>
References: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
 <20260705-sm7125-samsung-v2-3-d3b17005ecb3@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-sm7125-samsung-v2-3-d3b17005ecb3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4cd1f8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Gbw9aFdXAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-EjxOQQyEQsex0ImKKQA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: mR1_ekNostZxjtjrzCQKhG1sOr-NWU-Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX6r0Oi8w4Ka12
 nj69EaXo2NyKzhbL9/Vz0rQCRaGRHzJX8VdDS6CcmQXJDYjLnowPFDsrjRVSPq2NKM6xUmo3pd4
 FMTm9pvX4LOHcSV+o1PqA8s8oqurDyy8DlqLFZDYJLRGYkchIvLCSJ8audkAIn6SPSdIjs6KMwj
 28Q+loVP3UMC/5bwCymnK2f5MRFlSgbl+XTW9+SQyEIDwcbNv8huFf/5k2OGBzTkhUYZ9oQ95dc
 OAurBjbBAqq6CJ2E4FX8LOvuFn7mt1HP4zvt3EA6Bu2CKwlTpB09mFWJXk6qL/MkhpfPB902a69
 EUsGuch4bwFIk4OxpEclLZHBxmRTlXi4FDkRR60j5gtXEYQbZAzUTO0XRjM6MGJ/wT2BLKAq3T7
 5c6xfuC5qvONj08r8SKWpWF/g5mNHwlw34JZBs1A/JH/UHHo3Xk/ZQUmFdpNmc4GwObKVIfRXs+
 renk7RveNeeDA2av84A==
X-Proofpoint-ORIG-GUID: mR1_ekNostZxjtjrzCQKhG1sOr-NWU-Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX+gnyhkLoBEDR
 sY7oLWQDOc33Vn/PmLgQCg82jYUmiCQv9jlLNplOY4LL8o7cl0OmP7hcvHvkOJxwSED96Ng69Fg
 MSf3A0xmygntzGjbn3lJzICla56DICU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099

On 7/5/26 12:30 PM, Erikas Bitovtas wrote:
> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
> in 2021. Add initial device tree for SM7125 Samsung platform with
> support for:
> - Framebuffer
> - GPIO keys
> - Hall sensor
> - Vibrator
> - Regulators
> - Reset input
> - Real-time clock
> - SD card
> - UFS
> - USB
> 
> Tested-by: Stefan Hansson <newbyte@postmarketos.org>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---

With the usb3 situation going either way:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
