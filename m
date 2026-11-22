Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795359525;
	b=zVvUm4qEm25RmcFY7NQ119Rm5UnT5jj+vR6qf0Py/Nnu/lwICwzgpgjsyTbaq2XHi8nm
	 TUbFCVIJ51MFTOwoGOexFnptMwRvS8Pq2/8whehblqRJIU8bSRi6yfxvxOUzXw6TOZpQP
	 bRTUkL9j92dtv1h8F9NNtY6QMGXY2Ki7HmxNmBRYYVrHu1A53V9od1MVFWR3Ul8CCzAJf
	 4dKVHqjjU9I8k3z8lOWBrmEygp+kn3imKADYxOc/agjgNLa9GoCzuO237uXQaLiXIKW+W
	 WNn+9SjtcXxudPNbBsj3Z/cHqtANXAYRBVJFOjXgJBk9HQkFQXrtkjah0NSKjeZSwBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=z67TdVpmW7/CTIOiej8+D/av2/y/LIc9vuhXZeHqQIc=;
	b=5tJ2V3qF+cVOuiN7oam/T8TAwsPk1UrdeW84H3L4Dldi0ZqYyPrsxOaXw+ITw0IYyrBx
	 dWJq2waOVyKtiK4I/5SlbxbdWB8EF39fMbd1k+FZqGcD7y4GaU+UN0KnUQXtXjPEreOUE
	 GEz1JKc0CuZRnCnFvm3xMN14FIF1+6f18Tlx5Zd2QW8Dl25J91c3tf/0Fei75GyocLHup
	 idG1MfOkcrzW//v1uHsFfWIu/NfmCCSENQKwQZE/29Cerh9tUsg1m2oDKAvZz8cW0vJMH
	 qU4l8sNs827j36sydxe+s7OKkjW7y+FAsZda1/L0Yrl/XNDxccCj60lCe/9wRDedyqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OCC0cbh2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ipc4n3lB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38753606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 14:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38753606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OCC0cbh2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ipc4n3lB
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMBjlZO2432628
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 14:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z67TdVpmW7/CTIOiej8+D/av2/y/LIc9vuhXZeHqQIc=; b=OCC0cbh2PFrrLGuy
	DbRcfwtXWkvAZhnjxfadZVNvLSvjMdOLdecJMmSh5qQMvMPNV77FYN/o59JIbPAx
	yfXji6AUJGYm9qbgWcYDfyWeu9ICNBlA1BXY9LMR3S0MLXLun+swpsCxMh4IrdXi
	yG15H+K6xz4doi6DQeB9u5d6m3vUxmWjKrSCGX2g3jpZ18r8OJwd02beqofaaBIQ
	ZA0YWoK+rm1GwjNMt6s+9Uqcdr3vlk0ebspxAoo2/v+beV1K76bEOE1YfLVVyqFm
	dk01SPAIm8SQ3Gpf4NfZb1LPf0mbvABu49MSEb5uWzQz4LsyCpFl/OjBcjZKu0Cd
	mFlycQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34ka3f24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 14:58:44 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b4e8af48c8so34776927b3.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 06:58:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795359523; cv=none;
        d=google.com; s=arc-20260327;
        b=sUB2+gbapII8DiR8OEyhe2WmfAswvd9ypSy/++l7cFUbsbVODxbZT0vv4YjmxT1Frv
         fJOhSSd3yE3m2yKo5u3g23m1qLGGeLUBRTGIzR9gtWnN08fkSMMsqC6/LKiUkqLHVsbw
         1VCMqp5ahTrHFgg3BOYwabUG3s5MuJ5OyXkEqxTHb6HO0sCHlusiG946ifnuB1WWT+E6
         A+70V3nelnF9qNh+gQQZF2+wF1+aspcaq/E+YA3JnrkSkLFwk6A1NbRqM/HHWKNb1HWU
         HmgzMxdvX40k3KPFLF77onhdFD/oqT0pDmaQd0MMpQ++gmTN7ZkM2mcuApOfC9lM8wza
         wJTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z67TdVpmW7/CTIOiej8+D/av2/y/LIc9vuhXZeHqQIc=;
        fh=DPLUzfxSwaUvpFsIZye/ayzJ7Cyts1kUkF4bzrE+SEs=;
        b=JL1rnD4Gk5Dj3/qw5nxBzbpT8DHjdXoZ836V0BbAMygr4n6xdXL6Th5Uh/AkiaMohZ
         6zJTBPO8KWY/sGW4O0IbsdrCCoynAKaSqATjzkbpgsbtR4kyRZemrKb6wk5q1nmTX/L5
         AYQzxHLAsvP0AaEdJnQSSoR61tXZqjr8nuEYS8AlMNIG0gCQ3ee8GjDDlS1cd1x51Urb
         k5UMAENUQ/oGK/mvjPDNpO6H58I+9p5wJWASO8Pj0hvFVxebqmvcSKra2AuMN284aTv5
         zRMxtj7YXCFjAneqnZeYgPyqFUt0ji9k74sDCcD+HKCJ+BFCOhaMhG4x0JglSiZsccRu
         kzLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795359523; x=1795964323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z67TdVpmW7/CTIOiej8+D/av2/y/LIc9vuhXZeHqQIc=;
        b=ipc4n3lBx3naa/mTtGBO7leLdDqhfKVl6K95/hlc9xZH41F0NzkdxcdM+qfmc6TMRm
         ZIcYK9dh/G1VFUmwR8UIoekW1Qg1J3OhDwinyqkVgT73o6uZWsaizjHKCKQ5arGDJPDt
         RdvlAWMscmOS0EbmHSuu9k+dzbBx1bUKpIJaCgyttnmVMe48iNMpJFi4f5RuXkvvg+6K
         Fa4O6UAL6k+lD0qDZVJoDsZfU3nLeNPXCbn5RNBRDhGacYIR7QONisxV/J2XlEGc9eKA
         16Gfu+aQeN8uIZACFrOYO8lBODA6zmyyTeEHRJxbEKbBcR7RaMh1ij/xZlZqZYK3FrBc
         0vrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359523; x=1795964323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z67TdVpmW7/CTIOiej8+D/av2/y/LIc9vuhXZeHqQIc=;
        b=D7hMDE0fkhJLy3G3Pvnmj1LUhmnLTkm/kArATycoJtX9sQ3vIh7+RP3Elpd8qdAfGG
         qF8Gyr4ZdZBS7T6sAMgbLISUqNJns79X+7jn6kXMfDawUC5mZH1RbIup5PiOGUfqhw9v
         xaDg/0aHTNmuHEDB2EN43xDrSqgBb5q3l4pFVehPTJMW6+HQ9TbaYn+mprQ1NhJjQnnQ
         kPLDKgTZZXt9h3i2oPQjMMem0ttOQe0kN2HuuBznC26XuCqrTzzaukntjqPjTRg6GZoQ
         TFqacYNsRvP3QtSpfjLg751sODZd9jiu6R5UI53pAobhimWlVxvArnwigJBXLepgGjs+
         dqmA==
X-Forwarded-Encrypted: i=1; AL+hErG3Lt4YO1t/Z4An6wKqZBVLB63ldqzRtAEaqgewrHDSMY7ejh5eBdcDa/uq1SArdjuR3mS84tpXL7lS@vger.kernel.org
X-Gm-Message-State: APuU4Z+fHFpIvZfPo86t/0K7cm1wR8BWiTHXISip0V5JqXbpFYSqaOMa
	RylVL8nN36J0By0RRGLdWhf1RLfBkn1dzElNOHj2LHRXtfksb3+cIcqWzGAzXfoVAVPP33UloDT
	hk8bCQycl6U9lYew2tB+u81flXd3qZhago+T5o2APHcFmwMDLp68ekK7Uyoei31L/AgLv5KQjtC
	JWkLw/qV6eOMXPwqki/QTM7X/3IJWFX0yx3jc3KMM=
X-Gm-Gg: AZFdTZfW6Xu+UQQPGT0WMtiG9RzRw15G7kgUG9C15q5wuPkxMka7s6+a2xaKPD7nVc2
	zpGUspvrYu0qn2p2y32UdlZArZrrhgICcsHufEfYFNeU/u47I4fToveUFyds2DqSbpZeub2VRff
	8dkv5+APkKyWw/F91Rs2lIY53AozhpiImxylgTdMSG0mVOeofRuQWLotw=
X-Received: by 2002:a05:690e:d5c:b0:67d:e4c3:d850 with SMTP id 956f58d0204a3-67df447f1afmr3175621d50.80.1795359523282;
        Sun, 22 Nov 2026 06:58:43 -0800 (PST)
X-Received: by 2002:a05:690e:d5c:b0:67d:e4c3:d850 with SMTP id
 956f58d0204a3-67df447f1afmr3175608d50.80.1795359522796; Sun, 22 Nov 2026
 06:58:42 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-imola-sound-link-order-v1-1-71d8bf1129b4@oss.qualcomm.com>
 <655212ed-4812-4747-ba5a-f0093bf05411@oss.qualcomm.com>
In-Reply-To: <655212ed-4812-4747-ba5a-f0093bf05411@oss.qualcomm.com>
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 15:58:31 +0100
X-Gm-Features: Aa3M54rP1VIJz82iUaXQdLmIik0LdXXaBl4XGMZlPQ3KhuZT42ZimIVtTb28lGw
Message-ID: <CAPzfCAbOiCiVnpe-738CUpOmD1LyMej6EUOgH3myc9139vcufw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: arduino-imola: probe the sound
 frontends first
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA1OSBTYWx0ZWRfX3mfQAo654gBu
 seYRHH9FQrAJfJ8UuyZcLj5MdVPoCGQz6mrLQ0DiSQtbjYSZyBzoldE8EU51sgGzoK+3zruMBoS
 eehMsyoWavV5pv+xkN8G/xo+zHnoGsCdL/7WD+Hus61fGJ8ajTw/vh3kgi18Vunp6VLZ2tS5YXX
 +SGHlabJCAd1oy4TEmOylpNLUm20kp8m0llmSj1fV1gWpqnw3E5im1Rc9me/4ZhyibI5wDENzOz
 e0oKdI2A8jtYhlJHQSshVa9Br6qwc+WebPuiJZGsFVg28FOxcw0intLawANP+CPqkZFS+cF85Bj
 gEjTF6i+l1slq2fQ35G3jIxF1zTOo3+wRDAnYTMvE8KjCu1laXs2Z2fuZFu8VyRSRa/QDC7RmTp
 EEWnNrvwW+6C747Aea7dJdvkMeTNCqb/N7PGffMfiXRioWTn9KACeO2PkH37LpJT2eTJyntQ8N5
 EAk+vHOZ24hu7E9wV+Q==
X-Authority-Analysis: v=2.4 cv=RJEmjIi+ c=1 sm=1 tr=0 ts=6b030324 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=gUyalHTIZlskWCMACU4A:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: WQFa6X8ty7DSWCJCC6VTG7V3yN0CN4j3
X-Proofpoint-ORIG-GUID: WQFa6X8ty7DSWCJCC6VTG7V3yN0CN4j3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA1OSBTYWx0ZWRfXxfL3GyBw+BYh
 litR88TQDP+6Oe1W40PWCw6pzOg6JDuyGENJ7KOJncjYdnBNMdU5oz/FKhdyvapBkaUR4Dhp2Gg
 xS0SwCmnaQawmJ89RtuWpFu3rT9ugeE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220059

Hi Srini,

On Mon, Nov 16, 2026 at 3:26=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> On 11/14/26 12:57 PM, Igor Opaniuk wrote:
> > The card probes its components in DAI link order. With the codec DMA
> > backends listed first, q6routing is probed before q6asm-dai, so its
> > routes from the MM_DL and MM_UL widgets (created by q6asm-dai) cannot
> > be added, the component probe fails and the card is not registered:
> >
> >   q6routing ...: ASoC: Failed to add route MM_DL1(*) -> [MultiMedia1] -=
> HDMI Mixer
> >   ...
> >   snd-sm8250 sound: ASoC: failed to instantiate card -19
> >
> > List the MultiMedia frontend links first, as the other qcom sound card
> > device trees (RB5, RB2) do.
> >
> > Tested on the Arduino UNO Q: the card registers and a tone plays on
> > the headphone path (all 11 DAPM widgets powered).
> >
> > Fixes: 61a95870e0f3 ("arm64: dts: qcom: arduino-imola: add support for =
sound")
> > Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
> > ---
> > The UNO Q sound card from 61a95870e0f3 does not register as merged in
> > arm64-for-7.5 (snd-sm8250 "failed to instantiate card -19"); with the
> > MultiMedia links first it does.
> >
> > The DTB differs from the current one only in the order of the dai-link
> > nodes (and the phandle numbering that follows from it); dtbs_check is
> > clean before and after.
> > ---
>
> Thanks Igor for the patch, but this is just start of the problem, Once
> we apply overlays the nodes will be sorted once again and we are going
> to hit the same issue.
>
> can you please try this patch:

I've tested your patch on the Arduino UNO Q with the UNO Media Carrier and
headphones on the jack, and confirm that it works.

Please feel free to reject/drop my patch.

Thanks,
Igor
>
> ------------------------>cut<-----------------------------
> From f9c336d90f1689c02ecd751c40e3f37379b6a690 Mon Sep 17 00:00:00 2001
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Date: Tue, 22 Sep 2026 22:21:22 +0100
> Subject: [PATCH] ASoC: qcom: common: setup fe dais before be dais
>
> qcom_snd_parse_of() registers DAI links in the devicetree order of
> the sound{} child nodes. q6routing wires static routes such as
>
>     "MM_DL1" -> "MultiMedia1" -> "HDMI Mixer"
>
> which need the frontend (MultiMediaN) widgets to exist before the
> backend widgets that reference them. This is a latent ordering
> bug: any devicetree or overlay that lists a backend node before
> its matching frontend trips it with
>
>   q6routing ...routing: ASoC: Failed to add route MM_DL1(*) ->
> [MultiMedia1] -> HDMI Mixer
>   q6routing ...routing: ASoC: Failed to add route MM_DL2(*) ->
> [MultiMedia2] -> HDMI Mixer
>   ...
>
> and today it is easily triggered just by reordering the sound{}
> children, or by an overlay that appends a backend link.
>
> Iterate the children twice, frontends (no codec child) first and
> backends (codec child) after, so frontend PCM DAIs are always
> registered before the backends. Per-node setup is moved into a
> new qcom_snd_setup_dai_link() helper so both passes are identical;
> cards where every child has a codec child (non-DPCM) hit only the
> second pass and see no change.
>
> Fixes: c25e295cd77b ("ASoC: qcom: Add support to parse common audio
> device nodes")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/common.c | 182 ++++++++++++++++++++++++----------------
>  1 file changed, 109 insertions(+), 73 deletions(-)
>
> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index 83b745f617a8..4e0541c3db42 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
> @@ -178,12 +178,104 @@ int qcom_snd_apply_dai_tdm_slots(struct
> snd_soc_pcm_runtime *rtd)
>  }
>  EXPORT_SYMBOL_GPL(qcom_snd_apply_dai_tdm_slots);
>
> +static int qcom_snd_setup_dai_link(struct snd_soc_card *card,
> +                                  struct snd_soc_dai_link *link,
> +                                  struct device_node *np)
> +{
> +       struct device *dev =3D card->dev;
> +       struct snd_soc_dai_link_component *dlc;
> +       struct of_phandle_args args;
> +       int ret;
> +
> +       dlc =3D devm_kcalloc(dev, 2, sizeof(*dlc), GFP_KERNEL);
> +       if (!dlc)
> +               return -ENOMEM;
> +
> +       link->cpus      =3D &dlc[0];
> +       link->platforms =3D &dlc[1];
> +
> +       link->num_cpus          =3D 1;
> +       link->num_platforms     =3D 1;
> +
> +       ret =3D of_property_read_string(np, "link-name", &link->name);
> +       if (ret) {
> +               dev_err(dev, "error getting codec dai_link name\n");
> +               return ret;
> +       }
> +
> +       struct device_node *cpu __free(device_node) =3D
> +               of_get_child_by_name(np, "cpu");
> +       struct device_node *platform __free(device_node) =3D
> +               of_get_child_by_name(np, "platform");
> +       struct device_node *codec __free(device_node) =3D
> +               of_get_child_by_name(np, "codec");
> +
> +       if (!cpu) {
> +               dev_err(dev, "%s: Can't find cpu DT node\n", link->name);
> +               return -EINVAL;
> +       }
> +
> +       ret =3D snd_soc_of_get_dlc(cpu, &args, link->cpus, 0);
> +       if (ret) {
> +               dev_err_probe(dev, ret,
> +                             "%s: error getting cpu dai name\n", link->n=
ame);
> +               return ret;
> +       }
> +
> +       link->id =3D args.args[0];
> +
> +       if (link->id >=3D LPASS_MAX_PORT) {
> +               dev_err(dev, "%s: Invalid cpu dai id %d\n", link->name, l=
ink->id);
> +               return -EINVAL;
> +       }
> +
> +       if (platform) {
> +               link->platforms->of_node =3D of_parse_phandle(platform,
> +                               "sound-dai",
> +                               0);
> +               if (!link->platforms->of_node) {
> +                       dev_err(dev, "%s: platform dai not found\n", link=
->name);
> +                       return -EINVAL;
> +               }
> +       } else {
> +               link->platforms->of_node =3D link->cpus->of_node;
> +       }
> +
> +       if (codec) {
> +               ret =3D snd_soc_of_get_dai_link_codecs(dev, codec, link);
> +               if (ret < 0) {
> +                       dev_err_probe(dev, ret,
> +                                     "%s: codec dai not found\n", link->=
name);
> +                       return ret;
> +               }
> +
> +               if (platform) {
> +                       /* DPCM backend */
> +                       link->no_pcm =3D 1;
> +                       link->ignore_pmdown_time =3D 1;
> +               }
> +       } else {
> +               /* DPCM frontend */
> +               link->codecs     =3D &snd_soc_dummy_dlc;
> +               link->num_codecs =3D 1;
> +               link->dynamic =3D 1;
> +       }
> +
> +       if (platform || !codec) {
> +               /* DPCM */
> +               link->ignore_suspend =3D 1;
> +               link->nonatomic =3D 1;
> +       }
> +
> +       link->stream_name =3D link->name;
> +
> +       return 0;
> +}
> +
>  int qcom_snd_parse_of(struct snd_soc_card *card)
>  {
>         struct device *dev =3D card->dev;
>         struct snd_soc_dai_link *link;
> -       struct of_phandle_args args;
> -       struct snd_soc_dai_link_component *dlc;
>         int ret, num_links;
>
>         ret =3D snd_soc_of_parse_card_name(card, "model");
> @@ -233,88 +325,32 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
>         card->num_links =3D num_links;
>         link =3D card->dai_link;
>
> +       /* Register frontends first so q6routing can resolve BE targets. =
*/
>         for_each_available_child_of_node_scoped(dev->of_node, np) {
> -               dlc =3D devm_kcalloc(dev, 2, sizeof(*dlc), GFP_KERNEL);
> -               if (!dlc)
> -                       return -ENOMEM;
> -
> -               link->cpus      =3D &dlc[0];
> -               link->platforms =3D &dlc[1];
> -
> -               link->num_cpus          =3D 1;
> -               link->num_platforms     =3D 1;
> -
> -               ret =3D of_property_read_string(np, "link-name", &link->n=
ame);
> -               if (ret) {
> -                       dev_err(dev, "error getting codec dai_link name\n=
");
> -                       return ret;
> -               }
> -
> -               struct device_node *cpu __free(device_node) =3D
> -                       of_get_child_by_name(np, "cpu");
> -               struct device_node *platform __free(device_node) =3D
> -                       of_get_child_by_name(np, "platform");
>                 struct device_node *codec __free(device_node) =3D
>                         of_get_child_by_name(np, "codec");
>
> -               if (!cpu) {
> -                       dev_err(dev, "%s: Can't find cpu DT node\n", link=
->name);
> -                       return -EINVAL;
> -               }
> +               if (codec)
> +                       continue;
>
> -               ret =3D snd_soc_of_get_dlc(cpu, &args, link->cpus, 0);
> -               if (ret) {
> -                       dev_err_probe(dev, ret,
> -                                     "%s: error getting cpu dai name\n",=
 link->name);
> +               ret =3D qcom_snd_setup_dai_link(card, link, np);
> +               if (ret)
>                         return ret;
> -               }
>
> -               link->id =3D args.args[0];
> -
> -               if (link->id >=3D LPASS_MAX_PORT) {
> -                       dev_err(dev, "%s: Invalid cpu dai id %d\n", link-=
>name, link->id);
> -                       return -EINVAL;
> -               }
> -
> -               if (platform) {
> -                       link->platforms->of_node =3D of_parse_phandle(pla=
tform,
> -                                       "sound-dai",
> -                                       0);
> -                       if (!link->platforms->of_node) {
> -                               dev_err(dev, "%s: platform dai not found\=
n", link->name);
> -                               return -EINVAL;
> -                       }
> -               } else {
> -                       link->platforms->of_node =3D link->cpus->of_node;
> -               }
> +               link++;
> +       }
>
> -               if (codec) {
> -                       ret =3D snd_soc_of_get_dai_link_codecs(dev, codec=
, link);
> -                       if (ret < 0) {
> -                               dev_err_probe(dev, ret,
> -                                             "%s: codec dai not found\n"=
, link->name);
> -                               return ret;
> -                       }
> +       for_each_available_child_of_node_scoped(dev->of_node, np) {
> +               struct device_node *codec __free(device_node) =3D
> +                       of_get_child_by_name(np, "codec");
>
> -                       if (platform) {
> -                               /* DPCM backend */
> -                               link->no_pcm =3D 1;
> -                               link->ignore_pmdown_time =3D 1;
> -                       }
> -               } else {
> -                       /* DPCM frontend */
> -                       link->codecs     =3D &snd_soc_dummy_dlc;
> -                       link->num_codecs =3D 1;
> -                       link->dynamic =3D 1;
> -               }
> +               if (!codec)
> +                       continue;
>
> -               if (platform || !codec) {
> -                       /* DPCM */
> -                       link->ignore_suspend =3D 1;
> -                       link->nonatomic =3D 1;
> -               }
> +               ret =3D qcom_snd_setup_dai_link(card, link, np);
> +               if (ret)
> +                       return ret;
>
> -               link->stream_name =3D link->name;
>                 link++;
>         }
>
> --
> 2.53.0
>
> ------------------------------->cut<--------------------------------
>
>
> >  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 47 +++++++++++---=
--------
> >  1 file changed, 24 insertions(+), 23 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/=
arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > index e99d2a56dc28..3efd80f36c6c 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> > @@ -117,6 +117,30 @@ sound {
> >                               "IN2_HPHR", "HPHR_OUT",
> >                               "AMIC2", "MIC BIAS2";
> >
> > +             mm1-dai-link {
> > +                     link-name =3D "MultiMedia1";
> > +
> > +                     cpu {
> > +                             sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA1>;
> > +                     };
> > +             };
> > +
> > +             mm2-dai-link {
> > +                     link-name =3D "MultiMedia2";
> > +
> > +                     cpu {
> > +                             sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA2>;
> > +                     };
> > +             };
> > +
> > +             mm3-dai-link {
> > +                     link-name =3D "MultiMedia3";
> > +
> > +                     cpu {
> > +                             sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA3>;
> > +                     };
> > +             };
> > +
> >               ear-playback-dai-link {
> >                       link-name =3D "Ear Out Playback";
> >
> > @@ -181,29 +205,6 @@ platform {
> >                       };
> >               };
> >
> > -             mm1-dai-link {
> > -                     link-name =3D "MultiMedia1";
> > -
> > -                     cpu {
> > -                             sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA1>;
> > -                     };
> > -             };
> > -
> > -             mm2-dai-link {
> > -                     link-name =3D "MultiMedia2";
> > -
> > -                     cpu {
> > -                             sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA2>;
> > -                     };
> > -             };
> > -
> > -             mm3-dai-link {
> > -                     link-name =3D "MultiMedia3";
> > -
> > -                     cpu {
> > -                             sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA3>;
> > -                     };
> > -             };
> >       };
> >
> >       vreg_anx_30: regulator-anx-30 {
> >
> > ---
> > base-commit: eac8f0411262ea7d156407da4baf260291cbfe32
> > change-id: 20261114-imola-sound-link-order-15de4692e7ef
> >
> > Best regards,
>
