Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F9F41F362
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233511; cv=none; b=phSy6LA0jK/NHBRNVazea+vF9HHF04r0zKA0CORyQLdjULaGnuSbQP1tKmMARcnOg8nKLnFLBOM88pYDroVniL8SFzuIuumbcE89O1oT9Icap0dcn1ON/yOJ4jzXDnCK7mnYacMsFYILMz9ELginXvJV2MKshuSP1z3JEvn8/zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233511; c=relaxed/simple;
	bh=xqFbCnSsGLSw2njuPTo7qEVUmaOsc/JdKbdBRlz/pe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbwlWQVTjyddiBQZamz5pt4b2Ps4RCKQjJeYzgJExYxRskmTu+I9X3Afq5RTpHFmlUxrFqUpQF0CK6hYETopqTNjxQ4PEKRQoS9Spevf4AXAh0WUMOPQthCrs5G30VSHFzqqODFzeY3DxQR0ZU5fRB2cNl5kWWxIR97X5IXkD84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1FfmrA6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EQtKbQRo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1FfmrA6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EQtKbQRo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82HV92128842
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNwlA0hdBAVgy7IiebJ4IPZsJDkniERK7NeOika4n38=; b=K1FfmrA6UnD7PVAC
	TaAWyluvmCKkUOy0s+MRya47jmT3G8GtcqtjcsF5jb19Jiiophxi5aDXD1kcBmKK
	/P3CFB/9hoMTpj0Y6gYGa4TGNctiI2sqazy8hDJfteYJHnEBKOaoWvDrDYpRN4Zh
	jNQ5lrMfmiUoQ5S43krOlK9edJwGWock3maxNawil1EXVkH9M2xtEWcoZm/UGZBt
	eecYY3jpD68QEhYhhlyX5BMQrjAt8a9umJ3lHPkHxDhBFLRbR2DlceIMoRyaG0wc
	MwdSFMfPxfF+q3O4mUSue069jfwq0Hpq2mAD/adZZarfR+BkKaUaYFrzdD+gm4tq
	93JvIQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8bp1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:11:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8fd356ee3a4so1666916d6.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 03:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785233508; x=1785838308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNwlA0hdBAVgy7IiebJ4IPZsJDkniERK7NeOika4n38=;
        b=EQtKbQRoF10bAVkuNKGI71Rnjk8hb4nKJGmcuib+FFVSopRF36TBEJeI8Zz643ymtv
         70NS9HkNeTSrs+gmgcuTskHr1VrOHRZRsiOASJ41n4q+euozSS0t+iVTN5XFaaxrDvyv
         Iity3R3E3BZoAAHf7ppgDSs3IC6j+6quIhCOchiXcH2F1o8JXsdXHje9mAlzJBA7znE/
         AWU2gMAOq/4jNSH9ooLSWNIWcnY3Z7cTIBFDIDVtiFOu1az5xJQ9nNUsKrSyNXznsdOE
         oQiONhe2faq/p8hJbaC5ZbIYm6of91Fsi7BrdGtVCf7PvSurIr8x6JjfMf5efcH11OQw
         59Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785233508; x=1785838308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNwlA0hdBAVgy7IiebJ4IPZsJDkniERK7NeOika4n38=;
        b=Cv+sCReutiY/33YWs6jbW0xukUMpTfS1utFyA8M5L5ydcbrg+k7ulJxUMZOn/P5bKu
         9P2jJiWImWZWSBU/w3MQXPZUuW2fJCqN/7HxWhSswnfJwMnKo2ucmnNgJhsH0sQgmoU3
         NeeY68a3M4BA4xPq9t7HbvpkyPqJdOHTJL/dcDCWBcZNHDxB83cJK0Bk9DMBnzirjyEC
         I2kOuimI2zjoc0tPdOSGJwHQT2Gi48H58B6rI7RD54AUaJaHMpS1yuVYe/Q0niS6/4AZ
         d0/FfusBrFzrqPGDme9pdxgozyPFuT6v5XCORm/PeavO4haegVY/beBWPz1ZukNy0aEW
         +QJA==
X-Forwarded-Encrypted: i=1; AHgh+RpDHoLBMXH/bcCqA+mtVO1RmjlDLdtSycc5+0kvBS5BSy9fEyAFWBTPzv6y0nUgBeDQDOi9kbWn3gi/@vger.kernel.org
X-Gm-Message-State: AOJu0YyxKPkbtZmxUA8b80oIrgS/m5ciLI5rN8aXTyX8ISz6w6IJRjc1
	p1BQrV8zcCWBjB4xksBmQ92S7wfjKh2iv3svMEiHqw1/LVCVwoKhhW9O9BvKMc2D6jar1YTp5d+
	JpMzzw8bEAcZ3dXNQAOTinGFZiygLQZBs8LpmGK9mra0tua66abYWYHLGSnDI42z2
X-Gm-Gg: AR+sD11ZUNvP9UTHhPt1Iy0cEQ0MT13AoYTH22Sep9+ElRkmt9MriaE7nBr+SqFBLdt
	MMCQmbvTv8zrWT3MaX3+IFooUhwU5ZZl5jNcrcRIRjxZKbLZ6d4YXH6qeZjip+iFPEFSO/HcRr0
	kksR96hiXRioNQoX5oiTmzgqGvx9wnNpxhfwPt//lR7BeGCqj11twk+PxHysXy6Y6y5jEslMmDL
	yjz4sABuS/JABpCdfS40lPwr+098M9NXFSPIX3eIsYUxlUMrsyOCwJ3KIumuScOwqNZ7BNEVgU8
	UevNGskzzRXQVZszWZKRRk6J6iT14P91yayax3h/1gNDfRePbKO620AjOT3TTr4byuse0mQuboa
	al8HCiTMvNILaV8j6mmGtz8ZQ
X-Received: by 2002:a05:6214:528f:b0:8f1:507a:ed6c with SMTP id 6a1803df08f44-908175552e6mr24110936d6.5.1785233508170;
        Tue, 28 Jul 2026 03:11:48 -0700 (PDT)
X-Received: by 2002:a05:6214:528f:b0:8f1:507a:ed6c with SMTP id 6a1803df08f44-908175552e6mr24110556d6.5.1785233507761;
        Tue, 28 Jul 2026 03:11:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebb385sm740924066b.52.2026.07.28.03.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 03:11:47 -0700 (PDT)
Message-ID: <8c79424d-8b79-46e4-bcc9-37edce5664c6@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 12:11:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] phy: qualcomm: qmp-combo: Add preliminary USB4
 support
To: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>
References: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
 <20260728-topic-usb4phy-v2-3-5d9dd5149ec7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-topic-usb4phy-v2-3-5d9dd5149ec7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4OSBTYWx0ZWRfX/s592Xxjkxfo
 7fShYLvSCOYIFawjwq7NQe/oWPIIq49hCAHJOucDp+ZffGD3M7ZLiFjx79rx77s/hKNUcuMeyDi
 59+xj3E7TPs7iJm7Xrt5HBZhVVqYm3B2XIJvUBLb6cfUHrr4ELcPmbFy/mx8BlOMaYW6IeEuLrG
 qFAHbzH8YYvEPDDTPB08zDVJ2Y54LaBVQ+yAF8sPkAuhyRFCgwhYiP85vY9DpkToSDQWyyv0YOZ
 jiCXdRkJCKmXRK4z3kXzyXwoO4qfvaR3WYYdLSpdadebkck2AL+0dmIG9TPi/OtV2IRkOG0W6f/
 a6mlooBiFso3iwQRUj81OapSl4fMtjLLLDnexuaoF1EsEVy1zYMrux6GPl5Ix4zEWRjKlwqIsHy
 4gnwC5TLBGNsYaUHV2x0NVR09H4yikjxAYgQrHyXMCFlxlt9ZaWtdOMBD/ekbPAJQDTVSC6iKA6
 6pJ8QOnyyto6VaLRFIA==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a688064 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rXb9wQVw3mmQ7qUHhtYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: _2-79l0jc3h-SBNVWgCQps57PdqVPqMU
X-Proofpoint-GUID: _2-79l0jc3h-SBNVWgCQps57PdqVPqMU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4OSBTYWx0ZWRfX/1e7qZldGULP
 vKs/I1uFRSz/IAiIfAXKZ1zW/4oOHX9yOIapV12UFGfP2EfRiT2xsCCFVmG31ntyF0YOsiDw+MC
 kaWi26CuZCSCq2JYGDxcPPP+F3UGtvI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280089

On 7/28/26 12:10 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some Combo PHYs (so far only on SC8280XP, X1E80100 and Glymur), come in
> a flavor called USB43DP, which as the name implies, features USB4, USB3
> and DP signal processing capabilities. In that architecture, USB3 and
> USB4 PHYs share the same USB_PLL while featuring separate logic spaces.
> The DP part is roughly the same as on the instances without USB4.

[...]

As I pressed send, I noticed b4 didn't pick up:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

from:
https://lore.kernel.org/linux-arm-msm/37a4vzkiicm7aw3bg2r3s5e53kigh3wsc5yuqqjp4h6oxhpk7g@oybpt7kdnnxb/

because the patch applied on an ever so slightly different base

Konrad
