Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEF03B42C2
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909554; cv=none; b=DeuzTMqEHAeKL/I6Co3HRvZwNiua48FJxh5R76PIKP8JhrP4leKzS/sS3V5HCttEZVgJwhwiXZ7EWYWXma2R52GN8IaRA8kkxcXiy0pFLM+m3tLfl8VMYoiTZi9uqda4FAI5gTyK0xTlKJMyuF92X3NFkW7h2WGu85YsefQQmpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909554; c=relaxed/simple;
	bh=OQYFlo/wvw+97rYQB/1SMQpN/6mX0nd5l7DZmNGPrec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ppdYFIc+so5r2sTfeHZj1xBWVHfIxtLWiNQB0eVuanDsU5m5GPFikf7t4BNTdnQ2czt3eLZkeIvGesog2GO7M9XCihshDMG1ssRe9OVkRn1S6Mx3Bh9ij9vTfaOIUXjB+KT4Pu8mDSLeJYfz1GW3lZfld+dgLezP2sQKJXveivM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTlG9WNl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NP/aKx+f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTlG9WNl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NP/aKx+f"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65892EWY2677592
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 09:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sSSvva9xyhbhw+Xk4pnwYk8T29hV+yUkpgxYP1wpWEs=; b=jTlG9WNl7JLKg+Fy
	bUqRmnmhWFVi5PBAz47hJ81GdasdN2AbDuyOZZ9MDe85ZPVC0tbD6zTMx56S02p/
	TaAKmX4lTtgPpc/l5F9IKBJFGMU8anCwQfEL23qQRKNwE92pNriR+YICD7uh1uvN
	w/37ks/smnTCDgJSQMIdRJtoLGMoRKt7mBSXpW7Vd2ApRx03m5gd/nDj5EQ9YyOu
	/ZcrIUJU1QlDLyM0tEZ/VCtApj1lfrdgOsI23+X6659790WiahjornmxuqfwekP7
	LD6rpidN7ZXcRDrm28E1zdwCssmV0ZXM/92a1KButn5ylOjFBTtoj5oTLY+pyTz1
	hU7BWg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkr0my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 09:05:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914b9d0162aso64636085a.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780909551; x=1781514351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSSvva9xyhbhw+Xk4pnwYk8T29hV+yUkpgxYP1wpWEs=;
        b=NP/aKx+fjHXVWagWmKSXzZWcDwVoxrasXmaEBbvWdr6GK3cgvwJvnTrkz9ppt82XQ1
         uzCBXEOEqeDY/wGflX63/ExhNb0TW7kZZblHilDlWiM7nUcLI4IJN8k1z6ylnERTz/OP
         H/DNbNo+Z6g+0xxR4RoIo3BRzWn/USnznB2N5yMngTxeLs7fZfX6S1oNen4Oa14Voyos
         RL/0vZKBvyUf235qLw5HJqfrWH+xA7cDiDYXe9o+Oe9P87pdPhrIe767nDFuU9znNMvP
         EB2E8awzH9a03HAXcw3SANyrVIOQRmIsCDfdaqYjY/j0RoufnnuhlTuR4guqLuVFfwZt
         Cyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780909551; x=1781514351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSSvva9xyhbhw+Xk4pnwYk8T29hV+yUkpgxYP1wpWEs=;
        b=Yfayf7mdb06AV3wzJfGt5mcd1SEzt0NR+/1SpD2i8+GYZu2FAP+k2iuqIa0LskAkhZ
         mPfxLn2P6pANRdKsmCv4E23vthCtRUbwUzVMxu80ZtI5NfYTk8aJI6AcuSisGe64UZpk
         XlvxdOsEDmz7WQ1pZzGyFIeKBeylzcRt3I/j9/CDrYq4O3vNsBrzrzj1xrTADc0k6TtQ
         02T3gNqWWfAXzNl6daTFAQ/LW56CR/77DD+l4pblKph7UTbfmhjfV7AXvRX36Wa9ufoR
         IkDJFxQUNCNM16xLG3YGl944Z5HZudXWDmt24eBb5XXazFfXyy0XfDKK0/pp7ouxRWMv
         YF/A==
X-Forwarded-Encrypted: i=1; AFNElJ/h6JvFWFpyPgrcMhjUk0iUW8Q7UOYASoDLZ0zeP4q+gaWpS0Dun3awN5jk4VYyxSu2dayjzP1hRNOf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4syVJ2TiTW+TPib1hO60sE3BFfWLOHolw4sOOJYh66PKJuJU0
	dHWRcoWB5Iy5ugtPI3eu6ygB+7rFH5QJbeQL3HcaZWnuqGp+nzPdKQjjSMUbx/HIH/ZX/QDuB99
	2IaLQJj8viWYu86pBOH0DafmpqmbWalIVqeDF3Yxy01am3pVU1adUv7KzyFHcJ0sm
X-Gm-Gg: Acq92OFdZWX2vywHO7VIspeOiXgr6APWTSyls9QHuQ/HV1TGiqyprVdPwGfhZoc/TkG
	HzFKDH2DJWGkMX3vuqNL9SEKtfG4BTsYT5Ne5fJLTsI8aaqZS7aqiIGM7sbDW6cevyv5oBW4qv2
	yTwTWbhvGw/c+YdHcxcudqTAxcoF85tdZX701yM7QH8Nv4fBNIiTwnoKct0XzHYXvcChOGGpbhg
	NkMiAS5/s/znEDzYn6cvpH3qOrFSDEnvM+n/ZqT8bCr9S08QHQJs2KCVlpJANpHu9768LQ5oHtt
	4AQxhhtKF6T8dFHNlcMmDMqTGFH9X9K1tYnmOD3r6Q79k2eS9G735CnBOfl5obaK21iAlSUa4jV
	w+KYxRjFK/mSlHJ2cp7joo62sFxuajFyNoFGoSzWBvG2v0w3Tw5gCLSff
X-Received: by 2002:a05:620a:6084:b0:915:7c1a:138c with SMTP id af79cd13be357-915a9d5fd58mr1326855985a.4.1780909551191;
        Mon, 08 Jun 2026 02:05:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:915:7c1a:138c with SMTP id af79cd13be357-915a9d5fd58mr1326851785a.4.1780909550709;
        Mon, 08 Jun 2026 02:05:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf41f05041esm427079066b.62.2026.06.08.02.05.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:05:49 -0700 (PDT)
Message-ID: <f9be384e-9ab6-4201-a737-4be331c180d3@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:05:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Glymur-based Lenovo Yoga Slim
 7x Gen11
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-3-57c70c23d0d6@oss.qualcomm.com>
 <6d2ca392-148a-4539-92b8-05bdab1d07e3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6d2ca392-148a-4539-92b8-05bdab1d07e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dYpatbSajh1TuLzm-8vLid-umE9RIbM_
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a2685f0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kKXrk63Xix4RLwVNwpMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: dYpatbSajh1TuLzm-8vLid-umE9RIbM_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MyBTYWx0ZWRfXwRF38ZbOZg3g
 oQUxIuCmT8ZHOVnMwci6Z4pCuN9pFHDJTkO3GV7MhweeYt6O6O7AiMKsck9xvRJM/Zkez4eDxue
 8XVFZwIY6TNYIlDXYqR9DKawJnulee7AFKayibiCD6XRreQMM6z8e+j6niCTyk0GBn4F8LqH0gx
 5pptQBeEbUj5caoJv+ilwcLm8S8G8vTVqFbRehyGN5/h8hNaO3u5Ym3MlDji+T0b9tdHCp5ZGSt
 CM+mcz4rlDSdaZPW74Mls3nWoZXEnZWSAENSh0tCA4+awRNxYtRc/JM2OTkjC8JnKavK3iAdSQ6
 1USeun2gvVrjuNrsxvP0E0ZnMTtu7+Pc2G0UJIxUKtzwmjEChEktxWvCOa+gGIhHGby0mFC5DKf
 zDuaL/LIROb9TqVNwRvIUNaHdun9aSa71ZVI3/Yg1PUcoEvuPbBCsRDOIenB2Y2Wg7zwrK/wguS
 0Y9nKlJsI1loDJ4xO1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080083

On 6/4/26 11:59 AM, Gopikrishna Garmidi wrote:
> 
> 
> On 6/4/2026 1:36 PM, Konrad Dybcio wrote:
>> Introduce a device tree for the Glymur-based Lenovo Yoga Slim 7x Gen11
>> laptop. It's fairly similar to the reference design, although there are
>> a couple of major differences, including a different EC.

[...]

>> +&pmh0101_gpios {
>> +    key_vol_up_default: key-vol-up-default-state {
>> +        pins = "gpio6";
>> +        function = "normal";
>> +        output-disable;
>> +        bias-pull-up;
>> +    };
>> +};
> The &pmh0101_gpios node is extended twice here. Please merge both
> pinctrl states into a single block, similar to the fix already sent
> for glymur-crd.dtsi [1].

Thanks! I'll just skip it here, as there's probably a RESIN input
on the debug connector, but it's not soldered (we didn't use it) so
it doesn't really make sense to poke at it unless someone really wants
to go the extra mile

> 
> While at it, could you also take a look at [1]? It addresses the
> same issue in glymur-crd.dtsi and has been awaiting review.
> 
> [1] https://lore.kernel.org/all/20260602-merge-duplicate-pmh0101-gpios-node-v2-1-251107b3d9fe@oss.qualcomm.com/

I was under the impression I've already done that, but rb'd it now.

Konrad
