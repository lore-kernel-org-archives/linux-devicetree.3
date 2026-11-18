Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007262;
	b=xma/Y2/aYRpII01BWgk+An0Ly9HAbNtxbE0B4n3F/+9462n2n7kvcwzAcGA1j5skU46F
	 2FQuiS1FJgXTyWzle7FNgAxo5LJmWZXfCL9mtMOucM3vNOFuplQYEeBNPfrfQGxx0GqZK
	 ZAZTuQYTVZh6fNyOrfxMXRYyZFWGlJmJvPtcT4jaRXUqy7JBh5JeN6RAkp3BH9mQv4WmO
	 lC4w3DL/Hx73ziVFXbxZk3SLhRLZgo9OwzuxU8iOa3rCWFH85IgObuBpw0gIeyem27Pub
	 7gtiPkcafAdheUResqGllUgUtUDjCm5e5emOMXlAPF1PPaQjorYEj7ozzp0SDtnJDJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007262;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RKlNE273qsLLyD+9WVGHZwPIwnj09V8yBbpoARQKCtU=;
	b=sIIdjLuFVlH7nOzzxGoQvxKq810zPUH/i4lRxVZ3wq5wFF/C5Xg9M2/PHChJrSgOxVwK
	 oJqJ34+SNKP1qQAwoKziuiyn8HLCShwMb0ryOOm0J/FiVSyeSV/PBNMy6xyyzOwu9ngD4
	 Bxvukr1K5t4mXkuhl+R9APnXCuNOUb6i1joeTtYZ/OqIHwQIOrhAqnvw/0Nq3syySj+CF
	 2SQbqKpfGuW7xoXMNQkm4x0G9IgHWtDbZmys+5TW4IPFfKjOWMHxigpOT/Eud1096vS+o
	 2vGo5b/4c1nMlduLmOP1LP7AdRKI5U3gUWK8UAwCAjVJvt2FoddtTtIhAjjpKExSyBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A97606A338;
	Wed, 18 Nov 2026 13:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A97606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xTfNm-000000004Qx-3Wtz;
	Wed, 18 Nov 2026 13:07:27 +0000
Date: Wed, 18 Nov 2026 13:07:16 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: joseph@telaak.dev
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 2/2] net: dsa: mxl-gsw1xx: reset the switch
 through reset-gpios
Message-ID: <av2jBEtrEq96xV2-@makrotopia.org>
References: <20261115-mxl-gsw1xx-reset-v4-0-4ecd18c922e2@telaak.dev>
 <20261115-mxl-gsw1xx-reset-v4-2-4ecd18c922e2@telaak.dev>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115-mxl-gsw1xx-reset-v4-2-4ecd18c922e2@telaak.dev>

On Sun, Nov 15, 2026 at 05:33:46PM -0500, Joseph Telaak via B4 Relay wrote:
> From: Joseph Telaak <joseph@telaak.dev>
> 
> The switch keeps the configuration the bootloader left in it, and the
> driver never resets it. The MDIO core asserts and releases reset-gpios
> only for PHY devices, so a reset line described on the switch node has
> no effect either.
> 
> On the GL.iNet GL-SFT1200, nothing answers at internal MDIO address 0
> after the bootloader, and the PHY that answers at each port's address
> belongs to the neighboring port, so port 0 fails with "failed to
> connect to PHY: -ENODEV". Describing the PHYs at the addresses they
> answer at is not enough: with them at 1 to 3 and no reset, neither LAN
> port passes traffic. After a hardware reset every PHY is back at its
> port's address and all ports work. GL.iNet's own firmware resets the
> switch from Linux too.
> 
> Get the reset through the reset controller API and pulse it before the
> first register access. The reset core hands a reset-gpios property to
> the reset-gpio driver, so a board that wires the reset this way needs
> CONFIG_RESET_GPIO; without it the reset is skipped. Imply it, so it is
> enabled by default, and say so in the help text. The timing follows the
> vendor's driver for the GSW150: asserted for 250 ms, then 1 s before the
> switch is accessed. No timing is known for the other GSW1xx parts, so
> they get the same.
> 
> The reset also returns the RGMII slew rates to their power-on defaults,
> so a board that uses reset-gpios sets the ones it needs in its device
> tree.
> 
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>
