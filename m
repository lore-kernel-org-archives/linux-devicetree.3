Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647E3446852
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 14:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456847; cv=none; b=LLMayA3cv0x2aR3EFa2AdAZvIglTOAGt60Aw4ujvB32kKXf/0k616Ygt/rHlT0epp2XWVnv0yUKeQc9bwnquv+nm1dK4cm33ONAKHO3cIojKVDxenfOcxqkVIEk44B1UqyWCOm0BZbGCADhjqM6YKJcr3GZ/RwPfkn7czyqxzFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456847; c=relaxed/simple;
	bh=la/+tx1dOHPD+VlPydRWMql5eUCXdnq1cqeMdb+SB8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oARtWJWYZonLSVQbM4HOaR0KUbzt44l97gk0kAzmN+Zy9Y/tGnI5pfd+z9gclG/fOrU2CnTy3MM7TAI09rBtTry1j5xES5LaaH+vRQeeDriyE1FsNeoa4zfmEGg491HG8Wxvf0Ie04k3cGhkpn4aGlkc59mpXswg0CWPomWmwVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3EQmU45; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIGfoCS9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3EQmU45";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIGfoCS9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDX6aZ767031
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 14:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z/JY9EeiY3dPrz0SMbawiRqZB3HNFptF3RlR0rC1uww=; b=B3EQmU45sIm6Cklb
	NywaXCc9/I4jZ4FBkXVv0L58XmTPCUQWshMvoanxIcyKyUTa+djc0cz0EbIe5iEn
	V7906s2wNkXaAACleuLSJ5V1tgJwyUF+AZOBHK4KZzpKb7UtdGOvKEQGuZxAa35e
	8f9iGnetnW6Bp2oxk5TgZIbe9+Ie3RyPI/Gm208WQevUEwhsLpPrR1EhhrpnOoLb
	biCOjnr5cdIQNHXxGcyc0PEo4UoCuxbaPMyRz0g+gtyTPjyJlfil1v2DGYwojH5E
	Zuol57Cb1j8jaN2aEZT6Ge4UmyNl/5jac/5ylM/5Ftg3j4aqoklTjwBhmfRp0fJm
	l64I6w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc0u4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 14:00:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc73f47bdcso59123375ad.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 07:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786456843; x=1787061643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z/JY9EeiY3dPrz0SMbawiRqZB3HNFptF3RlR0rC1uww=;
        b=gIGfoCS9kVA3zsyUOjWW4+kTxNMEUU3k+wGovSU41J8elYYX/rI2JVPU67MRmIq+XB
         BDWLKSDa6MOHDiYWOG7n5pc3Lg1bt+o7iUTEotXiZ7Kjl0G+Gmjzu4AjO0dOBkTs3qN4
         FQZzSj0pFIllOiF1frAVGZG1+WURnsVH9os2faIsTRZtyRsdhyKNbnWBIZ2pZMUJIfoo
         EtasRU31lnBuIGivuGejT9HFgRFv1ZlQaj9N0mGvE/MJWL1GxVt7zAw66P9UgCdBiQGh
         87F5DyxiDk6tAVpxl26pJXJhGki2PK3yC/jF9//S8NH4BWBy1WJlnxEA254ojkgdjlVE
         cp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786456843; x=1787061643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/JY9EeiY3dPrz0SMbawiRqZB3HNFptF3RlR0rC1uww=;
        b=CtUuUDfJ9xo3zsQ+drCeUS6rhcVU1BZtJz2kcLh7KEBUBeT3qCut3tyHiEAN1FNBb3
         pCptTbXiHdtB5cW7uk+3v/F3FQFlcaSsmmEyk70P2yMPr3MwJ9QDiqte/yTzc9H/K1Ps
         +8MBT3jlnCpmy0mU9m3eFHdvCqkxN2F7v5zRyXWiBK763zoB/jOerp+btqNamN7/fI16
         6IgQcRi+VabxrJtEdgIONiYeHnOg1sH1x3KaBb2Dlf5AWtiNrMT105OjMmj/KYg144ru
         pOj0mWtlFgWo2k62iHc43b8ZUu+2uZCYanu57ACBomHHTWS5QzA78Bt3oqyNzz0XfPvn
         NI8A==
X-Forwarded-Encrypted: i=1; AHgh+RoEuppqRhPsbGGWHaXOWJH2ykSKIoERE/+wGKodpaZoQg7aX141rp4Z2NV2SH3cv/dtFNPHK38lmCBT@vger.kernel.org
X-Gm-Message-State: AOJu0YxObvUI5n3uiauuou9Eq4UqeRU7Iz4xBZ3tASvV7x76dq31CLKI
	uNNyy/A6H8NObTUiin93+r6T2665R//pz69vD7ivI44P5Uur5OVZ38gcC2kmUr8AKL9P6zdrlqT
	zieCn+2/JRi8y3RLJErjA+gaux//5iDTsfHM0Va5CQxx/o3pFaO/PTtiMa10hhFFh
X-Gm-Gg: AR+sD13+SMc1fNfbs5RDftlh5qtK3I4AkNISwJzDcLakcn9RM9D/wpxiKoR31ywNgEB
	Y19yaaf/RiJpEOVHc9cxYiJLoRXwqb0XSuVNj8QsCgx2NIysC0mEf4+cgc/eAlrku53KIPAYbHF
	hvRY+bdOZfh5uzurXKSCqp3QEzikShoEiC5QjuRdlml5+CGiRwvpvyJezUyneQ01bUN2j9N4XR5
	+/xxxrw88zZriOWXfd6dvYExWBtzqHciPMI6XfrNH3KhDtEqh05DteaOzvpdVvabFjKM0SDG+hL
	8nFklPGRdAAVIUM/NhH68P/P5yhhtW4fPt6nslfp+hGrVgMpgB/dtihGo3XobH5T3/9ooxVG1Fg
	hOMGLvUGfSyJUwvKeMTVcReTzU9SmD+ZTtmJNGg3hmyLu
X-Received: by 2002:a17:903:2308:b0:2c8:1f58:55dd with SMTP id d9443c01a7336-2d32bfc5a1amr8918705ad.9.1786456843086;
        Tue, 11 Aug 2026 07:00:43 -0700 (PDT)
X-Received: by 2002:a17:903:2308:b0:2c8:1f58:55dd with SMTP id d9443c01a7336-2d32bfc5a1amr8916675ad.9.1786456841948;
        Tue, 11 Aug 2026 07:00:41 -0700 (PDT)
Received: from [192.168.1.9] ([122.164.84.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f458casm8834495ad.33.2026.08.11.07.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 07:00:41 -0700 (PDT)
Message-ID: <076b0942-7e1a-4a6c-9293-04a7ff77abcb@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 19:30:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNiBTYWx0ZWRfX4UNQ4J69uypg
 x/p00ehQ63FO1sZkoJbkIGIh6AjZFPmn412n+S3NbA/AU/TKMNYoBmcRuE9UIgo7VzPn2lodgvZ
 WGxDJxV6VPexrWgR6TyqV8u7/9cRJQQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNiBTYWx0ZWRfX19Pin/+PTtkH
 p4r5x/34gYocF/aq98i0eAkemGURMYSKpT5JVzBnG0d+GeRG+QmHbNnobbRs0NwTfCN3SdgXqZt
 j90bdTYj5BuO9MZ0d6nsfq5dv/ktmI5PZeBXcy3Ei4xsRCXaqq0DaEx1BuQ8j/wOLvdPAZSX7iD
 qNeraUDCqG7FUNtyrOOIY9+k5gnjkiKtwqOAqFTLHJXYsspwr//qrllMqVVp+0nAwUUJLRq8Ypp
 zIQFixuSZCluhQvAbiZQPFz080UfpZ6DQq72g2/ewXDjMxaQiNuiSAtlwXOd6G4xatZvgjWCwrB
 nRjHq9Tjk9ysJKl0Zept2Z2SBi3TPMeTO7JvmUAD1dMQyh1ecx84SrhG7Novlo6Iq6yHzrje0Oh
 f/o56sk5zuLI2OtRFIIKRFfvr+Gpq0WjHjQJvLYtnXc7gHnqOZtF/i/mijTM0u4lpXrvvOLjxnH
 zbtM2t5/qslCXwldFbA==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7b2b0c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=0/lRlipvHLU+ZVN6ZkkSUA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2y_uGkg87WrGdd1x8YcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: fIPfgL0N2IQjSp80TbjDxOPWANnzEyBC
X-Proofpoint-GUID: fIPfgL0N2IQjSp80TbjDxOPWANnzEyBC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110116


On 8/11/2026 7:06 PM, Luo Jie wrote:
> The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
> TLMM pinctrl; without this the pins are left in their default state and
> the bus does not function on boards that enable it.

Should we move the TLMM definitions to the board DTS file rather than 
keeping it in the SoC DTSI?

>
> Add a mdio_pins pinctrl state for gpio36 (mdc) and gpio37 (mdio) with
> 8mA drive strength and pull-up, and reference it from the mdio1 node
> via pinctrl-0/pinctrl-names.
>
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq5018.dtsi | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 4fc627b47fe7..a8a89a9c8160 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -241,6 +241,8 @@ mdio1: mdio@90000 {
>   			reg = <0x00090000 0x64>;
>   			#address-cells = <1>;
>   			#size-cells = <0>;
> +			pinctrl-0 = <&mdio_pins>;
> +			pinctrl-names = "default";
>   
>   			clocks = <&gcc GCC_MDIO1_AHB_CLK>;
>   			clock-names = "gcc_mdio_ahb_clk";
> @@ -427,6 +429,22 @@ uart1_pins: uart1-state {
>   				drive-strength = <8>;
>   				bias-pull-down;
>   			};
> +
> +			mdio_pins: mdio-state {
> +				mdc-pins {
> +					pins = "gpio36";
> +					function = "mdc";
> +					drive-strength = <8>;
> +					bias-pull-up;
> +				};
> +
> +				mdio-pins {
> +					pins = "gpio37";
> +					function = "mdio";
> +					drive-strength = <8>;
> +					bias-pull-up;
> +				};
> +			};
>   		};
>   
>   		gcc: clock-controller@1800000 {
>
> ---
> base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
> change-id: 20260811-qcom_ipq5018_mdio_pinctrl-f9e609e97c3d
>
> Best regards,
> --
> Luo Jie <jie.luo@oss.qualcomm.com>
>
>
