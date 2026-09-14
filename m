Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B4441443D
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376508; cv=none; b=quBzXANJfg8Nn9s+A11su9j5u5WbX62ERceX/tpchdacK5FCYDwCk9Ufy5UTW0i0WIfY6kjijPTMZGB7273E1EWT7zly3m1iWVVrSVDGLFaxe9EkHey27MPFWhdH1lbnAgtyJt01aHdLOlkWYoAK6aUGtJBaQGtEuIXuG0FH8is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376508; c=relaxed/simple;
	bh=SSZZuAbiA/bGCxdScGctQGz1SoqPI7ykdWK0HpLAE9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=snoJr2xp9BwXC2BClxj8os8T4IY0Gihp96McGskaqZVvc8UEMqAPvYUCuhn6m6yuZh3U3RT7PbLXSCB/mvZvjt4fsZ47TsZ6qVzEte1ozTkHTelP/e4RD8VEDRV87CCRBsKtcAYim4/v+oYJQA4FppBFNBjkpcky78nj7NzV8aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X+Hk2hdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSCoRmx4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X+Hk2hdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSCoRmx4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5is9i4058198
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WEa75Gu3zPodBInDr/tKRagjGTy1OtwOUc+RccJOL7c=; b=X+Hk2hdV9zVs2YKl
	HWsXYz54XPR6gXnU2Wr5lV5VUTP0iDCXSoc8LETBMtoIxa/ItD/nzC7d6AVOarg8
	eER3DaBb22iz74Teu5Nd5F3P/qhSo9cj9GJftGileLqzkHoeOxQsJQwc/jZ7OPQE
	quY1LrApkdMNCD7LfXYbGmj9h7EwqtalZV6gpuI+epaRrKbadv7mXStrahj7aUg1
	zwtJEM5y/d+II0gSAqRtD8f1LLYYKx242ay/d5Yfk16YaIdk1qBAUfFuS60XyjDe
	z1HRscQxR4sk6pc6Sl7/rOF1JtebBy3ZPLwBlSRu7l7rGT7f5OeCEhYCxC160qrn
	EV3FsQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hssn6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:01:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9106a836457so8427276d6.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789376500; x=1789981300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WEa75Gu3zPodBInDr/tKRagjGTy1OtwOUc+RccJOL7c=;
        b=cSCoRmx4CXDIrhiwIGdOjk2Yyxeww9Lj/IRS6zYIOt6pzpWQ2DLMOm8+0NkEr4ul8p
         rTyAV77Nrc3IdsoBiZrKJImhdtH1wLIJ2uLvrFSxeRy1M+pWx20tg+qIuiNGwZKEsyTv
         7bUXfltPm152N5GqMbV1pO3D8okfXQ5GbkWWGxHvSHVfrMBAO9pUARHR/Mc9aSibQUHz
         uSoXwLnf5DBc+ZFXWTrzL9tHQDB7G+qg+ps5QeNxrnbFX4a7LX8QOTuMeNBltwMIef2x
         vA1/btaN+K3H8VPwvYOVwGdBoxYSI80Z8fpYk0SH0qQauTstLzC2nhY8onh7UJSU3tNW
         XW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376500; x=1789981300;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WEa75Gu3zPodBInDr/tKRagjGTy1OtwOUc+RccJOL7c=;
        b=lup2+W2ArApgkX9HPdgZSBYAksXm0SiG7blQ9Yqaec6WxrSx8hZ75Q4xnN8X2nIzR2
         LXlQ2z4GMxG5tuySdT1lSO79xoH6IN7xyu4gA3Z6mNNhpa6Qq15rwuWjrkpFsgFsZWph
         S7pGkbFSeUU6+Rz85fjMavnGFkaHk0GXzweDs+1kDIAJ0w/DZVJPe8ceFxDlDcj+Zb2L
         Q5DwqHsBsZ5oI2vzGTnPUcJmxJP1V2EsEKIcfgXEgNQuRZotYOOL/Tv/XkYBZ2W1Xl51
         NxPM1Je1SvBw48rnnxA1i2x+owserD2+At9DPbChzZMyOsu9JyzTzrEqXxZUSP1ND93O
         1gCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjyMtq5ADZ/dx7gaQzZ2aR5pslYCj/htNWtvW9xHPTwCVuDRNlz/jI0Lbx0BCOYC2LK9ZtVT7dKmhR@vger.kernel.org
X-Gm-Message-State: AFuF++nAbwBqty3ZiZUeZu8r/3ENLght1h0Agd66NNLUucRFDUgfHhFk
	FkvQPUDTZkRs+4kfZCftVVjYR9K92jv7nd6OJjWMsl4U6XjsUFcfQwP92VN3yVHuP/cQGkceHLO
	mVT3ERvvaNQaC2J2SFriQkiAP7m8lmdHodED8A9kuiqsf6IJDQUvoFQPBWixuPFZ5
X-Gm-Gg: AYBFou19U9rs2RTUyfY/oNjHsdsVkByl/2NjXJXfMVD0eMaDxvvfBiMYx9wSe2meolK
	Jq9yDtO+x6pf81+QGBpxMFYal7DOjjVN6iuPinmDRqNzeZ47igkkhZTqWXGsANKQ27D91g9KHIf
	HYb99jvJVFjsfkix/kYAku/Mq8iZTluEF3JXqCHbr+Z36dGUl29ghZM8/XISU9rLAXxIeL9C70Q
	YYaoUO/9MdDJEiZLJrmv+wuZiYUNR3/UXz9f0Uy/yKwqRBLQ66sS7MV6gwsFTdWBpFUmIynR7qX
	4qpJXmfUE+zZ/P2r3MuLKgm+OZB9nmKdn5+C1QXTIgY3/UzA479g3NXNYZTRm2gc6so5w9ZSoNQ
	ycd/s19eIUaxEsBY8QNeHPw==
X-Received: by 2002:a05:6214:2b84:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-9122e68c7fbmr19261566d6.4.1789376499614;
        Mon, 14 Sep 2026 02:01:39 -0700 (PDT)
X-Received: by 2002:a05:6214:2b84:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-9122e68c7fbmr19260906d6.4.1789376499064;
        Mon, 14 Sep 2026 02:01:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296614b29bsm390322166b.62.2026.09.14.02.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:01:38 -0700 (PDT)
Message-ID: <d2d2feff-4823-43dc-9014-099e69195280@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:01:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: nord-rrd: Add sound support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
 <20260914024003.120931-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914024003.120931-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyOCBTYWx0ZWRfX8HEEMG9Ji4E1
 qn5UQM3UPO2d/F8kZmpjCc9ENwV46YK5EUYIaGoYtrL1p9wtrUG9zCczShrBVt66ZtUFeQPS3BB
 yW/BD3Mwl+Oki2hw+eJD0wMeLcUUcLv/i83kk2FGPEvnTVkfZu3pYaUKaETjFoAWWnCVEOPULGJ
 9oq3mjFfQyBGFFP/vxD0Mb3i5WK9d2uS3kx98AmveuP4wUBN8mg1dWXEiEMIrCrgeGToyGSRP/6
 Bc2RjQYnCYWbYCcW3fbIJWo2gTNHAleQ1VKM/8xdZJR2t6z2WKPuzJrylwHDeVnDi1B7Xzn3OvA
 mkmNx1Raj/W4gKO5FJCPpc8zrAy7Vi6b961lQxxD7NbB9eJlmMlCH8UaJzAj/aUfqLLJn0XXFoV
 nslV67ao9i2KpJv1HtUchTAbH3V+AcUnOC2OufvqkZy5YmVrYhuFys6W24nrV+Qq1gPCo7F4qM2
 nRxSCV+z132ia43GkNQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7b7f4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=v5UkR_fZS6cbfkSa_YAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: a8N31w1vJS7-tOoP5o6LOKSa3PEnQlGr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyOCBTYWx0ZWRfX3bzYE2R2lBD3
 lm5hIAoet/TJCztS9aRnO/IlpC1k8ckRngjiY1J8ERmKcSKEjGI+Px1RSyldvgZcEcBwuYYCtDo
 e6dawsiXMMtDu63SW0AQavBUvujCYUQ=
X-Proofpoint-ORIG-GUID: a8N31w1vJS7-tOoP5o6LOKSa3PEnQlGr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140128

On 9/14/26 4:40 AM, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Enable audio on the nord RRD board. Add a soundcard node using the
> qcom,nord-ride-sndcard compatible with two DAI links:
> 
>   - PCM1681 playback over Tertiary MI2S RX
>   - ADAU1979 capture over Tertiary MI2S TX
> 
> Add MI2S pin mux states (data, SCLK, WS on GPIO 73-76) and the MCLK0
> pin state (GPIO 99) to nord-embedded.dtsi so they can be shared with
> other nord board variants.
> 
> Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
> clock supplied via MCLK0. The DAC control lines come off a TCA6408 I/O
> expander on the same bus, so add that too and hog its dac_enable and
> click-pop-mute-n outputs, both of which have to be asserted before the
> DAC produces sound.

Sounds like something a driver should ensure?

Konrad
