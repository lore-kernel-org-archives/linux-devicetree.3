Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1764A4419
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061202; cv=none; b=aQF2Qe/jXqkcOjvhklXoikLLochLEzfRro3Kf19BjYdCJSn5f1QoyeZdYK+Rw4H8bl613F/DFnL2uEKFH5I41EtoGs/HJokM+VXVXaokLE2PuUsnioUQ2o6sCwct9sinjLNekaTgxccSnICJ84+S37M3sweLoZ4h41fpVmbX/CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061202; c=relaxed/simple;
	bh=U1q43G4HCUuJEm3Hrn1Hb4qMjzzjMUZBhCiLJI/TqEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIHAyFCffCFLH1vr82Noq3m/fa03jakfMFeCVJ6nVN2YYqVc85xAvrDzhTZlos9thKX+tmRfGhEShiHZpGXBBhyJJ5Kpd2rYv1pIaD/JBPm28wNIo+nEfRoDuL2wdvq5FlNRIa1TBQKU62EQ5MEUW5hDmMkDbjmMOyh4Sw63JDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVJh1QPE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bdEA58P6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVJh1QPE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bdEA58P6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jkB33510586
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O18SBrU7L9QrFSh6HrVkIKkdn/UBtVI5QfKtA2OKja4=; b=AVJh1QPEE1xL6NOU
	5JA6WjsNz3q6/xIgMbFw/5D2DZPNozgYtissPFIO7qxyrQ7h49jiNzo3c6vVYzGb
	JpNhxsXQys3NRPOrODWN1I8k9FbuKdKi9mMZdk5Re1gkY0PERpFDd8MlSbrRZqnH
	qHjYkFnZ1hN0DbHD/xmp83kuJZkJGVzCET+nYRY1GuSzVyOyitOsSVw6p1/rgy9m
	ZZ4p456kwgfO3Cfe7PO2a7Kk5xN/BqEeXo3A2MsPDXFpahnz+twYMsHv2IF0K3Uj
	EdTgi5lpTYkNSdQp/GVbD4xygxxISzvRpCHU6cadfLyfHYTBy1XpKc1CmXGPfpv/
	jYSeSA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds9m5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:46:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so89661585a.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061199; x=1792665999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O18SBrU7L9QrFSh6HrVkIKkdn/UBtVI5QfKtA2OKja4=;
        b=bdEA58P6wWv9E8fn5LSe5fZTIPXneqHThxnRnXCLm8hpXzVKnU9EkrVqBLHYXTseY9
         L6/X0ycHXewICqWsWursq7V5yAgwoQSebJwjOTzqGnG4X0LlgI3Ps6vJ3HvTgC5MCSzY
         eiNqhRbXfZo7xZgxVoRGaw6xbMVgtEicoxf6lLTiOFAmXh4CJpRumjIlesqRfeBXKFYf
         fnLeVf6/ER/f9N7vA9DlIvHKvng5tYOeSnnqn8Wd6v4f/QuNLdglSm05qbPEPK+FbzK2
         pUkdqrKTVTrmFVQUC3maVaNBMOeFPYhBM6W+GCDHrghbahQzu8H0e24PE7sIJU8gX+hq
         nssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061199; x=1792665999;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O18SBrU7L9QrFSh6HrVkIKkdn/UBtVI5QfKtA2OKja4=;
        b=oUwRnuXV7QyAFYDqzDmrB1NPRJzgpzcsVJ9jICawrmH9EMMZRmzM5iKNShZ7sELeb+
         AP6wYoDezu4Y76WYCBVAZ5HgLE6IeS0xI4zcg+UtP9wa9FHlmWfCCy8DGV7i2W46y2ec
         /0q8TXsCz8RWhxUWFqcf8ZNdzPwlrfL7qo5ghGriaziy5Vr9p4a4/0GUj2LpaTsgxmaF
         uKcw0s4yASRZIMRgoG4k1A3XGy/MGPZ7Ay8h55ckO4EUqB+tLftE3FVDrgSTJZiPJ6CB
         q96gro4RtBDqbTZ9ALOKqTrOG4A2MOio9/gj+tVZC/NPRIQoAwe8mxR5bYJzKaQJmstq
         bMWw==
X-Forwarded-Encrypted: i=1; AKwUvBxCxdWrmacLzT2Qu3mJLM1H+n2dk0mOnmAd8y3JV/xZrnvcZJHYQV+pIbtDXfLr0zBikKM46YJarfm5@vger.kernel.org
X-Gm-Message-State: AFq9FYI5e+1BrupQQK/W8tY11rCfXbBcRw3mfExjYN8tvTfbvoyY+yPF
	FM+yKAa2AQmycMymnXYqVba6HhWNKtxJtZ0gKHJCOJQHw2XVrET3Ug/3l7HryWyYxa33PhntzPu
	DWCyorE7mfJ3LM5E30+0CopPMbvqQD6VOZhmz/mM/KMFnhYigAX1WIGJ/EqjMJLC3
X-Gm-Gg: AYBFou3zA2BF1EmApQ7wnBWDvc3ZSZkvgH2MvDDYH0nuyNvkjKotqoPIFk5HTEnJagG
	boj+wrWlX6RmlpoZapRs1kAjvST7TJxqn4yf/XLLsfbmLgmrYTihQ1JXEJNr7XSJ6ApVXIfnug5
	+k1SKlY6uH/QmkgUGWzz4BzUmEDn+y/2VyyDQrQ88D6tHobDR/kd4f1QreuA4OhgXMGnEgzH6gt
	l651ykWKrcCZ1e/xxhpfHVp2/W0wEZsGGg6jo25aJ+/xPDqwIi0Z1HKCgBmatWzpD5Jp/B5D2Pr
	wqWyLTkjULkIvKARNP0I6xUTqdb6H9jRewOMwlb5iFcnzEwfJfvIdAtzYS3Q1fweD/0+VFKxnvz
	1oue48MmopU/gn4gZD7ZOjA==
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3116764785a.0.1792061198989;
        Thu, 15 Oct 2026 03:46:38 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3116762485a.0.1792061198512;
        Thu, 15 Oct 2026 03:46:38 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda62d2ebsm107780266b.74.2026.10.15.03.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:46:37 -0700 (PDT)
Message-ID: <0f3f754b-c612-406e-9d35-6966e64a876a@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:46:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] arm64: dts: qcom: sm6350-lena: Add flash LED
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-1-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-1-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LgCj6CNlXQ_UQ-zMXnzBS8oCe_-kBduL
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0af0f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=JgZe5hknAAAA:8 a=INp5xvtxXxILuIktMPQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX1na48fJWBwjt
 EwkLVVtQbAPYx/nBOfMWKOFQ6kqLEjbJNlD/DE82SGM5HVqVsENDl0JqwHF+abJVNuBvMXqZJoP
 By2hWQX8JEMv6bT8lmShyy/ADY3SbUV3SyACZZqpVqedBUfey8szrgsEvNn5Ffb3e/+XdrZSMIs
 GVGxpXs4DqIQLaoOHYvyP7zvr4fSIBHuEfCno7YKIks9/evSuFvLjMVCgs6+D/t0Sqt/mgRcftZ
 yW+rIxboTSfnxdXd0l8zBqkLeAZ0TycAjYNKT8+lmct8opA61/kYSwovp4CR0YMFsTGtZ679b6V
 AWj8u/vO3+kK0l7EVurcGrXC3s6bjwSQGXAmXG38jFXT9KRNCMckiuUtON7Q1gn76GSUWyIbEV4
 bSmjzzgsWEiz6jQhJWq5PbcpVjgCpXacp4lC9wWEwBNg7LzntbhWyeKDJfTasThiDkxlnHReEL7
 KFylftJRnx2qDbn4tXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfXy9uyp6kObmYn
 wKufDSWgRamoiv9GfRe/T3rsHXdEwtT6bvRLr5mI2z7zFT4iEW8S2hFFKkw2rmoZlFvXsU+vvFF
 hn9jEBDcDjlS3tBW5LZqA/xCY1LFJ9I=
X-Proofpoint-GUID: LgCj6CNlXQ_UQ-zMXnzBS8oCe_-kBduL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150042

On 9/26/26 4:00 PM, erebion wrote:
> Add a node for the camera flash LED found on the Xperia 10 III
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts      | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 6e2bbf4f060ac..79aa2521aed40 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -4,9 +4,11 @@
>   */
>  /dts-v1/;
>  
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sm6350.dtsi"
> +#include "pm6150l.dtsi"
>  #include "pm6350.dtsi"
>  
>  / {
> @@ -302,6 +304,19 @@ touchscreen@48 {
>  	};
>  };
>  
> +&pm6150l_flash {
> +	status = "okay";
> +
> +	led-0 {
> +		function = LED_FUNCTION_FLASH;
> +		color = <LED_COLOR_ID_WHITE>;
> +		led-sources = <1>;
> +		led-max-microamp = <180000>;

GPT suggests 500mA here

> +		flash-max-microamp = <1000000>;

and 1500 here

but the downstream DT is noisy.. please verify once again

Konrad
