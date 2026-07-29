Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D703A7F70
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332071; cv=none; b=EXzq3VbFkpWTMrVx3ZcTJm5EsRMGFh5Gq+rhNcRI+bpayFfgZdiGmOLSpxoAjNx0TOo4+4AsNv7uslTZo39D1hQTLfXrLlC+Hu7Ea6oUGZWD/zvJPFDupXZqm8YMEnDzLk4yTc+O/Vso4I3EK+qY4z1x3wLq4FxamlD1Mbewe+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332071; c=relaxed/simple;
	bh=JlA8WG36lpxsGdfIi/MW6WDvmloEfplyvj0rIQ9ASoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QD2AtG+fSh68RVESaTXcjC36E1Txo86YDPcopVsAMhwdvRz/7QszRk202ajUOp7ovQ3YzyxBayr25vozIkmQEaNXUPOVG7r7KkgANeQN10LW6gXSnRB1Fn3olvPP4uLL9ks3gh48rHvln7wJmVuzT69fP33C3rGqdyPSA92dyKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oawSbPzk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dRyO6j54; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oawSbPzk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dRyO6j54"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD83q41800357
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ncbG0Ydi+yb0hSrpjcQVK5pW64j2kj5xFhEpwulSCt4=; b=oawSbPzk+AN6kupz
	mj3kTAkJTWyILv2ujTyyJjEyAIXN+t+HjqPWuO+yQSRbptzDoH1TVjcwzW74wOOi
	BGCaL2ticMCGHECG+oFp2VltwVTdSHGrLnNs1m6jURjp0kL8ZxJEF31+GPKpURru
	pEacXJeNoIPd7ceIltXNFiVVJ+8tTWB/EOHLDKw9vyU7iLw32i+8Xkzlx2HwcWCB
	tSCMYJugKZRBEBJ5j7wrIKNLJZBRVaasJS0KzRkiiwuuvspS5Dj4fNUV5RDf9hX4
	61b15rdaNkhxpnlpvobXFanqLmtXwG4MscZ4Vf+Ci4PBAyK9VpdwsGErrOixH1ne
	HPkKBg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhgy88rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:34:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-520a00c7a03so17978481cf.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785332059; x=1785936859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncbG0Ydi+yb0hSrpjcQVK5pW64j2kj5xFhEpwulSCt4=;
        b=dRyO6j54NX0ipP6jcefZsFD5EnePz4NRC4uvVK/eq103rzthEMLmTWqkHfHDHNPeXY
         7ANWh/KH6SAuXMKK+ml4sYvcLs9Ajod9omH5d1fBRnLwhDb/aQ18Z8Ma9Vdnn7phwRSQ
         2hqJ6JJEO8xoeW9gRPNJSdfrZC5RUccyKQsKbfsS8Ql/uLG+rQqTdv/ZGGo2MVkpuUNH
         yu/7SRyKPf15rLM9ee6nNrnJB+geH8UhJAvETRQUfjlsYDtWcfhDpW34XHtz7VxXs7yf
         UBZ2QbLeHSeKS+FaFeD45amqFpZgmvtDTXGPsgwfZw3DA8DSdh3WkIeX7v05sqMVyGOM
         enLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332059; x=1785936859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncbG0Ydi+yb0hSrpjcQVK5pW64j2kj5xFhEpwulSCt4=;
        b=DTlqyCxNBIMkcymmvUTo2EWg788ixb8Ly+OHGj7snKKafxC9nlOCXgbrDLRJz4YNnN
         9c0UwrY5I+XtQ9JKnwPQyV3yT49q177ENyjsAqvFN8W9dNlp34HKYPSAN8++kuH76q/E
         rQOrl59FmI8vs6ELGDhIvDD7PXrs6WUFAW+PkpAxCnxkerloL9SmcTky7AgxigZ3JYnA
         efVHoStHFwFU7ZeLqWgvt6WzZRBStyJEqc4xMEMGyj545IvEu362lGqtWVGd1E6hOh0l
         lVXx5yyAc/LXweq47C4AcoPYpQ0/02p2tvLQomUJq6zNqvX4vGzZBxPc0u06QlujHG4+
         jqVg==
X-Forwarded-Encrypted: i=1; AHgh+Rreo/xbNc1xMI1BSTBc8rKXMBvUKy23btoer0Wo1ccXWc/+n1Obn65ERHZVXDU+7xCb03TnXKzXIEui@vger.kernel.org
X-Gm-Message-State: AOJu0YyG4gds4eHKZTctRxhdzwjTV8PdBNX5LrZhFZiSpx4fM+zZ1OSs
	P1SBa2KrBGw4wApS9oCsEx70B9aVGeaONmG2i1zhWmurUzNvQrcvdfC/mFBx6CFYDEcjcM03Hmm
	h+wHfqOXwrOBi1B6X96mO2J4l8PgzD2IqPLIn6Q3X6xuZmlDxPszbU+G/e7XQC27K
X-Gm-Gg: AR+sD11X6QFoJtsdxFtYjw5BF6Xay4shZzioU6j/+8wb6BRsPjussds07SU7q3V4Gbu
	vJyay45enhbv2yg/36e/3okpLiAj85tBscuQXYsO+spk9t0KIfqsI+F9ceV6b2hKMy2kSvIDxv2
	X4TqDJXO6Bxus62wE35JtYofkqt4cckL848vJZG903ajuPi27gIEicD0+VFzvuesbAFwPqMJ6K4
	Wpcd/OdZLtKsfYeUSLYCIUq08rkFLe6ZKklxmGEGOdrTTPc7rrVOPzpnnRyMK5tgQKpwZY43h6W
	InrrleMdGb7AYdayWTDI5SYCFuYKZ8wUp4R8TK4qI8dNHZytMOY/AR6asjsnrflwEAamndr17Jx
	nzRahLCeJoH0UsRW8UX9nfdoa930=
X-Received: by 2002:ac8:5cc6:0:b0:51f:13a1:807b with SMTP id d75a77b69052e-529d7274af8mr64630091cf.88.1785332059055;
        Wed, 29 Jul 2026 06:34:19 -0700 (PDT)
X-Received: by 2002:ac8:5cc6:0:b0:51f:13a1:807b with SMTP id d75a77b69052e-529d7274af8mr64629441cf.88.1785332058528;
        Wed, 29 Jul 2026 06:34:18 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4976bd6dcb3sm61258425e9.11.2026.07.29.06.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:34:17 -0700 (PDT)
Message-ID: <b123882c-c51f-44b3-9004-bc1c4242af81@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:34:16 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
 <219d44e2-28ed-4c54-bd00-66e687a0ba48@kernel.org>
 <d0891f90-b69b-4b27-ad58-94c342ad9a6a@oss.qualcomm.com>
 <3c484a68-5db8-464f-992a-6c7584841a10@kernel.org>
 <0cb5a2dd-c49e-47e3-8cc5-ab2ffd397a32@oss.qualcomm.com>
 <ba147ca6-3788-4cbe-95c3-949ae73ee8f0@kernel.org>
 <54f1c3e5-0b84-44a6-a03c-3cd65792de9c@oss.qualcomm.com>
 <6ed441b8-7148-43ef-9c9f-4bc30c468443@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <6ed441b8-7148-43ef-9c9f-4bc30c468443@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F-etCOcZ7nK2gRUbfzxmtGjGv6hSJ_Lp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExMiBTYWx0ZWRfX0h2li191NqGi
 dHKZ1XjD4tscaWlwz11n/ryTDz1BOQnvqGYD9nonu8cVLFy8nsJa4OLrhx3CRH2rk5TvO0TWaqq
 v9J1VYGaflqU32uKIcylJP2vzlDx9odGAfLdXQwQS9tQpjfTEyBt2d9QZyFukGQEgrZ1tilRs8G
 H3YxuMZrB/+BZWpkuZ9/sIxrNnHByf72YTx1KVSs8WEWjUVrxKPwNkDrSl83gZgWsTP43Op9FYJ
 j4bXcegSoFnVIaM3MAb/GwmIWoMi02WUR4Hw1cZrnL+g4+IAQ74T8ZQwmtnMnsArT+VNXOJ4Wuw
 tyunfPNsQhr9181GZjxGMDIpzn60JrqNDs0Z4gDzfii0lpmVtNzeDWBMPYscKjYF5eP+RlPz6MZ
 yg7VuNkPT3AFLG8HMUWcYjUww7nNQtD9sFcXgS21uJf1bzzbZ7k45+EsiWO+Z4pJ5EG7uA2wgow
 Nr0G6ml8cKS+9VCnLzg==
X-Proofpoint-ORIG-GUID: F-etCOcZ7nK2gRUbfzxmtGjGv6hSJ_Lp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExMiBTYWx0ZWRfX2sxXa/ZcOaJ+
 3rVoEHwQHlItOwduGIf1W75adUSGC2tjxutYTYntGrJyCF9/MvlT/T6/eGhXw2sbk5npfZu+uAO
 nfuABm0FPBDgNWo9vjGhZNwICUke1gk=
X-Authority-Analysis: v=2.4 cv=VZHH+lp9 c=1 sm=1 tr=0 ts=6a6a015b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=GYSh3LzNAAAA:8 a=ZVtt1C71RM4PWqMEfuwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290112



On 7/29/26 2:23 PM, Krzysztof Kozlowski wrote:
> On 29/07/2026 15:02, Srinivas Kandagatla wrote:
>>
>>
>> On 7/29/26 1:43 PM, Krzysztof Kozlowski wrote:
>>> On 29/07/2026 14:36, Srinivas Kandagatla wrote:
>>>> On 7/29/26 1:30 PM, Krzysztof Kozlowski wrote:
>>>>> On 29/07/2026 14:17, Srinivas Kandagatla wrote:
>>>>>> On 7/29/26 12:40 PM, Krzysztof Kozlowski wrote:
>>>>>>> On 23/07/2026 01:42, Srinivas Kandagatla wrote:
>>>>>>>> Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
>>>>>>>> driven by the wcd9378-sdca codec driver for headphone playback, headset
>>>>>>>> mic capture and jack detection via the SimpleJack SDCA function type.
>>>>>>>>
>>>>>>>> WCD9378 codec can be wired up in 2 different modes.
>>>>>>>> "mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
>>>>>>>> each of which has dedicated control and data lines.
>>>>>>>> "compute mode" on compute platforms such as Glymur is enumerated as
>>>>>>>> single standard MIPI SDCA class device.
>>>>>>>>
>>>>>>>> Both modes share same Device ID, compatible; qcom,compute-mode selects
>>>>>>>> which driver path is taken.  Supplies, reset GPIO and mic-bias voltages
>>>>>>>> live on the SoundWire slave node in compute mode and are forbidden in
>>>>>>>> mobile mode (owned by the top-level codec parent there).
>>>>>>>>
>>>>>>>> Assisted-by: Claude:claude-opus-4-7
>>>>>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  .../bindings/sound/qcom,wcd9378-sdw.yaml      | 200 ++++++++++++++++++
>>>>>>>>  1 file changed, 200 insertions(+)
>>>>>>>>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..2ed4ad92958e
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>>>>>>>> @@ -0,0 +1,200 @@
>>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>>>> +%YAML 1.2
>>>>>>>> +---
>>>>>>>> +$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>>> +
>>>>>>>> +title: Qualcomm SoundWire Slave devices on WCD9378
>>>>>>>> +
>>>>>>>> +maintainers:
>>>>>>>> +  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
>>>>>>>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>>>>> +
>>>>>>>> +description: |
>>>>>>>> +  The Qualcomm WCD9378 codec presents its SoundWire slave devices with
>>>>>>>> +  class ID sdw20217011000 in both operating modes:
>>>>>>>> +
>>>>>>>> +    * mobile mode -- two slave instances sit on separate SoundWire
>>>>>>>> +      masters carrying data only.  A separate top-level codec node
>>>>>>>> +      owns the codec's supplies, mic-bias voltages and reset GPIO.
>>>>>>>> +
>>>>>>>> +    * SDCA / compute mode -- one aggregated slave sits on a multi-lane
>>>>>>>> +      master and carries both control and data.  There is no separate
>>>>>>>> +      top-level codec node, so the SoundWire slave node itself owns
>>>>>>>> +      supplies, reset GPIO and mic-bias voltage configuration.  It is
>>>>>>>> +      marked with qcom,compute-mode.
>>>>>>>> +
>>>>>>>> +  Codec drivers that match sdw20217011000 use qcom,compute-mode to
>>>>>>>> +  decide which mode to serve; the presence or absence of this property
>>>>>>>> +  also gates whether the supply and mic-bias properties on this node
>>>>>>>> +  are required or forbidden.
>>>>>>>> +
>>>>>>>> +properties:
>>>>>>>> +  compatible:
>>>>>>>> +    const: sdw20217011000
>>>>>>>> +
>>>>>>>> +  reg:
>>>>>>>> +    maxItems: 1
>>>>>>>> +
>>>>>>>> +  qcom,compute-mode:
>>>>>>>> +    description: |
>>>>>>>> +      Marks this SoundWire slave as the single aggregated slave that
>>>>>>>> +      implements the codec in SDCA / compute mode.  Only present when
>>>>>>>> +      the codec has no separate top-level codec parent; in that case
>>>>>>>> +      this slave node also owns the codec's supplies, reset GPIO and
>>>>>>>> +      mic-bias voltage configuration.  Absent in mobile mode.
>>>>>>>
>>>>>>> I doubt there is really "compute" or "mobile" mode, so you just wrote to
>>>>>>> match use case, but that does not match hardware.
>>>>>>>
>>>>>> This is hardware fuse setting, its not just usecase based but it changes
>>>>>> complete wcd9378 hardware topology, in mobile mode we have 2 soundwire
>>>>>> devices representing tx and rx side of wcd9378 however in compute mode
>>>>>> it only has one soundwire device dealing with both tx and rx. compute
>>>>>> mode is sdca class compliant device.
>>>>>>
>>>>>>
>>>>>>> I think there should be no separate top-level codec parent in the first
>>>>>>> place, thus this property is not needed. You always list here all resources.
>>>>>> There is no top level aggregated device when the codec is fused in
>>>>>> compute mode.
>>>>>
>>>>> There should not be a top-level in either case. This was always Linux
>>>>> driver limitation.
>>>>
>>>> That is not true, its clearly a hardware topology thing.
>>>> Codec has two devices tx and rx, Only one of the device (tx) has access
>>>> to CSR registers of the codec, so rx and tx are pretty much a single
>>>> aggregate codec device which is why we have top-level representation of
>>>> the aggregate device.
>>>
>>> So two devices, but not three. If TX has access to RX, it does not mean
>>> there is third device. If there was a third device (that top level
>>> thingy) you would have it here as well. You don't have, because it is
>>> purely for Linux.
>>
>> WCD codec is a single Codec IP Hardware block which contains two
>> soundwire interface devices. Effectively we have one aggregate device
>> representing codec which encompasses two soundwire devices.
> 
> You have only two devices.
> 
>>
>> Third device is the only place where we could represent entire Codec
> 
> No, any of these devices could. The top-level is a fake being.
> 
>> rather than just soundwire interface devices of the codec.
>>
>> Am not sure what is Linux specific here, its purely hardware topology.
> 
> The Linux specific is because you needed a placeholder for power
> sequencing. It is not a pure hardware topology.

Not just power sequencing we have

1.  tx and rx register read/write interactions happen as part of this
device ex: reading and writing rx blocks inside codec needs to go via tx
device.
2. connecting/interacting TX and rx processing blocks ex: mbhc
3. power and codec internal clock management


> 
> Otherwise, please point me on which/what hardware bus that top-level
> codec resides on if it represents hardware topology.

Its external codec to the SoC.


--srini
> 
> Best regards,
> Krzysztof

