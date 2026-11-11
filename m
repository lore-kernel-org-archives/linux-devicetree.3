Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400308;
	b=M6KagsJDyxz4tcXwZY3VS0TX+7DrkY9DyTc/d7Ga045gFmSyENAwB31Gqe08R28iMT25
	 8tqB8sppQ3QYMcNUgPeYkFjc/fE/knSa05zZ5tkHqx0ZM+TB3Oku+akc6NYqmtYELKSiG
	 Wwbp9aY3hiXcbGMQOQQC6SB+KcadNEekP/ZL1REcqbzBgb6U8WAeY/B3f0Jtxlhb3sgU/
	 M6ZU0KiBPFL3aSmW2b2hKC8VYXmwYuyfx8htH82utqxOA5PGl+25pc/dP5RzSCET5YQvW
	 Og39mqDi3NygoBWO9woXrxiMhLWc0suwRg9BefBLPLCXVRR8gzjMk5wC6pTNx3y0UjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HYqCJGzgAv646u429yCqw4YAZhdaQondpXuCRwFFu90=;
	b=pmMt8hD2Eg8w9PlCzf4sEqa+0XRUPf5AGNVXwSnPj1x1THW94wT3ASrsz/8qoixwwePX
	 fPIMVNv4oyO+t+eZ9gbduCsUyVY5bRxuvaJuA8VcuArLjG/DSr+zWsvCzj26tqkqWuhRE
	 sZNHR01VaCtoeeVQw7akaOGFsn6fZGXsXipe4u4G61TPuibEnChxZYoSdXF7cSQFRrvfE
	 z9tBE5DjA7tMDZRFyH012Rv9Tw2+Rq4zueWm+mBSCX4VV2K7PXl+igc9JzwGXJ1AAPS9j
	 mG8HXWxqh1uEMNHULj1qtIQ1GUtmh645521peeXMZTlGgfBBZOk39NH84jmbLoV2V7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M+fYDss+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XFLc9Uzj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A1F606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5A1F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M+fYDss+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XFLc9Uzj
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCPrLt2266894
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYqCJGzgAv646u429yCqw4YAZhdaQondpXuCRwFFu90=; b=M+fYDss+XW4jSr8y
	zRCACHgf54Tzk75tMzpDYfNl9Dy4PPZIf7DnKhHSB2HhViYPzPyEqllRWe1AaHBM
	AGi6HGO1425ISVleGuGzGEdpez7TuZAPuKvNWPUt5vI/2GI7Wd/9rB/mu0QBkzYv
	pgDOR7sgNNgoNClMBBACIXYQ2cdFP2r0hQP3UXUQuLnZlrTBN7FeROainvJLALb3
	PgY9sM5ccD2nGqKC9d91wjPJNlTrBsxb0PWK+FKfhUiIP6/QpKjhp9VXZXvv44Ll
	nTnTHOOJXPJvLFVvOFRxvWFVgZjeTrymTgceT1hO3F94g+1eklrWHBGEE4EX5AxZ
	A+urLQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm95jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:31:46 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecb636b587so817886e0c.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794400306; x=1795005106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HYqCJGzgAv646u429yCqw4YAZhdaQondpXuCRwFFu90=;
        b=XFLc9UzjaqOf8+lsKnpUyi9rOexLRT1S28FeOUDeFbSfr9iiKSSQZFc2sNRSs4GSY3
         Ke4B0WxQBFA637C+iDK5w+WURlA4t+x9pWBcdMBwp8pR0WN9WQTuGjv/ZecreSgnFUNR
         OjagcxxoBdpqGPCI8RmSz4nO4PU4E1JF0XKO5xxneJnYpkjGyB4BniuWth/MFLgwieyc
         BcutDwXQumiPAOUz6tF4H5tD6kMM10b6KSUgp5R9RK56Ju+Dif6ZQQP95Zokcx7mbXKm
         0p9oTiPHNIB81khz+JOxF2sV19aHm6G/oYAuN/8HQzLgJ/2LEb39Ow/pYpohKEK99i6c
         KJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400306; x=1795005106;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYqCJGzgAv646u429yCqw4YAZhdaQondpXuCRwFFu90=;
        b=FwINzsOuSqmwzlzR6TsjF2FhQLpn+Q9w89uh02v5NbCw1UK30uHbvNQiu6RDftdj44
         pqQP1QSbT5+NelRPjmdGTnWe9IY14Yg7ByJGRuiPr62ygyaH2Pwt/r7DDgj+7IONwQRm
         i83YL0hZ29KukLYyG2jhpuyPAHV3gJNbzpdBsXrVJga88yAIYt1MJQaxLooN7CgYHK4L
         pbtTe5pCNJCbNQ3CEPaAlqoVYN6J12Cdo4vic7CJi/Edl7JUfCkn3B/PDbM/7g0eLBLn
         4uH0G7EMpVOLDwKoyMKZHG8i+GMEarXf1Rzhn/zyUvPb+DjYopl+cbGAeURAW5OGksDA
         BJNw==
X-Forwarded-Encrypted: i=1; AL+hErFgmzLxSR+mfpensG96k0Csiu//+52soK71yxWfZBWZfZ2RtP4e1eNBFDRoB41eaZhOjwURrSI8ovBe@vger.kernel.org
X-Gm-Message-State: APuU4Z+16ZOGHNRrVbgIbOH1M4O272UbKXTADydZaE8zJ80sd+tEM813
	XE3f2nkRuNz/h8tvmANlBNDINh1q9FZtb8Hmep7qBUis1bkkYKQXDCQm40rxhwLngwz3T4oZ9Nb
	LN89crL8hvcLjp8B4m/21PYiW0Qm9wwh/EBB4HXbBLXxvS9W+WKBg5+FFB2RImuJb
X-Gm-Gg: AYBFou1+VRRlYbFUDazYL9+8PbFzoOyjKOahJtz7BrWivSekuXfwosyDEBR5vycWaZY
	0ynZcw1ZZL5FfYfYL77nbCrCWWgwmyhz9jtFq0t9sxbRyW4AcN8mQio7M9rTyBhPEJLVx/OROOA
	l1p/rvtI9eJUK5rPsYyqNJ7P4kMO9kIPwx35wR4DNLfUsNSayp6Suvb6DfdWiS32JG1UA2xK/X0
	P3EjiWtGJYPjyFTqmvi3H0kkaNEDCkuSaWqsQUWHNnuFV0b4yuhSjSLFB6ks/FGh2i52MKnouvE
	j9AsxBHhXp61u6gP9mAS1b3ZUTkNDjZqxKGdmKYyxRkXPk5ugfEEHdyABb1csV4O3++m497ezL5
	Yluikh8An01kB6wTx5VmxUpUSAGLVp4ia4QJxmQUU3s4lCOvKqnXtiHFiPuNleSNW4VY+9278J5
	Q=
X-Received: by 2002:a05:6122:4317:b0:5ea:e196:272d with SMTP id 71dfb90a1353d-5ee1c3db8d2mr575840e0c.6.1794400305574;
        Wed, 11 Nov 2026 04:31:45 -0800 (PST)
X-Received: by 2002:a05:6122:4317:b0:5ea:e196:272d with SMTP id 71dfb90a1353d-5ee1c3db8d2mr575799e0c.6.1794400305032;
        Wed, 11 Nov 2026 04:31:45 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c2793sm10687527f8f.45.2026.11.11.04.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 04:31:43 -0800 (PST)
Message-ID: <43373a9e-9ff3-4641-b961-b63f4de21cb9@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:31:39 +0100
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
Subject: Re: [PATCH] dt-bindings: display: panel: Make DSI panels port
 optional
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich
 <akoskovich@pm.me>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Morgan <macromorgan@hotmail.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Michael Walle
 <mwalle@kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Svyatoslav Ryhel
 <clamor95@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Jens Reidel <adrian@travitia.xyz>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Shawn Guo <shawn.guo@linaro.org>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Alexander Baransky <sanyapilot496@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Romain TISSERAND <romain.tisserand@gmail.com>
References: <20261111110338.81717-2-krzysztof.kozlowski@oss.qualcomm.com>
 <avRM_GhtR8vMdTO4@houat>
 <c8dea6ad-ce41-44d2-96ab-233b0a4b1340@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c8dea6ad-ce41-44d2-96ab-233b0a4b1340@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OJoXRjADjeH5Knk8-mQhuBCgfJpvN67R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0OSBTYWx0ZWRfX16yrKIdewO22
 9OhnZj1Q30lsRX2bj8kCoWKl6RjyA2BLMvJxBwQDShpOhicsIZmd2DuzuqeNbUUGOgwlaKEZg86
 43uryKPMB/fcLz1sSAM6lB0DhbJaNUQAFHlXegdTZLo18vH/kylIktJ0EkE+oeF1oG6+RF7FoB5
 stALN86DvYAKnxuBsBgsZfGqm5iKmEaWezRfpYRiSr55jP6pXIi5Ue/r9CakyVnh4Izxh0+QiDr
 jzKZlnrd1XvrzgLNHC/ZTDcgFwebyCF1fSONkqSs4gvNN8zFOmteNlfINk5UqNBL5uO0qel6kQZ
 Q602Qfp4kEIQS3sOD4A0AcxbGaz+Ai82lQbE1v8xIwbWzqzy4WboRfnWmJGFcTmZaYqmThlfb1q
 6DplCSdEINBRSP5CE9A3abKkSxIUozTvziVBoMk8GLYuTWDRKXZAMae6YylhhOvWMvYMyDGlmvP
 IGozKtLGsFO0ql0FXrg==
X-Proofpoint-ORIG-GUID: OJoXRjADjeH5Knk8-mQhuBCgfJpvN67R
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af46032 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=P0j__KAnszyX0y2xDOYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0OSBTYWx0ZWRfX+WBHiY+jgyaC
 qz935Un0SPDRBy2zYHb6fgCXALbAq53Q/7qFtuclXW3rwJ7qOdgcbAoyMUVfENpyx6xkUgviRLw
 XgcWWfUrgjszY2p4z/bg2IYswKegDgY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110049

On 11/11/2026 13:30, Krzysztof Kozlowski wrote:
> On 11/11/2026 12:13, Maxime Ripard wrote:
>> On Wed, Nov 11, 2026 at 12:03:39PM +0100, Krzysztof Kozlowski wrote:
>>> DSI panels can be placed under DSI bus directly and many Linux DRM
>>> drivers will work fine with it: mipi_dsi_host_register() adds device for
>>> such panel and DRM driver does not use OF graph to configure lanes.
>>
>> That's not true. We do use the endpoints to configure the lanes through
>> the data-lanes property. See drm_of_get_data_lanes*
> 
> Some drivers use endpoints, some not. As discussed on other thread,
> there are more than which do not.

"there are more than one which do not."

> 
>>
>>> The affected here Linux panel drivers do not use OF graph, either.
>>>
>>> Requiring graph port for such panels is tying the binding to one
>>> specific implementation of Linux DRM drivers, e.g. Qualcomm DRM which
>>> requires the port.  The port is not needed for the hardware to operate
>>> and for some of the Linux drivers, so it should be optional.
>>>
>>> Suggested-by: Romain TISSERAND <romain.tisserand@gmail.com>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> DSI busses can handle multiple devices, and multiple data types. If we
>> were to drop the port node, how does the upstream video device know
>> which device it should send its video output to?
>>
> 
> We do not drop the port node, who suggested that?
> 
> You do get, that we are not talking about the DSI host, but the panel?

Best regards,
Krzysztof
