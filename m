Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4563E3151
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146077; cv=none; b=HWHyCP9ZPTzgFLe4HBHCXc8Tm/yX7dNjUVDUTirmR96ULkqfzcP/HYEoNh+IcgCnSo9jbbIj1RzoxgeCJX2akYhRjyQ3K2h5KMwmlRxgCc8jySu9GHEE6m0suRyP4vbL9y+TGB4i78+8bwgOwd+sldnCnmiP27zsU0JEvHqXCLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146077; c=relaxed/simple;
	bh=/yOLqhnrBxL+q2VE978a9XQLFBicrFACElLsHEaWrwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qOPHLaMXquReAjSsCfv+WV5Nrxx4Qbdly/LlxLiJuIpw3aEBUrRC4AVPYHYGGmeY/PxC/jevp6GCPnE6uW9ovoG/wN66JOyoEZLBEFhAQlUYsyLT0DtzYfZejHzRYyY5LXY0sw/CK2mV/gW5jZnfZ+2lFk2bIHlcHkpxxgCGDmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUopq4+R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oi2Yfpup; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUopq4+R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oi2Yfpup"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAADjM1104712
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ljqOM735N0dyPHkuB1lU0B1VjJbx3yNT1Oftgxme1c=; b=bUopq4+RC8X6BfF9
	x8rfMyP/OOlUubaRa5EPc9niCSuT082/INTj8TW2+sjt4wBzj8l5vC0X4tom5EVC
	33Hmv1hMZ0rWctcqzoMddcCtSRctRmT8cvpM887rNserT3WS3yvhXO0p2ZmCTwvA
	GcAg72PhWOGDobUVdNMKvq4aS0xYzL1XRTwlM79MyIDPYvj/qp6adsSPKG8mobMZ
	CUr9B9kqk/BXxyXqHihFjDzU7ZmAfnL8DkSDvBW/7uUZml5PS8s57rvKc+Z8kt9c
	+eLIj0rGC9MggCaKCHd/aUlZvLHT5Nz4WgDqvy1Bow4ZxJEPjWClqODy6sRTo6/3
	b7g/8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r3bay7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:21:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53568f05f8bso17508781cf.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792146074; x=1792750874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ljqOM735N0dyPHkuB1lU0B1VjJbx3yNT1Oftgxme1c=;
        b=Oi2YfpupnbTMJCwrbAamCtqGRZxgBZ2JpxBmTaeRV75yO2xkZACqwD5hex0XCl/5CP
         A67IKCRn44RNpLzoTvgunYzb4csyM5yfC2OU+AdvEaWFl4bEca1icodEUf8PANirAwHK
         XeHCmwm/K5rTFti6xigZApZ5HVLnHersiDURUu4wKdOnU/ifm49Aw0ZxgDBMrDQgCvZ5
         PxpQTCLviO9SrAgw9yf5fsO+7v0xxhI35n0AES2CKui5j9ANHDkksfXWp+y6mm85V8mw
         93hH2IBOhYceelaD8XTOU5Wc4woKFwscGQPLHMO9QtIeHwPbju3Lw2Wm95nfui1NYtg9
         e0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146074; x=1792750874;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ljqOM735N0dyPHkuB1lU0B1VjJbx3yNT1Oftgxme1c=;
        b=W+gqBTDvQ/iDhCRlaajxLDPd5/W7eYCnqZwXFoAaYyPC7weFlos7hvZwQ0AaXYyAKT
         Vfxh16ZqNk2F74GHMCp9uETxG0mUOHhGO55tO1uFIHzuDCetdjg/o9q0doz2AXpo/Cma
         HNtSyL4MsAJFrTNWEf2mD/MdJ29/kVKAHtVHzWFVFCllPLByyvgEA46OPcVG3Tp+eWEI
         BTG7CCbD2MxGeVebUjIaJ1vuTgrV3Wtyd7qYwOS1fB8zdbk9X+ZhA2PLwdA+QN2HBA5c
         pNKGay+TBUUQB7s00AHfo7rWItDuL0tyXuLNugREDIj8AjmTxFuoPbABzxXG/UKxLTNe
         GcIg==
X-Forwarded-Encrypted: i=1; AKwUvBwVn27fnl/RPua2G23qziJ9b84n+zyf5ic26eNRIuBfsRuNIxe+c10YoiLee0wnvZaykEGBFqNbl0SV@vger.kernel.org
X-Gm-Message-State: AFq9FYIoq9G9p/0WII6ui9fwmkUAfI4kSDAMxwrBNuCFcVQgtUQ7/Mq/
	RL8XupKmQdT5O2IaO3Jr6qRkbAGYZSUiyAwWv6rjph8vs7vOyI55N5xfqDhweHG73yo8SgMqraT
	BhiGIsradp5wBUmZ91LQDWtVRFfnwqjzwUJypxfRZb9dkDD0ueqOj87BhRQscloyl
X-Gm-Gg: AYBFou3qWQ/d/wfIC40VGYT+tn7JsGXaKFXVfTivjAnLHDuyuuj8Q4GaB+koSj/qUc3
	n2G3IcCkOW3/EUwvbnbMD7xix2vQs59/SFJRleyv0wa+LKrVfqepDO/r7ivElyKPqpE9jLQpdM5
	1MyOT4BtPRBJbfJIEQ/ajPP+4Wq5km1pLDTlOtDch4WhCIncw5EhLBFGL7/g/f7xyBiC5SPJPKz
	P9WZvtocwOs1AOyFms89XtyMHKnKMUchF3isZbPqhHv+gOvmXuijiaYWrcRvfdzUW7sa4VYVbtT
	3rKHemCtsGQqhzXAnqL7/6+E/YcfYob3OjZ54bpmS2j9LZOMpTkynRchAKCHKWJM7sTCt9dmUhT
	Km0XtOPq/MIPufCGDeLI2AA==
X-Received: by 2002:ac8:5745:0:b0:535:496:56ab with SMTP id d75a77b69052e-5359f06c305mr397433771cf.0.1792146074609;
        Fri, 16 Oct 2026 03:21:14 -0700 (PDT)
X-Received: by 2002:ac8:5745:0:b0:535:496:56ab with SMTP id d75a77b69052e-5359f06c305mr397433381cf.0.1792146074105;
        Fri, 16 Oct 2026 03:21:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bc742sm57787066b.54.2026.10.16.03.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:21:13 -0700 (PDT)
Message-ID: <87839ad6-c489-40b3-bfcc-60c436cd1a6f@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:21:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: sdm670: add digital audio
 codec
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-11-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003175659.23536-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX5aHshy+1fxa/
 hrHqqE+oM0pYHpnjo8uTRFuWEVFFcxHdJD7d0oLiFF48ZbZFvInX514mGJd3C4sEhZtjLqiMWYl
 GI9jsD6mjA0xxkgNI5tZlTQwi7ac5m1KLZPuN/GDBOV8sPLtb1VUPiArZbsHsqVp6cbNhH5qZcM
 UdI9bnXjielMMgcsbRUIWMtmVEn2DuulG0nyqGiogq0dsCtjCa44ANqO4kvkyt3j8Osp3axriHH
 lHIq7ru2aZ1UQpdMpMs27mKx2splZPVxL64q8tQj5XTQzxMu3p4QTqNt63VxMzhFE8kKhbNj9qp
 QyzippOJ2cK5bFh1mdbQ8My9DB/f1+jwAJdde0EaA0brt6tw6bzMxzQqryYECqMl/e2AC6MqgLD
 3o3EygZb+gwBCjcLLCQSXpaNkkbzzjiFOr4uiSato8UR4ZSzVNiSPk/QFtCBBxc5IOSH9up9TfP
 mkdEHGqbmeCZiGf6m6g==
X-Proofpoint-GUID: 4udPHv3lNOgLbA6_LRfqss9Jv5U5L4xv
X-Proofpoint-ORIG-GUID: 4udPHv3lNOgLbA6_LRfqss9Jv5U5L4xv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX/ssyD0tutt3c
 jjxK0tdEdW2qjPnf6J9vcNFJmWmfJQun5D2wPNKPHDz2yD4cQbgAwiRh5EfDAX4MyTtCMvq40Tl
 pQhXt9Ri465iPs9W5Yc4jWKO9vkZMQw=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1fa9b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=kdm4YS7hd6rvY0lC6QsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160041

On 10/3/26 7:56 PM, Richard Acayan wrote:
> Add the digital WCD audio codec to the SDM670 device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index 038ef0f73ea9..91188acd16b1 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -21,6 +21,7 @@
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,apr.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -2541,5 +2542,19 @@ data2-pins {
>  				};
>  			};
>  		};
> +
> +		lpass_codec: audio-codec@62ec0000 {
> +			compatible = "qcom,sdm670-wcd-digital-codec",
> +				     "qcom,msm8916-wcd-digital-codec";
> +			reg = <0 0x62ec0000 0 0x400>;
> +
> +			clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +			clock-names = "mclk";

This clock configuration is forbidden according to bindings

I'm not expert in audio, but an LLM points me towards
LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE

Konrad
