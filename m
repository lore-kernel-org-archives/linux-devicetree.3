Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0026386565
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 10:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775818447; cv=none; b=o6GE5FKAw5hZwYgLrOuoZ5ofKQSUAvU9yBxTyry85avu2st+BpFvVYy3VDfycMS5OdpsQ0qwhFlxJwcyZ2UdWwNH+M7bRlg+D7MxJHeY39mkSGQgr3Jcnd3RDhwp1XFgYx0W3GiA3FxSZOEaBfmDHdkGHB/8xEyT0Co+JBH7ptA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775818447; c=relaxed/simple;
	bh=g4vDsx7AAeCpkibFY7xmrW+P9uLh9E8MtiKJ9h0jWFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oULWc3wRXa90fKCdZnGGDjb+PvzrfM1HfPp0nzDWefnh5PGkuCt/9YBCvkVrEIknfsgyDc0T4u7T1+pul+ujo/U7/G6yyYON9IkUX2cmgNBE+GEFCNGsHo3CdQgoAmw88mSFw1/ntpiBCk0lhxP3Udv7qnSD+0V1BjGIr+ZkaGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PI2wsrZm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0Q8CKmV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PI2wsrZm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0Q8CKmV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A8xiYE115439
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 10:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T+T0pbPrCFK4jJi0PBGJd5tN4NDcA3zu0rne4iUcOJ0=; b=PI2wsrZmhb06nJHk
	ixSERcwKR7VoHMq5XbS22tdm5yrkvWrvRSPtYIMxPsG98HNSKGig5N5SneTqiD4V
	O0tFxjI5cs5otUqvx+3fQNoPKfQMVjW5lgtMdKOnOAMjbeeUq/6CTuMOEAgA7/tx
	juB2fczNkQmTtmp5/1CHgCofb0wPHHDx79kBtAvxiuG+7fHuSgw7G0QQvN7QOZ1N
	Dgq11cyBaL4AH7nwJYluA7o37LmeN0/TtuDFWSSO6GHbmGjAR+2EV9VgsXREdsDT
	erE9nrZloYPURlGNGm/epf29KKRifpnWq7FwZcO2ibA3WGO6ufIL21IwFOxtWa5r
	z0++/Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dee8xbht1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 10:54:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adef9d486bso18752195ad.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775818439; x=1776423239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T+T0pbPrCFK4jJi0PBGJd5tN4NDcA3zu0rne4iUcOJ0=;
        b=T0Q8CKmVv/SpNxwj2Z3Edv/WlsXgGhELz1+WyVDJRtCMBlvbSvmMtG0B6WXnX0hzja
         fQHz1x1SVB1MHqFJsEgFsG8FR6WmPgDeYClMptyQgB1AVrcFgfnvrRV1wtksOhSsWiTM
         0Lww59K7Xss7k6qlXUa2DKgVF0Iib9Fgk3+VEC8l3w8eL1k/dK+RMsURHWSGCz7bi/L8
         okuxYwI64l1BJOaSX49vC51ihxf0kb3qVEErqTNhAWHAJZhQCuNp3e4p9kQmdtpIsg9M
         9BeZAYfuru5q901YqHOaKZrbaxkzpN1h8SGKV1tzHBNnZtmisPlhD2KS1bqIQES7KD+m
         xuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775818439; x=1776423239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+T0pbPrCFK4jJi0PBGJd5tN4NDcA3zu0rne4iUcOJ0=;
        b=iTJzrG5Y2jzCTc5L+9CQzihWTVPIBMjSjUiu26EoCvy5RhEiyBUIQXjZ7dON1ZZwzH
         Pf7C6EWCrC6dMdDcdcAUVPu5qpGhCK6BFSrOC2wXfGQj325OvGsgLPxzpgKC4UvhOVSq
         icPZbvKhe2BUxwOcc/Uu64Zd3rZ9/iigiE4EhKc8cNl7ZOaRQR90JjS+9elDWJaizM+w
         I8V7FKvfzGm/c0EwYUICJtuS6UMt53RcPEyL8U/Tt888h1WhPGyuQZhm1A8DhO/68UGU
         Tw+bCvW4G+m92cBTJ4VrnN7DsmBvIYMH7yJpSdc5vx+Xkjb0dzobt3yZ9UMAHsd95RUw
         PGsg==
X-Forwarded-Encrypted: i=1; AJvYcCXpgj5udq0hWSjLnBVJodKyLC2CFnaXsz9saJsteazWLBkXwbVMjCC4SWRj7LVzQ25LCTGe5lsoDHPl@vger.kernel.org
X-Gm-Message-State: AOJu0YxOMQReavtgDbHm4V2mG060bjnU5nqM/Wvd8EUrxCyLTtm51vd6
	8xdiFOjENhItXq6WXc+4OJKI9DeKVizZi4StKuxBbDX+O5M0DQE+j0AvIay9mNtO9yCV3WZ8cPO
	OttvYkB/cI7KqeEfaV7IpBLmqCVjwVOXKMhNECRrqDowyS9BF4x714q7lHfzmL1Tw
X-Gm-Gg: AeBDievUa5YErbXQSUXXVOOGuBT6HUoDOWq7fPbH3ry5It5SsKWIZO+eWGkmF/6tf/a
	hrycVAwUgEEFP8/f3Y21zj8Nthld4ZL/RD9qfjL8wCN2lAZcdThmmjhqM8RcLUIVCUBany2eBVN
	61HGWAPJT06m2oxNBR15WFb5wouHkrya7IkCC5cKUjMwMXEEhifQqHiKmJh09T0z5G5PfjOEyuc
	aFgzKaDuryCZlWFVBXB8ZyjirWufqOFA+ms1FQaZKGr7Dpvz4xbDMx1t+w2+UpUXzCK1vCDqdsR
	3J1VTzVRLy5r6OQicBYYypFih4TgxUbkME2gM92iY2j+2DFpBo8gF8rBHF/gYB3aVdKQ0S2i9rG
	f4MLuRZdULVib+qNMxYo1naA2rdYV4z6BakAHj8jKvwrl4D3HF6F+
X-Received: by 2002:a05:6a20:432b:b0:398:6ea8:21f7 with SMTP id adf61e73a8af0-39fe3ce5e7fmr3214221637.15.1775818439096;
        Fri, 10 Apr 2026 03:53:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:432b:b0:398:6ea8:21f7 with SMTP id adf61e73a8af0-39fe3ce5e7fmr3214178637.15.1775818438564;
        Fri, 10 Apr 2026 03:53:58 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79218fc8d9sm2160706a12.12.2026.04.10.03.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 03:53:58 -0700 (PDT)
Message-ID: <cb6b19ff-811b-427e-a588-cb85c6854da8@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 16:23:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE eMMC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
 <20260409-enable-ice-clock-scaling-v8-4-ca1129798606@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260409-enable-ice-clock-scaling-v8-4-ca1129798606@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEwMSBTYWx0ZWRfX+VRYA6aYS06r
 VgbLfgIiaePQL8vRQzu8xjIlg06+gKwUrz38O6D2liMXpfdTEfkOnG5RhIJZUM73PesA84L9Q6+
 BCadS4HfaKd/2/Pxq6PpNVFaqYD8tRXwo0cIussf7d/dX1GRA+SFWlohIwmIvq5yq+hm0Ov3sko
 IrIZzful1Iq9V3zoZMR27zSeVyitg0pCQjK6Wyub5SaAwu0WPiSfia/W4JhUU+AyIsXE0uHpzpw
 MRaaSeKr9NrtxS29LGmChTQQbaFnjE0AjAMxydJzRobUywD/NoK4dYmfTbv+5Ttq0uTZXYst7V5
 tzz2xI4mGXetGhraGkw7L4KQq40uIfXou+kWZdmakXM4ZA4jOHZBTdx0BlFWm4pXFQxEoemKAgd
 6JVSkKmfkKj3JsoK/FCb/4Rr8nO6NxEoyrNqYiz4djC4qPE6VyVLl+cUqdR1YZtXuHviTFBVPxt
 aWwRHZ4qfZOpLR2UhMg==
X-Proofpoint-GUID: _HB1n7fgMnGhqrM-qYrTaHqI2dDjt29r
X-Proofpoint-ORIG-GUID: _HB1n7fgMnGhqrM-qYrTaHqI2dDjt29r
X-Authority-Analysis: v=2.4 cv=O7YJeh9W c=1 sm=1 tr=0 ts=69d8d6c8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QRdWpJMrku1fmPn5X40A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100101

On 4/9/2026 5:14 PM, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE eMMC device nodes for Kodiak
> platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index c899a17026fd2a10ebc528a816629c88ee3bde5d..b0aa1970d42a3bb0b9d371e0e6cd09b8cd164dbe 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -1087,6 +1087,27 @@ sdhc_ice: crypto@7c8000 {
>  			clock-names = "core",
>  				      "iface";
>  			power-domains = <&rpmhpd SC7280_CX>;
> +
> +			operating-points-v2 = <&ice_mmc_opp_table>;
> +
> +			ice_mmc_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-150000000 {
> +					opp-hz = /bits/ 64 <150000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-300000000 {
> +					opp-hz = /bits/ 64 <300000000>;
> +					required-opps = <&rpmhpd_opp_nom>;

As per hardware spec, 300MHz is supported by SVS_L1.

-- 
Regards
Kuldeep

