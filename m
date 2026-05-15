Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6837239E6F5
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837440; cv=none; b=IwaLaBD2LQ7/iZo3InJsQkJsVAWrUfosxDjk+mfgyNycZq4SUa5tGPqoL+wMqxGkZGbL50xIe2JeDfNo5mUDydaW2jQu3Is+utZiocpmIn4ga8+3FB6xVsOG0xk21zjUnrhQrJtwOWc8O7KCJvKNHOwkH9+8bRwBKkohc8LW5qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837440; c=relaxed/simple;
	bh=Y4BSPp0dDK26mTaTR0n/dia2UU9V4N6M5EHqaz7EZ98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u/EiZhgji6dGNnIS/sqamPjmt//KyKfhURrQpQ3pRwaLLFPWwxz9Yl8P1Jcb8kv2jBpPfPlJxtvGZTeIts3ijrULnBZ3ws2q43bc6emAaGJ2pwKYSZvHBTuXn+bVlxiO7XEjSmO0EMt4pa6XCt5WvZ4dFA/DQS6ae5tGnsLUUFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nUwwcI8i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gj1E4WXV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nUwwcI8i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gj1E4WXV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F59Ini3797495
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUhAyNz1XFXKod2vcUNqCBCCnku0MrI8ZdXb0C+8GzE=; b=nUwwcI8iMJ4KmfvQ
	G5qGhL6/oacw/Zc9sK9e8ZscpjkNdUX4ejU/6jJhYJYOu+kDL8hyrIixu1EHsT69
	cWxU2elMilteNuTN1eTqYLZoa3Wgg7EQKJV2qz2Hcx27TPGkYVJRRNbDgytwO364
	kbtxRpRbSmP5BIDtPXoR1p3p8p7USQQGRiyRFDvWvcqrrxHe1m7unNH/SO9xxRnk
	wBg39cgqLWs4iTPHt7CPPCRw19cxffuZ98jWSIPsfLcb6a2y8rylKuJ4HYryCnA3
	ojBI6CXU3rYphWbl2iJ/W64K2hUFVw18tMxfZEjHm7kaey9FJRMYT0aiZDmtdUAS
	thF3TQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stkgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:30:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e62562b6aso23638361cf.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778837438; x=1779442238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CUhAyNz1XFXKod2vcUNqCBCCnku0MrI8ZdXb0C+8GzE=;
        b=Gj1E4WXV82mGnf6tl45c3A1qG8oIOWFRwWL2/GfzocWc0GpPz53Cegu17kz62LRJ8H
         JnTfXE3qwDYZTeGLuDUj463VyRc0IaV3HMzl75peu4uRoCgW3Ewa7Da1E4K3vVkWxK/1
         apto8iPT4HR/euGE/7OrGk6FznCVWSWtOxSANcK2Y0U3i3d4fiEu4biZGEBOpMZgqADG
         YrzCg4s4xdxU5uJtCIdGVmzSCNdQCYXhlr9mWU/7EC6dwlkXbm4DoYgOA6OjUG0Uy1qq
         Mf3bGGZIEzoNCIjiL61o2WY4PClqPeit0HCDp9QdpLRwrTPeIdBfqorlDBmamfGT0El4
         IN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837438; x=1779442238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUhAyNz1XFXKod2vcUNqCBCCnku0MrI8ZdXb0C+8GzE=;
        b=C9zRD/hLRIspC0+eCN66UwoBK7saJs9duzvbTpkKEt0c1qUZMD6bM/Xa7Z09jqmy45
         6Nh+NEleuV+VXmm2uQyf5XGRpetwFaHoUb6bPzb3FYITpZTpul11XkKreMZn5TOcbSqZ
         VjRK4Z6rjbDbfK+aeaFVM66KeWVgeOum7ZESnU+zRUDRGGX3GUOuDfK+sAKqKwe+NXIM
         yyVP10d8ofpzEJNiac0xpUZRyVLg/N7TEfItPvvqtFxjAAyDuGENWq688dBpHGNAOP/R
         v79qfCbak1S8kcI8JnXSakdGpvT/oZ7IlJo3BJJxHwvKQASsqXh1siQM96aCW6Dy5Qej
         BIxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9q4dKiGRRdcqc6otoJ23Bq1ZaOB05z21FVrNyLKyJGDfcEI3cFqIcUp3Wcqh68aHbUzoW5MbeQIRe+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxh6RgHaSZWEBF7PXOUTwQdr2VCJBdLIG9a9lDYJk725YR4xnn
	aR2NsqI0VYLZMfryrJcfRx/3Ka1wyd6Ixdktq4CmtdapNnnMHM9kq1OcfzHWeFxx+dP9kHfIG5/
	NzxTJLE00LT2REHhK1OB3AkxX9gxF//sdbK/MXkJR4FsqvFhrrzWoWDds61bnqJUtWNH19YeX
X-Gm-Gg: Acq92OGtItaGzq/+gbU+UZmfbNCGhI6aoCLIHfnwbayI2yXwm0IIRYH2lpGJxqdcV+5
	oO4DRmP46cn2taLFxAcx4Tw3mt2ZQ1ukrZkBqNYFFD3unJCYkPfZFQnFV7T25jVPC65MBj0Q/Fp
	WJUZAlMcuAC48W9uZBF+DpglLVX/+a8hSq1QFpJur7B+nc5RdnDqHoHeYbSjI4J7LCS2iSkf5h3
	d6/PZnChX7fUMtKrbnsWBVruOUZRZGyaeO62RQtd9KUQkKyumMJMrczB5QY13ls2ikYzkiuTywl
	/zL8jtkOKB89I3EDv3VbTxN/d1e9MN+HmSnMapfRG2mgiHRA4lMnN/cKwQXF0LkE8XZfFjsX3Vi
	vSEWYv8iL+eTWxdKuth+suCKXdjXlmeH6lJ3dUFC//WtWbNIPoSYS6YNYmgFcKZafhfcgHSFtil
	pW/3m3gYgcU14tWw==
X-Received: by 2002:a05:622a:1207:b0:50f:bea5:52a with SMTP id d75a77b69052e-51659e99e40mr30151781cf.0.1778837437647;
        Fri, 15 May 2026 02:30:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1207:b0:50f:bea5:52a with SMTP id d75a77b69052e-51659e99e40mr30151451cf.0.1778837437113;
        Fri, 15 May 2026 02:30:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310d510fasm1765815a12.11.2026.05.15.02.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:30:35 -0700 (PDT)
Message-ID: <1bf1558f-19b8-4052-9609-52039f820bbb@oss.qualcomm.com>
Date: Fri, 15 May 2026 11:30:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: spm: Add MSM8960 SAW2 CPU support
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260514-expressatt_cpufreq-v1-0-487fd2d78859@gmail.com>
 <20260514-expressatt_cpufreq-v1-2-487fd2d78859@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514-expressatt_cpufreq-v1-2-487fd2d78859@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5NSBTYWx0ZWRfXwgZgTyRDLzwr
 tGQG+n3l6QekZH5tCnCvVt52aUolrr3ROrTMQIG6PbnZNPLaR13lklzerZBjYW7+8LCGSj9RR35
 SfsTTX5XMLjmIXC2OVpJ8kDfgUzF6+X+anDmQ6qtrV1FrXjVqGY4IP3hiSNVGLgxYCnoJJ9bU0O
 knIuQ57qQlMYl3eV4QfXMvb6xAhttUsv21PEevlpT1Sg6zdCuWqjt1cWaaOtixn0OruySraQmAo
 BbHQ0kNk12we0OdQSybvteHRge5kGHzOOrivUJaGxGYQq1LIxoQVVaELLZ/9qnU4I3jUBD2hfjl
 cMhV8uq+NSgNsD9NGMO/1VhXsf+dHDVVRROyXRax469vOJrNEKPdiaRS9vmAWRgOhA7catREiqg
 oJUbMVnr4CJrfspdApXFkKeLvPN3L2PeRDBjylZ4jaxMlUIQhkAUKqsv4o1Vf9dHZyu2Kzy09i5
 pSNt1SB2k1DE7F3DL9Q==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06e7be cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=oA5LrNwOAAAA:20 a=pGLkceISAAAA:8 a=CuIG2ROkbE135izgqDAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 4cfx27ggZ93VZu_pHs1rhcvTJwzVzJLt
X-Proofpoint-ORIG-GUID: 4cfx27ggZ93VZu_pHs1rhcvTJwzVzJLt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150095

On 5/14/26 9:04 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> The MSM8960 uses SAW2 v1.1, the same hardware version as the APQ8064.
> Add SPM register data so that the SAW2 driver can program the correct
> SPM sequences and PMIC parameters for MSM8960 CPUs.
> 
> The register layout, SPM sequences, voltage range, and regulator
> parameters are shared with APQ8064. The only difference is pmic_dly:
> 0x03020004 on MSM8960 vs 0x02020004 on APQ8064.
> 
> Link: https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3353-L3381
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

[...]

> +static const struct spm_reg_data spm_reg_8960_cpu = {
> +	.reg_offset = spm_reg_offset_v1_1,
> +	.spm_cfg = 0x1F,
> +	.pmic_dly = 0x03020004,
> +	.pmic_data[0] = 0x0084009C,
> +	.pmic_data[1] = 0x00A4001C,

Let's use lowercase hex

> +	.seq = { 0x03, 0x0F, 0x00, 0x24, 0x54, 0x10, 0x09, 0x03, 0x01,
> +		0x10, 0x54, 0x30, 0x0C, 0x24, 0x30, 0x0F },

I can't see these values anywhere downstream

Konrad
