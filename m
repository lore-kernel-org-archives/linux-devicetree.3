Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A005843CE7F
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976067; cv=none; b=cBzmiEXhcP3aiizb185vXJ9lAONnzR6Le+ndA4l+MdFvVgVmif3mftb/DF3FnrI67VnWJg/J3pE9FJ2xwz2UP2bvJRNFlpqZnIVrCnH0hGH74HWMIfhkUBAP6+EVgZ5vM2V8ziBNXcnM8aBUKp+xNd/XL575xGHtdekMShnpFgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976067; c=relaxed/simple;
	bh=4/cvtqXHsCg2yJhBIIxzln1YJ73gIo2ViDJWMf8xh/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WkC3Ike5TvB9mIQZ8mO9eht3uQvAdrdDviTrTIdQnpVQocW5GH6UV5bR5psPsqpjBwGvvtJwNnbq6DMbr6wtcoww0YJNdPat5JeXm8yAZ6TUdCh0NIoawDm0MJvSoxDl+YZtwHvNXUlplhSRzBk2b3+bYPqsAnk3gMu1+h5wN5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HIDJDKcq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SMj4nuND; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HIDJDKcq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SMj4nuND"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5squ2238714
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6KIqa8NWjnhrY+o22T90DyvLOoGWN8sNSAn3IPl7xuQ=; b=HIDJDKcq54Ui5H4z
	fdVChMBtd6v73U1FQRXbqKwqT9cKpv8s59dOSnvtbum/BZ+UPsmewdigrK2TigFo
	6MnS5eMY4qXLbJATw/EWO1yPS2b6NHL+AVw5NFQalHPM4slYwIGtm/LngpL0iM4D
	JCgdPqJMBI0BFuvi9+N6CdtJ77UNDEndnNeZ20qbFoEmNQZToPKIvPNznKzhsdtu
	etGx9C0p7Mz4nFZHPkTp7mEvd5bowqYxMM8MfJufG0Tdr+hBQ35QXUBUHj1tR68K
	QdFjNM+mi0yHmXMFdY9RFhXIhYOuDpD6FAs6R6hWRhzrO6N3jONNrYAW1+8OQkfe
	gau7ug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xyk99g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:14:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso31533985a.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 07:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786976063; x=1787580863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6KIqa8NWjnhrY+o22T90DyvLOoGWN8sNSAn3IPl7xuQ=;
        b=SMj4nuNDKNPZSngGpQXqSEolvD9CANSShCMUgMec2hBbuAWxUfFCX3a/WG6XQ1ilQJ
         gs6UgOQ58LpD2xSx/srdpudZNaxWFEyqsV4Xmio3rKch0vJYsk0jR35SnMRhwR+reT3s
         gOP8zi1UAtDJZAf6CpxGGDrS6mkp7aJ6OHP80a8NCGirBb2VyeA8ETGkzDrfPlFKmvR3
         33YMC8EBIlSf8hiQxyXgFYG+ihy6hTxJtQ1vAYmjSF48AtufS3J1+qwP14lCNuzJHzX+
         s6AlrVOhIG61TRPn8F3l0S/98ybmbYd/YlelW+hkiN2VXyN5ZN3hyjsBFL9v85QGr8ts
         v3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786976063; x=1787580863;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KIqa8NWjnhrY+o22T90DyvLOoGWN8sNSAn3IPl7xuQ=;
        b=Rt5HPxqfUmbKG7NwxHxFIP9I6XUsHcnxGUktD0JDaw2iAFrlyojDlfNpO4jSlgn9PG
         ApXG/lxBnss4HmFlRE0EGLKPfIEFV7q60lxC/m0zl+NVXoPQsul/PtqMb2E1MOpS/LIl
         b4/NfZk7kw9Y607sl329mZPJmXIg5VUdCuI9jVeQkE5PatWzNRhr7ntJ/A0fB9rRfK5n
         SJt9iT9H66q7WMuoUMhya+NTNvG5vObaCrGKTzV2kN3e7JVxQgQCiEkyO+Qo79gEMQpy
         49t17YIJN0wtRIPPDB1N8hR7WCIFs5Sb3edhr1dmLPdKcdplYxAUcYnhkF2Bme0DHsu7
         CdwA==
X-Forwarded-Encrypted: i=1; AHgh+RpBPUhJLETGVxUp3L166eP29O34q4jBhB52TfF81Pt52hBpQU2gAHyNlG8KjDdwhY03erVEBBLsg4VA@vger.kernel.org
X-Gm-Message-State: AOJu0YwRiKxi/IQXw8UTEDq2wrN3H003vzALZjTnlgi6j99ycIgyzVGp
	6EdrSSlMohwHyJtOOXU7K9NofvAvucbqTHhFy9xxrLTnylVhtxSUArKVM9UqmxKv6A3qGNtoKwY
	IFfXGeiFdeXpic0Qhx1gkqizM3U8tnik2FCYd49g8E92MMdeTv9TI43PNm6oa/1rV
X-Gm-Gg: AR+sD11yC/JWyQJaxNH7CdMW+yN1SJGSuTliAYLPzP4DbcosCJxI3799w6lflxSi59a
	atAKMrhO3+dxRhe760EIHi0f1rro2goPSLFiyeOyACPpqDVmPARYazCTojrhGsa4lVexxSv0dN6
	sbdqRc/aCSX409mZrzer/8DqjYd5ehLdCmM3A9yVGQeoKWYrb60wg6xm5/vIMTi+c4oUyZEjf6J
	/spiTCbU64a/EoeNEgqF3EycMCmfjrKtonpTB+Z8wt1NXPUCUQhNLvaQv1MDRBiLJbPDcP8iY+e
	dKWXjFVmACa5MoJtU8oaayyCvwXs1Q9Ab9HK3mvemEmrRqqQ/RHEYDwONJIHWLypV4YM0TfcDX3
	GXIMYpkxEwWCspDeJwTFg9zwE
X-Received: by 2002:a05:620a:6910:b0:936:2f59:dfe4 with SMTP id af79cd13be357-936d1edd4fdmr1907563685a.0.1786976063498;
        Mon, 17 Aug 2026 07:14:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:936:2f59:dfe4 with SMTP id af79cd13be357-936d1edd4fdmr1907555485a.0.1786976062918;
        Mon, 17 Aug 2026 07:14:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d852d915sm757705a12.9.2026.08.17.07.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 07:14:21 -0700 (PDT)
Message-ID: <db2a18aa-f5fb-4ee8-8747-05fcf740749f@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:14:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
 <5341e732-0deb-4d00-9a7c-595e317bf1e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5341e732-0deb-4d00-9a7c-595e317bf1e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OrfZIYhID-tlJpY6Qi5h3usH8clSv72j
X-Proofpoint-ORIG-GUID: OrfZIYhID-tlJpY6Qi5h3usH8clSv72j
X-Authority-Analysis: v=2.4 cv=dLaWXuZb c=1 sm=1 tr=0 ts=6a831740 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7SNk80zgYqIXXrXIq28A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwOSBTYWx0ZWRfXwn7e615eIaZJ
 Mueps6sBOvB9xrjix3tYRFMIQ6/6w2tWCxl6YuhapchFdMII8pUntXB+rk9Xzvgq81RQQ13nrU6
 8GCOhDbuZ1JwgY8LXlKQUz/L7qR4cwfepKh3CiS3AoZqy9IWUki51N6ndXPvcDDpPFjfOxMU8ph
 3E/NFoKLAjm2zzrEMlWfh45NgZFI9pyACWiVny23s+SHJSkI1k6TrpB0VDKS8+OaeaZvRYKuz0z
 uuOWAf3adAtu8PocirOK/rYes6eYUqllsRf+a2fdQEcLd3K579MEsG6lsTXkOWKdJbBJA8l5Q1M
 0BXWP3PLEiB7ITjP6MkSqbj69Wypy+AU0ik8zYfo0gXHE4Zsqrs7Jzv40I6Bq+U6bNq+uN5B63G
 2m2t8XYrEZhBETYt4A9x6s6akZ8vUqeo20OGmMC599gu1nmwco1ZG29/dXMd9SEC7ckcxTcv9ny
 GRAwQMLLbGwgexQOxsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwOSBTYWx0ZWRfXzv82tcgKLMh1
 7eyuNHy1lN0/seOYs7wYHyfYceO0aA4ZTHrzzwWH90eGuPZMUNeiy2kL2D07IMj9aNuRzJBvIeo
 EfN2JDFIX82uWRTjHPKfBtGiebBPchM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170109

On 8/17/26 4:13 PM, Konrad Dybcio wrote:
> On 8/13/26 9:44 AM, Yongxing Mou wrote:
>>
>>
>> On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
>>> On 7/20/26 10:43 AM, Yongxing Mou wrote:
>>>> Kaanapali (SM8750) and Glymur use two display power domains.
>>>> CORE_GDSC powers the main display hardware while INT2_GDSC
>>>> powers a subset of SSPP blocks.
>>>
>>> Can they operate independently? Does INT2_GDSC need to be
>>> powered on after CORE_GDSC?
>>>
>> On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should generally track the same state, except that INT2_GDSC may be powered down when SSPP1 (VIG2/VIG3/DMA5) is unused.
> 
> Is the MDSS any useful if *only* INT2_GDSC is enabled? Can the INT2_GDSC
> be enabled itself if CORE_GDSC is off?

(I didn't quite know how to parse the list of states you provided in your
reply so I asked again)

Konrad
