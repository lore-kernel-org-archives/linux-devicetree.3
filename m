Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502359;
	b=SofJ4e1aNN9HjfnKJyEK91WzItY0MeJ8nQQJNIOYU5HG4pSKLx8O12qzMpMoV2vikjyh
	 JRI6xkZUqbR6GWe0aXWX8WmHC9D1DCgKwfvP/q4IBTi8CLkx2TPTO42neaGITLhH4F7Rc
	 kv1oAZfdEdwIPLxF9fFh3JZM/AAtmK0axzoWqif06Nj9LLTWsrecHrPHQVt1yYa79TAyd
	 ESa7qfiul9ykNUGqRFisKbkDj/QforqK1bQQcfkycJKHiFP+o+lJPMp8QOBtOTO6KDYFc
	 Xued08R2IlL8sAab30lCdaAi740xRrwV/vUs6b6ecSa9heu4ScqeWtKM28MH/lDdwDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502359;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=PgqRXdTZ4ONcvPOx0PqGgwz2ExETKo+FnP18SHLENdg=;
	b=hdzmtdw/Pxz79jwPdLmoJf7i+yf0ahvamFbeOM8Xe0eZWFFQjBO4fHQ4H0HAgSjinsTB
	 qakDmsfpJTS2LONLslTEiLJUynWLoXiY8WHZrfeUYn7z6aZQm7DNXy6DI4MudWyXzZOOY
	 yv2mUhoZCwrD1fZmVM/09OfjYYJK4mHIvLXGZGwZDciNV8nvjOAXmhHokbbwfTEkhjmfN
	 5pC3WgVzJe40IYFV4lvvCc33c1na26zi6+3WkunmAOILwVL25Y5ECjHvPwZa4TaNy37k/
	 uqiygDdhYrJy2zWUtr1x4E7M4LyiS5C1xnYCBwxq8IMi4zGF068eJGdXgDBQ7hYy+0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QCQzmhjA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CF1606A31E;
	Tue, 24 Nov 2026 06:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QCQzmhjA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187C41F000C6;
	Tue, 24 Nov 2026 06:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795502358;
	bh=PgqRXdTZ4ONcvPOx0PqGgwz2ExETKo+FnP18SHLENdg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QCQzmhjAK1/uACJ8EuxssUw36mmNcSMppc698Ic47HVXYveBPBiF/fOg8lsbDHRdk
	 v/Wyo0N6h94PEi/aebDwRe8QgFa38QMc1YYT9IgqSGW5o8j7TZFyd1YXFGwl8IFfVI
	 opWrQLUgAoIXsABgp5Fh5NlgVGBWYH6GgAWJzim0t1Vj61MB1ngZI4pdwLVvo8CE9+
	 2fjfQjmIAgLUvhUINLMaufMDMZHoh30ptQ4jy5i6id9y1h06Jj3SWyU512Q4ovY+bq
	 rWwkzFELoTwMlbS0a7UDfgZgDMe332DSzM/R66wnMNcmBsrOLI+xYy0xd8UnXQE7c0
	 +zkZT/nwIrLPw==
Message-ID: <eacbc1ca-d12f-45f7-804e-2c7454d97eaa@kernel.org>
Date: Tue, 24 Nov 2026 07:39:10 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/5] dt-bindings: reset: Add Cortina CS7542
 network engine reset domain
To: Fil Dunsky <filipp.dunsky@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-1-fdb5e8c2d508@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261123-b4-cs7542-ethernet-v1-1-fdb5e8c2d508@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/11/2026 19:44, Fil Dunsky wrote:
> Describe the atomic reset domain required to stop all network-engine and
> LSO/SSP DMA users before releasing their mappings. Exclude the SDRAM
> controller and independent PCIe resets. Allow this provider as a child
> of the shared global syscon.
> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>  .../bindings/reset/cortina,cs7542-ne-reset.yaml    | 42 ++++++++++++++++++++++
>  .../soc/cortina/cortina,cs7542-syscon.yaml         |  4 +++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/cortina,cs7542-ne-reset.yaml b/Documentation/devicetree/bindings/reset/cortina,cs7542-ne-reset.yaml
> new file mode 100644
> index 000000000..8f5b5b835
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/cortina,cs7542-ne-reset.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/cortina,cs7542-ne-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cortina Systems CS7542 network engine reset domain
> +
> +maintainers:
> +  - Fil Dunsky <filipp.dunsky@gmail.com>
> +
> +description: |
> +  Child of the CS7542 global syscon. One reset domain covers NI, FE, TM,
> +  scheduler, queue manager, NI XRAM and the entire DMA block (LSO and SSP).
> +  SDRAM and unrelated peripheral reset bits are not modified. The consumer
> +  must own all these blocks exclusively. This reset is not suitable for a
> +  network-only consumer while a separate driver uses SSP DMA.
> +
> +properties:
> +  compatible:
> +    const: cortina,cs7542-ne-reset
> +
> +  "#reset-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - "#reset-cells"

Same comments, no resources here, not a separate device. Fold it into
the parent node.

Best regards,
Krzysztof
