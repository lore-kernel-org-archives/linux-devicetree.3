Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA5A43DA2D
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 12:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513153; cv=none; b=dwfKrob9m3aNSZon6Zc7uW2Tt1CeCMQrXGjwEGCI3q+SC0kAy1ERkXB26PETx9oavcvC+HmHlwln8v01uze1xcb0Ui0r3XNX1t30+qoRhPav5eeXUTe/6jT2W2Z4mPRwOQaOjLEiqNYJkczQrO2e9l1fjSSEkD1uMYNwOMKJZYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513153; c=relaxed/simple;
	bh=gPGpInfCJ6WsoYHEKSt3twT3UDTC58WmSefrK7jcPEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/ZfjIyOJLI34nIHuFTAuPVkTrxFEPeFZFSOaWGar4cY/CKAfBPSUUVtirUVnQnTtqPAX4TcOG2oj5ZgGpVEYvboqqAWq2knXn9od8cYrupMWx2eSYu2CY9H8WtFEkt17vVjt9M5toV8TS58HtEAtjVeq57XVTCpxG4PqhEblaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uvw/lvtv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gaUEnlwA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uvw/lvtv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gaUEnlwA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3QMl2617297
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 12:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xYyYDdXJv+fn3EtUAfji3Cg1cIl6VuLBfm4wbAfjhTM=; b=Uvw/lvtv45LRcvCN
	zECuZeMWRuOYeUqqkDaKNBLJRSf83grZmWr8jYCWYSWiuK9bZKffmBxGDc1y/4pR
	1p2H63PXKjpXnx4Ym72/AG8+ugpzLnceYYWhWBqHmWZiSowV8zHaiC/VTNlpWP4i
	LAngysYymtFcRHghxSDPrsZZ5cqJaxsiyyUKg/9zpdT1v0zNAoWOKbESoPhQOU8B
	xDDT1j3zJN9d2E2Lvokqq8JPKuUPOrgDDi/AaM54wH11Ki8wQxlkZgjxbyDfAXeY
	YvWQ2TLtWokIk5Bt0m3yFQ2laLQMPbUAMPT2WezczOjHF+APH5lfyjmPVctgOI32
	+zOGBA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqw9est-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 12:19:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfa45b280so1942211cf.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783513150; x=1784117950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xYyYDdXJv+fn3EtUAfji3Cg1cIl6VuLBfm4wbAfjhTM=;
        b=gaUEnlwAkUO1DevYYF+y4UAj65fWqr/a7oHahkQwqks9mJecl/Exz/zEYv1R2pgKpv
         UQZbMJUAld63ySqEgl7ue77oLjoEHCFFXjc6tZOiLYbCThYhL2B43PMhh1z7g0osD08i
         II4litcwBtCP02h1GoqO0YUi3YzZRWLuRII9mdPDTT20kc/dWSkNHiWD82s56EcvYzRR
         8pKV9we7QVhDozSfn3MXsnZemNYpfooWTJKv87S3BxqMPfGR/qq0EfyQi++M85tuECLx
         9GxBqqUY6GvoULSVkGpLNJ1ukaR/bLCoJfbdTG9Ygg7dojEf7o2rU67n3YyRJ/AdFz7N
         TfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513150; x=1784117950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xYyYDdXJv+fn3EtUAfji3Cg1cIl6VuLBfm4wbAfjhTM=;
        b=kFwvym4I+oI9fSERQAX0ZX6Glx0l1P9gOBGJC7FYqeWlhhYSsHQjXtf2JrmaGMughx
         +bKA8OHlXIZNfkaid8mprhiSGTmXTphEV6bw17eC9uWC8srAZhzYUhEeUPj0cme/7evU
         luG+dCNBd3W2iSBqE9kamaKtZX1fFV3ctaJCcHpcliQf2rEVehnaPaVOauQK3FiYHZuz
         Ow2aUfir3+vCj636OPFc8Uox1ZKaQwSm9fZwpjGRLHVNZnBFrR4FR381+01CAa2uvMKO
         aabx3RJkSv+7C1ET/QBPrj3zw6yCK7Sk8KepLKupX3/lGKLOEHuxVKDnBkrB4EMmrIe0
         Zbdg==
X-Forwarded-Encrypted: i=1; AHgh+RoWfoxfppZ0WXHpue0BRYpoidfCiG2t2S5G/3rSnFjH4oruCx66wfhnZiyWYlW4EuhdSytMFvkdEZ8k@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl3zh6+3/pC3pMNaxnLggcHVieEioAPz3G6DXZJWvN7Of4suev
	DUycsfJKgXoFJO9iHGwT5ovKzjY5cLZP/oCfWC5pzF3XszKbrHzUWccnUGRO3AqeGODJfp/BfOt
	AFVMxvegUEuQEG+W/j4fqRHabAaCkb1BmVfuFzmGZaef5SJPqFf4awngpTQB28bfO
X-Gm-Gg: AfdE7cmX7uFbQjSBDVhA/qwm9wnLvnLOA3wHxqL7aP6VM6e+YdSGGj8lpdigr+r/JzY
	PuT5AdvTYhEsA213jRbbupwYAGof+o4oniNwmSmscz4gZibi9r8bwYYYCb65i/wZf7BUCTMSzWb
	qSbVPRIbPyo8VW1CcmtazaEzfrGsWmK02j9CBuzLhdvPnRi04JNnzFlRMGaiAjidKDu1IMANdGb
	3Fdmfu9tmtYgTlL2AgmcjW3kUdjfK6sv+Z/vT5XteVRqGXexDhruuL1+RMpZ4RfIn2jiZy6Hg+I
	MRbgphQQA7wEi5pY7zT6iNelty0TexTnUZuMHUgPosKFX1wbIUheLB6SMg6uz9BocutC/GugSmY
	O0IYNAu9tNn6yoZBIo35T0KdeU9IVrMgnoao=
X-Received: by 2002:ac8:5dcb:0:b0:51c:2324:666 with SMTP id d75a77b69052e-51c8b4333b7mr17388431cf.3.1783513150201;
        Wed, 08 Jul 2026 05:19:10 -0700 (PDT)
X-Received: by 2002:ac8:5dcb:0:b0:51c:2324:666 with SMTP id d75a77b69052e-51c8b4333b7mr17388031cf.3.1783513149617;
        Wed, 08 Jul 2026 05:19:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c1470325sm160963866b.14.2026.07.08.05.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 05:19:08 -0700 (PDT)
Message-ID: <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 14:19:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfX1la5blTcHEKV
 IZ6kBnccRSCjiYIHlo7Nb5ly5AKGuyIe+o/7Y+1w7RRZJKwYT3NrbI9MjZKuisP0EIqKinNzYaG
 BF7PpoHqWbt9HSZjj5wvSnL+KPwF6NtMb7axmnOyg7dUr367JizUJFPMqo+c64YP2OcMxfrZj5r
 R1Lq2CHqCGGqp7CiTq4MC4Ff2bD3FNcy1krBPXb5hzQPnxJ4THll1dke8+VQJ79sRHjdTwklPHv
 oZ8PXgsUvOFXHbICCY0QEefVrO7RLNUpZKYvl6f08IcTxO+6qMsv0/+t1w1uo862ASR3dHbzXBR
 MKzHOB2eS5JPVd2D/bgwuwjIZz9try/oSEvkhrt1ZSVqXMx7jSsdjWdGnGpp+ZR1kXzVjRBdHb2
 WHJ8MO3LqLJU/EN5AXNJ+ke0EYRZjuJA/W98WAU2cs027J+ODJKYsubuj4KeqFXRsv011zVRs97
 k9tmCy36Pu6OmT3GneQ==
X-Proofpoint-GUID: AuGkQfLuGNYnNMEaropU-tDZ_Fl8KBms
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfX27AgwM3A7xHL
 4mA5PCiMsi/bWp6zZ1y3xpj0+M51KpjeHcrWv3UHSGzWvKDpIn9/aG9dbHRz/PQhWwsmEgbukKi
 BgGck2rkZvxqebYQvFkbVJAlLUCUEH8=
X-Proofpoint-ORIG-GUID: AuGkQfLuGNYnNMEaropU-tDZ_Fl8KBms
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e403f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=y1t4v1gd98P_d2K2kl0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080120

On 7/7/26 12:41 PM, Bryan O'Donoghue wrote:
> On 07/07/2026 11:11, Konrad Dybcio wrote:
>> On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
>>> On 07/07/2026 10:24, Konrad Dybcio wrote:
>>>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
>>>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:

[...]

> OK, I can see how this thread is confusing.
> 
> The idea is to start to declare sub-nodes "on the road" to making camss into a bus. The legacy binding we have is really for the IFE domain - that is CSIPHY, CSID, IFE.
> 
> Right now the camss binding describes those things - so linking say OPE or JPEG back to the thing that describes those isn't right.
> 
> OTOH we _want_ to make the top-level binding into a bus, we've discussed that several times.
> 
> To transition from monolith IFE-domain only, to camss-bus, we should have the sub-nodes fully describe themselves as "camss-bus" doesn't exist yet.
> 
> Once we have compat="camss-bus" then fine, make that linkage, I fully support that.
> 
> That roadmap BTW is why I'm asking Antanas and Loic to make JPEG and OPE sub-nodes of camss - but make them complete sub-nodes - power-domains, clocks, nocs, including the TOP_GDSC.

I think this needlessly increases the amount of combinations we'll
have to keep supporting down the line (with a ton of compatibility
boilerplate code)

Konrad

> It means we can work on splitting apart the existing camss node in isolation to make CSID, IFE as peer sub-nodes.
> 
> We definitely shouldn't be making those sub-nodes dependent on compat="camss" but they definitely will be dependent once we finish making compat="camss-bus".
> 
> When that is done I fully agree TOP_GDSC belongs in the bus node, like MDSS.
> 
> I hope that makes sense.
