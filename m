Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD2043BDAA
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 10:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013568; cv=none; b=As/nHEeJhn73ANa8hVxTOfyB8TQ+pKMYzZEcOBJiaB5P76NI/M+iESD5L2b1BK07MkIaJsh5nAHtRrNIdLlydnpqJgWHg4sowmLztFoSJyYcdYympiPvutUImxLFfPq/25X9c13uWX9RMYLb9aMlowT5vHhQSdJKvVD14SqTYKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013568; c=relaxed/simple;
	bh=S14CCXsvZKcoB+hqjG0/+YwP1JERAdUsRwYB9FkJGyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z7Yj05EXfVXV+MhlMxRN/5Ls/dCKbtGmTFlkx9PRr54HttMdbeTX8MhFzlyEY4P2HH5ArE/nl2xkvauSb+iPU2nHyQjtuxJLkZ0wb/n0OxCI3pR/j7snDfaMhw5m5c9TVZLKUMSbwc6ylM+rENezCekTXInQo2WHTUwgFno+RrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0NCDN/y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSZuO5/a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0NCDN/y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LSZuO5/a"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769oCWs1877166
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 10:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P9wCDFhEDVTTIuhNLpqSgqnjSFrcAIQqWwJdGdfxngk=; b=n0NCDN/y4q+yVtss
	WfR8OPnwOU4MQH4vqe+FwO0TUO/Af2unPwR53vW+Zm0FT+8Ku826Fo0YR1I5NSIN
	RZR7iTS7ew8/g1Hxjf3fsL8Ogd12xGLqssGg8/geL6G/iw4qFvmhguTeFvTZi0mb
	7NpPEOf/L+W5TQ1x9w9nvmehOuHEtHKuZLMx5WZq7+lGkGU1GHv6I3uCGc3HlrSz
	EOXRkv0ZzbrkydWWxSg4O6Be3OBWde3ASFhL0KJxxMnmbDggItxS1ucn04rwZS7W
	B8TYJ1BBJaDdlFwh9ah9NKxz1J1ZqUKZ0ICQQPYFjH9sP0cOmEDSU+uyt8mEqBsM
	Mzhg6Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuchn95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 10:52:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848544a8496so2376859b3a.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786013564; x=1786618364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9wCDFhEDVTTIuhNLpqSgqnjSFrcAIQqWwJdGdfxngk=;
        b=LSZuO5/amZE36TM/mmIp2cpELXlFAOa+7TbT2hZ6NwIowTYtY7tMevd0pcQA9U+31B
         ttMyEbEdPuw8JRVO6o071OPE6WxYAZmpcXxjHsGzLtJsJxXfaqmmv+mpxczEEdeXqtl6
         dAH9OmDMx4LOAQazeXvFQ0cJMi+tRcdDCozdXOudL5S/HHDV/Nu+N50ASTNBzlzD1rj7
         Pf15NLC9iioGp5HHoNEosIKqyK0ql9haYdsAvmP5QsINmgskZLZOa5p7jYO3OCeKm7ue
         iptuGdkK/RLtpt5RK0GLsKKyT0vBVYqM42gG6HDUMMc17HrIl2pafGtYPZ9ldXzdaFk/
         urww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786013564; x=1786618364;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9wCDFhEDVTTIuhNLpqSgqnjSFrcAIQqWwJdGdfxngk=;
        b=SAXB9iaizm0BSv02i38ZCIdmU+U7hE2XN3u1g3IbujLFRdPfIdOxbH1ehfnCPVBsJh
         JnZeJrfk8E2kHQbf2R7vw2T5tv2DCLudGTk4ljsFlhVTuLGMjB8Il3yB/iwTBlHc9yu1
         pkB1R00yATLUeK6KudSPN3KPFDW2inKx55xj2n0w6OwOiUCxP6Quu2UChph37k31QHnY
         uQ2wZDM5Vqo9dsvwS5Q6Ohchnf3Gpc/wFIUCxoIYmMC4M0GFJboje8KrWjkbbS3J6U4a
         JMLj1U8OadX8ckfGYvqJs8sIkNV2/ZLc6VOy4u7piRml4suHBwGU5EZC5c37Pz//mBZr
         58Zg==
X-Forwarded-Encrypted: i=1; AHgh+Rpr2T1F33xfnHFq99MtI2srRmCP6kcmzr4Ioqg0XLmkH/SrqR4EmoOUAlvmfnK+PvH66RQSqf9lITl6@vger.kernel.org
X-Gm-Message-State: AOJu0YyqsYAvWs5PCVx+dlbeavNZH4UHg56fMJ+Ms+hFxDuow7cPV3Ua
	eReyvvLs/SOXz5mdPUogs/8ZSwXQ+7te1hQch8qomxa59T+1cYanbU5nXTxE8ypmWjW003gdig1
	0YdgYzh7NUuyfQLq8xacGGdmBhJtoTYTMI6ncytIyeWXRU8P7uljBPVvrkUyyVKsH
X-Gm-Gg: AR+sD10bvx+PR5iKdfyORgkeOIXJaZTzOfl7GIzsovIFiFrtuC4Cuv9qbTxG4073srB
	qBnTgm+VahTUFSf3ta0UuHpu7LJ+c4+0chkiD4N2GeV8k4p5xZoztfAB5+V4frQBso2XirZAQaO
	a1AUDvz8Sbq/nJoEBFe1Bv2xj5tOlBQaKCB1GggPERsHzBwFTmP8qTcNQU6Yv1uZeudDghdqSFx
	JBj5UgQXdCmzj9P1D8cpDLjuI1hFYRT+ZBicKxVQwVjGrfq0Bs8s1PRVYH9VxQ8QpK3WmPYxnD1
	rBaLFe8Uye8VDy32R0hJsw2WMk6Qzo2u77yxpROJjHwAXIrTrL35eyn6m0fQpftv2yNyFz4fayd
	HoIZpzE6EfTKgUNNMb1KnJB048suGallx
X-Received: by 2002:a05:6a00:240d:b0:847:7a61:e68e with SMTP id d2e1a72fcca58-84f4febe965mr490074b3a.31.1786013564180;
        Thu, 06 Aug 2026 03:52:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:240d:b0:847:7a61:e68e with SMTP id d2e1a72fcca58-84f4febe965mr490026b3a.31.1786013563745;
        Thu, 06 Aug 2026 03:52:43 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9b32sm1179448b3a.58.2026.08.06.03.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 03:52:43 -0700 (PDT)
Message-ID: <752aaae3-10bf-4714-bfef-e075ce30604c@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 16:22:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] thermal: qcom: qcom-spmi-adc-tm5-gen3: Add support
 for QCOM PMIC5 Gen4 ADC
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
 <20260731-pmic5_gen4_adc-v1-3-9c49b2eea6f9@oss.qualcomm.com>
 <20260803011709.31cf83f2@jic23-huawei>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260803011709.31cf83f2@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4NSBTYWx0ZWRfX6iX98oWV+jQk
 TorcZWi0gUrphRbpfeeQ0/AHaMr/Wn13nf4HWjm+vSQLbnPSpkPNbKBCeODwjjB2DGnhWw0r14A
 HS/pHob4Tr3yFGiBQ1LM3354oZtS2jk=
X-Proofpoint-GUID: ZAxERBusA0_frKV0D57Flo8b0SoGbk2k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4NSBTYWx0ZWRfX9ZvV7yWOWOZV
 YHgLXEPQjYA2fjONbuY3hmVoB6N6G31AZ2uAj+7FOip4arrxUztw0VIpfNFkpYlPPbBhNRXuGlf
 Y8bKMC7Lii1deTWaCegTHsQaLyB5h2hwyNQp74JCjLvz0d/mMRdDNMheM78uI4ZZ6d6h2J7nyrd
 osNy2/JVhE//zIUgXyz9nmEcVATutsDrPSKm5CghGJdTiCbLGkAJWIeM0nAZFZA6LvcShnsMlXR
 jGNHT/ymZH5mEqEb89QHs+KYKONn74AbANbMBLvlET2wXxkPb1e2Hc6ZWP4rTLlbKfSCgXwnBNu
 kFKmcfHqsRwiwLokV4Hj7YDHlM2bC5xFe/GNAn2M0EuKdRjihhzqNrZf58+AFFkUzdqq20Fw7wg
 59mE8oSl8miDmafq6NsqXKiilWnN429N4D0xVS9MwnPdLnQBsbWrQqMAxkJV0ImVpQRHQAe1aOy
 ustfAKjiUmvzEqHnh4w==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a74677d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VLISa07izfuZ2-VxH8gA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: ZAxERBusA0_frKV0D57Flo8b0SoGbk2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060085

Hi Jonathan,

On 8/3/2026 5:47 AM, Jonathan Cameron wrote:
> On Fri, 31 Jul 2026 23:36:16 +0530
> Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
> 
>> PMIC5 Gen4 ADC is similar to PMIC5 Gen3 ADC, with several changes made
>> for improved performance, mostly at the hardware level.
>>
>> One significant software change is that ratiometric conversion resolution
>> has been increased from 14 bits to 16 bits. Add a reverse scaling function
>> for Gen4 ADC thermistor channels.
>>
>> In the latest PMIC arbiter version (v8), there can be up to 4 buses
>> under the PMIC arbiter and 32 PMICs under each bus. In order to
>> support communication between ADC on the master PMIC and ADCs on any
>> of the other PMICs, a field of width 2 bits is added for bus index
>> and the bits for SID are extended from 4 to 5 bits, in the SID
>> register. Add support for this.
>>
>> Co-developed-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Hi Jishnu, Anjelique
> 
> Code looks fine, but I just wanted to check.  What happens if
> for some reason the patch before ends up in a tree and this one doesn't
> Do we read the wrong temperatures given 'bus' isn't specified?
> 

Actually from what I see, patches 2 and 3 need to go in together, else
there would be a compilation error in one driver. This is because patch 2
replaces two macros, which are used in both the IIO and thermal drivers:

ADC5_GEN3_SID_MASK -> ADC5_GEN4_SID_MASK
ADC5_GEN3_V_CHAN -> ADC5_GEN4_V_CHAN

It looks like I missed checking for bisectability, sorry about that.

To avoid this, I'll add the new macros in patch 2 and remove the
old ones in a separate new patch after patch 3.


To answer your question once bisectability is fixed:

The changes in this TM file affect the flow in the .set_trips() call, which
is used for setting high/low temperature thresholds. The .get_temp() is
not affected, as it directly calls into the main ADC driver using the
exported function adc5_gen3_get_scaled_reading(). 

For the specific situation you mentioned - temperature reading for Gen4
channels using get_temp() would work correctly with patch 2 in place, but
setting high/low thresholds would go wrong for all Gen4 channels as the
conversion formula is different. Bus index not being specified would
also cause errors for configuring channels on bus numbers other than 0.

Thanks,
Jishnu



> Jonathan
> 

