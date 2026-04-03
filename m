Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96353CF02A
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 17:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775235732; cv=none; b=V5lIJnpMXg+A/ENlt9Y4wWoujYKcimI0wOeJlw4p5XFVi0gDglOjnrpoYYXsQ++rWiRw7QR5kamyvsWnrYpz+QkrEQucz3aQpHZJMUAIZTbzVVUNydkTID+fafd1+ddRlcNUtG6uWvGfj0xMNvXbCwv8qpCVJfrgeiz2FIpcLTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775235732; c=relaxed/simple;
	bh=QiLY+xxac/YWjtxxUGACk94lTSCH8UUN52DiOquCS2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/u4XhnOXOEHqMXHrBreVJBIyzKguF9944shgCxAUiRRD7H6y+RQ0v3He2J99CCc3eGaxCUrFFS/VZiyY0Ez6aHyX1LsOlhzT8zxHUiA8Fn3g+IfKGxRFuO1U3mn1Dx8bogqiGBbJc3/3cL8gZS3UADw38P+CNHzvr4KF00Ps5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrYh9aAP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=im+AUqiS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrYh9aAP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="im+AUqiS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633FvD98259302
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 17:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	awOCeH+YVJIXJ4ufb2mnxlNn72BnJEWkkGCu4Oy4aWs=; b=IrYh9aAPvinVM8i8
	fFsY3Hdvbv3/tqz6BB5kOBT9n9UHBOsL44z1ncYO7GDMveuJhd0LwgvJ19rQvshX
	Uwy2eYRhnoRwn6WxrgM+gcBxwsxZTXO7RZvtAi9IbMVbArAjEGX/oD399fe/ugWB
	tZcMM0RzCyTJqBOt6/S71o+u1J2u3WCmPua6TUtvdiMCMhDdkoCJ6TF41HVJwa10
	7yHGYXi0Hi0DkGzzUp7QvRZnybw+wbRjrGkqNOf8/Cyo1IFUqWdjkV6IuO9khaoI
	F8oHvGRnRe0sOR2ZVhkAy0vSkOhvVUFr3CD/sp/9O4mswkxJznAp4enijmpneDIP
	tiCBWg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dagn206bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 17:02:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76b06f37a7so828776a12.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 10:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775235728; x=1775840528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=awOCeH+YVJIXJ4ufb2mnxlNn72BnJEWkkGCu4Oy4aWs=;
        b=im+AUqiSdsbsDI5ixYORHc1sEjApT8RYsOfvwqJensdf2XVg7kEZFg92w2MG/+iEm/
         to0zSClPGSFaJoM2xOLaZZcsPw5MdvPhH8gL6Q+4/fZWtoQKdvWzH4QSCmm1mZCIB0xn
         eIoKn1NC9AOkfQ0z4OjOCmr7XXmDxk2St6TNxMt5nGoA9GYQZ6hDT4DsE/kekD2j5zZI
         oNTb/aXkob5V1euGHv0T0SQ66Vva9W1mADJ3EIYOvbD0BWKmZPnN0RGP/fBHMqUh0ZuO
         zsc/1jdxJe7uYRqKnTYwJW5RTgLqFwh663LjMg8UJVV34EgWNvAuJUsf/Y1tNGNQCtI9
         dAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775235728; x=1775840528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awOCeH+YVJIXJ4ufb2mnxlNn72BnJEWkkGCu4Oy4aWs=;
        b=naP6uXA0Ye8uRovqA8sa+oWHInjX8aTa5PIwFoBy+z9Q/M54QBwOeN+4sCB8BjheIa
         uHlsj+RzOJdPS+a0Ehkj2wngoastrXDrh9GZ6+2+nYFuTlZ6JKcUJEDO3z/wsfdSzDjC
         FH0ldnaJwCGqQr8/dcgD4r1192zVq8XLiT74jhfLeXGPvluM8Y6uD43Vuge6hUshTjT2
         lZWTMV2fbx9DARCe0KMhnKJLj9e0/l0tWE35VZD8/lP9wAbA2yR4E61oMdX6xTxdfr7M
         Mo4fHShQWPNZgrk1Tjzq5HylbZtqitElUyysJWnyCYLyFakUmHhy35hnB0ysZxXfR9o8
         g1+w==
X-Forwarded-Encrypted: i=1; AJvYcCUjYfrTA26cWfjFHziSaiwGu8VEXusSiGjymrbngmBtRu4wzbN/XnprSZ4W5D/QJpH1MyB7PNuZ+Bmy@vger.kernel.org
X-Gm-Message-State: AOJu0YwU+MuPfWkbv9iuWxofK84bZuQZEDjHfr8V8Gb/dcL94NWQov93
	a9R6brEWBC4Gy9EttKyUsugYxvzXy6Slak4szwVuMEFNjipQLiPGLhY3TUlfbmV2IApGRZXlt2x
	Bji1FUIJ5MRzh5+F9cK191hq6SGWPZj1YW/Wnkrf3naiOZtcKEgj4hjpGS8OFAlDh
X-Gm-Gg: ATEYQzxWjCKqbDXrTLzajslViH8QhqKWNHcvwjjKWk9q0qwvoQ/CCyr+fmJNAVW6Dee
	TB/5seS1fIh8a7US968ogONeEzbsRamUwanDRNgoPWjB9Rt0GGjkJLPcB0Ved8+BeUgWklrQEMV
	t9OQhi4f6ou+yWykongkpjAf1r3e8VeTAfhOKucf4zfkaLSOiYZeT2WaGZcQgEKMGix73vw28V8
	Q1DmNUGdTjF8EhS4lKzbKqBJR30Z555vx1Rr//UO1HPr4hdGqZrx0xxcHNkgGVzk+CxfXqfGbm+
	VRQdGkXKy0zKqIewMapZQ6BbYB/mVunzMntDy+XOeetDUlO0L5GA6Wb5htzcFPj2jXp73gHOCwS
	ZmXH1KgQKujjh33bT/x4avB7W9e5jA6KadHMhC6MJjds9JjAgL8U=
X-Received: by 2002:a05:6a20:3d23:b0:398:98f2:744b with SMTP id adf61e73a8af0-39f2f0cc6ecmr3431465637.56.1775235728439;
        Fri, 03 Apr 2026 10:02:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d23:b0:398:98f2:744b with SMTP id adf61e73a8af0-39f2f0cc6ecmr3431426637.56.1775235727815;
        Fri, 03 Apr 2026 10:02:07 -0700 (PDT)
Received: from [192.168.29.116] ([49.37.147.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65a6b1esm5496843a12.32.2026.04.03.10.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 10:02:07 -0700 (PDT)
Message-ID: <48955ab8-4479-4f77-a926-ef325c7275fa@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 22:32:02 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8450: Fix ICE reg size
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Eric Biggers <ebiggers@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com>
 <20260402-ice_dt_reg_fix-v1-2-74e4c2129238@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260402-ice_dt_reg_fix-v1-2-74e4c2129238@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE1MiBTYWx0ZWRfX8L/23cbyXYPT
 zSvu2kGmkishBbUraMKxbicN6G0dHtpK8rnk4/uaHW+jAmpokczh3pHd103g+NczDpUb0M7ffrC
 +iXZ3Vq+WQmz+/qdKhKYibmDLrMRDSMtdpvyvdDZVHcPuCFhsBjYqEBHBTLSNo6dzGCfJISnc5P
 pgLM7cP5DZ0BtTmICnz39ChVYBtjgHy+jeKKxUMAqcf3wG4norXtdJ+qOT21XMde59T36f4JFZV
 SMdKk7uVUT+mgKWLZhQVqhOtqFSwnT/mz8IOo1gNKOEMJw4oA1Ht7C32TWnHMVqcVLHZpFMTva6
 NzH8bKZs5ZMZ32tp3R39jMr7Zn88eDu65wk08fohFEA9/kyNaRK82AnAblbDGJqmlLoITgydkJ9
 feNFT9WitvjC2ClsmvMqJ+v6sJVm/LtVOZkSJbfMAMzCRJDq645i4JBJBvRg2hFTeAdwRRc5ELa
 yKH/z4RJdr+fJEmZPTg==
X-Authority-Analysis: v=2.4 cv=Cc4FJbrl c=1 sm=1 tr=0 ts=69cff291 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=pj5RAjPJ5lVSI15MjsbsBQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vvlqyfryR4XdNjQMODcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: BVkM8D71zTnli4A6xx8dh_4XCqBQ4HZU
X-Proofpoint-ORIG-GUID: BVkM8D71zTnli4A6xx8dh_4XCqBQ4HZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030152



On 4/2/2026 12:05 AM, Kuldeep Singh wrote:
> The ICE register region size was originally described incorrectly when
> the ICE hardware was first introduced. The same value was later carried
> over unchanged when the ICE node was split out from the UFS node into
> its own DT entry.
> 
> Correct the register size to match the hardware specification.
> 
> Fixes: 276ee34a40c1 ("arm64: dts: qcom: sm8450: add Inline Crypto Engine registers and clock")
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 920a2d1c04d0..3984d6f8932d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -5373,7 +5373,7 @@ ufs_mem_phy: phy@1d87000 {
>  		ice: crypto@1d88000 {
>  			compatible = "qcom,sm8450-inline-crypto-engine",
>  				     "qcom,inline-crypto-engine";
> -			reg = <0 0x01d88000 0 0x8000>;
> +			reg = <0 0x01d88000 0 0x18000>;
>  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>  		};
>  
> 

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal
