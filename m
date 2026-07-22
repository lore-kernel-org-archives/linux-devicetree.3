Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9409437470
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705470; cv=none; b=tZ8udwyKnNHDbkg4+5ooZAj22o1Ib6UBtCcvxHqzdoCYpYE+wlTNDjxO9XODpd4fBnhdCWnN9CEPVKfzgcSVFuyy/Ul9QJARRFZv6uFxVyW54bCdvZ/tdA9WLzrD8rlg7afnyosghSy3h58WHTlniRLHFGrl8YI1IpmxgWAf2nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705470; c=relaxed/simple;
	bh=OEIT74Vu3djDpUgiLBH7CN/sACvVBzyZfm9IfQMM1Go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVISmpginGgbloYajlR8QK9rPFnLbfGMoawd6Hn3sZGhinkDBwbKYrg1jmDBx+3M1zrAp0pmsGM00PZlK3/98dMpKYdCM106RkavZcaKR+86iFq0vXNixUP6mYsFXVRrFmwcAarZy6vQLGcw14i5TbhTi5J+2qdOr3g3oRTcnp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyQgXHL7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJ3wjU4o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyQgXHL7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJ3wjU4o"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M54YXl3474861
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mZCkQlryjLFxlbdWpHrBsHAibzLuiocU9LXOAa/hg34=; b=WyQgXHL7tQnO1jJi
	+snBisz+gpNweu6KF/zze7rAkg6WLG1hkEDJD0PEIlfkrRtiQ/HvPdyacgucv0c+
	/rrKr30Tw94EPVq2BeHv0NPNxqYbOY9DrJyne+vPBNwoPA77tU8bHBNmjoBd3Jal
	aHRawEqZYC6svEIfukdgycTKUr+M5gh6Qw7VquGUhMT6YLoFiny4ypi6fxgyX+uZ
	MXII+s78FALlOVjHgyKzNcHQsa0sHlR9BvTCr93A1p2T+J0gk1F2cvlIkmu8z8jE
	B5ico8gEqPK5mXfATNUrpRwRzW2SYjA69oMry2APe4Hn6WUBxVx35yILue3jR8Um
	oo5s6A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fturt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:31:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc86a9ef97so261764515ad.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 00:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784705465; x=1785310265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZCkQlryjLFxlbdWpHrBsHAibzLuiocU9LXOAa/hg34=;
        b=CJ3wjU4oh6aCikubCqxrlf51w9PbphMozjEl+xPB6ap0FoW+h1yKC+o5U3D7Lq25XW
         w/ZAQTilfjLoQ5K4rhTaUBFBbCcCCx5MT5rC7I1S8ixiOPuJukryR+lI2xrL9XG7d2Ef
         Z2H/LOFUtzgPdvhrAif/SSmhI1+zP6k7q0GCOOFoDb0bOJnKO1TTQud7RrE/1QBUcLuP
         tVwBgl7s47EBw61hId9gr0LdCkAh0Tdhi6nAOJy3WeYXqdQRL/bpa9Orz0K2nzdelZ71
         wgI0XRrI1bF9OQn1AnRTRUV45wGTsa1gA19sE+4fJ0v6P43R3qmw6T/xCtbxZZWtpTpx
         a1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784705465; x=1785310265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZCkQlryjLFxlbdWpHrBsHAibzLuiocU9LXOAa/hg34=;
        b=QtUsz9hiFHCj+m/ueirU20kW0uIA+Uw9quhXcWiY0cMuW+gr/M/MKsuBJgoRgBgO8M
         o6QL/imnp5LADbobm+pMk/h+BX2mKJifkoOZelknVQCcyxayViA+hGcY5NraXQRRTSAM
         8T4GSY5UmJX9ixdv9lKSgn4egswUFNYy4UKUAET/lQLapz2jvut/hd0QPf7sdK1eg3qn
         R0wFa8E49Z1/oJ0lpSosyAHvJEphl8R8bezLCy68jK9jtSkbEo65ViIdSYmEZbepQSAy
         yqB94TGRb3dZddthvjA/FLqCnSqlph9ctaEjUc9bv5K2XIuiZ/ga7GJNwfdhOdn3U09i
         GX4w==
X-Forwarded-Encrypted: i=1; AHgh+Roq0Yyal3q2GUH3KHAMJfpp99nlMBL6ktGPMU7sfAj+v7yNST4FsuW58OJLS/BpwHlz/9Oq7BCQCO3g@vger.kernel.org
X-Gm-Message-State: AOJu0YySveKMXT1kgNA//uL8EKVQE2Oq9nAtdiuaUSHp7EgpEhvt7yXT
	D3DAcG8+sM4EA8Ll4WHP6mVmq8fPoPPUBlHeNaZLAwocg+V2GYII0FIEYZaG4WNNduDR7aVT9bS
	O/IWUhhIbfeL3Z2m6PKrtwi/g1Vp7yHjFIXvC9Z5df/4DPbGw67RRhX9mz8qSmals
X-Gm-Gg: AR+sD13PJkt/0Pc7PoEQliRaX9UMB/UBDuDEzFLt8O1ChauJxWcKrROboAU0GhatkeQ
	h5XH2j7Pu0z2MiHLa0lMAJDt0ecwE2StDolA0bnLCdv02E0lSwUVuGR+ABqEPVc4v66rQl1mY5V
	ujjRyMSnRQrqA3t8DDQGPy/s9Pk7fvWmEqolDreQ13puBuzMzdgmyFxg8XsP98PNktt3TNi+WlK
	5MYyPIZKopuFMPKS1gC0sFjVyYUAUm4r5UeupU5+NY+yQRAfawgrwCWSmirMypYKHvPHc02QJ61
	Lo+MWCu39TwsWphW24lnBxhlp3LmUMOlR/93yDXfkJbpcoW/MWm9t8IyClLAk+7T74EvNLs/hBx
	hp2/WfMU8SFjIIlEviAFySJJkfsE=
X-Received: by 2002:a17:903:3c4e:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2cf3489a83cmr238576815ad.20.1784705465039;
        Wed, 22 Jul 2026 00:31:05 -0700 (PDT)
X-Received: by 2002:a17:903:3c4e:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2cf3489a83cmr238576545ad.20.1784705464619;
        Wed, 22 Jul 2026 00:31:04 -0700 (PDT)
Received: from [10.218.37.104] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd76c4sm10186475ad.23.2026.07.22.00.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 00:31:04 -0700 (PDT)
Message-ID: <24cac124-7d04-400d-83df-bdcecdddb7de@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 13:00:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card
 support with WSA8845 and DMIC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260713121816.2728888-1-ravi.hothi@oss.qualcomm.com>
 <20260713121816.2728888-3-ravi.hothi@oss.qualcomm.com>
 <8dba00d9-65c5-4891-95c1-67f55664aa79@oss.qualcomm.com>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <8dba00d9-65c5-4891-95c1-67f55664aa79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MAW4nocuFzpVdV9xUr_BJudzcz5olA6s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2OCBTYWx0ZWRfX5tVoxKO98BP+
 VQoYeTEyiohDwsi9mMSCGRK7JgUbtUUdvbYsj5h3cf0L+aADqPD3bExqYiaVuzeYrVLbPm/5iNf
 dBN5RroPTDojgTjkwyiB09eLEDoldo2g+mmFIuEmeenDDzCmwK/0PS7EAjuBFsyJR9dN1zZCqUe
 AJwGuNJsNpHh/HbJQd2RjBb7mkW3TL85pbcsqpGz9OZFOjGzXJ/Lbhg9uRlqP4dvAqG5PnVKT5C
 9/0UC7UeKQKUiuedbqJki32QYdXyanco+Nz+0v0BMl3+9INHfk0csXwuyNwGmPGEaR4if9OvpYk
 eGVyaYKiabw9E93egfOqO6BonEh2ARixHssLKqpaKrVZclHMdAKEQj6zyeWlwQSus16jHUhs+JZ
 ZszJfmoDrsRYkoctFOnRAlGBBxI5LYBnj5LuC+bw9qUzR+lb2TBTaMNRTHgWinRHCcys86vc/Yu
 bW5z9yZBb0G2bn3hOCw==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a6071b9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gFSmUBiVzdt7fEAL5AoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: MAW4nocuFzpVdV9xUr_BJudzcz5olA6s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2OCBTYWx0ZWRfXw5I6ONpQw5LC
 3udZpHozeWLYCNK96B0/ofTrL/6/1of3MTzpMXwD7yu30Dwmm6YGlzK9QXg0ElVDkKEiK3LK2qz
 AavJdb3u6YTS7SVlzWKiiJNKr7um204=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220068



On 7/17/2026 1:59 PM, Konrad Dybcio wrote:
> On 7/13/26 2:18 PM, Ravi Hothi wrote:
>> Enable the sound card on the Eliza CQS EVK platform, including the
>> WSA8845 external speaker path and DMIC microphone capture via VA macro.
>>
>> Enable the required LPASS WSA macro, VA macro and SoundWire controller
>> along with the necessary pinctrl configurations for DMIC and WSA
>> SoundWire interfaces.
>>
>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	sound {
>> +		compatible = "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
>> +		model = "eliza-cqs-evk";
> 
> Is there a reason only the CQS EVK gets audio support?
> i.e. is this setup not common across all the EVKs?

Currently we only have the CQS EVK upstream. Future EVK variants may 
have a different audio codec or configuration, so we are adding audio 
support specific to the CQS EVK for now.

Thanks,
Ravi Hothi

>> +
>> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
>> +				"SpkrRight IN", "WSA_SPK2 OUT",
>> +				"VA DMIC0", "vdd-micb",
>> +				"VA DMIC1", "vdd-micb",
>> +				"VA DMIC2", "vdd-micb",
>> +				"VA DMIC3", "vdd-micb",
>> +				"VA DMIC4", "vdd-micb",
>> +				"VA DMIC5", "vdd-micb",
>> +				"VA DMIC6", "vdd-micb",
>> +				"VA DMIC7", "vdd-micb";
> 
> Are there actually 8 DMICs?

Yes, there are 8 DMICs

Thanks,
Ravi Hothi

> 
>> +
>> +		va-dai-link {
>> +			link-name = "VA Capture";
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
>> +			};
>> +
>> +			codec {
> 
> 'co'dec < 'cp'u

ACK, Will update in next version.

Thanks,
Ravi Hothi

> 
> [...]
> 
>> +	dmic_eldo: regulator-dmic-eldo {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "dmic-eldo";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		gpio = <&pm7550_gpios 8 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +		vin-supply = <&vreg_bob>;
>> +		regulator-boot-on;
> 
> Is it really boot-on?

Good catch, regulator-boot-on is not needed here.
Will fix in the next version.

Thanks,
Ravi Hothi

> 
>> +	};
>> +};
>> +
>> +&tlmm {
> 
> Label references should be sorted alphabetically

ACK, Will update in next version.

Thanks,
Ravi Hothi

> 
>> +	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
>> +		pins = "gpio59";
>> +		function = "gpio";
>> +		drive-strength = <16>;
>> +		bias-disable;
>> +		output-low;
> 
> TLMM pins should not assert output state in the pinconf, the driver will
> take care of that through the GPIOD APIs

ACK, Will update in next version.

Thanks,
Ravi Hothi

> 
> On a note, these normally go through LPASS_TLMM, but I'm going to guess
> these pins are not muxable to ADSP?
> 

No, these GPIOs are not muxable to ADSP/LPASS on eliza. The WSA8845 SD_N 
lines are connected to main TLMM GPIOs on this board, not LPASS TLMM.

Thanks,
Ravi Hothi

> Konrad

