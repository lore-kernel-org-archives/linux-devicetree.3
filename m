Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AED1391E4E
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 05:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786338833; cv=none; b=BYpLjLdQjDYIR0ZP0mA/5VMndcdnrG9xUsYAk3FJq8ezYqnc3KwnElNBkgNXBsjFC8uLG4i50EJZEkYF9S5gsMx1PIWL/dy8gM1ckjATjyI881H0Jcw9jNdpZ2HZm2A42l9xRlGFAS7Pwe+wApwfCR+9HyXPOd+ocGh4wMruJNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786338833; c=relaxed/simple;
	bh=Dx6UaSHnOunanrUivCrjVVtd3qyMno/Z9c1Pi8YMcJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tTuBPMLXDBfk5KapYNTiTj91hHulx9BXv1VCiFVir7JZKaPmcCfNiH/u/awC7PNq58Y8IhN4gAEp1OBknkuUN3E+KZ+eFXqwu2R8IoD9AgMmSJAih60XBHFdbYO+yToRG4x+l5QIKGbdM4WL4h0BEB3DGgGTieFadtIWNdcLzW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bp+eLJTa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OV2tP1o0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bp+eLJTa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OV2tP1o0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679LRHk43088576
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 05:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MqIw7ppnvK04Rs6EJe0uphA/lo1Zjj+eRRIVTK0+R4=; b=Bp+eLJTabbj1QwLI
	VM0KsiXN169AteAyDH3H6huMAuERlNgLqrM4k0Bxu+/lUzWC/O3FaIVuULkERLnB
	Ce8nNnXggZakQu4kr0qTVmE7f0R46pIcsVyVrJvQvHjUzO6Bdw4KRTI5MFbm8EdL
	fejZ363ChQ8yBVRpWd6TirMsAjaEZRH20T2J6VvT+LR6VSPYG0XTtdyEGTpNaafR
	btnqheTDLlW+9TPdIn8rNFF4UXOpdymhlPwk8Hq1FttA18ekatYwQERI9nOpcac7
	4wYMuBDzcNILI7XCB4DKIQxSmaPjj6Wd/7r1l3Cd+goh+gF3hqHoLx6imryE21F1
	Ohgw8g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwmgvcpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 05:13:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cd01a14e81so24147645ad.1
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 22:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786338831; x=1786943631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9MqIw7ppnvK04Rs6EJe0uphA/lo1Zjj+eRRIVTK0+R4=;
        b=OV2tP1o018Ix+VL+F35Njo6ejojTTtWenJWwV27guTes0LAgRZNtElQf4I1gVyYT9u
         wytf9zi3tM6lUoFQHUugZeWJWLGY2zAA2ZdZSWUP66XunxNpu0+q0dISHwqi3QICUBtL
         m+Kd7QlapVnb3u04J0eYP5KyH0mvS8FDAxMkS9gHaEE1XcYRb2MtK6EAU26aG2poAIR/
         5waJdHdDQ7tR7BVfVWxf03YRPKSLl6PpwiDeJTEYVSfuyKO3iiBM3aALmnYerFxnuQC2
         x7FJ8cEPhPWCQhrFyg3/uCHagibyMncAkustHszF5NdgG2wkKKlZZmyMDXfaqHYzl7tf
         GWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786338831; x=1786943631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9MqIw7ppnvK04Rs6EJe0uphA/lo1Zjj+eRRIVTK0+R4=;
        b=rFsUn2KBPy5ewi9fO76A4BiYPrxV3hfnJe0+TvfK3WHkpDy91J1JB7dvIiifZhULvS
         pYy6NjucQSSvQWb/T/yA5qWnwB43m9jNlNwsF2/5ZI4/0h2+Ty4fvFjpgKnSj0CKarWZ
         uCqVJ7JuxcczZwRAX/Bzu71VmG4abmShow+6dPpNLzgNiaLeBrSMERN1lfaP2DJtN9e4
         jIKbI2CEyhyNwPPWA+8TNP5EEVJ1Gy1xBioCGfVIFmFZoM2Fsfst/VNnCBDgj26Hcq0O
         mITB/Qaq3gPjhOx/XxNOCuBNiT4JzG0qipTwAv3jW6i8+EJnlVWE7GsvkO3SfbPiuuM2
         jjmw==
X-Forwarded-Encrypted: i=1; AHgh+RrdyNmcd3RnYussJ6RFggL332cMVA8X0HzWrMPvcsTKG1T79A1CnifvNUZW/iXvJqffyoCSN4mMW1bW@vger.kernel.org
X-Gm-Message-State: AOJu0YyhYTkKpcIQmLerVJKRQR3h49sGXteISW/W4y3b2ZNLQzMoa/Qu
	7ulBvGg5Yiq4cBuwoP91WSptxfYyoSrn3LBwtrC/Kegs26BmcKZ6SDXnMiPj9xN9x/OEN5LceXn
	Km+2jcDMqAENeJKseW4MDXl1BS93gscZznRvx63KtZP6zq9WZvMs2XusjLVNZUU6w
X-Gm-Gg: AR+sD13Rcas2mIe1OYYnG74QLjuAJSRmvc5pPnwTsQUANQhIbLsJxv7QNxVXpFQkg2O
	g2ZcDOOw16TvmjaALu+NUci/St5+TUCQuVFz32wAt/xw9LLnCcv9ijDlHenWOkwkQiH3LatrcBB
	rm3OoaOaToM+LPTRAKgVY/0PwolqSJZ3Comy5B6UWO6yNfmJSi23l9jPAvqmyvmGz5YRzULzSCQ
	IxGYGJuJTnphTlISpekmccoJLu0QEoxoqh4l/faRRetPdirC3NkhDDmFA6LPJM3VPqIJTNW1rSv
	02HvuD3BRExFIHKY9C0WumRgADBO8BVlwbScZFQ6SNk56fkVeOTgXpyGQ1OR0Ephuas6catZ7/D
	42XIirs/HmMjfjKfneEMtJRNkL4ylXjI=
X-Received: by 2002:a17:903:32c9:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d0ca712d9cmr429359295ad.5.1786338830709;
        Sun, 09 Aug 2026 22:13:50 -0700 (PDT)
X-Received: by 2002:a17:903:32c9:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d0ca712d9cmr429358885ad.5.1786338830320;
        Sun, 09 Aug 2026 22:13:50 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccae6f8sm28475515ad.1.2026.08.09.22.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 22:13:49 -0700 (PDT)
Message-ID: <85e9f275-a16e-4dea-b158-3d6005a7366c@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 10:43:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] arm64: dts: qcom: Add device tree for Nord
 Embedded variant
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260806081554.448531-1-shengchao.guo@oss.qualcomm.com>
 <20260806081554.448531-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260806081554.448531-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA0MSBTYWx0ZWRfXxXo65aMBxm1z
 bDgeQp64zyWJJi+pnId48FDj08hsOt5XC3BqHhVpXp3JuPHObkqa33Ef79R72uIGk3luSFluYw+
 Ov7qDFHeG8UnN3TNj3lFwB5Bbo4gEDg=
X-Authority-Analysis: v=2.4 cv=HodG3UTS c=1 sm=1 tr=0 ts=6a795e0f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ssq3RGoAjDDZexTDLkwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 3RSAjwRHmrl1a54DK6zLbKMobUj_xhbU
X-Proofpoint-GUID: 3RSAjwRHmrl1a54DK6zLbKMobUj_xhbU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA0MSBTYWx0ZWRfX4xGXN0xY0vaY
 8j0Oky6Mz8hBttwtNevSis/OBuhp4E4k1BjyV3kPCalMnM0aKC4IR5lOS6D8nlbHsme1bWke8jP
 7rE6dPYNSCXCXgGxdxjhkMygPv4dliaHWkXygejjF1LebTxb54w17GkmNZbBti2lpUrQlSpzwME
 C1n4j//1fmpnZ3tLETgyRENZgNgxNfzwGip1QumS6sLMEQIGVACAkNO8mnL1TFdj/gF1cg2kb3K
 9zFjSTb0nAG3kuzW3U67i5Eb/i2LAs0H5o4F8alP5oDB50qrPTi5ezzlHYalVD16Ajlhjl/LTeo
 lG1YCWU/wMQHlNNeS3feCcqLHigADmRSvhI2aluplVHhx7ymPMKcYBZsBpfXeD0vtS/pEptcr2G
 vdvqfPcNM6sVqFGxdXXpeX0HgEMhSJ5pVoi7li+RspTrV4L0Gp89C3KvhejKRz59cnuh4oicKtf
 yczeTmfsWcgbAAvJZQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100041

> +	ice: crypto@1d48000 {
> +		compatible = "qcom,nord-inline-crypto-engine",
> +			     "qcom,inline-crypto-engine";
> +		reg = <0x0 0x01d48000 0x0 0x10000>;

The size as per hardware guide is 0x18000.
I've fixed kodiak etc. target reg size recently.

https://lore.kernel.org/linux-arm-msm/20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com/

> +		clocks = <&negcc NE_GCC_UFS_PHY_ICE_CORE_CLK>,
> +			 <&negcc NE_GCC_UFS_PHY_AHB_CLK>;
> +		clock-names = "core",
> +			      "iface";
> +		power-domains = <&negcc NE_GCC_UFS_PHY_GDSC>;
> +	};
> +
-- 
Regards
Kuldeep

