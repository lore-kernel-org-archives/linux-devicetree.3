Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4C640B6D7
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 12:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047355; cv=none; b=J3Jk6wP2y96hkRmgdIi9uIncYmbDJPA6HF5eyK3T55AvQ+aUVeoD3pRlHWopWngs4k5zhj9XKywm3G0Q7ezM7cJrPQ6lZMBbpZFwIPWaaYZW5mn1av6eAX3IHk88JXhD7zEqHcbWLC3pTnUsfQmfMGWf+93IAC9DRAO86Caz7Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047355; c=relaxed/simple;
	bh=4VNHkZet48HIA2G/oH/xkP9Weg9tgt41vv9HSbBAhjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XTKDkpM2Z6Ga37h/yynyFGHWx6nJOTUZXAlD/ka85fzO8Z+BBMJtyRxwCHhulJdTXFubtzNjzHDShZ84Zt26r6dQotuNLd9H1Ti/tPaYFXUYw1T065N79G0Gby5sws47BW0TuN4ACETe3rLFaMbSToyXCkWYCGaOmSey+bRMWL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWt649Uz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNYKuYnq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWt649Uz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNYKuYnq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317ggrw3081367
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 12:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/CF3jd62K2yODNXgedE8GfJWOLLfjuHXI297xrBahwU=; b=lWt649UzlOP3AvzP
	mYPRppee0Q8pN2qFrKGGbVLbAU9U964rFaro1iEEbqlA4UcqZWulX0EdiimjUb3y
	8VkRNC4kbIXvjdcEf96lFirscvl2siaHsAFi4ziFVGQlgsMzotGUYKkyos1o0CM0
	hLMfJNdm9x44Krb7gwkdFoFchnyizpWi9hTyv+DX82dfFrEqwT2MZfr24YVqD3Wl
	HG+Ztfga+wFob28SO124k/YhRgo9RHdThIKDQd0i4Uhz/rTnKzMcDY152pGWfHEn
	HbbCouXP4wfsiaOkIPiPtuS4WziacNE/5LM+/Et6CpSDbHdiZtvbUv8PO89XuJTi
	nu0wxw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkv5ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 12:42:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7414516609so4290292a12.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 05:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047351; x=1775652151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/CF3jd62K2yODNXgedE8GfJWOLLfjuHXI297xrBahwU=;
        b=bNYKuYnq0zjaHuCPfunc2TBqXVqSXPM2LqHvu05s7dDB4JJvz5LgNcWGFrNQ0nWWsu
         aMVFPogzBqp1/anf8CReZxkRVt4gyN9wK5m/lIMqCLl/nrg8jILjIh7qt9vYEilPbTI7
         bbJoj9Gb3KntGcqK7m8KNcBNKqwXbmrvHcyFLO3sKrZtj1pF7YuOLe+NR+TWpYgO/CQX
         LNnzhwwybqDYDxMtGhqZwPgX5oliAxGL8hmXjcWbCxXsZPi06jvLmRlKZBGQtPGz5cdb
         vCBfadbATK1Q3/SwVoGKg+Rgr2stlpBmKnfis/jZCyZ72D6UJdqDjoefeYJgyskmeX0d
         vMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047351; x=1775652151;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CF3jd62K2yODNXgedE8GfJWOLLfjuHXI297xrBahwU=;
        b=evuIr6eoDPVHabRtOh/Pvu8llJ+MFnuhMnou0DUAZLPbou7vXa4jVcDGrBP4rcVvzQ
         XYqzZpImCiR74guZxQfLQUS8W472ZPPUMC8PIVyI3eNiQQNabB54Ws5tIOvIOuVnG3wK
         d7uStLXM9SdbdD4ObASUk/0KzYw+NU/sKTnkSWTFtUVcUq+oaueZo2oJEHHEyjrswAoA
         fBE6SaCGUsM6EjgP+hvyVh+MWuQFHhB2su4V5QtxtzrcLMgJVrswdGI9bpuwWBjIbKtg
         uAZNnk+Mw3dDlBVkMUkSoOq6tiDBnRHdCchxqFmqzZhPiUkBnsdCmbxRRqSrt1nIKNAG
         jY8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhKDFKKZnsUfaX3vT0AKVNLbVq3Cy0hL9FmJgZBniyiwwaFjZj+xyoai18UgQtyHYTLe/bgW+KbELi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2/l/KFbIwim6hQ1pLn1G48tfxS873W9Z14QQl9XcLbBkBLxny
	GEQ63/HpmzK8BxLuuHAw/8eNbR7i2Arhj/GcRaTSrrn8dlR2hO675XOiVPI9+Ct+mBP8u7cdPQ/
	lxCNuGKXlxwlx5HDoVNPMisN3DIonPWul9tCQccaqm5c8K8mS3+xF+LX0TY+umQsG
X-Gm-Gg: ATEYQzwFfOH2fu6twupEB8KxEKLjwqndECaaNZkmaDG4GSIkNhWQ31nyFDWBixn3vt6
	eVZXdSL7n8emQ1aU9SvUxgTTeiMax1WXKg6Gl2+yqrF53GIUGLtYOp16lUy7E5+yu2vx2hDTlvm
	tO3AY2CGW9922L1LhKch5ylNnQNZFgsHPYyq4mFudHOhOFDGW4kEfEl1DN1tYdjAfjm/uSWLmlY
	JlD4tKcvyexPJwwpl4TPihmF8XTMWH2TT1n/MeNR3FzS2+3tUV6PNZIP8ipADgOXG3UxSuwg66Y
	rHGDiZnqlm501nfGQM6fYTHUtSbCWCL/qCcWGVdpWVd2B5UO5FHn0XyhPUNiNk23zB5qpCu6bVP
	qjGB1be/U7/2RBZXxRX0R2LiAErdLJ/9ybmoq1l0TFbejCSNxvXbqBA==
X-Received: by 2002:a05:6a20:431c:b0:39b:da83:91b8 with SMTP id adf61e73a8af0-39ef775965cmr3890481637.53.1775047350937;
        Wed, 01 Apr 2026 05:42:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:431c:b0:39b:da83:91b8 with SMTP id adf61e73a8af0-39ef775965cmr3890441637.53.1775047350486;
        Wed, 01 Apr 2026 05:42:30 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76917db47esm11859657a12.31.2026.04.01.05.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 05:42:30 -0700 (PDT)
Message-ID: <9f94af36-6460-c227-2735-628e45819a03@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 18:12:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-5-ca784552a3e9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260401-enable_iris_on_purwa-v4-5-ca784552a3e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExNyBTYWx0ZWRfX26Nmj50RZl04
 Q0V7DX56Qm+8tWmnpnZH2yAck9e9Ka6Fbmpm4U9vzWvAXwOyi2jzYGSiD11MPh9lz3mNWWXJv5u
 yWJn6miCMgubYWswMjzeTjg9Ca+O/WkFkl0O1V0CtSitCNVYF2cXSiK9vzbU8Bo10wRZxe+RPwP
 5wEYzaz9lReE8KyVoUMb0Fur75igXTqZ7xhuKwMErI9/YjRFdIneter+LgnYkuPH6kGB29UHsTq
 rXNRRGCZRL0FD7ifalHSK36qknUJ+1vD+msjHCQu4yAUw0esQFTlPc/sY6Sja2TJQT7tCvNnaWn
 JvTAzUdGJWu2uieGRfplSw30+O+fyAlj8F1XdI514en6ujjUZ9yqVEuC+VZ3k2q2jjktoXOCs8i
 6D6HST325y7m3iJXeD+gY29lSPzWWapvy04E3fWdwPv0v8a6Cm5oo4SF0Z1fZdO8xcstgy5UaBc
 9jIwGyOzMTHiy5+URyw==
X-Proofpoint-GUID: KoqT88mE9wTwbSKdfsFWX5b0GN_qrs0z
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69cd12b7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qPc0ztvaS6VGMkP7hJMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: KoqT88mE9wTwbSKdfsFWX5b0GN_qrs0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010117



On 4/1/2026 3:54 PM, Wangao Wang wrote:
> Enable video nodes on the purwa-iot-som board.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> index 394e65518ac5037e5c7c50583acefc0dbc8ebb47..ff8621f8750584636ad781467f9c35ace2354e4c 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> @@ -389,6 +389,10 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
>  };
>  
> +&iris {
> +	status = "okay";
> +};
> +
>  &pcie3 {
>  	pinctrl-0 = <&pcie3_default>;
>  	pinctrl-names = "default";
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
