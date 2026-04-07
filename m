Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABC83A785D
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 10:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558623; cv=none; b=taPf+XtCAmg3zTSQIlU0KrAlu2ExDJgoxw30uqZThj4NbCDrxO2UPMyJ/Y758GOfLsxwPgGbU3IidApnbBMdDJlxTCnYEAR76GyO3dQ/wN0ndKRlWXjDCGuUzoDVY7m8nx+gFANsceDrinP+33F0CumBU96V3ZNZZnDo2iRF3ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558623; c=relaxed/simple;
	bh=CQIjHIT+z+nLwPmfCgBgKCt4JlbpFBSGzO/WtyZV71U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+WE1MzKCfFGbspzYrmO08e3OizY5jFLOvlKLix4YCWgl026ftkaWoqYBrjaReWB6d8JUauz9YIItchqbB7JMsd5acxaI2/jrtHkoOpfifWtt4QEJ76n0Ueiwlfwl14uKAjDGnrFHtd67dFI0OYDRqSvXQSHEDoMkQaWecEDKhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zfljbcz5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kC0TzvSp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zfljbcz5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kC0TzvSp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376L9tk3537351
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 10:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETys1TN6NMui3A8I9wSgFlHJCcKqCJMgbzi8/hd5ztI=; b=Zfljbcz5AXBhAMlg
	ApFgK6+Qxy3CNaP586kxvz2uDA395O2DhaikDq2/JAdot9cCtsIyW6wmjMWbLAKT
	fyBhrMrv7UD9X9cLva3bBUq0IDkLLLbmOWTeNgZ9+z3wosXBfEPmAEu7Ft1n15Mh
	TW1eNJwVNwryBGRYmif83A04OhphZ9qGi/+vAs9O8Ahfkxnd++fcxbP//n+tyOgx
	aiynX6Q87yOuIlYZkbExrKB39gOgCEngp0TWCvbedCkFbBEgVq19+kPcfvIhhjVB
	/b0ypUXEf1ki7qCLveIjLB1IiMMF7d+XLJNTXxM6Zms4Yov2iCusj/y/ZiANbGZ/
	w5xJZA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmra2bjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 10:43:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89ed6f0c71aso17323116d6.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 03:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558621; x=1776163421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ETys1TN6NMui3A8I9wSgFlHJCcKqCJMgbzi8/hd5ztI=;
        b=kC0TzvSp1THmFtdYbgm++ovl/yKd49wFHCcER7MS4ddy74nCYDFiBruatchFpkon1z
         z3iQMjuZXvW3OSDZbNL82b10x9ihG8eSJoAntQzLxJxYh+hta904jiSsjHJDsvkBUDir
         psbWiCceiPbiJ2DunI/78jys6DZcQ+HlKxph1JNzfoxOWRVSXxns4o+v3gv40V5QObmx
         dad0sSX1rBNCqsSIbU9t0yn9EOuP3q/+uTkWCwzUNS3D1/VWz2MiLRet4kc8DLEAbDmd
         hYdCmEaZKl5UfLpxQ3dhKZD6QVZKSaaaMbWAtT/qhMsuS4JdY5jweZYXFy7ctFZKQ0dH
         /L7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558621; x=1776163421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETys1TN6NMui3A8I9wSgFlHJCcKqCJMgbzi8/hd5ztI=;
        b=a6AH/qW1h+8GIlLiPAbMXItAberVyNTbSyOqmRBmGcJ91ieiR/ZshxXHr+YavNaJKH
         So2uF4u2t7uvNEsyKdSK54/AMvpM6A2IK/yM17Hif+9trC7RaIzin1eQXW1RSLZ3+Ue6
         zp/ivwcIVYyvCiv7IqomTfOhi6am+hLxlOFo84I6f6EIi3lYbIWGfAqdeB8P6ebV5k6Q
         elA+igxrnqtkMQADfI7X9cIKvAR5xLoklq7etqylNtZf9CPyUVRX5Vomj5QsDe38RBRn
         Yo6WRl1LdDUjqG21pCDIAmTMeYvvm5oFy7sVzTKXBO0TwPa/XJrUABYCbt+t7FVTSWBR
         MEKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7Bmt/+gO2C+EXr6EFZ8iwcIw1TVgNVfCTZ9em0KvMNLGw2S7ovR2wBVsUsa5uGK9yHP8cpQuR12+T@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz0aRlXTkLHJ44dfMH6Nyx3bMuNBRXC713CcOzpiUb9w6HwuN4
	kdkbz8mlNx5UZA+MFvJnRjgNgN99h1HXGWo0ZR0/xQE3oF8VgV67yG50Jd8f+N0UE7Q7CHCvlpS
	G7oZEmykMZmJbLT0tcC/Gcu+Ue4jjMD44c0Fh41LAjzikkb3l+aMbzMESy4Y6FAb4
X-Gm-Gg: AeBDietyFzNeYRw4OFyMGN3k9KY8TJFMvjqmKSHkA3nmM2TE/1dWYkkpemNLTtzwDBz
	B9VVa3oTXoTJmaD6Ed3TSA8ZEG2T2CafQhP8FcJzl2vNm0f1wL+f0DuTSPzx2vQbgv9gjrQQC1U
	QTfN7tzfzzYxuWP+JfGWoEaPhiel3FgAJgaWr/NSqsHyQDCU5II0WrmT+fuWSPpfIijz4656m7g
	jdaY4ZNEvPHxOD3MDxa3gYrHwYSxFfqcxOg3wMw7TlSIVVYpEwaCGfIZHd5sI/YkrEH7lJAJWUn
	YeueEEqlwLCuht3qdsMXR1gN8Ggzi0gHvDNOr3Iy4WW8hMlvtrZKo4Ja8GriwgYacbUtd/b3B0g
	fyWtM+6vyCEk5Lztgh02gB2sOaEFw14Ml6xJYaxPh2UKJwbg688Kke239N26pvdgXRgPrRSQ0aW
	mO04A=
X-Received: by 2002:ad4:5def:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a701be043bmr191378146d6.1.1775558620556;
        Tue, 07 Apr 2026 03:43:40 -0700 (PDT)
X-Received: by 2002:ad4:5def:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a701be043bmr191377906d6.1.1775558620066;
        Tue, 07 Apr 2026 03:43:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d028955sm543149566b.61.2026.04.07.03.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:43:39 -0700 (PDT)
Message-ID: <74eb2ee8-b99d-418e-ba5e-d0802d571a7a@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:43:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce
 EC
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
References: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
 <20260401-dell-xps-9345-ec-v1-4-afa5cacd49be@vinarskis.com>
 <e9826e27-da9e-4cd5-b368-be3e56f62072@oss.qualcomm.com>
 <oZ3ETRlKitLSlV93KwI5jlHnDIykdpHxhzThD4pT8FVvY48Y0jrPqDuwI81Zrwy8nwXe7DR0ZUKBTEN9SO8bsPa5xBNWlaNS8u_DG6Kcntc=@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <oZ3ETRlKitLSlV93KwI5jlHnDIykdpHxhzThD4pT8FVvY48Y0jrPqDuwI81Zrwy8nwXe7DR0ZUKBTEN9SO8bsPa5xBNWlaNS8u_DG6Kcntc=@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: V-KMETuri3ERK0iLSKNtkVpnMuk-Go0Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5OSBTYWx0ZWRfX3gkBoXGaQRnw
 upVtv9GyG5M+eCNrhH9HfD5aghLGPbZT5xYfuqoa1RERBF7+p7X5zub47tnS/zqfOne5gbWMY1l
 bRsoSuUMQHvm1g0aSod5aTQr8KU99PqFSVTYFf5ysLMB0eq9Cqny3C46t0WRotGKO1tXFziB/fg
 ycwm0XLOBw0ua1TRfWINBFvJi4ugOse0PxMumhkma079ndzrtP7H6eD1nlV/3yLm9CUK3UzuLX5
 08WnzHQCQYlOh4+CRzx2UtWtUVjLZPLZgYjCgb4zBXFIWCWMERB+J9Ny0Gnmtsg7hMWYRhm98jX
 pisKWHn4uT4n0wmWo9S+NFFNPj0EyDuwaaG4MRc7lPoC9x2Ouc50ZNHq5egVX5NUDel97VtRPxu
 +3EoFjS3bMklmvEdiUnYM0Ho26cwmzmUSeczyV2nLE3MYmQTv7A3yOojK7hrXIs/OmOOZZO9ysn
 kiG7ACGNCZR4olHCdtA==
X-Authority-Analysis: v=2.4 cv=BKGDalQG c=1 sm=1 tr=0 ts=69d4dfdd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=I76Qk8w-AAAA:8 a=8FqYyGtbWLuB_zq4eA8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-GUID: V-KMETuri3ERK0iLSKNtkVpnMuk-Go0Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070099

On 4/2/26 2:52 PM, Aleksandrs Vinarskis wrote:
> 
> On Wednesday, April 1st, 2026 at 11:21, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 4/1/26 9:33 AM, Aleksandrs Vinarskis wrote:
>>> Describe embedded controller, its interrupt and required thermal zones.
>>> Add EC's reset GPIO to reserved range, as triggering it during device
>>> operation leads to unrecoverable and unusable state.
>>>
>>> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
>>> ---
>>
>> [...]
>>
>>> +		io-channels = <&pmk8550_vadc PM8350_ADC7_GPIO3_100K_PU(1)>,
>>> +			      <&pmk8550_vadc PM8350_ADC7_GPIO4_100K_PU(1)>,
>>> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>,
>>> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>,
>>> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>,
>>> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>,
>>> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
>>> +
>>> +		io-channel-names = "sys_therm0", "sys_therm1", "sys_therm2",
>>> +				   "sys_therm3", "sys_therm4", "sys_therm5",
>>> +				   "sys_therm6";
>>
>> nit: one a line please, without a separating \n between x and x-names
> 
> Will drop \n. One a line as in:
> io-channel-names = "sys_therm0",
>                    "sys_therm1",
>                    "sys_therm2",
>                     ...
> ?

Yes please

[...]

>>>  &tlmm {
>>>  	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
>>> +			       <65 1>,  /* EC Reset */
>>
>> Is that a "this may not be accessed" or rather "you can, but it has dire
>> consequences"?
> 
> The latter. Triggering EC reset appears to leave it in un-initialized state.
> When analyzing i2c dumps I noticed UEFI sends some data to EC prior to
> Windows driver loading, I am assuming its required for EC configuration.
> When resetting EC from userpsace:
> - Keyboard, Trackpad, touch-row power is out. WiFi connection drops. Dell's
>   UEFI allows disabling many peripherals, EC can 'veto' their resets and/or
>   power supplies. It appears in default reset state it kill some/all outputs
> - Holding power button does not reboot laptop, it looks as if it asserts and
>   holds EC in reset until released. During this time fans spin to max speed.
> - Device can be recovered only by disassembly and battery removal.
> 
>>
>> Would the EC driver/binding benefit from having a reference to that pin?
> 
> It will not be used by the driver, and it would greatly inconvenience user
> if triggered manually. I would make the reset pin as inaccessible as
> possible, but if you say its cleaner to reference it to EC driver and just
> not use it, I could do that as well.

I would assume the EC is powered from some always-on rail, or that it can
at least somehow sustain entry into all the various low power modes and we
won't have to re-initialize it from Linux, but that's only a guess

That said, like you suggest, exposing that pin currently causes more harm
than good and we can always circle back and revert this in the future, should
that become desired, perhaps with the only caveat being that users of old DTs
(i.e. without that description) would not get the ability to reset the EC on
demand

Konrad
