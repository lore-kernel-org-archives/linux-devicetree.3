Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428794;
	b=1u062Qn/9H4eT+gpKSnxpscUasN1vMCnKQzbmCnM4sI+tO0NAuJt0IGR1ClIAGzwzTMh
	 YjWZ7k7WEeHzQFkf6vsg3CjEWuKi9IDPkNTCetKoqDl1R6swBg2ZhUxv7eblhh03DyU14
	 5edhDcH/Zfspp3x8Y1XREbEUy3jNrIGDlAeMpRpm0oYwkRrJPq5DNfv7VLqJXPSBAQFo/
	 4NPZvElwOgF/UZpQrL6Gb6xLDcaKt7EMyai1rgB97g3huK+xFnapIdOMPkQcvgEWnuaSx
	 v9LwGyP14nX9uA39rNH10NSUcrosE0nsuFzlkXMTaOlKFxqoix/+R8+aNeoZwvLrh+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428794;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=aCAKYfoCvQ9vLmGln50tXMVwiUj0VV55OA5yXQEIa6E=;
	b=LwzoI+4qaewB7nvKs/39JY3ikhpmgeD+daRDrR5BXIk3pheJWNFVqJrTvjYvHFztzCWl
	 tezruowDBv6BSHNi5nX6RewPdgr+Yh36fIHaQXX6Pv43ffXnCzBMhe3P4QJlZEryJfy9F
	 yZ6anqZ7l8hDsJpMJxyGFoBDf06x9iSAp5GqeDkHoqMvDdxphSME5Glp3iwC7uMvHVkk3
	 XH+iH8Qy2lvYj0saLslQWxBQwb324aRQEQcrxs0u9eGw4dF+OcB547wdCP/Qr3/W0l4Fx
	 8Z+/oTdKdDMLJBQZOQrW7/31y7TcWzDLeeFYY1XmFPxV1nIPn90a42AuusmtLGIiowQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o1f+q4HZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF74E606A331;
	Mon, 23 Nov 2026 10:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o1f+q4HZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F621F000CF;
	Mon, 23 Nov 2026 10:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795428794;
	bh=aCAKYfoCvQ9vLmGln50tXMVwiUj0VV55OA5yXQEIa6E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=o1f+q4HZI9J1syulAoNfTREYpzL4c2B8aSA66W94knoBv9IH4KYDmrLt7DJYkg3dO
	 wlyKITCku7VK/cLSDHFWygw/b8smAASFVcF0UuSbsoAD4Yf3zvzWBmTQ6bpopJxCzI
	 MpsxOg9Gw/cFv++LZ1gS+9x5sIxnPTZT+5KraLyyF0HHufVjOZZu0IdT1QjY9bAOHA
	 8WXy6EMMheMjMFcvIKjCG3im0ywkvB8uuLmL/ahnFGx35Axwm0aRpHAokwK4yL8JAv
	 ze4LnQjttgyJz+ZrweR9/JETH3SZstqj4x4RzIQu2ZHZA5QYd7OkV4GwFNXN3TDYLT
	 z7OI7+QGIYVTA==
Subject: Re: [PATCH net-next v7 2/7] dt-bindings: net: ftgmac100: Add AST2700
 compatible
From: netdev-bot+sashiko@kernel.org
To: jacky_chou@aspeedtech.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ratbert@faraday-tech.com, edumazet@kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
Date: Mon, 23 Nov 2026 10:13:13 +0000
Message-ID: <179542879318.3135.2219798604934758241@kernel.org>
In-Reply-To: <20261119-support_ast2700-v7-2-33c8ca2d0dd7@aspeedtech.com>
References: <20261119-support_ast2700-v7-2-33c8ca2d0dd7@aspeedtech.com>
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

- [Low] Concern: the commit message for "dt-bindings: net: ftgmac100: Add
  AST2700 compatible" says "ftgmac100_probe_dt() takes the NC-SI path…
- [Low] In "dt-bindings: net: ftgmac100: Add AST2700 compatible", the new
  AST2700 conditional in…
- [Low] Concern: the binding adds `aspeed,ast2700-mac` as a standalone
  compatible, but at this commit…

--

dt-bindings: net: ftgmac100: Add AST2700 compatible

This commit adds aspeed,ast2700-mac to the ftgmac100 binding. It allows the
reset line for it and adds it to the clocks/clock-names conditionals. It
also adds an AST2700-only rule that requires exactly one of phy-mode or
use-ncsi.

> Require exactly one of "phy-mode" or "use-ncsi" in the device tree
> when the AST2700 compatible is used. The driver only enforces
> "phy-mode" when NC-SI is not in use: ftgmac100_probe_dt() takes the
> NC-SI path before ftgmac100_mii_probe(), where the AST2700 phy-mode
> check lives, is ever reached.

[Severity: Low]
At this commit, ftgmac100_mii_probe() in
drivers/net/ethernet/faraday/ftgmac100.c has no AST2700 phy-mode check. It
falls back to RGMII when phy-mode is missing.

Does this paragraph refer to the check added later in the series by
"net: ftgmac100: Require phy-mode for AST2700"?

ftgmac100_mii_probe() {
    ...
	err = of_get_phy_mode(np, &phy_intf);
	if (err) {
		if (priv->mac_id == FTGMAC100_AST2700) {
			dev_err(priv->dev, "phy-mode is required for this SoC\n");
			return -EINVAL;
		}
    ...
}

After the full series is applied, the description matches the code. That
is because ftgmac100_probe_dt() returns through ftgmac100_probe_ncsi()
before it reaches ftgmac100_mii_probe(). Could the message say that a
following patch adds the check, so it is also accurate at this commit?

> diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> index 9d352e3686aaf..95f4993939cf6 100644
> --- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> +++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> @@ -16,6 +16,7 @@ properties:
>        - aspeed,ast2400-mac
>        - aspeed,ast2500-mac
>        - aspeed,ast2600-mac
> +      - aspeed,ast2700-mac

[Severity: Low]
At this commit, ftgmac100_of_match[] in
drivers/net/ethernet/faraday/ftgmac100.c has no entry for
aspeed,ast2700-mac. There is also no FTGMAC100_AST2700 mac_id and no
is_aspeed handling. Can a schema-valid AST2700 node bind to the driver at
this point?

The next patch in the series, "net: ftgmac100: Add AST2700 compatible
support", appears to fix this by adding:

	{ .compatible = "aspeed,ast2700-mac",
	  .data = &ftgmac100_match_data_ast2700 },

It also adds FTGMAC100_AST2700 to the is_aspeed branch of
ftgmac100_probe(). Adding the binding before the driver is the usual
order, and no in-tree DTS uses this compatible yet. I'm mentioning it only
for completeness.

[ ... ]

> @@ -79,12 +80,24 @@ allOf:
>            contains:
>              enum:
>                - aspeed,ast2600-mac
> +              - aspeed,ast2700-mac
>      then:
>        properties:
>          resets: true
>      else:
>        properties:
>          resets: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2700-mac
> +    then:
> +      oneOf:
> +        - required:
> +            - phy-mode
> +        - required:
> +            - use-ncsi

[Severity: Low]
oneOf fails when both subschemas match. Will an AST2700 node with both
phy-mode = "rmii" and use-ncsi then fail dtbs_check?

The driver accepts that combination. ftgmac100_probe_dt() checks use-ncsi
first:

	if (of_get_property(np, "use-ncsi", NULL))
		return ftgmac100_probe_ncsi(netdev, priv, pdev);

ftgmac100_probe_ncsi() then always connects with RMII and never reads
phy-mode:

	err = phy_connect_direct(netdev, phydev, ftgmac100_adjust_link,
				 PHY_INTERFACE_MODE_RMII);

Existing nodes for this binding already use this pairing, for example
&mac2 and &mac3 in aspeed-bmc-asus-x4tf.dts:

	phy-mode = "rmii";
	use-ncsi;

The same pattern appears in aspeed-bmc-inventec-starscream.dts,
aspeed-bmc-nvidia-gb200nvl-bmc.dts and aspeed-bmc-quanta-s6q.dts.

The commit message's stated reason is to avoid rejecting nodes that only
have use-ncsi, and anyOf would do that too. Would anyOf fit better here?

If the goal is to stop a non-RMII mode from being used with NC-SI, a rule
like "if: required: [use-ncsi] then: properties: phy-mode: const: rmii"
could express that instead.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119-support_ast2700-v7-0-33c8ca2d0dd7%40aspeedtech.com
