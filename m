Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795128801;
	b=PJcpLD7aFSENM74790H1KLpJ6qp3wyyTHB7eK01fnh8efj42DYixONvXcKypi+lsxIJl
	 9X1/mW+iNnVExR+Ct9tu2qkDn4xkA0Kf0HJCoxjBfg1Ha4U3fyI0NxyTrj+5HQBtT4kWx
	 GXroKiFZTk18mx+ln7tNkOwnFxMA3A25HOIlcRfmfbo8GJ7hvP+zEzF/+HklLtVwP6QDz
	 0cTZUO3mj2lazSwZ43UnkiHX0VGx3lhLy3qNqPn1lT6H5c4IMqIMFNYs7cOA7uOgZptXQ
	 ttCLq/hMsH1BC6gu8WADOe0PbINLo2bwj5/dKHij1fDXMSl1lZFXb+bfa6KGqo9dB/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128801;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ivg0vE+NACaCcX0qFzxX3NL4h4Z+jQXjQWrW8LJSygw=;
	b=JruegSZNBlguu218DDc4Hw35P/0Vk7fV6cBLPvCVXu4kvF2uIvIq7gBB3iK8E9vxncnE
	 1UCKJRU2EAknqzi7veLyQLkRtvYwMN+K2V9AtNuuB8LUPhaqu3TCYgbYDj4MoIoZjW8hr
	 zAY7B3iRgkPGbqmPvyLoURmVWyWKl+nAuT2zNLrM/HbbnTha1EbhzUj9FzxDzfEc/sGVX
	 OmUir9JQ1Jl6adJ1Q/Ex9wZ3/p2FtgoiDQwzeXuDHbYpNR8RV34k27ggv+f5621IA3c6/
	 3LtlUKPtLuxLjLEq36sWlvFM8D40KEBtT83qnz0C+mbwB/IG0Cot/DlCD4riOnhzTWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Na9flhs3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D4A606A320;
	Thu, 19 Nov 2026 22:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Na9flhs3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170C81F000C0;
	Thu, 19 Nov 2026 22:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795128801;
	bh=ivg0vE+NACaCcX0qFzxX3NL4h4Z+jQXjQWrW8LJSygw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Na9flhs3X5MVAmllQdh/3HNGq8WYoNN1irFR+ZUZjWnL7tckYTDIPMOuHrmt+s9Gw
	 mV/hT/dXLKGRRtsyXvby8OX+iRxp6YHhv0KTsgy5QPCAzCyiwarwIjf4xcgxXrawOV
	 yCzmYn1sdfxjz7uKJ3CQc9kjFi2wJBdwKEYZORLwcAiFI3OLAJdUP+Hwssz+mr8hd+
	 G9mzLYwvCPJAGW98phA3nCve/IRIKQbpaNwrnxJq8/w9kfB50nZNtjwEfleALDOoGp
	 JPU3C1BSBy0NObdlC98TLPJKXtUOax0QR7EnjwDunprEwistY3kSPz0hzg4Vk7qvHY
	 tbbLMVr5fFBNA==
Date: Thu, 19 Nov 2026 16:53:19 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hleb Shauchenka <me@marleb.org>
Cc: Russell King <linux@armlinux.org.uk>, Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next v2 1/3] dt-bindings: net: ethernet-phy: add
 property #thermal-sensor-cells
Message-ID: <179512879738.1117780.9840512462484564776.robh@kernel.org>
References: <20261107-realtek-hwmon-tz-v2-0-6b9a69d44470@marleb.org>
 <20261107-realtek-hwmon-tz-v2-1-6b9a69d44470@marleb.org>
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
In-Reply-To: <20261107-realtek-hwmon-tz-v2-1-6b9a69d44470@marleb.org>


On Sat, 07 Nov 2026 18:00:45 +0100, Hleb Shauchenka wrote:
> The Aquantia and Marvell PHY drivers register their hwmon temperature
> sensor with the thermal framework, and a following patch does the same
> for Realtek PHYs, so a thermal zone can reference the PHY node through
> thermal-sensors. That requires #thermal-sensor-cells in the PHY node,
> which no PHY binding allows: dtbs_check rejects it under MDIO buses
> whose PHY children use unevaluatedProperties: false, such as
> realtek,rtl9301-mdio.
> 
> Allow it in the common PHY binding.
> 
> This patch was prepared with AI assistance (Claude Opus 5.5), after an
> AI review of the previous posting pointed out the missing property.
> 
> Signed-off-by: Hleb Shauchenka <me@marleb.org>
> ---
>  Documentation/devicetree/bindings/net/ethernet-phy.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

