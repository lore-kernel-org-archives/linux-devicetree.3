Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743178;
	b=b0Lapzscc+zspYIq/RNHSgsd1MMTpm/nt4el5RS4qOIBq/Vzy1dB990GghSEo/orjJ62
	 vkxeEgvFCakcEcI+bitgF13wOS9UunEVS0YGDlxyG+vnwO3vYZN3e9255ZgP4S/JJfPih
	 V/B8pOSlxQ/La7RoBC+kvrICaKSbw/IfajNC6IkHIYCq/KYTIUqGfKz6bbPda01eNVhDD
	 DisnbOpFD4l3fPlaHCr4yLiZTl4xYUNG6iQt+nPitWO4595I0xzWcwv0lbB2OYKlh05vj
	 zXhJI8QJjuQUD/ilfi36zho/3Jnq9O6Nb4O7eqAut9bsJcTawyyn/PyQmy45/gCAkmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743178;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1jRulH/EkPuyO1q9aYJ1vrfBy26MO1RC6he862OqI9U=;
	b=VPeFJHPGoMmWIcTfgDv63VyP6WhKWgF4K3keU0J2bQaOQE0lUXUdSg4vQxWQv3HzYlQ7
	 viu0nHN08jyFMjtfy9cAlHwN0Czc9bqLMu5wN7Lte2kT0N2jTKza6sgR482LGAd2YNeOD
	 Vj0z/KahdoHncZyUxcnafzH++2q7nB30ZxlJKaBkZWF4/aLLCVRxEvjUNvx5fkGQaeOpi
	 g8bD0zW7XZfOVaheC35oPu10PcP7EQAJW8TJ6VGgCoMjyDvC0F1lXwPUDNYqppatN35zH
	 bgt3Bx+YLtFoYOSJ2Q0dIjpxXfnqUFAVPNO8hKhMbLozjThJkT/UlCGM8V8CaCx6F8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyvWj+ot;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OgMXftD8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31FC606A322
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F31FC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyvWj+ot;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OgMXftD8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FDKj1767187
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jRulH/EkPuyO1q9aYJ1vrfBy26MO1RC6he862OqI9U=; b=eyvWj+otLQ0BXr1c
	5P4DKyOze42qntnvS0GIzRTMcrX2YMQcsvWL4X9TisOmvnlnSgnL/jGkiGrhZGB/
	JM4nCAMccp3ipJsz0sPhTehZi1lstygdrYT0d9g0Z5B/gi+EmIN6ynR9rYIdJQvj
	lKgAuES/X0d+AeS1N4UDPko66iKbUghw1jHtZ9EFSdNSfBsFk2A4Qo+qMDgWuklb
	ltwcxdfe1hf8V0ImNLcu44VH2Iffni5PZ8YCf3QzPrGJ5Hn6PLtYNkOw5RzzeWTi
	M8sZTKvIQXiE6IGIzWyymKcwpKKR0gTp0gZEfqk21r0KQt2qKZ5WNx0DtmkMiZLH
	+ZMINw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahu3t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:12:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a03834d8ffso1003042b3a.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 01:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743176; x=1793347976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1jRulH/EkPuyO1q9aYJ1vrfBy26MO1RC6he862OqI9U=;
        b=OgMXftD8ncNr/PKE5TlrhjqpIQ2POdj7PXSzYwe8VHo29y9I1S3ejcZHgBzyrShfIA
         CyVU6W/koEJ0LY85CDXSFQFhUAyyUXXwAGtP9waFPgPfQ5ZgjmDNUSpwwBlcMuqkucJz
         1K3Of8gLQZcTSHU7S7sAS3tBE7xjJxrtpdJIHpxk09YlYjYKFuJjrqu2z0lP4VgmbegC
         KhsvYIrD+XQ0Tvn2Tt/VuGVk3bJ4LGC37WrkB59ymGVkTq3O3+MiXtZZ3nYBME46Fjxw
         x9ArITPn6y+3SPyJraj23UqQ5zz/HQ5qyVnZBwjrhMenfnuuOAj5qbgPui7WSLvjWrNU
         I5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743176; x=1793347976;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1jRulH/EkPuyO1q9aYJ1vrfBy26MO1RC6he862OqI9U=;
        b=Mfr4dwIVaBCs3eazO0UHkmTObLquQCbIJI6b4lTC+G+X0ipP5/fCRJW9wBFd5J2D09
         npWmXRLuHUORhM2Y63hYYbEnIjQzp3Q0PkPhVr428E6cJ+gHTW6XO0rrBsqFFzKHjzY+
         BAbr+YGaeZnOJVNt5vYBzJetOK3YZ7fa4A/eEPI196MLfrpLRwZ7+nQWMXpMlGcOu5qU
         QgudvIrexnXUJi3hUsH8WBDiiOFWm/uUmewWfNHKS25WGVKnfs8wUl0CbcISDilDYj1a
         qAL6g/78QLIHeqi88TQE40xxq5c3Oyg4H5H/XF1Xf0oKsuTlFPcN3DenQ0ca6oXjkc5/
         ndNQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3RVjmtK986MoTmyAVTDzQCXOI5+tgacQORKYZ0E0RlPHl7CV+bR7u00MW5ngqqvpbi1z4WF6761T6@vger.kernel.org
X-Gm-Message-State: AFq9FYLNibGuNYBn25yD0YSgtadw5hts555cmYNoOk0ioeYTYe3CIfPE
	MufpvPN5+PuQKpR4CxLmDMnRfEIySdOg5rDKIr8PpYr2lpb7D4Ivjy843HtMzuYcCEg1cCa5xWU
	xoKmTw+Z9Gn0gEHEinxTkcU4DHBdtmmtmkFjOc3uUHmBvOWIQpAQ2k2Xh2B8DwD8o
X-Gm-Gg: AYBFou3FubDgjK+I2ou7F13WCaIpHmn1a9fFjBhIVKgbLHCCvLu9LrqG6cumigKGPRV
	CC9K+glvzEZLYH7d6tvHnlKIhj1lf5D3H7sZi0+EPv8hnJwmYdksr8Lad/fc/tbZYG8aCuI5H5h
	C7q/fIipD0m7pvgviTEkzu31l4jlyZ8aXDhUQUMwhtrllCu2fw5y9V3Kr94KwLZMrT+5WgZx1i9
	YQZgu68k++QKQNF8Kq7sTcEXypbrgu7XGsgeu9fs3oBK6VucloZQDqr0k3ZhzGf1yoCFHap64yQ
	11ROzrhfVcnVllNPyju4b6b7waPbQl1lRgBIOUXnFY/eOFhEiO3O50avWvxIVwRarrOuS99eV6B
	gq8IGpUBoyHHTnTjA6PKdA/C4OD7D5FTdhw==
X-Received: by 2002:a05:6a00:2d91:b0:8a0:21b2:7c7d with SMTP id d2e1a72fcca58-8a2c472056fmr1404001b3a.0.1792743175977;
        Fri, 23 Oct 2026 01:12:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d91:b0:8a0:21b2:7c7d with SMTP id d2e1a72fcca58-8a2c472056fmr1403965b3a.0.1792743175484;
        Fri, 23 Oct 2026 01:12:55 -0700 (PDT)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c797b685sm455376b3a.1.2026.10.23.01.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:12:55 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <c7bdcdf2-1fa4-42a5-a89f-689e688af5ae@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 13:42:43 +0530
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
Subject: Re: [PATCH 09/13] drm/msm/dcp: Register DCP display pipeline
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
 <20261015-jshekhar-drm-msm-dcp-v1-v1-9-48aad0fe4f72@oss.qualcomm.com>
 <64603812-672f-43ba-9c5b-783d666d0ac0@kernel.org>
Content-Language: en-US
In-Reply-To: <64603812-672f-43ba-9c5b-783d666d0ac0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXyprsbotZao3+
 MfEnSMkpcYvgq7lM8glnRpRL2uXJH0nj+6ESYRyxPdwwosk54NS1Sm8eTHxJ3xMfeF6OZDovEJP
 Rbx1laWiZlLaiLgjW58x0sk67NuI098=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX19vefEqWSOxl
 zSnaxp6XeuZ6pkVcYBQyy80ZIOroYuA38PTOjjwaE0bqPaoCa8QmltTFt4IY4x91HvQ4H8d4PSh
 bEL3Nd47LmaaJ030IQRL8Er0XTDSbs0OQzL9E04RJGfYM2wCGIWxrLJuXWdG9WnzrABCyseKC9K
 6yOjDGK9ifE9PaUYjBbKaVsMvXMi5EZ+d/JNYCFdqFC/sGsEsW3dENNKw9bsAosK7oRsBDC+wkm
 97zZ1+3CTdsCGpDmUFWZ9nUgwLHrjUqPRBmYwprCAFDnRXjH6waEMqzK5zDMzvGJuG8GxGqwmCo
 j6Qfyzi0OZu/oDo8Dy7n0oByF+OUVOt2aBVq7C+BKJdh3Oj6KoEaUUp3T75tInHGi+x5OkjK+k3
 CBWJwa5nB0QCjcdmkAZZBaiux+s2VntRZtxGfLteBRufiVREI+0i9PV7e8yWl0nOIELXCxxDgK0
 1pnbNzkphyD6cuLNtFQ==
X-Proofpoint-GUID: kevqwUBdE7g3S8n1ObchfPuWacpbBaZt
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb1708 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=eWRtYoRFSfl0Epy3KhoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: kevqwUBdE7g3S8n1ObchfPuWacpbBaZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032


On 21-10-2026 17:35, Krzysztof Kozlowski wrote:
> On 15/10/2026 09:38, Jayant Shekhar wrote:
>> The DCP firmware exposes display resources through capabilities rather than
>> through host-visible display registers. The MSM DRM backend therefore needs
>> to build its KMS objects from the firmware capabilities and device-tree
>> display graph.
>>
>> Complete DCP KMS registration, including power and IOMMU integration,
>> capability handling, display-graph parsing, and creation of DRM planes,
>> CRTCs, encoders, bridges, and connectors.
>>
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> Assisted-by: LLM
>
> Your tag is the last one.

Sure, but I notice there are checkpatch errors, should we keep this or 
remove?

   ● env: :3: WARNING: Non-standard signature: Assisted-by:
   ● env: :3: ERROR: Unrecognized email address: 'LLM'

> Best regards,
> Krzysztof
