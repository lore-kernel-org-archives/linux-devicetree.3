Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028921;
	b=wVqiIGpvCUXxN65+SmHZPY0gNtB6AaI0hT0OUMjdH83kwWf/05jfYH1exkvu0/KTG6zA
	 C6SU0KYpcMkb6oH3DSV7v9No2k03dHAD8kVZKdIQ4vYAXacTKH6dX486SA+nf4ORAm3bR
	 UZgfucaSjIrmpPrg5/N71MGkfsX97uUv0byxkT8I8O/KjXDAq6PaFZ1ZewO79c+L4g/ed
	 bDRSBAZX02z3nzoLOsrh0oZiS0btEw9q9IyMrYDEWf23Nr0us12e1bf30+M/HR4RcZ4KN
	 kJBCU/VYEia1rrK5JdxVpXaW+NgHplLKW0aMDgnIDgljGjqNlt36N31+oZOuEyAVlFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028921;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=j8NHvkg0mcHS6NppRIX+eDEokhzbE1hV9ZJ/sEvlK4U=;
	b=ryrYTj/Nx/qXNUa2/cX/bHoCnuvwcU+pU48g8nl9mNczrTASCZlJHwxUz+iHJQLGUfKP
	 xDTSV+VDH+BurwQVz69e4B/GUUgFXivaVhDmQjJK901+9cixrAWtkfUBgMdkTkGypBfCK
	 wj2X0DTvLvZxCgRQmkt6DvPMEd0IFLLOnP8uF0xVv1aeu9KMBJwM0EfCsaKkHKk5Ofg8U
	 c1kCe1RNYt2W6JYQ9dwKyboFRzuO3ljzrHIvcwH3LXQM7Usr5kVluwFWYUm0c5wByqtUo
	 TO+syw0usncocqheqfopk2xrgrBKnCnp3ZUDuxQfrdCEliGv5Buxctw2vNQCx75T2oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BDJPVTAD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DC2606A325;
	Wed, 18 Nov 2026 19:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BDJPVTAD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAAFB1F000C4;
	Wed, 18 Nov 2026 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795028921;
	bh=j8NHvkg0mcHS6NppRIX+eDEokhzbE1hV9ZJ/sEvlK4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BDJPVTADU+MiIs2CIl8rFOWWP+9Kt+G6akZKawZPdkAf8/Qm/NUbj1bozbJgxecFG
	 CJWqECGUh9QehHXJKFCjGT5C4nsLfq/JT9mKc9UMMxk5pw13fC+My2ZBlj+8s8Ijrf
	 eeVTd1gMOF+J3ER8O4/CteXSRjHc3ry65VUWdDO/Ez0ilceOqiLLzGLoWsGDAwegW9
	 63MbdibGqqdzH/1YN+xjeYbdiXqeLeYoDMicEE/3c+oIpqAGUt6vZYTqzrSz3hY1Ut
	 yDxj2PlvVER2TSmMwEPQlAMwfhF7ia8EPRxb14ufHd+/277knxt3tuD9qq5Ajj5OW3
	 tOpjPFZQvUduw==
Date: Wed, 18 Nov 2026 13:08:39 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cunhao Lu <1579567540@qq.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: net: rockchip-dwmac: Add
 RK3572
Message-ID: <179502891855.247733.11686816962535109949.robh@kernel.org>
References: <20261117-add-board-ok3572-c-net-v4-0-4e9da569395a@qq.com>
 <20261117-add-board-ok3572-c-net-v4-1-4e9da569395a@qq.com>
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
In-Reply-To: <20261117-add-board-ok3572-c-net-v4-1-4e9da569395a@qq.com>


On Tue, 17 Nov 2026 17:04:35 +0800, Cunhao Lu wrote:
> Add the rockchip,rk3572-gmac compatible with the snps,dwmac-4.20a
> fallback and require rockchip,php-grf.
> 
> Mark tx_delay and rx_delay as deprecated and disallow them for RK3572
> so new designs do not use the legacy delay properties.
> 
> Signed-off-by: Cunhao Lu <1579567540@qq.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
> Changes in v3:
> - Deprecate tx_delay and rx_delay and disallow them for RK3572.
> 
> Changes in v2:
> - Add RK3572 to the shared Synopsys compatible list for consistency.
> ---
>  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 15 +++++++++++++++
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml     |  1 +
>  2 files changed, 16 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

