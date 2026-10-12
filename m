Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406B0492E3F
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818672; cv=none; b=iBXiOArFJLVdbdK6Cx5XoSe630WLTuzJztCibuxfx1wYuC/R1CrcXhQnW9slFUDrxhNosGmGX+RNnuspp/d3b2lvj/7UZvM+l7TehgPaGjo+0ad3mHlHSWpgKqWQ/7efol1zGsJ1tlHCQcsyx7FLg6XLnJCvHNGSEf2+ubGS5EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818672; c=relaxed/simple;
	bh=qof9llCyNivp0JwZSM7oN+znBAER3CDEKu8Cxnl0DnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pupJ31HMtCxZuE+qd4oVSxDNOKE0oAKbszoqlSzao2Drxy7uB3yW6OQiv28ffdfSOijVAMjjSYFgGfbfrSJ9bwFdNcmQxbtN+/S2IOYgmKUPiHrE8wG+PYuW7llojfI3LllwnrwfRio6663QdDmgKhcgeZTVccAo/y/8FjKVLOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ck2zzGXt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=giI9VwUk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ck2zzGXt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="giI9VwUk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC087T3292287
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2t2047iyNlClw+mZi/oXexFrWweVVhnlsMnWBmsiVbk=; b=ck2zzGXthfLUmY1X
	lAaP4oO9h60koI5Cka3ZcEWiUIckPP1vC5T269eGgV2qM8mOEs/ExGRCFf6dammI
	s1dEMQtuxLj238e6/WLRs94f+9jqMmWlKDAUWURe8TT8IFQSWrOQBXXdCA323vD4
	gEi/vK0nodmDPFYK7zcl6L4aDJTAXsJ+aXj56l05bh2bqV+6npQUj7BnxKGwah6/
	cnjL4hmskOi5YtLSb4jDVhM7Bx/lh72NmhPHr3nuP8V1cvtnRf0JoHX1jJA4/zrR
	+ed7iKwO8uv4AVfs/viyoUjOERvZO37CQ2IEvuW7AKn43pkB4gu4fHiDePwonJ7f
	5RF3fw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j1m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:24:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cb9f12d351so29092137.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818667; x=1792423467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2t2047iyNlClw+mZi/oXexFrWweVVhnlsMnWBmsiVbk=;
        b=giI9VwUkfyZTl4KSOOhjBV+5650kLclPaOiFzvjhNyXTdFTsz5D5eUjvvdbijTVIx7
         xOVJsYQ83ajd6Cv6qHUtmgUjVqRhKgbAhxEFGUZDWkOAgSLdxZinHqdesWxboHGold8e
         twknObku/G1o5ZBDLSX/lMRW6ll1X5G9gTRBOC4FlkFAfsR1GCg4K5reES/RuNSmJsCT
         ZpLItTTgZCfItCjEG6hDiGpUwddfzGOWzcHpW5KZh3O0fTUpmCxCLO0o9+23BnVT+/r7
         9XFReYU0QfO+x6uaAuAuARo8+SfVDZOVEWbd1Em291OsZK/JGoVP0O7lB9+ye0731JVa
         A8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818667; x=1792423467;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2t2047iyNlClw+mZi/oXexFrWweVVhnlsMnWBmsiVbk=;
        b=Zxlekt9d38PaOa/1lh0jm0kB8NsfpEr2F7nkPqv1Vf+eNLR5zeuK2KuSp7uiwp7eKj
         HO87m5Zq0imY+o0RFg9a7Y7uPa/VQnYPX3aR60uNTMM3BnlfOASfrkLAK7BVCNA/CwIJ
         bqs0Qb6ixQbVU2xh0WX0eCDrK8+3Au80gxfvMQ+mOHFHM91c39snwfSLyC3zuVJ5mtwc
         /ASZi1pzW17UxMbmo38PZ5xtfH9Rk3fuvq8TyzXwdbp7I6H6u2B/HteL48KJCIBzsAVD
         eakpqnV7Xd30B3/bFPdUfXcoqfii6sBzR2wKPBLp8dD2tNiWFf0UvWVIMFTGxQRoCPx3
         vXHQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8RlEGJ+1OnYiBKjuy1plyDF/obc5RdoqegBvtGdTQz8FBSrK3cnGXIYNvKYoUwgWaYx705+qwN0gr@vger.kernel.org
X-Gm-Message-State: AFq9FYK5jfotqmJL1YZ/X5RU8ugW0aiv9PvY9WAphkUYFgP+08PLHrzu
	xf2BLb4FvbzWpfc2/BR1cVicmHh2Ovr6xWvGaUgVjBpVvqQhVhxu8/lE/T1TT0sTxdNXKSrPgrE
	763m6S5jrLAHjul0qlbZPC0vKhUy+A9R94MmjiUXivWkOqodc3THZ5fDlLH2lqZFR
X-Gm-Gg: AYBFou3jdG9Za5hem8McCBcjhpAeIibu4G3m8KpAxJnhDG/xvjm0wxj+YIjA1wLAGPe
	y/9eCO79XazVrj/BImWM312FlGNipvvih1mVV0H2wNeNzqTv1pULc3bMItilcIX6W47uO2fxU4E
	o0qqByH9zABeojvaVfdx7qMQ/YzFrRtmDz3HMpN0wkcvOhVxqhqi8zGgWKUa651WMJ0LdlWdy/B
	Pu9vD/JsUkf5LQwSRM3ymkuT/qRN+LNaVdtE9QLKodgW0OQAA6yoq5jUDLI1ScVfnMgIba8ENUm
	n3CqSOdfk5+mwrRrLrZLBLcx4eyqGk1dkh++q3P6vEXybKRTYOI4mmzcu4/orcvmgFiEwLG29/x
	zwJocmOI/WXMmz4l1X9wAUw==
X-Received: by 2002:a05:6102:149c:b0:7ae:544d:b36c with SMTP id ada2fe7eead31-7cb3728af21mr2394164137.3.1791818667379;
        Mon, 12 Oct 2026 08:24:27 -0700 (PDT)
X-Received: by 2002:a05:6102:149c:b0:7ae:544d:b36c with SMTP id ada2fe7eead31-7cb3728af21mr2394147137.3.1791818666867;
        Mon, 12 Oct 2026 08:24:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3bc20sm483347766b.22.2026.10.12.08.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:24:26 -0700 (PDT)
Message-ID: <16e7bb97-4280-4c21-a011-3a6b99971fb8@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:24:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/38] arm: dts: qcom: apq8060: Indent property data with
 tab
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <a647694d7a5f1e2f8d5c31d878e87a6d054d4aa5.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a647694d7a5f1e2f8d5c31d878e87a6d054d4aa5.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX2fsF7DLiFh+O
 vx6XFBUqRiix4oNIWobSiLoAJ5PlSHLJgYyBTIXeK/x3IMQlUQjEjyEj+f1atZQexwGGw0B1neh
 XM2JL9rmF8JFX2m4fClpQijZ47/pSMel9d34lot7rnCmRXfWxSxdxsl5lWg/AuTut1zcN3JWgJp
 nFzYtvpKAfduA5qPejpPinSMgSAsx7zmIlrAcNn8VsO6WgJoU6m8t16po5PF9oeiGTsa7xc1eHn
 lmV556sYk/JtT18DgbJhx7uyM/M3WWGQdp3nBwSEuQptTsykMmF1oWKj0XLmDo1ETpnoTeD2GVj
 rAOqwDv9A+UYB2JBOFJHsJ92aNryY+XtX8lOEkGV3LyJJXRmPOJo5Bg6OdfOOo1Gja2C7d7GWSw
 +3w58dFtDBVXe8dctaaufsY/Co2jAuGVGBMOO2zD6VctCCt3oYuZFyRD45C1lJQMc5B8LgKWAwE
 GlvaK3/y1DaLXHSvtdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX6Ln1jdk3Q94x
 oSMZQZZGuZBxhpM55FRFV67NsHXFFXqHVNbLbEIlDwTwcc0GqIscLwHGcN4e2WHAWGA16KYViiz
 +jL8H4Xef2+igMTWM6mRZmdGRQEKm/s=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accfbae cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=s0P7lh0P-FJxtn-CQD4A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: OXXxXpuGH0plKeK8RbeUMc8wP4guRT-S
X-Proofpoint-GUID: OXXxXpuGH0plKeK8RbeUMc8wP4guRT-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be indented with tabs.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---
>  .../dts/qcom/qcom-apq8060-dragonboard.dts     | 28 +++++++++----------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
> index 4dc63032cccb6..6ede4e5af4494 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
> @@ -966,25 +966,25 @@ dragon_ebi2_pins: ebi2-state {
>  		 */
>  		mux0-pins {
>  			pins =
> -			    /* "gpio39", CS1A_N this is not good to mux */

Here I see a possibility for improvement - we shouldn't really be
breaking lines at the assignment operator

Konrad

> -			    "gpio40", /* CS2A_N */
> -			    "gpio134"; /* CS0_N testpoint TP29 */
> +				/* "gpio39", CS1A_N this is not good to mux */
> +				"gpio40", /* CS2A_N */
> +				"gpio134"; /* CS0_N testpoint TP29 */
>  			function = "ebi2cs";
>  		};
>  
>  		mux1-pins {
>  			pins =
> -			    /* EBI2_ADDR_7 downto EBI2_ADDR_0 address bus */
> -			    "gpio123", "gpio124", "gpio125", "gpio126",
> -			    "gpio127", "gpio128", "gpio129", "gpio130",
> -			    /* EBI2_DATA_15 downto EBI2_DATA_0 data bus */
> -			    "gpio135", "gpio136", "gpio137", "gpio138",
> -			    "gpio139", "gpio140", "gpio141", "gpio142",
> -			    "gpio143", "gpio144", "gpio145", "gpio146",
> -			    "gpio147", "gpio148", "gpio149", "gpio150",
> -			    "gpio151", /* EBI2_OE_N */
> -			    "gpio153", /* EBI2_ADV */
> -			    "gpio157"; /* EBI2_WE_N */
> +				/* EBI2_ADDR_7 downto EBI2_ADDR_0 address bus */
> +				"gpio123", "gpio124", "gpio125", "gpio126",
> +				"gpio127", "gpio128", "gpio129", "gpio130",
> +				/* EBI2_DATA_15 downto EBI2_DATA_0 data bus */
> +				"gpio135", "gpio136", "gpio137", "gpio138",
> +				"gpio139", "gpio140", "gpio141", "gpio142",
> +				"gpio143", "gpio144", "gpio145", "gpio146",
> +				"gpio147", "gpio148", "gpio149", "gpio150",
> +				"gpio151", /* EBI2_OE_N */
> +				"gpio153", /* EBI2_ADV */
> +				"gpio157"; /* EBI2_WE_N */
>  			function = "ebi2";
>  		};
>  	};
