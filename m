Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E843E2768
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050107; cv=none; b=hL6yeN6UAC8RmQhw6LimqtU2YPhGIezLVjtYKbEUjqX1bqjjlyzHN5FdVumaEjyipSpNkUi2qcvrNAdyguG+2bpKoUelm94Mrmgw2vAo25/n+CcWHy3BzlJacn4xrRgK49Bbm1r+Hc4X6ntf3BI5AkS67pDWvda6HOr5RHG+WOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050107; c=relaxed/simple;
	bh=DqkbglGexv+yDxvV74pHv0yNXqbNBr73ieYOS8OW/a8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h+NkLCSQsyvEM+sOX0IFiF0o9RP+hBZO1PY/zOxSEDSDA4Us0PCUv51zdLH048Mokk37Ndza+0yj68EZQrh+olU19kTnBEU3XMSXXa3nKLsNfdQLEifCBCmBH9UYZfP9CTyIwUMgu5oLqjqrNAc5ztixz9KZ7DH45WTXlodBjtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exqpR0Ck; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqBUgM7c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="exqpR0Ck";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqBUgM7c"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABfxv820111
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yAFsf6cYUOKN4O63zPVQPesFKfVCdN+ihDwBZVmkijI=; b=exqpR0CkTbGbCS9r
	QbO1M5RuD50HDIdz7A8/CDsJldXF18r1DLJ28WhtAKNr1gmcCT98Cud6xzrQlR4q
	hsb4qP8h87cc92ADqd4nUknuyeSxyb39oIwxGFyLPOaBXHbWEsOQiiD0X8WA8323
	2IyxV0pFT/UNnTyddD++Rdg1bbxXQoFwrArriQzDs22Uu1guDwIXQ7XcVk+lvJbl
	341V9vAeuKiC8BKQvx6ymVMe3dSdo4bcMnO+aruW6NJKvlpxgOwJaJTP5smA0Fjc
	tziJj3oT9x4kDZBp0dbGaIRSxjdEGf/MHmjMiEWcohfBxqCByM8kloZ41ZBSPLVq
	EF9oNw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p1k5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:48:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936bd9b045fso4429885a.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787050104; x=1787654904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yAFsf6cYUOKN4O63zPVQPesFKfVCdN+ihDwBZVmkijI=;
        b=gqBUgM7cWz7zETArKMrKvXcd4Zu7LUMpdzsOcVZplg/wISvz52tqKi4ryBPffpSSjb
         0MdJvdVRhaT59/8ACnI5ko/E8TyuJoDaEB4iR30M83mCEm66Ih7mJuEbxRNJqA3cbRBu
         QCJH7lEcN3N5phQ3zW0R01VGsd0IzTXz30vBKXM27XoKv4zBnYJuP8p5dUED6yBE0lxr
         w+h2rui4Ry/0zJUQyNe8T1lwvAKCxoJbP8f33sGqXMuqLhNB1IBGvXQlLa2XabKQNxTo
         lco4zyXDjxWltX2SxVZB2gg52AvLfj4kPHhHb4WuCaa0Yn4A00yFXTdbq5UITiWjliyu
         5C/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787050104; x=1787654904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yAFsf6cYUOKN4O63zPVQPesFKfVCdN+ihDwBZVmkijI=;
        b=gQgsCYIfR42BVg0GZZmy4mb4mjz2H6qIl9anbbkmbRva4qXWzBkz+xdNrVb1oazjR/
         uHymhamGdEGj/Sovzi4YmndtcP3BB9V64XHDz9FCwxPPIqrjJJJ0AJ8GHyVk4Saonwli
         wRvHYbIGw8haD3pAN/Y4M8jI3X4gyAhg+8SgIaZUXtoCIfL+A+trXm18VFs4adn7PWnH
         Swx4RCEoK22rkdrY0c4O5frFnuS8gWf9kiNwr6cSRrkNNLdd5qA84TxLX7qJ7gjjW+09
         4rTCaEPzmFOsr1sACzl5zOiC7uZU+YXUbr+Tu+sGafTiP9BTRKj10gLQdDj7pHGZ0tQK
         M39g==
X-Forwarded-Encrypted: i=1; AHgh+RoQw+9r7wfi/6dZbHcDxoWSAv79wqStiks5g6THT94MwegfBLgyXePItVfgdfaWOZi/UUHK137kTFqa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs2x9Qi85p684qgKChsS5QI5aak8L/hLaAf4X7oUFVuYfdsDF3
	kqlHukT7h42fnN2d+S2VEisNgFeaOS8l2hR7SihRG03DjCn89Kf6ikxFAYjQEommw0/RLaVLrI7
	ltSuu68Edz6mJLJD/FrZKbidEzVQfSHtMXP+zYYxkt0GT7CttqQs5I20KDyNwBMMg
X-Gm-Gg: AR+sD129G1btQshvZP0E3BOQ2BqA+HDMdmNA7SBiRhFmmFu6uf7scNrG1ZV6ZTRLAzF
	SRU15mAZoDyKWInuaF9oaL8G1tro7irKqlvwwa5f3Lay8DV3+eq6hCQArEeEwfCm0fL01GmVB7c
	VvEERv3zUEUY0qqihOKJMLA8Twedg2r9qAvufzS96S5u5kK/TXRCrHiD7ma2vDfQHW372nX2dS5
	1RmVsyS5NVahqyru7SYwNg2GRSAxJ01cfNxFxZ2EgVx1XAOcTQNQC9fxHJA5j5pLbGVVCk6LQZY
	FUoIJmC63kKRhEUbr99qZouhv4oJ5Z5GpEoHS5iz0iFTl/qPLRp6YO8QrvkIov9jIB10qLD9F0E
	srXKGeQmu6pQ/iFTtRA00hsin
X-Received: by 2002:a05:620a:600f:b0:931:23a:83ca with SMTP id af79cd13be357-936d23849admr2557380985a.4.1787050103771;
        Tue, 18 Aug 2026 03:48:23 -0700 (PDT)
X-Received: by 2002:a05:620a:600f:b0:931:23a:83ca with SMTP id af79cd13be357-936d23849admr2557377985a.4.1787050103310;
        Tue, 18 Aug 2026 03:48:23 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe6aa89sm167518466b.2.2026.08.18.03.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:48:22 -0700 (PDT)
Message-ID: <1cdfb3e1-8a89-4b52-a5db-0359a9f68878@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:48:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8250: add device tree for the
 Xiaomi Mi Pad 5 Pro 5G
To: me@dawidwrobel.com, Jianhua Lu <lujianhua000@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260730-sm8250-xiaomi-enuma-v1-0-ed6d8fb99668@dawidwrobel.com>
 <20260730-sm8250-xiaomi-enuma-v1-4-ed6d8fb99668@dawidwrobel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-sm8250-xiaomi-enuma-v1-4-ed6d8fb99668@dawidwrobel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dqhusGhsnEYMx92Xz2QWfnOCVT5G5T4y
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3OSBTYWx0ZWRfX2RoevxXwh8x5
 MSRbnBTec1P4lUQznxcIxQq34BY2aBBirSMaRgv5gKTZ+TGUQeiGLN9FyrQux5al3+m2TGf7to2
 AZUwTJ0fWFSdxebIp8umuPh/ZjLM+ek=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3OSBTYWx0ZWRfXzhP2/wZHN6Mj
 CbAuV4LxZ04HuYVXwM6SfiuMnbJwoqUDMWv+5u1Ioy3aikRfiDus4mqv/S9xrk2CiqBUmuuYNhM
 oGBG9RfhRUEW8RGYrAANW1r+7nDJ2Cwv/TsR6WrUpurKDy9lbwCYvuO+IeYiC5axvc6tEtVF07S
 G/Q3i27+yxEEG30QGsM7G6Gr2hVZ6zu8gTk+mi6v0DLwYoqAHHjwDtHF206JsbFCZxzFBLRo8gM
 NrA/7/BVEpCZLMtMbl/QY0VGNr5YxrjxczMXUmqCG6LWhu1PpDlhj3LvoSK5vllF8vzT9SrgMCe
 3q35HkyIPfZNbxEA02bwlNG0IWAdE0Krt12IfCQi52FW2zxt+CXTn1x+NZ7oTKdPb+7MQHW8iV6
 uKkvSeW/W0x2J4hHBSlNAsUvPsvmObynju4Yo14W6Jlhqp9dXJZ1n0q4IFjr4PkDibcCpItePX3
 8TTOj/8MqQ97XWbyWQw==
X-Proofpoint-ORIG-GUID: dqhusGhsnEYMx92Xz2QWfnOCVT5G5T4y
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a843878 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=VoYNWTs0KIJBnnxc:21 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=br21HGidAAAA:8 a=EUspDBNiAAAA:8 a=16WXXSGXZCMmNkSL7LsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=rq5_1Q1BYlbxkLLkNd_B:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180079

On 7/30/26 11:52 PM, Dawid Wróbel via B4 Relay wrote:
> From: Dawid Wróbel <me@dawidwrobel.com>
> 
> The Mi Pad 5 Pro 5G (enuma, 2021) is the modem-equipped variant of the
> Mi Pad 5 Pro. The board is otherwise the elish design, so describe it as
> the common device tree plus its own board ID, panel compatible and WiFi
> board data variant.

[...]

> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-enuma.dts
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Dawid Wróbel <me@dawidwrobel.com>

Happy new year!

> + */
> +
> +/dts-v1/;
> +
> +#include "sm8250-xiaomi-elish-common.dtsi"
> +
> +/ {
> +	model = "Xiaomi Mi Pad 5 Pro 5G";
> +	compatible = "xiaomi,enuma", "xiaomi,elish", "qcom,sm8250";
> +
> +	/* Platform type differs from elish; msm-id is inherited unchanged. */
> +	qcom,board-id = <0x2e 0>;
> +};
> +
> +&display_panel {
> +	compatible = "xiaomi,enuma-csot-nt36523", "xiaomi,elish-csot-nt36523",
> +		     "novatek,nt36523";
> +	status = "okay";

ultra nit: \n before status is preferred

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
