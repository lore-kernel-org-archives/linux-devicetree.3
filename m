Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D12434A794
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621487; cv=none; b=hQEytEts+ks/M5vBHjRDvVpPI73fuWzM+EwLzSwK9Et3ez7KU1wJkqeks1JF2WFO/FcG+41rrwB/Q/SmxEsv/o6P91CNE4yWUgO/Ew326/ehY28m3blV8oRiDHBCvbiAqB8BZuDfltgO9v6XWkvtVx3uNoLPa1TKqLE1PhSZqe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621487; c=relaxed/simple;
	bh=U8xSu3XzAInqAwEQoh3UmlLoBFWJ4VbrK55hMH8bD34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o21u9DWUj/vQ7QWnbelMSVt2EfXNSVZZojU5HPxowFIBOD0BBRCM5/p4NHVgojzx/a2JVFk0z981XAz1gkepOp5mQms1HYpXVbadjDRCBDVAdYeuVk8h5BQF7tM4SUnr9x5axLypjnmq9ATz2H8m7zgGLYlucnhwHt+jNkMyQOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QjqmBuJ/; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QjqmBuJ/"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aebd7da975so1249597e87.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784621483; x=1785226283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SHcvhuYIyIQQusxUa8EX0EJ4eua+x7ToG1cGzxehLE8=;
        b=QjqmBuJ/oApKLYJeeCFAwWATE+Eg9WBI5VIkpQo7aZK94nDkYHCzwX3ZauVZvn2KGL
         zwiYwYYgcEtmpSwfB3D4JE03s37aB8szbrHUz1Q4F4aS61RKKKBQzMlCbszS9XgHdFPp
         +SRJ6M99/EZIYikM0HqZ0DyKisnE61P/zYSRcIANhDGodyrWvR4kKXd+/EKxbeyuztgZ
         Cs0G3J58FgFqCm3OeHTYIoQhn27cWsHDnMlcqTWjcVNTSCsa8NUNzUmStCQia7c10DXN
         rdq+MVVgU0efRSoD7dMXtIoa+BQJizHqTkTY3bREUChNbPWY52DP7dKueYPww2RwqU49
         F27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784621483; x=1785226283;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHcvhuYIyIQQusxUa8EX0EJ4eua+x7ToG1cGzxehLE8=;
        b=HPlnP2cXK2CWTqhDqDZjnihxnNN9/Fe1ZLc4qpxemW2fLCMb6rUeAwOUxi9n8sGB/V
         vwH/QUT7uRsQ6GRruYbGVITDMsOLs+lPo0mGEyEpnToPHb/fQKNVc/II5cknpU9fzFe4
         5PkBxal1RkEiMBjRtUiJ3hgzvKA6h4I0pcn6CUb6IeKbtkUaMJhywPBceSkF6lnUUaEK
         8PFMf9lA+eJVUaAc7j91tNoiTZcvAk/wLrl0U5wBS4bO18hRNg0+2LkF2eH7dO7fxYOW
         Q2++Eki/25hGllDf5VOymH0iQS2gAS1yS2JixbFQTbllP1yHAByJpB9UoY9zFZ92i9SG
         RG0g==
X-Forwarded-Encrypted: i=1; AHgh+RqweQ5+d3RK0Y728gnOQ4Fbwq6hWY/IO2fMVFbMx5atsUVPmvWrkyAtqlP0kcao2HHKrKS92HAN0ITn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq7GrfDNZJRQmezb8pVG6sygySzSZul2mee9Rly4pYXY5XHISI
	mnJ1Y0YMntc+dJfaP91IdUyy/PvMZGZNFK430QSZ+LIpjaPRvIw4Ktewj5VU3tmKQrw=
X-Gm-Gg: AR+sD12kNb1X+XT5bs8xqFN513Fh433JZTV1xE5yn3L5eAdJvBzuTm/z5xLLtEn8WIF
	Rn/XULXOVqYWhLAg8erkcmAJ/GWYQyqYnr5p3HEULuqQRqhx34zNWSg4vNdj3iPx5es14aSiSif
	1GfYjrHkQpQRQB4yzti6IFM4ty8hOWJMPoI17yTKYp4+XGOVibjAh4GVBQqRC7xjsqjsDACJ2Q0
	RYFY7m3ieWmr4tJAe0LtW6fk3AOlljmGu/iS/2sZDafawPlYkJbSIWui0ewcb9TGW1xtqx1y/0p
	bYjT40oel3eEjFtGSsm2OMQXe3alcF0mw+436gbjZG0jRzoHPvrsyleEm32h7NhFUuEH54pSxEq
	C7ZBWK4+R0jiqpg03HfjF8hSxDN0vryskt3nTSEwrYvS3kZSAAiPhR4iVv2Yy9PnC9mfygNStdJ
	ClvV7AU+OwxjpNDhPXl21c0Vk7quNXQhsw3jDh79kY4GPWVIcuR3uTk//3N54Pjfa/kss=
X-Received: by 2002:a05:6512:ac4:b0:5b1:5ab9:65d3 with SMTP id 2adb3069b0e04-5b2a4a9a2c9mr406154e87.7.1784621483299;
        Tue, 21 Jul 2026 01:11:23 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291d9a8easm2769969e87.27.2026.07.21.01.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:11:22 -0700 (PDT)
Message-ID: <7e443a2e-4425-41f6-bdfb-0a91ef96bc55@linaro.org>
Date: Tue, 21 Jul 2026 11:11:22 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260719-x1e-csi2-phy-v12-0-cc7311326d1b@linaro.org>
 <20260719-x1e-csi2-phy-v12-1-cc7311326d1b@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260719-x1e-csi2-phy-v12-1-cc7311326d1b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/19/26 16:47, Bryan O'Donoghue wrote:
> Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
> supports both DPHY and CPHY operation. A special mode of DPHY operation -
> called variously split-mode or combo-mode also allows for two sensors to be
> connected to one PHY.
> 
> The submitted binding here describes the DPHY modes of operation only. CPHY
> is left to future work.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 195 +++++++++++++++++++++
>   1 file changed, 195 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..880fe602945cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,195 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm X1E80100 SoC CSI2 PHY
> +
> +maintainers:
> +  - Bryan O'Donoghue <bod@kernel.org>
> +
> +description:
> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
> +  modes.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1e80100-csi2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 1
> +    description:
> +      The single cell specifies the PHY operating mode.
> +

This has been reported before, #phy-cells shall be 0, the operation
mode is selected by bus-type of endpoints as it is described in
video-interfaces.yaml

Two competing values are redundant, the technical discussion has
not been started yet.

> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: timer
> +      - const: ahb
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +  power-domains:
> +    items:
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +      - description: MMCX voltage rail
> +      - description: MXC or MXA voltage rail

Please double check that there is such voltage rail as MXA.

> +
> +  power-domain-names:
> +    items:
> +      - const: top
> +      - const: mmcx
> +      - const: mx
> +
> +  vdda-0p9-supply:
> +    description: Phandle to a 0.9V regulator supply to a PHY.
> +
> +  vdda-1p2-supply:
> +    description: Phandle to 1.2V regulator supply to a PHY.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description:
> +          Sensor input. Always present. A single sensor is described by a
> +          single endpoint with one to four data lanes. DPHY split mode,
> +          where two independent sensors share the same PHY, is described
> +          by two endpoints; endpoint@0 with exactly two data-lanes and
> +          endpoint@1 with exactly one data-lane.
> +        unevaluatedProperties: false
> +
> +        patternProperties:
> +          "^endpoint(@[0-9a-f]+)?$":

endpoint regexp is not corrected, this issue has been reported
previously.

> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - data-lanes
> +              - remote-endpoint
> +
> +        allOf:
> +          - if:
> +              required:
> +                - endpoint@1
> +            then:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    data-lanes:
> +                      minItems: 2
> +                      maxItems: 2
> +                endpoint@1:
> +                  properties:
> +                    data-lanes:
> +                      maxItems: 1
> +              required:
> +                - endpoint@0
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output to the CAMSS CSID controller.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - operating-points-v2
> +  - power-domains
> +  - power-domain-names
> +  - vdda-0p9-supply
> +  - vdda-1p2-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    phy@ace4000 {
> +        compatible = "qcom,x1e80100-csi2-phy";
> +        reg = <0x0ace4000 0x2000>;
> +        #phy-cells = <1>;
> +
> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                 <&camcc CAM_CC_CORE_AHB_CLK>;
> +        clock-names = "core",
> +                      "timer",
> +                      "ahb";
> +
> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        operating-points-v2 = <&csiphy_opp_table>;
> +
> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                        <&rpmhpd RPMHPD_MMCX>,
> +                        <&rpmhpd RPMHPD_MX>;
> +        power-domain-names = "top",
> +                             "mmcx",
> +                             "mx";
> +
> +        vdda-0p9-supply = <&vreg_l2c_0p9>;
> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                csiphy0_in: endpoint {
> +                    data-lanes = <0 1 2 3>;

data-lanes values has not been corrected in accordance to linux-media
requirements.

> +                    remote-endpoint = <&sensor_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                csiphy0_out: endpoint {
> +                    remote-endpoint = <&csid_in>;
> +                };
> +            };
> +        };
> +
> +        csiphy_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-300000000 {
> +                opp-hz = /bits/ 64 <300000000>;
> +                required-opps = <&rpmhpd_opp_low_svs_d1>,
> +                                <&rpmhpd_opp_low_svs_d1>;
> +            };
> +        };
> +    };
> 

-- 
Best wishes,
Vladimir
