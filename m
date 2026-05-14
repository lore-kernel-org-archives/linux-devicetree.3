Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEE325B098
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 05:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778735860; cv=none; b=cFHQVwNxlKtsxwXgUKoJ2imvePUWIAhYsmk0A7X3Z/vrhcEBJ09Vw+veLC/Bl63nREQSNeQUY7pSCD5vxUqfMIoLTCdwhfYP4xIzIhworY37CfCcZpf8nP2+oGS8LZpWboKJVhJghlzKyy6n1wL2HxshhAhH/VnMTmFGgbt24Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778735860; c=relaxed/simple;
	bh=1IjWY3llMBWroCpaBTuqeax5xUPoC9qv+OlS/SMKqbo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ocTOXe8M0k/5TI7lqkfMqEEcKATyQiDae8PA+aupoXIBx+rv7J7xHvoYe4T184fipsGLyjCKpTOkMfjFQCVM3gcKqTNNq9NPGSm6J3ZbdqZ18QMDII1oDe7cWhXAak2Uzv9dTZD/TO1oFA7qk5NjPDKOATdL6v1LLLXs+f/+9vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AcDRgA+t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcDRgA+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D32C2BCB7;
	Thu, 14 May 2026 05:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778735860;
	bh=1IjWY3llMBWroCpaBTuqeax5xUPoC9qv+OlS/SMKqbo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=AcDRgA+twluLPyZUuv21hm/rqwCUxj2Ll+XUJ38/VHkGTEcEA9CgPI3/0y2Zm/JY+
	 ZLkaI5zQN/9nXfvneRt6Lt584J9gXWM8AAwqQ2Bl6IRBO8p3Xo7gu3sAxsA8Vn5KNe
	 EraDKdfm4FjQKybFcJgLf1Px2DlS8gzf88e0wjyC6QlGUAi9moe57QvJZQE/aBDUeL
	 D+xFufRnVAlEme/ttJnMjSKkyZSa1Z/jyamjOaMuojfyKg0NbwbYRBfU4+I1Tou48g
	 i+0mGuzGjw2AcHoJJ1uzs3qsOEhIC9IcTptWuYtcR/MC4IRiM1LJNnKk+w+M+UGsWn
	 n6brldqqHR94w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: add support for NXPs TJA1145
 CAN transceiver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dimitri Fedrau via B4 Relay" <devnull+dimitri.fedrau.liebherr.com@kernel.org>
Cc: linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, robh@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org
In-Reply-To: <20260513-tja1145-support-v5-1-38720a7ee63e@liebherr.com>
References: <20260513-tja1145-support-v5-1-38720a7ee63e@liebherr.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 05:17:38 +0000
Message-Id: <20260514051738.B2D32C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The dt-binding omits support for the `max-bitrate` property.
- [Medium] The dt-binding omits support for the `interrupts` property for w=
ake-up routing.
--

commit 853ad7c93ebe1c2a625ddddde401c4aaad496a8e
Author: Dimitri Fedrau <dimitri.fedrau@liebherr.com>

dt-bindings: phy: add support for NXPs TJA1145 CAN transceiver

This commit adds documentation for the NXP TJA1145 CAN transceiver, residing
in the generic PHY subsystem bindings. It describes the required SPI
configurations and supply properties for the device.

> diff --git a/Documentation/devicetree/bindings/phy/nxp,tja1145.yaml b/Doc=
umentation/devicetree/bindings/phy/nxp,tja1145.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/nxp,tja1145.yaml

[ ... ]

> +  vbat-supply:
> +    description:
> +      Battery supply voltage
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - spi-cpha
> +
> +additionalProperties: false

Does this binding need to include the max-bitrate property?

This property is standard for CAN transceivers to describe board-level
capability constraints where the layout cannot support the chip's theoretic=
al
maximum speed. Since additionalProperties is set to false, valid device tre=
es
specifying a maximum bitrate will fail validation.

Also, does this device tree binding need support for the interrupts propert=
y?

The TJA1145 supports partial networking and wake-up functionality, which can
route a wake-up signal to an interrupt line on the host processor. With
additionalProperties set to false, it is impossible to describe this hardwa=
re
interrupt routing in the device tree.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-tja1145-su=
pport-v5-0-38720a7ee63e@liebherr.com?part=3D1
