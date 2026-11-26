Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665753;
	b=zqHGlj7VBwGDL38kI7cRL8nmO2QkYZ6WJnOZyCFT2pj5+Ki/bp79q9DLpObZKP/zPlVo
	 IvlWsq8kXiv78OnLcBjOTyNWsikm5/fKtkth5DFwcvsNiMbgIBv3r4hE12uu/gtpm6ct4
	 bSgKGGZMZvktfBu1d6lQOm8FT0SJDXfufPh6j/kPwuDpcsgq82I0c/BEm5R7GZAh1YYGt
	 PoXs+7zy/A1PPI0UBNJTiRq7OJe5lvklVUfGnKWy8135q0i5vCB0k0gqF+k0bMqOebrfe
	 2WGW+j33EdWisA9AFg83rZCmFQxtCVbk70OtedA3Qjt9Hsns+/ZlE0b4ha8v+x8QEEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665753;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=7Gltq0J+neesPC1o9IUwhCGnJYXEolSS4bAtXjeOr4Y=;
	b=3waSNnPfPDN6jwzcNmbi2BP9sdiweT3V1aYdVuN0ZMzx7cZBHYnxAZUsn8GmxcZHOFIp
	 yqe4tot9Vb3ob9G2I+qBl7p9ZmwAoUPhGERSDMCSHx2Ztte84llGaWdNTKa/Vnn7M1ASQ
	 YGW1+ylqqqpQ+04YKhBK2wLOhfZ9Gp9ue5+mdTSglXWpPaFHZMQjDG2aRzt7YRbhq5tQ+
	 cjy+/YTwZ2R43+cYWf1p6xdn2AccEumYrdKajR379qfDCh7mSY5r+TjEQm2MSnrLq1UIb
	 5Yx+VYuecx1BQiCkjjebHId5lik3UshUmb7bziUIvv/aPKJmtGPw3XSNr0iPi6/1UVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=gZDYSHT+;
	arc=none smtp.remote-ip=79.135.106.97
Received: from mail-10697.protonmail.ch (mail-10697.protonmail.ch [79.135.106.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB389606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB389606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=gZDYSHT+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795665750; x=1795924950;
	bh=7Gltq0J+neesPC1o9IUwhCGnJYXEolSS4bAtXjeOr4Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gZDYSHT+0VZl6WXEwngoV9+Abm7kbJQpwF4C/I2C/q54J9ddbIQN7VO9Gd7BJMlJe
	 CvhpI428Qkbcr9l2dM9J0yYz4sac+CX7WugihFloqGJrs9Jde4SctB1WOUt5KKQn9V
	 P+0Qe532R/sRMevdLeqSedvZkJUpt2r2ao58nzrcG37ZZVUWdZVaDkZ9HXTSffZmfj
	 cCVaapFRLpRLC5MYd78l2q91tJE5K0aUrMCPf+k1gd5yrl2YiyncBILqqjO9+Z/+vx
	 N8oA4XID6ckAp/sVzXDzyJlBsIg69Yqjv9AzpmJaCUSq6r2EQkDC/7dkJtCvv/s5Hy
	 T/jpfysnHz1qQ==
Date: Thu, 26 Nov 2026 04:02:17 +0000
To: Alexey Charkov <alchark@flipper.net>
From: Ryan Leung <untilscour@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] net: of_net: Derive MAC addresses from a unique device ID
Message-ID: <WorU-BRgoHyPr-8qvenYMy4zDTR4joFxkzmN-qmrABKdMgS7LJ3Nx1rAUQFAoulhS7YjNRIM_bBnK3KdCFGhEF0PgQ1FLq0ieYeGRnkQX_Q=@protonmail.com>
In-Reply-To: <20261125-rk3576-otp-cpuid-mac-v5-3-b3125c9a5fc8@flipper.net>
References: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net> <20261125-rk3576-otp-cpuid-mac-v5-3-b3125c9a5fc8@flipper.net>
Feedback-ID: 184418679:user:proton
X-Pm-Message-ID: f5a7475f279d2efed66dcb8a5e8b361db3facbcf
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Alexey,

Tested-by: Ryan Leung <untilscour@protonmail.com> # RK3528 NanoPi R28S

I tested on FriendlyELEC NanoPi R28S (RK3528) with ethernet200 =3D &gmac1 a=
lias
and the MAC address was exactly as expected with XOR 200 the last octet.

Thanks and looking forward to using this.

Best regards,
Ryan
