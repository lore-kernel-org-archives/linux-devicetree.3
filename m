Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428793;
	b=n3ESgFJZptnvo5xSpbfBd3japqWUzSTdVJ1zMv2HP6WlW0hzWrBcJqs0GN/H60UZkUZ+
	 pIWtVj3nbrobvclt0Z1SkpLzhfs7VYD6UtSkWpfRzUbt2xk1+45TzGvyTSom7I9bxP+PT
	 8B+rz9AS0hlUHNbCTEDhELAKL3wkNFvr2j3zRY3VDPYlqbwjyfoTnzIbCan93Lk7d0JV7
	 SChIiLOp5OLZFotSS27CE9QbN1bo1jjH1cDSweFxQDR3mClw4vY+Vjp5jnM80EsOH822H
	 +W24xx4gsYEFYA4zVvsPIRrXjGLBAtv+aQnPf/MsLG1OFcifxBHgdjMmByDzc67knYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428793;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=8V3O6wyOQ9NrgDMzQPFf7QNUTcuIMnknpuo4OWvqhX4=;
	b=zVT7kwyB4C8RVU+Bhp6k22PanvAqL8akB8fPO4FrNEuXmW6r8vRnMANz9xF7V+Nl/K8R
	 WtnNb57kEaIjQrPOBnx7WNim34yMFPQR1U8i34vrBCmuAccploUTCGdOZMpxrI6/OFmdX
	 UNY6xH01pgznv/jAbIiybr1xp/2l+vS90HS1aDQi1x5PjsQCByovaQCzr0K/qr9HWWzmy
	 gX/MMfQVn5BI7ujXFrW973GmHupEM0Fe9yMWmXk9Itn/FdlmoEuOgvPSYcUsXCsmpoqcr
	 Fr9uQNRBannkZf2HaWbbgAs/uujG4vZDB9caGMY8LOPMRPZKNV4q1JsR9Xuh0HcjqGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="nS/JSCDJ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BB5606A31E;
	Mon, 23 Nov 2026 10:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nS/JSCDJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94251F000D1;
	Mon, 23 Nov 2026 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795428792;
	bh=8V3O6wyOQ9NrgDMzQPFf7QNUTcuIMnknpuo4OWvqhX4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nS/JSCDJsiFO8/ODNh/xFhy6VwhV6pza3huyX7ImGQ1HBn88f+Ow3Lrj8np4dhsGS
	 h0dICaMMRuSnJwZ3EK4uLTtvTbWWNQs1P4w7vmO/d+43bd9HavmG85PSMmOQkXDcsd
	 4mhbmu36W0XGBk8TdhodPiE9TAqyQcMxHO6d6CYh7z2+rIGL+6buexnMhDUXr1hKg8
	 h8Pv5STySrhT5X8uIkfBkqMubbYOGqsm9gfyltoLSsQgVxSyIKIAsccHelnDfPep5A
	 zsAcFGN3SxNdRwpGlFqRB9wkJnSRCP7VoHPCUhPQ0OdVbT0ANvJh+5TyfThjWQzH38
	 NQtr+R2K2gqHA==
Subject: Re: [PATCH net-next v7 1/7] dt-bindings: net: ftgmac100: Make Aspeed
 compatibles standalone
From: netdev-bot+sashiko@kernel.org
To: jacky_chou@aspeedtech.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ratbert@faraday-tech.com, edumazet@kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
Date: Mon, 23 Nov 2026 10:13:11 +0000
Message-ID: <179542879143.3135.17776735347529304516@kernel.org>
In-Reply-To: <20261119-support_ast2700-v7-1-33c8ca2d0dd7@aspeedtech.com>
References: <20261119-support_ast2700-v7-1-33c8ca2d0dd7@aspeedtech.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The binding no longer accepts the established two-string
  compatible form ("aspeed,ast2400/2500/2600-mac", "faraday,ftgmac100"),…
- [Medium] With the new allOf conditionals, no node using the plain
  "faraday,ftgmac100" compatible can pass validation, even though the…
- [Low] The commit message says that binding the AST2400/2500/2600 MACs
  through the generic entry would 'leave the DMA mask too narrow'.
- [Low] For aspeed,ast2500-mac and aspeed,ast2600-mac, the new per-
  compatible block (lines 101-117) limits `clocks` (1-2) and `clock-…

--

dt-bindings: net: ftgmac100: Make Aspeed compatibles standalone

This patch makes aspeed,ast2400-mac, aspeed,ast2500-mac and
aspeed,ast2600-mac standalone compatibles. They no longer need the
"faraday,ftgmac100" fallback. It also adds per-compatible constraints on
clocks and clock-names, and requires clock-names when two clocks are listed.

> The aspeed,ast2400-mac, aspeed,ast2500-mac, and aspeed,ast2600-mac
> compatibles are currently only valid when paired with the generic
> "faraday,ftgmac100" fallback: if a node ever bound through the
> generic entry alone, ftgmac100_probe() would set
> rxdes0_edorr_mask/txdes0_edotr_mask to BIT(15) instead of the Aspeed
> BIT(30), skip Aspeed clock setup, and leave the DMA mask too narrow.

[Severity: Low]
Is the DMA mask part accurate for these three compatibles?

At this commit, drivers/net/ethernet/faraday/ftgmac100.c has no
dma_set_mask*() or DMA_BIT_MASK() call. ftgmac100_probe() uses mac_id for
only three things: picking the EDORR/EDOTR bits, setting is_aspeed, and
calling ftgmac100_setup_clk():

    if (priv->mac_id == FTGMAC100_AST2400 ||
        priv->mac_id == FTGMAC100_AST2500 ||
        priv->mac_id == FTGMAC100_AST2600) {
            priv->rxdes0_edorr_mask = BIT(30);
            priv->txdes0_edotr_mask = BIT(30);
            priv->is_aspeed = true;

Later in the series, the only DMA mask call is
dma_set_mask_and_coherent(..., DMA_BIT_MASK(35)), and it is gated by
FTGMAC100_QUIRK_DMA_35BIT. That quirk is set only for the AST2700 match
data.

Could the "leave the DMA mask too narrow" clause be dropped from the
commit message?

> diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> index d14410018bcf6..9d352e3686aaf 100644
> --- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> +++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> @@ -11,14 +11,11 @@ maintainers:
>  
>  properties:
>    compatible:
> -    oneOf:
> -      - const: faraday,ftgmac100
> -      - items:
> -          - enum:
> -              - aspeed,ast2400-mac
> -              - aspeed,ast2500-mac
> -              - aspeed,ast2600-mac
> -          - const: faraday,ftgmac100
> +    enum:
> +      - faraday,ftgmac100
> +      - aspeed,ast2400-mac
> +      - aspeed,ast2500-mac
> +      - aspeed,ast2600-mac

[Severity: Medium]
With the oneOf/items branch removed, does the established two-string form
("aspeed,astXXXX-mac", "faraday,ftgmac100") become invalid?

Every MAC node in aspeed-g4.dtsi, aspeed-g5.dtsi and aspeed-g6.dtsi uses
that form, for example:

arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:
    compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";

All eight of those nodes would fail dtbs_check as soon as this lands.

The planned follow-up dtsi change would then drop the fallback. Before
commit 03a2aba50b2c ("net: ftgmac100: List all compatibles"),
ftgmac100_of_match[] had only:

    { .compatible = "faraday,ftgmac100" },

Those kernels told the Aspeed variants apart afterwards with
of_device_is_compatible().

Wouldn't a DTB without the fallback leave those older kernels, including
current LTS kernels, with no Ethernet driver bound at all?

The commit message calls binding through the generic entry a hypothetical
hazard ("if a node ever bound through the generic entry alone"). On
kernels before 03a2aba50b2c, that was the only way these nodes bound, and
it worked.

With the current driver, of_match scoring already prefers the more
specific Aspeed string over the fallback. So the two-string form doesn't
run into the problem the commit message describes either.

The impact is mentioned only below the --- line, which is dropped when the
patch is applied. That note also covers only the dtbs_check warnings.

Would keeping the two-string form as a deprecated: true oneOf branch avoid
breaking older kernels? This is still the case at the end of the series.

>  
>    reg:
>      maxItems: 1
> @@ -88,22 +85,76 @@ allOf:

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - aspeed,ast2500-mac
> +              - aspeed,ast2600-mac
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          maxItems: 2
> +        clock-names:
> +          minItems: 1
> +          maxItems: 2
> +      required:
> +        - clocks

[Severity: Low]
Should the clocks and clock-names counts be tied together here?

The two limits are set separately. The later rule only requires
clock-names to be present when two clocks are listed. So this passes:

    clocks = <&a>, <&b>;
    clock-names = "MACCLK";

However, the driver looks up the second clock by name:

drivers/net/ethernet/faraday/ftgmac100.c:ftgmac100_setup_clk() {
    ...
    priv->rclk = devm_clk_get_optional_enabled(priv->dev, "RCLK");
    ...
}

The missing name returns -ENOENT, which the optional API turns into NULL.
Probe then succeeds without enabling the RCLK gate.

The reverse mismatch also passes, and an in-tree example exists. &mac3 in
aspeed-bmc-ampere-mtmitchell.dts has:

    clock-names = "MACCLK", "RCLK";

but it inherits only one clock from aspeed-g6.dtsi. The old schema already
accepted that case, so it isn't new with this patch. Both cases assume
dt-schema has no generic check that a *-names list matches the length of
its property.

> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - aspeed,ast2400-mac
> +                - aspeed,ast2500-mac
> +                - aspeed,ast2600-mac
> +    then:
> +      properties:
> +        clocks: false
> +        clock-names: false
> +  - if:
> +      properties:
> +        clocks:
> +          minItems: 2
> +    then:
> +      required:
> +        - clock-names

[Severity: Medium]
Can a node using the plain "faraday,ftgmac100" compatible pass validation
with these two blocks?

The not-Aspeed block forbids both clocks and clock-names for that
compatible. This last if has no required: [clocks]. When clocks is absent,
the properties check is vacuously true, so the then branch still applies.

The commit message says a faraday,ftgmac100 node should have no clocks
("the plain faraday,ftgmac100 compatible takes none"). Such a node would
get:

    'clock-names' is a required property

even though the block above forbids clock-names.

The driver still binds this compatible through
ftgmac100_match_data_faraday. The examples only cover ast2500 nodes with
clocks, so dt_binding_check doesn't catch this. The blocks are unchanged
at the end of the series.

Would adding required inside the if fix this? For example:

  - if:
      required:
        - clocks
      properties:
        clocks:
          minItems: 2

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119-support_ast2700-v7-0-33c8ca2d0dd7%40aspeedtech.com
