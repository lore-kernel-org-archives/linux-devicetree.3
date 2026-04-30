Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4432C3E1D18;
	Thu, 30 Apr 2026 07:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535795; cv=none; b=jZG8fRHFt2pNJqmvPrHcegEbcKRvEIIo92b/BWeGvW97J8bFUaA3u7L0NY66Sv8mpAHyoIIX6Kb9pd/TXKyVr5bw8OYVHCRtFRxC+VLThYTU3//7VBPG0VcmRGk/dKpJNWnncHMrX0FjXVvseWY1YZJle+2h9EwV8VvTX1oMp9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535795; c=relaxed/simple;
	bh=izexGcIwdtyGTJHND8E/q0tfWCcSCGUGo5HOHm0zPtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OOdWZv3p7IvaDo2qC2pcMnd+0+ylapEHmJZGHvi/+JIUAfdYvAJ0wSaFZYI8vF/qHhPkaA9z4Mr+QFWQgUWTvVqxmi3r3/X0K0TbDv9qa9p2x2+o+WdCbSI0fzLX8Clz3L4lVo7bJ+Q2wef2qmKkat4J0RhrIBE66kfC/VfEXtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYsaJNX/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYsaJNX/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB91C2BCB4;
	Thu, 30 Apr 2026 07:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777535794;
	bh=izexGcIwdtyGTJHND8E/q0tfWCcSCGUGo5HOHm0zPtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AYsaJNX/CQOjYCeNvICWroD8akoGwIQ0LoaykxGr7zvn7J4IxIr1BkgyeKU4iVQHY
	 NhsBJBadIh1ACEsyTqGpta4tqEoZhSnFbUI0yrLE9PbYcpHyPqB8JX4cW8F/nWonh6
	 9xklaskRHq/BL/MYOSBqYwKSXLtK4ZtIlZURMU7pkxiNgLyJ4fDVERusTpNIY0Q/Zu
	 U/9w2kWPPLhnaDcVPwqcA6qD0dCNj5qx89YTzstIrB7HZ48snF49+0mSRdNlElJjdz
	 TAANz3dOsVqx/fUmqNLIajoVxKpfWyBkVRax6niQuZM+0OJaR90tdD+36HYhecNmyO
	 R9x5PrUeQAFVQ==
Date: Thu, 30 Apr 2026 09:56:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: syyang@lontium.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, 
	maarten.lankhorst@linux.intel.com, rfoss@kernel.org, mripard@kernel.org, 
	Laurent.pinchart@ideasonboard.com, tzimmermann@suse.de, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	yangsunyun1993@gmail.com, xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com, 
	rlyu@lontium.com, xbpeng@lontium.com
Subject: Re: [PATCH v3 1/2] dt-bindings:bridge: Add Lontiun LT7911EXC eDP to
 MIPI DSI bridge
Message-ID: <20260430-gainful-hopping-quokka-da7e7b@quoll>
References: <20260429040541.3404116-1-syyang@lontium.com>
 <20260429040541.3404116-2-syyang@lontium.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429040541.3404116-2-syyang@lontium.com>

On Wed, Apr 29, 2026 at 12:05:40PM +0800, syyang@lontium.com wrote:
> From: Sunyun Yang <syyang@lontium.com>
> 
> The LT7911EXC is an I2C-controlled bridge that Receiver eDP1.4
> and output signal/dual port mipi.
> 
> Signed-off-by: Sunyun Yang <syyang@lontium.com>

Missing space after ':' in subject.

...

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for MIPI DSI output.

Wrong description, first is input. Look at your DTS.

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for eDP input.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - vdd-supply
> +  - vcc-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        mipi-bridge@41 {
> +            compatible = "lontium,lt7911exc";
> +            reg = <0x41>;
> +            reset-gpios = <&gpy8 8 GPIO_ACTIVE_LOW>;
> +            vdd-supply = <&lt7911exc_1v2>;
> +            vcc-supply = <&lt7911exc_3v3>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    bridge_in: endpoint {
> +                        remote-endpoint = <&edp_out>;
> +                    };
> +                };

Best regards,
Krzysztof

