Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2373CF664
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605320; cv=none; b=KFTgboQqCPWKAAdNvBikmoPZldLs8cfqCvByz6RnmuW+BNWGl6Xt1WA1YdbYSVonKCEv1SIbKiQBbuKRxxFbd+Pb2kl2smTVegs8a+CHKFQaIiOlS5zfqIn7FrfQkjvQwQK1FlELIKFX4tb4uMs3XmoOLoa2nB/Evhw55I3QkXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605320; c=relaxed/simple;
	bh=hzS+BYiiI3Hmw3JC2h6bqzssr7Mj885Xf1Qzyl2Rjwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IlkrWA3TX8S/JXLxTwmq4DzQvQSqFPotaouyed0fcqiKrpKiIFCpSvSzPwmDYisJuHMWZ9S2osa+RV+V9v/sRgGo2meXEHqgP/Ox/DDCPHDmwQjXQW+zy+OS51IQRd96lSoCBw/kIsEgha1Ae0iyEBHnDEFZ10/MI2kWfg4g9Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OCo2zKc5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdrQDARF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OCo2zKc5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdrQDARF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vn6I3715894
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxpBU7AuYdojfPOBeVct3hQvdxemze4lp9YTaAIaxhU=; b=OCo2zKc51yBxPT4Z
	p5tn9v4qXPdisYf82D+QrvR2/pfyNMkq9NrDgl0+ta53Pc8oqJPwGcCjSsGqaTDw
	yU8UKzeTX7uQ182a0ebasKTF42lTXHqhwpB7ZrzxJH0HJKF/dbGhdHLpexhP1FF3
	iZl42CUNqNicLPU+h4RuE/1V0YFZuf04l2u7hMPlY1ksxv64Se0R3R/T420G4CUS
	vzueMU/T4ESkYMnxHNVwRZYlkVg2A/cXbGPuCSXHKHq/oOnXYnj89sK2ZV7SxQJq
	uRcDVzjky6VYOAfBqfIGxjxeDzbhSaFqPLINGgo33p7nHYrtKaLRkX3u5vA16bNP
	+YTMFg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6j7su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:55:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b9074bd42so6089391cf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774605315; x=1775210115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxpBU7AuYdojfPOBeVct3hQvdxemze4lp9YTaAIaxhU=;
        b=jdrQDARFFrClgjaMB7vewGV7KT+2ziT0xXZMuwLUzpqmNmFcXZ+VdefBDASBHwVYhX
         1zccsIj2tZxiyh8EnQjPIbegmQUIMOlfD4m5u+mac6Naxuw1bmn6EypnwMjUOc4xOJSm
         VsieWoQp8OIKzEQgrE7lwcwNhnODs6f9BbIo1mZI8zibnteZK6oYPXrClFTohrUNpy5l
         +o5csGcns7JlYawe9Tz30Y4GrfVWj/Zoa/syzNdu7ItgApjHurKVooaxYB7YIrtP7/ro
         QUMXL9rvCz4k9zx3z6n63WDkiEUnAKZ6pC/vTkVWiF94FcNZYQK2H0KVuF+cDW1x3wnc
         rHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774605315; x=1775210115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxpBU7AuYdojfPOBeVct3hQvdxemze4lp9YTaAIaxhU=;
        b=CNiTnXQmupMb4QPGJ//PeKzPGxDzcsK7NAnbSXrhR+AH19GYeF6/P+ycaa18vbPtYK
         6GkCrSlrsmn9HFyFcVRlpM1DI1MDPkXFUP3MWhtaLadONoABKF/aPZk4+eRSANUMW8u1
         4ptnZBpq96eepjOD2H5R1XVF6OlLUqiAdwVe1NmVrzfhk4bEfe1O+SU2YSR+Ud9MwlVG
         WJmKwCANOgIC/lRWo5Z4Gk6xmqL99wGS7EGPimzqcNHkHoS3IHazXlr+HTBlZ/uwdn0x
         jKf6kqzaGDlgiOAVF5zaLBcDzGwVYRrsUrpxPdjW2slmUr2XDk+DBccpPL5DiDN+soi4
         kPWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpocr7U16XoWAPFbPtnuS1zavOYl55WwroEMDh8SW+dnTYL9qfUDnfr1Ri2hb9JSnATioa3dEpuRau@vger.kernel.org
X-Gm-Message-State: AOJu0YwaT4tuTsKv00wT0K0J4U2/j36ns1P3v2a6ZW6Buqcw3enc6Q2N
	VXVjnsmkTG9TjQsqbP7mlKsX3j1WQfx+f0+l8EvBkfmNtL/akv9ER6fuSaVVDj9SBLF8tl2YZPK
	XrsrMv58kuiNHhvqXOK5wcUaza+bno5XGDTygDYgxmSk3t66pFzJvVyoLv9tKJiAy
X-Gm-Gg: ATEYQzzAmFORDFMwp5IJ9YaSKS5cJbleBR9ADRpRFXDv4WISMud867pVkU2+322oMZg
	q0V2Rf9m1NOiAfY7AFkKH5kOkWt2jGBAaBCPkyKFP5NTXprEiqvDYuhXlLpkyHyP5WkyxMTtHWQ
	aYTaKAW68APOngaTcdLZ/EtDbaBIg9jh2n1KzrPSC8tBRK8vd+crAHy+KNFMsoSsUb4FCLh7VWY
	aF70+iNe0k5mfmSp4rdttU6L35ouEyJfYqEBJkXPoeusgWCnjkPDReDdKhNSR2F0CytVDM2CQBD
	qbD8LXXvQm7iCaecqCWi3Cym3mOyqrcYWoW0Bi+vP4QknkteqsH7rx+3OS6zfmZvcL0Wa3gCcbe
	bR4ePThKm9y2XJAItgYXF+XxX1VAUStnMUzIv2nDley/gwVUW/FXESPkZ4Tc/PAG3ZwaWeN3LuC
	8ku3w=
X-Received: by 2002:ac8:57d1:0:b0:509:1bdf:e97d with SMTP id d75a77b69052e-50ba3903e2amr17193191cf.4.1774605315557;
        Fri, 27 Mar 2026 02:55:15 -0700 (PDT)
X-Received: by 2002:ac8:57d1:0:b0:509:1bdf:e97d with SMTP id d75a77b69052e-50ba3903e2amr17193041cf.4.1774605315069;
        Fri, 27 Mar 2026 02:55:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef450sm232701866b.47.2026.03.27.02.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:55:14 -0700 (PDT)
Message-ID: <b40cc518-f74e-4b5f-ad22-f77600fb49b9@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:55:10 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260326182821.8332-1-nathbappai@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326182821.8332-1-nathbappai@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c65404 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Oc_gNG4ld6zQFinn-iAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: uEYJ4XSknUepVgoN-5VQ3nnt0KuaZFyp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MyBTYWx0ZWRfX4HgpMd2sNowc
 L7lnDZNecq+i0GSyVFXjqeiX5t0S2MaZJfWFdZmWiEbCN4DlictviI8WgVuJg42zoRPNYcQToJG
 BQT02jkAo1i9q1El8Dp13cS65g9JVNAiVfZ7NSTia06W1B4l62FKInW2+ZFIamA62HAfiGXxQRu
 wU+2gzEiREXFyhy249e6gNka6ceziSSokGhElqPeYfwe3vUlMojXlIzKGNF6UqepKrf20ZY1ybI
 P/jvRzlBELI4sYEBxoxzqu8KfryJNrShMwnilAt+Z4e4gyduqAu64XjGoyYNy7LJeOa2Qcoibo+
 MQ1kh7I1yqR1Q80FS2K7HFMPnhh/A1fuzw6oRpf0hcaT+E/nqpkxQdyHvv2MmZjCV8HGIZ6snee
 MUIV/alYsyowpcOe54hQ1OFK7OIc6fB1408L3cjMTdesDtu7w5RDr1GMslWN7dNjCt6S8C+X41A
 X6YJDTRLLORLcTC0/7A==
X-Proofpoint-ORIG-GUID: uEYJ4XSknUepVgoN-5VQ3nnt0KuaZFyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270073

On 3/26/26 7:28 PM, Biswapriyo Nath wrote:
> On Thu, 26 Mar 2026 10:41:03 +0100 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
>>> Plug in USB-C related bits and pieces to enable USB role switching.
>>> Also, remove dr_mode to enable OTG capability.
>>>
>>> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
>>> ---
>>
>> I'm not sure what this is going to do for other 6125 devices
>> that don't have the Type-C infra wired up.. Does just applying
>> this commit alone keep peripheral mode working on your phone?
>>
>> Konrad
>>
> 
> Yes, I have verified that USB peripheral mode is working with this
> patch only by using USB network[1].

Thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
