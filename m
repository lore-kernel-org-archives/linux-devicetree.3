Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A1C41B365
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784895436; cv=none; b=iufND3SnC7xVbuG2ZIU2t5Z4K/70aqoEQDrfzWrz0tWGjTYLNY2osTY65JF78PpQdeZccp9sohY128NkbncmJMRH55TS/d+ob0DS4paRvU5AVLnBeefxqOZ/C9QN5W34MKf/PlhfH/roIrRRB7gV8QqbFwdCzdisgYK8tVhMw8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784895436; c=relaxed/simple;
	bh=WPwiJqExHTdjO20g/ADWAvcKz5CjWKZD4kv8WtBFk5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tsnbiP9/TNSDuidutcOsxwEEahWpSVMohmgpCunCiLwbKMT9c86XRXXU5HaP19haC3mPpL+nMpvxKCknLVdD3ruFtvYLLHjpMshztGgOPeUeXGiZSGJ7rRZH6Qkvj9tSTvG5qqBNTE3ldn6F9BPV87flcKOmP+sI9MRECEUJzko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ks/s2ZbZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gYTRnpXl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ks/s2ZbZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gYTRnpXl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADktB2876188
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FSWXtcS83AIi2knBSqKxmPr/gYdQSfFpx+mSI6DOVs0=; b=ks/s2ZbZ0EeYySQN
	f84U+i1uzY+Sd84l9DmuTV7x4qDh9cPo4f3p9VGvBPaY3K9Zr76zRtXlAaGiE8kd
	LamjMpiup98NaM6l+bL9souA2ShvjGhVMbHZpnX33EZ6OC96q6XRSgunIbqUcQ5E
	aTVA1v8W71GrEzAbiRPR7uGcv0SdEUddX0j8zsFLHVFhc8HeoKv6wikTx7/XASow
	j3D4ZrHsmNgAGPm/D+TeOjYo4Wbt7xXKVx7Dre35E2ga2eM3c4aPQf4wX09vlV1u
	rKWhMk+IMoulx353T0w4fvEm/6KCd8tMo3RM+lS5VLq/+bQ4Vt9K54bozzhNrRqP
	P2t/Fg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5byrn0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:17:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so5044001cf.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 05:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784895429; x=1785500229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FSWXtcS83AIi2knBSqKxmPr/gYdQSfFpx+mSI6DOVs0=;
        b=gYTRnpXlSVyUH3nvB1fhPE8z63qOsnbNgjW5+xZu0JQCXyU8fXRFS6EAckIwFKsFbM
         kSXyw2/cgvhrKgPmX2nJS6QmbWA87SSGkoC6WqH72oj3DQt6tmU+R6k998jbUnpl5B4C
         uiGk7uWx8GjGh949ImPSN3BfnVKNQvYQfad6NUuAjhUfUrHavifsJb50mi9kxq5ORMIk
         9nNUCUKDy/YBNLPnPGFNwpio3DgTnor3uG/5mTb2m9Sz7BwMHcZ+hYKR58bWNB7qriiw
         L9qA8g8QFpVx4Gp4CUIqHuku0B1ZHwLh2TvCpm9G5ozUl05KeA+rKgH2qf8ifLjWP/Xl
         O0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784895429; x=1785500229;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSWXtcS83AIi2knBSqKxmPr/gYdQSfFpx+mSI6DOVs0=;
        b=sJ5dcxF+wvXTKMGN7JPqHurtECJjHvfyGRTQNIEY0m/j5jfts45YM0aJdP0xJXzPVw
         ulHXBjR+nE1Gfh4DlFJeDbfgucnr0u3XyVkCiZRSNoA8LiRQ+DhZCfEVeZA05F6wsTgV
         //cv5Flz2T119zB09n6hWvw/YIGSJeB7kK5JDFFLezC5PIcGLNQbSuZR0eK95G1zhgiM
         ROKg95m2GBHGTCq/AZbO8l8vu/1zr2g++5vAU8DZAmuR9m9sWH/WgwJLt5xelUEljOwp
         9njNRG+L8qzwyPF0ZNJykRdVrmKkyh4O8QOkNIkzddZBajufkdZkZnIE349XH3eLGlbR
         3B6A==
X-Forwarded-Encrypted: i=1; AHgh+Rq9XfiUOvwtFSgvcMZZnQfZQdbWSQAg7iQGYktParv5xggGDNqm+SbCunszAjaG62+mAXhWGqgGZScJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwyUQfQaBw33rdM7KYBRPUEuq5SUebmfyL3WwZKdsQKYvcvlb3q
	XVKw5YhssmF3sXgidIZZJou1f4TP3AvHcZHDGJkG4YhpQdEGbVMxlJjjAYa6McDhXoWF+bIzKzs
	5yebjmzDzpiZg9jbQzeJpc6QOGlkkS5eVWlEPBAs4aHrtBjl7C5B11ZxQk3MLfFTt
X-Gm-Gg: AR+sD12oGC/5MfHgkTZRI9o+l/KETxc1si1g/xCfmbCrIoUQZKYiT7ZDX7r9E2pB3+x
	kQB3krKsKL1XJQ2AiQidINpkRRGQsbS7kXg/ohLdxvrVnHVUizwCjVnNQJXP3OUbr5hyh9/v8cc
	bGHIWW1W2X0X/zCU3ZIJ3HlGxprrOPme+oMV7zLfLST1Pv7GxI2UiGASeORAdLxo0tr2O7ROTzb
	qF+lKlgJTKFrHfMd7zVefiOB4S2R7KsL/hfDtfDd11C2vI4a/J7u5puB57PbFBjDA+H2T1psvJ9
	o+wkJSGvfUg7iWYWuZ/sWbkciu617QsJypNYqIQ9W300g/1mnU/H/Ut2WXu0GLbA/Xwaq61Y1ch
	YIO9U3PEoEWOzMnk9TQ3DIBDeFds=
X-Received: by 2002:ac8:5a4b:0:b0:527:69dd:5413 with SMTP id d75a77b69052e-5283dda9badmr68654421cf.5.1784895429180;
        Fri, 24 Jul 2026 05:17:09 -0700 (PDT)
X-Received: by 2002:ac8:5a4b:0:b0:527:69dd:5413 with SMTP id d75a77b69052e-5283dda9badmr68653941cf.5.1784895428673;
        Fri, 24 Jul 2026 05:17:08 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85b9a60asm24387356f8f.3.2026.07.24.05.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 05:17:07 -0700 (PDT)
Message-ID: <06aef9a5-7e8e-4262-9b41-a9c43f588da9@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:17:06 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/8] ASoC: SDCA: enable on DT platforms and add
 Qualcomm WCD9378 (Tambora) codec
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260723194045.49021-1-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260723194045.49021-1-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: p7VFgKLEAahYCM7dVQoJhaVUu0Otmtll
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExMSBTYWx0ZWRfX3lM/cwncTVb8
 dEYE6XjHVfAwirYe5fgmxQ/qcKiqMQ9e+V86TEwnbMDO48WX2ebUUV9JIX4NbRqQjQumDZ21a08
 9tva7/Iudew0flzNRa+gKC8Yap9mvLs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExMSBTYWx0ZWRfX0AF3UFN/izUE
 JAgTVMFmzkz4DaQsfHfAEXXqFFe0Wgf+hXFES1apDVKapQuKv1+KOVEvcLYG1UOC1M9ODqAkG8p
 eCiSRDAJehsPkZLY5lnla87G/Nw1PrkLov8wrFQTFwteEAxq1fR18h9Wev1NbkRK1Fe5lb8PSZC
 kBeDl+w5IsmuyKBRMlsmXZKUtsA4Fx9n44uEQORNgtObHZ5I82IkyAms7L+cQXE92sxuN7HPX3i
 KXIWBKS3b4solcJsmq8GtiO72MxNZ+kmS0K6B1CPwmwn2iDgZUK0B6tUZUR65LlkWqjEE+Q+irT
 KcylHGmda4mYyAGlMcNUI4HEfEMoOC8c+rRSEoP2HbiU5C+EMRaZYdYZXxCAmzSou0LGS90IIXF
 7miGon99T3WxmnGFKiMGoRv2ojjks2GzyNDblglrv+hN8qq9nJHyZ2AE+ehC0BJJeIlK18uJSnd
 zRAYAw6UbW3ENWK2ioQ==
X-Proofpoint-GUID: p7VFgKLEAahYCM7dVQoJhaVUu0Otmtll
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a6357c6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=GYSh3LzNAAAA:8 a=2FLSfOfDB4kTeDBI9AoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240111

On 7/23/26 8:40 PM, Jorijn van der Graaf wrote:
> Hi Srini,
> 
> On Thu, 23 Jul 2026 00:42:10 +0100, Srinivas Kandagatla wrote:
>> The most obvious follow-up is figuring out how the mobile-mode and
>> compute-mode WCD9378 drivers coexist under one compatible.  Jorijn's
> [...]
>> tree without racing to bind the same slave.  I would like to line this
>> uip with Jorijn as a follow-up to this series.
> 
> Happy to line this up. To ground the discussion I ported the series
> onto my FP6 tree and have mobile-mode capture working end-to-end
> through the class framework, including PipeWire in Plasma — findings
> and a proposal below.
Thanks Jorijn for trying out and confirming that capture works.

> 
> 1) Arbitration, near term
> 
> Your probe already returns -ENODEV when qcom,compute-mode is absent;
> v2 of my mobile series will add the mirror check, so neither driver
> can bind the other's slaves regardless of probe order. If a single
> owner of the modalias is preferred instead, a small wcd9378-common
> stub dispatching on the property also works for me — your call.
> Either path can later sanity-check the fused mode the way the
> downstream driver does (EFUSE_REG_29 PLATFORM_BLOWN, else
> PLATFORM_CTL MODE) once register access is up.

We need single entry point, if not we will endup with two modalias. Yes
current RFC driver was only tested for compute.
I agree we should have a common so that we can leverage some code from
both modes.

> 
> One mobile-specific data point for the split: in mobile mode the SDCA
> control space is only decoded on the TX slave. On the FP6, a paged
> read of DEV_MANU_ID/DEV_PART_ID (0x40100060/0x40100068) via the TX
> slave returns 0x0217/0x0110, while the same reads via the RX slave
That is expected on WCD codecs. only TX has CSR registers space.
RX can not read/write any of the codec register space.
However the soundwire SCP address space is accessible and expected to
set data ports for both tx and rx.

> return zeros — with the RX slave's standard SCP DevID registers
> reading fine. That matches the downstream driver, which creates its
> only regmap on the TX device and drives the render dataports through
> the RX slave. So for mobile RX playback the function control and its
> dataports live on *different* slaves; a per-dataport slave mapping
> (or similar) would be needed in the class framework for that. Capture
> doesn't have this problem — the TX dataports sit on the control
> slave, so no cross-slave mapping is needed there.
> 
> 2) Bindings — one file
> 
> Patch 7 adds the same new file as my series
> (Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml), so
> one of us should carry a merged version and the other drop it.
> Suggestion: the mobile side keeps my v1's tx/rx split shape, with
> the v2 changes already committed on my binding thread
> (qcom,{tx,rx}-port-mapping staying optional, matching
> qcom,wcd938x-sdw.yaml; qcom,{tx,rx}-channel-mapping dropped). The
> compute side keeps your qcom,compute-mode if/then, extended to also
> cover qcom,port-mapping and #sound-dai-cells. As posted, patch 7's mobile shape wouldn't
> validate my mobile DTS: it defines a combined qcom,port-mapping but
> the description references qcom,tx/rx-port-mapping, and
> #sound-dai-cells is required unconditionally while the mobile DAIs
> live on the top-level codec node. I'm happy to carry the merged file
> in my v2 so your v2 can drop patch 7 — or the reverse, whichever you
> prefer.
Thanks that would be nice, Also am thinking that we should just have
qcom,port-mapping for both modes and mark one of the device as
qcom,control-device which is tx in mobile case. That way we have some
level of clean bindings that overlap. But I will leave it up to you.


> 
> 3) Prototype findings on patches 1-6 (mobile capture, FP6)
> 
> What I ran: your 8 patches on my 7.1.2-based tree, plus a new
> wcd9378-sdca-mobile codec registering its own sdw_driver for the TX
> slave, static sdca_function_data for the SmartMic0 function
> (IT11 -> OT10 on DP1, with PDE11 as the power domain), and hw_ops
> doing the vendor bring-up
> (micbias routing, bus-clock indication, a clock-stop hold; supplies
> stay on the mobile top-level codec node, so hw_init has nothing to
> do — that part of the design accommodates the mobile supply model
> as-is). Capture works: the card binds, PDE11 reaches PS0 through the
> DAPM supply widget, and a 1 kHz tone played from the speakers
> captures at ~46% of full scale through the SDCA path. The bus-clock
> indication in hw_ops is partly a stopgap: the core path discussed
> with Pierre-Louis on my driver thread needs the qcom controller to
> set prop.mclk_freq, and that patch is still on my list. The
> prototype branch (your series + the mobile codec on a 7.1.2 base) is
> at https://forgejo.catcrafts.net/Catcrafts/milos-linux, branch
> sdca-mobile, if useful.
Yes, This is definitely an useful experiment, I was trying something
similar with both tx and rx side on mobile mode, things got really
complex because the sdw stream has to be handled by rx codec where as tx
side will be handled by sdca side.. it was really messy.

> 
> Findings:
> 
> a) PDM dataports. class_function_sdw_add_peripheral() derives the
>    SoundWire stream/port config from the host-visible PCM params via
>    snd_sdw_params_to_config(), but the WCD9378 mic dataports carry
>    1-bit PDM on a single channel (the working mobile driver programs
>    sconfig.bps = 1 and port ch_mask = BIT(0)). Result with the
>    generic path: "bps not matching" from the qcom master and silence
>    on the capture while the PDE sits happily in PS0. I prototyped
>    optional per-dataport overrides in sdca_entity_iot
>    (sdw_bps/sdw_ch_mask) consumed in add_peripheral, which fixed it;
>    maybe DisCo has a proper home for this, but something is needed
>    for PDM parts.
> 
> b) The IT33 micbias cache-vs-hardware workaround in your patch 8
>    (drop cache + rewrite from pde_pre_pmu) ported directly to the
>    mobile part's IT11; I carried it prophylactically and haven't yet
>    isolated whether mobile strictly needs it. If it does turn out to
>    be family behavior, it might argue for the class handling
>    has_default controls on PDE power-up generically.
> 
> Userspace needed no changes beyond UCM: the class-driver card works
> with a ControlExists conditional in the same profile (the stock
> branch of the conditional is the unchanged stock sequence).
> 
> On interrupts: sdca_irq_allocate() got a valid IRQ out of the box on
> my board via the bus irq domain; I haven't exercised actual SDCA
> interrupt delivery (capture doesn't need it), so I can't yet say
> whether the INTSTAT dispatch issue in your patch-8 comment reproduces
> here.
> 
> Longer term: until the framework covers mobile end-to-end (the PDM
> transport and the cross-slave RX question), my posted mobile series
> stays the working mobile path — the v2 above is about the two
> drivers coexisting cleanly in the meantime. Mobile capture converging
> on the class framework looks realistic (my static tables came
> straight from the posted mobile driver); I'll keep using the FP6 as
> the mobile-mode test vehicle for the next revisions.
> 

I think you should continue to do the mobile mode driver as it was done
in v1 not think about sdca. Function setup on mobile mode are dynamic
user can set sys_usage based on usecase so the sdca functions will
change, this is not static anymore so its not really worth thinking of
sdca for mobile atm, but we could try to see if we can get some leverage
from sdca helpers.

Sorry for the noise i hope it was a worth experiment on mobile mode.

> One dependency note for your platform posting: SDCA register access
> on Qualcomm controllers needs the SCP address paging support now in
> soundwire next, commit 999f80904763 ("soundwire: qcom: add SCP
> address paging support").
> 
> One small nit: link [2] in the cover credits "Jorijn Rikhof" — the
> surname is van der Graaf.

Am really Sorry not sure how I missed that.


--srini
> 
> Thanks,
> Jorijn

