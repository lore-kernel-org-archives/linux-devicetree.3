Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333573EB0E6
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750411; cv=none; b=USC083zRoQki4A0RS43HebwEs8ZcIfFHqMiDwP/cGCU9fIm28CwCXtgNdlmg6LSCfcCUvVZWEHx93peAU6VthMXiQPJUI79xH8wlK9kizmgREe1ts3bdDmh6jjld5SCLZDLs0LhBtbaIJTGwCBC9/nsFQ8gazIcimY/otEx2Xhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750411; c=relaxed/simple;
	bh=Is6pvF121XtSUY07IGzQAq0wL92JRGVCiWRMROTaG/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=co/uoU07gdv7oBEJ+SqOXYSbiqnbaPjDFc2c8s3BE6RTFh0+op87GyokGkzHetH//CjN/1c+XcW2UfX2rIVl7pkwBB2hx4aMBRyXooQdcs2n8lVGuSC8+XI014RmFiSjPQTlqaX7dVwQuL9vws5HtBlAKQ7rQJCDXC13AkDX/ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMs+jxax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grDTQDMG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMs+jxax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grDTQDMG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCC3pq768394
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ELhK3Fdw98kZw2wfGL+DHumauqq7uUpJz9jAzGKztAE=; b=aMs+jxaxOaA28pFt
	LCipY1WVLPXxjplFYjxAFfm7P1lxB3TpXMgZo8csCEO9aHmo1xer9vpGl1V0nr9o
	ugtrkRPE//+mic8wgmvHgwK1+b+m4vyhHmCI5DUuYuPDOSrC4icmcwXmf93OF6bN
	rFwHKSqm4gPuuJ+OcQ+Rlb86yjlPhYhULAgNEPUOjT7uLNmoZmCTWoE7GC37vlK4
	21jLiKj57YCy5S0pbmfPPxLYIXHsoeQL+ssEBWbxvPMTA3hC7IwKaNl5DUK6tD9O
	inL95T5xej9Db8zz2Tij43UPd17kmWZO8jRLd+16xmBOfg4heCxv1PmvZVWsyy6R
	A7dprQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n0ppm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:20:06 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c3cd150bc9so28715e0c.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787750406; x=1788355206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ELhK3Fdw98kZw2wfGL+DHumauqq7uUpJz9jAzGKztAE=;
        b=grDTQDMGA19KZoHjqR3pQwK1lhKQxg2B445J4MQj/b8z+/wAu9BCY8EYByv7dmgbfR
         vXXy8fwjLgrJHVWKXUE80PEDP+iggk9DwQ0eKZdVJ/NfEUHKNJHrWZJnXGSl5sIkDuvo
         jeBJtQQEKLLF3EG43gl/PuFYT+C4q9hI9A/lYtt6VUhOsr5pwKZ7wHXZbEkFHOXG3xTh
         4m8YZPbZiuaGs4dXuN3lBfJvQ+yCYEDpOMQo/pLfOMazJIuSycg18Ejfmi/5EyaQ5dgM
         yQTgU2xdns+xL16NJdaBGEOTpQ8FLBjuAJXyoZKVwtMmHBIk9J3FAKx1T9Os4aziQlq9
         eJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750406; x=1788355206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELhK3Fdw98kZw2wfGL+DHumauqq7uUpJz9jAzGKztAE=;
        b=cw7yE61/9nloojTuNHrwy+xE1v7Xzm/k87YLbVhZIgqg6zYfOMGVwQ//5r6ah2tsGd
         MUeGAYENd6yJZLj3paYKEccipfpFOyxH0s7hkL1Ky3K/A4oSgtRWhv5M0fI467zm3g6M
         WlTrHrrMAiZQQMw6cbqV1mVCAToVzB1McMbwXPOcZDVPXvO70g28lJEm3vDqn21Ux1f3
         tGAAGhoxIhTGyFHj6qzxYpn7Pb1pJI5c4b09yYLS2V2Z8FVS9tZhWQGhJsxQxmG6Khzj
         VPHs0ovGChxS4JLp6tqbcwyLdAT51lXTicSA8bbFsmRAwjn05xuZC2tTz3DO9mFo8BXm
         +nGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2zTMDc5aJsaNWQH15nk3DKf9rVR5V+S8gBAeniITd0w/LcFjiJLcCB/VXolOkFgFODZIGm4p77ZJo@vger.kernel.org
X-Gm-Message-State: AFuF++nnl+vB5ZXXihM7dcI/mO9ZtJD99/UEE5giNt6R35L8VzEPAgbV
	MySDI8O5281TqqaEOOONgZRRThGzVvCgqqDFm640p/MsZYJreE+rqujYdZq1CJUjOeldLSgFynm
	D6OJ/zkyq5dGVjoT4f/K3kvJoonoO3FfIYKV3YMhI/o7Q1iivGj650RUUfh4Z0XpW
X-Gm-Gg: AR+sD10ngTEmxZDf89D6cwPpnE+pRhtZapnEaMXpXkuUslZ+Z+4xXeP0MoyAsBB5mvm
	YHpa/jEzwLln/NWzPwv7vfe+MxBCY+TFMaQfpETZYk6mqKNIdylWEKT5iffuMX7UVcc8PLtAvsv
	3dDRpd1VFDDaam8IW7Uz87IdK4d05p//f5LrFvTtEFb/EsMUXa/Cdf4OZPGrwTRAl36X88xHtVA
	NEaHAwO83q4SkTOsNkXu6ACdNVIXrD4DhhnTdOX5G+qVbrsA5HEwcQ27MAvCiuBXQBlQUhCd97j
	fNSFVQfTzL0WxX6655/JLbr0heujawXQ6XWrNeRuIixRZmEULD+R1aaoxAfB6WvG+WWkV9DKr0M
	QsgYt5ElHDziWGd+OZebY0GWG
X-Received: by 2002:a05:6102:1490:b0:783:a923:efac with SMTP id ada2fe7eead31-783f9034d7fmr55353137.0.1787750405607;
        Wed, 26 Aug 2026 06:20:05 -0700 (PDT)
X-Received: by 2002:a05:6102:1490:b0:783:a923:efac with SMTP id ada2fe7eead31-783f9034d7fmr55324137.0.1787750404893;
        Wed, 26 Aug 2026 06:20:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c251b7a9936sm337362766b.49.2026.08.26.06.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:20:03 -0700 (PDT)
Message-ID: <f36b9019-91c8-43bb-bfcc-5da06d2d122e@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:19:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
 <5341e732-0deb-4d00-9a7c-595e317bf1e8@oss.qualcomm.com>
 <db2a18aa-f5fb-4ee8-8747-05fcf740749f@oss.qualcomm.com>
 <f344a913-cc95-4fef-880b-f1fee200c108@oss.qualcomm.com>
 <b6d6b627-a38b-427a-9e62-ee883505b2ad@oss.qualcomm.com>
 <15826e27-514c-4aaf-b56e-b40ed0bd600b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <15826e27-514c-4aaf-b56e-b40ed0bd600b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lMZoFHAhpSOpLehFfSMVtjshQP1_G3Fh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMCBTYWx0ZWRfX3h0UgKAFTwxh
 q8qUXNaLYX/AyDJ4yNKaiKnYiWjokhSz/mERIl3Wu1hkUJGx08ytJX5RwofaU02sAkB8YzUJgQe
 E5hMY5Uk8/3/Tb7NMLg/42M2FCnucGE=
X-Proofpoint-GUID: lMZoFHAhpSOpLehFfSMVtjshQP1_G3Fh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMCBTYWx0ZWRfX2RP7UkJV+HRY
 dtj1gsyjdwt8N3mBJqUhoiHHNdKapLZuusuNlGiYlTGcQV6miVw65uxuG5+e8vlombIGV/vT86o
 XboAgT6FZEtBV9PfGYwjrbZhQTaq5BZE0mHekHc/kiPa4S+ByrwNQ+0zK4Lic/vASSNh7Kqx30u
 XrPUh7/4IR0uifWkhwnBdpsLrGL7YNP2anaxASR0DSGbEAAow59hjvTBpNkDIOmlgvbcpxROnhg
 cnL3A0rs5vCD6HFKVJbro37fD+TKX+wISb7kbWIB/P/iZq33cNXfmkmjWNl3Q/YLZPpyJWJSK3Y
 Si3vPBe6TOCnoDiIw5moe1f40PsFzTQK0hBVpgSwPCGqa+1peYWKEzf5/dcZHu13Jm/bP+KaBtW
 OmStW2VcPs0sCTZzUjgBXFEqH5hM6h6rm0ZbqYQK6K3PVL/B5M1d6O8AAuWR+C0Z5hMbOGdSYIv
 jvAH0PXx7MPstZX1Y5g==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8ee806 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=TDtJeqXoE0GuUOfqXLQA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260110

On 8/26/26 4:53 AM, Yongxing Mou wrote:
> 
> 
> On 8/25/2026 4:30 PM, Konrad Dybcio wrote:
>> On 8/25/26 8:28 AM, Yongxing Mou wrote:
>>>
>>>
>>> On 8/17/2026 10:14 PM, Konrad Dybcio wrote:
>>>> On 8/17/26 4:13 PM, Konrad Dybcio wrote:
>>>>> On 8/13/26 9:44 AM, Yongxing Mou wrote:
>>>>>>
>>>>>>
>>>>>> On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
>>>>>>> On 7/20/26 10:43 AM, Yongxing Mou wrote:
>>>>>>>> Kaanapali (SM8750) and Glymur use two display power domains.
>>>>>>>> CORE_GDSC powers the main display hardware while INT2_GDSC
>>>>>>>> powers a subset of SSPP blocks.
>>>>>>>
>>>>>>> Can they operate independently? Does INT2_GDSC need to be
>>>>>>> powered on after CORE_GDSC?
>>>>>>>
>>>>>> On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should generally track the same state, except that INT2_GDSC may be powered down when SSPP1 (VIG2/VIG3/DMA5) is unused.
>>>>>
>>>>> Is the MDSS any useful if *only* INT2_GDSC is enabled? Can the INT2_GDSC
>>>>> be enabled itself if CORE_GDSC is off?
>>>>
>>>> (I didn't quite know how to parse the list of states you provided in your
>>>> reply so I asked again)
>>>>
>>>> Konrad
>>> Hi, Konard. Would you recommend adding the parent clock in the clock driver, or handling 2 GDSC in the display driver? I'm preparing the next revision and would appreciate your feedback.
>>
>> Does disabling INT2 provide us with any power benefits and will the
> So far, I haven't found any documentation that explicitly describes a power-saving use case achieved by disabling the INT2 GDSC. The material I found instead describes it in the context of display tiering:
> "Goal for partial display is to tier down from premium tier to match low tier pipe configurations."
>> display driver do the accounting for what resources need the INT2
>> GDSC specifically?
> Not at the moment. Our current requirement is simply to enable and disable it together with the core GDSC.

So WDYT Dmitry, should we just wire it up as a child of the core gdsc on
the clk side and pass just one gdsc to mdss?

Konrad
