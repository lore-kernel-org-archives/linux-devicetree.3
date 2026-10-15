Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110E413790B
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071569; cv=none; b=CGxJ2AoIxfgSXD8G9qjjXvelKPG0GGUvOZAewBJ9Q1ZKgfYXXgMMLFRRIihuCl7Jkk1Yj6k9HFKWwDk+6whia9JPLx0fG8YhFY2fXFIiKtb5Ohqf1XAH+zroG1XrG/KaaT2d6Yu1lL/V4EzIb168KM+qyoeG/0XqYuKFbntqXzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071569; c=relaxed/simple;
	bh=aOh2KbDTODle4grtPE1FVRv20AnwMa9h8HJPe3KDcw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nJEUkMENkrPzd5nPv8OTDCGtxbAg8EbDhB+tWeTkOEZQIpZvr9fHv5NeI6SNvl328x+fx5nb91sdYz0/H2RYlrCy3Id3wq2JtUV3cLrepwvw5wrAF/OhMszY+33mi0wcr+czpbHFytDK3e/9n7uip0GYsO1lycpPsIcHi00HDN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3EH3fVr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxDrXb8n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3EH3fVr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxDrXb8n"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jSbE2662653
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rdX3QCLTENQF6a7iOoH7LlhHEJoWPHuhiEjvLDq2Jqc=; b=K3EH3fVrt6zpt/ia
	QI5oUNZmUKUO+aT6h5z4UgtvU3WpGypovVVxPUzvwY5IXB3hMZS/vr1WmQ/81456
	3oD0AgqVqRx3P+OeKrNVcnjzWXE4fusAuaFgpTMQTQa+rkIV+hc41y/v2axMua0g
	6vF0+4lCQjo88A3Pqjq6EITsRr6yN/Tx6/v7TnXBPK0/3R9ZFI/8FFrBs5scWShI
	hc9+7Nd/olymOyKpWisS+hRqbThjdIZYEx2uWX3IJzG0Qy36++TdYXWBh5lxsx76
	9o3IQqxAuCFCJ8rd8bOqS/vj07tZQujr/mATkQ7xHIbQ6+v0e5l7xveezN3Ntt/B
	vmTyDA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda29ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:39:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53391022d8fso11988421cf.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071566; x=1792676366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdX3QCLTENQF6a7iOoH7LlhHEJoWPHuhiEjvLDq2Jqc=;
        b=kxDrXb8nElWkVPjhAmPr90CMrFGwG3rI+XiQdjLCGBqaFyNhU8M9ecw98zUtn5K8ET
         CyXYtjVY3/3I0zXdc0Cks2o7epBGG2x0WsEVsYrhHyfzbD/oZR17wpnqzyESbog0CF+o
         SvXWeI2PuFyAdBD+x1XpuHZczvk/tnd/FzK5ExSa++5OFEto0QZbm5avLzGkbXnyUiLg
         aeJwHAtFRR4g5wt6mGnVAdSygVyZaO5WR3FFxAFM2T1Kgt8jWi22AuyL7uIoUfKxDI8P
         ZJ47mlwqVSzO42LwVczTajIHrxcAK0a4fzq6NmOrfQxTUJ+EDHm5rJ4Hmvty6Wrd9Sfv
         Tzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071566; x=1792676366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdX3QCLTENQF6a7iOoH7LlhHEJoWPHuhiEjvLDq2Jqc=;
        b=ApzPWwwNJceh6hLWBX0Dfh8H3pt9+JmECpbNFnKsuTRrDAdhZ77/fIlBvadzWTvSLf
         YU1wWIDksBa8aQdAHzpRIwr2+cjuRQm2uiVoNqWnbjITEsYKS3b5No6m/N2d8bUqa+z8
         rJruBRyRHK33Z7brNAD4jS26ghOhAN4nR64HiFiJne+FIXLSyY1AgJ2NsAD0Yw1AtlYQ
         uwD/769tLWaJh3+pFavKZfD6qHtmpCr/ylTxWlPCS22fae5mwKpQBEok/L/at74RYusf
         G0KhONIKRy9WYNbjg1SmSw0XCuc+47vbX74zYy1CqHCyUsDAcBeGJq4oGlwdMGVVJBFW
         nMDA==
X-Forwarded-Encrypted: i=1; AKwUvBwqRGOMWdfXwTEDZwX0prd9NKL71o380X67oPcb4wfN9zwzbrfIDF02baaKoCmsOhadpEXJKpnc26Xd@vger.kernel.org
X-Gm-Message-State: AFq9FYKSuNkJ27YMkiPbvC9i2tOfIH+V+5eyEq9nu7RV7z+ZSpk/fqOO
	erB9T7fzqDZOxBxKPsjKeFKwPrNtyLXCo02B7yGfjNjCZMvKjH4PXaqzb9hBxPF9SKtNMUbPe0P
	Hicer5erQW1embr87orNOV8DPFVwhaLwac0uE5JXc4AOwBl8fqfD9eMJs+P6igEZz
X-Gm-Gg: AYBFou1BBXkKnDssHKQJg6KqLjruROVBEQW58rU4R6RY0vuhdE5Il+QCFb3hRsQSQz1
	u/NiBs1qQcQkBlZdAmYwhDJvN3/yQB0KxnxynshbJVIdO+euVBAxFAl+Rxfp/q+3KaRocCH0Q7N
	PmTRxlezTjZsKZNgvnNAec4ybYFFualf1/U0KgZgHKShCoUjWdlBruJR7aPByTRD2YGnXFJX8P9
	AkEr4ILQNVxniYpYvdn+81OYFmU8DHvgYMY1c1qd/j3OGH1BOeHTCvdUxxWl70oXmK63+DCbRrF
	YrA4JYH5GCPOXzyG7izwLbvFVpt3QguwguknBeT6awzdo0tx8IzwW2xpM07t5vV8oJG3KxhNH2m
	+eLo0TjMVlcUhpi05finsiA==
X-Received: by 2002:a05:6122:6990:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5e92e3c09b0mr5140633e0c.2.1792071131474;
        Thu, 15 Oct 2026 06:32:11 -0700 (PDT)
X-Received: by 2002:a05:6122:6990:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5e92e3c09b0mr5140566e0c.2.1792071130738;
        Thu, 15 Oct 2026 06:32:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6be6ddasm129094766b.7.2026.10.15.06.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:32:07 -0700 (PDT)
Message-ID: <65f6883d-8ead-4c6e-80f5-81f6857df0b8@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:32:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
 <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
 <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
 <5568fd0f-e412-4f2a-9f1e-729a469da572@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5568fd0f-e412-4f2a-9f1e-729a469da572@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfXz9UgdlbGk3RP
 E/t3+iMPkKtC31o4KOlM7ZtcHye/5DHOiGG4vPA3U0oE17dXc+PKp9NWHDZfCkU43EgyNVZqM6Y
 +uQHpLma4Kdd2iGkl6p1MfBx8T93HIA=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0d78e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=8k6WQxmsAAAA:8 a=4wGxsJ_OTqgDEiZx6fMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: zmpwVS-GLxwCIi0aVqq_cunGI0aNRCHY
X-Proofpoint-ORIG-GUID: zmpwVS-GLxwCIi0aVqq_cunGI0aNRCHY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfXwrFQmXyyr6xj
 wWEdErK8Ilio2x3LOGsWBR9Q+ZNznALyiw0r3yT6sXq/YcFotVQRtlIvvAhi4/Y8Y929oUmyeWw
 0Ne43xJ0HVCnxbrgs7a+eu+opheTEomTINtn3Zk9Z3QVT1NM/BAgCuy+xGXqcq7Zbuvumo0tUhc
 8viizdrjry/czA4VL2gf9bsf50OeBMp4JH1Shy5rgiCMQK58hq3Ot+1tvsEMvloer7fGB2hCaX/
 Ae9kNAXEKMVOaO5qiuBYAw3CQgftX27AudJhgCBGwKrjuzpqS1+WAHGIKiXOrwBAbE8GqWmugYG
 A3KzUJGwis9HHQrcOlmQkqgb+PjZ2g+4r/K9i+plLmBPSeEv/amLd7SbDUibVwrTK74U/ZSbkma
 sdFFc+m95fHtSjSv4G3CLLmGsS67xr9JKRRwEsvSD2ZwgUB5Elf7cVc9zCZQvTUF33hWzcm3jut
 99ovP9GXKG20bNhtnYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150054

On 10/15/26 2:47 PM, Gopikrishna Garmidi wrote:
> Hi Konrad,
> 
> On 10/13/2026 2:09 PM, Konrad Dybcio wrote:
>> On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
>>>
>>>
>>> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>>>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>>>
>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>> ---

[...]


> Thanks for checking. The only matches I see are in the MPTF thermal
> package, which ships"883ROT13Inch.bin" and "883ROT15Inch.bin". Nothing
> else mentions ROT.
> 
> I also checked all the ACPI tables but didn't find a codename there.
> The tables are here:
> 
>   https://github.com/aarch64-laptops/build/pull/176
> 
> Following the Lenovo gen8 naming, would something like
> "microsoft,surface-laptop-gen8-13p8in"
> (mahua-microsoft-surface-laptop-gen8-13p8in.dts) work? I'm open to
> whatever you and Krzysztof prefer.

FWIW the "gen" naming comes directly from Lenovo's product name,
i.e. if you go on lenovo.com it says "ThinkPad T14s Gen 7".

Konrad
