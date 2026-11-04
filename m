Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786671;
	b=ciX5SeMneCxQ2AqVlfaP33M6pAkvUBFgvScbGjEEQ91hLe8IFoeflmk1aYnLQ+pI6gEu
	 FVqF+9dfanvUQON0RZv6wAfJaG+amZzmRH5wE8u+KwlyrjDOzNPSN/pgvKGXcSFUVx5nB
	 TaXMxQ0nCEyLTUeFCGV7b9t4PUHQmCyvokVMUVxRaJzm35gHlRAxKm6TICPv4RQr4k0Ov
	 aq4z6ogjTpoYOuyUlrkk8MyWbsimo7/ARQhCStMvlzMDDifDn24vw7/AvJsumyEGhRi8j
	 uO5DJySWKyyOC1Cgl/7EJGUVca08lbWYWbtPtQFwExbKNYicP91Vt3lUSVxPXAcHS5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786671;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=qYJ1iukmwutASrDYFKbbVpW3SfEfl5i637ohOvctWDc=;
	b=BRgk+MQ5ADC0dAeqsV9lzuJAIV6ULg7/RRcr/qYxcQKRrxd9oPTiySiNfcXYSj2bqRFo
	 OOX6uglYWv5nlicmrZlEKRcM/gkL7XZE7rO5Y/ErldGqaAeWeso+a1/74k3QrHswKnnSk
	 JPQf9tDGkXdcJYk0Sj0nnYTiH+q/wrS0XYAQxyjVOTszkp4iwbCVKDeZGXxm2NcvwniGK
	 CIpNtKjWMkTgg6UBzv4cQKrRL5hTd/uPoJl+PNjTCJFC/FMFwkC+NWoG6AQk3+ZH+BJdS
	 tZM05DvvDI9xtugzhTsSKSekeqlLqN4q4Vgjgte4GX0kFwZRvIwE+f66x52jxvigQdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gorCUYXt;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DDB606A33B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 10:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75DDB606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gorCUYXt
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E50E74E413F7;
	Wed,  4 Nov 2026 10:04:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B9CEC60770;
	Wed,  4 Nov 2026 10:04:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E2F6103291CE;
	Wed,  4 Nov 2026 11:04:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793786667; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qYJ1iukmwutASrDYFKbbVpW3SfEfl5i637ohOvctWDc=;
	b=gorCUYXt0IZqHlZyTFA71abpERYlFGhqqaiAgT1PcwmpEgd4IPwgYpReXKJbdE2VdWXyfq
	gCYXss3jNCxF68x/JK/YYaNw/a8T7i+uQiTiEVVkiMLsd3vh0WABB4tLl8Jfxr1czQSnSL
	MolMv8H8DZJgQSe/x+gpjZ5HW37gLnnxlkQNHvaP+PJmjPqKKszbrAYklXXqPiGTbrkVo0
	t5T6/NFycewkZRFcDwwAIXzsLBM4zbMfWeJbxuQhdL69zYu64NwzMhglKUG0xolLd0a6mZ
	Tenr96aAp0jf3J5L78k7Ob7KhWtUhTibqzRJoCK3+ZEbIo4kUu++MHp3MgaAKQ==
Message-ID: <1c17b621-3032-41d0-92bb-98ac6c01bc57@bootlin.com>
Date: Wed, 4 Nov 2026 11:04:23 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH net-next 2/4] dt-bindings: net: pse-pd: realtek,pse-mcu:
 add VMAIN supply
To: Jonas Jelonek <jonas@jonasjelonek.de>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Sander Vanheule <sander@svanheule.net>,
 Russell Senior <russell@personaltelco.net>
References: <20261103220312.860629-1-jonas@jonasjelonek.de>
 <20261103220312.860629-3-jonas@jonasjelonek.de>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261103220312.860629-3-jonas@jonasjelonek.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/3/26 23:03, Jonas Jelonek wrote:
> Describe the VMAIN supply at the MCU controller level. The rail feeds the
> PoE subsystem as a whole rather than an individual PI. Its regulator power
> budget defines the aggregate limit programmed into the MCU.
> 
> Require a finite regulator power budget dedicated to this MCU, representing
> the PoE power allocation of the system.

binding change should be send at the beginning of your series.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!

> Signed-off-by: Jonas Jelonek <jonas@jonasjelonek.de>
> ---
>   .../bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml          | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml
> index 526f8525bb4d..82288bb57b33 100644
> --- a/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml
> +++ b/Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu-gen1.yaml
> @@ -92,6 +92,13 @@ properties:
>         asserted.
>       maxItems: 1
>   
> +  vmain-supply:
> +    description:
> +      Regulator representing the PoE power allocation of the 44-57V VMAIN
> +      supply. This MCU must be its only power-budget consumer. Its unclaimed
> +      power budget is used to configure the MCU global PoE power budget. The
> +      regulator must define a finite regulator-power-budget-milliwatt value.
> +
>   required:
>     - compatible
>   

-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

