Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8CD3803DC
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452693; cv=none; b=oiDjQ9T6BeGSg+bY86jzihWUANXtOYzX5aWrjtxoTM13D/Fvlvya6LkMh9GnIBW2BV80UB0SbVTqan3AhRMF/293JH2f/O1y4sBKeZe5fKvZwaXJ7m1EvF93AJQ3v6Kv2Vb63LKtME3VGpu2hrevWJVBgIRG8XV3vfk8db11Dg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452693; c=relaxed/simple;
	bh=3yg9pAXmNWpk1/sWJAZJgW4Bq/i5kc2HEUpAaOv3rfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oAQVNttpVqaHhixhzPQcD3IBb20K6UbXuEI+LztNCLRgtOd0N1dQbjRHO/9iHWHgNHPaF804cUY+yD8zrxY3fKgblzilvRvWD1iBcTkzMlDZhnxZWj2puFJfrJzI7rArc9QcQJwoy0NwdjC4dd9y9lDedUUo10oimbNfKi4ZlTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FwrcXFDP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GSxn7Ypc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FwrcXFDP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GSxn7Ypc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBjRQZ1960694
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	td83Aavjt+y4+Fubt3kuLIXT1BRRXdtEK4u9R2BjUAY=; b=FwrcXFDPASzAt7HU
	KCwfo56sW0SJeo6kDa4NaSWt+N2vhpi7KGivMT/i6Qubt+dC3VPDDgQ1sBMVjbn0
	8B8VO/pK4EwDX0VzKzWs24phvcl0HSe9rc1ys8Ebnvbo6/Xb7qQZPFAcBismYbK0
	FHIkuGI0koaFfLDF5B8/wrSevSc6a25kKtH/OZfqm2lkDLM2JHLIAHk567A+F2B8
	nbWm861L23NkZ6BLIUkV9aKCCRZ+8KazYbwPW9Z4gP/khkyfs5xkqNnnOQxPWdzh
	J/qlySKcmdwWrzx/pfujAXQ795kPGmnc+oaIetljCIWuPWQZmBD4+yDDgctpF80B
	znlz+A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxesf9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:24:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514b5cc5cd2so22526761cf.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779452691; x=1780057491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=td83Aavjt+y4+Fubt3kuLIXT1BRRXdtEK4u9R2BjUAY=;
        b=GSxn7Ypc+aR2b3Il15FBUWyR/s8By13x2PK3IPS2cMSH+Pkolx1GpbeLhC64pXteF/
         1AUNLYK4g5xYdq8Rtp7olzESLIKw3kZLOHYt5/1dh4wvHJRUe24lDWLxtucWXbz+VM97
         C3Go2ZksujdNQg5v8YNwAA+f20Wvphhd8uAUPmyls7J4zrPa/w+oL5J8a8YA6y/KX9Jb
         j0/w9mX//C9inyfrLh/A01wlEiJsEouepn5Dwu/bjZt/wzygnIi2ZRjsIaUHO6CU0q3c
         DwxcP5Og3b5X/atrgiUVcsoef4v4GZpmkBc0fJ/bWFh2+SuFbrzL90XjglSky1DufI0T
         X1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779452691; x=1780057491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=td83Aavjt+y4+Fubt3kuLIXT1BRRXdtEK4u9R2BjUAY=;
        b=Zp7rqi+WlvKatZ4VqedkNYenDMG8DQJCyIMe1FeAzxEQ+w58JAZ2xB25pIwK08TaSy
         wGnGdjXSFKwgqmLTVYGnrAo0ZNHovYRocsi/o2fnpyKdQRARPPdE6AKjvP8i6WPJMwpy
         xAljKlEH/HCPvspfEL9kk9nnq4lS3ePYNDbGk+Ga/t/c0x/2USOlCCoeNYOFVgWY51o9
         kizds92Kl4Du+PsewDpY4VWANIwzAA/qdc2txVFjQLm8M8M/qt++xFKtPJgm7Z9eipqx
         vyUYi8OC74L0kODL75FD6ruzgchylVIZ9kn6jAU5+tRtwtK/u9Tx+usIc+ERHYQkHwjF
         /uOg==
X-Forwarded-Encrypted: i=1; AFNElJ+yxU1NyYPAv917luQB80HoeURDJvwjEt40cBd/FHEU7K/w2AHuzaKNvL6RaPKjnd/ncni3Le6EISJs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3kMJrpm+89TfjLQFie8g6i6HgDFGz7E6Vr4L96Sne9iPTcMKl
	IlY03fPm3D9ZCflWh04Fd8kYtoubaFJ15K+9xUKBkPOrCva98ElhDGctDKrYoKbdDWUoAKDWWqB
	tLmqQDehVZzE4ySwlf7+ghn1h8NowNAc+UqDuMF6zX8QhwVv6XKzGeb6RFsljCC0r
X-Gm-Gg: Acq92OEwz3vS+ca0+VPuQXZ3vIwDzBNeRHqESMfVZhk3uq1vaHrsCl9doEnGyG48V/U
	ENXBsmTzhw0tiCBFU/GqHJNAWqC6VGO0PGfTgIy8gP8kFIUySFtwA5mi7ehc2eC3XLTIb2hYbLs
	BeIcwJsuLWuTqMzEcF/3r05OP1GUOShiMvJ5yOdeNFGyjJlBvho2vEqIUn+pmPNNR5W7+Vf1O9z
	6nMjgEftWUXmmtAkLmkAY3Ajio+zsuPtmz9UyRAe44JLms5w0A4TTrIo3rI1LFLvJbxSJTJo8gq
	GYgYEADtoIbrJ8OgiP9/6WXDUqq26bHCFRKRmCWDtT0SmkeHp1QesZbcNSUSfjJjY1w8Gr8HdMt
	9oJWXd9jdf/ggdfIXnfvqVg3fj2FhUZpbEwRdasy6ykEkjA==
X-Received: by 2002:a05:622a:8588:b0:50d:a92e:fead with SMTP id d75a77b69052e-516d436cb6cmr26199791cf.3.1779452690612;
        Fri, 22 May 2026 05:24:50 -0700 (PDT)
X-Received: by 2002:a05:622a:8588:b0:50d:a92e:fead with SMTP id d75a77b69052e-516d436cb6cmr26199521cf.3.1779452690128;
        Fri, 22 May 2026 05:24:50 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f603desm612961a12.12.2026.05.22.05.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:24:49 -0700 (PDT)
Message-ID: <dc7cb371-e94e-4f42-87d6-70f0f94d0d49@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:24:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5210: Enable PCIe support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
 <20260514-pci-ipq5210-v1-2-a09436200b35@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514-pci-ipq5210-v1-2-a09436200b35@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMyBTYWx0ZWRfX2831+nxfDug5
 3Qqlt0OvDyTcXInlBKITYLCdVXrzTjLKEzFzHLQrEHcpvgt+6+7uCtcA6EHeaZKbac2e25DeMek
 Kt7A5KUFcv4WzzHtRHaaB79c9iNyVEpWWe3k2tKDugXgRUXcPxZ+vIfP7aGU5JTZP8V3moMt+FZ
 2jEfZetevcb5zg+CCPuXhMwTQZC+6jpkrQrNRMxQUXPoMqCq45HnYwLY0IaINhd1d3GFzPHgvS3
 8n/N4IsDsptwiX6EhdulpyswDv/XqpyEsGnHjGVtn2JKYCtY7bp8d+hKU9vNCeDBAxeCLg5rGkS
 ht41WNvvUGv36rFHq4aAkabX217X9iqQZuISDttVlVxbT3eWb5U0xWqfTLbEeSs76BLEpH90ZrC
 MVQcolqREort2EidvyekAtcNXkWcNPap8cEg8lfMI0GjtvzZ73TQt9AFcUnqRdiQIQ13io5XW86
 gZ4//aScSq5ycgiTcpw==
X-Proofpoint-GUID: KgAKVoCPuwh3S80JhztR09eMxZb3IDdo
X-Proofpoint-ORIG-GUID: KgAKVoCPuwh3S80JhztR09eMxZb3IDdo
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a104b13 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=w2YRJOle7L1X8GQccsAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220123

On 5/14/26 6:13 AM, Varadarajan Narayanan wrote:
> Add DT entries to enable the PCIe controllers found in ipq5210.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

[...]

>  &tlmm {
> +	pcie0_default_state: pcie0-default-state {
> +		pins = "gpio32";
> +		function = "gpio";
> +		drive-strength = <6>;
> +		bias-pull-down;
> +		output-low;
> +	};
> +
> +	pcie1_default_state: pcie1-default-state {
> +		pins = "gpio29";
> +		function = "gpio";
> +		drive-strength = <6>;
> +		bias-pull-down;
> +		output-low;

You shouldn't need output-low in either of these definitions (+ sorting
by GPIO idx would be extra neat)

[...]

>  	clocks {
> +		pcie30_phy0_pipe_clk: pcie30_phy0_pipe_clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <250000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		pcie30_phy1_pipe_clk: pcie30_phy1_pipe_clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <250000000>;
> +			#clock-cells = <0>;
> +		};

Why do these exist? Just pass the QMPPHY reference straight to GCC

[...]

> +		pcie0_phy: phy@84000 {
> +			compatible = "qcom,ipq5210-qmp-gen3x1-pcie-phy",
> +				     "qcom,ipq9574-qmp-gen3x1-pcie-phy";
> +			reg = <0x0 0x00084000 0x0 0x1000>;
> +
> +			clocks = <&gcc GCC_PCIE0_AUX_CLK>,
> +				 <&gcc GCC_PCIE0_AHB_CLK>,
> +				 <&gcc GCC_PCIE0_PIPE_CLK>;
> +			clock-names = "aux", "cfg_ahb", "pipe";
> +
> +			assigned-clocks = <&gcc GCC_PCIE0_AUX_CLK>;
> +			assigned-clock-rates = <20000000>;

Is this clock supposed to be fixed at that rate, regardless of the link
speed? And is the default rate incorrect?

> +
> +			resets = <&gcc GCC_PCIE0_PHY_BCR>,
> +				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
> +			reset-names = "phy", "common";
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "gcc_pcie0_pipe_clk_src";

Having a gcc_ prefix here smells fishy.. 

[...]

> +			clocks = <&gcc GCC_PCIE1_AXI_M_CLK>,
> +				 <&gcc GCC_PCIE1_AXI_S_CLK>,
> +				 <&gcc GCC_PCIE1_AXI_S_BRIDGE_CLK>,
> +				 <&gcc GCC_PCIE1_RCHNG_CLK>,
> +				 <&gcc GCC_PCIE1_AHB_CLK>,
> +				 <&gcc GCC_PCIE1_AUX_CLK>;
> +
> +			clock-names = "axi_m",

stray \n above, also in resets

[...]

> +			pcie1_rp: pcie@0 {

pcie1_port0 for consistency with other DTs, please

Same comments for the other port

Konrad
