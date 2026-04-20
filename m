Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1429938C414
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776676890; cv=none; b=fCEPN8M2ly9zXMOuPZ/erBR1YtYqGm0uZO+U+G8XOmVN5A1vHBtNCs9I8Z0z5ZgHDAmLMrFCcZUAPG8D3Wpx//cPKHAHb6qllTq4Mg9W4WxfWqEfYro46RxW/W0WZpanAr1axw8uPrAB1X0xZ/wFFWz6XTh0J1aCEm06lOzGbo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776676890; c=relaxed/simple;
	bh=fFkqXe0fXUxiRzVl60VHLVC3FqHlD9EMGxP5bZKaNW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CcwXAWVKQtIR/lIoR0usgZ2pUExrB0pJ+W7kMvnC0HNuX5iaffvfgfMcqA0UA7lQDj4Ys2VxBtlqfEhZGsocMnvxYg5Bz/1CEjMigBwrdVFjjo257DwcBDsehdfrswzj0GbNHDXO9vdbdqOfNjBbp7iq/RkZJXvgRVvdOQTux2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQIzNxog; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnMXHX6X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQIzNxog";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnMXHX6X"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K70JlA3212158
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x7Fv9i51vjat96fgAqnutQphDizXtxDgsL90vRu2EmE=; b=aQIzNxogUV0yuW2o
	wvnNM0F6aWkDYnpKhYFWYlZGzCotaOLJTYTTEd3HFLYChTOsSr6fxsQqS4kF8xp4
	gMzj0JaueCTwk7TaG1qhnxdxW+wXzH38BB968g7ESp9qEG6iG6vlqilx0pVUXzQ8
	xUj7akofbdFbiig2+bVZMkPt6RYtALsRICMIUcGPy1rH17XfXSvt/6S74j0hxhtd
	Ot5YIsGEte27tQmnJkAXvepn6ir56uJdLcrRo/iGUEl20/W7mT70oWuympUWslpA
	A06/1IeZftmj4hVoQITE9fdL29pD2lFvLiA5y1IFsW2tWxTGdhGotK7eL0cnV0jA
	tAPxuA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfgsfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:21:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5c781193so259971cf.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776676887; x=1777281687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x7Fv9i51vjat96fgAqnutQphDizXtxDgsL90vRu2EmE=;
        b=AnMXHX6XbL6Lr0yqFipqcM93JNHZ1sjKRXCb4tpoRdK9id9zj4VzpsxMD4/jWvzp1J
         63uXPE3519VQG3/HBrbF4ZIweLMhzOgHr+aFxICa5CgVrbZQ2W00FSDV4pFmOcuHqBwQ
         IaFI1QirNvktF1vfBmDl/bTmB4ZoC58+2rPOBpn+zmXOaEjahk4DKHUapL5NWNkVqAjI
         qL2SjdUY/1IQryEV5u/62nEr+BjBwOwBmvGC6Etfnop4o5EPa8CIGpGreMEOo1BRavJW
         k83WStmG0zrqXYVkuKImcFS0YPsQWqzirGqwdxZN9J9tNDtFez94/uACfbshA63GBuPh
         z3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776676887; x=1777281687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7Fv9i51vjat96fgAqnutQphDizXtxDgsL90vRu2EmE=;
        b=dx2dryHGiGgjRPWBI84CJ2xaqO8GjKmvH4zwBjiqQIwkDXAGAgM1xX2ey94BfDa4yD
         NleL2MmNYp8byJBqmw4rwNqXrGuXvvQn4ELS73RUUUCgo5NaXzhHVk4YahJU1lu91sdu
         /IlPlrSmOupzWMaMENXMTeKVpLbKfV/YISQ5uLqIKZoH9I5CCF+wYfb0r5wa3RDrl+EL
         BuEb0zzz52AaoOO0XdPe7zmfCpDGbaJZIWLFw3ryrtcDVrtC2XKJSTqPCslNboj/2lwT
         +S7m6oHOaS2NdOmSlUhZ2OJv4LwOqyEM7wZPAjXqWaKmdPcEkWQnFNEJ+PaREt1Hw5Oh
         9EIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sm9+qJDYSXwNPyqiZL3HKoY9RozgcA/PR7fXFj9RcyaOXVnuxQW/bZaQxk5chIssHxvIb29YIjtIa@vger.kernel.org
X-Gm-Message-State: AOJu0YxD4cpsaWScQbouPO5QJ4g7jWlEziLWy4oJTQhjqdfZGI6EE+vc
	rWaGefTaaACvegv8WWf8xX388/WF/ehz8doARmcnLX3k6Fw4as0fvJagTSWp4BdjNrf9zOFsPbb
	KhkxJo6DPnRWDrl1RnlxZcebt94hz7ruEpwytK7GysNdd+GgWgrXQXLTx5ss4l3yN
X-Gm-Gg: AeBDiesp+/H+kXHcWxFhWh4kF4TV6YOncMEMmUXlbFcp0HMcR2nSimdHYkH9J6YRL2d
	U7SkOmF0UlxdEP/cJgSAXEEsvTBbMwrMZqRltYYqr7+4BFbxFB45c3nMoEf3KzJAkR6FB9ln7h0
	2HOV6vvaHcS6B4/5Hl01j/Ap0g3XcqwHEGQ3ZhvfD1+cgKNdjrQ+Keowcm5bL4BD8Q9fZd4afxR
	1Q0MoXcMNvbLc1NkOZo8JSSoYly7+kphYrm2i7pt/GGB2jGfwf+rYoCiFFZYxxXIPgCfhlWSZGB
	cdZju4aQn4J2js0NNcAeAy34iPLDKdKIevMvLp0DvjevBkQiDlsL5KK2/iE9JdZldmPq4UHYTBJ
	P3sN1B9cwSwDt4bxkhLKoBfDwvVmBbwouq2CvZGwhM+uMVlZY4sF3xHBAOIq0qpqITP+Sy+MAp3
	6uYcVCviP23cABlg==
X-Received: by 2002:a05:622a:4607:b0:50e:5ca9:d264 with SMTP id d75a77b69052e-50e5ca9d76bmr25335081cf.0.1776676887569;
        Mon, 20 Apr 2026 02:21:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4607:b0:50e:5ca9:d264 with SMTP id d75a77b69052e-50e5ca9d76bmr25334821cf.0.1776676887108;
        Mon, 20 Apr 2026 02:21:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba44e5749d9sm329205966b.0.2026.04.20.02.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 02:21:26 -0700 (PDT)
Message-ID: <77a87de7-3c66-44b5-9900-df8798d3074f@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:21:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: rpmh-regulator: Add RPMH regulator support
 for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com>
 <20260420072639.1249984-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420072639.1249984-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5MCBTYWx0ZWRfX+OQKeqUQAqhx
 x+zikj0uOvEnrl0PaPpTZEzOrvmbIzOka4+vEDmqn3/vw38Ggr/V6SJe4AuYrbhDS2ILdtpZvzV
 3+hMx5okU4rTUX9kTCeFPrvidxpXkV7Rgs7ZwdvkOrreVzbNrXvwDdxKHIJvbw4qDl3Z1wHVlAY
 Fqh56ZNMy73mDlR+zkuvkr6Z/CRnS6qAjjxKM5PqVwNys5D6puPAlUNOd83XDDKwI0cfU0j/4pN
 EZEEXYGPuEGe1NtERLLc7hjCfJxcr8HzhWqsZuRbnKzuNzxLmpfVcTiuwT8KSrdLFgrtHy98jvq
 5FwrXaRAt6yWFqV7VpdidhawYtb123SU2ODSBsxjX2VY5IHSfUIhYSQvGznAqcdgeUFRBSw4aIU
 iTJQzTpKZesh6nv3yh+5QX8wakm31XAzKidbZ3AdlreWLVD/WGufTybB+4K/qsizigo13CrjIvb
 iSGTIInxTwXoWKUZ0sw==
X-Proofpoint-ORIG-GUID: fGBv1Rumh3v0Llffi52MVtkva5yOVGCX
X-Proofpoint-GUID: fGBv1Rumh3v0Llffi52MVtkva5yOVGCX
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e5f018 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=igqXcL88txhuDdJxovwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200090

On 4/20/26 9:26 AM, Shawn Guo wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Add support for PMAU0102 PMIC voltage regulators which are present on
> Nord boards.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 6e4cb2871fca..9545300d7b03 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -1100,6 +1100,21 @@ static const struct rpmh_vreg_init_data pm8998_vreg_data[] = {
>  	{}
>  };
>  
> +static const struct rpmh_vreg_init_data pmau0102_vreg_data[] = {
> +	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps527,  "vdd-s1"),
> +	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_ftsmps527,  "vdd-s2"),
> +	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps527,  "vdd-s3"),
> +	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps527,  "vdd-s4"),
> +	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps527,  "vdd-s5"),
> +	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_ftsmps527,  "vdd-s6"),
> +	RPMH_VREG("smps7",  SMPS, 7,  &pmic5_ftsmps527,  "vdd-s7"),
> +	RPMH_VREG("smps8",  SMPS, 8,  &pmic5_ftsmps527,  "vdd-s8"),
> +	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo515,    NULL),
> +	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_nldo515,    NULL),
> +	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo515_mv, NULL),

Any reason for the NULL supplies?

Konrad
