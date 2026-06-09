Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A574390608
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995238; cv=none; b=sbNuy1aEofrZtrISZ9TQBMLxgZzaaECalFdRl0QAT5SJZ+RoxlgkFOqk+sNP672V1nzqTLXc7G/j1CIqj1QiCZ8+VaMh8awDp7fQupRs5GP7kuK/lYQueYnMroqEFmvVX62RS4TS/nnz+iYXi2ZkZSbYXWnifUV76Ng70luMnbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995238; c=relaxed/simple;
	bh=PeNlJwYLmznoeivJvOkcwrdTA7OLro16oPrB4TKgDsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kV8h/ha+/7LtT+rk3Mrgj0I1XUmAfajFuKCySf5nxOAzQDzPtQlT3Hw4GzU6k6XU3SzmAjSy+mDG2v/gXqQtuQWYUpJOPh6ALBGu7qA0KD2pOyPxFy2HlchW4qH+MYA5nwaMhNI5kOkwlgvEdIjkEdrz1mGsA5PRvMbJK4Jm1HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UxoVll7h; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UxoVll7h"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bec4639953dso949712366b.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780995235; x=1781600035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hZrIRgISj6MusU5WRM9oV6xNWhYPCm9zSf8D1irSjCY=;
        b=UxoVll7hs6Tyo3qSLhGCPZbiMGY6yLnqWIo8RNiPdUy7u++XlAvndqiwuVhsEkqLA9
         oU5Ox+nGpVwFgRv0rkv0ZpWMbs8VHYdJENCjnu5mjBrcn1BBUhOrTne83YKmdHAt4Xol
         KQJfkbz3NRnl3KoeegTjDLroYNitgzRNfdtYz8s/133T82t+igFHSFRiZcuVn6jEHEWR
         kt7Ryi2AKKyddQS+bUwAQSpYHgX5Z46JAnhkLkd9lUUMZHursvudrX9/8npfZIO2dDmJ
         K5DKPOgJpEdit+pv6gixLXR79ys1fWp2Zh65GheR86IRCoJ5MdCEv5UrV3ijWvGKn350
         Q4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995235; x=1781600035;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZrIRgISj6MusU5WRM9oV6xNWhYPCm9zSf8D1irSjCY=;
        b=X9bLf44+VO0ZymabcMyvgxqqhDCGM56r6r+sqqv9sQn/5LvMK5JyeZb4ZTp8rWuW9a
         nWGrj8xorAc5xoJko8KU9NE7dCqRCi1qFt5EOxAYNUutqECPhfpKY4u4Jo37kuCc1uA3
         7UsZuvODgnUZKFCariifyUZGQNLDHPS51s0Rq5rOfWbCYD+2d98ElF8KVe6b0Zq+QiO+
         TSmmCdMclwdqRpAFvnb9Ex3h+yJ2Kl3VEO6jluXj8qZZoYnViaytWd6KXvIXqK63DtPX
         eF9Y2SOL8DM2WMMODvBKqt55xc8xz5zCkr7vCsn/uRUrdtFMir/tnatvnrj2YRCxfHDc
         0Vyg==
X-Forwarded-Encrypted: i=1; AFNElJ99I5ThRnZxp2OJhpre0mYfjZVtEKFmIDcQpXFnqdoQVISbirrPo7ADp3LRtohyGrHfeqH3IcEk1HI0@vger.kernel.org
X-Gm-Message-State: AOJu0YxpjQG4B9SYnFD9HWm0ERpEOzo804WdsHmqa43PAtlYFPQAkTZN
	7A+qXKDx/+hpX/Iyuqg0nFg7FftAGQRB5N+nYB0hc30tsrQYNO43LIZCLtKKS0IndjA=
X-Gm-Gg: Acq92OHe+St4r5ga5pkBJtTGVkJoxPEjDmaAAsZBdidU1XjEfwXyQpSqD2ffp7+YN/b
	CE0NSzp5SPgyvx+m25Kjw7h0frSFfo/1gcVKGBj50tCSi0DskFdNhHGOTPvOGpMg8SNWnzbxsqC
	6ATwiDRxJk61GknA/ujH3/43/XEakfyBi0F22kmowAAUgeLakbk6dz9L1P/clZDJi3iUiBgWyXs
	AB2snaJ/5iDu4J7BzACjyvavpj1oSf8gxq5c6OpiMe0Jm9o+b5EmckbwLct3g89NjYNkYqZcwzG
	LLj882VqZo6TZyXcYHVS6a6l204o29UJFZQ8YX+F9iEQ48e+2dK+5RchCjDDwZCckEnnGtZ5q9l
	JtOGYvM+70nANNWhXE1KZs+1IMZHuxgaQpufadZ+NC5CWlpsnueLqUZa3xZQWiy3CN1hyzXoRPb
	IvEDa/awCaS5SOES2/NrsFuwFNG9CZm1yhC4PmJnCh9Y0HdxmmJ0OUrA0=
X-Received: by 2002:a17:907:1dd3:b0:bf1:1df7:3e50 with SMTP id a640c23a62f3a-bf9365c6399mr65159966b.3.1780995234797;
        Tue, 09 Jun 2026 01:53:54 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.72.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553040a7sm998205466b.50.2026.06.09.01.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:53:54 -0700 (PDT)
Message-ID: <d56d7468-a3e2-43dc-967f-63066bcaf1d6@linaro.org>
Date: Tue, 9 Jun 2026 09:53:53 +0100
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
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260608-shikra-camss-review-v2-3-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2026 15:06, Nihal Kumar Gupta wrote:
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


Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
