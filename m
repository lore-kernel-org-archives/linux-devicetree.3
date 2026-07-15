Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18FC3B635A
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 05:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784094944; cv=none; b=V+IQLeg0oc/xhtK1IHIZwOdLp4tTNVsARdKuR3lPR1h/cTYSnP7gdvMYMKEYOCCv8ZbMln61A4tKRqVQuPtLxCOPJISvvPyezjHlLN4IBbY25E51ZyNpiMyDUrgWpEP42eo1NqJ84Ws9bwwJfbZGoPwUzIxtjAoq47eHHYLDRi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784094944; c=relaxed/simple;
	bh=B4Zmlu2VreGmMwudKumfsHsYVzHL9X2ieoVGQe/OCmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JIlU22NEqz1w6WVPqaTL3jVDL2q6Zp+bVm76yMFi92roN67G65t6mb3xLnLS4wwNFQ0aajY71u0roe4Z0E/4unkNNrR76D08BQHbegvznCu0CIv2JojlLO95Hgu51ctHS038S8/ra8p0hwWL0vdvqovrsTvp9f1RgjS8aB0Rtdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HlM6796R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jq4JFBnx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HlM6796R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jq4JFBnx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lGon2555502
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 05:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N/B6IES+9ZXNm6GUIpKPEsMYXkmhaQ/SumHrsSWagv8=; b=HlM6796RnhvW2YJV
	iqrKV0vmI+rFhjQcwPOzG9JDkiGoxrgjB+2DJKHPh4TF939Sd1CL9UuEQpUK84sj
	nVRkUcFGTpNDNwa1HTn9ONaVY6qzURJd4Q0n4bGcHo33QAi6zONOmVCcc/Lviz+U
	CXefwQe1FtTfUsCtUiYHuc0ns8mP1NThDrapl0vgqDXOnx2HILpfhlyQV2xC7+fC
	gOkVJEG0hNnpv1S/8VHP9Nd+COI2YWzJnv4dqHXZvsQ9ysSfGYHl5fXPYFDsYBLC
	JXmCUQqcaiAjka6lguxr+QDlekwauUU1bcO+aMGyt1NIr1WgDM1lAZOTF+a7jyBP
	vd/AFQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9kt58w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 05:55:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce406883eso15449175ad.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 22:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784094941; x=1784699741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/B6IES+9ZXNm6GUIpKPEsMYXkmhaQ/SumHrsSWagv8=;
        b=jq4JFBnx9GHsauAe5qK421yFsL6RJtEs6BNganyVwK7v87XKb7+nIY+VtD9cZU6TmR
         8B0tiBw7zz6VD6NyXX4Co9sgMaVg8oue7hoRzGRQni71yPf3dsbWc0QaQlTI1021ISju
         2Z5QzCKKq07tzoDBEv259jvhp2Ur0U10w1nzOU5ZFCLH4U6Yp8bD7V3gDgV5uBwNlbHQ
         ebQq9Q0uhUNXqbqhVenHLhbm281b+2PgYmMHMKKKUsEovzlxNmnN6CRP7JuSgPCCJbMW
         Cti7nGemXlLcTz/6hbDOEvDiOorCL06UbAfNyq6DaixQc4tnAWYkvqCmXEw5uWnh6Fmp
         LCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784094941; x=1784699741;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N/B6IES+9ZXNm6GUIpKPEsMYXkmhaQ/SumHrsSWagv8=;
        b=s8m6vDfD1f4qyNbTLGfgMbZe5FOFpsFq/mXsoOV2xUKLvBz8rnFutYe/YfP6gT7aY8
         pZzZMeTn9RuA0yK0rN8yEsI2yxMwHxYQQhhznkz6RPL7m6EKlDQ4H74yKrVCgHKOIC8w
         LYlX672UwgTiHqHIwJ4egxl6xk1j/INCSgOZPLkHjUQWFu08Y3ZhaFfbunmGbDgq5wzo
         yHTJKY5l1y/kV6QA7dGt5hFDc63/JNQ5d7YH1M+yfR5POYc0w0JvCEuXgIJVhYyLY37F
         jr+trAFeXgTqi+BzUF3S6eibHUjhl5JXCKZXho5JSh1vOy20OS7WBaDPLcMzo+DeWHYZ
         1WgQ==
X-Forwarded-Encrypted: i=1; AHgh+RqK0515iAYurz5BHNYVu1ULEnSJsg5AAwH8xyh7KBe89yroQ4KcDD9/8to7W5c9IZO/1BsNeOfaGX+F@vger.kernel.org
X-Gm-Message-State: AOJu0YwOxiSf0eUi715/1/GLoOw61vreyRct72k4iruLyzYPe7lqM56b
	0i7K7W/d3XTkdnWrOW37qF+g/UApA97h0Kq/i4PizUDIGSRIDxBI153FN37eeCj9+QqVAk4EtMj
	7fHyInxaGc+OAK+oDZfeNmd+gbrkRF43tEJp1meEG6UVsgpMMip2ok6pqPkKo/hYz
X-Gm-Gg: AfdE7cl60rlvPDfJBLK45NNWLAJlqa9c4xU89Yux/zFknS0NqeMiHJ1IS6r26gg82uN
	+XuOc+5KuiiCvG6VRrZw7qbBgd1tvK7sFAkHVLNfD8d0rCkdO6CUHL4yUKgvlEPyWQx3Z/dEWEq
	uRTsN7kBJKjwyz73BNc2Ta2U2K7xmAEaxp7k5/AkstPSA4A0Qjj1OFBS6wf9z6o6vc3PXzh7H13
	lMKzwovQHy8HM6sep1rWNP5IDP3JQVOUBKV4bCIUsztZWEgTjmy+se7qny0fzTRcPaGpsCR0k6l
	ninTcarsO6vnAPgKE2SocAMhSqP1rhmJKUNywUxJVGNIwBSNfFHNxh647kGLqCEFwZyQjCZJVsu
	Phh8RAVyOvA3/0kZP19kBks3BSOZjc8pH7oT8we3Eeg==
X-Received: by 2002:a17:903:2c8b:b0:2ca:b48f:3395 with SMTP id d9443c01a7336-2ce9f3a112fmr152899375ad.34.1784094940655;
        Tue, 14 Jul 2026 22:55:40 -0700 (PDT)
X-Received: by 2002:a17:903:2c8b:b0:2ca:b48f:3395 with SMTP id d9443c01a7336-2ce9f3a112fmr152899185ad.34.1784094940219;
        Tue, 14 Jul 2026 22:55:40 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d952sm126360485ad.61.2026.07.14.22.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 22:55:39 -0700 (PDT)
Message-ID: <e34de9f0-f828-4b96-a115-27d262969a25@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:25:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE
 nodes
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org,
        Frank.Li@kernel.org, devicetree@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260714-b4-shikra_crypto_changse-v4-0-06a4ea97c209@oss.qualcomm.com>
 <20260714-b4-shikra_crypto_changse-v4-6-06a4ea97c209@oss.qualcomm.com>
 <20260714102240.B586C1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260714102240.B586C1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a5720dd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=8wWWxnHPA6uIG9S2x-oA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: BHOI3gVeAxnwxxL-EDA0A45DeDT-F7pq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA1MyBTYWx0ZWRfX9laa8aiwOnM1
 qPQ8KZ9JukBusLSnuMjXSspYM42zaO+/1rliE1HXylUOc2EDholtvs9glAFb9el6bf8yXyBEf8e
 0LfNHMF2yfGjLKFMq1SK+1LBWzxK77g=
X-Proofpoint-GUID: BHOI3gVeAxnwxxL-EDA0A45DeDT-F7pq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA1MyBTYWx0ZWRfX4MYDVPVdulPG
 l8vZH7VV7LK7S8t/MvxItQdUH7c+NKGBa7mJo1UU8OpD1Rnb9ZaaEHMSnlrRZhCzsFwYuZa8te8
 ZGRe1dmxdnk6lb2TPH9NvOoIOrdrG8H5cLpi2UxyTfTWkINHaoLYdSJ9azd5J+Xcx7xnYkX/tEz
 4/1cAGVRKteO/6uWAad/0ZFSHEnJkc1ztBOr4+nV8xRAhsljKwI+RU4DQ3TRACybi7cCVd6TGy3
 xfrazgon6GoWAM5pT3bSbCW2h9xDGo75MY3roeYMpAbDKwW3XwX6gvp6YQBb3sqPNpNb+1KhPLl
 BgSKR21NdP1BpLxdsY/zTiFHI8OexNDAhWQu1A8CK7UWJTRyJmEVoIRexk1WH4ts4fGmc7TmB+R
 rzNQlcfikNdKCZ5IhhyomrfzN0J/p5BtEhuP8NpaAs0hmXuOiqAvXEddK6s/vkDlroim4Nt0rW9
 vyl+kQbbBGfQuOTJiFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150053

>> +		sdhc_ice: crypto@4748000 {
>> +			compatible = "qcom,shikra-inline-crypto-engine",
>> +				     "qcom,inline-crypto-engine";
>> +			reg = <0x0 0x04748000 0x0 0x18000>;
>> +			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
>> +				 <&gcc GCC_SDCC1_AHB_CLK>;
>> +			clock-names = "core",
>> +				      "iface";
>> +			power-domains = <&rpmpd RPMHPD_CX>;
> 
> [Severity: Low]
> Does this code use an RPMh power domain macro (RPMHPD_CX) for an RPM SMD
> power controller instead of RPMPD_VDDCX?
> 
> The sdhc_ice node references the rpmpd (RPM SMD) provider but incorrectly
> assigns it the RPMHPD_CX macro. Because dt-bindings/power/qcom-rpmpd.h
> explicitly includes dt-bindings/power/qcom,rpmhpd.h, the macro is defined
> and evaluates to 0, which happens to match RPMPD_VDDCX. 
> 
> While this avoids build errors and runtime impact, should this use the
> correct RPMPD_VDDCX macro to prevent a semantic mismatch?

This is valid, though both macros resolve to 0 value but best to match
with RPMPD_VDDCX which also matches sdhc power-domains property too.

-- 
Regards
Kuldeep

