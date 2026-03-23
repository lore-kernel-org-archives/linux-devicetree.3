Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8708E17DE36
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275013; cv=none; b=QGQM7blnwK39MJlCmt1Uf+0/1fsWH4G0nbmGyFEITqaYt45YZPtsongyQd0R+vdDlkMJLIcqRJNxbO3Fg9c2dLzvy9ebwnjD7Xs0eeEcPdx9lbNNhFhTl0K9F33SJJEepP2qHYODhQ91ipFe81s9KsOyw4YO7nOkiEBtDTjXxOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275013; c=relaxed/simple;
	bh=/+8Pfdqc6upZMjla3MU63qTOyWzedUQ/xh2n2DP0KbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVoG1wu8spkZs8O07o2hUrHiDFeR+pVAWm42wzc2xBMO5+2ngEwRLG5W7yHaQ3RG4kvsSfwEc5fDNJlHKZR7wIgbc2J+Eiqekoe0F6frh+A4IJ9+LZd3E5KmfvUH5tVrl6OAbnK6zfi8tkh01Dqog6ATlCsTfeCicun1WHv6ilQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qg0cPY+9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGS8M++W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qg0cPY+9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGS8M++W"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NADm0Y3539785
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y10x1w7kflJ/EBqFagdo2f3rB8H4Kk+4obvVIdpQrvo=; b=Qg0cPY+9DNYfFr6z
	jW1mNu3s2p1ojFea36dB8V6DKV0nwl/ZmqyphOoi3IobuwVI2/Bm4IPT/tFX8iXG
	A/OVUasPCpNlRRQZTItATS9C1xHrJE7uI3s1dO1ugvNqphFM3zDpA+gqDHdrj5gI
	IvTZsVspRhk76LoAAvDA/hDpv9CvbRLZ/YYWDibEyShRX4c9WA5o36ogzI2DWSDB
	rWTmcdQHeHQeYnHX5mFjr0iUL4rE3E2SUiZYx8bK5knkrMJvxuDGvxYXBIlKVJOI
	yo9ITlxxcy3zEywx6BcRJMbhuwhTv8tO9u7X+E2yv+NyOlySMNymOItCA/wi1pw7
	VMz0Ww==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k30sfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:10:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c867b7d6fso25007496d6.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774275011; x=1774879811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y10x1w7kflJ/EBqFagdo2f3rB8H4Kk+4obvVIdpQrvo=;
        b=YGS8M++WZ36GFrpDyQYPp1qTvqgiywWGHme0WOxjFU/zwu2SV1LTFstVw5CrTejMV8
         lzMr2ArxvaOeZu6/2bJoOKR+QgiSj487SM5KaPv9aq1C27QNApCYl23IBCc730wU31JZ
         FfHeXuXAB/Koag1wPBW6bAV0QqEQfmY9+dI0e0++b8xi93eIJgV4gZSoTbXTxPrB5Fkj
         hTcSweM9QJZtgfFRiYMPykaVMPBP0YaM59+cGRfZBW+GMKLPXkCM38CfnSWDkHoDFhhD
         36e9sVEnE2gVuzChljj5LJGRDhoOolQlyA/MobAPt1p+4b/ie19nl9pJEqiFwOk/2mVT
         TQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275011; x=1774879811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y10x1w7kflJ/EBqFagdo2f3rB8H4Kk+4obvVIdpQrvo=;
        b=CQKfQcxJjjBOHVMDU0efnSKLGl4vFXN52MSQ4qwrOD4zt4qH7fKM5iE/7xLVmPBu8K
         c6PcYPOFtNR5jpalQOLpFqRtViF0v8idi7NArL5tXTmfhQYNQ2vlsF1qtlq8hNcirIus
         9OdN2ZGOSBHyTciyhZiJ0YknS4FYCMuE7xz6b7LObjyr+EVqjyYJcfNymz6xopTZY9bD
         n6UVN+2RltMNM6gHx1B1FmTcf6GTojPgicRWNL6VmnRtkys2paghT+z4o/C7Yy6xLL9x
         y4ZQnByihV+fx9A1MjUlg2BKXZsZmr88U/BP6+TtUVUP4HUUbuEIDPHrHGN1d9vrqI9X
         g97A==
X-Forwarded-Encrypted: i=1; AJvYcCWoE/s55lvup6Tx84nVpnbBq+JMTjbraQbRRg1FqdGzQafLVr+tWLpuKCKxlPNztYPlWDGjWe9US+Mb@vger.kernel.org
X-Gm-Message-State: AOJu0YwoRPdacsYrI9Ee6eTibZHyKEKUqBFNXruSWN5WdUm7jyKCim5Q
	MASV1xXTkIcRq9ZpnWTvXnpCWYqnDIkilowaDuV8nW0SJLspi/f8YaoffCpzhHZ6jbSXncDwnOe
	vqS+fEZsnk+7FiTjCAbmDl9RvEewfaeyGg9nATR1BcqCptEuHmQXxA+o6wuYtTVgj
X-Gm-Gg: ATEYQzxjtm2dW1lgOw8dpjHLJxvbs2MsCjG44/UscP7hbi5cy4VeYggs2ika7av/OsS
	5W8PitKnwcNfcNx34XleWVNEMJw422YZBLiUVImlAZ5wvTIh7d/Nnf+6ZZ9cHqYihc3goGXDJft
	/YPD7nNOHPbcT4601o21Xp5pcPu4s6zAg0SLPSc3aSkzLsAk+pr5Q6MUSsN9jQaxLHCTQ0xnKFT
	eOQjNQcf8lMq7lytEN3NabZkLUFqGaPAKx0ao5sVmWtzvm4vxInh0xCHz9BletsByhHn0bVWxqS
	tD1siTrywK5u39rgA/edjsxCsu3ZcF/WVGmvEHkwQK7kvs3fysdeLyxesxP4TXo1OQYmPTqYumV
	HruE8lMX6M7QP4sNtPEArXJvAnYWqif/yCUwoIRRg8TN0Vk9TaG8qVAZPzDlBVg/UguIm0Fo4qW
	bNn30=
X-Received: by 2002:a05:6214:21ce:b0:89c:69f6:a1f4 with SMTP id 6a1803df08f44-89c85aa66eamr155034296d6.8.1774275010641;
        Mon, 23 Mar 2026 07:10:10 -0700 (PDT)
X-Received: by 2002:a05:6214:21ce:b0:89c:69f6:a1f4 with SMTP id 6a1803df08f44-89c85aa66eamr155033636d6.8.1774275009946;
        Mon, 23 Mar 2026 07:10:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf972ba78sm26719611fa.5.2026.03.23.07.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:10:09 -0700 (PDT)
Message-ID: <128aafba-6045-46f2-a83a-be5706e67424@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 15:10:06 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG
 Phone 3
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260310-sm8250-asus-obiwan-v3-0-9ed8f0e71e19@pm.me>
 <20260310-sm8250-asus-obiwan-v3-2-9ed8f0e71e19@pm.me>
 <daa464f2-2052-4eb2-98bc-926ba174ecb8@oss.qualcomm.com>
 <nNinWyYOTp_1MjE-6JI6S4NPPxfZHvnIZLblp0x4t71DVOXn0ScH--kpAs-wHBQVUpgSvIZmOKRMmUVNzs8Vcm8PG3_4hFIW1jVx1RES2sg=@pm.me>
 <4ed72391-fcd2-4ad7-94da-45fe13012953@oss.qualcomm.com>
 <YUh0x0EbjEVDtKJ-osNM_rBJw1qSc6XM4CkS5w-rOewb_ZvsIlZ-sJXELcysAuPwmtx-M5CN08UfGJWUCqlWQJgxIPpQCU3PMNkD4d7NnVM=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <YUh0x0EbjEVDtKJ-osNM_rBJw1qSc6XM4CkS5w-rOewb_ZvsIlZ-sJXELcysAuPwmtx-M5CN08UfGJWUCqlWQJgxIPpQCU3PMNkD4d7NnVM=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c149c3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ciyoaiUkMkNXAPyT_j4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwOSBTYWx0ZWRfXxSD5hNyJgPuN
 teTkXAmlYWp0GWZlmHuZEtPTwVSXuC8tCjOIUczZIqE5haODMLEB7molg42qG0tDGNTfmclEQIc
 d1Hr3VbyGnAQ1G9K8UQHzWiMjbG+UieOQ1TK1gHWViFhu445xtgwfem/wnGht1dHNxL1mvD/LvY
 x6NLTR/r9W830DnPA+QM6ZYEjft9hzfcdSP+wOTDfCFNDVwT7aXzyznioTXtsYM9qJhKGJ9tfP4
 bWIFqyf766iFTfFrIenqduIzjlaaAbA8yJBD0PlBEVhcGfqTpFjZJOPcj5ApeEMm+riHoRDVkoJ
 T45rw/ejpD23IpdZtZNBeDh7Djr+YRNSVbBy+TVP7UWaLvmJ9nhVqLLzCpRoLQDXbMEHZJBsRk5
 tLGJHV/VAGGmAOSlvTyTPxk9arhQOScVdp+5tVJGMg5Utz9hpyjcTsvYrm6ousO05JxNgq4a5w+
 8e8aUGVo7AVcJ/xDMWw==
X-Proofpoint-GUID: mHXWH9HgAC5vx6QHzUnKdIqoPiNhpXrl
X-Proofpoint-ORIG-GUID: mHXWH9HgAC5vx6QHzUnKdIqoPiNhpXrl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230109

On 3/18/26 12:56 PM, Alexander Koskovich wrote:
> On Wednesday, March 18th, 2026 at 7:29 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>  
>>>>> +		source-pdos = <PDO_FIXED(5000, 900,
>>>>> +					 PDO_FIXED_DUAL_ROLE |
>>>>> +					 PDO_FIXED_USB_COMM |
>>>>> +					 PDO_FIXED_DATA_SWAP)>;
>>>>> +
>>>>> +		sink-pdos = <PDO_FIXED(5000, 3000,
>>>>> +				       PDO_FIXED_DUAL_ROLE |
>>>>> +				       PDO_FIXED_USB_COMM |
>>>>> +				       PDO_FIXED_DATA_SWAP)
>>>>> +			     PDO_FIXED(9000, 3000, 0)
>>>>> +			     PDO_FIXED(12000, 2250, 0)>;
>>>>
>>>> Both ports have the same PDOs - will this kaboom if you plug in two chargers?
>>>
>>> Good catch, from what I can see there is zero hardware isolation. Downstream
>>> prevents dual sink by only allowing one port to negotiate sink at a time (seems
>>> to always prefer usb_1 if both are plugged in, guessing because its used for
>>> the dock), but there is no upstream mechanism to handle this as far as I know
>>> (not sure if this could even be done cleanly as it'd require cooperation
>>> between pm8150b_typec and rt1715).
>>
>> Could you please remind me how the two were connected? Maybe we can work
>> something out. Sounds like it would make sense for the two to have *some*
>> sort of relationship described
>>
> 
> Both USB-C connectors have their own OVP chip, and both OVP outputs feed into
> the same USB_IN rail on the PM8150B, there's no switch or mux on the power path
> just the OVP chips that are always passing through. The GPIOs on the OVPs are
> just for notification of what one is providing VBUS into USB_IN.
> 
> Here's a diagram from my understanding of the power setup:
> ┌────────┐
> │ USB-C1 │
> └───┬────┘
>     │
> ┌───┴───┐
> │  OVP  ├──── vbus-detect (GPIO 60)
> └───┬───┘
>     │
>     ├──── PM8150B (USB_IN)
>     │
>     ├──── NXP PCA9468 (direct charger)
>     │
> ┌───┴───┐
> │  OVP  ├──── vbus-detect (GPIO 13)
> └───┬───┘
>     │
> ┌───┴────┐
> │ USB-C2 │
> └────────┘

Hmm.. from a DT standpoint, I think a fair representation would be to have
the battery node track the two possible power inputs, but I have no clue
whether this is something that Linux (or binings) supports today

Konrad
