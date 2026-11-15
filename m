Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776661;
	b=sQIsSr52T9xbgYVMre5n1GaotfZh9/44hN5ksywqkNW73JERMDgTyJWjUfCAnkF66Fhx
	 tbH5C+idSKzpp8uoKOjLyqL/lDhc+PBwNPD2mp2NzEBZ/VjqNRuv3k/JS2+enT1KZnhFp
	 T8RTHQBOaO17as3+66OVx0fJueGi52RjmaMuclbfw5gDR14/pP4lsSHoEbbImHK4+SZCf
	 5oKETCpM8qSv2kawZwKJaalqBhUmtI67pr6Gge9VeGqGVtrAAGDNGZwOby5fGE72HhE50
	 YW8qiKrJ6fj113l6KzyzoHUzo/+SrkThFnWJ+4wPYJp3SJuvV5wHQ46fT+4XtGIJ2lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776661;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IvJv4G1qdzEGifoDcuLnLQ8T7dGYEN5NE+7M7bvYeec=;
	b=0enrCsU4q9J3qRDVSF+5rASNwz80gnsPQyLooAA5//bgx+KRWwb/FNdCXC6Q/IS7elTG
	 S6QdyfCBMt6smJ7N5OmE1+tvxQhQDaMZsQYt+9kH3htSVQY1fMcwmhFVqBrK9bjheht0a
	 KIJO41pYOUlv9lZZwbidmSJe/fRUSrDKBAMTAC7zJqEOE57NJUp8H7+tMpcljIBBJYTQs
	 C/ZwdQG8HXk8yenE0RMlmvSzmZUd/q5TNpdKyBPiXrW+qdDgFo9u/mYaBoxb8VbP64+BX
	 biy/SBAnjww3t2uexb2NMw1Tw0Rc7H1iuExMclI4R1JHnT6DqPkTOXc1hJDRXBrEvCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C2oDkk2g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yl3yEuIl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AF2606A32C
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29AF2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C2oDkk2g;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yl3yEuIl
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIQTN54142983
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvJv4G1qdzEGifoDcuLnLQ8T7dGYEN5NE+7M7bvYeec=; b=C2oDkk2gmKK8PAXn
	8374kca06ubl4FSAvnw0K4XeMdi4I7knBXHSRehGGam8wtB6gxjQxkK2G5TOMvS/
	7Vz7gOb8zxgOHzEPdR69CbJml6LYh4/sA5cyNC798+sIxiGMMySinjNXjS1eZNm8
	vH0of3vSOgl2uV5xciFigFpv8sv4kkAJSK88CRosUE5Bvof56GiMKa5Dj3GvSViS
	qp6ct0TQIksHxAYYU2nbA8M2XRWAXLSRadwbyrZE772JxE+WQRbQXYvsGAamPBm6
	cPK6J3FFfFtpgchb1zqQirUesvTF9eRNUmkKBBFWkR0bL5muKrqotdwniniucpSB
	/GY/ig==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmakqhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 21:04:19 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso883219e0c.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 13:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776658; x=1795381458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvJv4G1qdzEGifoDcuLnLQ8T7dGYEN5NE+7M7bvYeec=;
        b=Yl3yEuIlskCdCWo4P2xJuvmNm88HkVnHL4cqGzYf0fGlIeEUIlhfahrFgESVd5JRtU
         DHWIEGWBm+aCjwXA2LQ5J8PfuoQmbNYTGGcRlG8DCEY8EtoYkHzIRUlRvxyUKwLVuplC
         6aKeE1Sg4sOpT5Bevb3aRKcZVAymvdRHLqWLSjoexkD5rFrcQ9GI4J+qcMihNJg3e4fZ
         6ZRYji/H487DJTJwxu7vED3W/BRq7xijyX2XUqN5nWq7rVzXLQTPugKFLlMxX1umdwCk
         dUL4Beu3IUBh3EAqTVoS8EflYtmqQkrfpw/KHYUv6Sr+Ev5Ad7COeaeJFRtTsxvpZgeH
         QUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776658; x=1795381458;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvJv4G1qdzEGifoDcuLnLQ8T7dGYEN5NE+7M7bvYeec=;
        b=f6VpG7awXEKww770oVX+QJK/Y/3HW1m6nnNSdQcnQDcsgSMcbioAnMwdwMUlNQVAXh
         KmK/zmy8SEOjsVpFvhf/EvKzzfqBh/nGZHehwN69ALAV8VO8Pq/jiWdjCvox79tejFek
         2txiAdcAvr45EoPHC2W8OHUvvQ258fvu6AtbUfTJ9dRb5fb6Ule6uGq1gt8l0a4kWfBG
         nLcPd5PrkjVRDYvlL8xfzEYKUiZ4+aJy2t5odwtSxEYjgUnC+Zl1oLVzUt/Nj82kcBzC
         2uIWCGywFRFjyY6/XD3d2YdYg6O4sm57OBbKlaOx9eR7ClUxNw52vaaLZkhQcALkW09b
         6qdw==
X-Forwarded-Encrypted: i=1; AL+hErEsSZtIcqEU/6bZEy0CkaXo+obKwllKBq23Ic0rj/ftogiP/iLxlBZCi7oP7+NRCc34xOubNb1HKWgs@vger.kernel.org
X-Gm-Message-State: APuU4Z8vSi67ctOSSgszKgEEhFMbZgnSxT4WRbaRgu6aKhDcsjC65CJm
	sjepT7lEj+P4dKmbe04Za0Rdp0PltC6omqfkTNfsuRDtyBVXaw9pSE3Bb0i5YYGodoKFrK2wEDk
	QL5gqesC6dDO81iWvA+qiyvoNBRLxF5WWzzoXak9V7+RxHpK4BLOqmVdypbGm8LQx
X-Gm-Gg: AYBFou2f/18Jm4iahpZkpMW+UxuIsRC2SK4y60bwYu4ZobSxKEg1/orYkee/nQMK0W2
	eCkyOmeU7RA40hy2jNxCJSIwR7BlXaJuS2l2qbHJnLMzwsm456BUNLRmbVRMm6pSdgo3Ur+jtZM
	5jxnGG7+4uGj2RRsTVHAV0u2iCocMzItPn7ySfB2QnsftNCum5ZEAxP7w0u0FdPVm5y4+jSWf1A
	vmSPvxXwXRkayE3aVQiHyCYhqj7aoifgll5VLEj3CHxMWendDyC874MpjQfT0zvdM3y6r/dUb6y
	99A5pM32YKVykN1SyIMRzsHJKZ5wOcw9DG/9ktihtkfSB/vledZMqHl0cunb3CtyXLTa5Xe8o0f
	7ALTf4sC5cY2aVV5n6b03KDfgoG/AQfbabvqY96TDNHqkKkrMX3GpaMAI+FctdgD9RfW2Km/GxF
	8n
X-Received: by 2002:a05:6102:508d:b0:7c0:1d48:b2a2 with SMTP id ada2fe7eead31-7d64d8e0df8mr2587394137.31.1794776658360;
        Sun, 15 Nov 2026 13:04:18 -0800 (PST)
X-Received: by 2002:a05:6102:508d:b0:7c0:1d48:b2a2 with SMTP id ada2fe7eead31-7d64d8e0df8mr2587390137.31.1794776657877;
        Sun, 15 Nov 2026 13:04:17 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:17 -0800 (PST)
Message-ID: <31e8d411-0861-40cd-81f2-6d48ac99f95f@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:16 +0000
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
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [RFC PATCH 01/23] ASoC: soc-core: allow default ch_maps on links
 with more than 8 DAIs
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-2-srinivas.kandagatla@oss.qualcomm.com>
 <179476416981.140154.14343442697827559163.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179476416981.140154.14343442697827559163.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MJjgTV-4LcgNGlclf6l_I4PgyE_vMWKl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX1JNv1oe9yfBx
 DqFt+7tZyC2qwKJyrrpPJWc3lOs9ZNWJo+57EsJGATG6EBn3hQNKRCWZ/W99+DL9mEKXiWT4rPi
 ytW6HPZDN9wFRkJuVyG7IOZsVM5Zo98BlvuCbo8gBY2k1P0A4us9v0xDg09lGDQL4Dj9dJcL2WZ
 HDoyLb3IddcLjGxVcC9hEAlslyjtDltEV+0FTzKDNqzFOx97uqSjlcRd0540vEwv4d4tuDLCZbD
 sSeLaOu705HrMhZmRNo0wwHHfSTGKwNJOsqLNCmmo9gYa/f6PI5mbirFYFkc1iDVuYojX+vHsK+
 ZR8eTy/kaeZalcj8Uz40hAyl+sTdPQyBWG6GqYcYoJdDVjk3vJDVqIHhNzEULzm4qaQjFX4udLl
 pxDw5ESAg4U/lkYrJCDq28qJvRWG9iLVb39L3d+eCbyZPF7tCDJuvnzMgAYspa+ioVkcj/x45W6
 8E2WSCsq+QHFS6T2Ezg==
X-Authority-Analysis: v=2.4 cv=NdhzRGD4 c=1 sm=1 tr=0 ts=6afa1e53 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=3AhHibbqxz6MnhjUMnIA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: MJjgTV-4LcgNGlclf6l_I4PgyE_vMWKl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfXz2wVhXFvoyVI
 P4phhz8l42tA1YtC2cKAcWqwzdNxxuXMCO9+f7Jp0sHF7RZfTkaZ/RX3hGwY5Td/Uq/nysdxz2a
 wZl0g1UxJW9bllhntpODfeOBNMuIxpA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> snd_soc_compensate_channel_connection_map() builds the default channel
>> map from static 8-entry arrays and fails the card for links with more
>> DAIs. A speaker protection link carrying both the amplifier and the V/I
>> sense codec DAIs of four speakers has about sixteen.
>>
>> Keep the static arrays for links that fit, and allocate a per-link map
>> with the same 1:1, 1:N or N:1 layout for those that do not.
> 
>> @@ -915,20 +915,40 @@ static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
> 
>> +	if (dai_link->num_cpus   <= MAX_DEFAULT_CH_MAP_SIZE &&
>> +	    dai_link->num_codecs <= MAX_DEFAULT_CH_MAP_SIZE) {
> 
>> +	} else {
>> +		int num_maps = max(dai_link->num_cpus, dai_link->num_codecs);
>> +		ch_maps = devm_kcalloc(card->dev, num_maps, sizeof(*ch_maps),
> 
> This is a dynamic allocation bound to the card's device but it ends up
> in the dai link which might be stored as static data in the machine
> driver and get reused on a rebind.

I missed that, am thinking of moving away from static entires and make
everything dyamic and add  devm_action should set the ch_maps to NULL
which will make sure snd_soc_compensate_channel_connection_map gets
reallocated on rebind. This also makes it more consistent with the way
machine drivers allocate ch_maps too.

--srini


> 

