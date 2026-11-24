Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547248;
	b=i0rAIBDH9+CpU8wmz5d4D+KVJrLs9ghftyXs+88LGFxEfyYx+/Ql1qf2KHzF/NgOhVhq
	 BhLbO8mmY+7i6AyvE2iZlvCGCJeAea4MNxeHJ/n9siBU0D9EM4Mv9g55g8U0ib0ptZJLe
	 tEAHkQhW/HNHfBOvL0O/DQXubshkvl5ed4o5hPgPsnaT/pxkx5UvjtiTE4SsI3DR8vdrh
	 Qen1WzTLj8hoygeLxwSo+JKUYXNPfFBlQj3DXrprTHpc1ojQHXgeIljeovSawlsmVdjV+
	 cwHKCYt7iLFLSrZfSLBpbbTBMxPZ1vxnvkV31Cb8OsAb0WLgFjtft1UUt/DAiIsdI0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547248;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=hcyQ4mkEgZ0lMnjgED6npY7t2QIURd34rU2TnUW9EkY=;
	b=4aVMq0C6b4u+1HFT29U/svmrdsVP2vuygw8lkNLjmGvXFvOFsehhp3RE8pDvH78IrnCk
	 /qxr0YIcQxRLjjuIs1lqdH/4mS5uBz8OruRTQCa6jth1lTn7rY1JufckKfPqID7NmVg9e
	 C/Cte7rfrm9bKUPPr98KXkWicVB/rJcp3MwO24/4aAabxQ8olA3Eiu9AQGvlKaR6e/iVS
	 rJknP4joqa3+Q9t7T3a4CO6fgYJ+a5ukHe/hRzQY/dpWtRY+xMVlTTffdMQCgtYLLwubJ
	 b8dtBxRI2BzUbC/DtSljBhWS6zqdmiWwG9e4HmE8vPkFNVY0apVUB8TTfAqB7N7S9rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BU6i5nEy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37B6606A323;
	Tue, 24 Nov 2026 19:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BU6i5nEy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592841F000E6;
	Tue, 24 Nov 2026 19:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795547247;
	bh=hcyQ4mkEgZ0lMnjgED6npY7t2QIURd34rU2TnUW9EkY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BU6i5nEymqMyRs6doXmJGcRc7OqHkzotGGww5bwY2P65H0kXqa6xFrKcN/1AbnZQS
	 Eo/ARzo74IfLdE88T4iwa9UU8bM2lSZRuMwvO9IAR/hMhTwJsLYqQaI3Dv9VB9QXgi
	 YOuqs6+4JtNB5IJtIJhGBiPFTY+3grZ5/xOoNGFMLp2gXOLUEoSK2hQU5mAclw6LKZ
	 QC26+AIydwDjpV0jYF8ImcQhKyDBm6yJcpQMvjd88lmgaMN2+iqJaKzSXpahcWA1+t
	 FRx6N6z94hlVUZCfM2+mn9yf7vxv8O+DFtesgbmZavwuB94tkZiw6H2M7xGdttVdR3
	 jUGOyd46/6Eag==
Subject:
 Re: [PATCH net-next 1/3] dt-bindings: net: Add Cortina CS7542 MDIO controller
From: netdev-bot+sashiko@kernel.org
To: filipp.dunsky@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 andrew+netdev@lunn.ch, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 19:07:25 +0000
Message-ID: <179554724588.3135.13754934088283070222@kernel.org>
In-Reply-To: <20261123-b4-cs7542-mdio-v1-1-626d0a0e3b4d@gmail.com>
References: <20261123-b4-cs7542-mdio-v1-1-626d0a0e3b4d@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The binding states the CS7542 MDIO block has an MDC prescaler.
- [Low] The CS7542 MDIO binding
  (Documentation/devicetree/bindings/net/cortina,cs7542-mdio.yaml)…

--

dt-bindings: net: Add Cortina CS7542 MDIO controller

This adds a YAML binding for the Cortina CS7542 Clause 22 MDIO controller.
The binding references mdio.yaml and requires compatible, reg and the cell
properties. It disallows clock-frequency and suppress-preamble because the
MDC prescaler set by firmware is kept as is.

> diff --git a/Documentation/devicetree/bindings/net/cortina,cs7542-mdio.yaml b/Documentation/devicetree/bindings/net/cortina,cs7542-mdio.yaml
> new file mode 100644
> index 0000000000000..77b5e2f09f423
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/cortina,cs7542-mdio.yaml
> @@ -0,0 +1,48 @@

[ ... ]

> +description:
> +  Clause 22 MDIO controller. Firmware configures the MDC prescaler before
> +  the operating system starts; the driver retains this setting.
> +
> +allOf:
> +  - $ref: mdio.yaml#
> +
> +properties:
> +  compatible:
> +    const: cortina,cs7542-mdio
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-frequency: false
> +  suppress-preamble: false

[Severity: Low]
Do these two false constraints describe a hardware limit, or only what the
current driver does?

The description talks about what "the driver retains". The MDC prescaler
also looks like a programmable register. cs75xx_mdio_probe() in
drivers/net/mdio/mdio-cs75xx.c, added later in this series, reads it and
writes it back:

    cfg = readl(priv->base + PER_MDIO_CFG);
    /* The firmware configures the MDC rate; retain its prescaler. */
    cfg |= MDIO_CFG_MANUAL;
    writel(cfg, priv->base + PER_MDIO_CFG);

So the hardware seems able to set the MDC rate. Rejecting clock-frequency
then only reflects that the Linux driver doesn't implement it. Nothing in
the binding says the hardware can't suppress the preamble either.

Documentation/devicetree/bindings/writing-bindings.rst says bindings should
not refer to Linux or "device driver". It also says they should be based on
what the hardware has, not on what an OS and driver currently support.

With this binding, a board whose PHYs need a different MDC rate has no
valid way to say so. dt_binding_check also rejects these standard
mdio.yaml properties.

The commit message has the same problem:

  clock-frequency and preamble suppression are not supported.

This reads like a hardware limitation.

Could the description be reworded to describe the hardware? And could the
false entries be dropped unless the hardware really lacks these features?

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +unevaluatedProperties: false

[Severity: Medium]
Is this schema missing an input clock, and possibly a reset?

The description says the block has an MDC prescaler, which means it
divides some input clock. The schema only adds compatible and reg on top of
mdio.yaml. With unevaluatedProperties: false, any DT node that has a clocks
or resets property fails validation.

writing-bindings.rst asks for complete bindings in this case:

  - DO attempt to make bindings complete even if a driver doesn't support
    some features.

cs75xx_mdio_probe(), added later in the series, never gets or enables a
clock:

    priv->base = devm_platform_ioremap_resource(pdev, 0);
    ...
    return devm_of_mdiobus_register(dev, bus, dev->of_node);

What if a Linux clock driver manages the parent clock? clk_disable_unused()
could gate it at late_initcall. Every access would then time out in the
readl_poll_timeout_atomic() call in cs75xx_mdio_wait(), and the attached
PHYs would be unusable.

A rate change on a shared parent clock would also change MDC without
notice, since the driver keeps the firmware divider and never recomputes
it. That could push MDC above the 2.5 MHz Clause 22 limit.

There is no CS7542 clock driver or DTS in the tree yet. So the runtime
failure depends on whether that clock can actually be gated or changed.

If a required clocks property is added later, though, existing DTs written
against this binding would stop validating.

Would it be better to describe the clock now?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123-b4-cs7542-mdio-v1-0-626d0a0e3b4d%40gmail.com
