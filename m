Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FD633D51A
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783069064; cv=none; b=fk1duBtmCPOvd5HraO9hWdVO7VhQj0Ly+rdm2NkjLCx7MM+AQE4OtsaC32FWsPWag45V9d8a/yoxsJhq4Zrhs6IYhOzf9PjLfgP2qPtIkJeQm4FWjdX2B3CLPxmZiFOZAh5OOHieI2XgekiaCuQuAAwzBfC009Yxh/pMZSdBcbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783069064; c=relaxed/simple;
	bh=dWBB8QHWzV0smXiNLQwKYnR7PGnvKRc6FyXeEmLh38c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I8xf2nzVOjuE7sc2SSc0SyTs262QPyzeIeSInEELnch/8jXOqGsK8GLSQdTOEZsJIT4QTiTD6w5JSF8dnNXNh/yktCloKPkSbZh4eMcA/tnN6ozr72lb6qG9nbdzQ/nv7BDcR0rJLDbXyY2EN+1Y8T8Hs/kYd3pJelbQPRy+FY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMm8lBFk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKlUoR9H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMm8lBFk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKlUoR9H"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663685nY3053416
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 08:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUd+sBdE6ArmNncIlX7wMKayRRbzXx25rT/FYuJHI1I=; b=hMm8lBFk66PCdT6U
	BVKqFqO6el8z19lQ8Zdg5dx/X4axaBsp86f82xddAzMDKpJL7fOVkOiJIfFcpiuJ
	MpRP67hQCaUIUoHzDQAP9PlBYyro0Wyh4FWdA4DsMMFOgTkg7hs4ggYK/7ri3l/E
	Sk5GF3frlNrDxHsgn4+90wh+pfW5wNq3nNpDMg5eaXhVsRF6BCuhPDVCZdo+zzqS
	cQaBYzT+m171mxV16DM3j+xCV/oKf8vu2N64XXByjakGiwq+H59U5oYQZNq7LKLf
	qFNHcd/sX129k0uuxS5LJXfbPt92Y2D8W6pWB1ncrR44EoZoHhVdlRsyDJQAKBvj
	bWGvTw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j00mg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:57:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1fc94a11so1145031cf.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783069061; x=1783673861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUd+sBdE6ArmNncIlX7wMKayRRbzXx25rT/FYuJHI1I=;
        b=XKlUoR9HPz6BeM1AJIqSuiVDeADP5lGYVUDd0poSMzk5VCDnKiMtXmax22kfit+LdT
         c3U8hX+AewGkvE2j3zX4swIrxlHGt0B3azsFd3HbQ5gUTJWlNQ3LSD+WoWkcCGYhkWEv
         D8bh88cj8QtZOwnCJn2OQcK1z5ULU6krrI6gvYV/c9gbie5vYORqEMNOy15bxxnFsFDq
         khUe855ITZa6+/lCHCxOaXyLhPFdLlNSfOZNLgSdq4eX4OTL1JyX3lB+7Ox8c1Okuygu
         t07TR1jlzV7iZs2qDm8QJGBG/x0BwE/7hW7Z+tro38vs6FAKGQKpfUnpzrwc0JDXgpwt
         8BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783069061; x=1783673861;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUd+sBdE6ArmNncIlX7wMKayRRbzXx25rT/FYuJHI1I=;
        b=MTvvts3unHmdlDpgMapRjFkXu5evBg5SM4a7Y3ddw7bQKUVplBZJN7qB2oT+XkGvL7
         QqGCuBPnJlAshw2qtvC40gfrW4PFJIY184ocwSB1zkVrYwqI5EYZjm/RCgVWmT99fV/k
         YkBWvYLgelHMLPDcnixOKP78HKY6JEqB7HJOu4KNC8ysVJo8ryvh9V5xY2//UEumGfV5
         DzNSSseWTDvcQ8CBlzVhc/VAmjJqDjPjTAVnp3kc3NChj0ZVWBGIZo38AZKoikUoha2v
         rZfbzm86EFneTelX1LhBnSgv/UXqsKkmTlltLTKu24zkXMP/lfYM+eGIi6cHx4McGJGe
         AqIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+t47s3jMU1wyiH+wsQwxEW4pCKQiez984o96h0gvGMkh65r4R6kxl1piMLGjlMRtfl8cntEldd0TLg@vger.kernel.org
X-Gm-Message-State: AOJu0YzC8pHgjnWsyeMEtCJE8Z2jOgBnwSJM6LaTjvh/B41e2pmx2bmA
	TaPnsaqE2tiwUbD2VS+hvIfNT/2ib0yJDEKYi3tv4/pN2vnJevA+FTgTxfjZp9rYnDAP37NZgD8
	OMZV/RhBNl33gRi3fJtdVCHNuy8mge9ZwbR3zy68sTIA981W6Z0s2DQdwfVrDZjwB
X-Gm-Gg: AfdE7ckmiDpmS6oPFxhON4qpetELFkbO0jsWr41RDWsc/mtjHrsdAx5OCM8cHP5PTyE
	Kj5JcHk2uNqg2kGyZeQ1JWN57nz2OEhEB2WRrTxTCo8HKCb7KvEr6vnf7urbUEEt5+TDI90zpC1
	cpINbMSzwapT3uqvfcEhxgrzDB36PGFiv9a3J5L1NxHiJkGaUfXY7P53TlrlrX2RnpVR9SiFDfD
	8W2aelZxLcUBGG6rhTLoh9nozAPZVNUZ0UHGcPmYxskenO19xMwG18V31+HtzWb7mGMN6IjGxig
	A6tCg5I3fHneyK7axjRSKlrrT1+NP2eKkG/03CS5RUHojI7xkc/EmiGSyCC4ZqWBlyNMa5xmpDl
	NPPRB0He1kR7MaQyc+o+DleQI2x/UU+HB0fU=
X-Received: by 2002:ac8:7c51:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-51c26a7769dmr76953961cf.4.1783069061105;
        Fri, 03 Jul 2026 01:57:41 -0700 (PDT)
X-Received: by 2002:ac8:7c51:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-51c26a7769dmr76953791cf.4.1783069060725;
        Fri, 03 Jul 2026 01:57:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62fc72dsm256179766b.63.2026.07.03.01.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 01:57:40 -0700 (PDT)
Message-ID: <0b182566-2a54-4e31-9a1e-40bdbb0f4a65@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 10:57:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] dt-bindings: dma: qcom,bam-dma: Increase iommus
 maxItems to seven
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
 <20260702-b4-shikra_crypto_changse-v2-5-66173f2f28b3@qti.qualcomm.com>
 <20260703-steadfast-greedy-seagull-ad32ab@quoll>
 <e53f9b7d-66f1-4922-ab20-f6e66015c912@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e53f9b7d-66f1-4922-ab20-f6e66015c912@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3YiT1l9TfMnc8wBeF3Gx3LLnCQtknXlB
X-Proofpoint-ORIG-GUID: 3YiT1l9TfMnc8wBeF3Gx3LLnCQtknXlB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4NCBTYWx0ZWRfX/i6XugnKi/2B
 +6lmCqxuGdXaEKdYkHgME2uayLthKzciL0cCcJ1KmJIGw8X2TK6fEc4OW2zg7MmnsAM5OTp1R0S
 nww7M0EMXTf4j3Ey6SPOtp/O9V2gJIw=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a477986 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7f3yg-VG_fZZVZRDPQcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4NCBTYWx0ZWRfX/NpB2cdk5QcF
 TKM7b0s1W/hAc8kyl6oeUq+JwyT0bzVdOE377pQHaQ/ZFxD4acnHqQ5/k0f0oI4gcxfyp/Oiw9L
 ydTkFTPU4AkRpEYhTkIGUwlU90vytVscwyOrp0opi2nS+jRIYBphULloheh4GpUsZmk0XzNmLRi
 GgNcAY3jf4aCU5ya94cvB/z3i4yNnMUNstaVjgFmlqs/yTFzfVfXTKXTnU6R5ENQ4BXT5FzFoj0
 kzlonCzCvhjD7Dzs7UQp9AMLovyvm6zl7O46g/XyoeywF7khYmzv6AX77njkKLtZIi0SdNqbYvR
 CCGrZhtV7PHsaYJe6+p3ij/CF0K9DwIMWUjwRHeKuceFJ5U4Xv7oSmDGE7Rl4DxdZtdKNMlzvOv
 EN+lu5O4bUUACK1PHko7HPEYXL+ouYoYGTSzTksXOf7N8MInAEAlJVDpLNr7nhZJZ36GgJyJo9e
 E5suGDqenDPPxz9NRjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030084

On 7/3/26 10:38 AM, Kuldeep Singh wrote:
> On 03-07-2026 12:24, Krzysztof Kozlowski wrote:
>> On Thu, Jul 02, 2026 at 01:47:15AM +0530, Kuldeep Singh wrote:
>>> Upcoming Shikra BAM DMA uses 7 IOMMU entries and not 6, so increase the
>>> `iommus` maxItems constraint.
>>>
>>> Fix below error:
>>> dma-controller@1b04000 (qcom,bam-v1.7.4): iommus: [[25, 132, 17], [25,
>>
>> There is no dma-controller@1b04000 in DTS. Please drop all the warnings
>> which do not exist.
> 
> Kindly check patch 6/6, it is introducing bam node with 7iommus which IP
> describes and hence, updated bindings before to accustom this which also
> helps in avoiding rob's dt-schema bot error.

Krzysztof is saying that the error doesn't exist in the tree (because
the offending DTS hunk is not merged), so you shouldn't claim this fixes
an error, rather that Shikra simply needs it

Konrad
