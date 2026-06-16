Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B393DDDD5
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 19:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781638866; cv=none; b=JYKpebJ2jLueIXsuO++8jJ7RJty03Mzyq7QXS86ojoj2Ly0PCLupi2FAi+H2TxW6YfynQar09Uv8Cl/rxFtPWDd5BJtRiMijQ9ZdE79GfbBenXNt/k74mu8v3VG3x8aoYNVViQB8LqLqlsTXHtAxP6g4+UJDgUb7LeMhsya+G7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781638866; c=relaxed/simple;
	bh=B2hR+bURmRb4PJ7gNBtKoGW9dYPPdu/+oY5IxF3NI1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iG4UtFjODG3ghrdpnMlNAAywYZRw1aFBXJeLRNKK62WjW/yfjYDDZP8XeG27OdP+FrdexeMcEtSm+nT5BRyjpdjfpFXVmxZAmbSr6DrI4P9lvYVWndLoXLZFzs+i63bAeRnlyFzb8aWcgHO66kXneE4J5ViWFGl6zXyeWmNd/mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+fjcKc/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECk65HiQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+fjcKc/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECk65HiQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIORlq3965418
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 19:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJE6juJXrAOTycGAzZRvBROMXZe5ee5HGfivbSaWOLg=; b=D+fjcKc/HTBSpNvQ
	dn1aUCnv4/4gYrHonSYpW4J+P0YvhEQn3yQx8D1M82AKii2gRaVAlpVR2JyRlf2T
	N/oUzT6zI0gMfpksOXpFBZOZXbopaJHLxIdqU/PKlR0f6hO+BRN7mKxYCzsvdqxK
	qIKzdSyYcMHAeIdJlJhiWtz9jNH4hES27C6TCyDAFo8aJOe95tBqBvbPcEaFVRPc
	joEfQOrsbrMiRPwHoc1YbkNVaej8khLQQtUUEG65fnWtIGdhXSeDv3DQ9AGYtigk
	JTyhN8RrGDHmdme0BrELsch6GRrL8mmMw0D4q8RAM/sb7y16iLKT6L8LLlI+uHwj
	HVDExA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etx8kcgab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 19:41:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9156cb14b1cso517224885a.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781638863; x=1782243663; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zJE6juJXrAOTycGAzZRvBROMXZe5ee5HGfivbSaWOLg=;
        b=ECk65HiQLyGtUiMAuLCGlsfxH2ofLPYm2CzXk8skFgV4sf2Mi4Wa+d2oO74LRyOK6k
         LNSFfBEv7pwm3QyKhDNDwB+pm+S3ThFHBBK8Z6CXtNho0s2gzWcwJ/jhWSUgX+LHSvXH
         AfKdop1ry8YtGuQJ5pFugaIIgtvNrSXTZJp9PD+IyYT8SzSKCsOE7ej2vFxl6I5FU81d
         g3u4bNlkCHl4wA8Sbntmphs8ZaAZkN4jibAzrZQUDH769lDGDVnlh15v7b1eH89JCW9J
         0xV86/kOiRwaMuoAdq2s4zlSPSoHnrUt09WznxD5dCsniuF77PDFdI5mPXFbGpcr/4wi
         1kGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781638863; x=1782243663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJE6juJXrAOTycGAzZRvBROMXZe5ee5HGfivbSaWOLg=;
        b=soFwxKlVFXhzuMvLUjCWybmM92eGU9qvHEsv9zWcyLTOHco5EeN4IyAaL6UUXpcUVt
         Jjf1Zy15PvzWsC6mrGc/NxywCbqjUETlwLWuduRxlN95MAI7NCShZ2vRDgs5i/IZVC5y
         x2Qm0bw0HTH/FDbdwwAMnyo88sy1G4o2epnec98NSmLZdQSUyhVCw1wjOt1nnf4PG/ZP
         9tp4umaeOjioJkMjBbdg+me4+T7ZN0NCvxp46pZn0jqz5vW/kcC4R3L8WZvSQbL0SlnP
         TXOcimU9T5SYJngrhdiVuCVxHCrkGNYavRLAQl/oKrEzO1GSnx4P2AtMeOT1dDyI7kZQ
         0tkg==
X-Forwarded-Encrypted: i=1; AFNElJ8zwTG/rBcKQ4dtF1ZT54ah2oHtzulyEONwfHc8ygvEv1rDw3k5uX7j7nQThJDdxMATrZt2r7Kt1Poc@vger.kernel.org
X-Gm-Message-State: AOJu0YxsJrQnKtm0+UI0lrnQihinP1eB0iajI4f9A9uH0UR6NUflKlSB
	VICCnpT/jSdjcfAJWqntslZlL5KQrTIYyG1zHiJ/815xc6S+may8tRZ53eN2ADRwD3C1cVF5kWC
	w0sxFeuz/Q/gz10M6y3gOfr/0zBnFVeho2FZcGUR7VddXSIvORQYY1m4RgnQX2+Lt
X-Gm-Gg: Acq92OFoufRcICkmCitmivEXmlVIKycgvqPn5ujXF26KL03UK8jJCLCrV1QHp9C5she
	9EI3gkaVw8Vg0nSFVTUT3lAVvd0xENq1lpBmA+Ts1jVxAgBOZo7VL1a825Hho6dE+IsDk9ppUKq
	WIUWR8qveOrCCnOMEO+RYnATimMntm1qwf7fsJWeacnJyNPyGtAlKlPXeNnC7zwytZnnnyGUh6+
	XXKWsTjNliRxAc9ZpNaLQAmAk/u6bbjP0u1SC2lABdYWQQTq53xBfpRbkJlXcoyRoL3YsGwC1xm
	Bw7qWGMsZDxeCa2K4s29vtgJRyqXRovdVI09Dfweli2WOqZIZNS5MlrMtPZG061rXxiQx27K8n+
	j++uvICo/nCaEKCJOcGD0HnV1STDk/4X9fWIJoss0CHllrMi3
X-Received: by 2002:a05:620a:258e:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-91d8eb91c37mr198745085a.54.1781638862592;
        Tue, 16 Jun 2026 12:41:02 -0700 (PDT)
X-Received: by 2002:a05:620a:258e:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-91d8eb91c37mr198736685a.54.1781638862055;
        Tue, 16 Jun 2026 12:41:02 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4922fa8b423sm101047675e9.11.2026.06.16.12.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 12:41:01 -0700 (PDT)
Message-ID: <b9423112-9b22-4128-a00e-6c60e5423db9@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 20:41:00 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ASoC: qcom: qdsp6: q6prm: add the missing MCLK clock
 IDs
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, rosh@debian.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
 <20260607-rubikpi-next-20260605-v1-3-7f334e16fea6@thundersoft.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260607-rubikpi-next-20260605-v1-3-7f334e16fea6@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwMCBTYWx0ZWRfXwydNkM1aScR2
 9P/EAW1yhnv94jsSm+/jHSkDKxN1OyP8ErAE0fJDr0gJUmJzuL+GjMCy17rgxxEM/NDLY1KLCQo
 iFhEyLvFKKUPrzs+y1IwBW/JgrO+jF4Mw1UUc2xWQFcw09+25R//y5UyB0NTYdXC8vd2F7r+17w
 CQJ9KaOwOkfoS0MVK2CSsp0srduqgiuTB2QiF53SW0yqFxH36nfOKFylpzUlHpk3tI0lI6JHYum
 uOekal8/oQUov8x9tG52fcD1B8NHnLk8ytuB7vK/AxQmo7gb06dw6lEHTTqadDbCf+Th3FWuLn1
 YJZ2cn8ECEWWDSwBeK/aePEyPqch4qCS6gMgDk0ufGXR+Wsj4arGi4ZD/jjwRcZISikv8xTP+PE
 YayeEIaq//idJTkknJ4qhOFdk/kVtpxNZcB+Gs8sLOwwY5uky13v2XO+foHxwedumaWFFNwmyG1
 e3tku5W3CZ0QDIIrcFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwMCBTYWx0ZWRfX0KUJKt++xYAr
 Bmy+WiP7PhRNo2071aJQQJ8gLhzXkqz1OARkfQqs1iRILYsZhFthkhWAUARml4Q3AdjInx8n51X
 HhVWoanUId2uIWx65dcHZyP9mgPuhwY=
X-Proofpoint-ORIG-GUID: YquEETt1mx6tqVUvjCtT4skqu1QwxF09
X-Authority-Analysis: v=2.4 cv=dZawG3Xe c=1 sm=1 tr=0 ts=6a31a6cf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=yzDfqMvfRze0HbsUX0EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YquEETt1mx6tqVUvjCtT4skqu1QwxF09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160200



On 6/6/26 7:58 PM, Hongyang Zhao wrote:
> From: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Add the missing MCLK ids for the q6prm DSP interface.
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

please add your signed-off here

for more info take a look at
Documentation/process/submitting-patches.rst

> ---
>  sound/soc/qcom/qdsp6/q6prm-clocks.c |  5 +++++
>  sound/soc/qcom/qdsp6/q6prm.h        | 11 +++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> index 4c574b48ab00..51b131fa9531 100644
> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> @@ -42,6 +42,11 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>  	Q6PRM_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
>  	Q6PRM_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
>  	Q6PRM_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_1),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_2),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_3),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_4),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_5),
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
> diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
> index a988a32086fe..6917e70bcb8a 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.h
> +++ b/sound/soc/qcom/qdsp6/q6prm.h
> @@ -52,6 +52,17 @@
>  /* Clock ID for QUINARY MI2S OSR CLK  */
>  #define Q6PRM_LPASS_CLK_ID_QUI_MI2S_OSR                         0x116
>  
> +/* Clock ID for MCLK1 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_1                                 0x300
> +/* Clock ID for MCLK2 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_2                                 0x301
> +/* Clock ID for MCLK3 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_3                                 0x302
> +/* Clock ID for MCLK4 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_4                                 0x303
> +/* Clock ID for MCLK5 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_5                                 0x304
> +
>  #define Q6PRM_LPASS_CLK_ID_WSA_CORE_MCLK			0x305
>  #define Q6PRM_LPASS_CLK_ID_WSA_CORE_NPL_MCLK			0x306
>  
> 

