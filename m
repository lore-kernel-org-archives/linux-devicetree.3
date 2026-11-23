Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450315;
	b=LpKpJ6rP/3xYQElJZtaEEgIR1DNHBbl3oMDzOcKd5sD1dAkMoYnVBDIuCZjj9tp9dS7N
	 S8ihBgy6a4jqpE/87CxkWb8/TEVEMZuS6DJoYDiL8518HlFWezFn/fQuNBtzZzMYnxuER
	 LDUOcNcVvCEO1dVS9JxIfsOav2GH4LIREjnOmsyB5lcgbGZa8MnRCr0MgWn9mzjRjIbfW
	 GFVh3Se9VxaQ7iBS7IurskXLVdTOcX4/dhWtoZcJzHd8Mp8iuK4xujJOPkKr5oZw0G1fP
	 3FYT1vqPxrXHDohO2efDo22597ftWpKogvlAxwG39g8LPbcb9XYo4XQ52wCsc0+oNZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450315;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=CuV1HgSyHeqmHnQ6X0W8EKjH6rdyvaViJZVeUHENJ3o=;
	b=e2YtJA1QKnM4f8B0lZtFJ3pST8l9DAIoZrvws5ZG1nsAOmkGUIAtHpLTSxAnzbtA1z9b
	 Ln4IyGARcdDR8uAdbQ1tUzzugnNpGAkYTmDEeIstDyYdtEqB6BzEyWHqMTasCtHFyTGsX
	 UZXwd6pxeNekLj/R+b0PCCYldOXANNsEzF/qn3N5M4MryxfkS2JsZO4ouhsaaJotm7+Eq
	 CngijahIGCgD994OwXEBaKqoABkT5MpqqhgHDYBQ2wGKS5adZsbkZLFMocIaHc0tinAhR
	 H9R4FxhHeJJApUPhD0wi5m+gPf+2tbc3HXDrC2cjdEYSJU+Iyn/l7zWt99mFzQFwKGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I7cdb4vd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B443606A31E;
	Mon, 23 Nov 2026 16:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I7cdb4vd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A5E1F000C0;
	Mon, 23 Nov 2026 16:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795450315;
	bh=CuV1HgSyHeqmHnQ6X0W8EKjH6rdyvaViJZVeUHENJ3o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=I7cdb4vdNUK3v3piY+BZlJjEe9R4MEyMtBgnxanHlmElStgvqGfQY7m05L2McBrOR
	 VP+sk9kRQ+s6g7KtRfwY1IGa/cRy5HXcbrKutTfHWiHSdpSGmhzT2snp63v0kVxoPP
	 D61kJ8ra9i6aLDn7pdM82YRC39mtoLm+pEdt28w6iLFn2sYZknfRXOwISv/FM3j447
	 d8OreZirnkqEWu7JNN9y41OAQcEAUcPYoV2mGz3YuP8hvByYVXaDF5jhMXpDRAwBDK
	 98UKa8QcdVSbM0GLaB87W8AMcxgfQMC03x9D4Rc++I920eQzGHmX5MGcXkTqRzy2mZ
	 WIcA6ugK5QGbA==
Subject: Re: [PATCH net-next 2/2] dt-bindings: net: dsa: Flag unexpected
 ethernet ports
From: netdev-bot+sashiko@kernel.org
To: krzysztof.kozlowski@oss.qualcomm.com
Cc: hauke@hauke-m.de, andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, woojung.huh@microchip.com,
 UNGLinuxDriver@microchip.com, jensemil.schulzostergaard@microchip.com,
 ansuelsmth@gmail.com, arinc.unal@arinc9.com, Landen.Chao@mediatek.com,
 dqfext@gmail.com, sean.wang@mediatek.com, daniel@makrotopia.org,
 marex@denx.de, john@phrozen.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Mon, 23 Nov 2026 16:11:53 +0000
Message-ID: <179545031306.3135.11482802242328622537@kernel.org>
In-Reply-To: <20261122160907.200727-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261122160907.200727-4-krzysztof.kozlowski@oss.qualcomm.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete because it skips a sibling DSA binding
  that has the exact defect described in the commit message.

--

dt-bindings: net: dsa: Flag unexpected ethernet ports

Several DSA bindings reference dsa.yaml ports, use "additionalProperties:
true", and limit their port node pattern to a subset of unit addresses.
Because of that, port nodes with any other unit address pass validation
without a warning. The patch drops the unit address from the pattern and
limits the port reg value with a maximum instead.

[ ... ]

> diff --git a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> index 167398ab253aa..3840b336bdb93 100644
> --- a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> @@ -75,13 +75,15 @@ patternProperties:
>      type: object
>      additionalProperties: true
>      patternProperties:
> -      "^(ethernet-)?port@[0-6]$":
> +      "^(ethernet-)?port@":
>          type: object
>          description: Ethernet switch ports
>  
>          $ref: dsa-port.yaml#
>  
>          properties:
> +          reg:
> +            maximum: 6

[Severity: High]
Was renesas,rzn1-a5psw.yaml left out of this conversion on purpose? It
looks like it has the same problem the commit message describes. It
references dsa.yaml ports, its ethernet-ports node uses
additionalProperties: true, and its port pattern still limits the unit
address:

Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml:

allOf:
  - $ref: dsa.yaml#/$defs/ethernet-ports
...
  ethernet-ports:
    type: object
    additionalProperties: true
    patternProperties:
      "^(ethernet-)?port@[0-4]$":

Under a renesas,rzn1-a5psw switch, a node such as port@5 or port@7 does
not match this pattern. It does match the generic
"^(ethernet-)?port@[0-9a-f]+$" pattern in dsa.yaml, so only the generic
dsa-port.yaml checks apply and it passes validation. This hardware only
has ports 0-4 (4 ports plus 1 CPU port).

Would the same change used here for qca8k.yaml work for that file too,
i.e. "^(ethernet-)?port@" plus reg: maximum: 4?

nxp,netc-switch.yaml has a weaker form of the same gap:

  ethernet-ports:
    type: object
    patternProperties:
      "^ethernet-port@[0-9a-f]$":
        type: object
        $ref: dsa-port.yaml#

A node named port@1 (no ethernet- prefix) or ethernet-port@10 does not
match this pattern. Instead it matches the
'^(ethernet-)?port@[0-9a-f]+$' pattern in ethernet-switch.yaml, which is
reached through $ref: dsa.yaml# and only applies type: object.

Such a node skips the NETC port schema, including dsa-port.yaml and its
unevaluatedProperties: false, and passes without a warning.

Should this patch cover nxp,netc-switch.yaml as well?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122160907.200727-3-krzysztof.kozlowski%40oss.qualcomm.com
