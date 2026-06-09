Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE81282F1C
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780993882; cv=none; b=qGrxA4Hho9jyNgICTUvbdbCl78Eu94RV6BUL/DK2VpOWn8tEzqSXUOWKDRiHRkMK8JsFtLG85voVdW6gsnmzjIy7kYr17/ckSNy0Q4s3YCTKY4wcCsNguoTRM+6Nd0osWFcOrW2qeh2kgS3kJ9HPXDTed0qMXN6Meq6z/F7+wRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780993882; c=relaxed/simple;
	bh=FupT71IspFghkCOY+MaMa8PhJF5X4yNy+GJaJOku1+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JAHjDkl4jl7od7Goq2Tz5M6nvm+TC+8okKGr5RmjriW1G0Dq9X03vc5lcIMaSRoo7EdwdX8SEC+DX5LlDzr4uW0JK0H6ruLCABHQ36myRDDSnOP/RZg9Lgh/3C2ScEsnBb1VYkp4sU7CE8inYcpi6MmQ3q2hLXZKa9Axkgd16k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCovegja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzowZdkT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCovegja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzowZdkT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rgT01568441
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 08:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44EplKRTyllVKZ0I5jH9SM9IevfCtPlHwPoIMOwW2b0=; b=ZCovegjahJgux1s7
	6smcIup0YtkKDW5d7+zwsKLMQo2fWbdcS+NOyDIrnjDE+SaUMNe5Q36ZgYHl8HO2
	uhmqCXKEkvy5o5T4XsIyTZ8l5fzoLCXAjGHq2xsTbXXC2ZiPBXPZlxT1YrC00TVb
	wxPecq24X7ktHaCW0Nbhlj8taeppcqMfY1X8lbW81AdmIKsYYylZ3LYI9qbzknbs
	i15WM2XXHLOEV0xJjAf1+t+laZKyeRNUY0Ty3CEX3LOhfh9MsPzgZzdpnzqyGNCt
	o4j2UNknZoaATzN59tO+L2cSr9hEHZXBDd8U7M1nWuuA1ibq72eMet3qBhaNsXv0
	cIo0Zg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx45ya1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:31:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf11699875so54378155ad.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780993880; x=1781598680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44EplKRTyllVKZ0I5jH9SM9IevfCtPlHwPoIMOwW2b0=;
        b=DzowZdkTkm8UqIJkDVsuFUP8nr6HSPhaBF6x3GrZYlnH1CxjnO2rI6IX5DCZJxCDs8
         ozrdC+j0xU39Hx9OJsJG8WZxoQ/v1Q2EkPhGMy9GLz9bQ+El3qT0e8K0JxjfDdDSkCOP
         plJ8rIs6cqO+sZmoR7Y7eokNaiz3gXxHBUg1mY7PMJvb1ZIiVEZibtSKMZAe8UWzRWBh
         Sz/Hl/gS0rVv/xo7dpbfjeqhEbnfrfciwvRFt7z9U9eCmmmforoeuX8p+Fw3Q820NXzG
         WGqr6C+30oIk8iY4mlEpNp3WCviq4FLUkp/BmlgdpkYAkPIJuIaHw9zG2+UqvM5GT+nG
         J4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780993880; x=1781598680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44EplKRTyllVKZ0I5jH9SM9IevfCtPlHwPoIMOwW2b0=;
        b=GWx4cVISYtGMuomi9jIPhNN2yPTj2dlGDFhNugVcOVhMdffXnZjykhfAYCuf5Of0hw
         ZPYvlQ0bdDEoXPaPdXFmCJ2lLoPHn3LP0cyP92Gz1VzT9j8cz6rsdmSc9yyT9xwKUoYt
         rtfa92GLp9jkguszoFPYFYYH3No2m3UBC8fCmbsw/Y2msOeZwcdIM14otOP9vZocz+bl
         yj0FgJbzb7iHQnN78+9AD82Qq9YYvRT1BsqkxCY9fenyTX7LEyVl2LWa/3wbOm6fdtbb
         +IwlOZAzccbc1UeNGxlEhAFCdQy7UC35OhO3Oarem+Uq1aROfth0PwvYDcKJviTBGr9i
         dclQ==
X-Forwarded-Encrypted: i=1; AFNElJ9q4xzrtdvANkvm7qH6KpFOM+gxC/F/xaC3S1irX+d5kt7lTRa54J7zIfIka78m7jk8yURzWM1yGC3b@vger.kernel.org
X-Gm-Message-State: AOJu0Yytbfy1XQc3M55waX1UabCTw1bfcYhRIz8Lhy+x3ygAl0x1G0EZ
	dE+4WNnRAfjOz0S7837SQpqLDH5Ug4nu9BBA0OO37Rp22TYV+I9247s88OoWJIFyLSnvMQux9Ox
	iGDTil50Gf37Ue+m/sFEWINaHltDA+ettPRTHzFZoZNaIN5glchuzQB0Q4nvRxF2i
X-Gm-Gg: Acq92OHNSNkJOJU9Zln/Xnu5wHJb/xv8VmFyMxzKqLGUns+fHff1YwUies15Sf0Hss4
	zy2SyR52zcn9gRS5W77xRPnLx0y0/4Uo9GPFMXJd5EOHzqL/zy9g/dQn0Tgr9CQEdZVnN5y4c85
	FJgFml8Z86WCcSAYf57GtqKleBETok/rSx7fs7b+iiczSC/I7LBFu5AGQN+Ogn3bnVxgK8jUx6u
	HikryXmTrELMapyvIq9pSPFsM/3n0QNQjI+XjosTvP2uRlypr69SLbcOPyAMVPsePzmtaSdBTSa
	Tn+Cj9AXaXJxM+tTzm5FjGJnON6r1XObnSZGZQwr5fCGMsWEPfH6XNfXnfly5PozChNJ7FqQCpn
	995xB9a8ZbBM3tf0h2qj8DaTeUiyavjL9uq05WhAKKSFvp+ELr+ro3j1xrBEjqcyXnmXiglcsub
	aEkNRqEtpNQj41zQzSxbMgfQ==
X-Received: by 2002:a17:902:cf0b:b0:2bf:367b:f46f with SMTP id d9443c01a7336-2c1ec932816mr163730435ad.30.1780993880025;
        Tue, 09 Jun 2026 01:31:20 -0700 (PDT)
X-Received: by 2002:a17:902:cf0b:b0:2bf:367b:f46f with SMTP id d9443c01a7336-2c1ec932816mr163729965ad.30.1780993879458;
        Tue, 09 Jun 2026 01:31:19 -0700 (PDT)
Received: from [10.133.33.148] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa00b3sm196112495ad.32.2026.06.09.01.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:31:19 -0700 (PDT)
Message-ID: <daa47ea3-1a80-4f95-adf4-f41eaf2bb1ab@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:31:13 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos-evk: fix sdhc_2 vqmmc-supply for
 UHS-I mode
To: monish.chunara@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org, nitin.rawat@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, komal.bajaj@oss.qualcomm.com,
        jsodhapa@qti.qualcomm.com
References: <20260609073509.2453273-1-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260609073509.2453273-1-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a27cf58 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bcY_RnAor8WR6QYpvxoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: LFa9d8r2n5A2LBnqeDFTPaXvRY_k2Awt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3OCBTYWx0ZWRfXzCIKLrVBwdsj
 1XcoL8LDACS6k7nkhNWksv/dUMWIjqECQgsJuUZ8nTiFMg5PPB5i79Gw1WN12Tl4oHuJC+kx29I
 /oOl387sO/vDY/ioRY66Ar881djD3z88fSxSy0aJzfaghzSW2/+9LPCdFIg1XKJ1nYtVwZ9qk7s
 JzI1fti+VswtFkfWAt8zCc8/2H+mwTn1pCPa+Gt4LW+Qa7TMKx15RVaTvbJGGMHjgyZfgUtRxqt
 DjSz2wMKfQBrPxfa1NfmwPUUTX5p5jlA4Y7UFNwJkXCnefDO/GSrZkCdw/OVGw/QqF/Xf+plVd9
 wM7C+S4xqWoTV1nzdlnr9BzOUkvC7+19q403/fmz5VT5UVUYQY+HTqPup6FaC6VAory9sVIESMj
 6qznhEDZUPHgJB9Nic02lfFJAhTswA==
X-Proofpoint-GUID: LFa9d8r2n5A2LBnqeDFTPaXvRY_k2Awt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2606090078



On 6/9/2026 3:35 PM, monish.chunara@oss.qualcomm.com wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> SD card is detected as SDHS instead of UHS-I because sdhc_2 was
> configured with vreg_s4a as vqmmc-supply, which cannot switch
> between 1.8V and 3.3V.
> 
> Switch vqmmc-supply to vreg_l2a and update its voltage range to
> 1800000-2960000 uV to enable proper UHS-I signaling.
> 

Please add Fixes tag for a fix patch.

> Signed-off-by: Jaypal Sodhaparmar <jsodhapa@qti.qualcomm.com>

why is there a signed-off-by tag? Does it belong to the original 
author's tag? If yes, why you are the author of the posted patch.

Thanks,
Jie

> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 4 ++--
>   arch/arm64/boot/dts/qcom/talos-evk.dts      | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> index 294354c034c3..f70823b31391 100644
> --- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> @@ -195,8 +195,8 @@ vreg_l1a: ldo1 {
>   
>   		vreg_l2a: ldo2 {
>   			regulator-name = "vreg_l2a";
> -			regulator-min-microvolt = <1650000>;
> -			regulator-max-microvolt = <3100000>;
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2960000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>   			regulator-allow-set-load;
>   			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
> index b7f514fbc7b2..9ed48765ae6e 100644
> --- a/arch/arm64/boot/dts/qcom/talos-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
> @@ -189,7 +189,7 @@ &sdhc_2 {
>   	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
>   
>   	vmmc-supply = <&vreg_l10a>;
> -	vqmmc-supply = <&vreg_s4a>;
> +	vqmmc-supply = <&vreg_l2a>;
>   
>   	status = "okay";
>   };

