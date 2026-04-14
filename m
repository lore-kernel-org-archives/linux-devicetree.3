Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55833D6477
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162640; cv=none; b=ewNJ+p5eU7uwPtv8r//ER445DfYM9VkIqy47u8P1feUtNisPhHcYRnFEd5T+B7xGGTb8qV60Au4JEAlPvlQ3Am7FiYv6o5VibBiNR2sQjZZXSZHq37hTLxalqq3c8/7vxJKSyXpP0B4/7QtkjWZcO2w91fQdRvJ0V5OzV7aWV4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162640; c=relaxed/simple;
	bh=37knq3BarReMdHJGIwkVqi0G+bltRDwoTcZKP0HE8Qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UEuBZliINW1vxdyO2NpkspqCKhpBCQODKdOmke2WHHlfEq9c7dSmRB03y8E9/hLpHUSP3gIv6jlzwyb0zh/lJ0vJh9GdYu7al53LNsuHK+wkwIV1O2oFYmTHqPPkmgrPRr/nIiRxmbd5QMROU8U+DLTt+F3kdrytlabs6uGZyew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpVSjgy6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fxSIHv2O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpVSjgy6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fxSIHv2O"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6qoOb3157262
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ap/nScOH8SyTtNz7MDWSz6sn+0rsjWhoxTX864ChwzI=; b=OpVSjgy6FGmY5Pzb
	HI5tStViGlo3hQWjilcnM9T3FN1M4+cAgxgWlUWyEEeYsmVC0b19+u9DMj99ZtYZ
	mkAd7eCfOkGDRqWeZ6PriV2FP+S4muRdLDA9Q1rRSD3nQu0/PXsZ1lftN+FnSQqB
	/bTX4Dp+98cW6OIIKdmJodvxCskwMG0Dw7aYG7iM9eiXc2MJT3XmtUri15+5NfBn
	a/zZay9rHUrGo4i+AKXwzFZe/ck4Yk+HUWVow1sA5MliMApanvL3GGNhNGrLaa1r
	z90qMiBKl5zkQXKkHyNSZuPHal4fGgEODyelk/lbDgw/JJBBOwWzl+od5wfOt1nV
	b7ZQxg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ba9ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:30:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89f548d0872so17775266d6.3
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776162632; x=1776767432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ap/nScOH8SyTtNz7MDWSz6sn+0rsjWhoxTX864ChwzI=;
        b=fxSIHv2O3xXkFtiRszECMak2WIgqdQaDare0QC5KWExSsd2Ec77VoRdasgo3toeGG1
         ig4E/AVY7yn+09Dg+wqv+MVyg60UpYC4UPV9k3qsFmju4FQseaoa3OLJAkc5OWlKNXf2
         REoK7KTVtNBH3xrTzB1CNnlG6lm5WYtSmGbnFOJ0SbCzz7Szal0YFQzph0JaKLsboFwX
         sStr11xecTv7hhUfS9RUMYDdQazS29IX4eF18D+avJAo0qgXiG3IrLn/5ju1Uj1GDKaK
         T5OsX2g9t7PJh+MOxmjYg7aQB+ygpBalrxIisx+gWx37YAC3NeqXv5LyNfBvkByVE67a
         zbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162632; x=1776767432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ap/nScOH8SyTtNz7MDWSz6sn+0rsjWhoxTX864ChwzI=;
        b=EAp2XkwGcajdtWGBIm+vm/1gF1gIVFN4Ds8ejMBRC9FjD1QVACE43ym3cO/5Nyh0Bg
         yNgUOaLBQIvJ99VoMns25Gk1jq02aCFXEazPAGtuA1c6xF4DeYpsl7Ly3P9EPbwhj94q
         7XiJzi4HyqErxmdV5eX/pvRIHkMbwLy5uT6W1nEKdVeMvyf7//4/rQSdw3i1TqDguluS
         /sMbrfwPCw+Ingff1FQ589rQ19UD5kRsO1aidHdgLg3qccWQEWeRZdNZMwqp25jdTUmn
         UE9EcWW/flfYFYhToZXRj09MLjYrMKH+JfnRa54g5BQeBA+ks5KyEWDwNt5DHWNhR/jl
         oJXA==
X-Forwarded-Encrypted: i=1; AFNElJ/ESN2rgn6GaMtXfCmfMswE7coCy12ebfgSOuuOCQS/V813kW/4P1kdnF46ZzF75JgQmvFQKF8wpemy@vger.kernel.org
X-Gm-Message-State: AOJu0YzdruKdT9fIDU4XsXeFfnVA4DioXFeZLcQbfuEGZnOK3JPmQWSo
	AiaKqduqvFN1amyJRv6DxVRRnPQEtDb75eguMrLkcPCg+aUSheyQfWJHc3SxKKv8+8qeY8n9Qsu
	LmybjmTe2Kf1oWZk4+pFJcpAZc5sStcKjbj4kinKn9x0IPV2LXVNdRYfXqjRaoOHA
X-Gm-Gg: AeBDievDrexlIPAXt6DwCBjQXdyHPJ+E0FGHXME0stRRjROEVm1SJhkqbOJf7zOvO07
	1pHK0OvlaDlEEWzM3V/j2xBuvPbp6WOa0VZwEL8aJsn0vnr5bIboY34TGbz1pYpPJCPQMsR+We4
	jnraoN5Zrbi5VIsvrw+zT8cs3UudOhw/1ndRt1hjPaGa+DP2Rpj/B2mB1ij6D5Aw+dHQw5N88Iq
	kAIRKtR3F58+kNplmmfIon/6L2HmwB605RullgRIPsv4FfqNSkPJeTdQ1+My3FvfT8DISSCkd+F
	TomMkvUJ4DnE9MMYeZtzFeooKk7a7Ar9lz8/ZtW3X+Y+ibxIp8MJaotz/XCe+D4KgriV97WEIqm
	G8e0PByH+kt91IYtg0XN2a5o9gkiocb6KojKRNZLOhCzIPh+5kpnx6ttgMie5J/QTrD3Pmaqns/
	dExA5zgMnxh8Aszw==
X-Received: by 2002:a05:620a:4547:b0:8d7:a2b3:3aaf with SMTP id af79cd13be357-8dde924b1f5mr1501741485a.1.1776162632229;
        Tue, 14 Apr 2026 03:30:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4547:b0:8d7:a2b3:3aaf with SMTP id af79cd13be357-8dde924b1f5mr1501738085a.1.1776162631746;
        Tue, 14 Apr 2026 03:30:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6717eb70fdfsm1265526a12.20.2026.04.14.03.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:30:31 -0700 (PDT)
Message-ID: <85e0826f-48ca-4b7a-b3a8-ae0ce3aa475a@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:30:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: kodiak: Add iface clock and
 power domain for ice sdhc
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
 <20260409-ice_emmc_clock_addition-v2-1-90bbcc057361@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409-ice_emmc_clock_addition-v2-1-90bbcc057361@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5OCBTYWx0ZWRfX2gS0rG9X1UZ4
 yOnyyifNotrVc39MtrZ+odV8xKmHNF0wW2QIn2GeIxsc97pIqx/KpCehPCYcDNyjPVLe5pMf8Rk
 TvaWmEZrnfRLUYGLR6VIaK2mw3z92gFcmzkTghu+9LroYNmQsCL0IrMWrLkxxcZh7CYDeln5cDc
 fQ0Fk8T99/RsZn/8gV6WIrsowsSOLWi9W11wFSH1yiMRS88GMA3P9mR7ZhHWXlXhGUNAqH+JJqM
 fY8FbL6goAGZr+QteKkEJGBD/Ns41Q8/04OyM7tBk6VB46vvri0JEJkJ8EHd9ORWxkEr4s5JGYS
 CE/7/xjD8qRwdSNy9gKTOYmLX6Iq/W2DIgI0JXCVaZIYZRGoYzCXFZVvJebHX/hfTpJoPPqeiWK
 BB5BVmGAUHTgYO+EhgZqFOIDmkeT6Gmsk/FQdzDnUZapbcH7/GND1dK9uU3pYpQOBsaLUivzq6M
 9siL8+804VTdd3v45AQ==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de1748 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=D6AGceYv9MrH0eYzXVsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: e914pzpdpll7QPvJaUDXZV_0n1com5Y8
X-Proofpoint-GUID: e914pzpdpll7QPvJaUDXZV_0n1com5Y8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140098

On 4/9/26 10:31 AM, Kuldeep Singh wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core'
> clock the 'iface' clock should also be turned on by the driver. This can
> only be done if power domain is enabled.
> 
> Specify both power domain and the iface clock.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
