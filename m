Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792715973;
	b=VS8a1Hp9f5kpdQnWFA3JepAjCAEHnB+OH+qjiDwmi2kz9EsPKpOtXo+jiYDQzWY71Xrs
	 iXPARWQHgZromMi+NeNHT2GtyjiKthDPtksDOwUjZW1xumbd4XlcEkRexrCpQfB8o9zlU
	 i6Y0C2Gc/lidCeBZO6GjKJQgyB1LekYrTklMOxc/aNWEnvmaND5JHIUch88Fe3wydTM5z
	 2omw7bBfAA7Y0WWqZFlHWQ86JZe27dAYNyBmkutzbuJrDlkk7/SU3FoKiwOMQG/9NBjSa
	 IL5hQxNt5I5CSSZsSP+UTww1TzKU5g8NDjtL+P41geC/VBZ8OXbUuKFbkb3c8/YJ2uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792715973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A6RNJ/XouteAEf4O3iDFpm3n3GqxKKGhT7l2XrAWWds=;
	b=BiVpUBLYCSWFiSRBVYpbvdlKYPzuh7eBndRkf6LeyB21bCwrEtrNtSwNQv+lMgV4QOqb
	 egg5GLXHy1Jbh2zAeFxdKHYnuDNXHl6TTlT+AxY7P9My88il2AbQjh8/gGEAosqQVKDyQ
	 5639R05Iupk6LyYpgY4T+Z+afILcMHefJLNrLiF9m5675GNxa571XNszEpCiO5vqDd9Ji
	 V/3Q36RpdxlglyyX380cGtssc0EH18Uxgf5cMrrdvghL2XPYI1AF4Ua0+CHZERSeNj1X8
	 CzM0M879U+MCPS7bjn46phoKkGt2lVAzHwaexRlLC99h3poBMNlGQrsU/3fYD5nWcAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEAE606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEEAE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MMFImg050052
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A6RNJ/XouteAEf4O3iDFpm3n3GqxKKGhT7l2XrAWWds=; b=mpT76HSWOTccoYwd
	cWDIYcLt612dCn+7YSprQ1P6L6p9IKEURGiENAPpAV7QxXyapgu1EZmZPPVhYvN6
	2PKQIkNe0I9xsfTOnhPP+DFyCvo8Avct+uFzL3nuYxaFn/EvGtrhoT9PA2xn9cJ/
	8zatABrIFqQCZqVb22TVssyXpauAP44+nh9TqBc4+tPYCdMsoL97upYC30PEE9h8
	Ne5hLDe4B+DHLTspxK6GQVEV315onVUNE5OdkgPaEGhHHRUImZySB69ZcpDPuCQn
	GN9IESREjDyOP+oVyMw5Bn5oWs1Wx04BsBsMua5AzGzttME0y28G2vz5pr3y1fYf
	RMK5ug==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms15dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:39:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3580c07911eso1066201eec.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792715958; x=1793320758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6RNJ/XouteAEf4O3iDFpm3n3GqxKKGhT7l2XrAWWds=;
        b=jNUyCMFCK0Cr58JWnDOYJl4CZquc8AVfkFAd8GEyKzethHc4FvbqofEjjoM5XcBAS2
         yTrMFZTRHCg3qcb1BUxLrtoC4cZ+OHUnVUMfLOe1a95AOV7MmmTcNdZhOo5RgyzOBWHY
         e1MV+67OLL8SjCxUGXPjkbO0EyalHmDTNlhmWL8g5T1Pi8xmKwYldcSN0a3CnzzvYGbG
         qNp4HTOWGoavXEwTM+uT9QfOdoC1+9/eAfLUTyDmDXmxj3GnSoMBUcu0iVPwH0Z9Ws+t
         Qmnw3Sr+U9jhcG6bLdq9wnJrn3pERvLLuz6TOdEcyFL+QXxoy7FvS5n4BNH18iiUsgKZ
         bliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792715958; x=1793320758;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6RNJ/XouteAEf4O3iDFpm3n3GqxKKGhT7l2XrAWWds=;
        b=QC5KFIFvm8fnAf4IMBsFQ79Vfq47vlKKgKRnftPPERVpp4wOXzYIoEmGlQu7aoRWDe
         EBi60MljC8VUWuHJOd5uGjrpi0zIIpnhLMxEApj2l75xioe8ydund28V56+F/xGFgeom
         mLTl/+j9xrR6dr2vlp003Ygr+pQ05a1WIRVm9xBASrJqQ2xlJtMg4Z5DWaEHtxW/dVdF
         1XzSnVr9BQqxdnZ+lo5EmJpQqCDK2Db39znVRjYGTzQXOxMlMMk58tajxhHE3Nx32fO3
         1ucBjERtIwa8sgmCiCoARiZnw1/dkhoOnY0e1idHUJMDsBAnVcVUlV7KvuWU8bLdPXMp
         2b2Q==
X-Forwarded-Encrypted: i=1; AKwUvByxt04myidVdIv97G/Ax3ej4X7o0lsl/xRS9NVJSfiX6IEnQ8jUduZiV/XNbkkku8Z94EMNUEFfnfqM@vger.kernel.org
X-Gm-Message-State: AFq9FYL/j4dHhUpY1rQuqUKQqaHimRJCWOcUPuljERwP/dboaIRk2/4s
	9YqZOkDmagXbnedqSUcLJlrWSROc724KJAnIbbu1yHCw20VK/vbtsWJRR0PaE01mxfxJjmV2+4J
	5iEy9tZtl+0igW4Js/Ja24JPK2Unn5DeTxfyhZLmq7Got9NLjtlePgWav7/J9zIQz
X-Gm-Gg: AYBFou20jwgTlOnj2WX3awqksTmnm3dROFe45ZH2Qyh1xsUtU8yuWyvBuBN67VzCP5K
	PWTkhMUOk+mZQNwl9M48XGDkDDq7YwuOxTY80Qy0pBZE0XfiJdqONOD7i7v/MP4Ez4s8SeOLU/d
	/lb43v+k0RvgYNNJS4ag08s6BvwM9g91tNq5ZaIn5BgSQArSE6BNqSZEFXj+sDWig58BT/X9osh
	bEEpBQ9J9nSAic8XmLoeqTxBZNh5pu7C29C6NQGqYxfsiqUxpgoNHoKL9qms0GoNHVCQTfbHk2r
	xWgsdtB4PEbDVv+k89ikTda4MPZgtb6EAlKzy8KQjyoARBadklA5e1I4NGeNZ4sw3W6VoQculG4
	7iRMZRmc6TeiysxeHs1H6thLONysaSza2zFHBg4svj99ZI3fhXM4uj7A7DQ==
X-Received: by 2002:a05:7300:8810:b0:367:174d:c8d4 with SMTP id 5a478bee46e88-369d971f2camr945847eec.7.1792715958022;
        Thu, 22 Oct 2026 17:39:18 -0700 (PDT)
X-Received: by 2002:a05:7300:8810:b0:367:174d:c8d4 with SMTP id 5a478bee46e88-369d971f2camr945827eec.7.1792715957498;
        Thu, 22 Oct 2026 17:39:17 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9dac9casm1449378eec.15.2026.10.22.17.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 17:39:17 -0700 (PDT)
Message-ID: <cf9fa6f4-757d-4163-bdcf-7416b9c999bf@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:39:14 -0700
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
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        gjorgji.rosikopulos@oss.qualcomm.com, jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
 <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
 <xGBkVr2J5eTHzEO_i4LTjdWGRO1MXGiIijMf1PGUbQ2gEYqffgMDMtx4uiNyBldbbiW13zmcxMWZYYjJ1s--Vw==@protonmail.internalid>
 <c6d963f5-a57e-4086-972a-4f04af2c5b42@linaro.org>
 <324dcc61-6085-446c-8bf7-564486f319bd@kernel.org>
 <CAFEp6-2f7dzz2rrNuTE=4VXgkM55qvYY1SANcZE_8TutkJ+SAw@mail.gmail.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2f7dzz2rrNuTE=4VXgkM55qvYY1SANcZE_8TutkJ+SAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAwMSBTYWx0ZWRfX3J8ZDNfYyS1e
 Y5vdAB4cuddbFch3JACRF11HB/GCp/8aImnBPA+Kl1WxgAkqhfWD1EyjxgdOVMShzgqhnsWV11U
 8OLC4KLSv04q63AOK8cHXMexkMyo/nh8BEP9k2ni5r5y6ls3DVk7Uyvmc8HOSWZPQ9Ozybh5xgJ
 YvH1FmpoZjiHqakDq0UgVDkLqE/m0+DLL1SabU4KToMwG1tkUwJDIE2byhuAQE1/JTUKh+12vbB
 kFELR22dHCHOtUBkiOVoQ8T6B+7ooeLi3uVBMM6VVQOX6zvPURrgxtO5l3buw2TlCngNxlQWSsP
 R4Fc3j/AHnGotuJNedIxAGFP+h1UzxJ2Y7S/2YwAR/U2h9DiNyxFg+9BV6fiO/hM6GQXoXr3shh
 q+xf87E4niQVK72VtqCZBDV/BxeF6u6NYR0SsFVcjVsF6awELwBqDAQ2YFMi57JW3+BFQTDoG7p
 0decMKoOhdmBPWeavsw==
X-Proofpoint-GUID: NNxqHA8X1KJRi0TaBK8qJl__5zZTgNUb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAwMSBTYWx0ZWRfXwhVYR7qjpkoY
 JfuzOSxgRq43BoZwql7UcChKyJG2q7jItjfCpNLJBR2a0IDDW3KvOk0nkb41J/RA5vMvW0UTk+J
 nAfSu4IQa/i3QhszmmqL++0Kdw+F164=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adaacb6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=rkvrVZJLu5XtR-8f-ggA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: NNxqHA8X1KJRi0TaBK8qJl__5zZTgNUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230001

On 10/19/2026 7:15 AM, Loic Poulain wrote:
> On Mon, Oct 19, 2026 at 1:24 PM Bryan O'Donoghue <bod@kernel.org> wrote:
>>
>> On 19/10/2026 11:24, Bryan O'Donoghue wrote:
>>> On 18/10/2026 00:00, Bryan O'Donoghue wrote:
>>>>> +    unsigned int        lanes;
>>>>
>>>> This statement and how you go about using the data aren't consistent.
>>>
>>> Re-reading this.
>>>
>>> unsigned int trios; would be fine too => data_lanes and lane_polarities
>>> is a multiple of trios - always three - does it imply that the first
>>> three entries in data-lanes == the first trio ?
>>>
>>> Presumably.
>>>
>>> That would work too.
>>>
>>> data-lanes = <4 5 6 1 2 3>;
>>>
>>> =>
>>>
>>> trios = 2
>>>
>>> =>
>>>
>>> data_lanes[4, 5, 6, 1, 2, 3];
>>>
>>> trio[0]:lanes == [4, 5, 6];
>>> trio[1]:lanes == [1, 2, 3];
>>>
>>> Probably "trios" instead of "lanes" makes more sense here and the driver
>>> just always validates that count(data_lanes) % 3 is always false.
>>>
>>> ---
>>> bod
>>
>> I'm going to argue with myself.
>>
>> data-lanes = <1>
>>
>> =>
>>
>> lanes = 1; // not trios no need to introduce a new term
> 
> I earlier recommended using "trios" in the other C-PHY series to be
> more accurate and emphasize the distinction from D-PHY's (two-wire
> lanes), and because it is the terminology commonly used in the C-PHY
> specification. That said, I'm fine with either term, but yes, we
> should be consistent and avoid mixing "lanes" and "trios" within the
> same structure.
> 
Completely agree. I will be using data_lanes to clear ambiguity.>>
>> =>
>>
>> three pads on the Soc
>>
>> =>
>>
>> The question is - is data_lanes required for the CPHY opts struct ? For
>> the qcom CAMSS case the answer ~ always no - we will be attaching a
>> sensor and will read-back the positions from that endpoint.
>>
>> It is conceivable that other systems may want to pass data-lanes down to
>> the driver because they won't have a media-graph but, I'd say we should
>> arbitrate that then - leave it up to someone who needs the fields to add
>> them.
>>
>> =>
>>
>> lanes // the CSID and PHY should agree
>> symbol_rate // so both the CSID and phy agree on symbols per second
>>
>> Remove:
>>
>> - lane_positions
>> - lane_polarities
>>
>> Since at least for this series, they won't be needed.
>>
>> The CSID still needs to know the number of lanes and how many symbols so
>> that it can calculate bandwidth so .... lets just include the data we
>> know we need.
>>
>> struct cphy_opts {lanes; rate/symbols}; dropping lane_positions and
>> lane_polarities.
>>
>> I've no objection to the low-level timing variables myself but OTOH we
>> don't require them at this point in time.
>>
>> Perhaps drop unless/until someone can show a need for them.
>>
>> Excellent bod, agree with you now.
>>
>> ---
>> bod

