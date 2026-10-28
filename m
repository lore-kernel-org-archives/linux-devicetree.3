Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793163301;
	b=eN0BLyG7jnECoOo0SubtFr0feNfKI4WjSFzllYFREBNPdikU10Khlb5yY501cNDkn1h8
	 1eB97DthUn/QFu9iTEaR1eAT7GMVEG2CskK6Kf5Lfs2S0foSIlVyrKbCUQbFFDa4lH18x
	 oFYFqGKu7crIf+DF07GYuJ8IArh0mJWUTBxfuFcwa7G97e/PQwKgQ3yNnpV3+RTaiPFz0
	 GI7WX5OkDoTYLCVviQTaVGoiX1209OPZC9pU3cmNKYveRPZv/7L6Bwb5Tk6BSeGoBABtJ
	 TJU7MpLQ4NJ0Q0ZjzNn8Eyy2agef8WrjRiBGpQYx8NEIpkBehacmNCSVnL5AM4sjZuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793163301;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3ENjMukqGezBEqDx8E0hhaO96niseWqvsdOzSH3ZOCY=;
	b=xwNLZQ0QSurF0hRAxsHaaXDXNiWOzt5Y6ZgVWVPgCF7xD8Ge5IXwYEhvOkvPo7czV68I
	 bxLYTWLRKfeC0Vy2rdBrcoIiDXBCES4AB60PiXOR11FRN+av3Z6i9NXCDFqwtP0ygMa/J
	 6gHHmdFw6gVKTtbiE9XYC7eWhHbimrwgaNvzBurChC10icz0xZHTmfA1Bw1w19CE3OU3A
	 GckzDcEEJxz5s9gohVENyw4kZ6wYSEV6WSy0wFCcGanxEqKZpzDKchXgFY/u1txA+3PD6
	 CQpMU33n8103FXQJp+Q7hSBNaccsZp3hbcdJ6ofZsbSlxLt0MD7J9gpv5lHLsKvQgkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mfxua5a9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LeOWFQYz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50EC606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 04:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E50EC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mfxua5a9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LeOWFQYz
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PaqO059319
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 04:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ENjMukqGezBEqDx8E0hhaO96niseWqvsdOzSH3ZOCY=; b=Mfxua5a9zWi8i4sd
	omurzAKhHvS0ndcgLcuCsn+7AevgJbXeRvR9pr+nsbFnJZd69SmM6uXk1JqkFdEw
	Q6Lc9gkGtZVA45mKxjr30ejLfFdsDqPlBTX3E0VrEIN7S7Fb3spCPaMeyUFzTFA5
	+2Yg2eDon8AGNuoiSdvCkKRJL0w4SdGBdOqnCzbxW+/G/4gfiW+ZReOtXdAgWYW1
	75FpV7vDbmrcQTQhwg/B/9CNkSMcqaERx8JSs1mj0qKrrSuIUqvCJRerelrXEiJ5
	v2h04vqGq2buw+t9lI/m78bo1l37+3QJcYJcoR2ZVbfPgNPCvPZ0oybPCK3g77sK
	nrT0dw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy672h0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 04:54:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so202915eec.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 21:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793163299; x=1793768099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ENjMukqGezBEqDx8E0hhaO96niseWqvsdOzSH3ZOCY=;
        b=LeOWFQYz8cyHJ6YKLhaetUejud4TD/ni93fFd/BPqF6t6jWwuo+cccvnUIEjDE7awA
         YGcUeLpsU6afNGxan2+XwQDqp6pHOAorabUWVp7ygWClf3gxUyit5sFplJ2r/o3XDCi3
         Wws5itQlav0Gxl8v5Qtnwa50ElGBgtB+eFXo5cmT8Yl62h9Am0bkEuHj1Oi3neGs/xfX
         90Id+hzHlAmf158LFUTzVeBWX+0T7QYcSTkcqpjf5y1/mvlFsuWnhVi7BXGXpLrIMNkM
         a1a9yOTrucZa4JzNI9huI/H77Srg7yv/rAAeSOLmh5ipVmOTf3/bI8pXt5DeEJFY0A1x
         oXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793163299; x=1793768099;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ENjMukqGezBEqDx8E0hhaO96niseWqvsdOzSH3ZOCY=;
        b=wKoqA+dFLvKPheRVszVJA+9SlqcE6+xVot53bfaTZ8BiIIl1NNA4ijQ5F691uBL9i2
         zKgRXUW5/Js4bHcfKml1TyPADK19Av8TZqZ2TqY3Gggh19J5sOi8wdr7ANUfqB/4mdeU
         H6IamydicrHYkvQ4RkzeP+maqryGhafei6ffjXy5JiUPn6HdEXE52zL2nzrICH1pKk5l
         mMaZ1aqemk0Cn9mTnIUoeKW5Uy4gWWPmWxfeWyG/g8OKLc0k9lq1MFDcd/iVV+/m6uhr
         /BkseS/fmOdL3C4teKfxBxbqohLCTpiIATwNXn7Y4JdGkg8s4q9gxCWFqxi0we72SL22
         88Pw==
X-Forwarded-Encrypted: i=1; AKwUvByX9NbvLviEDKID+PpZsx25nv/3db+M2zaMLWDXTVPFfmTSfitTAkQ9Rg7AnlQldBTVpmMAXmXbl4BB@vger.kernel.org
X-Gm-Message-State: AFq9FYIpgmWSzY9HcCV4ZDU6DtNsbbHlYT7xgt+u69GSGom9XmZC1KaB
	8a/oV7XE5rqK+8UjsdJ+bkBIpn3+RZYrd1peS/7QWHL8iyhhAwc9678lBfVbbhOUEdYEn5k9eeC
	5iBsyfkMnYTbHps/9Bx88B/g8XDGtpocoW1QUypEH+f4A5AYvOOW2ccCQRnclfDQk
X-Gm-Gg: AYBFou12DUswl6M1iU39F/VFvQh2GXUT6BHOtpPPBdlfyRmhOMjThxHvgFzejrvSJqk
	UupAlSXdrJ0B3BQelcO45nwAp2pKFVZ4wdpKTdR9WZuMTDKbsfmSCWENsIOMz6RgzglLFPpdZeo
	Kw7cyaaVDs5WNss5quYPU4qwnWiPqrdbTvhywenUFPqLpIlGInCDzv1Bfuud0Wh8ov7lEbQ2/6F
	FW+z8TjP5UPAJo6BfXNieyRuJE2SuTrmgrS/3mrOWKZotIj7/Oxa0pHCvG4DQIk3mgSyhEkXr9h
	d1XuQILbZy/onYm7knwqGnSd28PT/affZE5inJhxKbi9HLKVlfMc7ZIEnhaJvMjIEInBFlWeI8x
	AU7PklE9l58PzM8RqU0RNwbOoV1r8Q1V8upAJuPS2ORkle/nmXNs/zG3R9pVTEkeaMofCsEWK4U
	o3
X-Received: by 2002:a05:7301:f05:b0:369:f126:9ce2 with SMTP id 5a478bee46e88-36a204d6e15mr1983712eec.41.1793163298733;
        Tue, 27 Oct 2026 21:54:58 -0700 (PDT)
X-Received: by 2002:a05:7301:f05:b0:369:f126:9ce2 with SMTP id 5a478bee46e88-36a204d6e15mr1983670eec.41.1793163298111;
        Tue, 27 Oct 2026 21:54:58 -0700 (PDT)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2396276asm2031284eec.22.2026.10.27.21.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 21:54:57 -0700 (PDT)
Message-ID: <cf069a42-4787-4704-8aa2-e2035d6bf593@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 10:24:38 +0530
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
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] dt-bindings: ptp: Document the TSCSS on Qualcomm
 Lemans and Monaco SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
 <20260727-tscss-v1-1-beed14e72510@oss.qualcomm.com>
 <02792987-7ad8-4a6b-81ad-559c63174bb0@kernel.org>
 <640acacb-1704-4ee6-aa34-d6be3b30b44b@oss.qualcomm.com>
 <f5aa313d-0e23-41fa-b59b-9388839b2525@kernel.org>
 <7f6839fb-59b0-4f6d-a3f8-7579f6d40857@oss.qualcomm.com>
 <aa76425c-0579-42c2-832d-cc767703f3f5@kernel.org>
 <237b2f74-4a9b-4df2-a0fe-a7b783ed5267@oss.qualcomm.com>
 <8fdc66b2-6047-4f3d-932f-1e6883e370bc@kernel.org>
Content-Language: en-US
In-Reply-To: <8fdc66b2-6047-4f3d-932f-1e6883e370bc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ELnDWQP9kIgkfJgAfNh_vPKSAfCA0Qbz
X-Authority-Analysis: v=2.4 cv=QvfLTlyd c=1 sm=1 tr=0 ts=6ae18023 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bmQgafSgubap5fUq5zoA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAxOSBTYWx0ZWRfX8iPiNNe5I3k6
 f/f0SWcy5A70E0ALBRe8V8+R/iqMWi613/bwodxQ9glKb8YL2hwVuj7wmtU9fdRNJUj5jsZjdhz
 uADMsapzEfO6af7erXJPmky1cqlUwac=
X-Proofpoint-GUID: ELnDWQP9kIgkfJgAfNh_vPKSAfCA0Qbz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAxOSBTYWx0ZWRfXwdpVn64NErOz
 UGQqWtVFn9/Sd3Cd3taEI0LzGqIB6LFtjYtwmNgpv2Ia95efZngDKsb2tUJp8xBa2bBAgXz7uTf
 I8cqKqEEI8ETKmDqf43yD//5imad9TFbLoCKNd193ZeVnW+S9w9058U4euWNUpR3SJrl2vML189
 nxOMOlQB3WH74Qo7WPVQ71qmc7IWqc0pz+MV/Ii52YKkOdjsGGJUrGaPMOwZumWZMB9LJCSajrf
 d6hHJVdqy3ZxGCbtNY7jZhae5HpYQyhc+VPXjXvhJLhQn+2odniYFXY9J4RAZMGEgWbBTaBklLv
 CR69EN15+B4Gak6b7BHnJw/OLpRh1tIEonyQXksT/Ua96mz8uRkkDHLhnkb2P7V3iGBL+dx1Ih7
 awb1JG1EjIb5w7RaOhr0J7hTL00Cwf8q59XTGn1WKJdbH4Ss2mx7nNNv21YSAMhtoyo0SoAeMzY
 biVoeyMZDenRz8dLJtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280019



On 27-10-2026 08:49 pm, Krzysztof Kozlowski wrote:
> On 26/10/2026 13:55, Imran Shaik wrote:
>>>
>>>>
>>>> On checking further, I found that our etu-slice sub node deviates from
>>>> that example, since we don't have a compatible string for the sub node.
>>>>
>>>> Please let me know if we should move the pinctrl properties under the
>>>> tscss node with per-slice names, or instead keep them under the
>>>> etu-slice sub node and add a compatible there.
>>>
>>> etu-slice does not feel like device at all unfortunately. I see only
>>> address space, so one resource, which might be enough but lack of
>>> description for the subnode is not helping. I have doubts that separate
>>> subnodes should be there in the first place, but if they stay, describe
>>> the child node fully - what sort of device it is. Just because there is
>>> independent timestamping counter does not make it separate device, just
>>> like independent interrupt in GIC is not itself an independent device.
>>>
>>
>> The ETU is an independent hardware block within TSCSS that captures/
> 
> How is it independent? I see no resources, except address space. A
> channel of some device does not mean it is a separate device.
> 

Sure, got it.

> 
>> snapshots the TSC timestamp in response to an external hardware
>> event trigger, for each slice individually. Hence the subnodes approach
>> was followed and will capture these details in the description as well.
>>
>> If we drop the subnodes and add everything into the parent TSCSS node
>> instead, then all the arrays here must stay index aligned as per slice
>> mapping. Example DTS node looks like this (QDU1000, 3 slices):
>>
>> ptp@1da0000 {
>> 	compatible = "qcom,qdu1000-tscss";
>> 	reg = <0x0 0x01da0000 0x0 0x2000>,
>> 	      <0x0 0x01db0000 0x0 0x10000>;
>> 	reg-names = "tsc", "etu";
>> 	
>> 	...
>>
>> 	interrupts = <GIC_SPI 329 IRQ_TYPE_EDGE_RISING>,
>> 		     <GIC_SPI 333 IRQ_TYPE_EDGE_RISING>,
>> 		     <GIC_SPI 334 IRQ_TYPE_EDGE_RISING>;
>> 	interrupt-names = "slice1", "slice5", "slice6";
>> 	
>> 	pinctrl-0 = <&tod_pps>;
>> 	pinctrl-1 = <&gps_pps>;
>> 	pinctrl-2 = <&hardsync_pps>;
>> 	pinctrl-names = "slice1", "slice5", "slice6";
>> 	
>> 	qcom,etu-slice = <1 5 6>;
>> 	qcom,etu-event-sel = <1 3 2>;
> 
> Why this is not continuous? The slices are all fixed in the hardware. I
> don't get why do you list some of them.
> 

The slices are fixed and contiguous in hardware (e.g. QDU1000 has 16 ETU
slices, 0-15), and accordingly will describe the bindings. But based on
vendor/target board requirements, the slice configuration can use all 16
or only a few, and might not be continuous.

If the board requirement is to get the external hardware event sourced
via certain GPIOs based on the availability, then accordingly, the ETU
slice and respective event sel needs to be configured. In the example,
slice 1, 5 and 6 are used to route TOD PPS, GPS PPS and hardsync PPS
pins respectively on QDU1000 SoC, and the remaining slices are not used.

Thanks,
Imran
