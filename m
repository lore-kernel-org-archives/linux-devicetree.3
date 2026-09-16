Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E3C4C33CD
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 16:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576226; cv=none; b=L/EuL+ZPZ2yTsS5dmTseMUM7IBN6z4FnjJlHwWUXom4paktAyzGtELT8VVSStQ2dYuP2n0T1+zTjvw39/k2wE5R0mDYR+vtw+WwM0vayCUAGV2IZan0aK0Ux6Z+f/iEWRLDwN/8cSNKY++Ni1zQGYwxzWFz1wc4Z8TQCeaka/zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576226; c=relaxed/simple;
	bh=+pr8JXwf3lEotRxrEPi58W6+E6MbOpFpvM9BWeVIpSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aL3YVyNsfIF9SY3OGTXHOOQVN/OcAKbMOeEiR7H+pa3eUU6OkRwsdus5oixKV9oYibul91GaENlMSTGlquc709CB8caQ3VFMeocuiRdFzJWXiVPdFvMxSUJ6kJx134YKibTX2+KSbBoydPvdgM82hkT2FkRAdNDDN2ewetVpGR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XORSXwVQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cKmGHrik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XORSXwVQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cKmGHrik"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeU1S3233360
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 16:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8KIwxPL/45rQhr/QJUaYxW+ZzJC928+zNT9ZvAHA5jo=; b=XORSXwVQRu2XVaOH
	jwDzmACkl1VXbgZX5jjrOfWd9Dl9OhDZjiuNcjdZd9YrOVXoauXDy7/0/n13ZAWT
	cbWVYrHnUEL8s0WzS5+7eCwnsMK7MuQtgsxHhkl/nD89EfQnTIyQ/ZqZy0TC+ZeU
	XoKkCBMKoIdD4AMcxWejVx/6YTqcJRi56/H/2SjB1czUoLuJbdXwQ3ggW+IEYdvK
	YoQoSYMpN00vq3Q72+HuLgHSsQkS6nBf3bEAcZAhPscdT++iLOrnT419b58xd0X7
	dqVYnNAgytMRFW8L7dFInG7M8ofHNK+oqCqGoVvutabF4l1CWxXk1oD0AN2WCZ3U
	4ZHWtQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywca8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 16:30:22 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a04805f8f1so672101137.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 09:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789576220; x=1790181020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KIwxPL/45rQhr/QJUaYxW+ZzJC928+zNT9ZvAHA5jo=;
        b=cKmGHrikNWp0bAq4kg/J6j0RNjm7FHj0uR2ZRUXT6IAHGb8O1kP94IlfzKYQ11248r
         s3ySV74kRNwT/CHp6exT5aj7juWkA3zEQSSrUrSUXAl0Dw/x3yM8u4qgLm9VySUrmQWd
         2UsinuRRvM+XMQXpthBIRlgM1bH2J6RpxMj566qO/PQUSxQ1bwG09SWtbNsOWSksYT0F
         RhqezPzlinTKFqyBxliOuEMlxzmHH629Z4ZFAwBsOCHpfr1wwucVkaF4ivCC8dE1PVij
         b0mRAiZkEHv64d1Ali1Y3YlE0cYNDXKa3uVgjspWmjnZFXB3YupDGJ8JTgWzFKIT2mEH
         Oa0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789576220; x=1790181020;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KIwxPL/45rQhr/QJUaYxW+ZzJC928+zNT9ZvAHA5jo=;
        b=jRIXPavc1Ieg4n8w/DFqPSxuQY0YRKv5OZot7gR7Ow5u2unltmOlv2RRNJYOMK+3r4
         fawFZaMex3/eMFp4ZtKgpJGzWLxJQe7qLOsmn4OgLKnH3KVpjVHSrnKk+Y5Tx2g2cEJ3
         CiUqMe9BN7yINRB09lYolTGnT7qvIVkcyl1RPcpw/yUV+VGtNH1w66/wTB2z7wmtJOMq
         VhcTkR7qtw5LYtelW/RGDgS2lCgb7m2wusiJuYEjHmOT0jUh6aD3/7+z2fTClTz8DQgY
         U9HKHwDJR72pwzQZt41kdFwq4lcgo/EZ1ZVp2NxCzIcQ895JGrqmX6RG3ro1IrKeEDBo
         qoxw==
X-Forwarded-Encrypted: i=1; AKwUvBxSiOMCznGvtosqZ+S6vcb5e8iFp9Ch52hpdwCd9gCE33QwnU8afn0Y6ovR48lWkk7hwR7t+5ikrdQQ@vger.kernel.org
X-Gm-Message-State: AFuF++mXJsP5I6bjSjAiU4HSuY3nOMOLrVtseMeBMGrnsz+vaC3w3LRS
	xMYb/iFQR4lEYKY6fl9DggHwFot/WUond9uwf2He1lW2Vf3UCAITTB5SufoI9kifMMVMFFuWs2+
	kfn7FSVsmmUBt6mu5mCZXWVvodPVQRE4de5Y8yH9o0ytq0G+x1WGDznDaRNfvZNrI
X-Gm-Gg: AYBFou3IMCYi6lZ7RZQxWlklBog0Sr9VeqDfbdrvzcvGY3QEDs+QjCkQ5Ep2hOU/YNi
	Ei1F/hwCm7BEn0LbXq4Stq8bsc2Q4Euidzv/q043CWy3GnPV3tbz2xr3KEZ7Gdv3rZ+WevWOuIo
	Ts81hasuCJLKQ1390PvrlC9HT5rodjVTkbeNa/ldFLotTSYsDuXIO2NZAuNiZrc1konv4xRl5B4
	yqyTP27Ds/PwQN7LeCSUUtvFNAMbxHu5mJVc3EOmWbrrpg2bSEnqqKiJ9Zq6kiLSd9H4MR+IkZs
	p0sNb0juC3HBx1L/AmKhaJdY7r0U3E4K8K3pAH60QH/TTfmLlH7sU2csBoIzcVZFOnJr0VkMdU1
	XVYhY8h207IutakmDxzNH5XPu4Cg=
X-Received: by 2002:a05:6102:5792:b0:7a1:83fe:45e7 with SMTP id ada2fe7eead31-7a183fe6278mr3278999137.8.1789576218538;
        Wed, 16 Sep 2026 09:30:18 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:7a1:83fe:45e7 with SMTP id ada2fe7eead31-7a183fe6278mr3278871137.8.1789576218006;
        Wed, 16 Sep 2026 09:30:18 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fbd2356d1sm3008975e9.6.2026.09.16.09.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 09:30:17 -0700 (PDT)
Message-ID: <cddd5bd4-df99-4332-9bbd-f9dc10874cdb@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 17:30:16 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] dt-bindings: sound: qcom: add Tambora WCD9378 SDCA
 codec
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260915165652.914893-8-srinivas.kandagatla@oss.qualcomm.com>
 <20260916-imaginary-glossy-stallion-c769b5@quoll>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260916-imaginary-glossy-stallion-c769b5@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sr8EiYhNmWawEy2pOQ1uV2L89wfM8R8U
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaac41e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=HeNI3thZ33BDYE7jO_kA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIyNSBTYWx0ZWRfX156w8WMTbt4f
 muf1Su573BduACFpCoQdjd8ONtQgY8CidjnH8A0JXO0s6fJE5r6DACexdht3WYYn+zm4zi3C7da
 OaNgFV2iYBEfILB+cxrCv3MTbloCWd2SWaz6Pm+vWGYEd1OMWeTWI5LQgpkX4MgekRsMCrWHulm
 yYerPsH1Up9Q1m0UYo6LElQt/g3LZSXNoAEUlPjWarot4qklUChuVYtAgEo/AIZs8C7zI87JXoB
 1IGtLDvVFaIxxXCAG19iYzQTmJL8s0SReFPFYWbTssR+H7+xN70Fx7lbbkuwGJa/fPVtslNXCsO
 Vla/q2RANljtNoXn1j5ble5l1MgeV0UFbHOK6rPGtUyNwQYdyWat6iKDYoIaAgAZSbBTGoFrAz7
 npFfg66QHzT5iGuv4YF4qb33HssVGluhd5GcI1igfV/BmTd4RzSUJ3bOndvxLc4vTNMQTUV8XqQ
 4TaqWXiIL19mrNIglgQ==
X-Proofpoint-ORIG-GUID: sr8EiYhNmWawEy2pOQ1uV2L89wfM8R8U
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIyNSBTYWx0ZWRfX8bji98bapsn6
 EgCz8tBoTOr55oP9BtTMYnhg2lSqzqvy5WV7X0syBfohSrVsWkdW0UQLc9+6rH/NwxPqi2Lg1Ox
 T5eF7YM6EBcKzAGGvgGE8Tg0fj2WG0I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160225

Thanks for the review,
On 9/16/26 7:53 AM, Krzysztof Kozlowski wrote:
> On Tue, Sep 15, 2026 at 05:56:49PM +0100, Srinivas Kandagatla wrote:
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>> new file mode 100644
>> index 000000000000..9a6c309018ed
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
>> @@ -0,0 +1,91 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm WCD9378 (Tambora) SoundWire codec
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> +
>> +description:
>> +  Qualcomm WCD9378 (Tambora) SoundWire codec in SDCA compute mode.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,wcd9378c
>> +      - const: sdw20217011000
> 
> As pointed by Rob's bot, this won't work with current soundwire bus
> schema. If it is the same silicon, then usually it does not warrant a
> different compatible, even front compatible. For example same chips are
> used on I2C and SPI buses and the difference is coming from the bus.
> 
I can send update to the bindings but I would prefer the flag that you
suggested.

> Last time I doubted that "compute" and "mobile" modes are a real thing,
> but if you say they are actually different fuse values, then they would
> be real. That could warrant different property, e.g.
> "qcom,sdca-compliant" or "qcom,separate-tx-rx-interfaces".

qcom,sdca-compliant sounds much accurate for this.

> 
> However my points from Jorijn patchset remain - the top level wrapper
> node is a fake construct to solve power sequencing issues and this
> binding should allow fixing that one as well.

There will be no top node at all.
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  qcom,port-mapping:
>> +    description: |
> 
> You can drop |
> 
sure

--srini
>> +      Each entry maps a slave data port to a master data port.
>> +      Entries are in order starting from slave port 1; slave port 0
>> +      is reserved and not represented.  Compute mode uses 8 entries
>> +      covering DP1..DP8.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 8
>> +    maxItems: 8
> 
> Best regards,
> Krzysztof
> 

