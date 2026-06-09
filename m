Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C8F41363D
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 12:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007506; cv=none; b=r1dds9U2/ZTAq835bcbOcMjjtMKKBEbzPR/ADSBwPCuXQ/902g3xYmzc+OvYifUiNQgwfMyumkFRpyeMONhCD16dXZTI0//KZVnErwOESbvGX6qmDQAauQWmaA9LSvwe166oj/w3rE6E/ewYjU39uGqA2pxBvRyLvJmIuPqiA6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007506; c=relaxed/simple;
	bh=XooUwXri4R+BoLa5L4foDmENTNjKE4+yhojS5sLja5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1Dqzx6baVAPboMwg8VFrjmmdZU5DN44umgATxXfYULn0w63aVFry2DTQBB5RtG/pmCYxigfmiAIhSf/iEN5nQnUVtvqedz1TbHvC2q6fegDWlVf2m0JOPiDa+P+Mbw2RoKxqpC7JAGPya8v43pzjjLpt13Ywc5l44OtTtHeWUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwbr73QD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K09jEe4k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwbr73QD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K09jEe4k"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnNRA2051771
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 12:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1YFD4b+EciMSnNmzK0ZeRJeHEjtUncEVJ+8zDIPQSkM=; b=bwbr73QDVI2TdFV7
	vsx/3Nm37xUjkUbU2Tpac9lM/lWR+Z7IVZEyDpJ/wQwq6V1q241I/Y0FHpPiJNcQ
	lpw8JMvtvC5L7k+szDr8Roho+wrN53yT1q8GeHsPLSO1QiW11w3OIbSU6d5UabzP
	mMQwkvdEPmy9nyfoC0AK55iPv20ipA7iVfRPzXHBAfpLNgtE1oJGy5SdMe6O46zg
	BGgNQLnVF5VsCKcfiQgzqX7svO1vHCPA3Dk7QzSXDbWMyZekssx1vdrlAJnIG0zE
	wPA7f8eEtWMhX7GKbNsD58bOF5PVe4x/0Yn9hRY+jLsddgu7oPzep7hfvd8VXdzU
	N0p0fw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr93y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 12:18:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51768e1d798so14037701cf.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 05:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781007503; x=1781612303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1YFD4b+EciMSnNmzK0ZeRJeHEjtUncEVJ+8zDIPQSkM=;
        b=K09jEe4kZh45wGGSNDElON49EdmNwxeTy2QrB2oV5C4MrwuWv+YgkKkNAmEwLrj+Ws
         NXTsBzNj5YnW1JVqr4sk1mXCGbFosYYe46wsTvSdYhScp/htd/+rabZ5YIN3/MdqVBqq
         GhvWs0xxoepFbspzpix7T1sXqcm16cpVor/laAB8JXEcNRetVtQhvMg0LGmweneC7zVV
         PTyJ0+JAZOQrnJn1MfBTnl/958Ov8s5eaw67qgOexGpMWE2g6c/tR40WIvIrmAWntjmt
         64UnnsBJ30iC+GSRxG/dXIMCWaSV9UueDf3wfc7N5Nuy/bVs4nFqGHIdMD6KkSeP/+jX
         w41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007503; x=1781612303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YFD4b+EciMSnNmzK0ZeRJeHEjtUncEVJ+8zDIPQSkM=;
        b=MNpK+bUMJQL3ecBSXsPxD7ou7lnakmgiQUOrka6kClKB29GGj9NWeRFm+i+2PPK9J/
         owrcy/zuJnNrUhoqAWMJE+Ayl2CYGtPC4Ikgns07P+Ay9sETAqGFwNf3uv/cLiK2s26+
         +6aPJP9Q55caVGj9k742EcKR4WqBUSeEYTyJdX6xEOfijrsAUp2g2/2QGPmsxqXuwZ91
         BwPEBIEY8fiJjCEVJYQH+2yc7l7PGEcJ9allH3GL9vfmMwq99LmpNgYUOR6a93cdzhWI
         t2fHNUWWyCxU1U8cCTaX05WvB2lIHBPIpgsJmOEApQiFXBu9iCuc9NFn6vBX21oMYQ3c
         ohbw==
X-Forwarded-Encrypted: i=1; AFNElJ+bPPVEMEr2KkQGLC/3yfSvtXCqJZrfFKhKXrJqoReM9z5YkmCFTEOmcRmVQUMt/hokZNLOlgOBImMh@vger.kernel.org
X-Gm-Message-State: AOJu0YyOIpDDZmIM0+IyLbmuIL2Q3yn4FABb1wuLDfXNYn5z5WUZov7Z
	bFTperYY4iDwieeEWhNt8R0PNyblNR+1ffNHk8NliqYCtmCYIV8dxL6lGq84EOTsbO4wD5nKfdE
	DIQNmBrmkEdtovjp5nE8mu55vqiguUO6ZUqqNaqFffoyYXzh/pdUQbK1Dmjv+kM9u
X-Gm-Gg: Acq92OH786QHH4RRd/Zwb1EN2wizqK8bbuC+C8KYF3SkjsMxECPm7/yI8V24mdeDITk
	FjzwK7o1lEw0+zt7ISooIfwtjIptRrXiXU0fSvxEiM8IIDiR01hpUS/aCA22gFbyM6proaQHu93
	x9iiwwvKstm1bHCVx74fdhhLNjL7Z17knJpqryTTWqhUxTnXSJiyVvTF5Fh+feSbT1bX2iwdriN
	8p7/vLKwC8B+1Hb6e3wvzhEQPaJ4f4VbwnbSzuJwwlgNZhmlChIJL8I5d3twzBx9PhO84RWhYcI
	l9OnZJnIBCaQ5j78GasbtgiWKECY2qitYl3UOadxMksvAdN9B0WNWhW1Ajb3/T1SAyBMN7AmYQ7
	as63AzyB1K5SUDN7ETgP6vq2Gd/IvC2QRXB5RoHyPq6zLNKWZJOrOOt/5
X-Received: by 2002:a05:622a:40d:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51795b3e4cbmr169908381cf.4.1781007503315;
        Tue, 09 Jun 2026 05:18:23 -0700 (PDT)
X-Received: by 2002:a05:622a:40d:b0:517:6d82:9d7b with SMTP id d75a77b69052e-51795b3e4cbmr169907931cf.4.1781007502784;
        Tue, 09 Jun 2026 05:18:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e04a89sm1023030566b.41.2026.06.09.05.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:18:22 -0700 (PDT)
Message-ID: <aac3c437-16c7-45ea-8d29-77795bb27be5@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:18:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8280xp-x13s: Use predefined MCLK
 pinctrl
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260607160435.36546-1-mitltlatltl@gmail.com>
 <20260607160435.36546-2-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260607160435.36546-2-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VomUMcZNIkoFwI5vAQA0KJWTm9l1l7ce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNiBTYWx0ZWRfXwc20UGseYdaW
 p98BzIXUn39U6rehtiKeSPQWD3BIgikWw4x9D3p6iGxLNNFNZmAoTr4PXFYMfYfGtUJS10IMMd7
 zMYjW6743Gaq1tWR9KI46rQGLMn97CYLpc2JkgqvW/wPau/AIiB/oAl/UDSieDscy4iMSL6l6cW
 gLQ7cFqQLvkZvPlEzRTgQTg31jhnXdPK5eCtkEDXlQaawl9RVGH6YV/V1/tD4AZw9Xc5pPsN2Ts
 m879+xL1nBCpzkKqmTQ1AZxvE6vts/uritZ0Prka60ZUSXYOB4nluI8wdNLfm/N7E+CgdLh0723
 0uNkrDwbek6AQ6esVLq98+tx2DsVHLQ1y5DH2ZI11TyqwjU9New3Q5hyPM6JP/R/qKXCh+9LF85
 5URNv34NyO3If70p6s1yT0yck4j9w2BnGk9TDWBF9rZrarEXttdfRJWSqqXKUnx+R5F7zZ2tjPx
 C43tpkrddF709sGGBGg==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a280490 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=af0J6g1wBCmrdnSuRJEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: VomUMcZNIkoFwI5vAQA0KJWTm9l1l7ce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090116

On 6/7/26 6:04 PM, Pengyu Luo wrote:
> Now that the predefined MCLK pinctrl configuration is available in the
> sc8280xp SoC DTSI, switch the ThinkPad X13s to use it. Drop the local,
> duplicate MCLK pin definition from the camera pinctrl node.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index abd9c5a67b9f..5d652be69e44 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -674,8 +674,9 @@ camera@10 {
>  		reg = <0x10>;
>  
>  		reset-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&cam_rgb_default>, <&cam_mclk3_default>;
>  		pinctrl-names = "default";
> -		pinctrl-0 = <&cam_rgb_default>;
>  
>  		leds = <&privacy_led>;
>  		led-names = "privacy";
> @@ -1552,13 +1553,6 @@ cam_indicator_en: cam-indicator-en-state {
>  	};
>  
>  	cam_rgb_default: cam-rgb-default-state {
> -		mclk-pins {
> -			pins = "gpio17";
> -			function = "cam_mclk";
> -			drive-strength = <16>;

This changes the value of drive-strength (which is probably way too
high, but it would be good to know what Lenovo set originally..)

Konrad
