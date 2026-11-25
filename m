Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566500;
	b=Da01C6xa9HX1MovrFo/56OQ6Sqqy18XBQeL0ey9yQsnYPsH12vuEVX9oqWQxgYpnRNfn
	 tss52iHuM5LNP0bizPtw3qBPnzL9KlNmWYkdHmftULRV+nRGY2vc/CjvoDd0FbZFgC7zR
	 dmObeQ/datSnoNNKJy8G4INTEklmiVV9rAPdHNNBTnd8KqnKLrqEr3qZM/tErQY80map1
	 /O2eFOQm2eSf4ImhLI9khjim3DvAfiFK1P8eJI6OllOeBLRnWwPLBKc+5B1GiElK8PRsG
	 FTDAj5xuJ5l+Y3NSHl5rmO11+cLLVyetLHWful72alnZMXD/2TdV93MMM0KVNiqTK0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566500;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=uvcjdmGM+uH5QS9jgj3sj273EnYOZjoyvThLyjhPeyM=;
	b=wMzDshwGSyYJXBLrhuZhv+1v6WyPIYFil7+qfLgV6debx/GKARkeRoTu4AAzvbld+Mg0
	 KixppezBp1QCExJN1D4tE8swvF1AHLxIIGYZB10sh62RvDKvXY8J6s37RGfTEvdQ1q2jX
	 yiP6SIl+TXXmQcFVy8Ww6UbJR/nOaV6Q4BXwoHvjwJB1oPRSByR5mC+bTLMEZbkYoiam6
	 389sVkeXgX1Hpse4BgU4LcHYXBM7E+DV1oXNCBqpYfL8J3Q5hl/Q+w6jdRvHnWAIW8vT6
	 Zl8y/tJJLwS/zv026vlzGbIEa1c2NY4WnX33wDsxEib4Lt1te1nSADmDDJwIdyjkhwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4VDwVPM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807C3606A32D;
	Wed, 25 Nov 2026 00:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4VDwVPM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4C71F000C6;
	Wed, 25 Nov 2026 00:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795566500;
	bh=uvcjdmGM+uH5QS9jgj3sj273EnYOZjoyvThLyjhPeyM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=b4VDwVPMFFeP3ecq2qCD8/Hm9cShfOKBK5OfgDN+XQXw6k3aRwzyS8d4i+Y0PiQ0h
	 l05IgkqmJv7Ipt3NUBlyez82hBuFX7eH5qpf6f20DRjSXL1Vac8XcPg+hAiRGfAfap
	 swI6U0rGWssJKQC4SCc94eFPrWmv1KAezLmoGjRHJmpSKT3caP2oYIoHBK9BSJ9Wgo
	 LayzOn/2H8YACucE0yE2r/hw/dCHZHk5v38XZu9WVCFGcnO6ml4/pYS756QvHhgVC6
	 uj8NOuu2tMLw9tTIXWifXKcp6vfAnz317qlN6aVSXhTp7JIZR0JP+EPrd/OxlKHFvn
	 qqL+VQpGipCvw==
Subject: Re: [PATCH net-next v3 4/5] dt-bindings: net: hisilicon,hisi-gmac-v1:
 Allow fixed-link
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shenjian15@huawei.com,
 shaojijie@huawei.com, devicetree@vger.kernel.org
Date: Wed, 25 Nov 2026 00:28:18 +0000
Message-ID: <179556649875.3135.7423931333453595592@kernel.org>
In-Reply-To: <20261124002442.19414-5-mmyangfl@gmail.com>
References: <20261124002442.19414-5-mmyangfl@gmail.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In Documentation/devicetree/bindings/net/hisilicon,hisi-
  gmac-v1.yaml, this patch states a rule only in the free-text…

--

dt-bindings: net: hisilicon,hisi-gmac-v1: Allow fixed-link

This patch makes phy-handle required only when no fixed-link is present.
It also adds a sentence to the mdio property description saying that, with
a fixed link, the MDIO bus is only registered when an mdio child node is
present.

> diff --git a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
> index a715298259552..c283c1b6ac723 100644
> --- a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
> +++ b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
> @@ -13,6 +13,13 @@ maintainers:
>  allOf:
>    - $ref: /schemas/net/ethernet-controller.yaml#
>    - $ref: /schemas/net/mdio.yaml#
> +  - if:
> +      not:
> +        required:
> +          - fixed-link
> +    then:
> +      required:
> +        - phy-handle
>  
>  properties:
>    compatible:

[ ... ]

> @@ -58,7 +65,8 @@ properties:
>      unevaluatedProperties: false
>      description:
>        Node containing PHY children. If this node is not present, then PHYs will
> -      be direct children.
> +      be direct children. With a fixed link, the MDIO bus is not registered
> +      unless this node is present.

[Severity: Low]
Should this rule be enforced by the schema, rather than stated only in the
description?

The top-level allOf still includes mdio.yaml. Its '@[0-9a-f]+$'
patternProperties allows MDIO device nodes directly under the ethernet
node. The new if/then block only decides whether phy-handle is required.

That means a node with fixed-link and direct children such as
ethernet-phy@N or switch@N, but no mdio subnode, still passes
dt_binding_check.

Later in the series, "net: hix5hd2_gmac: Support fixed-link" makes
hix5hd2_dev_probe() skip MDIO bus registration in that case:

drivers/net/ethernet/hisilicon/hix5hd2_gmac.c:hix5hd2_dev_probe() {
    ...
	if (mdio_np || priv->phy_node != node) {
    ...
}

The driver then ignores those direct children without any warning.

Would an "if: required: [fixed-link]" / "then:" block work here, one that
disallows '@[0-9a-f]+$' children directly on the ethernet node?

Also, the new sentence describes Linux driver behaviour ("the MDIO bus is
not registered") rather than the hardware. The GMAC's MDIO controller and
lines exist whether or not the MAC link is fixed.

Could the text be reworded as a description rule instead? For example: with
fixed-link, MDIO devices must be placed under the mdio node.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124002442.19414-1-mmyangfl%40gmail.com
