Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661048;
	b=P2imIzwff3rSea56hOpobIR/q1MReT5xmY3ar8cBDwT+pVDrB3OqyPI5Sl8BEv9dT5FF
	 nKALgrUybfGGDxeUKsjuCmmiDQcuOs0JhRFqGKoJeuS30AHjXoBfA30E4nS//Df6NNX8z
	 tOM41zYkWZG60LurNP/RziKd4zYEHdksGp/4cmYPdRAFfbsHX3AsDeMllhBCyKWlS7iDO
	 BB467m3uLPkvC7lwz/VpShA/scC0Hx1Sg6C4ccH/zzeJJEpedAN/jZmUPFyDY+ghdH6wx
	 kzUpr+kRUdU6Kjng2S0L6gFsqxrv9z4MtfAupF+lhxKSKa1US5A1IKBlZd7dzx3K3+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661048;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nj8FdNER1lQPCWEuHuwJP70WHPIGMEouL3wovVOCpDA=;
	b=aFcw7oI70frWzYQ88EIUtTLVmBvTLSE6CXO3U4b3evOQVy35aZ+muu6gVyTbv+7F0///
	 m4YIj8IKsAhj5gWh9iUcybL7JAl538qqghStVmxE9kXpKz1jSiugwJo1FqeuNLi+VvlcH
	 Wl2isBs/Ot3lGzPTRdlPY3McfTyCNOMB3xNnZIFLRXCyGNyttYwSysYHvJZ91W2Eo6gRt
	 lgN/rWF93ukKTwPCiKOke5Bh/BwBKRTsdLWyAVtv9qw3e1aJkW5F6QQi4rZ8D8CVhRTvj
	 EjoSi3j5UzhDAx2Hz77PT7KItSIxZ2OuMZD0lfYWsDR0OWZuWy5Aj8d/4oA3iy374uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N/vFE1/m";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bxfxs+re;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F410606A320
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F410606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N/vFE1/m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bxfxs+re
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M703002714537
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nj8FdNER1lQPCWEuHuwJP70WHPIGMEouL3wovVOCpDA=; b=N/vFE1/mSFa1ukaD
	js8Y9n/UES/1A5o0ZBcxd7RGhw+5/9hVxywK4c9OUPG64JY3SqJ+nqR4ouaZUhcb
	jgS8mFF+bLVkexlScNtM+dmXHGrySH3WxTnEJ46co3aNwZ/QUIWFfeT8tWH9X22v
	hT9Rj3ATyXDnkbYFWNgY9FydISUj8y4z67cHv/AjuvK3l5dsaL3C67UYKoclRX0y
	5v9UWWFPeFunnYrqMbUWweWvQOuBGPBKI0qi7plXvRG+rz6n3e+LmH9fc/KLkXG0
	cddLivR76IM6IO98gGbM5dNMKsF/wDULpj9ZbZAmwzOEQXN55/HtMHac870WPKnD
	pwPz0g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsnf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:24:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cac495d99so30595185a.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661046; x=1793265846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nj8FdNER1lQPCWEuHuwJP70WHPIGMEouL3wovVOCpDA=;
        b=Bxfxs+rekTZ7XMEy202kKQ+cS+YdsqYn7i7eFnrv91PFpsPTe+gAb1EGge9dhLuZhc
         2z5qkzsldW37/05NIGE6YxnnSho8dFaupNy9u6gvxI/9LhUrA9NNg0ZKXJ21qZ6Z+zhS
         KFkcLOEYymnJSN8ZFr0FDfuM1cc7Bsgw69coimBtAFK/HF4qxBYp+V19ngY47FPeWKNf
         0KiJGoVHpD4lbFyxFqv1tc/Bm+N4XgG+s/nxgzhRk2rAEGPJrCMmWEOwtTVZnhlNWC5W
         aY2nuxvtAsmWvAWiYkeEEARIYPj1TsUWGV3AS24cPB3VtF+GN85qISJa0DggzaFKEdpk
         GqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661046; x=1793265846;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nj8FdNER1lQPCWEuHuwJP70WHPIGMEouL3wovVOCpDA=;
        b=2pZeylbmwA71SrSWlEk4nRDMkQn492RsA2YUsJcZ38bB/gA0Z6qDJg+OhmcdZ2u2MF
         xZ0bKhfGj0gCHbNexvWpQpmBc6K2j2BzeqatMZSkiT63Gy+aJXH0ZlV2r9SJ7EGLL3TG
         GLsKsU7sBEOxYECH3oalTZ2wCLyFjknzGhX/biHizbXEX/jsMSp8VcELBD5HGxOnyR2j
         il1e0bejhK7z7rCAC2yrP3oMPq4G1ZfMioION/75jl+UTWR/4Io7ty/G8eIKJfq8UlJH
         DiMC4wsWgi3RVh6VWHCaLvN3aVRy+JrabG1+26I1si6EMHNq9ZBziK6xg3GkeiNUmbbN
         jvwg==
X-Forwarded-Encrypted: i=1; AKwUvBzzBAi4zAzzvsfEQE0WBQNKG6l/ZwsykeEjhXOsYTT+H4l5JMCG235Jw2i8nu0ukiFKnYJ8xdA+R2r2@vger.kernel.org
X-Gm-Message-State: AFq9FYJDg1UaykyyPBs7JwtS16Lliprg6x0xaLt8wtNT5R6kgBhMF24f
	zDvS5uCDIDJMGhhGuxyvDfrPtQyF0uofzpprtBGN2JUQiOwoTJ1M4tmF1tdSbQoT+npYaX9amlq
	Tatzrl9UDTvD7b8f6eMAdjGlUUy76GjLbtT4qBY8N/Q8LEqsdUA9qgjpB9E/e3QIq
X-Gm-Gg: AYBFou3vpkGnMF8PnX3ze+0PWxnCmiqF9c9LC4SCgTAvXfLVdWSyjHhFClWLae72b3d
	kfusoUwPgGITD4Hn/BLP5rJ71/HB6LMYwZVxKwXk8FnvwEDnS4fv30oXkdfEwfC1wiWyjBzXvvS
	aGVFy8RqZC894gpFvVC+5YTc8fmGNrO5Uq4e9+Z0ralbGk+z6dAq62yHu9h7284qmWVmK93vsBa
	jZiZRMzu2AqTdvrv4Uvzo1N7mCeD7D2ztn5/gOsP+pvFCiGujTGCelcgd2PxIPW/5EZnJkEbTrB
	YhatR4iX4dj9IQYXJ79MOdJf6ANfhII20kBw9WvX/A+vVCva4XMYn9B+aWXJwg2vgWQq4Mjqe0q
	MiAG/pDZP3mHAzU4s7Q424A==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1116781085a.6.1792661045768;
        Thu, 22 Oct 2026 02:24:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr1116778285a.6.1792661045267;
        Thu, 22 Oct 2026 02:24:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55ccabsm83948366b.33.2026.10.22.02.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:24:04 -0700 (PDT)
Message-ID: <0b829c36-ea7a-472f-85b2-c32ca8121047@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:24:02 +0200
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
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8550: Add support for Samsung
 Galaxy Tab S9 Wi-Fi
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261020-gts9wifi-dts-v3-0-afd06fb2d9f9@dxdmail.cc>
 <20261020-gts9wifi-dts-v3-2-afd06fb2d9f9@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-gts9wifi-dts-v3-2-afd06fb2d9f9@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7tuSYEhhFd-1UIV-gGpUTyFRpeaOxTUR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfXwz0cYeva1nS9
 Q3nMSiyJX6ehaSCqNH4/efOhWPQT8stfEPeE1Wb4afxdYuD43DQiyrCjm5rh+7ZoooiLYpbOfI4
 huoT/qS5TLwIWdyHvSJAHnsnodQYKSv6woxCT2QciThDJn5L72cVG+s/fXNKDxeP/aUsQ5i3kMW
 MB1bj3YGVyAb6jk6XCsH7gYK/2yCBJaLDAzUmYvJGL59OonlHm9cC9FVOxhu5HaJD+bgV3dTTNg
 e13RsNwqwQkxC8Xn0k4IALTzR01Fdi0dZdlqPqgRY6wDo1rPCX2nglYEWec4fi3JJCunfgb7YpL
 vZQmJWA4BznotuVH9bwawmjycTUnTr/35Zslf6AdaFV/OzDueDlbD9idRMD28QQmjuubBFi2xFS
 Dxgq6gxxDXwbG4NHdhLo6QsUfxbJQlifzz2Hksqkw3bwhVszP+RfNsqfP9AraNMaIFb182TaBe1
 R4yxnnDwmClLchz47qw==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9d636 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=AqZmfHzJsoaMp3Ki:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hvBRWEyMk56MnqwRZ0wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX2nxhA2hcd0pv
 iFpVMETGuncWRKpOYGxz7qqk2pLxYooDfdOmSfIDukMqVCImqFthenleecySSE9GvCbmw6mn717
 0kherEn0AexmhJQZfqg/g36yWfKznmM=
X-Proofpoint-ORIG-GUID: 7tuSYEhhFd-1UIV-gGpUTyFRpeaOxTUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037

On 10/20/26 12:42 AM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> Add support for the Samsung Galaxy Tab S9 Wi-Fi (SM-X710, codename
> gts9wifi) tablet, based on the SM8550 SoC. This is the Wi-Fi SKU, so the
> modem memory regions are removed and no modem firmware is referenced.

[...]

> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sm8550.dtsi"
> +#include "pm8550.dtsi"
> +#include "pm8550vs.dtsi"
> +#include "pmk8550.dtsi"
> +
> +/* This is the Wi-Fi SKU: no modem firmware is shipped. */

FWIW at least on older chips, the modem would still be booted to
provide e.g. GPS, check if that's not the case for you. You should
also boot with memtest=1 and CONFIG_MEMTEST=y

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
