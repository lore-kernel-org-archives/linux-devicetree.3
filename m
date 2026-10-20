Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504748;
	b=uoQ+zHdn8p8b/yQHQgx41uVItR0o7mS/7NBOHAoNL7zKEsYJofk+vSQxjWlePBXNPGiY
	 LM3wznAlWz2p37DCbXPheiGeJYMwxAF3hPHz891XW0RszHb41F9ZPqRR2p+GOZC9nLYOI
	 tAn6TvObFOA1EEvabEbKluPxaeOwW5M4qumeJj/WaZkGfqPLmHzSLBRsh4rj0b8eFlJyb
	 da5pGVPubuswTcS+GXxbV8RStdUCY1T9Ua6NHumwRGIHEGJNjmkxG6I+LmHzn7Sk4W/5N
	 LDhRSwSEQY8Dga2RiIoaKyyRWlu+x82f90Qzg2WjBQ/pdo58BNX7/ay0JGUPbdgcd6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504748;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DY7esWGsJJoottHT4nIMIL8Ex/o7i900iuaYVCDlzhI=;
	b=36o7Pw3ssNJyui36QMw6GZNaCMCCwvKG1/CQpaTl2v51IpFh1m8vv+k0+70etmgptknV
	 LcVQJtF8Y4dO3sWQHV2EHbI2fG7ShEAS6T2HRIy6u8UvRbqGINpqHkX50suq8aBwbIrmr
	 WkeD9iCZdPy0iKLqZxtIqFqqYoeSzvH0F7MNLTzhSwC9EiXIpQHW8peVsYEBMiC1am3Ms
	 uD+YBKQK4na8aUAitMo+dC7vcuuIcTrI6+LM8XAP5Qlu2vEW72GbJwRwuMdNW7cUo1Gje
	 mR7nyIHwLibp7GJZ6lMCllyq+orrv6S6pCb1Y9OT0kw4aWQ/dGpuifZw+zi1MIh77mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gpIwOsiV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmdtD6K6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75AB606A32A
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E75AB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gpIwOsiV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmdtD6K6
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9stb882020
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DY7esWGsJJoottHT4nIMIL8Ex/o7i900iuaYVCDlzhI=; b=gpIwOsiVuQkaB0Mu
	bfmPS4Pk6svYoT7gmHD5CDnVqhURDasrAq2OZtnaWrFu19VosjQJT6syIKCdtOID
	UXSsMMUyQKtNo8JbQX1os39o1RQXoGru5sIKVw8ia4yRFb0a7ib2QOHaCV5awtT2
	xHgfBeq4QV0usI43rBKk5KhLTb7MO6Eax3zufuLgUqqaCSmKQ6zkHxfdx/qF4KGB
	fPfrWLqQxAi0fTtUlnK1MvezYxRdQxxZFSrfw+j2mlVJ6mkXm8FaifTKlsSpbSTC
	hlFjOhDySC38MRfMg5dkLZ2TDsRmZH5BofYAtDl751E6V7pOqCk40AC1/gKedSwT
	YSx2zQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2rey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:59:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc50fb0d2so79039985a.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504745; x=1793109545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DY7esWGsJJoottHT4nIMIL8Ex/o7i900iuaYVCDlzhI=;
        b=RmdtD6K6wwYm29bCrblsIYbs0Ghtz1ZzMBpM1YETt2J8gD2ZNYYRIWySEwvLU1+edb
         aQ81Uf58DVpaBsVaoXGfXKC8+b4GcarSbkWV9fn/fEFveeKzJozvGKwCrO2YG56J5R6M
         hTygB0sUZsJSPaFsYGLgjzGE9rd0Su7oh/k7KcwVQxNrdgrKYTAQexV8x1itGIetytos
         wduo21ffuVyW9AfVHQgDn9ZACoO6Bl/hjTBguMEujt09upOnarmJ/kDhU1aLchre11Os
         0rM/4w3Mp/5drNcoMOEo6Jy3jj5UHauOMfRTfBW5vcMYfUtgekx27bATW5GZtpEWUACp
         ZMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504745; x=1793109545;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DY7esWGsJJoottHT4nIMIL8Ex/o7i900iuaYVCDlzhI=;
        b=NeCyC0fPXuANCM+cu2m6yzgem7bzQsj+xrZb/q3xhp58Of539wvQvYWyrZVj/AFNWY
         BVI+75rfwY5umh+M1p5Np77Ze3OE+b8BB5QI2mcPo8CrgU2gZkv0GDupMvbwykxTqdzx
         u2xWnqejcBqXLDFguqZdvhzoY3LQFmOX1Yh0IyIH+CP13KF4+ZpmQeamg6QIishZ4YLY
         Di7ey84LMEKtxLwE6P17YtNwPPoeXxtPt8tGUODkhbbqeYwlKA/T3YcagvOWGrjqFFi3
         kSACIFPqP1xPFCGN8pHaTyUCmREFRuSIq1O7bI3339yD9h+LX7wvlYTyPLZNqUw1XIHb
         YbYA==
X-Forwarded-Encrypted: i=1; AKwUvByEcd2MxDTWr2T8wFaqR8cncS6sCr5Q0YIfFuWrk4B/Bj4M4CGPEOEuH8CZZF/8jWDEoqrpkuSIctyt@vger.kernel.org
X-Gm-Message-State: AFq9FYJjMNUs7Po5XPrQoCdq7LHu0THKQ5azyYbLZzd8hCL3izJgYG1g
	CzCZ2VMie0cWrUijOJhgz27hLppDbpsL0kt0W6O9ovYWMcQLsoapHwG6i6LN1FREVCFNZwIWtMM
	aUhIQ5pShveNn1hcn/Wmz7pDY4SLISpMQ1lrkv8lahGRndbPNSan6LPGIQ8YNGiFu
X-Gm-Gg: AYBFou1+AMLiuSFxCNEbkTuGEFXu5lXkrGwQeoNnXHrLMywnsVYEnsn1KbjxUIF18m1
	g90CtpZmP3xr6AsO4wyFrMLNnkaHZ6ZZktxnAwKRt7BNMg83kKsEIJAg3FUuthfFJ25xAD8byo5
	OvQDle+eB0Rn3e9roIMW0qV5oekKByo8BsAWdVhqfavyFRRt2W9UjYeWJfmSeMiasWjwpo7ZQCa
	6+1Si7x6aiNWcx5treDjFisPSvEAaxE29jPvjPoDtoOyUCRoSmqWZZKu89IEIogE78otKOsd3T2
	a2yHas701khWuIb6ZZiLbXKbzA0hOEJRGdMfUCqaBoUZDRCv+OuxWVy8ByWLCyQKnWFU0u9b5/R
	CZhjP7nyOnIcyFD2cUz02jQ==
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr2095411185a.3.1792504745160;
        Tue, 20 Oct 2026 06:59:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr2095406585a.3.1792504744685;
        Tue, 20 Oct 2026 06:59:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1ea92asm5010407a12.36.2026.10.20.06.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:59:03 -0700 (PDT)
Message-ID: <1f9c34ee-7d30-4ce2-9e88-93612eb897fb@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:59:01 +0200
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
Subject: Re: [PATCH v2 1/9] arm64: dts: qcom: shikra: Add CPU idle states
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad773aa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QZ93mQGBb8gi70IaLVcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfXyc2kV40So9bd
 gahChnIxAZOPysaerOBVcedzbLQNnF5h6SXe6FjIrXXjfV4G5u5dvWyPEriLDWxW+sIrGZVTtLz
 WR/SYLZ36OjOvpDuXE9iXWfu8FtvMsA=
X-Proofpoint-GUID: NkN3aKQ5_zXcpHFk1ytW9MPCY8S3c5BA
X-Proofpoint-ORIG-GUID: NkN3aKQ5_zXcpHFk1ytW9MPCY8S3c5BA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX556PP73bhihm
 VNpaiZbNUGzh85sWLU499gMhxz6Ew4MsfVfxCBTinmwOXErE0ub4Fc4OiGhgEKoKwh3IYHg+GCm
 w32P/TGSEl3aY24VYXOmL3yujM5nUH7VaM/kamKeIqfH2AiFFEGgeeNke4fwkyFtNjKWvAT+yFs
 RME+aqP7flTcSWH/gzCq9SRJ3Gid3Q9YYvwEnjcM1Rrvf1bNR/mm8kvlbw/hZkGRwhqHIl1V9Y8
 PqtCg45JN2MCzDKjPJtaCr8fH3htUPSC9jpaE5K69ReL11OMiUZSXS7tnK4yjPAkcCAE6Sgd0+U
 cLBKiYJR99GuOrxr+pOdyAQ7/dUjJsk8By7/GAkDG4Sw0ed41GhNXdhDkMbB22pR1whfDLZj5tf
 052Exua8b7rIqju/rMMwUgGy873Qs7B9DgLa5BeJ6wjcEGc7INR0iaPnTdvCOOztpN/MckNai6p
 r/XuMcRPhDluf7xRy1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200055

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> Add idle states for the  CPUs as well as the whole cluster. This enables
> deeper-than-WFI cpuidle.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

[...]

> +		cpu_pd0: power-domain-cpu0 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&cluster_pd>;
> +			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;

nit: ideally <&foo>, <&bar> instead of <&foo &bar>

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
