Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F203CCFB0
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775235695; cv=none; b=sBjkkLoHlDYHmDVAc1xL2pTjzL8tdebv2vt689KhaIDbXTFctmkQASnnAFWx5vZd9gZo0EF51/PHh9kr9RLEtUcFZzi3v7Bzvt24+OXSqmEwe+NGaNza2BMx5NR9awFcHLo2m4gc7IvQs7Wud4l54TkLm0+STI1pPszGvf116LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775235695; c=relaxed/simple;
	bh=PA0C4ej5YL/VzFP4tE4ta3PvKcduZVLgCuPM3C6M4eQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=piB8k/TDyu8B6tgpKEgls13RAejC1FWppqxcL0L6oaPemNmc+sXSCq2wtHYO07eKnqp1txeh6tkYMTLlXsSHUpAllZLbK2fqoLgATsRxxvIHNHsrG/xjP6EmheYDtx7rCko7TwZ/PXuNL/AhAOkdKhKhyIlsd6Dly7auev3PkC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mmk1jOuI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RezjBh72; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mmk1jOuI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RezjBh72"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EDBjb3773275
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 17:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2WCjm4bmftNP02ylQSc1VUrhgMuL1A1n9jIOcKmvYA=; b=Mmk1jOuItibzAY61
	5woSpu+MRp8GecYFWmWVsXbC7WU8yBvutMc4CsO0WrZgSiyIgk5gP0bg5edvaRKL
	B0yda2FyHSQKngPNvkctzXEZaTecUQgo35b0Fp5UNmllAJYapaqcbpHw4MzXWlIT
	zy52BxksjcWxx1HdbqPY0wf30geET23v45ZQTOg/doOAePBu6AfEH/LtkhsH2rjr
	QDRSwO5RTZOOkeNx5EEj+QeiTKWAvk+Po6pA2FkQg2+0k9orkkuts0V0wzn9/sOd
	RLI5oghNoOR5ysLWwMKZhk7jgEJHnob3rr2BVE94m6ZbamNpDbt/hkHrGtW3qcA6
	2E534A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs3mcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 17:01:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0cf396c45so22148525ad.1
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 10:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775235692; x=1775840492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2WCjm4bmftNP02ylQSc1VUrhgMuL1A1n9jIOcKmvYA=;
        b=RezjBh72ymRCbX3ABLCQEh6PY8+Msf6+pfkZ9Eyl+bB0wHb2YjHHoXNe3RPvRNsjmP
         zKKt9ZFvabJAG5x8yI+2zZOwR+1x+tduGAc2C0VqIIhRlN+FBnZLQZsxiDvlMjSMBWfG
         68FpVExNFiT67HIBmKa2vg5ZsqV3WRcfWCpZYswlDZA6ntiKPP9QPK39UWNvvKTRTg9Y
         OtDBCmkuu1LvmKaMlXPxyTWPoopsnzdv7RcJ1gcQ1NqYSp5kb70XZgI+Bpb1MafDkBSL
         t3CxAKksV7WxBOUOTVNIdcQyXwHgx7lndM4d+Rr8r2VCvKuoaa6e0L0WMQGZUIbMAwhq
         VLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775235692; x=1775840492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2WCjm4bmftNP02ylQSc1VUrhgMuL1A1n9jIOcKmvYA=;
        b=nm1AV9Y+Srq2VUq3KAv/0PF/fn6ZIVhtoWfhrUGjHUgn6wDy/mMuBUiiN+JsMO9vhX
         yRaU49nLDphtHnBDpNcO7oCH2/2TZpM5oqiXPMcFRdbjt82ekJjOj3v4UjUM9GzcU7Sw
         WHRceM0S+WxvX14AVuCI+usCVCqOp3BcYo+rXIIZQzABzLayzgXC6jtQa4qwHUhjwyNU
         ECEloqBMHgZwzMoJjpDOeoOnZUculjv66MCTRogRy6R9ezG2SRcnX3KGXoWO5sym+Dm0
         mSIST9L108FKwMKDPekxlgP0OfATO6KYkKYbiZYwtvSCsR9iSA8n4MYJM9MPIYMA34PD
         DLkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJD76p0TmCM0/VeB8/02QEq6CJGhOcz9jJxfdc3zgI0P+rYLo2pOGuXglVvY+ba5eIGvHfQkGtjY5Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Kl1fzU8RPaeujvtaamY7XjmOr4dpIcUD2v8xOwLfyRuC/lnj
	KFYzYy26YQ0YBzCzsmIBybMuYKH9uL4UipDvG3YOFQPT86O/IlSjRHiVNjCFO7MiQH56soXWu9D
	MiOsUje9GNIj7LKPqpB8UPwVMLqeL60nRrh/h31IXtAzYdCeJ5UKzk0AHVHkqCuvL
X-Gm-Gg: AeBDieup6PoIbFfcYAe5whldjhXdlHi7kPDHX+7r09ardLy42z2t/eyGEQKOQx+wjPV
	ErkbDsPBiFeNrnFKFjfrdkMWs1GrDd16XermY1j4w/5YAvGnyIbwsN5mH/BRCL61wH9ctM7Aq1w
	s2qtU4z1TnGgvfylklGpbIhiVvAYAjgZ1GorRNgWLJ3N8RIDYNEsP0+LsJPxAFH97dGi9l4YTyU
	B0Rxz5Ji2IYXtEZN3PG1VLk0d56ZIJARWi27aGQEUnU+/wVpv/1OZuDAI7c5S6KIUlwhj0fRY8J
	q05ud5lIjF9dn0Uq7oYTTA4Bt2UwHjc4DvjqRAjLPTBYSB8Ptyn0MxXfsLfJPYWpRzLmVWm9Yjt
	Aa7+HVRRasAZEESA2DmEQNv6C4u9OPt05n4dwnGL1M5BDv+YNo14=
X-Received: by 2002:a17:902:f642:b0:2b2:49a7:a5c4 with SMTP id d9443c01a7336-2b2818b00ccmr32553465ad.27.1775235691245;
        Fri, 03 Apr 2026 10:01:31 -0700 (PDT)
X-Received: by 2002:a17:902:f642:b0:2b2:49a7:a5c4 with SMTP id d9443c01a7336-2b2818b00ccmr32553045ad.27.1775235690603;
        Fri, 03 Apr 2026 10:01:30 -0700 (PDT)
Received: from [192.168.29.116] ([49.37.147.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd4dsm61858985ad.76.2026.04.03.10.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 10:01:30 -0700 (PDT)
Message-ID: <e4bf900f-687e-4934-8ddf-9dc0eca96c02@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 22:31:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Fix ICE reg size
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
 <20260402-ice_dt_reg_fix-v1-1-74e4c2129238@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260402-ice_dt_reg_fix-v1-1-74e4c2129238@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qQ7o-cp1HnBOjZd4o6ksRJvf9Rv5KWuy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE1MiBTYWx0ZWRfX2Ra+epKbTXFT
 EooqgOfMpbhBLMI4O4VQR0nkNnOriIz5YYO24pZZxvvDwcjNZLUUUEeA+UNmxEqD2SDuz1yN//d
 Z48UpNCi5WheCR7XPSekhagosuA4V41OC08N1KJyRz1vMIHhhML3EF1VE17eSvvoc2/KmDjfX4F
 MPySFNZseNT3vwzJ3ygbNKlx1IvEJ/RCjP9lkJlDQqmXjNZybuDtXgmNMEDB9yMDTsp9SMLnkiT
 XUBrezLzI1G4rIQaHd8Haf27uD0XB2GBFOEHOJqV4AqfPCBna+JJk1D7RTIk6V7zZS2Je8EFgus
 5idWTZiL1cp0cuykT90v/7d8SMDxmoxfbo/9cIxum6C/BBydq8prighk0Y/4ncnjn/cwZltYlPs
 wGL8pp4T+EbbUCqWhqYUdpAQ313unJw7sF8QZ3uPZ0vBKtu/P9BriCfC7Ru84Ae6hiMyIb2CDEr
 iv+O2Y9xQVi9fHs1o8A==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69cff26c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=pj5RAjPJ5lVSI15MjsbsBQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JbxdblzTRLZAtYUtz1gA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: qQ7o-cp1HnBOjZd4o6ksRJvf9Rv5KWuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030152



On 4/2/2026 12:05 AM, Kuldeep Singh wrote:
> The ICE register region on Kodiak is currently defined as 0x8000 bytes.
> According to the hardware specification, the correct register size is
> 0x18000.
> 
> Update the ICE node reg property to match the hardware.
> 
> Fixes: dfd5ee7b34bb ("arm64: dts: qcom: sc7280: Add inline crypto engine")
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 6079e67ea829..ed8361f79e28 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -2578,7 +2578,7 @@ ufs_mem_phy: phy@1d87000 {
>  		ice: crypto@1d88000 {
>  			compatible = "qcom,sc7280-inline-crypto-engine",
>  				     "qcom,inline-crypto-engine";
> -			reg = <0 0x01d88000 0 0x8000>;
> +			reg = <0 0x01d88000 0 0x18000>;
>  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>  		};
>  
> 

Good catch, looks good to me.

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal
