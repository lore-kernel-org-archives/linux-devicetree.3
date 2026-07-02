Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF2C47884F
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 11:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782992746; cv=none; b=swMEXEwZbtgBVMe58DTfgrgRJi2z52j39ccuXLfg7K9O5CarF4q3FvFnSs6uOGQM/iggmbMe8a/Sz7JTFYyYaPDpD4TotT3elHrKEgfRPVMuR5D393m4xM+JAGl2gV4EE3zEY0Va9pdkpc8c1tEIudNwKH0ie5jExmKbYXl/glE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782992746; c=relaxed/simple;
	bh=wOlWyg/m5+WBA5guaBklrIRBbI18xdA/OgntwyXfss8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VpmhVlwrGV/XGFsriC07mj7cx1oV4jolwGHke+WF0ViBEVCQ0CaCz18A8lMeOq7FuM6hzimwuT+53YcvYFbTOGq99p2l7ADKl19n2hGRDGqiJyggmhIrhccLndOEztrP5TtzIZ6b1IU3ZvXWhzKGR8KVMizrw76xZRNLwB3qNVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFzsrvZ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARS4i+kr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFzsrvZ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ARS4i+kr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KLTj4115374
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 11:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dybK6HRyXiWQKemurPx7YNQf+boY3o1Qdlwxmz9ca4Y=; b=LFzsrvZ5A7pGSBNk
	XWxleAYj5ipCTX633CvsB4kd5ZsE0n/g0PxT1Ct1374Dfucd5rfRUEvUTxXV9v0s
	qERrTX4CM5J6Cbnu5l/V76DZpEXeyMKC9CodTOnaq4m+p30JPdFtBc/VS4R1kuZ7
	naXWRieOu3ghYbIwbFVR62CHmjx4xN1+uBXFgmRNzDdi5XuE9oL+aPm00IRi8+BV
	ZtAdhfodnMIybkddG/oryYwwXzTAnD6ww9uUQR39jyh3iH+dnuKbrQZpMXYBnNo3
	NDugDpV9zl8oO+0ozXUHj1SStEBjYiiy/agn6aAwvXi2rmtwtCIl4USLJ306ZkYR
	XmhxOA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n940hh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:45:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e7579ded2so19614085a.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 04:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782992740; x=1783597540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dybK6HRyXiWQKemurPx7YNQf+boY3o1Qdlwxmz9ca4Y=;
        b=ARS4i+krX7ckTiA7ylt/PLsfOEy+1tk8bWx/BeJOhnidX9Q3CedtfNoi7YzkCnooD7
         AzbvBBnPWrCZmANAaZrCDU+AMtgNL+L8g5S0XWcEUlxNVQom+WmmJjDq3UdltnCucTKh
         Xu4vnXHtiQaoApy+u7JuQ+p0DYOJLYzH/2CWbpugW8bN7hwXDeqR5m8PIG8SBdvDw7fq
         4cCJ7Y8mpVruC8fedrFwHSewyy4L3Xhz+xS8QdjCkpgOQC1FVAuG5Ha5qt/MoHRMZThi
         OuptT4HQvuET2yeUyZISjP3N9qcER3ltKEMPSeSC5aOaNAHO6jQOmWC5VDSwGRmSGZCR
         l1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782992740; x=1783597540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dybK6HRyXiWQKemurPx7YNQf+boY3o1Qdlwxmz9ca4Y=;
        b=d07RVKkSs4Z4d4HslPaPqXXlMhSmQhgW2Szt/z3slJpCympUeTI2BY/Vfhl4naebeb
         /HA6Bm4SoKxNYqh/Axb5UQMiPHUr1Jz4/INwi2fI8vledts+H1hp0MQxTQqNPH7pVTmS
         kIlYvWukGU8cumKJHLd80PTDCBLL2or+6iObHe8Pdi2DzOLCu2f00WKIetGsfDHUcNbz
         fdTsxYY3YHdCDSshf7mL4WgKhW+qpGsDxNcnfnWkALdzVe2IwXTMvj2kL2lifCrwrhVt
         E7XP9MrHvWFlBaa6xlPSeWoNaNVNo7CoaUpQEtKqm0KWd48d8qC7ZVXdVcfUMEIEZf9R
         8+uA==
X-Forwarded-Encrypted: i=1; AFNElJ8qdYROWopSa8CotRDUnTlrugSqKW09OTZP0TrC2vszdsqUeupRwOk2Cvr4Q3NNeUcAHGwcoygB1PR1@vger.kernel.org
X-Gm-Message-State: AOJu0YxVfL3qWxRh1n1XoA5x1MvKSxXmgujg1h736DbgjGUi7B8kpGgq
	QQmD+uvDR1aqr3bLVXWZmuLwZPd57C5wJvzeCGL4O+791pUpPgPelAEbnM6Z4wfTncqtGJqt9H/
	nVrHIGo0WpxC/LC2Qov83SNuo/9KraoYeVm6SnTxcyFiIEolvRl59PlN7VD5UN39E
X-Gm-Gg: AfdE7cnNCkykehEhaQFARJUKQqoySUbytEd2IkwHDbesA2B19zND8AntCenbmOAqdhH
	4+Pcs1NKP3cTGvo9CgIbrfekhkgTx6/1UkUbLeUiHBbD8tJPVKXZ25dNYM7q4QfyoGD6vHWtqUU
	TYl4Y78Y2BsxUSagDkLb+muLKxT0EETDOU0ZI06wRkb57CZ2AiYSiGANWxx1CqhmaMecb0onvMd
	Awsvi9ioO0N0H03l0YQ702Ei+82ya1CQ8fTbbWb/FdE3FNN3J/6So2gKtyXRT+7v2TFWDW2e460
	qGj6vYC4hc3yYfVSsEWfE1nJD/Ea/I4e6wNO9OHRw4IpcUK1N4XdAIdvQeZsfPTZpuCpfWKVyE5
	j5fE/D6WRdjDaG5LQA5OHjyCDRDMdONllXu8=
X-Received: by 2002:a05:620a:4612:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92e7809b875mr489468485a.0.1782992739821;
        Thu, 02 Jul 2026 04:45:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4612:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92e7809b875mr489465285a.0.1782992739297;
        Thu, 02 Jul 2026 04:45:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6095b7dsm117572666b.19.2026.07.02.04.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 04:45:38 -0700 (PDT)
Message-ID: <5791feda-226a-4a22-a79e-e6b72be141b8@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 13:45:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for Acer Swift Go Pro
 AI (SFA14-11)
To: Kaipeng Zeng <kaipeng94@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, konradybcio@kernel.org, andersson@kernel.org
References: <20260702063156.35169-1-kaipeng94@gmail.com>
 <20260702063156.35169-3-kaipeng94@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702063156.35169-3-kaipeng94@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyMSBTYWx0ZWRfX22GY6UklyDnC
 k9s+pH5BKfLKi2bZ41B9S0ci3+qBjfZLP9O5qWcwk1ENnAobhUTN6BHJs1i+hl6BiNjhXKTTv0/
 H221Jr4+2AlmBI1H9JzT0tfR6P7B62tNuVSz+mWmPNL3ltQJFroZRB5JSU8RwhbKIRb/SmwVwoH
 tjJpOBZUTEQxnKl3avofoQk/Scf1RX5O5Va2SJmm6d1xrlT3wji1onL8Cfhwk6O2MWn2fdbKvrJ
 0o/CQIU5QvRzvK9asRKWVsIcCx6nQ0z0IhPgOumotFYpuqCu9ZNt2l+iWcZU6c2YS4La8EbSze/
 zyrzJAGV7SpJvTrmxHsRB3lH+SFlZEUiSie5VnfzgB2rhZR7Q5hU5y9AHQpPIC6WIsJu+q0wk/Q
 byBFlv6lqZFvFyjoYyNtylqc3gyIxX8QpQX2TUw+wDiNorBGNLbR02er9wCLP3UkNecQXP2MQOi
 4hT05JcKTlyMPjtb7AQ==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a464f64 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=R6a7uwYVqKW5caTnw1UA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: mge1OwaBMRkK4o5BLFSUMhgX1tFVZO4S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyMSBTYWx0ZWRfX7k1OLmx0rXrl
 p4n/ioCFdcO3Eg0DxKAyN6D9nG2r/JaijT0JdwTe+/FND96f2jOz8w9UPGPkBgLV1izCb2dn4GX
 PVhCxbX4P9wkikgHG/RLDzVh+SJ+JY4=
X-Proofpoint-GUID: mge1OwaBMRkK4o5BLFSUMhgX1tFVZO4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020121

On 7/2/26 8:31 AM, Kaipeng Zeng wrote:
> Introduce device tree for the Acer Swift Go Pro AI (SFA14-11).
> It is a laptop based on the Qualcomm Snapdragon X Elite (X1E78100) SoC.
> This device tree implementation references nodes from the x1-crd.dtsi.
> 
> Supported features:
> 
>  - Internal display & Brightness control
>  - Keyboard & Touchpad
>  - USB Type-C, Type-A
>  - Wi-Fi & Bluetooth
>  - ADSP & CDSP
>  - Adreno X1-85 GPU
>  - HDMI & USB Type-C display
>  - Webcam
> 
> Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
> ---

[...]

> +	pmic-glink {
> +		compatible = "qcom,x1e80100-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
> +
> +		nvmem-cells = <&charge_limit_en>,
> +			      <&charge_limit_end>,
> +			      <&charge_limit_delta>;
> +		nvmem-cell-names = "charge_limit_en",
> +				   "charge_limit_end",
> +				   "charge_limit_delta";
> +
> +		/* have only one typec */

I think this comment is superfluous

[...]

> +	reserved-memory {
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x8000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +		adsp_fastrpc_mem: fastrpc-adsp {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0x0 0x800000>;
> +		};
> +		cdsp_fastrpc_mem: fastrpc-cdsp {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0x0 0x800000>;
> +		};
> +	};

The latter two will (likely?) be assigned in the common DTSI soon, you
can drop them


> +
> +	sound {
> +		compatible = "qcom,x1e80100-sndcard";
> +		model = "X1E80100-CRD";

This must match your machine

[...]

> +	wcd938x: audio-codec {

Nodes should be sorted - by 'reg' and unit address if there's one,
by name if there isn't (minus some special cases like GPIOs), see:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

> +		compatible = "qcom,wcd9385-codec";


> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wcd_default>;

property-n
property-names

in this order, file-wide, please

[...]

> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pm8550-rpmh-regulators";
> +		qcom,pmic-id = "b";

Have you verified this against the DSDT of your device? Incorrect
settings may lead to hw damage

[...]

> +&iris {
> +	status = "okay";

You need to specify a firmare path

Konrad
