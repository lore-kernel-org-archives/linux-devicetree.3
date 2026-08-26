Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EB033AD9C
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737171; cv=pass; b=p2k+56RStXz7CavjSanFnA7iOfIDqnXNvWPY1TqYRR8lvxF7StsZ8b5N1nar+grHnPfLCPnx/i9+fa7ii0sy6cJxj57mofa1dziETJzEaq/wGxP8aXu0qryPVuPIguPE1n8mGt0QsC5cfLW5JgIAoQzxLIvFmWRZegmXXNDgjcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737171; c=relaxed/simple;
	bh=MB4dA82BblNtMHL3VrJWHtMSdqhIeHfUBL+8ndTPV5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nvfp6N/3FE+sDvmbhllmwvk4KBkRNSd15rA046jyub5dAZjTjXxbtGWnNvE1apI9QYUtLV4W2qYW0sqPgNXYJRCjUbPFu4YelJdVE+QC3Tz/ZyuF6tgAzRsBmfziD+3THd+JvJvORyBguDmxIkmSTjASM3p+ltEHLjm8O01e3x4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWf92Ldz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hvaR6/4x; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWf92Ldz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hvaR6/4x"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9CqFc828625
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jawPPDOLER4ggCg2DX6XAAgcfU5Wy1x+3QlIF2mSk/U=; b=MWf92LdzPn6/orIo
	Q9ZG8vssnSxW+LXzdIB8g36RCpM6NcC/YAdIOk66/5ATmbj6hws8h/a+CS7Ckdej
	YrGCi3u7edMq1JKjYt23lkPEo8nPuj9ltqr3t45S4c+wTBerDSHTV1ydftf9IIzX
	DQrmv+TT9A22NYm7AIFLVtsfnuHOq2YEmTlOgDD+SZBqaxOXi34R4KhuUF9cMinz
	yiSVhR95r3cAso9kHFskghezpy3+3yxo/6r+n7llXmxKWdgwfH4a3rQymHH6ZhTS
	zzw5IBDpAF2GgIgr4SUHVeTrsfFFUkoP4N324VI7wsWRKEKYQESsG5CpJPRTddk3
	I+Mh+A==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ghe32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:39:28 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-836c2b00bbaso23054267b3.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 02:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787737168; cv=none;
        d=google.com; s=arc-20260327;
        b=G/ZqBX997lzDu2Cxz4RDgfd6p/sWG7h2+tquZikohg6BYIyDpItrNUjYvUy1RVZn3g
         brmrYGoybDFTIqmsMyHeygYWOoFDxuCTxyzktWy43bq9UIfBYu0lwyEB9rceThkjMS/G
         85v18t7NMRk4UkBcVdEwyZRieGsjPLyCtDV62xqoVniaeDT8y8ZMLeTcC8tzaQFHRIzt
         a7BgEEzT8Y0LPqb1cKGEFdTjLuWYg+DJhUXQwG5XCR0vfEofKihAdS60FK/mBQ/P+0N/
         uAM3y3OVXJiBJRcDbd0QX8VUx30fZtKQgaQkL9m6ye3kotKjL5jUj6ljWQZIWW5ngNzd
         2fJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jawPPDOLER4ggCg2DX6XAAgcfU5Wy1x+3QlIF2mSk/U=;
        fh=EMDSV89qoWDNkJDsYMKAtwpsTToR9mpfEcOr9HlgVJE=;
        b=nDUi+o02uup1bdXmpnoZbq9Ch7bPwVjNB/UGDOIy9cHGKJczFZAOwswQBcz22tfYA1
         vMFhRePJKkuyhHH5QHCNOzZvzf3ORv2airmg/BjM8aadFLkWQHhFUjWkqcb7sPvvoBVH
         QlwbfqEw1av0xJnZdDRzsmTPUYore7y6I9xghgEMjt0kNpDVDBkXfzqLEB1iSCXSHlCi
         QPz3/BWK5GNawU/ioxgAT5Bz5OOJr5sqDp3EE82pEca1ovp7jXRMepJVMipQmv0cUtbK
         Mxdnc2oAuxF0W2aUW13Ij0PVETM66NNuyqIis4kdRlNaOMM2IGFj2MtJp8qZhsuWkvBb
         Lh7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787737168; x=1788341968; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jawPPDOLER4ggCg2DX6XAAgcfU5Wy1x+3QlIF2mSk/U=;
        b=hvaR6/4xUueb4J40Upm8DRWoXpPQxv1SqWn5LNd8RUJbGbipaSup7jAqESnd13k0e1
         0W/ajlMhtxIKs55YGdDwhUggoYrJ+CbkEOO+tpEcvoiO6GqD8nYtowAeLq+Zs4Dikagq
         /Ws6vSUymMZFl3fJt+Py3Mh1iCOKT5FJf9EJnJlujF0ChTEeeGgHNcVfTkL8mwZltRsM
         /eKJ1Q7EqbB8Da1pQlC9J7ezXgEQR8oQulFqJZPyt6iTfuy4z39+9Qs0I8kZuQwuV0aG
         LeZPCerytfaygPpk1RH3M782Ci4SNcvvppkOvKRzng62C/2Kz79IYgQlWpBfEPtzfZOB
         ySLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787737168; x=1788341968;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jawPPDOLER4ggCg2DX6XAAgcfU5Wy1x+3QlIF2mSk/U=;
        b=ImeCzN8TpDdn/PGYsJnqTodEpEvRSCS2fCpFXFgX+TUCIfvJnfIVgfaApw7GZ8HCZc
         Bh8cCDNUNenJC7X22MGIj9INkvb0VkHgc++ENQwOgDXWBiYU8WwmjMk9LerFr8z2JmXs
         t2WCzWZDl2Q0zgiff6fDPRfrGvS3XbbQ9uyTeSHV7HrtIdXLrV65gN7JegebXSNDCiCD
         qGNLVo4mcnozmmrCt3qBx0t/dnKPVWqRS4I0jtYxaUEPRSFLPOIVBy/Iyl+vtXeBiEpm
         CsbGqUKCj4qUPo6fVQoG6FN1hiSaNYzSTNd7NnpR3x7KIYEA3RIC+Vl0QY3KzGSOPG9w
         JVcw==
X-Forwarded-Encrypted: i=1; AHgh+RqWQ1uARcqPaSSRe2nruXWv6YiqzrW0rt+0HKUbUQMM+JT0x0IC3Bdg0l6N8UrQh7cGbBp4ISoLZzqW@vger.kernel.org
X-Gm-Message-State: AFuF++k6QDk1ounm+NqzdvgY9LfiUdyGDRoDEpgIW/iJDN68TUPOlNoh
	3RgpHg8h7o6/bTu9ruv/geeV2nyBLvudBaSZU11D+UD8sJ4k8sD6grLPMKTmvpRA+Qa4Sakh2tX
	FZhCIiM/SgAi/lP2aip+1FJoZFGI5L5L9kQfrXO7PssqWNfb8NHKYMzRPcdioZyxx6/P1ZpSJTY
	aFqfmy4j/tiGFRGu0xjrxLi9snvO4ZIDEckTaUjFE=
X-Gm-Gg: AR+sD10Kzl57xaLE+B4TS0WXLeRuQd5PR9+5vwyYf9Nn9sO9K+M2LlGMPMcP58oZCUp
	8/ndXq0VSIdC+SZs35l8a62kiSIcUDls0LXWU/u+pfAqq2RzMPVfOm3ewhvjlhplpdBBcGpDO4E
	r4nJuwlcPRpA16OuT087o2MtC1dvHPRDeVXG95EyN8OtwlGUrnf3IIIbRlcQ==
X-Received: by 2002:a05:690c:3684:b0:856:aea7:633f with SMTP id 00721157ae682-85741ef0e60mr27185057b3.34.1787737167881;
        Wed, 26 Aug 2026 02:39:27 -0700 (PDT)
X-Received: by 2002:a05:690c:3684:b0:856:aea7:633f with SMTP id
 00721157ae682-85741ef0e60mr27184757b3.34.1787737167295; Wed, 26 Aug 2026
 02:39:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com> <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com>
In-Reply-To: <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:09:14 +0530
X-Gm-Features: AcwNN1VE2nMuWe7qH2WTwM2DHS04txhArWz69WTU0hrK8jQW_KKxvGV7hvd-Lvg
Message-ID: <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Koan90fChNsPLA-gEny50ihloxTx4Q-B
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8eb450 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=CSuQeL9J5pieO85U-EQA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3OSBTYWx0ZWRfX793GlxcaTF6/
 +fZ3kr68DZfZstX539z8ncl4IGTCGz2WxZVHHJMpTWStEDuSuWZcnVuZRH6q9XYsRqWVfcLZXk1
 RZF2Xa24vfJ4EGCeI0LlO/ZWrYixvfE=
X-Proofpoint-ORIG-GUID: Koan90fChNsPLA-gEny50ihloxTx4Q-B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3OSBTYWx0ZWRfX7ffsn1JpVtOo
 TE1WIF8EJcM9hGniPetQTvL64E4RRAoWmt3L60x5U5hWMmiGJjQ14olCQpS2VDEUvZ7N0X81rI5
 iM8ZWP1GdB9qrEgv80pukXP6r8XWMTWUJp8anrCKaSF1f1BbJik4gG4rXtojWrtL0O+Tg/q1GU3
 EsvoKo8LBELXh/1Vvt8eyivX6AepsZmIyFAOAvboHLgdLng0+AL3Hpu6DcGjYvy8MvSsd8ZqSyz
 cBrPQ6nfiTm81nXmcizwPaymuMCyD6b8bGfwAlfIuX1Uc6UJU4gqe2ADWsNSILAQnov5k6dmEEo
 dQwrmv8T9m/sX4cIqiALO4/sP1OLC4DoygjAC03YqTO5xw5E9OhZI9xxWe4V8xVtM5yywTsqGhd
 KmKj/r9fj22iSUyubgN4vePWcjZgQjni411XA36RRjumHLpksKk+oa2j+twzjzH3I4XDoy/GRzR
 dBea9hKEjrULcsPr3zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260079

On Wed, Aug 26, 2026 at 2:02=E2=80=AFPM Mohammad Rafi Shaik
<mohammad.rafi.shaik@oss.qualcomm.com> wrote:
>
>
>
> On 8/24/2026 12:06 PM, Harendra Gautam wrote:
> > QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> > interfaces and the internal Bolero/WCD codec. Platform Devicetree files
> > need a binding to describe the controller resources, DAI cells and per-
> > interface AIF configuration, and named constants to avoid raw numeric I=
Ds
> > in sound-dai references and child-node reg values.
> >
> > Describe the MMIO region, interrupt, clocks, DMA IOMMU mapping and
> > aif-interface child nodes required by the controller.
> >
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > ---
> >   .../bindings/sound/qcom,qaif-cpu.yaml         | 307 +++++++++++++++++=
+
> >   include/dt-bindings/sound/qcom,qaif.h         |  97 ++++++
> >   2 files changed, 404 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif-=
cpu.yaml
> >   create mode 100644 include/dt-bindings/sound/qcom,qaif.h
> >
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml=
 b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> > new file mode 100644
> > index 000000000000..134356114733
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> > @@ -0,0 +1,307 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/qcom,qaif-cpu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Audio Interface (QAIF) CPU DAI Controller
> > +
> > +maintainers:
> > +  - Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > +
> > +description: |
> > +  The Qualcomm Audio Interface (QAIF) is a fully configurable DMA-base=
d
> > +  audio subsystem controller. It serialises and deserialises PCM audio
> > +  between system memory and external serial audio peripherals (PCM, TD=
M,
> > +  I2S, MI2S) through the AIF path, and transfers parallel audio betwee=
n
> > +  memory and an internal WCD codec through the CIF path.
> > +
> > +  AIF (Audio Interface): up to 13 multi-lane Unified Audio Interfaces,
> > +  each supporting up to 8 independent data lanes. Each lane is individ=
ually
> > +  configurable as TX (output/speaker) or RX (input/mic). All lanes of =
an
> > +  interface share a single bit clock and frame sync. Supported modes a=
re
> > +  PCM (short/long sync), TDM, and MI2S (stereo/mono). Per-interface
> > +  configuration includes sync source (master/slave), sync mode, sync d=
elay,
> > +  sync inversion, slot width (8/16/24/32-bit), sample width, active sl=
ot
> > +  masks (up to 32 slots), bits-per-lane frame size, lane enable/direct=
ion
> > +  masks, loopback, output-enable control, and full-cycle path support =
for
> > +  long chip-to-chip connections.
> > +
> > +  CIF (Codec Interface): up to 10 RDDMA (playback) and 10 WRDMA (captu=
re)
> > +  channels connecting to an internal codec over a parallel bus. Each c=
hannel
> > +  supports active-channel enable mask (up to 16 channels), frame-sync
> > +  selection, frame-sync delay, frame-sync output gating, dynamic clock
> > +  gating, and 16-bit packing/unpacking.
> > +
> > +  Note on RX/TX naming convention: in QAIF, TX refers to the output
> > +  (speaker/playback) direction and RX refers to the input (mic/capture=
)
> > +  direction. This applies to both AIF lane directions and CIF slot/mas=
k
> > +  properties.
> > +
> > +  DMA engine: RDDMA fetches audio from DDR/TCM/LPM into a shared SRAM
> > +  latency buffer (SHRAM) and drains it to the interface. WRDMA collect=
s
> > +  data from the interface into SHRAM and writes it to memory. Each DMA
> > +  owns a private SHRAM region defined by start address and length regi=
sters.
> > +  Burst sizes of 1/2/4/8/16 beats (64-bit) are supported with up to 4
> > +  outstanding transactions per DMA. Two QSB master ports (QXM0 for TCM=
,
> > +  QXM1 for DDR/LPM) provide the memory interface.
> > +
> > +  Resources are partitioned among up to 5 Execution Engines (EEs) via
> > +  EE map registers. Each EE owns a set of DMAs, audio interfaces, and
> > +  interface groups, and receives its own independent interrupt output.
> > +  The interrupt hierarchy has a two-level structure: a summary registe=
r
> > +  identifies the event class (DMA period, underflow/overflow, error
> > +  response, audio interface underflow/overflow, group done, rate detec=
tor,
> > +  VFR), and per-resource status registers identify the specific channe=
l.
> > +
> > +  Interface grouping (bonding) allows up to 6 groups of audio and code=
c
> > +  interfaces to start synchronously and align their DMA period interru=
pts
> > +  within half a frame duration using the RDDMA padding feature.
> > +
> > +  Two rate detector blocks measure the frequency of incoming frame syn=
c or
> > +  word select signals and generate interrupts on rate change, undetect=
ed
> > +  rate, or sync timeout.
> > +
> > +  Block diagram::
> > +
> > +    System Memory (DDR / LPM / TCM)
> > +    +---------------------------------+
> > +    |  Circular Buffers (ping-pong)   |
> > +    +----------+----------+-----------+
> > +               |          ^
> > +         64-bit AXI  64-bit AXI
> > +               |          |
> > +    +----------v----------+-----------+
> > +    |        QSB Master Ports         |
> > +    |  +----------+  +----------+     |
> > +    |  |   QXM0   |  |   QXM1   |     |
> > +    |  +----+-----+  +-----+----+     |
> > +    +-------|--------------|----------+
> > +            |              |
> > +    +-------v--------------v----------+
> > +    |         Shared RAM (SHRAM)       |
> > +    |  +------------+  +------------+ |
> > +    |  | QXM0 Read  |  | QXM0 Write | |
> > +    |  | SHRAM      |  | SHRAM      | |
> > +    |  +------------+  +------------+ |
> > +    |  +------------+  +------------+ |
> > +    |  | QXM1 Read  |  | QXM1 Write | |
> > +    |  | SHRAM      |  | SHRAM      | |
> > +    |  +------------+  +------------+ |
> > +    +---+--------+--------+-------+---+
> > +        |        |        |       |
> > +    +---v--+  +--v---+ +--v---+ +-v----+
> > +    |RDDMA |  |RDDMA | |WRDMA | |WRDMA |
> > +    | AIF  |  | CIF  | | AIF  | | CIF  |
> > +    |[0..n]|  |[0..n]| |[0..n]| |[0..n]|
> > +    +--+---+  +--+---+ +--+---+ +-+----+
> > +       |         |       ^          ^
> > +       | TX      | TX    | RX       | RX
> > +       v         v       |          |
> > +    +--+--------------------+  +----+----------+
> > +    |  Unified Audio Intf   |  | Codec DMA     |
> > +    |  (AIF 0..12)          |  | Interface     |
> > +    |                       |  | (CIF)         |
> > +    |  AUD_INTFa block:     |  |               |
> > +    |  - Serializer (TX)    |  | RDDMA: DDR -> |
> > +    |  - De-serializer (RX) |  |   internal    |
> > +    |  - Sync gen/detect    |  |   codec       |
> > +    |  - Up to 8 data lanes |  | WRDMA: codec  |
> > +    |  - PCM / TDM / MI2S   |  |   -> DDR      |
> > +    |  - Near Pad Logic     |  | Up to 16 ch   |
> > +    +--+--------------------+  +----+----------+
> > +       |  Lane 0..7 (TX/RX)       |  Parallel bus
> > +       |  Bit clk + Frame sync    |  + Frame sync
> > +       v                          v
> > +    +--+--------+          +------+------+
> > +    | External  |          | Internal    |
> > +    | Serial    |          | Digital     |
> > +    | Peripherals|         | Codec       |
> > +    | (PCM/TDM/ |          | (Bolero/    |
> > +    |  MI2S)    |          |  WCD)       |
> > +    +-----------+          +-------------+
> > +
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,shikra-qaif-cpu
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: QAIF core registers
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description:
> > +      QAIF summary interrupt for this Execution Engine. Signals DMA pe=
riod
> > +      completion, buffer underflow/overflow, error response, audio int=
erface
> > +      underflow/overflow, interface-group done, rate detector and VFR =
events.
> > +
> > +  iommus:
> > +    maxItems: 1
> > +    description: Phandle to apps_smmu node with sid mask
> > +
> > +  dma-coherent: true
> > +
> > +  clocks:
> > +    minItems: 5
> > +    maxItems: 9
> > +
> > +  clock-names:
> > +    description:
> > +      The first five clocks are always required. Any further entries a=
re the
> > +      per-AIF bit clocks (aif_if<N>_ibit), supplied in order starting =
from
> > +      AIF interface 0 for as many serial AIF interfaces as the board u=
ses.
> > +    minItems: 5
> > +    items:
> > +      - const: lpass_config
> > +      - const: lpass_core_axim
> > +      - const: aud_dma
> > +      - const: aud_dma_mem
> > +      - const: bus
> > +      - const: aif_if0_ibit
> > +      - const: aif_if1_ibit
> > +      - const: aif_if2_ibit
> > +      - const: aif_if3_ibit
> > +
> > +  '#sound-dai-cells':
> > +    const: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +patternProperties:
> > +  '^aif@[0-9a-f]+$':
> > +    type: object
> > +    description:
> > +      QAIF AIF interface child node for PCM, TDM or MI2S configuration=
.
> > +
> > +    properties:
> > +      reg:
> > +        maxItems: 1
> > +        description:
> > +          DAI ID of the AIF interface (QAIF_MI2S_AIF* or QAIF_TDM_AIF*=
).
> > +
> > +      dai-format:
> > +        description: Serial audio interface format (MI2S, TDM or PCM).
> > +        enum: [i2s, dsp_a, dsp_b]
> > +
> > +      dai-tdm-slot-width:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [8, 16, 24, 32]
> > +        description:
> > +          Slot width in bits.
> > +
> > +      dai-tdm-slot-num:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Number of slots per lane.
> > +        minimum: 1
> > +        maximum: 32
> > +
> > +      dai-tdm-slot-rx-mask:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description:
> > +          Active RX slots, one entry per slot. A nonzero value marks t=
he
> > +          slot as active.
> > +        minItems: 1
> > +        maxItems: 32
> > +
> > +      dai-tdm-slot-tx-mask:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description:
> > +          Active TX slots, one entry per slot. A nonzero value marks t=
he
> > +          slot as active.
> > +        minItems: 1
> > +        maxItems: 32
> > +
> > +      qcom,qaif-aif-lane-map:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description:
> > +          Per-lane direction map, one entry per lane starting from lan=
e 0.
> > +          Use 0 for TX (output/speaker) and 1 for RX (input/mic).
> > +        minItems: 1
> > +        maxItems: 8
> > +        items:
> > +          enum: [0, 1]
> > +
> > +    required:
> > +      - reg
> > +      - dai-format
> > +      - qcom,qaif-aif-lane-map
> > +
> > +    if:
> > +      properties:
> > +        dai-format:
> > +          enum: [dsp_a, dsp_b]
> > +    then:
> > +      required:
> > +        - dai-tdm-slot-width
> > +        - dai-tdm-slot-num
> > +        - dai-tdm-slot-rx-mask
> > +        - dai-tdm-slot-tx-mask
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - iommus
> > +  - clocks
> > +  - clock-names
> > +  - '#sound-dai-cells'
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        qaif_cpu: audio-controller@a000000 {
> > +            compatible =3D "qcom,shikra-qaif-cpu";
> > +            reg =3D <0x0 0x0a000000 0x0 0x20000>;
> > +            interrupts =3D <0 331 4>;
> > +            iommus =3D <&apps_smmu 0x1c0 0x0>;
> > +            clocks =3D <&gcc 213>,
> > +                     <&gcc 214>,
> > +                     <&audiocorecc 15>,
> > +                     <&audiocorecc 17>,
> > +                     <&audiocorecc 18>,
> > +                     <&audiocorecc 5>,
> > +                     <&audiocorecc 8>,
> > +                     <&audiocorecc 11>,
> > +                     <&audiocorecc 14>;
> > +            clock-names =3D "lpass_config",
> > +                          "lpass_core_axim",
> > +                          "aud_dma",
> > +                          "aud_dma_mem",
> > +                          "bus",
> > +                          "aif_if0_ibit",
> > +                          "aif_if1_ibit",
> > +                          "aif_if2_ibit",
> > +                          "aif_if3_ibit";
> > +            #sound-dai-cells =3D <1>;
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            aif@d7 {
> > +                reg =3D <215>;
> > +                dai-format =3D "dsp_a";
> > +                dai-tdm-slot-width =3D <32>;
> > +                dai-tdm-slot-num =3D <2>;
> > +                dai-tdm-slot-rx-mask =3D <1 1>;
> > +                dai-tdm-slot-tx-mask =3D <1 1>;
> > +                qcom,qaif-aif-lane-map =3D <1 0>;
> > +            };
> > +        };
> > +    };
> > diff --git a/include/dt-bindings/sound/qcom,qaif.h b/include/dt-binding=
s/sound/qcom,qaif.h
> > new file mode 100644
> > index 000000000000..24706efd07d1
> > --- /dev/null
> > +++ b/include/dt-bindings/sound/qcom,qaif.h
> > @@ -0,0 +1,97 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + *
> > + * DAI IDs for the Qualcomm Audio Interface (QAIF) controller.
> > + * QAIF_MI2S_AIF* and QAIF_TDM_AIF* values are used in sound-dai
> > + * references and as the reg value of aif@N child nodes.
> > + * QAIF_CDC_DMA_* values are for sound-dai references only and must
> > + * not be used as aif@N child node reg values.
> > + */
> > +#ifndef __DT_QCOM_QAIF_H
> > +#define __DT_QCOM_QAIF_H
> > +
> > +/*
> > + * MI2S DAI IDs -- one per physical AIF port in MI2S mode.
> > + * Each port supports up to 2 channels (stereo I2S) over a single
> > + * data lane sharing a bit clock and frame sync.
> > + */
> > +#define QAIF_MI2S_AIF0               200
> > +#define QAIF_MI2S_AIF1               201
> > +#define QAIF_MI2S_AIF2               202
> > +#define QAIF_MI2S_AIF3               203
> > +#define QAIF_MI2S_AIF4               204
> > +#define QAIF_MI2S_AIF5               205
> > +#define QAIF_MI2S_AIF6               206
> > +#define QAIF_MI2S_AIF7               207
> > +#define QAIF_MI2S_AIF8               208
> > +#define QAIF_MI2S_AIF9               209
> > +#define QAIF_MI2S_AIF10              210
> > +#define QAIF_MI2S_AIF11              211
> > +#define QAIF_MI2S_AIF12              212
> > +
> > +/*
> > + * TDM DAI IDs -- one per physical AIF port in TDM mode.
> > + * Each port supports up to 8 channels over up to 8 independent data
> > + * lanes sharing a single bit clock and frame sync.
> > + */
> > +#define QAIF_TDM_AIF0                213
> > +#define QAIF_TDM_AIF1                214
> > +#define QAIF_TDM_AIF2                215
> > +#define QAIF_TDM_AIF3                216
> > +#define QAIF_TDM_AIF4                217
> > +#define QAIF_TDM_AIF5                218
> > +#define QAIF_TDM_AIF6                219
> > +#define QAIF_TDM_AIF7                220
> > +#define QAIF_TDM_AIF8                221
> > +#define QAIF_TDM_AIF9                222
> > +#define QAIF_TDM_AIF10               223
> > +#define QAIF_TDM_AIF11               224
> > +#define QAIF_TDM_AIF12               225
> > +
> > +/*
> > + * CIF (Codec Interface) RX DAI IDs -- playback to internal codec.
> > + * RDDMA channels fetch audio from memory and drain it to the codec.
> > + */
> > +#define QAIF_CDC_DMA_RX0     226
> > +#define QAIF_CDC_DMA_RX1     227
> > +#define QAIF_CDC_DMA_RX2     228
> > +#define QAIF_CDC_DMA_RX3     229
> > +#define QAIF_CDC_DMA_RX4     230
> > +#define QAIF_CDC_DMA_RX5     231
> > +#define QAIF_CDC_DMA_RX6     232
> > +#define QAIF_CDC_DMA_RX7     233
> > +#define QAIF_CDC_DMA_RX8     234
> > +#define QAIF_CDC_DMA_RX9     235
> > +
> > +/*
> > + * CIF (Codec Interface) TX DAI IDs -- capture from internal codec.
> > + * WRDMA channels collect audio from the codec and write it to memory.
> > + */
> > +#define QAIF_CDC_DMA_TX0     236
> > +#define QAIF_CDC_DMA_TX1     237
> > +#define QAIF_CDC_DMA_TX2     238
> > +#define QAIF_CDC_DMA_TX3     239
> > +#define QAIF_CDC_DMA_TX4     240
> > +#define QAIF_CDC_DMA_TX5     241
> > +#define QAIF_CDC_DMA_TX6     242
> > +#define QAIF_CDC_DMA_TX7     243
> > +#define QAIF_CDC_DMA_TX8     244
> > +#define QAIF_CDC_DMA_TX9     245
> > +
> > +/*
> > + * CIF (Codec Interface) VA TX DAI IDs -- capture from voice activity =
codec.
> > + * WRDMA channels collect audio from the VA codec and write it to memo=
ry.
> > + */
> > +#define QAIF_CDC_DMA_VA_TX0  246
> > +#define QAIF_CDC_DMA_VA_TX1  247
> > +#define QAIF_CDC_DMA_VA_TX2  248
> > +#define QAIF_CDC_DMA_VA_TX3  249
> > +#define QAIF_CDC_DMA_VA_TX4  250
> > +#define QAIF_CDC_DMA_VA_TX5  251
> > +#define QAIF_CDC_DMA_VA_TX6  252
> > +#define QAIF_CDC_DMA_VA_TX7  253
> > +#define QAIF_CDC_DMA_VA_TX8  254
> > +#define QAIF_CDC_DMA_VA_TX9  255
> > +
>
> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause sound
> card registration to fail.
>
> Check sound/soc/qcom/common.c, as the current indices (246-255) are
> beyond the supported LPASS port range.
>
> Best Regards,
> Rafi.
Thanks for pointing this out. We can either add the range check for
min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
qcom/common.h to validate the supported DAI IDs across Qualcomm
platforms.
-Harendra
>
> > +#endif /* __DT_QCOM_QAIF_H */
>
