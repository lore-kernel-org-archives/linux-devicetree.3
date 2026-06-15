Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D313AB27D
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539016; cv=none; b=VmvOdbcEAX7MVBh21ccDy+jkqiHk9We8nj/SkmxRfZ/aRB5y9y5wn3r9IWPTWd9TUUaJKPufc7UU9L12qhoPBqEuxD5t4s7lIDGiX4fsOLMCmqNftInvCqZI+nTdQbxxEhzUyO+EhY8dYNAx0e86//I0Jg4jHsO4SGOcdc6suSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539016; c=relaxed/simple;
	bh=VC4ByHWhUnEY9FgLt9VYI53AreHcL/oYIeZhf09f3ms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r7qguPfx8zq6LXOeFb1rHxvBREYeaua48Rt0k4K6te4mdvaEr0bTcMy8q9v/S5kOEPGv5EMavZ9BvIIMO/K9DG2ZhCpapMAHJ+vh97Y9DY6K0iZ6Rtv+K9eekPSmxxatgIL5L9IDWTJflbR/98qH9RsVkf3SzKx7iQaQy8oWuk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pNg4LYxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MGxMxq1x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNg4LYxG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MGxMxq1x"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhgNo992170
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aJpg6TL0Li8c78MGRrrP7ZdsT1joHJVHeC0IPMlRV/Q=; b=pNg4LYxGnJo1YLrt
	JHGSSXZ8d7vc0xwLIS30M2ktRnCS0DFopofofc7jU9FNC6yQaqFb4jaOY5y7ivd+
	klX7wuClE+8iYKkucw1aar8fnc7XJTpUh7MAe3Tkb3mBmwtbtsjKIO9ffZHzRqzt
	uWlud+LwQD96K4/i0PgrOY6nywBiVGqsfabNVvniPsnDkXlVkApOTczH6dQWIonk
	2j+NIvrFHhGcFIohspRATPthTdoudOoYFOL+nVmTdgb6bzvoLk3tPI7tJkBjU7aB
	QOzlOypUAyKwW51g+SgSV7EPbk0gskVP8yLIol/C0wxFTZWK/po8G4mAqiep9dnr
	OKMX7g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etgvhh347-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:56:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157b3e5182so10495185a.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781539012; x=1782143812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aJpg6TL0Li8c78MGRrrP7ZdsT1joHJVHeC0IPMlRV/Q=;
        b=MGxMxq1xJRWMR/hK6ZRPQYMOFfRISWKNwKXZ4YL34O+ytzGQ2ft1fugteUczRR9ktR
         5FM4f9Iax3eElC/kZ2fWFeBizXLsToAdKMIKlFQJ1vHh7l8B+SjOPSq5k129uBZJG0Y0
         28e71yzeVIOWGxmm7VDkjaxWlEJ3MfgD2YMshLpuVCPdHexA4EuIbSeQVkaWlDKgyLWE
         nL9iwxfmgfliE+wIzG4sxr9mbgM2vDgyZcOb2Q+RjQLeOmDqbCVZK4uSyiFTxl2pLJSk
         aZhM+WJKntfsSYpIPuWjyOlUbwH1E3u3E/3P9TAHXJxL7JATMMk/Jw4DhrIsUdingWQW
         RBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781539012; x=1782143812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJpg6TL0Li8c78MGRrrP7ZdsT1joHJVHeC0IPMlRV/Q=;
        b=bn1Zn2pvtMWnfsBSs+Fi+K7ABWb1xdV2muILjTVNTSAI8YImoHh2hxJS8E2ukeU7vx
         ZRoBFHBe9zUaSNcps8zJrexVUz0wqnX/S0DPs5CDm8R4TmWj63W0d51WO8C7Ezw8XUD1
         Z5r+9TD41bwFnUXpXOVYeWwwvAVnMzOALHb5SrOE2sGWtBqKT1epkiIvIP4Ca/DP4XxT
         lc6jJR3+1r5+Htwepd0UFCfgNyJ75ZVQe8Zn4Hayla+kJUBpzF1d1sWW+2+hXnacLJvY
         uksrzHYuqyXp16+t50PrN3xJS4UkXw7kS/yfgCaBCFIMHA/ovztHdmEZTviwjOMy8TvI
         0Dtg==
X-Forwarded-Encrypted: i=1; AFNElJ/gPBLku8Go5Acp2d/+cwylFc8sD7nXCRZL1lLQY7g+81SzYPYEatwDqR8veBpE3DZWPeLfcLRXkd0y@vger.kernel.org
X-Gm-Message-State: AOJu0YyXsccB/xPxF/OCCNYBuNOfKUTCeqEHGk4AfinfqGd3Y35TjeQf
	lZ6kyEtSNXGG07qZCrfJCOHVnf8n0YVMMybp6bq2MLlmim5gpDOtwr8dys2y+jm9dc2x6cTZxLF
	0iJtGihQFPt8DjvI8cfcXKfRZxfAZfkYf7kwCcd8dEawzmN7hTe/ENLhgiBPtH96v
X-Gm-Gg: Acq92OHOfGAlSYIL/9QA6q4aowsHpxwLyQhkjgn8+aYF/qPUy/HBG7Z2vBgq7htvej6
	DfryVbuIgACvDsiULtFZPzKy/1pmZYSNkPtPdms9hglNup7FoVj9/AOs2ZMQyqcN2xT3vCPKUSq
	X4dvDgNZFt95NDc7mOtHn1eaI/l7yaV42R0bysU/v7OuGI7L0lT1Ml4vY8LR/577BWxABzNBGZB
	btmrB0UlKFf58D3ZKdTS62UO/9MQDjiJpEjjJPPpjEzvFOzt5ekXluMO7Uu7ktcasbVu6v7aH26
	5FjElZtSQRFprVtjAPMP/QW0bLEE7Usf9I10ReMxgbRJ9mGZhTAPA2q6qzVtMo8oW6FTe+GV731
	9hI2Y+9pgjv/qtZrPH0BfU4uXlODVbZF+gQZrwRhYhFAW3w==
X-Received: by 2002:a05:620a:394b:b0:915:54b2:582d with SMTP id af79cd13be357-9161bd659b1mr1367739585a.8.1781539012589;
        Mon, 15 Jun 2026 08:56:52 -0700 (PDT)
X-Received: by 2002:a05:620a:394b:b0:915:54b2:582d with SMTP id af79cd13be357-9161bd659b1mr1367735385a.8.1781539012090;
        Mon, 15 Jun 2026 08:56:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c03ba328d6dsm69770866b.49.2026.06.15.08.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 08:56:51 -0700 (PDT)
Message-ID: <57f3407f-3371-4db7-87cc-218f7360ce3f@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 17:56:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: lemans-pmics: Add ADC support for
 PMM8654au
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
 <20260430-adc5_gen3_dt-v1-2-ab2bb40fd490@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430-adc5_gen3_dt-v1-2-ab2bb40fd490@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE2OCBTYWx0ZWRfXxokp33Va05mC
 p3u4zJzlEcjCeWxeiI2ouoWDosEfgHs7bCvYcAHkDcobQJO8FxSlrM823dX/oVysGYWANc56pnc
 OrT5dub0gG+R0X2Tphyl/vrj9aHT/zE=
X-Authority-Analysis: v=2.4 cv=Zqnd7d7G c=1 sm=1 tr=0 ts=6a3020c5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6xfqC-53WEIPg_2uNRIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: -Ag2RmVt8bNhxBKNyoW3HC1SOc5LbKPs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE2OCBTYWx0ZWRfX6Ku25S0lNveR
 ZwUksQ0NeIWRJNyuf1kUp0PAkml8GbJt558jMEk2h3sKNsDMOL1vipJupB+plbD+SQCAlkT7O30
 GoBtKvQ3masQ6Y3Pfb3WP0sWu91DxwgrYHr2me0+tlZJWCIHUOVCfKG9G+B0Wki6Llwlb4jvcVS
 gjBSvQ453XRBVewsNgXMKelHsTKKiH9Lw6UdfNPCAKDaoGc4fFgVvSM9zjfyEZjX+jnXZsg9xKG
 T0IzJQNAmbbtU0Y7RPWroNDX9r5ZoW/tfn8CEIYumpaW2SPveGIPSakXFk5ez9xFvb7KMM7Y5cH
 iVyGfxmgBMKyGSkMQcI685lAyoAlQ98zifdgssHIbljPfVTBQCeGY67pb5BFyTPuZaVLGAnw8CD
 g30IZVbthMpRKceEn858mRKLZCVADmjKB5C3N24dFzwVBGH3jJQTg9U135Xp5V+JiMiHMrU6bZJ
 Yrz10yuVw/CMA3wKyQA==
X-Proofpoint-ORIG-GUID: -Ag2RmVt8bNhxBKNyoW3HC1SOc5LbKPs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150168

On 4/30/26 10:58 AM, Jishnu Prakash wrote:
> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> 
> Add ADC nodes for the four PMM8654au PMICs (pmm8654au_0 through
> pmm8654au_3) on the Lemans platform.
> 
> Each ADC node exposes the following ADC channels:
> - DIE_TEMP: PMIC die temperature channel
> - VPH_PWR: Battery/supply voltage channel
> 
> Also add the io-channels and io-channel-names properties under
> the temp-alarm nodes so that they can get temperature reading
> from the ADC die_temp channels.
> 
> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 93 ++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
> index 341119fc8244..6caec3e4df4b 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/spmi/spmi.h>
> +#include "qcom-adc5-gen3.h"
>  
>  / {
>  	thermal-zones {
> @@ -110,6 +111,8 @@ pmm8654au_0_temp_alarm: temp-alarm@a00 {
>  			reg = <0xa00>;
>  			interrupts-extended = <&spmi_bus 0x0 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>  			#thermal-sensor-cells = <0>;
> +			io-channels = <&pmm8654au_0_adc ADC5_GEN3_DIE_TEMP(0)>;
> +			io-channel-names = "thermal";
>  		};
>  
>  		pmm8654au_0_pon: pon@1200 {
> @@ -141,6 +144,27 @@ pmm8654au_0_rtc: rtc@6100 {
>  			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
>  		};
>  
> +		pmm8654au_0_adc: adc@8000 {
> +			compatible = "qcom,spmi-adc5-gen3";
> +			reg = <0x8000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
> +			#io-channel-cells = <1>;
> +
> +			channel@3 {
> +				reg = <ADC5_GEN3_DIE_TEMP(0)>;
> +				label = "pmm8654au_0_die_temp";

Are these labels namespaced, i.e. can the label be just "pm8654au_die_temp"
or "die_temp"?

Konrad
