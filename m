Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661371;
	b=Bwt/hNOrUhWdeH5H08wEspSUe4VgDW0VIUr90kCKsuYPqeUdHlkusObIbdSvWr2drfOm
	 QX/5DPiInSnFIHl8AQ383Uc8xM0LxSJrfhKdQ1SmUp4Ru65mNme9/p5Gc6WhOYs2RAk2/
	 JfzxtrZJHNSMVJ0mKmZeVlm54FLxmrvHDKOy/3tzSuKxUVayYYnMB+apFNeaReZD1duA5
	 pTmLsI5V0ishqD4amQFX3qXaZOkY5yqBskFN1oqduvtPO99nLzscj0F6jpPbQVlkfAyCh
	 shkYG/9aNLPZxS9aV9z0AKrUn58+e9zi6Yf0PQdSNcdOlLppzrcf76J1vGmCUDRJTZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=asHkksXryHP8fncE+DgQVjyvFM4/Pmm9WIL38dhPa2I=;
	b=XaAQqWTS8uYgevDjszJVxi4PWicSlBgF+MheJrPFzySbmD2KJCmoC+txf4gj4nrio11+
	 ondms/CjHhMH93vmKXTny+/7PKsrjNrfctaI1nuPGqO0sY+awd+TYSp/zi0ZYnw+wkqFf
	 7eKEyJzjTbrgCwjCB8IU4Nyi3Krxl4ywyeakz9PglCxjLnoJgmYPUE9yPFT4cG7tj7U7m
	 ld6Ji6QxJ5LtQVjFjw9/9dRmRWjYOwUi0ljPkoK6fpQVYc3J1nW2yeOcWEqg5njX9V7Gs
	 4ZT1x18vVIH5DWiRKzgppa9VTpzGdSTWYo1zX4gJLVmp0ipkKbhyWSLvxIkAihy6vZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aLcrDXCU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GF9pzvUW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB18606A31F
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB18606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aLcrDXCU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GF9pzvUW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xuOg1560103
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asHkksXryHP8fncE+DgQVjyvFM4/Pmm9WIL38dhPa2I=; b=aLcrDXCUR1JjXUR6
	pH3vOrOhX9wQJyVTB6yLshBTnlXqgYdWRavOFu08uBmsxajGWGgVWzjWTyUMHSyI
	eiUdK+lTmjUbkBuqYavMS+21sJ22tqqJ26m87E6NXlU2QC2f291Evo6cvJmzQdEn
	Prg//kZBCb8KxrqZHHM1s5/10emrzAlJ6ygkkZgrpx0O5nEygAFW6VjhmawptLPA
	3yETgMyGeTxSloGyYPbJFUFEVD74gwxaAK8MErOatvvRx9UACM+Q1vJSMFZV+oDH
	5PdALBGOrBn0j86PCB3d4A84LzzWKpVGVqZdVJF15NgD5MbReHcPFjIBit3xkp9S
	3D6Cgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahqsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:29:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so46808385a.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661364; x=1793266164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asHkksXryHP8fncE+DgQVjyvFM4/Pmm9WIL38dhPa2I=;
        b=GF9pzvUWBASRRa8LqGY4AL7HJbkl/4i/uB2T8V7Xmhs1iqEtX9xmif0is2P/AMWmdo
         yIqfj2aoUYX8Iec+WSTht4k5sHIXnk/p2Yh0a3Tgzo9Jl0L2ttOH6WCxyX0UOmXvLnhw
         nq9sJ8JMW1Qhk3L08YinGecumKHkwE24kBA50opjeBEAMUa0RNG30TsZhunejc63h6pH
         sEDBap+5RI8kbCvoyMrvwB4ymcCiHMrLeo20D/CBoZV9onQwxYK2NUsOW7TCIsT/0f4V
         jg7JCfoTDKJkUbGP+AIBF7u6+xKOUNg56Y864rFKpa70YoVBCmHPQ750s4jmQJgg+PSR
         pwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661364; x=1793266164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asHkksXryHP8fncE+DgQVjyvFM4/Pmm9WIL38dhPa2I=;
        b=xqIqNSV2Pf30zAOTXujKZBqQizMMSioLsX8FNAPnhJzk/lqqP5CApLDIcoaRuJP8CE
         iT/z3GzUsmaC6CYgDz4Q4qpYmHe8xkVhXtIjXA0nwGE6ocuJCZ567RY4oI05Nek0nvcN
         ivpF4cqLzl+QuZxwgX/Q2lQiYcxOixPfObi/M7EoQFWKJZd4EAF8Mgx3J21L1M9eBeXC
         NgMWo3jUlHzqk+krzL8xEaiOJKVcZVD2IZ3P11WepW1CC3WJVL75Nlr80wpOnvt5ZfOM
         T4lOOjovOvi3znrQ6ASLueJHm6TN0oMZBRqZBB8N93YXcFvlbdT8NsAEXSYW84bDiHj7
         YxBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwsTlLNdqm+lDcAdPJNHS2EBdUmPatGQFiM0mR+AdJgPq5aNCO/aBzXEaRe4ZqlqkMKRr5fF08Lrgl@vger.kernel.org
X-Gm-Message-State: AFq9FYKNbAe+cSawGr02Rt1IbW3lx9So2cp9boTEPCYq/22cvDMhoAKS
	reGZS+G1ZSg1hfQrMtzJyrnnTymg2ZLuI5kToPvlQdUXwQE0ZRID+mxeo8bc8bhpM/X/mUmYQ0F
	2ohoMz1FBgcSH9zE/F09+7vPA2UuzBj9BVD/AeZzrg1ZKW6fRR/7UmpEcwCT8lecV
X-Gm-Gg: AYBFou3yKKZGxxc+pHbONrL6FWHUYM1y3IM1RyGNaoknZGHf05lsjE0Dc7w1tzJCCqC
	PcMDZwfmjUOuJe6oZMObEW0/SnxT1gMh0KDu8mmQn9AMsKqG6LIr3vnUOYMSvsJQOLKKex+1m8T
	U8HzumWBJBoiNbWiAA6MOPDAzJBplZsMH14AzbJMoW6j4OgWPUTNsFLgpthO0ClvzzYHDZjREw5
	gHYlQ4sU+E51RdOVFYVlHOE5QFES68Y+yIOZzPJyk8hhVf0E4ui++rts4aLEDm7+9Axnvh/WeLd
	byxulPqbhoBhQMWlQtu9hucFfz3J5Wh4G3O8iLvCGbVLypTFnq1hk5cVKQYWXA+LzO+41KllK1Q
	Fi8woPUtCPVftCpfdsADhdg==
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr994613285a.3.1792661363784;
        Thu, 22 Oct 2026 02:29:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr994607785a.3.1792661362985;
        Thu, 22 Oct 2026 02:29:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1eecbcsm87380366b.7.2026.10.22.02.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:29:22 -0700 (PDT)
Message-ID: <bed18f22-ee37-450f-8b56-d3f21b85c3cc@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:29:18 +0200
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: add Radxa Dragon Q8B
To: sophon@radxa.com, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com, Daniele Briguglio <hello@superkali.me>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-4-eda11e5dea8b@radxa.com>
 <3bb9a390-3b5e-4321-a25f-77e4f5c88f9a@oss.qualcomm.com>
 <C782C697D7D26A70+05200ff5-c7c6-4425-ad15-67222a2ebacc@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <C782C697D7D26A70+05200ff5-c7c6-4425-ad15-67222a2ebacc@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX427emJWpPbi+
 u28JUaOmVJBiGEA8nrjhMk6zhBUUtZw0WsSQS5fQUf6bcoWJoVDwpaV7ZXn8+C5BvVvmlj6/Mxs
 5AXlZVBo66Vex/VQOR51C3dcgUhDfwta2BIeybeD12FLzRClLDq6XSdHuTJA8CPCjc/XqbqZy75
 rJrOTOtgVkAY39Rsd5JdU8bzZTi186FoRv4zuqLCPe3jKJC9zb2jdNfGQE7b18cJgEqMmL1y4qu
 d3BOA/4UXY0XvNtt4W6p2a0dl5ogos+wECZGAASpi9hXa+wJAZ5GgrMx0nUS/ft1IJ+cZY67pc8
 OBdjpTzeTOs8J09XWRUugipKV9jINOKOJ+q9VbQxVbO1PYEDP7DH9jTRbL7Ib63ZKrEVA322EYT
 lO4ulX9AyDjfNOIFiIJukw6aNBVNdHf4AFr6t3HqITewvtGR7QOpJd7QS9w2t3PG/31p0iaUq+r
 sN8rzJthSmzfnynxm0w==
X-Proofpoint-GUID: nKhZwzY0EL2PbeqsD3l3KDyAPlV4UHwh
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9d774 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=XKtpnFXEKgIDAPG5UdAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: nKhZwzY0EL2PbeqsD3l3KDyAPlV4UHwh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX91Aceai1iG2G
 GhLTEwvkESyZ+SRers3QP2iyxDk1OlrR176D2MZr3GG1BtVH/MtWvjMs5T49Y1fVMpuF1RzQs3M
 RXpBtXubtqEKo6qReBksNcnz+dGOx2k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037

On 10/20/26 11:11 AM, Xilin Wu wrote:
> On 10/20/2026 4:27 PM, Konrad Dybcio wrote:
>> On 10/9/26 9:55 AM, Xilin Wu wrote:
>>> Add initial device tree support for the Radxa Dragon Q8B,
>>> a single-board computer based on the Qualcomm Snapdragon 8cx Gen 3
>>> SC8280XP platform.

[...]

>>> +/* M-key Gen3 x4 */
>>> +&pcie2a {
>>> +    /* Place ECAM and BAR space above 4 GiB to accommodate large BARs. */
>>> +    reg = <0x0 0x01c20000 0x0 0x3000>,
>>> +          <0x0 0x3c000000 0x0 0xf1d>,
>>> +          <0x0 0x3c000f20 0x0 0xa8>,
>>> +          <0x0 0x3c001000 0x0 0x1000>,
>>> +          <0x5 0x00000000 0x0 0x10000000>, /* ECAM config */
>>> +          <0x0 0x01c23000 0x0 0x1000>;
>>> +
>>> +    ranges = /* IO (1 MiB) */
>>> +         <0x01000000 0x0 0x00000000 0x0 0x3c200000 0x0 0x100000>,
>>> +         /* 32-bit non-prefetchable memory (256 MiB) */
>>> +         <0x02000000 0x0 0x40000000 0x5 0x10000000 0x0 0x10000000>,
>>> +         /* 64-bit non-prefetchable memory (3.5 GiB) */
>>> +         <0x03000000 0x5 0x20000000 0x5 0x20000000 0x0 0xe0000000>;
>>
>> Please drop this change on the board side, this is SoC-specific.
>> Likewise for the other ports.
>>
> 
> Ack. Do you think this change can be applied to SoC DTSI?

Yes. I'm not sure about the extended ECAM thing because we seem to have
never moved forward with enabling that (oversight?) but in general:

PCIeN	|	base	|	sz	|
-----------------------------------------
pcie4	| 0x4_0000_0000	| 1024 MiB
pcie3b	| 0x4_4000_0000	| 1024 MiB
pcie3a	| 0x4_8000_0000	| 1024 MiB
pcie2b	| 0x4_c000_0000	| 1024 MiB
pcie2a	| 0x5_0000_0000	| 4096 MiB


>>> +&sdc2 {
>>> +    pinctrl-0 = <&sdc2_default_state>;
>>> +    pinctrl-1 = <&sdc2_sleep_state>;
>>> +    pinctrl-names = "default", "sleep";
>>> +
>>> +    full-pwr-cycle;
>>
>> Hm, is that something that comes from the controller itself? Should
>> we advertise it on other SoCs too?
>>
> 
> It is observed that the boot firmware can leave an inserted SD card in a state that makes the first Linux enumeration fall back to 50 MHz high-speed mode. This property allows the MMC core to fully cycle the controllable card supply after voltage selection so UHS-I voltage switching succeeds reliably.

Got it, maybe let's add a comment

Konrad
