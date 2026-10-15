Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88283527589
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071382; cv=none; b=msMyDMLvo1OqLmj8SOp38QdkubalxfNglwt8D4pcAx8vl0jLCrnC+wordv4Nq1PtoQcMZA/q6z52rqSq0WijoZC0s5X1kdRS9zacuQ2afQjkP9FAsn1VoJtn7AWS+MQjMV6ICOdKgiwCpr++ftaUnWRAy5LzGC0c8dEbOGvbv5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071382; c=relaxed/simple;
	bh=+orYL4MYtYLUDMbwG2VQZeEovAixQhGy2YvJUA2lGIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/YtjoO4v9DFDZIncc5EiF0TQnl4nNF2viXxRbGV8tTEAgc9iv3trpzKT4omJOsOJtGYqYEfer3oGMRpt3QDMu0s3xQZs2cKC5kowe2EpVJzh6Djih3oPMu7cP/R/08VkFOHbeoVYJ3mjUQ2ovVQxufbjD/6qHJGqf8Y+tG0/ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tzi5pE4j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPJHxLml; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tzi5pE4j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPJHxLml"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jhcs3510305
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S6Qd4a8NqN7DWD9LPdV15oWruFRO9Nvhiys5+d07zYk=; b=Tzi5pE4j0MRX05D5
	WhR2HvtgeNRFQUMkXW8b0jcs87yRCIMaiuLRIvf16r+3yFaWpafgll45Jgfa0PIQ
	alOfACFEoittMnyA+b+PdjY7JZPxah2hOF71N/oHTdiyY3bHneWzrTGPqkqkQDik
	ZDSVM7yAzZjRcxBlxXj+Ei7SIFOql38s+RTGH9rcYXq7mVWhPESvXdToSsD3DNuj
	BTCn0sKlcQ8BR499Q73n6/S1L+ARXX6NwyHTH3XpUNQWFuYhygd4ARjZcuPz+TRB
	iuge8C997R+hkqPU/MTvWNArdlpEdLGgn+8GZiXUn4z7XYf3G2hSDvfLuoen++98
	lBOGFw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdsa928-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:36:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917ad3b42eeso13195586d6.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071380; x=1792676180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6Qd4a8NqN7DWD9LPdV15oWruFRO9Nvhiys5+d07zYk=;
        b=iPJHxLmlteINvSydCBDO+SbDSmYeG+5UHNpIIFX6ZXkg4HtnoeqMHDWNvXVTo3HkJa
         GMLm1xZRAdJTZeEWQrvMtGnVQ9DfynFfhK+bMvmZ3EckaCQoc1J8yz/5LngA2llV6kIE
         uXnUhgCckQFDhAtlCrfg+Yk5s0o/TBR98nKfG8O4XSS/ECcDBpvp8fmO3M5pD/gZM3v5
         uhEEX+v/J84EV2GbK660dCSO2OWJF/9R2J3MoW0tsQhoSLpGISkGCC1kgjuz5wRi4BNc
         cjIpCF/bKdXh+QH13evq5oo0FGCqhbuWnn1YvlBsSHDeW9nhZipNA9ttTr35b9EyliZM
         gVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071380; x=1792676180;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6Qd4a8NqN7DWD9LPdV15oWruFRO9Nvhiys5+d07zYk=;
        b=kQNG38xSGi9by7xwURIFx4FQzEpLuohGDYr1j3X62MgQkcldtwzuf10eSfZgg+H4E5
         VFwRK/VJh5jRJATsKSkvfP/mEr4l7Ph4VI78aftalzlm2aM/aXpCNeQllNmccsLYlkc/
         Iv+3TgPpKLZkAN1/rjtgSfnjepFXPtOILxB3nmD3YV4SW06z+jlVZKFNNzNedvn0HQ+e
         Ts3rXTyOZ1XoZGtn5cxhNjtA9m227FeWvKg2b3xeszT1ATSBswWUPTDIUbxRaO5xXdHB
         4z9lHp9sEAOVzy89osYenLik7bPmRaOHOM6/2iJ47jnmXBCORQNGzL3lfLVKd/c4PI6Z
         HRzQ==
X-Forwarded-Encrypted: i=1; AKwUvByMSozKj5Yqe0Rjxjb+VqUEh3IWmEJS+P3HRWy5hwdrl0maQlkV6g/gTKIHQHtquWrJT6rUQIVze9Jf@vger.kernel.org
X-Gm-Message-State: AFq9FYJuYlOAwyeoU8MUrLCh7OMLzuvo9Qw5i6e/cLRgsfl63wZzTUKN
	UNhcNFbHZJOkqpd/FPcdd0xQeAjArFPbbY6FzuDeubO/xUMmWzoP0awGvPIgWVauAtXFybwDJWt
	HRjMzzHjTckY/peF+MBngbTy+wLbI13HXm14CzseSL54lmYifc0HNtEb6a4pjmUe3
X-Gm-Gg: AYBFou3B/7PrUusmM2hqHtoJFzsoG4SNqx92KGjQOHA2s/yTQk+rmcfrTobeBUdVcfc
	XIVumSYkOOzf/ajTkLtC8oRrxHokSa9rQE4JncRtAVu5+ttQrTrazT/TQe1qIF+FxaT9V0E4W3v
	Efpe61EWOE9BjI1scfMZm8/uVWBAxeZ1qy2xn2nTd99S4U+1ETDsSNtUpzMxFuWUJ6g5k3GT6IQ
	1a9DtbP1EoIp9JhvZCNARgZVz+Z5Q3XQLNXTjA/uMSz7SRhCvU8MWg54Qs5tNPdewlrgrl/anar
	vhcKlsRv75HiCQll794AT0N3qoV4GBZPk3Xnl0LzlfMvXayDoPzlnEd8VD/BrLol0+qJNToJTFR
	T5k99UR17qDKE6Ihu4blFPQ==
X-Received: by 2002:a05:620a:44d5:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93ebd0c38a2mr3512777785a.1.1792071379662;
        Thu, 15 Oct 2026 06:36:19 -0700 (PDT)
X-Received: by 2002:a05:620a:44d5:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93ebd0c38a2mr3512772785a.1.1792071379101;
        Thu, 15 Oct 2026 06:36:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda042e95sm123771966b.52.2026.10.15.06.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:36:16 -0700 (PDT)
Message-ID: <99fc9e58-0171-4840-b836-e66a0f3d10e9@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:36:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8350: Add CPU capacities
To: me@fromdisposition.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-sm8350-cpu-capacity-v2-0-67ce449becf0@fromdisposition.org>
 <20261012-sm8350-cpu-capacity-v2-1-67ce449becf0@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-sm8350-cpu-capacity-v2-1-67ce449becf0@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Hf1Wv1w-lBJAI1nG5U0ed-vEkgrQB1FH
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0d6d4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=Qd5qHVKo_rp75_W9aWIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX7gHHDyIDPEMB
 CFfECO4RVdbqp6VI0DRsGBCs8YTsj+TlzhtgDSk3CCfW6Ing/c9W+BfEbc03dOXNM3yrNwKnVV+
 At+GrFItY7wWJss3KN1XlGB/xou0GAezQ3WgB0t3eeBwqAt02P0GYQ2vhcM3WZduEo31yyl5q8d
 KUsv7iCY8mOrIIY85By7jCHCc+8jFoTxxto4HY/JXE0EOLBVFQsD0kTkroqNTfJMEhf1MJiFwMO
 Mad9140pmYXYsamidSklmvGylUK6riGjDY5lolIMDN1Ngp+LFFsNKhEZrv9BMYObDcxvR17bBfi
 SN9aamSejisoLdxRzr+QRigqCIzSEWdIoli1wRdCbs63wzuJpONcYW+wvmjxxnPn/xbPoH/iA8H
 ySxMlJ1wALu+1FGjBzRi37W9uttxCkHOycMg32YkKDsMRUSdBJMlgAQHbpm4k2W7Dwo4NtRXJcg
 uk4ekpgrMkBcyACVTZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX8E3ZKU++Zqau
 szjfG5b63jf7Zd4xTdxhSsEzJymodhZi7Cr6VoBwvWWpRBuLeAzL7D4scq4elu/t17h+Gdv+6YK
 DR21vKRDxNSG+MNtAdNx4fxH0st04x4=
X-Proofpoint-GUID: Hf1Wv1w-lBJAI1nG5U0ed-vEkgrQB1FH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150054

On 10/12/26 5:56 AM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> Without capacity-dmips-mhz every CPU reports a capacity of 1024, so the
> scheduler treats the Cortex-A55, Cortex-A78 and Cortex-X1 cores as
> equal and sets up no asymmetric CPU capacity.
> 
> Take the values from Qualcomm's downstream device tree for SM8350
> (lahaina.dtsi in msm-5.4): 1024, 1946 and 2048, halved so that the X1 is
> 1024. Only their ratios matter, as the kernel normalizes them. The
> downstream overlay for v2 silicon (lahaina-v2.dtsi) keeps them.
> 
> Assisted-by: LLM
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
