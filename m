Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8903AEF55
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785392638; cv=none; b=JLcovhemljypPqmopfPEAjHQ4oziZoCklsdJCjgPbn5QPDIXsz8z7zbkI7B9u6sO9rdTlxlIFbnKyUfyqzifrYqdYcsDLCqHYeh3QP+GmVZap3k7FWm+QDp4BB6gfRlvJBiVepNGXlteGkfV+N2m8rsmKdEbX38YrlN+wNr1pZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785392638; c=relaxed/simple;
	bh=RhmT0d6BPogBq0AJVpZkywtKfHR5UJJ4Gb6cYL6H6DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEECPiiNaXJvXWLoRj8jjmtO+BoWnjpBONUie0MFzBB2UVxJkjK9g/b8CSJuojJ+bdgBr0QLWA/2o5Alm/X5sBlFRE9PjilEmNwc0SUqXYdl0ZGgqNkMEHGglHuVbBQPB/k7p9YIh5O+wfRNwx4EBz0zlbuMSO8qbxuL110vD24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=URwrs5Oe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I09bnoWs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="URwrs5Oe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I09bnoWs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U60m654138817
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MN39yuEBBrn83OI1PfHjjtKhjs8VxV5nIEc8XlBfd88=; b=URwrs5OeemF5ukU+
	C5ohds+HVsMO+cxqzmleTW0Z9905IfMYUNqly8W6QZbooFS17cHvZizfQzfHyhsv
	T//YTpmqakkoNaSio9EKqK8ILbCpCeffihWOauQX4sbfw1Tb88mGL7eqHZa9TAig
	Dc5uW7QC+eo97rX6CBjLX+93BlO3w19wvmHO7ir6gTHcvquKb7IhpA3PbYBaLV+d
	gnKb6OfbEOyD/iTTbIepxliDDNJQdph0REU7Fzf9aYgbYRioMhdOlsa/pT1qxV7M
	NnOAYKAYtk5WsTBgiPL9vI1moZFGrguEGLla82wNB0VQ167iHX1dPXCXXG80HVTw
	Upoi/A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr0yjg3hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:23:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cea6a46766so32028945ad.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 23:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785392634; x=1785997434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MN39yuEBBrn83OI1PfHjjtKhjs8VxV5nIEc8XlBfd88=;
        b=I09bnoWs8VyjoStpIGL+efJBlMSrMAg69TLiBcvDJWoRz+EOuy9MtGhZMFlZxeVC0O
         Kg1bYwNtLx3++CqRc7wi8CrEBKHg+PNm8V9LVQqWXh3QFBcsEbpUhuQP/rc6mthzRNMX
         /bX64YfY6YMXytmWRdW9+Q5jl8NW7xfyS0mNPPBDfOpNk9LLM5QHCUtIJRMH5o5S1XYS
         okgNIqrFqVxoobTJ1yYPLk4ALv5TOFWv4q1/cVu2g5cj9pu+m267akG3Rp1hPi63S8+h
         0gdIcviK1E9yL416xyXWO0tySdTIKaTW001x2nWVtlg6e9eT2G9EVX3xydyi02ZUhgJj
         A4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785392634; x=1785997434;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MN39yuEBBrn83OI1PfHjjtKhjs8VxV5nIEc8XlBfd88=;
        b=iZFMFlkohmyNqh2NC/keBBLR7YA25l5RZ2fwWjcDb0jWx0BM4Mk4HvWBdai3pIVnHh
         P4M2/4l+FntmwLiGRF4O4lazWcdwEv3EtfZVqfFwGMttiK1sf0uRW1KWGQJFDud91kRH
         AepH+W0TMqAOL0aUetecfxD9EoSIfJmMtUNnQS7W9n0pZ2JowvmM3/X+8Ba3jS8chKgZ
         O0Vbvib27jh9YeVf826PZk89w9TwKuicDzvgw3PgVfdSnLip+pzRO0auM13PMiaz91jM
         8NZUDc9IPrDMTZbZJKSGHlLpYv1TeUFss/J58TVT7IdVNi1dyA0sVHXTeQ+AkHktLnqa
         NiUw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/BdntH0rH4TbCX3WjG6+M109zjj47XZ3IY1BA9h5fZUflVtM+PhJMWQxHQ3DRyx6cU5TLnnv3jRAl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/5AuvCLqe8tcOcxwVdP0bRd4wlXzL+LdRBD01U60Z8sp7qZoy
	CRsfZ6JmMmH4FMj5zdOta/jUYztk7A86PUUrN++X/ARI8hiuGM5/Rc7zElxv1yVEMRpXR3w6mnt
	gvMbqTdwl8Y6ATv/J4Itf7AE6I9E7oUr1RBgs0Dtb/5s1vSQfFwPVqyXHGCjnsTBp
X-Gm-Gg: AR+sD12dmVxE3Eu86HLBDDQQFSg07z8LASb/xNp7gkD6vB0YO9MG4Rub8Ax8OHTnbZ2
	lpKCj/9ffgCSQZp2aZqwiO7Ks7qN1EgTzhxyFHueKDmLgAkorAHDEhfVxILgpV9dVs8L/G4Y7f2
	G7RFykc28gvrhPZUl5cKA2K2QrvCoeI0Iqa6ZWYt5QBeytvP8S1y96kQkB7+rxTh5NTYjm3EpNL
	PmOtI2CbkmK1ty/sbc/W7hjaqi4S8pjB62GygJvSdDVkeY0xWw6+98/xxS7NrKMLTlk9bCiuvWd
	5hvQQKIoF9ltTsbnY53sz99lerI+D3M0fTImfThJ0XUvK0tw3Ik0fzMB01a72OKoKiOLeGfs/iZ
	jhj5TBzudGfhV39bAg0V+2dAWqg+nbyC5kw==
X-Received: by 2002:a17:902:d483:b0:2ca:53e1:b915 with SMTP id d9443c01a7336-2d035c20259mr14843255ad.14.1785392634292;
        Wed, 29 Jul 2026 23:23:54 -0700 (PDT)
X-Received: by 2002:a17:902:d483:b0:2ca:53e1:b915 with SMTP id d9443c01a7336-2d035c20259mr14843025ad.14.1785392633852;
        Wed, 29 Jul 2026 23:23:53 -0700 (PDT)
Received: from [10.92.206.102] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a6a584sm20911595ad.33.2026.07.29.23.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 23:23:53 -0700 (PDT)
Message-ID: <8cb3869b-98e1-4631-952c-2106986527cb@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:53:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E
 key connector
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260730-eliza_evk-v6-0-40ece2d33114@oss.qualcomm.com>
 <20260730-eliza_evk-v6-2-40ece2d33114@oss.qualcomm.com>
 <vatryeq6qsan342wow42rosabjofi6cqkom7aczllko4kw7n4t@v7k3fxat7nfi>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <vatryeq6qsan342wow42rosabjofi6cqkom7aczllko4kw7n4t@v7k3fxat7nfi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rdu8zAd7DlJbXF1c36FuPPg-ibVQhn8L
X-Authority-Analysis: v=2.4 cv=QrRuG1yd c=1 sm=1 tr=0 ts=6a6aedfb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WptVsyCosi7Mub_EgEwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA0MyBTYWx0ZWRfXxVBSEX7xY0re
 pZrKXXViCaNqvWAHLSddIZHU27VPoZRRHPFfPlBJrPWh4jyCE59jZ6KYVuy03VsZtGV48a0fUOr
 KK2SffKc9Kc9PCxN4okGCOCG/mJWpI4=
X-Proofpoint-GUID: rdu8zAd7DlJbXF1c36FuPPg-ibVQhn8L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA0MyBTYWx0ZWRfXxjTzI8x+t82C
 JzYGHW/Oq+VocwuxtzG9MAwEdaOu/Ai2Oqz3vHlqsmsA3Ph6wJXZiDtCG/xJU7MyJuvxzcg4rXq
 qxuSr+OaKNf1nEKJQnoWG7Qk864yYFxoZO0RS72MHw3xxNuhndo64m17+08a+96J9GJbTGgjavk
 gqcuzW8KNle7evgHo3xVWM+FvXhJ67HPQDco1HGPx/a4WaF7eLBlhDd23Uf9MbbtkJvy3k2+WV1
 zu3aUK5HDrEN1weOmbwAWU/r7YMIfV/fzu0jsYjiEZu4y9C+1OqypGNiD0hxFsMYnd6ac8GbhJ8
 r7x9TjtPYrOxiEvkbauPRMg0Nz5IacCbRZIoSD80onwM+OABR0mFbGoaYt2dnyJ6pLOhjjdutSV
 sudNvq/fBg4MBu7Gti2okPzC9hRdKo6YFnnpOGVZ161kgvmsZCpQgHK18+eLsU/+5sOrNEnrESs
 z3qPoBbmQir3Wyu25Ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300043



On 7/30/2026 10:38 AM, Manivannan Sadhasivam wrote:
> On Thu, Jul 30, 2026 at 10:18:54AM +0530, Krishna Chaitanya Chundru wrote:
>> The Eliza EVK board features an M.2 E key connector connected to PCIe0.
>> Enable the PCIe0 root port and its QMP PHY with the necessary RPMH
>> regulator supplies. The M.2 slot's 3.3V supply rail is GPIO-controlled
>> via a TCA9538 I/O expander on I2C4.
>>
>> The M.2 E key slot hosts a WLAN card connected over PCIe and a Bluetooth
>> device connected over UART. Model the connector using the
>> pcie-m2-e-connector binding, wiring the PCIe root port and UART5 for
>> the respective interfaces.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 116 ++++++++++++++++++++++++++++++++
>>  1 file changed, 116 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
>> index e47b24f8b827..b35fffb50976 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
>> @@ -11,6 +11,92 @@ aliases {
>>  	chosen {
>>  		stdout-path = "serial0:115200n8";
>>  	};
>> +
>> +	vreg_pcie_m_3p3: regulator-3p3 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "vreg_3p3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&gpio_expander1 6 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +	};
>> +
>> +	connector-0 {
>> +		compatible = "pcie-m2-e-connector";
>> +		vpcie3v3-supply = <&vreg_pcie_m_3p3>;
>> +		w-disable1-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
>> +		w-disable2-gpios = <&pm8550vs_g_gpios 4 GPIO_ACTIVE_HIGH>;
> Hmm, Sashiko pointed out the polarity issue here, GPIO_ACTIVE_HIGH. Is it a
> mistake?
No it is working with active high only, it is how they connected in the HW.

- Krishna Chaitanya.
> - Mani
>
>> +
>> +		pinctrl-0 = <&m2_w_disable1>, <&m2_w_disable2>;
>> +		pinctrl-names = "default";
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				m2_e_pcie_ep: endpoint@0 {
>> +					reg = <0>;
>> +					remote-endpoint = <&pcieport0_ep>;
>> +				};
>> +			};
>> +
>> +			port@3 {
>> +				reg = <3>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				m2_e_uart_ep: endpoint@0 {
>> +					reg = <0>;
>> +					remote-endpoint = <&uart5_ep>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&i2c4 {
>> +	pinctrl-0 = <&qup_i2c4_data_clk>;
>> +	pinctrl-names = "default";
>> +
>> +	clock-frequency = <400000>;
>> +
>> +	status = "okay";
>> +
>> +	gpio_expander1: gpio@3c {
>> +		compatible = "ti,tca9538";
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +		reg = <0x3c>;
>> +	};
>> +};
>> +
>> +&pcie0 {
>> +	status = "okay";
>> +};
>> +
>> +&pcie0_phy {
>> +	vdda-phy-supply = <&vreg_l1k>;
>> +	vdda-pll-supply = <&vreg_l3k>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie0_port0 {
>> +	wake-gpios = <&tlmm 114 GPIO_ACTIVE_LOW>;
>> +	reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
>> +
>> +	port {
>> +		pcieport0_ep: endpoint {
>> +			remote-endpoint = <&m2_e_pcie_ep>;
>> +		};
>> +	};
>>  };
>>  
>>  &uart13 {
>> @@ -18,3 +104,33 @@ &uart13 {
>>  
>>  	status = "okay";
>>  };
>> +
>> +&uart5 {
>> +	status = "okay";
>> +
>> +	port {
>> +		uart5_ep: endpoint {
>> +			remote-endpoint = <&m2_e_uart_ep>;
>> +		};
>> +	};
>> +};
>> +
>> +&pm8550vs_g_gpios {
>> +	m2_w_disable2: m2-w-disable2-state {
>> +		pins = "gpio4";
>> +		function = "normal";
>> +		input-disable;
>> +		output-enable;
>> +		bias-disable;
>> +		power-source = <2>;
>> +	};
>> +};
>> +
>> +&tlmm {
>> +	m2_w_disable1: m2-w-disable1-state {
>> +		pins = "gpio35";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-up;
>> +	};
>> +};
>>
>> -- 
>> 2.34.1
>>

