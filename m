Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C3238E5F6
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638775; cv=none; b=I6cy1pEmUOXWXVCY3wAZ1RYYiFzwOu03QbxhBaQ6C6WOpAq/pVaeHI0AL6BU37AEBEzbeb6Hr0fBIiotQXktJ2sAOD5Xw1UQgEcVpPMEe7e6+w9UJYWIHfcMhLS3JggGrKlJTS7cg44GICf3sYvlG332jOr9mlqbNT3hrMUNGlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638775; c=relaxed/simple;
	bh=rFkZf2w1nBJ9soa4SB66gP4TV9/XUpL9rJLEEkiqYr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H2RKO0wdXZPdao7KoOrCOysGEEzV1B2IrOsO02AxYNkiosx4Kv5LhFVbOjAXMYYTZddcv5qKZwP4ub0nWRjf8NOqxMNQ32AcBWe8IZ4CwvRXSleVQcB3NUxYec2z90+aNVJfVj14dmUw/MkSGzpU1TZaqQmHWcPbrUZY6v8iK48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lklu30Ub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hawqrtZc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lklu30Ub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hawqrtZc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63838XsY2411822
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 08:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUyxIW/i4xT3N34Xx3dygSkRm2tUQ3zinozI33xIahQ=; b=lklu30Ubr2+bgqCN
	k+TLL6RWeQvi6XjctS61beAZ1IEPVmQ9T3JsG7u/6qKfLkKf3aietmLZ/3gyRage
	8lnBS+UCs8AtgMC2l1D4+WRY17YCAtkp7yBgPWjT4PXyWhaF1Uv8rp/vlVRVX2aS
	91Qv1bNnH85LNCTXlfaYWraR8hvFga9g2wTt6Oq4PvwMIsit68rcKimPoBRcKLVd
	Y93AxcqHQPHSY5Q94Hy9Hofkr1yw3TFsJsEvehhj7od2NUgVB+xbTI11sjCmzGHD
	AB/8MTyF6URgR6Ps8fpYbL9A2Uy5WpAWORkfvmI/wvkU95JAeerFL+dDks77TDkc
	KjHDig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vaxpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 08:59:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8c183c2eso30048631cf.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 01:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775638771; x=1776243571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUyxIW/i4xT3N34Xx3dygSkRm2tUQ3zinozI33xIahQ=;
        b=hawqrtZcDDHLxmwAEPug/TftEpPG+Oi4ac9rCk42QIGBnkh1M9gSu0fkNhH5VLhNn7
         ezSN8XFvIIgxIu4icks+gz4FkrkHG4YcTwHJGV6JNIYwiznGEV5Qtwg08km1e1V/JFtG
         T8eIrzdMGxYtfVBRfyG/yz2qfqeVc1sYByEROF1nsWN8pHb0LS17gCvFC8xr/bK0907t
         /MmRZRTANWxtoHz3Owm6uBl7/u2TZh8pqPUgA9euioSMdalosiNMAIPC1OWPXbs6U2VC
         K5TOuW576NJiBKs8+nyUV5cNVup/OI6UcbrznIXPrflmVmqiMShyq50pBjASmwVnRG9y
         uvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638771; x=1776243571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUyxIW/i4xT3N34Xx3dygSkRm2tUQ3zinozI33xIahQ=;
        b=DX/I38kNEx/3/oU8ulwp4CFMX8/7H/QooJCCX2JlIKsHGh+WbbFtcmkt7kYiIvlWw2
         J+Mdcdfpg2XtwtyQ6S2YNwJIVtKXXlRm2dzVNgCEDeUNpyHaxOFteR48ajA5OosyeFdQ
         HH5xIihp5OT8u8GEDmFMmGAYQ7A4BDFFbToX5e1x0KcjmakqtHyb9hWAOftv0wZSQQmA
         9ROaQDT/PwU9Gn2i24XPbaC/m6D7JTlaQg93d6d+M0Gry6Hh3rAeMY1lWN1fcVNTJZ2z
         RopeDPmQbmy4ER6sp93ZTp0TKnPhgVAqwkyYAZS1LUFgOa2m31/2bhV+Qu1v7EckElkZ
         7qiA==
X-Forwarded-Encrypted: i=1; AJvYcCVCqYo7EaTu32XQvB5mNh3B7CxLVt7YyayBrhQMg7ytSDKLGrB/ovTw2/K6mKUZwwhagX2MoJdRzHNE@vger.kernel.org
X-Gm-Message-State: AOJu0YxW5Qum8TlBAU7qTZhUbApH8eI5fy6H2mV8cVxgF+drBgIjQle6
	CKLcOj18U40JlBRO/PcHXC7Y1bXt31QvF2K5uFyvDwF98WKM1H3a/5ZGrh9bOGkngQHfVmiLhwN
	NHSuWn7Ttc1lMc9UaNqBo8dnu1NA9VKpQOyuHRXl4f5KBJF9we3jFyXU9F8WMo7P9
X-Gm-Gg: AeBDievcGPl605RwNVUixGFR/cESttMp0LYdVryxe1Fr0lEhBywij8KigwkR0OmxWPd
	qZ/3ayGYF1y6Y/cps2O79dmFR1cQMm6hy/2QFZgesR2jh8OEOUYH28+JSEo+F45/pTxHCGbtMzF
	bJw6D3Lc5NWWr/BVJOvHAWvN0hKuhfqQcwYYu2N4pDxPNoHYH0ZFKREQiK+L/kJ9JUyln/INz7q
	V4OktX77r3ooCHXwZR1ttA9VnZCfAy94/U4CwTRX5VvcYUIheToj5rbIeUwG/J7o3RVf+D5bWwz
	YWqfGwlNWRtkidE5m/kXiw8Laq9UIbx6sg1fXJkr5egiXCXo8rkFF6YWIlPnynoE68wvmNv3VOp
	lkQophVHZPBipSjUo1kG/yZc8/Dny32wl77LUI7AlbrxJE4N5W5hlm0tugoX1MLUEQE31HrG+DG
	gd9gE=
X-Received: by 2002:a05:622a:260b:b0:50b:5286:f756 with SMTP id d75a77b69052e-50d62c83682mr219884221cf.6.1775638771438;
        Wed, 08 Apr 2026 01:59:31 -0700 (PDT)
X-Received: by 2002:a05:622a:260b:b0:50b:5286:f756 with SMTP id d75a77b69052e-50d62c83682mr219883931cf.6.1775638770970;
        Wed, 08 Apr 2026 01:59:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d3ba180ffsm2935966b.35.2026.04.08.01.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:59:30 -0700 (PDT)
Message-ID: <bb21b9b3-7432-401a-a0d0-1b1970f27770@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 10:59:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable
 UFS controller
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-2-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-2-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MCBTYWx0ZWRfX40wFuxDIbPsz
 0M0aRLPLWHCR/umAzdhi5NXd6Ps3uAEvfwsvPck1LnMaIShpIDAwauSXL+E5z5GrsB60VCxMJqO
 vO/OSeTO2u5hXL9ZnzS9r9krHprECFyhAofCN7rhN3fYYlgO2oB1CMie1oIOg0v9JxnZJny6h9F
 A1E44eT4vmPbmI02TORDrW1zTUMKOBCsK6g1D02TpLaXV/VGIISPo6LsrcHcfXSZr6k1R8O7e7H
 H6Ufr36W7t04sDpMPNtrOb1y4wOokgDXxipMCMUAHRiufRox5n9rsddS5a4NkII5zMIq5snvyGm
 lamDhENZN71ze9XQiXJrUtuyYJrp9/Kl2o1x1jcWiTc2vBozELf5FYIsuGfvv1uksd6oIqzMGi+
 IO+Tm+W6UDMd3TyByCrZLW100scAc26SGFvnAQ3IC2mlmrds/iwiJt5Eh6ofDOPHf2TzT5HZWs9
 uK/XbWzVts+rPFhscfA==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d618f4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=JxrhfIILcghro0na2cYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: C0RDZqso5EvQz9nZ1v31KX_J9AM_Zr-K
X-Proofpoint-GUID: C0RDZqso5EvQz9nZ1v31KX_J9AM_Zr-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080080

On 4/7/26 5:19 PM, Xilin Wu wrote:
> Add and enable UFS related nodes for this board.
> 
> Note that UFS Gear-4 Rate-B is unstable due to board and UFS module design
> limitations. UFS on this board is stable when working at Gear-4 Rate-A.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index bb5a42b038f1..c961d3ec625f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -959,6 +959,29 @@ &uart5 {
>  	status = "okay";
>  };
>  
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> +	vcc-supply = <&vreg_l7b_2p96>;
> +	vcc-max-microamp = <800000>;
> +	vccq-supply = <&vreg_l9b_1p2>;
> +	vccq-max-microamp = <900000>;
> +	vccq2-supply = <&vreg_l9b_1p2>;
> +	vccq2-max-microamp = <1300000>;
> +
> +	/* Gear-4 Rate-B is unstable due to board */
> +	/* and UFS module design limitations */

/* it's a bit weird to add two single-line */
/* comments near one another for a single paragraph */

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
