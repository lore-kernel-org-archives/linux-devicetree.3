Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747E04071D4
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692908; cv=none; b=tsTUhTSklV7PMV8eenctAbBUjIe8jAEYfejCkKz204cUgkpIKchH280/8an8OU/SHg+lGmq7kUCOiR3FsMilGOpzdTC+OH3/KfZGcIORmGvEdowdwY+uzPksZYwYsAzGHdnj8jzlnX6O9BKDwhJATSjYTfRYeeuVHYF+opBncVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692908; c=relaxed/simple;
	bh=EUSlZUwLWMvoVEDQr9/idc0e5nOVqqbWV2y/4x7vcOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jkw4+qPiVc5N+Gdv9JKzD2oe/Ido1CHlwrc0pifUUidDiv51ltoaniViCR1YqRvj0V6BouvCQoor+WaNJ7+79vsXst7sOeiorc4kE71mDkRLVLvhKQJrbROLIVaCvTkmxUBmcHh11KQPfKzY4bhtUljkKx8A0zYUrDcO6+KDsYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JsGkc56E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQr5IZmO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JsGkc56E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQr5IZmO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UxOr2025439
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oru800u1N5Baz11FyB0glT1J3RCvxYRPqHUptIb7xPc=; b=JsGkc56Er/VFUAZg
	i6UFvOqOoiTsMPKtsbi+WGz3aMNetqsFhB9IgbOgfHJYMWdHaICW+coxUXzaxVkG
	dZaM7W1N/TWvODuftfLYGblHbT0N0DCTQQDaoOyf+4axqy5T2Irs8muA3uUc6VIU
	pxMmPFpqLDhVdAF+xWa3HxyIWs5kFTQ3IdLFVAvorlyvZv7siJqsKTW2Eb5DjKIG
	3gi+nF8eMCUvhCR9e1doXAyxoqKPmF0+chCCfbAcyAnKrMYxVD0Wsm1Ipvo7Kkr2
	l4OIPE2olOyEBhahKHnYNNWAQRYgXjOQVtiCwbB/Q3EafEZx6b3Lpc7xpgXG01Oy
	AIut+g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euees2ppj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:41:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8d37bc61dc2so15682886d6.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781692904; x=1782297704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oru800u1N5Baz11FyB0glT1J3RCvxYRPqHUptIb7xPc=;
        b=IQr5IZmOzWBLp5FSdfMVvYKpKuBbzz6GTX6cTixJaQ8nAzL7bnlbkxuF9X94YF67tk
         QLm7dTZgCrfL3l5uEtuhaOQCYnUQK8Oq6YuChhWSIcUHZfi7uM4QGpFDHvyhxm3Gflc5
         6lbAe0wzP0EHdeakWDio2qF+3+B1SRzLn5RmtjKUkbZ1kNsyff9lbEKznWz06BetQpOo
         GXRo8AQt0zgAsWEgx+p4kNwVlVwWkTbr+3wArdN0GpkxAWFEJg3KubWlRwcFBkD+5aVt
         B01jCA6YkqoML7iRAkPgJStRSvMZcBrwtF5oegEHCI1ODEIEPlZ1swJVjxqufUnQhyfQ
         7hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692904; x=1782297704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oru800u1N5Baz11FyB0glT1J3RCvxYRPqHUptIb7xPc=;
        b=f65uxRsMNGsevPtN9hgNQPYHj5mlrMbnOZCs/k4iT7+FLPGxJQOX5Jl2uMwA2Dl+3Z
         eIGF0z/F6YtcOsA2e+CBE2cJpZfszTQcPRfjXWK40RC1ClPP6yNClYFFiRpkrh4Ej7d8
         RWpOraYi+WuY4/chuEpPviATvdzPquvELsmhym5WADbdqK9vUD2k7XGxAYDIxuE1WeGl
         bcykfKydGT+n/LPzR9GkNYUlrvQOjMoQ5A/S6HXOT735Cxt/m9GpqHlcOB0PnwBTeTYb
         BN3DX90XMFtRnXX0Kf7MBT56BAmU5gRKrT8Y51SCct7DQeuxVHj9x6SJ9B05RsPaZh91
         s9QQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lRHvyR6nHSB13/I6BM86Ykaz2mSodgWHZvdMkfboXyBTenTT8ukMlNT4DxKSarBRQaj4Bn4dvmcgt@vger.kernel.org
X-Gm-Message-State: AOJu0YwrPs+hjOPg70lDC5ZllT8tr4yh2ou7a/YvjsuiBODkGxp3+oUH
	3JknJG8jRvLyl2RN6XGBElUNzkAhES0lx16+3UCxYVGz/3+A6jR1e/nNtMGt4hvG0NDhwRvn80S
	7CsvP4ABIMRSC2I19KECeiKK6gL1xGkWW0tl2G5LtNRgYR3dYZQx6AktqhKG7sEDA
X-Gm-Gg: Acq92OE5F5ouEkVbg56nLRe87IvTkqRLm6pHJFrcgz05bCr+jVemZoZH5m0ZCxtsJty
	kxrTCI1NKO0xdaSgxHBoN3i2q6QDinW15uxqz0fUbBDWn8pKBKR8zI45dJdZAy5yl9G+uAYVY9a
	JyFBrgmPE8roP/rothXnmu8wHlalkMgIiadKCgC+5zXSAHg224JEZeJAe6SVEOWrqbXsQnqguKc
	NBy+/JcgRL1w2HQ4tRb4AkhxCIpIBLpGR2t73WuzlVqz/0gP2X91DQsz+dAxMuLvu2pMB4HZR46
	ZlWSuQVM5SkprYIWidgoGzyNBxFD4c/Ez/rXVW83lg/j/a6QRcGQz3q27/fTtruv8LP5A8z9KqT
	ZIwwXMNzuNFRkboHJR9DS9PqijXgZF5WBZmY=
X-Received: by 2002:a05:620a:4408:b0:8ee:e440:fae2 with SMTP id af79cd13be357-91dbc52bf48mr248046585a.5.1781692903789;
        Wed, 17 Jun 2026 03:41:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:8ee:e440:fae2 with SMTP id af79cd13be357-91dbc52bf48mr248044885a.5.1781692903311;
        Wed, 17 Jun 2026 03:41:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6dbbcsm800392166b.32.2026.06.17.03.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:41:42 -0700 (PDT)
Message-ID: <eddd77cc-fabc-4a2e-aff9-602895495ad1@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:41:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: add cpu OPP table with DDR and
 LLCC bandwidths
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260605-sm8750-ddr-bw-scaling-v1-1-f39f918c95a7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260605-sm8750-ddr-bw-scaling-v1-1-f39f918c95a7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -Z0RUHY3DVGaN2hk85heS5asE2E-LtBL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwMCBTYWx0ZWRfX4JhQBDzV4nUB
 ahyWxou8ap4OAVex3ZZtuRr+kpxadnsvGEpSqF3Rmdp0WPTp7VQET/mGUz4OIvpyypXV972LKkU
 FKjH36R2J2DCo1eySEodqD+jGJ4HnOOM1n0ss3rMVfAdWOTjbFcIv3gjmgYMzA1KFW/o29OGvEU
 /ZWkP6pnWsXdgCHODWNhvxj5gOtp/OWHrISak1nMQXoCj6m/xhv+KhvS81EGdv+mDV4HRqBZtL8
 bcEZRMWT2zU6D/kMJSTU0d3czP9r76hH3acf06gpnncv1TUTXr0cAHD8bHp8eJjHmz/zS6/xbZ8
 H16y9JT96LmVDSm4odEANLROUYVsKffJ/2iVAeoU0aXJvwKK+dRSdqvptjWMPV+WRbTQHq3FWmP
 GGVRuHdN8gu2gx4RVL7jJmBk1YU2m97qhn6SHOHBLsrAwfToSsoPOFZICfOUCdWptPJOh3Dke3a
 s3aUAPfToixNKcYfIVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwMCBTYWx0ZWRfX/b2vyRMJOhZC
 8lA0ZZwWFqwgxhENkUwqjK2/oUxC9lDfDX8xY3aoLQic12X9mW4EFW9rGmNstrdKV0GwgYLJ1+L
 7mLpch2kMEWyjuvn1IGK5RznfzZzjAw=
X-Authority-Analysis: v=2.4 cv=KeTidwYD c=1 sm=1 tr=0 ts=6a3279e8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=SpO0_8FnA-QHqli_aE4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: -Z0RUHY3DVGaN2hk85heS5asE2E-LtBL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170100

On 6/6/26 12:36 AM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Add the OPP tables for each CPU cluster (cpu0-1-2-3-4-5 & cpu6-7) to
> permit scaling the Last Level Cache Controller (LLCC) and DDR frequency
> by aggregating bandwidth requests of all CPU core with reference to the
> current OPP they are configured in by the hardware.
> 
> The effect is proper caches & DDR frequency scaling when CPU cores
> change frequency.
> 
> The OPP tables were built using the downstream memlat ddr & llcc tables
> for each cluster types with the actual cpufreq LUT tables from running a
> CQ8725S device.
> 
> Also add the interconnect entry for each cpu, with 2 different paths:
> - CPU to Last Level Cache Controller (LLCC)
> - Last Level Cache Controller (LLCC) to DDR
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> arm64: dts: qcom: sm8750: add cpu OPP table with DDR and LLCC bandwidths
> ---

[...]

> +	cpu6_opp_table: opp-table-cpu6 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-1017600000 {
> +			opp-hz = /bits/ 64 <1017600000>;
> +			opp-peak-kBps = <(1353000 * 16) (350000 * 4)>;

I think this should be * 4 in both cases since the interconnect driver
ignores the channel count for a node in peak voting. We may have a bug
in all other DTs here.

BTW, are there no lower OPPs for the fast cores?

Konrad
