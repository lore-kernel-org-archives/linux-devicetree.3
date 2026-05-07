Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9943B30B502
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 06:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135456; cv=none; b=fCaXyouPoBT0lBtS0qenOlyzhJFyE5J/Gf7lXzLqlCHpDtcw8FmxOfdMWv4kBvGhUhirTF5F4XpVU9P4AWHyx6yH/zqPWZC69eb9VrIKS0nZRx5+W4hXgYPt7b2ielqCeqSTw3YK8o1G+H/tOxSnUB0mofUmeqUiw8L6YAKk0M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135456; c=relaxed/simple;
	bh=CRS1X9h2eIrm7CgoKUmybU1wGmuTngBtmE4RHyo4itY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ixX3gs5oR+EJG5uJPI4bNbQGIebOj6Mkvtpli9iNw6jbPeEkwraA3TCygRvkg3XyL4IRmQb1OmBqN1ZyR4CfGlQe/+MTZ9gOsQ4Gzxb/FnndnB4hiw6oOVB+uoeI7A0OopY6RU+V8n7kXYU9Y+NGPEnVDKjXYCdXduGf73uzT+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C9sKEuaw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VRUrxCps; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9sKEuaw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VRUrxCps"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6476B8863036649
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 06:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qo8D8dOib3c388wYIEL6vhCGom9UevQVF3qyxOh0//Q=; b=C9sKEuawLNtmUgoh
	l6mIjS2EOA8Jcgvj47a141pPLBBStUN8SnObNke5Bomo1idlPpRVmGLvZmRTLs6I
	AYQQ1TDLzqjCoFyNfAxdNCpkNN3rkOy/ngCozxCGV+WqFp2v1mdRfCm/KoaQjb88
	COHw2H8TItJJWm9AmriZcHPGkdNqEpvojeV+D7b1YO3igs6wRwYzREHjVaznVKgP
	Q/t2VMOBuVub7URI9lVCYvYZgUiAFQfkdFlEHYS6UBh2BzmwrPPpegsp32W1DtzL
	Qk7VEgA50nG0ovbmayYf77e6gZ2F5FtJAf/fLEMu64BYhdHmuhutzMaVST77AEvw
	obNw/w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e05bf3hdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:30:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82346bdb00so596866a12.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 23:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778135452; x=1778740252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qo8D8dOib3c388wYIEL6vhCGom9UevQVF3qyxOh0//Q=;
        b=VRUrxCpsAuaAl8CLk/sKwVLtBmZARkP/S2S7KIYMPrzZIhXiYtekFqTpGl37OUDjKZ
         n/A8uhucqoU0dVPhu4+rZruzf0Gd13txDHzhxZVMc0Fg+LxmiFiz3dCNC/2O2wtBq8NE
         PKVP6X7HJaxWgGnZxA4qB5Xb9jupFyCbHCA1YLseOU8did0l1IB6fJJtYrWuGBlhDsHq
         e0D1TDIjtGWVn+gJBohBUfih6LIVYVMHuRDiwRF21n0wj1G1bJYuJNC5hsDERqJc3KJL
         IffhHhE00rTtStSsfRX4aNrAEh7/FBEROxoHO64dCGwlCg9MuLNwB1cz0tkfpZQsAszX
         IzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778135452; x=1778740252;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qo8D8dOib3c388wYIEL6vhCGom9UevQVF3qyxOh0//Q=;
        b=XM8W3pjyXPAI4cH39vw0ujMnxKJRwxnXQR7kIXfWAcPOgkwjxRQ9FXrjxqgRXQzvcT
         YmTyRM00jJB03jZwFqGK5o6mhkDLHnd/L/HPBGO2DBHgsV+YjM3o+4WEpE7Mz1ZQgLIS
         7jCvdgP1Wxlm5EL+BlCpKRSPWu4iQknt6sS2ICrpIwVs13Q6bf/s0fv6QSKcCjQtU5iY
         djMwU0PwCKLA9wWm3grO7U4WibZSpufWtcdxsAaYwOLh1M3NUDKJm6JWVBpQouHXjsrJ
         1jSQhlzsBy+xz7CYt1E8+yeqMN5vXWzSffqq0GW9lIVVpZu0Ld6jX3S7LXvT8jADY/NO
         eMsg==
X-Forwarded-Encrypted: i=1; AFNElJ+Su1PMrX174x87skZvI1JNkHUW3cWovNvHPBLIUnlLJtpfVhelRa4DHjf8tw7DSQOD9I5so1pUbgfl@vger.kernel.org
X-Gm-Message-State: AOJu0YzR1ztNPWbuZHMciNE3bif5czPv9XJ1vV2mpU8ASa0ZfO5US9fz
	75xoZv1jBWo5ISpqj76utmxFZDc6Xi8VzzdkaBlXO8Bsq4W6wp04CFDc4KSFPz21V1oQKDbjq27
	XTUgkpYKXOl19y/zcOq5FCNYoIvYxqbsvkBOtJWoW18XYbe/QkysNa5Z4dIOL3RQa
X-Gm-Gg: AeBDievyWT82jcWDPty3zsHPaPXnRF8VRaCTFrdGgs2Nt7gCno0j/YLzCcPdKa7ugAO
	4MTzRg3N2cSZSLjlb/aOuzR47CIMT7NQBBHfw8JKw7YfQiPGOM+/BfRsZzr+ncceDl14Q3Vq3yn
	zZvXSYGdZnRsjrZHh/x+F1TNA/lcasK9VtEQaXY6l++T3a6xl2kXv3QT38W3kLXo1mJEjti0vHL
	mx8A0CiGcoMAKVmEFixZbzz6lnueqa/e2JETX8D+Y/+ZsBomC4o3jiz9FrbcUJjDIG+vbKGfWC1
	a9PYnD8YHIdXmW7KCrAELbIT4rg20Yqg1+nFyItJ7VTrZ6J4OZ7fmvJE6R8iK6cSxRgPBzyochF
	kovMiLH4N1fXY6jT3P9+rxK5hg9Or5DQiXkTTNIo5t4ZQxNSKOTy1Dkw7lC+Kis9Fs4hrmPgKMq
	UkvE1T0AqMmuncEQ9OpwpbRv9oCV4=
X-Received: by 2002:a05:6a20:244d:b0:39b:e789:7d0c with SMTP id adf61e73a8af0-3aa5ac1ae40mr7562875637.48.1778135452513;
        Wed, 06 May 2026 23:30:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:244d:b0:39b:e789:7d0c with SMTP id adf61e73a8af0-3aa5ac1ae40mr7562838637.48.1778135452058;
        Wed, 06 May 2026 23:30:52 -0700 (PDT)
Received: from [10.133.33.12] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b352d4sm1052719a12.19.2026.05.06.23.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 23:30:51 -0700 (PDT)
Message-ID: <badc2def-7ac4-4af8-9402-9f19fd621fa0@oss.qualcomm.com>
Date: Thu, 7 May 2026 14:30:47 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: wire UFS to ice instance
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manish Pandey <quic_mapa@quicinc.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
In-Reply-To: <20260429-sm8750_ice_dt_fix-v1-1-2540dc337082@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MiBTYWx0ZWRfX24P4CEOFlM2K
 7Jqrih4SU07SaUZ2kOkoeBuvMied6mq6UdoO+IlLrjvLG9g8QQew98Jk1oWp/AV+3Ma4TX/fE23
 zEVqnGy8koXWgTrB71p5F1+HdXxOYgz89/aGWEImHxZb6VptXSLfJ4LUvIviduZrd/GX6w19U7I
 SymPeE84yMOCEIEY1epDyyTj3XCQpqF8Ocpu2O3l1wprcyHrfnOza9W/EwfI1VRaQslUi7ZI2jC
 bD1PCl1VFUFN//SlrSf0Np7Kp255+6YE+zxCkd49VrNPKQtShqFh58uBI3CNhcbDC8e0wsGQLZq
 MM9lbb4IYSwRmle/w/iuUrA8PJROIqEBhFy5Xr0uEyY4GhxHSJlC62QKidm8xcEUaD7dlUkJZcg
 AKDfYFmadfqb9TYU8hRSicoH935W0PxxHbzKFgBMgyjvkalEFp85SM3pDqf14e0CfcSfQTEL0b+
 2cChfqQN1tazI3ZclVQ==
X-Authority-Analysis: v=2.4 cv=PqmjqQM3 c=1 sm=1 tr=0 ts=69fc319e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=D95tBGhMd8aj5o4-fEAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: iX-Hvm5lLaeJMBJ8i-iBkQfq0f9JFIPS
X-Proofpoint-ORIG-GUID: iX-Hvm5lLaeJMBJ8i-iBkQfq0f9JFIPS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070062


On 4/29/2026 5:35 PM, Kuldeep Singh wrote:
> The Inline Crypto Engine (ICE) exists as a standalone DT node, but the
> UFS node lacks the required qcom,ice phandle reference.
>
> Add the qcom,ice property to explicitly associate the UFS controller
> with its ICE instance.
>
> Fixes: d288abc3a70e ("arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 SoC")
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
> Validations:
> * Driver probe
> * FBE with standard keys.
> ---
>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 18fb52c14acd..4ea7f6b7e20d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -5396,6 +5396,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   			phy-names = "ufsphy";
>   
>   			#reset-cells = <1>;
> +			qcom,ice = <&ice>;
>   
>   			status = "disabled";
>   
>
> ---
> base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
> change-id: 20260428-sm8750_ice_dt_fix-d32c838c0c3b
>
> Best regards,
> --
> Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> # on sm8750-mtp

Already validated the standard key and wrappred key.

Regards,
Wenjia

