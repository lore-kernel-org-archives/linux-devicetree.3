Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598338;
	b=USnSRjm3gSf7wDNWu2XycJrh+Cg21X96pb1xWP1wHtBJ/TImQ1uNPE+acQn+3KCb6A5J
	 +yK3HBtdomaGBd9TbrQVmR7ZpppxJDLV3wUy3AWwfSSpcctYRAX+lZHwrMes8b/CrkcxZ
	 qGoTNQQdH0V6yhAW0ZpeapthNa9Ye+U2MoaTCoJ+HCbv/WBdAoLlATJkuOl/jUFxo3q1/
	 v6V1W6r+m+efBgIFZLzAAvykk4V4w5mAEt8uveHhDT0l+ZjENnn2yM2gHwsPExlBYrKu2
	 IhqAB015C0vqrbacn5HK3XgMmznrXoL6bPQUkJREH92gIOmrQT7E97D+9C21oEQHMCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598338;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jMbaKJz9g3EncUc8DUtHl36zo+oWHqVd7GDKw3y5cJs=;
	b=IILGPixNqe7/inHj6XPbMqpvwX/gNlUdX595nbg4r2KVmJMnfWhyFmNbBR9zOvrL4C6v
	 8W1ud2eAgftoQ6BigwBnJlK4XsTOFQ8QCE83siSbmrbjSq4rgY14YYTxfn81k7jbpbcN8
	 l2vMV4DuL3qOS5g9BgdkWEZTGaKQekglMrzwpPCBwzXv3M44okxWrcc5fjB3r5gXHUznr
	 UIjfkIcosXLJEKnXT4cEdaezaTATcq+CMIM0UjgqayU3TyGELcQZqabTEngDvMHAxBEhM
	 IAXCzjANqpMAD/z4F4N8n4leBfvochmgoN25plL/BKJzKGgASrzkvhuHn4gOFPvOc4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GWgbSZ4T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRXEA7fw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63FE606A687
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C63FE606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GWgbSZ4T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRXEA7fw
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68bhN1860485
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMbaKJz9g3EncUc8DUtHl36zo+oWHqVd7GDKw3y5cJs=; b=GWgbSZ4TNz9+5qMl
	QkTo3W4EpXrRntBZDKsTi93htfjF1ObcWORNOizPjsspuh5silkP+R8pvJFUmcLk
	KDDNGlRc6aDby0XHutQ2sMzeD38f6AcIvjeTNbDrMd6EaJ9EAgzDsBBaUepaothL
	/6gLbWIWflflACvnfszeW1yZwp8nKJrqxmykGhh5LMP4Irh0Bxj7YdZKwmqUa9AL
	hERoiizUvEr73p20tFBn572LC/Mmte2oRR9/l+0bwvg3McT9e0SOFpmOLZ3avStZ
	gTHyeOZ+Dh+kuOZKXZnuzh28fgKhdsFM694WIRew4MevQU8d2UJ7DFPLB1aVnKWY
	DhUVLw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu69rcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:18:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3a74ee77fso3626519a91.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 01:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795598336; x=1796203136; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMbaKJz9g3EncUc8DUtHl36zo+oWHqVd7GDKw3y5cJs=;
        b=VRXEA7fwf+fBmdgY4/fleky8uFnW9VeuM1Rjp7nEti2NYI3/07V/N1UjDjFlPGC4/8
         Uogn4h+Tx5oIzxcQZ/q9E5oZud/YkNkFITzKVU8l8U9g/LdBNhEa8eRlrqpcmoUI0L5A
         eKi9cO4QZ2ti2NyiIYDSMEvs6EACG3uIJ3/cjTaw4Wl/6qEec7yZoT5vnkLG/we0LGhj
         3tNJASX6r77Pizmb+EeZB+Nc6jTi2pYcG99ZF0adLfdqSs2XQJhblNfxQk2SgHWrjdfI
         F8qvCGhhBdJsRzuybkP9bgrnvj6a695ShFlfZJ6y77LPs4/d3T/yD72j12l4P/UVm7po
         o+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598336; x=1796203136;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jMbaKJz9g3EncUc8DUtHl36zo+oWHqVd7GDKw3y5cJs=;
        b=n3B36JYRcngZvGNkF2IEeIxDWvS8QQAnr54yhnfLJ5TzX0CSAyImSap9XGaG8OS8JY
         A+JW37LtWS7XqWLfDVoJbOwM8q/gaLP/u+y8/onEubvwhtupxjHl/Q5FgMn0+18Oxqz7
         Hq49MVgr5ihhEIsT3FLYE8LRVzLq4RVIEdxYaYpVyIGaHp0RqICOURtXjftTHpb/wsKB
         /OmclXs8ctEylQGgkoCqkW23xLtFgT4QIQ7p4KqauRJtS9LMe6EXxJooByCINdO40bx6
         7rIE7Q15vMQxGVdnAPMkk8rxYQ25K4aOzM7kR7HKsn2bHGPWfOju4HWnK294dcyuFAFD
         A3pA==
X-Forwarded-Encrypted: i=1; AL+hErEJhARXO5W8ayCIov3p7Cy2W1ZrcwIT4j4hqUXCVjTfIL875vkchVNe4xOv/rnRXQS1MTxlUPCIqmg7@vger.kernel.org
X-Gm-Message-State: APuU4Z+PJde4AAS2vLjXK0cjApmd8tAVivs+NLzIqSxaVlG5ZvzEwUDL
	x5sq3VgWL1Ku9R2O0XVr+bW7k311hgyEHag0PTX/3Lmig57zS8W0HpV4rCYOUcjpPaYl8Npqdpe
	AHxzORnv61/s0ukE0LvPmdwn7JrlUy9jWLzr29EYdrGOQztEok9JD0jWRi85sCn61
X-Gm-Gg: AZFdTZftGhd7TgQL/C7UXM1EL071260LWeoVcIIOCeajhw8layqUp439UAs6YQ7sp8p
	Lc7aP9GVT7/p4ou4j8mV+FWXiFG4l8gS5dgwEYb7l3J+3yzb92d50WyzhNsoAtFy7iTXWcuoAVO
	tH8LGKPQ0pF3dd60qiqq6JevTU/mJXvyb0LVxM/a5rtHMKVfwM3H5ebI1GZbomwwSNtSktkKPkQ
	Ev1kEcjet6g6ukzIbLzy0WTe3ZCWt0LM0CjUBBOqgfRk7ViDzgdfVetF4E9TSPdUw+jalIjComA
	lhpmy3sItfgqJorfRbBy5wRmHsTnz+glkdSxZfoWRsvNi2j5v64QAII3bvrI4Dc5W6ncOEAY9h+
	bmr8uktPKM28uIrQwkpWNFJXZDMnYdGj1NgNzsG0Zjqc2HG/2JkyOwMmtiwYSp2gzbAPsaY82ST
	k=
X-Received: by 2002:a17:90b:48d0:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3b41c95fa1amr15029381a91.36.1795598335898;
        Wed, 25 Nov 2026 01:18:55 -0800 (PST)
X-Received: by 2002:a17:90b:48d0:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3b41c95fa1amr15029358a91.36.1795598335425;
        Wed, 25 Nov 2026 01:18:55 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm6290687a12.27.2026.11.25.01.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:18:55 -0800 (PST)
Date: Wed, 25 Nov 2026 14:48:49 +0530
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: power: supply: Add qcom,pm4125-charger
 binding
Message-ID: <awan+SRMtZs6c9jQ@hu-raryan-hyd.qualcomm.com>
References: <20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com>
 <20261124-smblite-charger-for-pm4125-v1-1-2132c9f0601f@oss.qualcomm.com>
 <a5f859c1-0779-4ae1-88f0-bfa12268e09c@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5f859c1-0779-4ae1-88f0-bfa12268e09c@kernel.org>
X-Proofpoint-ORIG-GUID: lV5mkfxUqmN728u2KC1Kp1rxyJeVs35l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX7+tHIL/8Uvvq
 jPRBvSIyIKifJ2cUs9aILXIGCWub/yOfcbm9d8nwMaESq4y3NgPGuq3UU1LfhvFAEoTG2iXV3pd
 g2SB+Yxj7k7uRdJHnN61URIvQa4CUr8=
X-Proofpoint-GUID: lV5mkfxUqmN728u2KC1Kp1rxyJeVs35l
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06a800 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=gAAQxgIGOAtfHdDX1gUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX4IZnNhZaodVr
 ULJ3aLyTNSElgCsP6jSl11/f9qsE+Xp6MS6dJWzvD6IG1PJwIon70k4rDwH9lEDj2huIZMgVhq5
 ZKkuEiAPiUlyRaWaAPflvSlCLH3j3WzB6vjcN37uCIBqbGz3dVeAUQEvcHloYpkiNGSK73BGjFh
 uV8RcwgYani856uWA704rW0/bw7IW460LbMpDqThqcgxu6P0Bj64j6V3/ls+Wgt4Xl033WIt5rb
 U2uveY2vUinczdGBxqFQlwm+hoDjkojycunLOthtV/TuF91qO0Vv0/yozoJ9YonuEE98ke79pZs
 t1uoK4pnrvIdTBX6jdaysyPgQMNJ/Vf5rpc9TKPDj3rdKpYoDD2HabOMIZIbrdjtQa4yC8i/hRB
 ar8OMifF++p9BSrkcF3fzcruwMqijjpj8M4jeK9KDwHmjjGlUASafjkc5cep9933dpZQV54nP5B
 PQY4uNwagyXv2t6tFxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250036

On Tue, Nov 24, 2026 at 10:55:57AM +0100, Krzysztof Kozlowski wrote:
> On 24/11/2026 10:15, Raj Aryan wrote:
> > Add YAML devicetree binding for the Qualcomm SMBLite switch-mode
> 
> YAML devicetree binding, you hit combo... Drop YAML.
>

ACK.

> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 

ACK.

> > battery charger found on the PM4125 PMIC.
> > 
> > SMBLite is a reduced-feature charger IP sharing a common SPMI
> > interface with the SMB2 family (PMI8998, PM660) but using separate
> > SPMI peripheral bases for CHGR, DCDC, USB, MISC and BATIF blocks.
> > 
> > The binding covers:
> 
> Do not explain what the patch is doing. We can read the diff. Please
> read submitting patches or look at other commits to learn what is
> supposed to be here.
> 

I apologise sincerly. I will correct this in V2.

> > 
> >   - compatible string: qcom,pm4125-charger
> >   - reg property for the CHGR peripheral base address
> >   - Four interrupts: usb-plugin, bat-ov, wdog-bark and
> >     usbin-icl-change
> >   - Two IIO channels: usbin_v (USB input voltage via ADC5_USB_IN_V_16)
> >     and usbin_i (USB input current via ADC5_USB_IN_I)
> >   - Optional JEITA soft and hard threshold configuration as raw
> >     16-bit ADC comparator values written to BATIF ADC comparator
> >     registers
> >   - Optional monitored-battery phandle for battery parameters such
> >     as float voltage and charge termination current
> 
> ...
> 
> > +
> > +maintainers:
> > +  - Raj Aryan <raj.aryan@oss.qualcomm.com>
> > +  - Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > +
> > +description: |
> > +  The Qualcomm SMBLite is a switch-mode battery charger IP found on
> > +  the entry-level Qualcomm PM4125 PMIC. It exposes five separate
> > +  SPMI peripheral bases for CHGR, DCDC, USB, MISC and BATIF blocks and
> > +  supports USB input current limiting, JEITA temperature protection,
> > +  battery overvoltage detection and a hardware watchdog.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,pm4125-charger
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: Base address of the CHGR SPMI peripheral (e.g. 0x1000).
> 
> Drop description.
> 

ACK.

> > +
> > +  interrupts:
> > +    maxItems: 4
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: usb-plugin
> > +      - const: bat-ov
> > +      - const: wdog-bark
> > +      - const: usbin-icl-change
> > +
> > +  io-channels:
> > +    minItems: 1
> > +    maxItems: 2
> 
> Why is this flexible?
>

I  made io-channels flexible to allow an optional usbin_i channel. The
shared driver requires that channel for SMB2, but PM4125 uses SMBLite,
which doesn’t request it. Since this binding is PM4125-specific, I will drop it.

> > +    description: |
> > +      IIO ADC channels used by the charger. usbin_v is the USB input
> > +      voltage channel (ADC5_USB_IN_V_16). usbin_i is the USB input
> > +      current channel (ADC5_USB_IN_I).
> > +
> > +  io-channel-names:
> > +    minItems: 1
> > +    items:
> > +      - const: usbin_v
> > +      - const: usbin_i
> > +
> > +  monitored-battery: true
> > +
> > +  qcom,jeita-soft-thresholds:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 2
> > +    maxItems: 2
> > +    description: |
> > +      JEITA soft temperature thresholds (COOL, WARM) as raw 16-bit ADC
> > +      comparator values written to the BATIF ADC comparator registers.
> > +      Example: <0x5314 0x25e3> for COOL=15°C, WARM=45°C.
> > +
> > +  qcom,jeita-hard-thresholds:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 2
> > +    maxItems: 2
> > +    description: |
> > +      JEITA hard temperature thresholds (COLD, HOT) as raw 16-bit ADC
> > +      comparator values written to the BATIF ADC comparator registers.
> > +      Example: <0x58cd 0x20b8> for COLD=0°C, HOT=60°C.
> 
> Express temperatures with proper units.
>

ACK.

> 
> 
> Best regards,
> Krzysztof

Thanks & Regards
Raj Aryan
