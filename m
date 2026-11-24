Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507347;
	b=2hhjfHh4iCr4sQL/XnxiHceSKmNO/7aqM7J+kSTzRD2I2/UVKFOBB3622NBnvCAOjj3o
	 1Y4BAZ3517vDNsXwmPGQO0+K7IkKljSrts+HxtUgI4cvX4lFFweDUKuLhfDf3ksuVikek
	 nDNA7dk9D2Qx5B2El5w7QmwZrWAA+xXlNNqeC2z5N/3negL8oi7VjbUzqC0iCaihy10/g
	 tja3UnWfAtZ1V0xqJayEGsbDX8lgHQVMMjjhhrjCkgu7KJ/KPrL86cY3/SOKxkwfRmnir
	 J3oyNMbfwe0cziBXwS4gp3/cUUgde9nwEwivLrLgwe97UUU4RzHYIT3011+FlPHnZ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507347;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Cf7qaTF+ZFNZ0uUXBkGQGmF1NTP352oIto3M9Zk0l4w=;
	b=FfZOZfYfciBEnYrVX3kBcvk/hl/9vCaZZNh6shu9GEhcNHDQnWXbBOZeER0CxGipgP3N
	 hpbtO6XxFkRbUoL9t1UHuhEhrrGVMZrrV1lhx6qrLELtiS9Glx2r6gqp+qajuELi3otwK
	 vir9uPfi6I1JfZjLjp1BNghfcW0337dJPHsuSYx/8G5vgqiIm/xhvC8swvXafhdmIA/7s
	 3H1HQIOxEhdvy3lU3UC5Fry3vhC1CymZMFgwFyFBaou/7nRynAXPR9pqplD/fUN7UVhEw
	 f2KIzjUyDh3UYocPe8Z1kG6zfg9O40QpY84bLBF8FZNMYAI3TEDWTo7xhJx54cEenDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="SpRCI/vP";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C55606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SpRCI/vP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECA11F000CA;
	Tue, 24 Nov 2026 08:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795507346;
	bh=Cf7qaTF+ZFNZ0uUXBkGQGmF1NTP352oIto3M9Zk0l4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SpRCI/vP6cWq4OdSQwe9MVpk/eWFRY0mjv8MlDngLGmmWVyyF8nZo7FU397GcH4Vs
	 2NYdL/vdv/mEXQo4mSHVr2dkJCLVl0eBXvEOBRngSu67hAAWWhq/Fc8vER5/4sWZYX
	 uh4/uBNqyAX5OHIpPj+Htq+aVDQVmDds4Rrr5fhB3j53k6M0l9y7eeXPlEGq9BRf+r
	 gD/rI9Opp1hbv+VZnIl1EyJnpIuNcT11a0NcgvXvbqgH5cdaEWOrF0+3LegPpJHv+o
	 Wwc2tuW9HdE3wikIwcfvDV81QWbOp2W3AUyWPNSy3u9MFsIvMLvbXhlYaBQXQaydDj
	 26h7ck74rDshA==
Message-ID: <sashiko-outbox-230698@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: document TH1520
 MIPI DSI controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-th1520-dw-mipi-dsi-v3-1-ffcf2d87971b@iscas.ac.cn>
References: <20261124-th1520-dw-mipi-dsi-v3-0-ffcf2d87971b@iscas.ac.cn>
 <20261124-th1520-dw-mipi-dsi-v3-1-ffcf2d87971b@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 08:02:26 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: display: bridge: interrupts listed before clocks in
  TH1520 DSI
--

commit 3703a20fdf6db19e70c1372e62282477db065d09
Author: Icenowy Zheng <zhengxingda@iscas.ac.cn>

dt-bindings: display: bridge: document TH1520 MIPI DSI controller

This commit adds a Device Tree binding schema for the DesignWare MIPI DSI
host controllers on the T-Head TH1520 SoC.

> diff --git a/Documentation/devicetree/bindings/display/bridge/thead,th152=
0-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/thead=
,th1520-dw-mipi-dsi.yaml
> new file mode 100644
> index 0000000000000..c12afde5fc26b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-mi=
pi-dsi.yaml
> @@ -0,0 +1,103 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: thead,th1520-dw-mipi-dsi
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: DSI controller APB clock
> +      - description: PHY configuration clock
> +      - description: PHY reference clock
> +      - description: DSI controller input pixel clock gate
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: phy_cfg
> +      - const: ref
> +      - const: pixel

[ ... ]

> +      dsi0: dsi@ffef500000 {
> +        compatible =3D "thead,th1520-dw-mipi-dsi";
> +        reg =3D <0xff 0xef500000 0x0 0x1000>;
> +        interrupts =3D <119 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&clk_vo CLK_MIPI_DSI0_PCLK>,
> +                 <&clk_vo CLK_MIPI_DSI0_CFG>,
> +                 <&clk_vo CLK_MIPI_DSI0_REFCLK>,
> +                 <&clk_vo CLK_MIPIDSI0_PIXCLK>;
> +        clock-names =3D "pclk", "phy_cfg", "ref", "pixel";

[Severity: Low]
This isn't a bug, but in both the properties block and the example node,
interrupts is listed before clocks and clock-names.  Could interrupts be
moved after clock-names to match the standard DT property ordering (and the
order already used in the required list)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-th1520-dw-=
mipi-dsi-v3-0-ffcf2d87971b@iscas.ac.cn?part=3D1
