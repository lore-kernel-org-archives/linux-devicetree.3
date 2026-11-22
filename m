Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795387847;
	b=VPFA+loi2sZLLanrGWGGcrRmlVqKFX6zfD3oGu1Wa/fPYqa2UFwq3UVoBLy8oTq0GVzT
	 nNMQod6ukLOwZoytZg9s42AxRPZ5Tvj785oKftBCljPLm0nMfNLQji4sry4w2bU7TM8pQ
	 39osUajaXWLwi2VlTc4EaJNaDWazvHrtDKmFrIWXtXdtJEa63G3UDofLpIHygszrWRi0f
	 VNl3dJxwD6xX3XMo2oxmeJB885FJKqSFWw4xvE8xXrg8kZOYlBX/cMtnC41WU39jIJVdv
	 XmpikMYSP2aclAmAXYwHeVp+QIVggI+h2qs59PMekKAWgVTwJFhz9TEKZYTBP7RTlqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795387847;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zhzorV+YhbTY7mbA8l/NasCEWm6joOpMt0hDwmNwiIU=;
	b=luzWcLlp/KYJbvq5L7hBAGc+7RCHvzDZqOYsep3Cp/vg4rsAkB5x5uwjYUNX8bPI4otQ
	 pViFqcfqquXJBBlgrGt860CAk4o/Nh7gOZ2mJ/3lZe/YZdbIg2VT17n9fImAApy09NN7q
	 MybOqRYc/uHhjM82F0Le+2EU11XWNkbuYsZbnPfrjA6tLIBnoix5Sh3YZm6K3C68XI693
	 /Swn59v2RPArqvZhKmdph0PaxXKD90nVS1Lm3grEPhVxIEd80lQvKc4Bfu82oYeLcYbIt
	 qxyWIyIz2axvAu+6bXTjB1GXuor6I0HdeKZXw5j3zjDpdgQqkncWsQwYdeibyRADf9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=PEMGhAAE;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADBA606A335;
	Sun, 22 Nov 2026 22:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DADBA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=PEMGhAAE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=zhzorV+YhbTY7mbA8l/NasCEWm6joOpMt0hDwmNwiIU=; b=PEMGhAAEnrqiDG7aDCHdsaHreN
	yWnV1ubdWaW6VBvulUkRs8Q3qdFBNFR0grlKGhDhLM+0rD1EUHiHsgmzh2rRqo1aXXnTIfg4MdAxE
	0y1XROFkU28RdYgfk2UkJHFOMzYtvxPGqfdt5UqvmIF/PxfAywLxLdMATSDVSsCdikqqDiUXZO8ZK
	JnTgupENfhZOIn2kjx0h1WzvQYH2RXp3vhmWbEX32gH5E6gaUoYLJ39ukysuw8nrbP36Nv3KsgR0g
	+sx7IINryri5V2B4168RZ5v1dapJ86yCxa9cLzLJOLoNPvJJiEOSpVElHevhJISj+tQZmpYnHDXfP
	Vevm9Hlw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Pufan Jin <cyan2254650260@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: add USB-C PD and DP altmode to LubanCat 4
Date: Sun, 22 Nov 2026 23:50:22 +0100
Message-ID: <179538782473.3150822.5472875370609070388.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110193028.512456-1-cyan2254650260@gmail.com>
References: <20261110193028.512456-1-cyan2254650260@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 11 Nov 2026 03:30:26 +0800, Pufan Jin wrote:
> This series enables the front-panel USB Type-C port on the EmbedFire
> LubanCat 4 single-board computer, covering USB Power Delivery, dual-role
> data/power, and DisplayPort alternate mode.
> 
> The port is backed by a Fairchild FUSB302 controller on I2C1 (0x22),
> a fixed 5V VBUS regulator enabled by GPIO1_C1 (limited to 2A by an
> LPW5209 switch), the RK3588 combo PHY usbdp_phy0, and two DC switches
> on GPIO4_B3/B4 for the SBU1/SBU2 lines.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: add USB-C PD support to LubanCat 4
      commit: 42c1e1db2ac799921819851237f22055c0af15ff
[2/2] arm64: dts: rockchip: add USB-C DP altmode support to LubanCat 4
      commit: dbc094626a087d379ea6ab2bf6c730965a87fb80

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
