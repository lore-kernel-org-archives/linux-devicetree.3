Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFAA42B744
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558218; cv=none; b=Aqu4cogQpTNXLMP8fbcYH4GknqCq3z1AjAhMNaEIuT8nBSbohXE/NgkgygWjb8+aevxGaPnphu1U9rM402F5FgwghHRiing1tSmVcSMyT6ImRlJekheKfFy/l+DbVRyd9c0OhhrzPTJiIabCYHnzvw4DVWxB5SQYPiOAf4xv6U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558218; c=relaxed/simple;
	bh=9fADcY9rUK71HAnuEZuDmRCIQA3SpQyvl/keIDGR1Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNq2Cb64Qr8QcZHdWrJqCGRQzTxgH8H15R7lqUeZB4GQetejz84uNV70nyBblf+i5xEPofvZzjsouGSUTLQZIINJ5vvqJVs1EbYYIcVpiHrmCbe7zcgC7yFncTHIxIPW507wXqZq/cFF5QAJYTEhevD0xgpE1iHGhw1yPD5zsNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKjp3bN1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctVrBJE8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKjp3bN1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctVrBJE8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UALT0f3729488
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 14:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1GKT2qy4wjJi9yQ7DHur1ft3/ZgwzF6cznSCLmmK8hc=; b=WKjp3bN1Ofy4LHPr
	0dW0TZhuIzOJefjYVwItcKhzITqWCfkdyxowo1/hi4cHAczACxuvivvGjuzIJoXF
	uU3zyLJhDzVSQlunp/WOkSt6MuCpN583I4ageT6HdoYx2K7rIYF2kdLAYdD5QLdO
	iqRT3GaKChHTVr+jGvegmRd9LlQidDE5wjDRCQ7Iku6vp/NSiJlX3WClysL6wpJL
	TIILm+WdROf/HsSdn7c88OhpF87kkKuATMqVklDjwRfBsNUuMQnAFHrSG8GhbvPh
	+ru/Qp3VpI9u4Qr6JFShAZrL29p7EsmfMsv+LgboppAkGZpeTD6OgJvca5Qzi1eF
	2CXveA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duy1wan4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 14:10:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-611bf61a809so67716137.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777558214; x=1778163014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1GKT2qy4wjJi9yQ7DHur1ft3/ZgwzF6cznSCLmmK8hc=;
        b=ctVrBJE8NQP+Eu+7BEfbzdNNWDHSVhj1nMfOlSGnXOxcAPiijGEdo0QjISofUeMRW3
         4Gb9d9BLJmDLXC1H7W7uJZXSUCa4w2QFTS2MJwgKfCoUoMCWJcFRWi1Cjzdm/v5IATyv
         WHmQgdPHex742WFcRkd1S2gLBatVoJOMxGpUAFMoetP9F9XZ8lkJc8tf9bhiyYf3yk3A
         ahDfNMA8LlhnhsNGOtfiz6CJpxFrJSw4loRpIZdveRWm+rR0qyOp4s8yu38jvnsp+XfW
         DNb90o2Qks34LPGkxHUFnw7U2mN/aIh8A39AZu4RPQq+HNWcRqzEu+efoXVpuW9nbaBa
         rbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777558214; x=1778163014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GKT2qy4wjJi9yQ7DHur1ft3/ZgwzF6cznSCLmmK8hc=;
        b=ECE1d/f0FrliDQllw1NdLW91kcRzn3VymxTYN5ZzOuNBYeSldh7Vl4wuJLrlsAHlrq
         WM7w+2zqZA3tBjCbcxXbHgBdPi/ht5ttq5A5bb+F2REZ0pembLB/8h9yFtNmaPTx/jFk
         kyh9AJ5mMeiWQY1aNdnKAlnu0xH0aHk0TurhfGnn0PQW2PzTaI4pJ2Sval0CZppbHWu+
         F+Umt1Pm9YjAm1cgzTp9gNuwud2/1AkqR/ew7flKFvSPIX+VMwxNvZF2rzhMf+GVs12R
         8Bw7EJJ2iUS+xOPlhdu0h5fQe/1rmaGpMmioyTm2xYFb/JKD6iImIw54TxmVxg0W8LM4
         YBJA==
X-Forwarded-Encrypted: i=1; AFNElJ89sqH0xoPgN9r+XghdTUFF/VNz5zL5oaJ+DeXyGqcu5xcWYrayEA5p/Uk7rI3avanuFOcTsBOL0Pze@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3HwCwwM2Ama1G56zDdPqeZ5G2FCc/KmCPh2S8qm0GfzFMQpMz
	iu/lCMTb/rkS29W2ZgdeGO0xeQdxUuzz+AJR6eftNwm+wUQH8byNU1H1H0NIVDP1WkpGQw8X2bc
	OwzZai91tTOGQAWv+SiqQAO7ejkiiHRmyjoKbyWYY5y9yhxYjFxQe9xTqkqlyJBkd
X-Gm-Gg: AeBDieuI/SiUrlTqSxc8y+nkakb3NMWgJXyb7tALJuoc3YkwcCSVFRSHEiUATPUFgFi
	CpQcfrHyhuWaBCgu3t2285VLizEcale/8I8xH5y1nuMVd7gGvgoPX6vAwlJnuWpOZOEaQxGhX3U
	cDTKFnA34vS+jK4Dxq9dXWV/bWgFeXqt/5AbftxltYndc1hRUtjoarzgSIbkuxMokH9R6fR2czd
	uda6YOkKB+Q4SkVnJ+BvAECfKMUb0RCc/uxvbhmez+330h/PbzF1wWtNisz6VP3R2sbZwi9JXgJ
	9hNUpCgpz+cNqv7xTsnfyFqL7Zs54xL2MlPTslvNlN5OmWbZsoiLPQnij166RygrUAJKtHdtdz6
	4nSK9dtXVWDQJtVroYf0C+5Q7d4RNdYU2FrSNemzD/NEcsbi74Pv46FZtQVLkADGwMeasNgqni3
	vwt4xvQY77AZd8EQ==
X-Received: by 2002:a05:6102:c0a:b0:611:5301:7f35 with SMTP id ada2fe7eead31-62ad263438fmr606889137.1.1777558214054;
        Thu, 30 Apr 2026 07:10:14 -0700 (PDT)
X-Received: by 2002:a05:6102:c0a:b0:611:5301:7f35 with SMTP id ada2fe7eead31-62ad263438fmr606855137.1.1777558213535;
        Thu, 30 Apr 2026 07:10:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b22154e8dsm1878514a12.17.2026.04.30.07.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:10:11 -0700 (PDT)
Message-ID: <db701e8b-a405-4105-9b5e-b2add3827d83@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 16:10:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: qcom: imola: Move analogix video/audio output
 to dtso
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, broonie@kernel.org
Cc: linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
        m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com,
        loic.poulain@oss.qualcomm.com, Riccardo Mereu <r.mereu@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-3-r.mereu.kernel@arduino.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430132140.30369-3-r.mereu.kernel@arduino.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lxKFrc1J81q9bEO19TnRTJJlgGBVggvo
X-Proofpoint-ORIG-GUID: lxKFrc1J81q9bEO19TnRTJJlgGBVggvo
X-Authority-Analysis: v=2.4 cv=DPy/JSNb c=1 sm=1 tr=0 ts=69f362c7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=fTA6t2aXeJjKA9saunEA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE0NSBTYWx0ZWRfX1YwxK1j3kBv/
 Gk06SeEZErw82O2mAuVLp+ThV586qc5whjhwHV67yphfzpyAaPNxJ+lnQ2AQhvAv/lLzzQb5NQB
 Ovh2X/FMQJJ+W1r40V8w2oL5aWmL1YA6zCCVrm3tSIXKV6z364v1o9Dz6uEemSw1yLFqqXXWO3o
 306Ofh3QH1+JQt3pnxdWgJ9SCXKsKtpCycoLq1GCYpy+86G3a/tjdTjyrjaDYzaBAGnnxLW0JiF
 UQ4WZfSQQcWbM5weUokDFQj+0g2/5slGA3IqNKPQEysYgH/GYL/mzGufqJ3b6kayqTouFjBQLHq
 OciWwl2WXbNV2iea6cxi29vFAyAkTg00YP9kmX1h+NFp9Bk5ShwETcQsezgt3Pjice7Xk9xrWzN
 Sm5GTiIAg1FaIux+Bv+LoDEVTjWPQiitfCFdzfJBLcWzdLP7vYU/S/2JOi4w3fyMYud6st0PBmT
 /y8zkL5VGsV0QSvnRuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300145

On 4/30/26 3:21 PM, Riccardo Mereu wrote:
> From: Riccardo Mereu <r.mereu@arduino.cc>
> 
> This is done in order to support different video output over DSI.
> Since audio part is linked to Analogix USB-C controller it is moved to
> the same DTSO.
> 
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---

[...]

> +	sound: sound {
> +		compatible = "qcom,qrb2210-sndcard";
> +		model = "Arduino-Imola-HPH-LOUT";
> +		audio-routing =	"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"AMIC2", "MIC BIAS2";

The commit message doesn't mention wiring this up, please split adding
new features

[...]

> +		mm3-dai-link {
> +			link-name = "MultiMedia3";
> +
> +			cpu {
> +				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;

some of these have a double-space, please fix them up

[...]

> +		hph-playback-dai-link {
> +			link-name = "HPH Playback";
> +			cpu {

Let's keep a \n between the last property and the following subnode, file-wide

> +				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
> +			};
> +
> +			platform {

'co'dec < 'cp'u < 'p'latform, please

Konrad
