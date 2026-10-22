Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658580;
	b=FrvR1FfAsfRTUJ8JDRmPeGtZAmn0EV7IF4Woijb+pxA0Gc3HPni6o4SOm+721Aopopeg
	 /RKaSG6DKmQfyE2da+byh2Pv5Ouy7q1MdaqzxP9bn1t/mjHtIOV9T8MjVx2aSohjxviY7
	 vS9HHLSF6UVS7qZXU/CdU9bcmrP1FD3B0jzgGB16x/LCnozDkRIQx+/yfkfwpHrp3YZgj
	 3HN1wGrXLIB2regRccn7B7c8Z6pSKGIb8NterFyo7/LtjfbqPGhENESRFWLdclhrs3ix8
	 EaTczRDjP7f/FBIGgYC/0pTedwtni8IdCrsF94h4mLvLTMN7kxzV5ac5kUka8H6uTiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wq4BgAJOxS33r70ErOyo9pTWYNHSqnL5o2cT/KMQO28=;
	b=DYl9kRcceWM1ubTcmrU4WrVyyoTvE/PnEEzEFXWgdosTsLrlvM8qNlgX69wbRW8Qm+zc
	 T/eO3i6wN4yDm+2tRne7LuyfQbjGmQW5ewv6Y30qwU12oHIHgDohWnouorcLabVe2MOr0
	 seCfsJs9UY+a/6zvELBu00snY08oVwUJJ+L3n/tC4IodUk7JExTrl5zjvLcn0XLkrpduO
	 BPN9QnQv0CIahoJAQg2T7sPJ8Wyc7wKnliTvGhWQ2e41pvd9b1M/vaPy3ZLKPCzvK7vJD
	 0pPJ7FJ8suNBYEcYMaC7oiQ3YShGClx+L0z6lbfMXioz3HYvRNlVjTrjF3wPlFWVk2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UCSGe98M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ichuT6E2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627B2606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 627B2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UCSGe98M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ichuT6E2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M706Zc1995975
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wq4BgAJOxS33r70ErOyo9pTWYNHSqnL5o2cT/KMQO28=; b=UCSGe98MnsUuyhDh
	cA4uW5rR5UfdQpzTvdb7KUu6cDh2Hmxp88qSgVTeaWnaG0yqed3z9VB2MdSfDRsq
	+yTRKUL2p5PDaPOe6cfSQdLfGCUTsJe0gbtZWp+/h3e7XTxmqc0SqFFnnHEcdmbF
	WXjgCfFgYoWxJr1covmyXjKMvaHEF6TXRbWgVuwAw3cgZMColKh8Qwff1DQjYX3q
	D+kMMoeSW5v2DBTAu/qdXd/JEJncGxt/vwCzQ1kft4K3PWj1gjPv6NH+PskCJMmZ
	6tZxgiyZK9/ttGnh05MPuQyBBjZ5D77xkVUsK5jyU80XDl7hk+a3CtCI0WKogg8E
	ods/jw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsfpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:42:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so1323105a91.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 01:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792658578; x=1793263378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wq4BgAJOxS33r70ErOyo9pTWYNHSqnL5o2cT/KMQO28=;
        b=ichuT6E2x4Tp4oysE2ZRo7yJe+flVEBM/gy+fGinn9yrQAhu0HqgzF2oEcmDpmWES/
         JC/sIp0BjR1/b8HSQZdFcn2cl9f2jDWmV8jDeF3PYWg2E8+F+9xSjTNw6WwTYtp9pAJL
         si/eVwYdS1v8qMw4agZznSe2AqNFa1cvjCn4MK9ZZvWU1Rs1nEQ0+X9RVQ8/1DzB562C
         a8i5hF/lG7WuCpAx+cQr/5iiIPTtaPJxy7VizD49JHkArLTvvK3QhBVJCRxGvg+W6hXI
         XxyhnNJc9+lTnqth51DYqckeHC6eZqTRWdqulpZwhbLrx7hhG/HA6QRGqSA9nTfU7bXj
         JfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658578; x=1793263378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wq4BgAJOxS33r70ErOyo9pTWYNHSqnL5o2cT/KMQO28=;
        b=jW1P8ZB9JCWhMQ9hRYmAz9wdIVcfUDfkPLKPAetDt8ICNp3o2NvNSqmD0C7N7Ve2G6
         a9a0O9V0PALYU9OMqwyVfyKZeg0B3z/xlQG5RnDKcDuJbbjKQ+aVpniiADDUStfkNfzo
         /3Dla1dZQSaWc7xFTpp2PczoXb1PpFf9i2tGtrW4cZRbhc0xkm0aRsPlmXYdQup59KDN
         GI+7t/LUosF63I9u5WWqNfW5OqQfyl0oq+Pv8WmLVjLryPK6Fy1CjIvS6KsN7KIYr8+y
         6tCBLBlS3t75me4dKRbBy6CLmM8UhbxECuYq/t07rMV47NQExDL7vzlv/k2xYag6+yjy
         GdrA==
X-Forwarded-Encrypted: i=1; AKwUvBy50TNXDPg1w4wetpz83gK3d7YDUMI0FwpiaGaBMMhCO4Ylgc5ER56vGnYVsFrEUUFfuksJeawtfH+p@vger.kernel.org
X-Gm-Message-State: AFq9FYJrs4NrdNQO4dCGFfn7j6CBPI39cEe6dSKk7l+9gy2xgsySDsLF
	QdNPc58DcZjSm4qO9k2snlMdo3j7Sk0n/xiEOBUoAHFf8LId6K81wujvSOrJp1EOPuCKYI29Pfm
	cbQdxRtdEUi3FZQfs4FE0xGAbMmshmLCboXIjAZCy5U2rX/uounUGKdQqG6rlMQeg
X-Gm-Gg: AYBFou2fXg7pMixfuJ/7JY1U+3BYXz9zdT6Yyz7QoNKTpWtlEviojmlhkY6Oo9O3J52
	ANlGHgxbpfrjfdnmDGrUeN8dU1ZFQ6aaPaOy7rcEfulIIae2yUGSEeBX6qjK1S3/LnVmq93tt+T
	4bBP9fv1i7qz9xC4lcY3UIdLdkMLH5eWcICMyWbOumcz+v8x+tRtNBJivVIAE/pznFlhIXSs1Dk
	afsmWeHoXQZzHP59ql5H19qDBMl2LsWAUcDvLd6Kryl38j6RFd4jwUJxvhDXH/Qj6ozJ1mPw72V
	PtTcU2XnUhdsRIzV5wgIojFXmUtM57NJDetCV6BcQjHpm8An9uq4H4/pwXxBXFZW7EqCr9dKVyC
	LKTeIibxM73i8ilKGNFNd6zzJ7UqH
X-Received: by 2002:a17:90b:4410:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3ad86e97863mr3524483a91.18.1792658578409;
        Thu, 22 Oct 2026 01:42:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4410:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3ad86e97863mr3524466a91.18.1792658577942;
        Thu, 22 Oct 2026 01:42:57 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada47f8ff1sm3380433a91.0.2026.10.22.01.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:42:57 -0700 (PDT)
Message-ID: <6f7aa923-e67b-4bd5-bf8b-085623d094c8@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:12:50 +0530
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
Subject: Re: [PATCH v2 3/7] regulator: qcom-pm8008: Add PM8010 mode support
To: Guru Das Srinagesh <linux@gurudas.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura
 <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta
 <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa
 <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
 <atXJp5ct5jANeo0T@gurudas.dev>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <atXJp5ct5jANeo0T@gurudas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ukrGASvA6iBBXYYsQ7jgHJZj1PdQ0ho_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX7vU084gvXHBf
 qqhWX6XeiuhOqtBg5qzq2qmWg/kuhhhOA8GMo4zcQ5RJv8ie0GWEa0SENWGrUSzKi1QQgLhgCgY
 DZh05qFYN2RjQJ/QmB4VsZDjxKoN8xQ=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9cc93 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8zo3re30kI2txGzbV-0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ukrGASvA6iBBXYYsQ7jgHJZj1PdQ0ho_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX7kvPzkhSpKaV
 HF+75G0W5j51v7OVyYq2QNEcbPIgrGJp3QSfz7TVAmVrQ7c/pBj2CenzY58NshGar5QH7eS1llb
 FRmU6xu1o0w8yRPtV5J6OwbaU4mcDLJmeMC3vLTX2kUedg4rqiqqo9CNRKqtkjPNxROdKRRw2qm
 6qroT3Di6Yi/gnaNdS9kcmz40juwb2PrWSUO2iOl/01xlyPnuxVdfd6MOilgrQ261AUcAlvVOWX
 yei0LyW96qqbyuMU/r1x+5I4a6BtcfRm1vPHzwYzYxoeR4YT9yG4R6qSA+rhqFoD7tiMJ5yOLOA
 2xYmr2pVaBT4sUK8ncgaj5tOs0aKghry77LihHR0i4jN+iXlA9J8Z3ADNwChj1QtutbvETPh4uE
 NA8I6O0ci47kBRqYsppzJYeXM5s3nqxVCreTBvHs7BjjvKIgJdQbb6fu8cw1Tj/0aWA3GiGnro7
 qlXTyzUwtZ3+kgISnkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220034

Hi Guru,

On 10/19/2026 1:11 PM, Guru Das Srinagesh wrote:
> On Wed, Oct 14, 2026 at 04:02:00PM +0530, Jishnu Prakash wrote:
>> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>>
>> Implement set_mode/get_mode support for PM8010 LDOs using the mode
>> control and status registers to allow clients to vote for LDO modes.
>> Mode voting is not supported in the PM8008 LDOs.
>>
>> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  drivers/regulator/qcom-pm8008-regulator.c | 75 ++++++++++++++++++++++++++++++-
>>  1 file changed, 74 insertions(+), 1 deletion(-)
> 
> ...
> 
> Patches 2 and 3 both say "Add PM8010 mode support" in their subject lines and edit
> the same file. Could they either be squashed into one commit or have their subject
> lines amended appropriately to better reflect the changes they are making?
> 

The difference is just one word, patch 2's subject is "Add PM8010 support".

To distinguish them, I'll update patch 3's subject to "Add mode voting support
for PM8010", I hope this is fine.

> Also, patch 3 uses the wrong subject prefix "qcom-pm8008" when git log on the
> regulator driver reveals the convention is to use "pm8008".

I'll fix this in the next patch version.

Thanks,
Jishnu
