Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F37A33B6D0;
	Mon, 20 Jul 2026 11:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546596; cv=none; b=seVOk02xkIcNeeOq991rgBUxPGlIRbfpl1munYH4+7wfNPIjk5OtFCrdCoI6W1KBgCExN3+p2reXdKsw11CikkhiFwIXJ+BmRqj4z4gYuBaQOfW3hEBzWgLCAgMzbWRI02HUQANlnTqm+Oc+VpUsYxuT4oonS+mZhAh62illIu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546596; c=relaxed/simple;
	bh=oYH1UWv4eBuTf8gp/Chf9rss8aJNv0or7XfrIoUTeYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KmLjVDJHqn8+/1hY1csJTxrdQxSf1Zo0x3ieYtRBAaWUZgnbBAxsW8DA6I+k9VSe27bbW8iGeuZfso7jT1f6sVXrRjBqO7oZxIUqVGqpQU+YlT3nQHGmndZYo4l4+w+feD/icptPXE0pXRNHgF0vUc5aJGR8lisG45svrVWjyu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iz8W+HLA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iz8W+HLA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA991F000E9;
	Mon, 20 Jul 2026 11:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784546595;
	bh=d3xVK9YMrUjVB7REq1T+TRl9bzVEeUEnV0J6SaPCm8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Iz8W+HLAWCJ4bghTZP1THbxM0UQQIHKCUmYXoLG5G7ynOYVIJxEutNCnsm1FmQE53
	 ky0gwJQzBzRx/c+BZkAv1kZRCfN+HnETIt9oneWLozvcfoIUJc9WnfxQbMrThMkCCH
	 lUQ00c2c8aobetivIjWBuoLdb+U9q7+ZRedCFF1FY3+WhdCvdDHR7WYTX6mykula6S
	 Q1aQduXZqYoBTDoPAwndsTCl0DwZCiccVzZLoG8i/qHgS+yFaTsFekyDfrrYMNrMdT
	 52xMpuTLeV54CnrppZwVhQMHmIPdPMCRQ9fh6ApCbo70W7a+1KuYpaux7vNNmOWb78
	 6i+YIvpXVdJbg==
Date: Mon, 20 Jul 2026 16:53:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/4] dt-bindings: phy: qcs615-qmp-usb3dp: Add support
 for Shikra SoC
Message-ID: <al4FICuDRLYdPE_8@vaman>
References: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
 <20260712-usb-shikra-phy-v6-v6-2-1b3e51bf1541@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-usb-shikra-phy-v6-v6-2-1b3e51bf1541@oss.qualcomm.com>

On 12-07-26, 20:58, Krishna Kurapati wrote:

Krzysztof okay with this..?

> Declare the USB-C QMP PHY present on the Qualcomm Shikra SoC. Shikra uses
> 3 resets to be programmed before initialising the phy. As per the hardware
> documentation, the third reset is PHY_PRIM_SP0_BCR, hence naming it "phy".
> 
> Also, add remote endpoints and orientation switch support for getting
> Type-C orientation information.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 49 +++++++++++++++++++++-
>  1 file changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
> index efb465c71c1b..98397006fa62 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,qcs615-qmp-usb3-dp-phy
> +      - qcom,shikra-qmp-usb3-dp-phy
>  
>    reg:
>      maxItems: 1
> @@ -33,12 +34,15 @@ properties:
>        - const: pipe
>  
>    resets:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>  
>    reset-names:
> +    minItems: 2
>      items:
>        - const: phy_phy
>        - const: dp_phy
> +      - const: phy
>  
>    vdda-phy-supply: true
>  
> @@ -63,6 +67,22 @@ properties:
>            - description: offset of the PHY mode register
>      description: Clamp and PHY mode register present in the TCSR
>  
> +  orientation-switch:
> +    description:
> +      Flag the PHY as possible handler of USB Type-C orientation switching
> +    type: boolean
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output endpoint of the PHY
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Incoming endpoint from the USB controller
> +
>  required:
>    - compatible
>    - reg
> @@ -78,6 +98,33 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,shikra-qmp-usb3-dp-phy
> +    then:
> +      properties:
> +        resets:
> +          minItems: 3
> +        reset-names:
> +          minItems: 3
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,qcs615-qmp-usb3-dp-phy
> +    then:
> +      properties:
> +        resets:
> +          maxItems: 2
> +        reset-names:
> +          maxItems: 2
> +
>  examples:
>    - |
>      #include <dt-bindings/clock/qcom,qcs615-gcc.h>
> 
> -- 
> 2.34.1

-- 
~Vinod
