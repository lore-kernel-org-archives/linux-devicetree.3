Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C752301719
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251017; cv=none; b=idHEZe+YDMrmHkiFdlLBI/EELvi+vwEoP7DU5/W9c4P2+8bbOti6IbXZFLhOd6lJRKdb5lA52Q8tMblzY4xegC8S2ZW092F0BeK6mh+ssViHZOwDCXHXIZhgf91ReH0uDWuJwqbkEXH4SU0Zaag9Q/vLNDZpjKH4/GECbeuRxcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251017; c=relaxed/simple;
	bh=ojfQXHezIap4Q2ED7Rej+tWoCJU08h2r1pKMtJQAkTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ADDsH7rzu68kh4zPX5mxTOmEbdHp2XQhNLS4tyx8QjdDbQN6swWCe/FJUxBf45DeKGUtSaWheNvRXaZsTmVAdHyssag6ptQsJUU6rT1tRk46qHWo3RM3Xwli5HPcLGumzvX32l5MLRIFovZzb6AAFPaj8f2AYogZ7HQFdMocBwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eXj0Iio0; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eXj0Iio0"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa65757ef4so65724e87.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251013; x=1781855813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLIFEbFe2aJSbSCxVWR8no0e1CK686vhmp4FsclPvxE=;
        b=eXj0Iio0nvlu+zovIFgC5OZThnAhlulptkf5XjgCkyJPAwHP/kNb5sWzRx082/QEl4
         8tII9mTyHDCfc+DuuzE9L+NfNzfp+BXdSABU7/ISMJixWlPV+iU+IpqUW5664UU5Gp4y
         L4neP8x95QfFhMGDVoIMw54B6f/B/HXGUuoJ7WGSkXVp3Mfhba9AZ52lN5uRvkwsjKgq
         eTa6YJff8ef6Nt1qn0tClgWKrzAstw0xxlF8SoxBULlgCWwnMh32RCg6cddLYY0hq9zF
         lY1LCMg43jGRDFMZ3xzsqfSd0655EHjz9NHAheg6f9d/mUfEYZObvimR6OKRfTHiPI4H
         eYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251013; x=1781855813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLIFEbFe2aJSbSCxVWR8no0e1CK686vhmp4FsclPvxE=;
        b=lh3g9IO4vPRuJJj8ZLY0OCemTXErOVsOUki0Pj8GLjxSgpEUYQR+bsMRPOrz5y4fFl
         9jRyVR9924zcf6PB6aeJtIMzHbd/Syr7pG8RIWbKEGpb6q6KQl2BA6yaSio6a62r23NR
         Zv/X9KUJYSS8/INLnfVqMvaBDcleSC0e95vq1v3bHWbIqaEi2MNlsXHSYXgVU3bxUvvC
         wL3W14NFdqcHYSogqYTOlSDuEfWNCgSZCvAPYabSX4L+9L5K8Bd9EgnUmHGlDBvr4jkc
         S47pj97Nke0iCWj9YrsCFErdnICLdCeUN/NqZxrt1RZ+qnom47CgYP7w3hoS2MABegSV
         K9Rg==
X-Forwarded-Encrypted: i=1; AFNElJ8okm70B64YUqa8JeFlF29RfS3fYE1EffJZgyGxIYXIle7g5rJChTo9Oo5Ez2pWRf9poqBCxthxhHYh@vger.kernel.org
X-Gm-Message-State: AOJu0YxzC7hz35frVGKmXCDy/pECH7ph1RDmzugfJN0zAhRYm99UVfHU
	9Klo9JzfrWnQnPjyjXJ28dY8l8KWJsoO7V2oOwxcHssy+eAM8pSaPaNXgmWsdG3Mn+0=
X-Gm-Gg: Acq92OHCsi4rEtiXXIlYIxd2N71yqBix45dcPj4gpBC/SotngpS3OlnXIMYPfY3sYMO
	Ep1jJ03hX/9bFVEqWXrLFNM91Zo9QVKH7PzPAhEcmxjvpvEhJVtMNMiMjzetDIjEfiHiCyDla74
	bbDIFl9EJemg9HAHuxki8aYUz8IjpwKTzfOsYK4uztYCXq7/6ArP673Qcwhn2NK+8vL1luTlhT6
	Emm63pAmqoys77gE0kKUD110opjmy+SlokWPw21s6Cv07YQieaiTyjXMo3O+h8itVi0M8EzizuM
	geLDorJ3/0Uj+RNTzm/fQ48g6a9ZEic3x3qGnh00tw3Ct+gxIJ5tkd3KUj85CfKc4eujjV9kzvB
	ifUbUAI3HcPs73K95kA+C33905jL3Qru/Q1+Z8KmjytIZlex/QvBvs75Dyy1iW6YtJwR0zwDodF
	WgaMMUH4A/U7nJHVg7ykmmiO6MGPyHnJqDcvdjsc58bp+u3mK4AS2FXiDO3Gk/HecUC5ZkA2+VQ
	WQFpg==
X-Received: by 2002:ac2:414c:0:b0:5aa:635f:7c08 with SMTP id 2adb3069b0e04-5ad2db710dcmr172654e87.7.1781251013504;
        Fri, 12 Jun 2026 00:56:53 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161f69sm329636e87.4.2026.06.12.00.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 00:56:53 -0700 (PDT)
Message-ID: <3ec2bd75-4d88-492e-a8c2-b21000ef2afc@linaro.org>
Date: Fri, 12 Jun 2026 10:56:52 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: shikra: Add CAMSS node
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-3-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-3-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
> with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
> and OPE blocks, so only a single IOMMU context bank is needed.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 99 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 99 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..b93ce4a92a998ea5d9d4268d2fd46030fafc4084 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -604,6 +604,105 @@ opp-384000000 {
>   			};
>   		};
>   
> +		camss: camss@5c11000 {
> +			compatible = "qcom,shikra-camss", "qcom,qcm2290-camss";
> +
> +			reg = <0x0 0x05c11000 0x0 0x1000>,
> +			      <0x0 0x05c6e000 0x0 0x1000>,
> +			      <0x0 0x05c75000 0x0 0x1000>,
> +			      <0x0 0x05c52000 0x0 0x1000>,
> +			      <0x0 0x05c53000 0x0 0x1000>,
> +			      <0x0 0x05c66000 0x0 0x400>,
> +			      <0x0 0x05c68000 0x0 0x400>,
> +			      <0x0 0x05c6f000 0x0 0x4000>,
> +			      <0x0 0x05c76000 0x0 0x4000>;
> +			reg-names = "top",
> +				    "csid0",
> +				    "csid1",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csitpg0",
> +				    "csitpg1",
> +				    "vfe0",
> +				    "vfe1";
> +
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
> +				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
> +				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
> +				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_0_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_1_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
> +			clock-names = "ahb",
> +				      "axi",
> +				      "camnoc_nrt_axi",
> +				      "camnoc_rt_axi",
> +				      "csi0",
> +				      "csi1",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "top_ahb",
> +				      "vfe0",
> +				      "vfe0_cphy_rx",
> +				      "vfe1",
> +				      "vfe1_cphy_rx";
> +
> +			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csitpg0",
> +					  "csitpg1",
> +					  "vfe0",
> +					  "vfe1";
> +
> +			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
> +					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
> +					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
> +					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
> +					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
> +					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
> +			interconnect-names = "ahb",
> +					     "hf_mnoc",
> +					     "sf_mnoc";
> +
> +			iommus = <&apps_smmu 0x400 0x0>;
> +			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;

Please add an empty line between the properties above.

> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +			};
> +		};
> +
>   		qupv3_0: geniqup@4ac0000 {
>   			compatible = "qcom,geni-se-qup";
>   			reg = <0x0 0x04ac0000 0x0 0x2000>;
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
