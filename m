Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E3940D58B
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221054; cv=none; b=MJBUqADbflwZYkg5kwu9GM99m1yHAAhA5Gl54viuVgWt+jvBSchj1Gtvg3lFfZAjhyKc94pjLW/1G530pwovt4i9dPFiH4JIXHwoEu2eTirRNmq2jDv4EVIzytEjEsQXO5inbAlzVEKR7wYi2Q2/IgDBXQVST7zWr47mGlEoZsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221054; c=relaxed/simple;
	bh=Rt4KCNIC0bk4LE3kNjZBDI9ppI6hU368mOP8+6m3pu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FK/qG5AbBqKXLoo9JTOkI4CxaYJ9iEe9EbuUxY24sqwTK2SkwquhUux6JEvfPyZAwHkW9E+iTu05u/Q65phgznsEdvoUrjlXspxI32hgpwoT17kphahDUt2Ut2QoRA6cIVSJZEzInZ3aPyZp2X2GJKaEUYwegfMhX1bEdncaTgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFv5c1Hi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=esdjtWs8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFv5c1Hi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="esdjtWs8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8PCPZ2465359
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZ8bSWEjaxQsf5haBbDFpLTYwqaPZD3nOYIzf6zf4FU=; b=MFv5c1HisMjCcEdY
	P02LVDO0cNXReYCDtoEh66zz0umjXu6YAhOfS1iHv7HcB/MDQCB4xoWyT0kyvQQH
	ftVk4OU+7LiTlIUl0PUbJKe3HD/UX9JwYfVnvzvmFabV0ZNakNHuefiFshPCGym/
	KuZLqViSjyYpj/usGaTpIchsDsUUnFGa4Qo/tveI4237mNDl0riNDP4mR5rXYziw
	OjF/EXiGeOT8I46bqW6j5XWX+vrENwPT3bJ7RhQA8bNid1tQczoDEZQ2nFJFtt7X
	CBcJcE18VIBaXzl4Rsw8NJQgvX0xWR8uM7t06luSRuxr4yAFP7fdFviA57h44S7Y
	DCNTAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29gek5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:17:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c9d953b71so742601cf.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221040; x=1787825840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZ8bSWEjaxQsf5haBbDFpLTYwqaPZD3nOYIzf6zf4FU=;
        b=esdjtWs8ZiBtHoGo/1XzJTxVH/RcLNhIeR/suXgF8eCH0XmUobrQK5zSGisHRXBfsx
         DGgQT86gk1CVqXHRS6bA3dtQCYFC/FO83z9tlTQp+UcUg0kGEx0oRGavFYwNnwojA4QM
         RHigFxRBqxFoRHsanlRmciRNrzBFuSk6+nF6nejO5KnuNYzmW0musWbdn8v+/YeUcEu3
         YtGFYamzf9ZGcZL8dkQMF05BQhBxvxmfIcD1IKOl4CEhRzSUIH1TQV2atobZ3T41h7z2
         EgJyTaKMYXS+P7ijdaFcyRmSIavpeVPqxrU9h9zwDfHXia2AGd9aPR0ppy4bcs0DCU9H
         MyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221040; x=1787825840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZ8bSWEjaxQsf5haBbDFpLTYwqaPZD3nOYIzf6zf4FU=;
        b=jkJe2hI+0nb6sc2KFHs4i9TGvGsfXxdtA0pB53cXBRwpCbKlPu5JT+OyHqHLoQ3Xkd
         bKKTNod1thwAc9gl80Mjo7Zc6BlbCa97Eh21prCWAksQkcr47Pt5ndgm+0Olg75xEMJa
         6DfhQIjZ6CpMCkhkcDmCGdiSoBuGYpHEt+NzYRqFuhypb8CS4m7awbH2yschYgpIvZdx
         IYRzQrVUfwN54pmyjZbHyHJ8vGcFnszHBh2acT0WaVfA2bNi7GW7dg8/pwnuLQG6q/TG
         uE/VFUhEw/kU/XVjxwuBF3NocrfsFtByvrd8CrC3DCzGYwq7DlaP/4idNOyD3/tSC9Zs
         T1Fw==
X-Forwarded-Encrypted: i=1; AHgh+RoEOZG8KWcKY+TDSdnwiXHJAvjv0jL5P5rGlQvauivR0W7a8xsoVpjVHTH7+VMHT0wWilFPPR6uqADK@vger.kernel.org
X-Gm-Message-State: AOJu0YxV2i3S7VjvOIrqsUpMblob/6ORitEZf3kmBwsD4P8mAMSW2W33
	IZUyMFGaMzJpUCJd62FY2FayDVQVTcSiYGZaCHCJSlDH9/5J9WNtjuu13GOyOQWpNApK5Cvxs2D
	PVrTos6DCwRGVKkUNthvSjwj9ikk1kYXT1X/kZJEHWydRJwGDlTGOC6D5iOo6mUMb
X-Gm-Gg: AR+sD11WCID9Y9K45n75qM/ctuzcQ/VosajAEq9DkbetIjqLZvUt4ehyW9WS0b9AjNg
	I37+F3MFrJvfi9aABavPfd++FmMjukhrb1pqMQvwGJKYT6LnvO8HJgZgcCKRwvDZXEKGEI2YEQi
	iou8fvL8LYTfwIuvvDimf5Ukz4u6/NmdGM/RzWzJzWR5WdCy247QS2dZaGD2+iYH1GjqYU1M14F
	6x/gWzscpIZyQdjK/lHOkQ1MpXuSyQGKsl/AbLbHr3sZTawumS7E4r/GuXkXPlH8etqLQ3GLKr/
	fabXolwdDrkEDsStabepc0u09h+e6qbQ1XzyoIQDOjPvuRo7cncx6NAFW/k3VY596xs2aQQCWGj
	zqRyUF3KD6VomFE7fTsplJ5Zy
X-Received: by 2002:a05:622a:130f:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52dd574ad4bmr78013181cf.1.1787221040237;
        Thu, 20 Aug 2026 03:17:20 -0700 (PDT)
X-Received: by 2002:a05:622a:130f:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52dd574ad4bmr78013001cf.1.1787221039762;
        Thu, 20 Aug 2026 03:17:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c30casm1866261a12.7.2026.08.20.03.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:17:19 -0700 (PDT)
Message-ID: <e16a7122-18c3-4bc5-80c5-1cda458fa2c6@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:17:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: Add Motorola One
To: Adam Skladowski <a39.skl@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
 <20260820-next-patches-v2-3-7130d68183d9@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-next-patches-v2-3-7130d68183d9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ek9EKQ0YVpDB-6Jxo5eybJ4a2Wwm7VKX
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a86d431 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=RkJc_Q4fNhrpPokiRjQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NSBTYWx0ZWRfX+8iyyiomwmMF
 ehi98SDS2Z1kdhBNJEj9c6sSy43kOmOkv04P4AUqQt+SAo3jhER/FzpDYevsqY8NzRHiq4LeI6/
 tfOCkMO5oegVzplM0apaSWbtHo0DdlMOY0mr7C7ZTqJuzLHHn6/wtcjYB7YtpuSlT3gbtu5bcCc
 OunQ9S9UVAFSRqFbvPdaiFQ1MrnLv4adFrvCvUzMOlA/ECFs8jY80AsNSaWVJO+jz+RD3WPwOUv
 I35+ljYIuEsPFWinbayWGWjyTh+H41vX3QFxLNPAMyllIY/OZggAQUkkcMvgtYX0FGoDhYT5x9t
 4/1XgW9q51Ec22CiMYMtzJyrkS+U200/pnJIyD9wABCUX+DyVuFkAfpiDDXv1CW38mD1U1ZrBIF
 6EM4WizI2ASr05YHY9wxA4Sgb+V97tzlboiy7kwt6ia1BhVLh30YrEoAQQqAKl1j2kz9MuycknJ
 V+0yZnENSPHbdD5Cb2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NSBTYWx0ZWRfX4DYN0Mo0f8tA
 WwY4b2LpSbyxDWehLRrDW/Et9iOLKfCNvq1e3QdXgLc3djVQBIY0X2fpvuOGsDtFvBIZ9n577X3
 8JxPpNq3Uj0csMoAQ2TTC//VwlM9PEc=
X-Proofpoint-GUID: Ek9EKQ0YVpDB-6Jxo5eybJ4a2Wwm7VKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200075

On 8/20/26 11:42 AM, Adam Skladowski wrote:
> Add a devicetree for the Motorola One smartphone, which is based
> on the Jacala/MSM8953 SoC.
> 
> Supported functionality as of this initial submission:
> * I2C peripherals (Touchscreen,NFC)
> * Power Button, Volume Keys
> * Regulators (PM8953)
> * Remoteprocs (ADSP, MPSS, WCNSS)
> * USB
> 
> Device tree also contains supply maps to other subsystems like MDSS
> but due to missing dependencies like panel those are disabled.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---



[...]

> +	typec-portc@22 {
> +		compatible = "fcs,fusb302";
> +		reg = <0x22>;
> +		interrupts-extended = <&tlmm 9 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&fusb302_int_default>;

nit: outlying sort


> +
> +		usb-role-switch = <&usb3>;
> +		vbus-supply = <&fusb302_vbus>;
> +
> +		connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +			typec-power-opmode = "default";
> +			source-pdos = <PDO_FIXED(5000, 500,
> +						 PDO_FIXED_DUAL_ROLE |
> +						 PDO_FIXED_DATA_SWAP |
> +						 PDO_FIXED_USB_COMM)>;
> +			sink-pdos = <PDO_FIXED(5000, 3000,
> +					       PDO_FIXED_DUAL_ROLE |
> +					       PDO_FIXED_DATA_SWAP |
> +					       PDO_FIXED_USB_COMM)>;
> +			op-sink-microwatt = <2000000>;

This is inconsistent with the sink-PDOs you defined (5 V 3 A vs 2 W)

Konrad
