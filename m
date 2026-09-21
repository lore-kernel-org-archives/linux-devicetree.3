Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DD845A28B
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984162; cv=none; b=rfABE9IaIxWGl/fVkJ7EtrizBahOTcDbAILBLlROfcuxM8s03dGk8VzjPcUDnaOeKN6hAZRrt8wWxfgEPZQzGS2n1ffo99B9wI7U+b9xiUTDbO37KJudgV8wGcC4SKB7T5fmOCrgJ0BOfTz3NOHBv0WkGlEJrHxhuquOJ6LsNpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984162; c=relaxed/simple;
	bh=RFiZzF2ElB0O7/pZu8dBVKeJi6fv0kAHLxB/68b5kK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7hdmwbMkxuJIyfU14yAbj8Fj4KzaAilzfs90fmuLAewKxr3pYdAtyDd5YSpI3HJfui6hGGJwiryB7vIVKbAWnkqTqitSqMtGCibTPePAWLXwZ7eGCe3+5/3UfbgTswNp8mQenpgctZJ1tgo3UDjnZcH7TxUfLyeA0BoSZLihTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n+x153h5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FYTapqGf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n+x153h5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FYTapqGf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79uSa467171
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GsKXw03ZbXYXr3t2AeRXLXUINacd1i8dLiOD20nvC8I=; b=n+x153h5p7YMtISI
	ngKfcrj2YibnqTzb3BTzUHRWdRrhdAAMcYciV5hIicV3VSw6+DiH1tzreYD5behH
	zuDtvReAkXNMvDL8QaprF9Nup8hZUYrzXBqPh9IfZgWa7ifywhxEQ0fEoXm2MfWy
	EYdkWICJpUUWfVFdGrslJay1wngk4Dhbmbr88piHgWQcJCvdPnGi/H2/xg3hxFkC
	gHCVE0gzwfq1ko1RvWuIeLZ7fYwraHqE6TEABt6hgD2ZgbraoFuHhUbh4TgaP/3c
	A65h8DNI4xS6Xnix64+r/MmJ1Pbzyi4ggIpS+VjogV8ffMu6dd3XmaAbMH7Avq3Y
	1wU2Rg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8ba0vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:49:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93bfab40895so23171785a.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 02:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789984158; x=1790588958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsKXw03ZbXYXr3t2AeRXLXUINacd1i8dLiOD20nvC8I=;
        b=FYTapqGfNawKXB00fDDa8Bckx3mrl23e1voc3nnZMeg1so7h6Z3ZMIqosAhp+ea5GL
         pEU07jjBLL+joOAMeNdMzbpFQNph2Jb2WzFQXG5qqzOF/TqbLZIcKOPXHbFDr5It+pb8
         pc6VyeEj9wRyz9/TbPT0ZmHrNFrOtfxl1rWhCmvQlbIBL21GIt2Hqq79lMrqsyeOJnmr
         +LZLOou6iWxi/gAf8XMTkK3MKa778951lZ4OaLsJTXFZxlLcqaG1qZsqQ5nYojqJuv9L
         4YkzZnclRHCbcJnaPqCXtVwjH1cz0QOYIDmDpnTe7khuehPFvjoun+xD4bRancTllplo
         lcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984158; x=1790588958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsKXw03ZbXYXr3t2AeRXLXUINacd1i8dLiOD20nvC8I=;
        b=GowP6FQl/rnsPHppM6cQGgKAEnCNdnYuNgvXwJkwPG19MuyfUnBU/kN3wzHxFEl1yK
         sO11ZVrbzvzFteMyr8/010JUnqqCgpoLWN4WvzOniTNNjs0iORepdUvaoM6loGPp8ewy
         oVskhuiiqxIPRrMOw6IFElxDPa8M4QfcRJErpT4bmhrwJcE5Yc/eFT3+HVJbO+yiazh4
         c7zlDSqmzYWWgPDq7TVIoYUp+oYfx7kyB5Virx8hJqfChKfHgrMANv3dKed3IAsQlZ6W
         hp21R0mJ5iH8v7QaMvIaPIqOiy3a2dom+X6p4cguCFfgxwuwQ9sKi55z7AM/ZftTWuVQ
         Oq7A==
X-Forwarded-Encrypted: i=1; AKwUvBxLNN/3Xs8Yhny+ih2qBbPsRh4bXMEnySfikaayjAAn+8TQetlmFwt2Aafvf9hZ7GYoinGHf2syJeWb@vger.kernel.org
X-Gm-Message-State: AFuF++lkxsWrqcsQo7t6HXAaG/bajYObfucmpjQp+P2i5IECjfnCbBIe
	q5KCIHXcglMIcPsBORpk6VYO3lHHo/Gyd5FFgjOtFY9Ib5PH53oqS6rF5byO9l1+8oP5FMCu7YF
	R6vupEOPxSSwL0iud9yGK0YSQj5FO0Vl2kC/kBEXEzlQg0virV6nG1I6HsgQh8GoH+fUdYO6Q
X-Gm-Gg: AYBFou3d1s2c4WmSEtPf6jUGaa4AYWvqYqiVU4MeW28gUcR38SXN3qRN5NShevDWKlb
	Xz4lU7khVjrlNqFrE0RaBgNS/PxTfVteWGdUD3u8pP5vER6vbwYcYPEEVTOGB8KeRUiw1XOySN1
	KyqXftI9kTIRtnSwveJMlFHXMN2Sv/0M46uUhlUqt+bsqpiVMkOrDj7cUGg+YtL6FWVupaURSIY
	LuZntai+ohYeK7nv9dNKT0fDF0JqupD/5ryV81CT7bYQcx37Wd+PJhMmwy+5HexW1qzBOolWSDH
	kRjk1uozEb6UHT0/oFa+TtVieQMH8mhrcTlKVPYGAGN83WdJWxPeUN0GboVg1SLfZqTazY2GHbf
	h6g1hB7l9/+9pdE0Nva1FVQ==
X-Received: by 2002:a05:620a:6f05:b0:939:94c4:b799 with SMTP id af79cd13be357-93bf57bed26mr895927085a.5.1789984158617;
        Mon, 21 Sep 2026 02:49:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6f05:b0:939:94c4:b799 with SMTP id af79cd13be357-93bf57bed26mr895924785a.5.1789984158287;
        Mon, 21 Sep 2026 02:49:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a355eb33bsm288228466b.15.2026.09.21.02.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:49:17 -0700 (PDT)
Message-ID: <36fab4e6-ca34-49a9-a8ec-d2a6607171c4@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8150: Use SM8150_CX for the SDHC
 power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
References: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v2-1-a8610199483d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-sm8150-sdhc-use-mss-for-pd-index-v2-1-a8610199483d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfXzHFoxbMA/6EU
 Uw/wbB93ATKebyLVdh+e4oPHzX6Q7ZMYv4UF88XRVY8yd7Omp6K18iR+HwODsN1u78dyjZyxk8M
 5gyKDrnGD6IMK/Lk+fLBsozzR43z/B4OYcUulEi4/uM4p8tjBQPLLSCDBNj7TeOGUvtvjOsEOdC
 ecciiNy6b0Rc5k4K9o2k89I+4g+kET3q1ozW82960VL376H3EewimRNg+zsCqmRcR3bDUhZJuCY
 RMsI+4Zjgv/ZjbBUI2R3Mp/Em23fIuvlA7C9GdlAQDbd4Ng9NV3HpCnb0IB91qC+NZ0PApuNM9s
 GgVnsBp7PGZorlYH9VQDE7zG9ZHw/x9YN0XfkeisWRIVaKgpCoCIIUNyXWVThQPUaJdcPJdbGzA
 XyUmKq7OhGjtojGiooMQ9CYuLc0IHypmtVeOYWu8XdRUaTJG+gu0viaAmpEucTGh4pr2j30IJuC
 tzSR95jGT8ZoZtP7W0w==
X-Proofpoint-GUID: _2ZLc4UWzPl6YjoczauKfrI2GUUdKzAo
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab0fd9f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=22wPqFrHPIZlpLYNf30A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: _2ZLc4UWzPl6YjoczauKfrI2GUUdKzAo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX6jy+FGqmzcq3
 +NRDoPjhKfakZAKM7pmmBM5RBaqHNWtfF06MkzDs6LUjj8kKfT+0vUYf01Df3tngfHnuBQEebbk
 NA67NmSsOK3utK7sG6lui31L+qPK48M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210141

On 9/15/26 10:44 AM, Abel Vesa wrote:
> Replace the raw power-domain index of SDHC2 with the SM8150_CX binding
> constant, which is the correct power domain in this case.
> 
> Fixes: 876644c76034 ("arm64: dts: qcom: sm8150: Add support for SDC2")
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=45
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
