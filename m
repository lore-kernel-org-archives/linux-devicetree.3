Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233187;
	b=VCbPeJFoMse25L3zUllaL7IRVl7mLB91UVzhb3aiL+R0Z6KuQC/kvedoA3vdE/wRb8+4
	 oYZWa9bIwIQpmzfCjhG3gEsicUUJ/Ie1Djh3RfDJ/7nWdWtTmieQpxjUkdyrWO/rBwpJv
	 8Qav5Kac4esWadtaYKV2Zq+WlcPCjSgJRXU7TY8YmV14RqWcAEgExzjDKEpni/PJq39qZ
	 gjL376w8aAIy4SUbf0XQdX3m6aJNeTqiKCCsscAhQIDw9JOuDkNgXf+Ofg2wxRTvn2oDS
	 CUQUAP1BYf8P+Hf3f/7mqDLYkKj6FcDXnssYkO/8I7ME8s57HP209NeiFrjnp+PJMog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=;
	b=nnfgbLYJTlhUWnpydLPPk8doH1slUAR8jrLW7CUCMVK6Elw0IVeConWxGMkVWQb9uUEk
	 q0DhXykIw6mAvvi28/84jNsS2O51g2xrz8Sb5Z4Iij8gVOzDW7iRFcafK3PDmOgHOLACz
	 a9zbnz4RRLEgFuT0l6n1OwFgH9dEELb/nkhR9QXalJd8TsmojtGCLN3z06PHnsktMwRc4
	 /brimdNv8P/A1wk4plpzGutds7tikDXvjdYz0xCOKdzW5Pk6vimUEGFcFk4eBB3z1VIes
	 7Pr8g6MK8C3wnR47FKsOY+uErh/ZmDopPpbZevL4RtvaqgRgdIPwjNqSvJ+d/qe3t7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk+5LGwY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPdOO1fQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4B5606A323
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 14:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F4B5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk+5LGwY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPdOO1fQ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFWQK985781
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 14:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=; b=pk+5LGwYMAfOSXFA
	lecrTQTHD6VN3Lmy8W3ERVHogoxBAZJ1A1qTiGq8rGTwbGZHTJOM4gK/hVZMng2d
	/hLXksJJ2FQIwT50rDlyW9JkjHHr4FSthKCkNi0D1VwcshthvB4zcuwz2Fhz/gx+
	e6ca0MF62VNUL2A2gQhezg4RDfbM4YB5VkkEep9oALmlUBbKHlXGSf5oyOAfa3xb
	wPeMyTqKsdm7KX/AjraZ5/LRui/0jHWtnn2CPteSmveQe0+AtdnsrQgWJ8JUeYo2
	55ITnY5cWnOe0EOQVCvtYsTzOkQYIcokK+cIOs/3lo/bI9Gn1OOzFaAWIJRmXESw
	kZHkVw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxepkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 14:06:25 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2c5352d1eso27221137.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794233185; x=1794837985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=;
        b=JPdOO1fQ255VZVDrnKHesNUXl0eflubl9d0pDkGDLqlddilLDRxFRU9aq7FH6kR8rF
         H9DepIE0Kpo2s/8rbWea4e8F28QsdV+lfXm9HeYiVE2d88lNZi29JUBEcGraWhoRYr9A
         zEA3SeSZfhQzbDt5eC/UxKoXNSATL3bUKVLHIwZaG6gLY4YLnxRsY5k+ANLksymrWEoy
         qXEhmog2nmrhoOHknplkVQ2NVVn/2llyFTU/3C/9yaKmrf3+/WIoJ0qAuLHR2lz7ws/Z
         cQREcUZr6mE5F0UOd7YFdd7c6aggvzpmM8UkuDCQEeCF5Z+GMS8PPHA/ca+v7DxzcTyD
         2zXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233185; x=1794837985;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=;
        b=O9a5GBujs1WIz70DLUJcX7jUTxBedm0kxikB1Olq9/3DE5zT0TdxGzKcnyykfqI4Je
         x+3RSCyVnDHVNRay1a91g1SQdFcOFb7gb4rDoA2jFsqrf5dCIdy9Wt+rIEJy5efxGW2c
         XKABUzywQFGd4eZBnJta/UHeAj103qgYk26A4Zw97yjl14Eo4TKftlKMGj+QAsvlF+Bj
         fl57Vzc0G0WfoilVIMR/meHtYA2iQyFf16XJ7qa/0yiXopCM7dfsBtgKYe5PdnDGvkw+
         zE6MHBFa8hhiNBuJVgLiIP8XeXBQqYRf5Kb2XaCxQwCGPmpI7NYITh4i+oI6HBznNR/3
         LgOQ==
X-Forwarded-Encrypted: i=1; AL+hErE5ETNz0yFcP7og+R77QmyneMFSlKLJPKc0SuOiLRFNCC1OZfcvq0qJrjVKnBCBe0flZrdgDnsJPFr9@vger.kernel.org
X-Gm-Message-State: APuU4Z99D5RnOty74PAm/H0aLfA0l5sM1sx75L3ti4UNJcijW8ixu78K
	nVJYvL6d7vLhs6oHXIAULfe6XC4Dll0STw9UzwwGdZZgcXJ6TIZyNvqFAdptFsBlGAbMvhr/hZS
	mgbOND9zdTSzmdq0BbzbUyECCyAlRogJGpkk3Bh7nhb5HjD4CIb/PUsH+H0RQ/px6
X-Gm-Gg: AYBFou1xwao0EX5LFE5tlzTp+HeVfpCKBLBeP34Nr5RWzHpGJX1/TaeMmKbQ75xyokw
	RnGlC5XMMrocGad+rTvaDqSTNQX95r6a53Kjdrsyz3OfkzxXG3ur5VbEy/8+RRnAP0+SEUkEa12
	PpMuqJWQUXbXT44qxbXFbV/ZIvpCOSSuh0wh4b9SNecKN6EhN6Qwn2i+xFFx537yj376OlS2+MH
	eEZ9a+Bh0juFO6v0MA8JgeE1Oi/p4OlkI4qlIVFfynX6EEUinXcitc5CHVnFfaZXxrssHOfVgNX
	cj6WVr50YKlRiqLPMPdUgLaaeTGFFkrpuZdlqO/SHIQAg6CjMRQQTRGOkX1mGI9CyUJhAmj8Wr1
	YR0wkblKs0yyyEgrcgoznRt0HtPkq/qZbfFC5lAEG4kgzQMZHduchZk/qKOUc5M8wnIWc0w==
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr947713137.3.1794233184591;
        Mon, 09 Nov 2026 06:06:24 -0800 (PST)
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr947543137.3.1794233183505;
        Mon, 09 Nov 2026 06:06:23 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721c8a9cbsm1525983a12.0.2026.11.09.06.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:06:22 -0800 (PST)
Message-ID: <825fbfbe-a9a0-43e2-bb54-f9e38ce779f4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:06:18 +0100
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
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
To: Jerome Brunet <jbrunet@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
 <179275170360.4070168.11650113664838519061.b4-review@b4>
 <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iWOpUig1UPGJcasEqbqG-Gh0xSyGZGvG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX4aROGOrpDxbc
 rimOgCgFxYa7JN/SN59JQDnKyXX1urADi47zp3Xb41jov63GaNczBG2c/sndainPJim/qEMzhZG
 wumrWlaZOauN6+JwR+9CDCnYhgUPWT3bpciwBXpco7y8at0Z1AlRFiH/1IRInw9adG1nO+Sw+D2
 SFNzb9DGrM3dcdiBvCAdbBsd/W/EwZj4/mdzTm3iEDPtr5r7RL/8AwEAutlEPpCYt1wV+pvM9OZ
 l8CV5srb/oiSMEZC9Q0oABg30YH1I+RLFbwMuXQRgyXoq9CGDkmQLF4P4sioxFz8bLSMwU/lTEP
 RDraqTVUVKmX6b7eaqLCsMcX8YB3NHcF+IqOIS51w6Fsjbx2saxSTnEJGQtab+JQ+mWx8NBLFYu
 e56G/+IiZhINY/sWNwJNw9xt989KMbu0CO23tpefpV0Zegx2Rgh235KxnCjPmJZXHynviXrSLW+
 JOhUvinO+kpIANmYv2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX8qkM943Ee6Kg
 gnU7t66wFgzkR3iqNpmELb76HYD6gNT4drxuq/tr5ihJJ828EVNTxNOR/N82lwucTt5P80RE2Pm
 /k6KglDg2pWIlsU49A0aHd+6k0Pwy8o=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af1d361 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tDZyZ9LLp4Dxownb6IEA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: iWOpUig1UPGJcasEqbqG-Gh0xSyGZGvG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090056

On 10/26/26 2:11 PM, Konrad Dybcio wrote:
> On 10/23/26 12:35 PM, Jerome Brunet wrote:
>>> Preparing a clock protects its current requirements, not the resources
>>> needed while changing its rate or parent. A transition can temporarily
>>> use both parents or access an unprepared clock, and a parent rate change
>>> can cause other clocks to be programmed too. Raising resources one clock
>>> at a time leaves those operations exposed to insufficient power.
>>>
>>> Failures make this worse: hardware may already have changed when the
>>> operation returns an error. A matching cached rate is then not proof
>>> that resource reconciliation finished. Retaining a temporary enable
>>> reference without a corresponding prepare reference also breaks a
>>> consumer's normal disable/unprepare sequence after a failed reparent.
>>>
>>> Make CCF acquire the affected tree's and parent paths' resources before
>>> notifiers or programming, and reconcile them only when the walk stops.
>>> Keep fault recovery independent of rate shortcuts and subsequent
>>> consumer reference-count changes. Require explicit recovery of an
>>> ancestor's uncertain parent selection rather than reporting success
>>> from a descendant request.
>>
>> I don't think all this is necessary to address the problem described
>> here and in the cover letter.
>>
>> IMO a new provider API is the wrong layer. The framework already has
>> the hook a provider needs: the rate change notifiers. What the core
>> should do instead is fix those notifiers, which do have a few issues.
>> You are fixing one in patch 1. Another fix, about setting the parent,
>> was sent recently:
>>
>> https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/
>>
>> You want to act on some changes before anything is programmed. PRE
>> notifiers are the right tool for this. The user of this change in
>> patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
>> it, ABORT drops it.
>>
>> Also, what is acquired here follows the requested clock. When an
>> ancestor switches parent, the chain of its new parent is not acquired,
>> although it feeds the whole subtree after the switch.
>>
>> With notifiers, the parent fault state is not needed either. As it is,
>> it blocks every request on or below the clock until the same switch is
>> retried.
>>
>> Could you tell me what you need from this approach that cannot be done
>> with (fixed) notifiers?
> 
> I'm a little worried about the ordering there, since some device
> drivers may also be registering listeners in parallel, so we don't
> get a clean split of what PRE means ("has power for sure " or "may
> not have power")

Do you have any thoughts on this? I'd like to proceed with this
series in one way or another.

Konrad
