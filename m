Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757DE2E2DDD
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786518974; cv=none; b=iTJLFmh+8KL4vRVccQNLUwXKXxtkS3N1cDaccjDx8mVSjrz6IevJwE0c6uAyeHMKauK9e+g2w14Zl38cdc9aVt5FHN0PPQbEvumt3P/2CU/lPMFLLXm5IGi4EB9WnuvrofYhZWvAEVhhuGR7gjCN7n2NQ6PHLo/YU60k6hSX6Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786518974; c=relaxed/simple;
	bh=i0D4epZ0baKdSqsNsRJdZ8Ja7hyubrx3kuJfwPvyfrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ByfeQ+oiu9+cZxrYX4wE4HNndv8B2hDrAFYBTaC2xtfE35180KVq7BSFJEPDp69dKNRzt+yX/fMR7dO1oIuI/QJ1oZvTARcb2C0JCY9Vw/4sMBLEOd0oPYmCpoVzpBezzGSAMSSxfdTnygKXx1R5Q2AMVMN7cAo+rXySSNfg4FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TsHst0cB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TYJhN/kB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TsHst0cB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TYJhN/kB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62S1v2641636
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2P/JGMpf2TsBH2XXDsN/J8Ig74olYysC6bSTdQJ/P4=; b=TsHst0cBI09WkqEC
	gYSYKlGSgot/mEXSK5qeh/AE9ecAecui1SFFTA5kiTNJHvqgyeWdXIBGrtqruDUf
	N+rrkJgcULoMLrA2Tw8vxTIm0oZZ0buqWDkOmVRHrsxKhaLR6e71iSNcCx+wnfst
	m5Lweg2cYZ0qgpXfBUC+fgwUyKpKb1em2eqZEOsoqxqvZVT8WGkdvIPu4/EDY87G
	KAWM5eHI1WGCRAGf2h1UifSRwow5yIxeHexWVQCfQ/yEhP+As79c0qiTSRvHeHZK
	rRxSHGhaOxPkkDwuzmyjNNGoAFj0mCVeHc6Vs4d/9PoDHC8i3aBTVVzHr8WN6FCE
	qI91fA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049mkyf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:16:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dff6253so16987425ad.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 00:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786518971; x=1787123771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2P/JGMpf2TsBH2XXDsN/J8Ig74olYysC6bSTdQJ/P4=;
        b=TYJhN/kBEl5ObX7LAGY8i5sFlhmqZMP4A53nNIee4NCSYr1RAgU0uBfG+3ocgXUN/U
         QR7l5XM7L4xU5Zmw6QO6A5+LlGbIdC6FXP/3N0r/2bP5aJCdt+j08vREmKCSHvZnCvOY
         iTTeGp/PdVbvMLdg/Sfw/CsFqrX7xKYW1eqG+GRbxXrgMGCPWIo7Wxhoi/gCfh1dWntu
         Lo8uP82Pj+X1UAB8CfwjcOe22cD5UkgmvYIYoap+j5CuCTF4o2VboGxQfQmzcY7z/KV/
         y57fPml1GtKH4au0e9S7NePdmEbAe7tCPXXx2K4QVbKhaLi86eQ4jr2wHWY7yj2rn10P
         L37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786518971; x=1787123771;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2P/JGMpf2TsBH2XXDsN/J8Ig74olYysC6bSTdQJ/P4=;
        b=HksB2E/HLdh9/gB08SoJZCgT/SZ96Ul2TrEeW74XglWL4GmsyH6GRQiah0Y/T+a5mN
         dw0nIxGa0+cM66Atc30UV4SnH+TlDt0V0HC+PJ/0kWd/ituMhQEEQdF/+hfQZCkpfBPj
         CEB7w8RQjwmJiRCS0M7JdB9ND2Lei1+1bBKY3bY+gryyqEDsqLkCnvxqS+po6Ao42+g0
         solt5r6z/vxgBXdaeV/UDvUqY5aKuTjgQk1Wj8vJd+Lfuf30on/vbHnuUE6HPULlZzrq
         E7WcqR3NCdvAQGrMci6TJcuV/QUv2KkI5ghPj0aZszP50Osj0MyzdiJKroGwmj6kgwoR
         socw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4BqJKwTN9WBzWlEB6GEAYNTa3coJlWAWMXGdZfbZiqO/efxqSWweJ9nHoWZWLaSq/qqlNlgZ33v2u@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6nptQdxxfQj4gTbnJmMwjflVApbcXE8Z+8rXna3/huhV6BJCo
	g8NygNfbX9XEyU04ayKxIvFqUx/wQT2jOuyxUZKF1ooXQJgQ+cJb5OXeQCA+EQoC0RWTpydc+xI
	5/91cDDV/og7SAUFCk9T7UpFN6VMc5IjxkWKI2vp2sa2cXuo47Ia3sx5yncgUUNlm
X-Gm-Gg: AR+sD104MSWCSbIw1LU70L3SvY01gAMXyGXrdNdFsdn9GotOHYDp+MscFAe/RIcveir
	PaaUk7eP+FoAzTP2A7w9B7mJRIPWwQlU+baBgiMj+2bqqQ9F/Zc71IMSYF+hsepELzAIu7Y19El
	0FCmmj9f79ciZeuWMHoXbXNiBAdmswkEIkjViUkMLvPQ339BwmFZ/LUSHF/JgsCCdDUi4zAuVef
	ZljvnZYmuttabd2UM4ffoaZstaqzgg44pwISVH3LKFcnQc7wyoMOBU5pcCpwkTKMcaU4pijPWHL
	p4pAVGz7F5jwAvhDiVy96EzGRWsB/T2q1RmtzbhUOADMb+/afECvzHWbotITfwrECjHt4mPWlxg
	afkwozIjlW32COc+eUL9JmQXEdJ7J2fku5nrQkRsqEPzL5nt/iiea/x6Wx2Z8KsW/wA==
X-Received: by 2002:a17:903:1988:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d32da51aeamr72286035ad.10.1786518971311;
        Wed, 12 Aug 2026 00:16:11 -0700 (PDT)
X-Received: by 2002:a17:903:1988:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d32da51aeamr72285655ad.10.1786518970884;
        Wed, 12 Aug 2026 00:16:10 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3521a3120sm2413285ad.52.2026.08.12.00.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 00:16:10 -0700 (PDT)
Message-ID: <1c260f20-711c-46a8-95f7-c03bccc41222@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 15:16:06 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
 <076b0942-7e1a-4a6c-9293-04a7ff77abcb@oss.qualcomm.com>
 <5a8a773d-5fa8-4e93-8130-2b49997691fc@oss.qualcomm.com>
 <oijzkh6xykig4vufjsxup6xg3mohgqcyhc3fxaimxbhqbg3niy@2c7tgkdk7tm3>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <oijzkh6xykig4vufjsxup6xg3mohgqcyhc3fxaimxbhqbg3niy@2c7tgkdk7tm3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2NjJBLGW6d46ZF3eJNtVMADMOj4DyJOk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA1NiBTYWx0ZWRfX37GRm8RFLnOT
 iOMH8BD91n1M2l9wsDjUf5oBxKlLPPfw1KgvLKDNrEwjp+GNE3BhHoeMeIEyYJ7d9e2x1ELb3nm
 nb9YljPswvPlvEeRsrzzrhHiy63vSIEsEL4M3aPqAMYPFFcXH3qJVBw7bSHwcpNO1kocYk3CM+2
 0C260y7SFT5wk5kzS1e9PXhkl8FfIzDoI2jsg3C69inaPhWV6Ym9I3GBPGm5geXPGq+KgJF1nMJ
 Kp9QDE+w3j+gZcEONq4xeMsAo8cXjmdf2vcq6tQ7afLE6SLxFNdEH7YQzLaUjJk/8ouZVwq7Zh0
 jwVD3y6Su81CgcKeDSOG+C7O39EtKAO62nhbaPh8Ih9rS818Vk8WFyN3eIw9NCed1PtvB79KTlO
 mFd8htmL6uvhrakwNoofjnc9kCQTMuusCyd/rlQHrfNg4RMB6y6p5qVAxdYfhSjbejMICvKGkp8
 A9vbOswnDdUDHqKjROg==
X-Proofpoint-ORIG-GUID: 2NjJBLGW6d46ZF3eJNtVMADMOj4DyJOk
X-Authority-Analysis: v=2.4 cv=FbkHAp+6 c=1 sm=1 tr=0 ts=6a7c1dbc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=iJuzQYvAr7YxkxZwkH8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA1NiBTYWx0ZWRfX2S1TFM6+H1Iw
 8AUxNEshQCpuftD7T/8SlJIyo+uGeTfN3hkOSO5/e0wamDOFaHOUXo5jdCzFiO4cwgAzmtFSrmz
 l/CNhMKKhcV+ZU4uAJ2PBNkzeDJRvJg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120056



On 8/12/2026 5:44 AM, Dmitry Baryshkov wrote:
> On Tue, Aug 11, 2026 at 11:24:13PM +0800, Jie Luo wrote:
>>
>>
>> On 8/11/2026 10:00 PM, Kathiravan Thirumoorthy wrote:
>>>
>>> On 8/11/2026 7:06 PM, Luo Jie wrote:
>>>> The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
>>>> TLMM pinctrl; without this the pins are left in their default state and
>>>> the bus does not function on boards that enable it.
>>>
>>> Should we move the TLMM definitions to the board DTS file rather than
>>> keeping it in the SoC DTSI?
>>
>> The MDC/MDIO pin-group definition is SoC-specific. On IPQ5018, only
>> these two TLMM pins support the MDIO interface—one for MDC and one for
>> MDIO—with no alternative pin assignments available. Therefore, the
>> definition can remain in the IPQ5018 pinctrl/SoC DTSI for reuse.
> 
> Is it expected that the drive strength is also common to all boards?
>

Yes. The MDC/MDIO pin configurations, including the drive strength, are
identical across the IPQ5018 RDP boards.
