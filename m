Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792717599;
	b=ixcYYvyq5qYwkD8lkl04kXTX9uhrM1VqtdYT0xeQ9Eah7C2eEtzwzA154pvOQ6QO7YN1
	 nWs8GM6ESyR6Lags3thsBx2SdOpdnif7qJX5uiicKFQ+Hee9LPgUhEXg8Qbxl02EeIaVG
	 8sDil1e3rPGckOMxnwOj9jUoiOkJtuKnz71p2N4FKq+khDIBNcawAOv5zzSFTy37Z3eIE
	 AHRJoUPCALn57syBsYlbr/0PJ1YlBeZ49F3WGEc5rIIRJ2HrRI20icnLP88p50ksV0+bQ
	 ftY5510dlak60ZafVHv19V+RxKZUmdYddnnKWK4OwUTus1tKc8CA0+PFmIiEpf4w1Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792717599;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dfuW0wNWB+8VJLorrjVBoDy4Ob+iKOb6dWhlcZAnFYQ=;
	b=Vq2wYmMz8ZcSuhPPrQKaQ+jJBnk1uC9p0FVhpEnB3jP3IxSRJwaBjZ3figK+hoJ+XLUm
	 ATI8FlfJi1j7vU8OsmRq1J33zQzxbtB2tDA+pSPDLtmJTmgvMezEivcT7hRwyB/a3cOng
	 6D17Ir2Bv4Wwtr4DgJbwyuAt5u2IkrCvwxstunFIdvzlJKhrqrXPPNWZ2ONJRy/GsWjmo
	 MS27tSEAAjphsKM5h+zAxyVx+XOFLr/lKrhRyWugi4RANmRsru+D9tNwGg0a9Dt90Zqd5
	 BNUqTQInCN4v8aZZujoMdE7I0vAalo3f1YjQykdCghzHGgq7OACFeEENbegjPd3W09Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bnIxPimD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bLe2Me/2";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8988606A320
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 01:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8988606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bnIxPimD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bLe2Me/2
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MMF63X937918
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 01:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfuW0wNWB+8VJLorrjVBoDy4Ob+iKOb6dWhlcZAnFYQ=; b=bnIxPimDxayqnUXh
	GL1+VNL7lausi4gGZLDFEgRk7OH66jnQllF24jrKXDHFdt7eCoXO/rVsl+kJO/Ya
	plgnq1OPZR7X7XjK2fHrOGhdqM/q2Ic3PdnmcRsWRW7v9fj1rpQi/A/P9oNgt8WS
	UAdeOLy1239U69RmscIvZx/0LEQYDONepK0OTNmVGE3fA1ZbejHM3FOmOZxbmycd
	zs3l7SNqrrVf7wyWVsuT6Wb2CrT63tUupeEEZkyhzvAVjwE5hbIU7BWdzjUybgnO
	77wB9wLBFkW3xYOUs2CBgWjorzITB4cD1uynoUVMNX+u7muNYerXM/pcM4eFbXA4
	Li74sg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftyg8fbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 01:06:37 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1665200f4c2so436811c88.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 18:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792717596; x=1793322396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfuW0wNWB+8VJLorrjVBoDy4Ob+iKOb6dWhlcZAnFYQ=;
        b=bLe2Me/2XXySwZTWlxxsl436z7yaqk3CxpoNAvVkSOb20UVatStchaD6y1Bg0k5jDD
         bAwvoMb84UO7vgquD9q9TVnqesHNilI1P3PaIZzRoxVDDHHM1DkiFvABEIYbRTbOYd70
         eV9QhRsOCRb/jHYx0efJ7HfGYvH3hf1vFsyL70CRl7AK3LQQ8HcpWXuBtQIMmytKGsMx
         jtGOgueyUOOqpW/GaVUWORkDHMbjoykY6acheQp+XTstIJMn9kOBSi6hjovuJyuPB3/7
         K2GO0+CsDXV/kgquJh37ORBuVaCGbCg5gbbQt02F9Lun8WYvL6Nu/Iyb+rMzF6drQudK
         nsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792717596; x=1793322396;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfuW0wNWB+8VJLorrjVBoDy4Ob+iKOb6dWhlcZAnFYQ=;
        b=q8O4fLExOwM9QKYhrQjCwdkxFWvY9AX6OTabbNq3KzZGt9DVOR5ZvXeIKFkU7kwD1M
         zCKAKFno8lwvsv24NJbV09HzgLtZHqeB8xI/oWOFBhCFzLcrUdBS1EvWbz1jruuM/Tro
         kzlnPJnO257UNvjspTTPf41WWpUwfTzhFHkr7+lDp3LNWurmxhPvGr+bpM6R2jKmFaQR
         NYOG5XaY2GUsPrNuISnwVbsSP/8NZ6oJODOJ4wVFUQpv8EhdfRQeQv2zEoTRGqcI2aSm
         D6OT+MARGAiV/FYEw1FunAAjZbVMnB2qHR+RLeCSr6eJe/xBJ7uPOVCxXc8gMAYomSvn
         ETcg==
X-Forwarded-Encrypted: i=1; AKwUvByzcthX89tzm/yCg/eG/SUKIsBcmB7xjBMIOWOvbLkEEtzdDi/0B+rCO0j2u7Calh9VFruvLVg/e1SS@vger.kernel.org
X-Gm-Message-State: AFq9FYKes7b0sDuql2cB1yxk5ks6cBYN4ogcm57NVVMfcELDtQr9iJrj
	4j9WJb6KNeflQSpFJ0KlEb71yALGstZkToiVaKD+qUfjmexDthca1d3iH1nJcqF1n8EyGmpSmb1
	eTkv85vnymqGsTuC5BvL4whIRFHslPcyoF0EkkvBT/MX9CmrA+k3Bg27U7jSl0dbS
X-Gm-Gg: AYBFou05OrapAyB7KIm/NSmPxLHJ0iVqizl3N5T+3fhSd9rDUmr7feV6c3Tuy4ayYpC
	fn6fHBghBBpyYzJlayzPhaqULM9lr4UDI8Xz4Ao6krnkXF4VrTbcEyTHyiKNqg/K5UF2c43y5Iu
	6U+qC0NS/d7ubdamshyWj+YmiCv9SdPGtKz04vyVE16M8jZZCyQntxloh7a5UOlbQJGw5S8POTK
	VRZy6tKlI0zMLp3YrXE3MQ4SXDlk4XDiOHXbwTnOvNGlkgp2hJWWUvlJyEP/curuIScNp0I7T3q
	kvIszFyOQsNx2czi92bBsNxp/k7Fhf9ug5OqY5KJ/R/Cu3a2D3eMfXYy1YJmBUteTpjE0oeKaD0
	RyNZAV4JyW3CX6hgPfiONxXV01WkeJZ/CQXADr/wAkW0rmSpBo7yEFg/i
X-Received: by 2002:a05:701b:465a:b0:195:76af:b810 with SMTP id a92af1059eb24-195c5cbc3e0mr1043931c88.25.1792717596442;
        Thu, 22 Oct 2026 18:06:36 -0700 (PDT)
X-Received: by 2002:a05:701b:465a:b0:195:76af:b810 with SMTP id a92af1059eb24-195c5cbc3e0mr1043913c88.25.1792717595831;
        Thu, 22 Oct 2026 18:06:35 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eb9afd61sm1877551c88.14.2026.10.22.18.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 18:06:35 -0700 (PDT)
Message-ID: <7a593e23-3f35-443d-9ae7-2ebc031d41c7@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 18:06:34 -0700
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
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
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
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <324dcc61-6085-446c-8bf7-564486f319bd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adab31d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VgxvMbUO6sPQWDWUjzgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAwNCBTYWx0ZWRfXxl+/sEW0f+03
 ok5awnTQ2/KiyS2uFEAeYEj2YDL9QtwyqQXtChBfLTLZXVqErwgbYFNnqtacvRozsIyoUrshAwx
 zjuh1DnMhlD682hlaW/Fju2+KPDwVVM=
X-Proofpoint-GUID: FfeYsFbiNwDIkHBT3Yu98o5gAhtw963U
X-Proofpoint-ORIG-GUID: FfeYsFbiNwDIkHBT3Yu98o5gAhtw963U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAwNCBTYWx0ZWRfX4qkAvW0fOxg1
 6SOapB0bu0LQ0yWTF1uuItZjKrlGah+6tg0Cbb3Zzz8aCuEvOV4VH/0ueIdXjp0XAUEFwCUWOeq
 YXpIU7momdVF/dXchlCf6QyAvPgjpJ5b5MCEHE0uyKopFLJfxFVULPAXNNFTMKTXv2dywaDRLdN
 +W68FrGfAVyDoy3qadty8xZOtgna/NAHyC0FdQxoMmlIMOUoGvUBjYFQY/GSH3nQ1wau+rs0YD9
 maMhks7WL8aDeWguxQJL1Ns9Lac1dD1FqA83bOu/ViHv0q3tl/AqkL5P90AJsMm+svVp+3RuciD
 GjCbZkTVppkkM8x393m7G0HQGw/JQGXYO4A/fh1Iuw8NuTtNJ0rgKArSvO7Vq4uwORQD3tzdI9v
 fxn7Ip6qzPWMmaG5zPE/fkplrWCU4C5cwVtbfTOqWAQnayF5yByMl2exkVT07Lyju0+dG23iFqv
 54SywaUupEYr5ma0MNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230004

Thanks Bryan,

I align with your thought process. We don't need
- lane_positions
- lane_polarities

I will add symbol_rate and fill in the data appropriately.

Best Regards,
Anusha

On 10/19/2026 4:24 AM, Bryan O'Donoghue wrote:
> On 19/10/2026 11:24, Bryan O'Donoghue wrote:
>> On 18/10/2026 00:00, Bryan O'Donoghue wrote:
>>>> +    unsigned int        lanes;
>>>
>>> This statement and how you go about using the data aren't consistent.
>>
>> Re-reading this.
>>
>> unsigned int trios; would be fine too => data_lanes and lane_polarities
>> is a multiple of trios - always three - does it imply that the first
>> three entries in data-lanes == the first trio ?
>>
>> Presumably.
>>
>> That would work too.
>>
>> data-lanes = <4 5 6 1 2 3>;
>>
>> =>
>>
>> trios = 2
>>
>> =>
>>
>> data_lanes[4, 5, 6, 1, 2, 3];
>>
>> trio[0]:lanes == [4, 5, 6];
>> trio[1]:lanes == [1, 2, 3];
>>
>> Probably "trios" instead of "lanes" makes more sense here and the driver
>> just always validates that count(data_lanes) % 3 is always false.
>>
>> ---
>> bod
> 
> I'm going to argue with myself.
> 
> data-lanes = <1>
> 
> =>
> 
> lanes = 1; // not trios no need to introduce a new term
> 
> =>
> 
> three pads on the Soc
> 
> =>
> 
> The question is - is data_lanes required for the CPHY opts struct ? For
> the qcom CAMSS case the answer ~ always no - we will be attaching a
> sensor and will read-back the positions from that endpoint.
> 
> It is conceivable that other systems may want to pass data-lanes down to
> the driver because they won't have a media-graph but, I'd say we should
> arbitrate that then - leave it up to someone who needs the fields to add
> them.
> 
> =>
> 
> lanes // the CSID and PHY should agree
> symbol_rate // so both the CSID and phy agree on symbols per second
> 
> Remove:
> 
> - lane_positions
> - lane_polarities
> 
> Since at least for this series, they won't be needed.
> 
> The CSID still needs to know the number of lanes and how many symbols so
> that it can calculate bandwidth so .... lets just include the data we
> know we need.
> 
> struct cphy_opts {lanes; rate/symbols}; dropping lane_positions and
> lane_polarities.
> 
> I've no objection to the low-level timing variables myself but OTOH we
> don't require them at this point in time.
> 
> Perhaps drop unless/until someone can show a need for them.
> 
> Excellent bod, agree with you now.
> 
> ---
> bod


