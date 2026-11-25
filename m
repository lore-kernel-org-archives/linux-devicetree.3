Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617119;
	b=uEd43O64bkL8/TZwcGLtOcqv9MtFUB4vYuW+5TfFG9FJILtlt6/IUdmnSCFTQFh1A/aq
	 40ltyHhlGwVETpKjJRh5jBht0GdFTpFpYktsCUrjbXgYHJ3fmC5C01OqoJwSrQUESevw3
	 X3aFjSdSo4KXfJBM1BuZYv66qeZD/1BuhssVeLzY+/ybH0yFuJde8uVwFZhqISfj3PSAj
	 XEtNUF9DRgfwOp871391FMYsMfLffBe82hwKo7XL/AQMHWHjbpPT9mRIxCD07UWQm5VmJ
	 bcSgSU6qkXZVT4UQ56spdp1dz4R4vYvndTo8opzdTXGGDtiHKvT+Q/JkRVCN7W33/6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=zKfRowNSGjVA87CJ4mW494zsgUl/v5ojHBz8f5BNf/0=;
	b=gn2xa4CG6SIMa5bojwrxUXgJ3UefvtUSVaysUm9K8ZFR1Us4PUHfZHxBla2qdRHxxysS
	 YuKjJVBO3AYSwEh3ROtfdkU/leWt0PSXV1IYoasxdloum7Sy2zYdweYVco4kavA6tqC+h
	 1SgWOuu0AWeYTYd8YdvhVbNDwhcMlXv/QAKEYJv7UKCXDr2jeBiKyivEaCqMpYigVFsdF
	 uQ80LfE3R6rsLeT3zzkoCJC0KAYw6lTleEqd9vOFsCsTfmPHzNT7eGC6+6XGx2unVbX8f
	 MD5AxbeTLahLuIRqKJ+WxPAEhUuIrweEKEXjPgcL1iv/8rXWv+5vRgIvhG4HEO8b/aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AdI7v2p2;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9935606A329
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9935606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AdI7v2p2
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3adfb0c9e3cso4821851fa.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795617117; x=1796221917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zKfRowNSGjVA87CJ4mW494zsgUl/v5ojHBz8f5BNf/0=;
        b=AdI7v2p2DEnGcimvFHEZ5FVOQzGh9kkiGvTi8IyruIj4NZ9mtrDkotiCBgY8hdHcFJ
         J5vpTFTxElIV3Bfd2gJcR1dSzv9XNkGP/Y0is5nM+gHP5MukTCaUJCZEQ8hSJseL55RE
         9pbRCy1oNY2TNyYScIOM1eRVC1Hri+fvfQDSLHPgqTwElpBzAVbJA8jxApn2x2T8VfsP
         IGHTrD/GtpvO070Qkv/SUBdfTuZ0JEoOhcQ3FIPntQb1Op/aFvCZBb4v2QSDSv+JGXbj
         R/+TsbRhLAZNI5ttbtA0lnVW62/WUQaEZ8x3ikZL6ByIq294H0YzOwl+eW6ZmxOTGZbq
         aPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617117; x=1796221917;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zKfRowNSGjVA87CJ4mW494zsgUl/v5ojHBz8f5BNf/0=;
        b=zawBEg8i5QGUHLqMG+NQwNw/V+IFQb+ls7pZQNFwc0lr554RdWJprINDUSg0YhWEbs
         DEUP8apIkaV/jPSe7S7A6jKLQ2htyZ1rczcFiOXEjkUTGOndbrLk5iI+tA3l/oT5KKfy
         Nx3LzP/UqyiGv2x9LEGAiSanKmb6By7BihekY/pf+0eXWnVMzibM4CPhxhH9OG7Ib9tU
         w17+TjNtI0HOmFRYIWK76na6kbJ/kkJh9xHC4EckBBsJG828q2lWaUIz3E93LH66nBup
         8SUxKx0omTVWWOw7htToWV+vfj/iFcU0k0H5V/s7B+jAwil9/h+pLaTJUoTbj7kTTFyz
         eQ6A==
X-Forwarded-Encrypted: i=1; AL+hErELhdm8XAWN/ntSPBAWPFUvHl7rlVq13R6Bgq7MV2tH7yceWIPPb9ZCA8NW6to+CVQjBDIBwO3jCnb6@vger.kernel.org
X-Gm-Message-State: APuU4Z/ungj1YBWsFS1RXrxOGYXGD/Iewue1BQHlofBVdqQqAEmAMXk+
	rMHvB/XL/ihJ6fYoooI28TvOSNedJh4Speg5pWtTjRmjqCfEjSwE+Caq3Xv4OkUhz6FQPn7ZWHs
	5syMADoc=
X-Gm-Gg: AZFdTZegTz+bMHvZgei7r/HykU0vyFLMoSqPXhMriFR4sx1pPLbHuIdkj4GexuRPBhw
	a4/u//nkwu3SxwWRYv9NK4Xhfqqe7g6zIDbFAwtb0Eu6t+fRlYNEjSXF3m/74BMfggVmNOXadKp
	bFODv7OHpZgfWlFx2x/b49ZYXf4H7UdnkfoZ4wnvdNMbaHjUSSu4bslq7PCImDpkV26k6Np7isW
	C7OA8/hGuLEAgt+gU9KFbtufyvNg9GTz6gDSh/ZbJP9AfBNR1qCYICTNP4Z0h1zSRwIeq7wqTr6
	wKakpQ5+Z322YC89LiBDY4OpAMTPIwd9R6kMjWyu6iK2Y2PPB6SfxkvHZ75tjx0p7N9wRk9pqq5
	ug9nTVBX6OiU248kYxIGfZ1zAI4mzG0eflBqtE7dVN3DOEXzzoxjdrZeRieeLE0nCeFLBwgNSit
	KnQRhrcComF/825DK6HbCFH+wue/RimWRa7gT+0MfhUYhgWvnl1uEtw+AQH/EUrAKl9Pe2DUsIq
	rD6g+DFkGeAv1kLKn9WPGjnxi98/OTZXzGeTKV1lyJAZ4z5+MUxS0ekma8LNMhoK9j7tedMlmCf
	S8nWnQhDaDFGNi9RuPcbGmGP/60s1vR4nJ85b00brwifIWEo9uZka1yZbNmst5F/t6rqv4QftSC
	T8d86/Rc=
X-Received: by 2002:a2e:a28e:0:b0:3ac:dec0:158e with SMTP id 38308e7fff4ca-3ae7f9f3418mr40722721fa.2.1795617116747;
        Wed, 25 Nov 2026 06:31:56 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8053568esm50069981fa.25.2026.11.25.06.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:31:56 -0800 (PST)
Message-ID: <bac87368-6a84-4c75-ad25-b2fdea432b72@linaro.org>
Date: Wed, 25 Nov 2026 16:31:55 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: media: qcom,glymur-camss: Add Glymur
 CAMSS
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-2-d7c2983d6d7b@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260925-glymur_camss-v4-2-d7c2983d6d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 08:48, Nihal Kumar Gupta wrote:
> Glymur uses only the new PHY API via standalone phy@ child nodes,
> so per-CSIPHY clocks, interrupts and supplies are absent here.
> 
> X1E80100 has four CSIPHY instances while Glymur has three
> (CSIPHY0, CSIPHY1, CSIPHY4).
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,glymur-camss.yaml          | 300 +++++++++++++++++++++
>   1 file changed, 300 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a0b77edc212319fad69113f3d55ca24f184d4b23
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> @@ -0,0 +1,300 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,glymur-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Glymur Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,glymur-camss
> +
> +  reg:
> +    maxItems: 13
> +
> +  reg-names:
> +    items:
> +      - const: csid_wrapper
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: csitpg2

I believe CAMSS on SM8350 and before has TPG as a CSID IP function, but
since then TPGs are seperate I/O blocks. It might be more appropriate
to give "tpgX" names (like it's done for sa8775p and qcs8300), and I do
understand that "csitpgX" were selected just to get a compatibility with
the reused X1E TPG names, which might be not a good enough reason...

> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  clocks:
> +    maxItems: 20
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_nrt_axi
> +      - const: camnoc_rt_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb
> +      - const: cpas_vfe0
> +      - const: cpas_vfe1
> +      - const: cpas_vfe_lite
> +      - const: csid
> +      - const: csid_csiphy_rx
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    maxItems: 9
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +      - const: sf_mnoc
> +      - const: sf_icp_mnoc
> +
> +  iommus:
> +    items:
> +      - description: S1 HLOS IFE and IFE_LITE non-protected
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: top
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-3]$":

Reading the commit message, I develop a feeling that it might make sense
to change the regexp to [014] or something like that.

> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,glymur-gcc.h>
> +    #include <dt-bindings/clock/qcom,glymur-camcc.h>
> +    #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss: isp@acb6000 {
> +            compatible = "qcom,glymur-camss";
> +
> +            reg = <0x0 0x0acb6000 0x0 0x1000>,
> +                  <0x0 0x0acb7000 0x0 0x2000>,
> +                  <0x0 0x0acb9000 0x0 0x2000>,
> +                  <0x0 0x0acbb000 0x0 0x2000>,
> +                  <0x0 0x0acc6000 0x0 0x1000>,
> +                  <0x0 0x0acca000 0x0 0x1000>,
> +                  <0x0 0x0acf6000 0x0 0x1000>,
> +                  <0x0 0x0acf7000 0x0 0x1000>,
> +                  <0x0 0x0acf8000 0x0 0x1000>,
> +                  <0x0 0x0ac62000 0x0 0xf000>,
> +                  <0x0 0x0ac71000 0x0 0xf000>,
> +                  <0x0 0x0acc7000 0x0 0x2000>,
> +                  <0x0 0x0accb000 0x0 0x2000>;
> +            reg-names = "csid_wrapper",
> +                        "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite0",
> +                        "csid_lite1",
> +                        "csitpg0",
> +                        "csitpg1",
> +                        "csitpg2",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe_lite0",
> +                        "vfe_lite1";
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +                     <&camcc CAM_CC_CORE_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_CSID_CLK>,
> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CLK>,
> +                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CLK>,
> +                     <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +            clock-names = "camnoc_nrt_axi",
> +                          "camnoc_rt_axi",
> +                          "core_ahb",
> +                          "cpas_ahb",
> +                          "cpas_fast_ahb",
> +                          "cpas_vfe0",
> +                          "cpas_vfe1",
> +                          "cpas_vfe_lite",
> +                          "csid",
> +                          "csid_csiphy_rx",
> +                          "gcc_axi_hf",
> +                          "gcc_axi_sf",
> +                          "vfe0",
> +                          "vfe0_fast_ahb",
> +                          "vfe1",
> +                          "vfe1_fast_ahb",
> +                          "vfe_lite",
> +                          "vfe_lite_ahb",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid";
> +
> +            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 458 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 860 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite0",
> +                              "csid_lite1",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe_lite0",
> +                              "vfe_lite1";
> +
> +            interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +            interconnect-names = "ahb",
> +                                 "hf_mnoc",
> +                                 "sf_mnoc",
> +                                 "sf_icp_mnoc";
> +
> +            iommus = <&apps_smmu 0x800 0x20>;
> +
> +            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +                            <&camcc CAM_CC_IFE_1_GDSC>,
> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +            power-domain-names = "ife0",
> +                                 "ife1",
> +                                 "top";
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    camss_csiphy0_ep: endpoint {
> +                        data-lanes = <1 2 3 4>;
> +                        remote-endpoint = <&csiphy0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    camss_csiphy1_ep: endpoint {
> +                        data-lanes = <1 2 3 4>;
> +                        remote-endpoint = <&csiphy1_out>;
> +                    };
> +                };
> +
> +                port@3 {
> +                    reg = <3>;
> +                    camss_csiphy4_ep: endpoint {

Here is a mismatch between port number and link name, please
double check, if it is intended.

> +                        data-lanes = <1 2 3 4>;
> +                        remote-endpoint = <&csiphy4_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> 

-- 
Best wishes,
Vladimir
