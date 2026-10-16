Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664A43BD635
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140366; cv=none; b=iPUVQLQMQwajjJkF+rXhQdgt82QsWk4J97QI2Uuqa/Zn2v3zZuGELFJltJMvmJvQe7rmPP6dy1XaEMODPmlSztw815oJsqiVGJ6gQzMmdCMyyN47Qxn2HGfQaDWjeHznn5lTJCvm2SS6NxLpdSrA4Lgj+pO1eSAQGMeVM8artR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140366; c=relaxed/simple;
	bh=8s4Io8pWq3lzx7ckQDPfcVabNJCkzJTutlACkcE9C80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fldVhp8VInl2DwnjpleQ2UDCAk2W9Uhqml8CEjuy/Pilw+TEE7lx3SKtxjZrm8KOZiMaEFiMOzUz2cIOFoMb03dO4M3dLY/UDdzmOMf3IBZRwcCK3OPWTDck2LL1DJI/j+U5yUPZX071Xu+38Q2qGorSGeWt5Lil2/ACBJzJ9s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YiEn3dOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7Stj4SW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YiEn3dOf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7Stj4SW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G89okX1675648
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+DN1Ztdmx5aWJPhE1VtsxaOJg7etifKPOtQIOdmH1w=; b=YiEn3dOfWoQJA1n+
	kFrEdzdzcWPsO5XKLdwMLTyGgKjPJQA5/T5jWHXQMBmNyFlDlZD15LmawWBWtw8f
	OxWz7XMLcxbDYbb482xREq6zuMdsrNsppZ2hGj1GHrYuygbJQOWBD5WJ8GfyqmR2
	cGxuTtaDeu2f7rezEgPzW4R4WXPBRgEJIcbN1MFe3S+mGwguyDlCsOvaOe4x+hb7
	mhq6yERSxR6JK6HPoD3QIcC9hH2fMbu5UAx9WZwh+V8DB7I3NbcNRSpl9a0Ha/cH
	XZmqS/XNHYdvk0aMi19wGP1LkY4l4MEqUnvfu8xO6/yIfFNzeGOev3zY/CxpwILA
	BHmVwg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yr4fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:46:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5356c6d98cbso16983991cf.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140363; x=1792745163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+DN1Ztdmx5aWJPhE1VtsxaOJg7etifKPOtQIOdmH1w=;
        b=F7Stj4SW2gTVR+Wldgz633IIBSpzr85VNN1EmLByqgRaaiqFpp2gkMq+08Ej05Lohb
         8fjhW8n1m46BTltGaHqIewZf33oWlYaLHOnWlMc1p+MNxT16SKZocvVwEGfTxCTz3Z9r
         DwZPunVtYqdf23hgXazVT/OZIG0xtOsnHFMcIRyFk5IbP/+vsPnhTLSfatF3IEqDPDWo
         +Sw8o5fObVxEErW/6Omr/RHSeI3oAXa2AbEYT3W3KfzbE2M4XL0ur1tBRRN/olCNSTuk
         6PLSzmTwJIIpmhQ4/QfquQ37dgGNx4swxX97Bk4gRhdJJRq0i5kWRNPK2a24ZatvXDgx
         4Jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140363; x=1792745163;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+DN1Ztdmx5aWJPhE1VtsxaOJg7etifKPOtQIOdmH1w=;
        b=Yb7+/+9tCCxpJynIiaF4ilXZpE3mY9JYB2BqZ0iT2ChR3eXnEBGdnthNu8zE6TQsvf
         1LIkDg1E0BPgqbFyUhEucFXQo1No1DIFwCCkRbSZETF8KFCtagVK9SFtDBzs0ifvermC
         ESf5vzgb5WdMJELeFsB4HOi8EDqBde5G+Dg5h9q4Uj0AVXG0KaisuTbgrTPdP+Tee7As
         +2XbGkeJRml17PZfwsM8m/vKrUWeB1YOJdGrsUIByW6q8TxiXmWAAqVpUv+mSjq8ltNE
         h4JBzMT5kafEWB/GNcnzMvGiOlZzh7Zz4A8eSj8b91V5d1H8am65aqSbrtZ87Y6u/jij
         AftQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXK37Rl/iTRVJRsB7EGMFi1IRq4DIMat8VBY9u0IVkzZ3UTjoW7kuGJCt6E6SIc2ZL9IcjApu+/sYC@vger.kernel.org
X-Gm-Message-State: AFq9FYJKHdEmjS2b2Z3lJbCUf5916TTDK2WA7VGpohu5Zj1q4gqTiNVr
	8rflmKgY/z6W+Y+6B8YGm/WZbtytXP2bj16ec+psLX1E1GwPriPZ26hhod8+p04OAC3FNgzy63M
	mjJmt9MpfMOjfaC1A5SCM4AcOmEEiuDO0UasTbLKRjw6vGD+kQqXkwtBNlNPxrfoh
X-Gm-Gg: AYBFou0hf80qbvA5kpwrwGv+EL9SvhrwDUqXud5DWeG17U5j2jvRNH0LniVkuMUmFHb
	6HtEMnUOQOe3ijnhswFGjR/bpwU+NwRIilidyMaMU8/rWLE0wwumdtNTKH3vrJ00Zepfs+uVBkp
	3Kkg+8dfK0MNTBpr8uvr7YJAnoHV57B6TpAIKiqG6vnqS2rTASG76s2jQCYTPiHZZDSSKWMbzg2
	4Hq1WkV/bRfKrwHXThqdy9o8WFrq/uzRFqiDiJdcJEcTmNIOUa6hpd1JYIbyKcf3+3v+NZcrQHY
	1hL8COyAw0PlgDtRCgddmt/RUE8EuHVV3W7HAbyBQTWZMiTVqwSLsMUqQ+42XjN7dF5MmR+LWMg
	u35N8FBI289p08KVt1lUZiw==
X-Received: by 2002:a05:622a:586:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-5359f4965eamr423327851cf.1.1792140362575;
        Fri, 16 Oct 2026 01:46:02 -0700 (PDT)
X-Received: by 2002:a05:622a:586:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-5359f4965eamr423327371cf.1.1792140361978;
        Fri, 16 Oct 2026 01:46:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce133sm53174666b.31.2026.10.16.01.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:46:01 -0700 (PDT)
Message-ID: <0561f6b1-bb3d-4ce1-8034-46d36e320afc@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:45:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8350: Add CPU OPP tables with
 memory bandwidth
To: me@fromdisposition.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-sm8350-cpu-bw-v1-0-044ac6dc9565@fromdisposition.org>
 <20261016-sm8350-cpu-bw-v1-2-044ac6dc9565@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-sm8350-cpu-bw-v1-2-044ac6dc9565@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xIVGUaI4J8kt_jHXAOXg1bJ6dl2lhU0F
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad1e44b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=rBtVOrUcsPcThs3KVNEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX/tgupWoB2NOm
 ToZlZP6ueS+Rp0uvvU2934aWBN4cMOStZJE72zNMH7amiVlbor0TYqtBZgQ+k+hwCbBMh7rnlSM
 lVWvedQdV+DOlDKAUX8TeUgufRsW0Ws=
X-Proofpoint-GUID: xIVGUaI4J8kt_jHXAOXg1bJ6dl2lhU0F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNCBTYWx0ZWRfX5eDuTlTwyP89
 Mn1fqC2C+oUdh+nZTxaOAmdtV+UKwYSf0SkcQn23vOGHIFgj08vn20YefFwfokLZuiic3qPllxL
 BmXNeYeVdJScaLqzV8bkewOFU+NFO79LqDiO6b9CovGGFn7C47y8Ow7DwW/HyaufVHhHrOa5aSR
 Cj8rpS3nZmeyzdywso8NpvUU29+z8eLpbuQpiQ1uu9YJrIEWnnmOO78xk/g1hNNr2quzi85Gejh
 gYJtlyW70A35gXJhjwa1OiR064WsNHKRIa8FxAKn7stkRXn3BPmaDthpv6rNZuLRgk3sb6HUMYg
 CRFDdyxCgToZM7RYXOVN6l62lPU4BNktClA3xS9GXA1bpg/ROM4FLJOswIKleBxGouTMAklCBXH
 aa0q7tZGrOl6WBILn41WwtK+vZAMgdTWbKHGmL3GEmu1i9aJhoGJzgBxxK0Air5mqekCef9QIbh
 uhF9t5wG9lQ0VzHwDCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160034

On 10/16/26 8:01 AM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> Without them nothing votes for the CPUs' memory paths and DDR stays at
> what other clients request. Vote for CPU-to-LLCC, LLCC-to-DDR and L3
> with the CPU frequency, as on SM8550 and SM8650.
> 
> The frequencies are the cpufreq-hw LUT; the LLCC, DDR (LPDDR5) and L3
> levels follow the downstream memory latency tables.
> 
> Assisted-by: LLM
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
