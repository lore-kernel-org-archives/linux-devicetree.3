Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704809;
	b=Dg7fLYItOoLFYi8b9BZHI/kVnPnLAypfeLOY338BA9Ew4CgUpWe5l4yw5c5PFdgnxmdV
	 f/6oQT6TFLnDTeQ2orFhVwkPbrNpEPq8zrf7Gj8apXBW5G6GnGFmLhHKNwt1N9uqEaY3b
	 dQKREoVeipsHb+WL8EjhGbbQ5bkTVDgJ69LzOt8hy2KYTbh3utXfm1CMvNOzhnd5vwHOd
	 Hs/89KTumcPdUwZ7JY3w2iNtJ1lNDhNDOG2JV3UtsQxFh6i9Xc2VSY+NthxKXPj0qLJcX
	 Uv29AWpXGo6bQt33y5CWMHM4Sz/bWqoSuU290KjD9PdLaAScFdpcnSeiYWUdfczSRpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XQNAN6Vy4siPlthRoQH9jet8l2I4+/EnJVydI4yjk1s=;
	b=WFe75ycVOUPFtaY4+ucFos6IhdxBTTY1hKv95v1sNO0ByvG1uvDsrzT9jhYnXA/n1KNE
	 Pmk1KA3LpOf50tfcxKjkWr/88lib9nJb8loAmM88/sJo6FDIFnW94HfaiW4gKdn7FqWy7
	 AdTKVaCjEN43vSGfxyYyBKiqSD3+lhX0pkk84LDulUzEYZ9OEaaEsDL6MoJghBmTS0RYV
	 G1TQUG5O7smiBPn8c/RS+DPjzpQNoFTbmi1wylzjlkKuU/tb60UNqoqzfrIMGMzOq+ENR
	 VaXyylT7bTZEI1Zv9K+08jq5ZM6MiyiEpHN4Cz8dOPeoIDz+V5Nh008nO+k2RuCLfJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eur+LAM4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Adqj5ofJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC632606A32C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC632606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eur+LAM4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Adqj5ofJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEUxcv3563219
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQNAN6Vy4siPlthRoQH9jet8l2I4+/EnJVydI4yjk1s=; b=eur+LAM4pFbOfhIo
	2uB6AtdRkfgb4csfaXkpGOzp1a1TwKFNiM39Swed5FkWWMFuonAI4JqPsHNhALHo
	wWiOWniIQnfsCzkKggHON/1+EEl5ZX/55r/uE8BnosJhV9e8ZNsY2sxGGwMrk3O9
	aWBnM0Iu28wXw/mHvi8d/on3ezXuOpVXLwY4W5bhXQYhjAgt8peG48y3RO3BEv+r
	h21oEV6PXs9YFK21TR1sm2rp/s4LHVaNLJYTN7jMOvpoOdg8wPO1zQN6Gh2zasMY
	8ppY8rWEchIoDbvZ2hfbRKRtNXYGSWZnaJzxtlf3w4v3I4BIJGGK43QjjKIUe9JY
	ES6nFg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sbke8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:53:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a65fca25so6212916eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704807; x=1796309607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQNAN6Vy4siPlthRoQH9jet8l2I4+/EnJVydI4yjk1s=;
        b=Adqj5ofJ3pYVkJYRH3fVXXiB1VYmwIYxcozwCGw48Yew08Xz8N2KaWNqO407I3f/pb
         0mLoFQkVrv6z/V2bS5/1HKLerhSnW6Zu7bx/rkoE1pf2NQDWsr8x1znvUSEcnvquVyPa
         8q+IikalaKa1R8Pb2vURCOpXs+pIMCEawQCIDuUuK/konpFwwuqhr89PSzL6qgVSI2h5
         W5OzAUfpZWy2EF7WEXmcCpZmdjLtRnie1AnDpYAgE3wP5G+Qm2OYU866wah9UwXWReZC
         r6g/VAK8Mvk8O6QkCS4NGg9JdNnG615wSl2BMGBzPlFtcJftkyBTDP9Eg2VEU2cxsX8w
         +Wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704807; x=1796309607;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XQNAN6Vy4siPlthRoQH9jet8l2I4+/EnJVydI4yjk1s=;
        b=u080E/HKJZm+2bGRQsMapb10J2fOzvT/Q2UDuDVR6jWeVetXETGB798bG1eUTs9zVJ
         6rd5deJloBVPaPAn9neVU1ioHmEMO0nS0hRu09ERvubZBs3vtye5JgPgten/PGLE/pA1
         DeFnKnyXPD7QRG7SO2GRvt8LIg4hltHoQ/rlYnfPGP4MvVXhMtYZw5JEfIv6ZC9vt3ee
         eudZOKzC2PZX/M4jjLVW6t+QjtHOrYedOIfICjfDHyHuRtvywxZjK5WROgjfo7AEE4RG
         jdlG27E9vs1pWNe/qtRMVVEUBWkmTjRTIKVLOyjWoFYBPOyfPv8ckev6Ns3A2cruCvBP
         cWRg==
X-Forwarded-Encrypted: i=1; AL+hErFEo7fSoTVuJ7qlsNNOQhj/SnS1qhbcL/n9JYwZ8wX49b1Lqd9Ao/Gz93MhweF5arSb7wvdzGPYTj8I@vger.kernel.org
X-Gm-Message-State: APuU4Z+8yjvewZhvE+/hPB74P2x7X3xyN83nQWuGOs/eq6lsDZUbTTpF
	lMqQZpaxXGe9XxhU1uukMCm7bq6/fAfVoQ3FiftdAyJ1aSlflNFDrhrZfMlVnYNRPnaD9O0r3Ap
	A9aq30t17ScGkMekSj9tre4VuDUEUFOmBq8TzOgtBzB5uw7nPxIwseKl/3e4DSD0C
X-Gm-Gg: AZFdTZdboTpkmCRKAAqEFU+DahDlQYFnZjyGb+/tiG/5mEbx0V9MnFTU4aQIsC9b3Wu
	q+xMUzXDkw0RUrqIyWr4X5qR81l3FIlcya7lN3B/J6jz5G8N1wpugLt2AVGPhudPfVyYK9cHkA9
	RaCuAeH9zqPjXF5RZD7b3+V3S5UmfpsmiNZCD7cgZ357CKt9ZqqGBplAiHNEAnhGmhFfRbzexpd
	yWxuRRgdsXCGO/AsFB/TltNE3ETtbL+wFK6Y8gR9jKIuCXXbK210ta3Rtke2YgQm5n9iAWKGZy3
	kZMw1clBGnvRQb7ii8ECHoCvHR7AZLhe6M1Eqc4Yppo0QULQzcdGF1Ppg1EInHzGcWbZfwr/xjd
	bnnM+s9yj5tQUvAQHFxWfkLIjS+x21X+xK3ExfKljaETmBrW/LN9VGGyASPUnewr29kgFPIyt6A
	==
X-Received: by 2002:a05:7022:906:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1b556904c50mr27737707c88.29.1795704807329;
        Thu, 26 Nov 2026 06:53:27 -0800 (PST)
X-Received: by 2002:a05:7022:906:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1b556904c50mr27737651c88.29.1795704806659;
        Thu, 26 Nov 2026 06:53:26 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm82132907c88.9.2026.11.26.06.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:53:26 -0800 (PST)
Message-ID: <70651641-b264-43cc-a745-178ef2b02680@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 20:23:18 +0530
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
Subject: Re: [PATCH v2 1/5] drm/msm/a6xx: Add Adreno 753 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
 <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
 <a005f8a1-76a2-46ce-b328-2063bc307758@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <a005f8a1-76a2-46ce-b328-2063bc307758@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b0847e8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GMqeiC-AThkal4myrkQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: tY5TaDbbK6G-E_soO6HwzIJ0P_hpNVo7
X-Proofpoint-ORIG-GUID: tY5TaDbbK6G-E_soO6HwzIJ0P_hpNVo7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX5vQ3Qqs8Q+yD
 y8oIi5tfWROJDR2zCEzyb7nNtBjtPJqoFp8K2bNF3OeAI10qjR6fYXnbJ5LmYeMIiAUmfJ06yFs
 6+80XiaiAWt4DTUJ1wA+p7u0uitdk7sHmegSk2K34SjGML7uKJAZ57ulRp7kANKJYR4h4yM1t8i
 DCFFTr9vXuSSV0oDJ/RsESGOhxo9fW0eZlpo2RHZ+kXU5mgusHd1fU/0bsMTVX1Xzdn0loAUcLi
 96upUlwUQ2tfR7+oI2+WvZE2iepFgKtWyxrYS5OyXni/0CXVlbmdhcZm3itRmJB9/Ek+Ch4B82b
 VlC8W5MFgequCVCWNCdBICjTpqvxspijFP77Ofg+hVJab61gMTwDFasCIpzU8Y8qAXx1KMsM/6m
 2OBQQzvJzM2DtjUAZR4VQMo5dWJoPdDshT931ANAbMer5Eqg24G05Z/6lT+lHgoXIyuBxe++7Et
 N8xL9dwX3CrWD7pJ61w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX0ZqCllBs4vsn
 f4JhWV2ArgVM8yOZYRgnYsBvP2TOzZYWE6BPrRS5BCmTiMWG31sHN9uGUUqGnQBTxRo4cPi3fJt
 8STYaKjpT3CoNG6qZt1BFR6WhtTXDhw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058



On 11/26/2026 8:17 PM, Konrad Dybcio wrote:
> On 11/18/26 12:00 AM, Akhil P Oommen wrote:
>> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
>>
>> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
>> the A7xx Gen3 family. It is derived from A750 and shares the same
>> IP-level configuration: protected registers, pwrup/IFPC register lists,
>> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
>> record size. The differences visible to the KMD are the chip id
>> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
>> firmware.
> 
> [...]
> 
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -651,6 +651,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>>  	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
>>  		return;
>>  
>> +	if (adreno_is_a753(adreno_gpu))
>> +		state = false;
> 
> Is that intended?

yes. It is mentioned in the commit text.

-Akhil.

> 
> Konrad

