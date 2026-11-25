Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624919;
	b=UaBA1ZzJ8FL18vrW2YsaKGKYa9kLTXcX/1TWl5DvhZgBDC0TqsAog3JCCEiT+zKhaZob
	 ycsZPYvuPxVm8nWwZQP+SEpC4JpmXFZtrdgwE2NXpQgq1rDAhVHuiz6OCTbAyPG2CXrau
	 2/k6fS7E5o5ywmPXYmGJVuvAGq/kAFCFDojonTTuci1kU3wr9LTM+116OwMEyxA1EoviV
	 8tR43cjghzMo1RQxQzrK6zbb9xRhOXoYjvAvdlceHI+ODh0i7yIsYL0eXc5y55P9oln4P
	 9ccNZfdhkzrSjlPox+cU1qWW0WqxbATZI+nbpnRdOdHjRmYMaHTQBjR8jEA9LAKJkxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624919;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=PxUCnxdGeaH9jQnUTzXnwWxDtaWf9XkV1Yj+9u92n6M=;
	b=iTUfmRP7ATlO2SBAfIoKImyUyzP01XoKUYlYUDQV0sDnJWcyzKsuBgbdCpcykwcm6nwD
	 GuUFXeX7OXu0pLDZnqgqMS+Lu4A0JKqHOYa8/NB8/iFM2JWlhBRWdB5MXJVYe+g2W7dgw
	 GEutiNtPP4KqKSQQF3SGDGPaahnaZSIQCV1iW5aj6yVN1e3/DgOzdXsnM9/UHrruI2hbS
	 xJOiZNYK5DoaUPklSKmD9FymVW4M5rt5x3wkgEhbUuzIVgr+CAkIwty5en3tNK+4SoZgf
	 9d2NEe07IOgWVOdMf80DzdyGFvvCMFQ1Rg2Ot55Da80ducujBwU4JtJXK/Z6SEa3aWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=x5lVauwi;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73143606A321;
	Wed, 25 Nov 2026 16:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73143606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=x5lVauwi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PxUCnxdGeaH9jQnUTzXnwWxDtaWf9XkV1Yj+9u92n6M=; b=x5lVauwi6Nf6hMGyjMbtxkPKfn
	AfVs+MJlDr+Q2wy/UlK78S1woUzFGb1NxjdJd0Jwmuu0JIT06IpZSD631GJlb1VE67MWqIY4DG0mC
	5kUFeCHyMR9d6gEWVlqT6eAFCWViRk4lLKm+DM9T5ntpnkTTeB/+hUocRgHKyHCHsIWA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWG3r-001N2M-5U; Wed, 25 Nov 2026 17:41:35 +0100
Date: Wed, 25 Nov 2026 17:41:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alexey Charkov <alchark@flipper.net>
Cc: Ryan Leung <untilscour@protonmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] nvmem: rockchip-otp: Derive MAC addresses from
 the CPU ID
Message-ID: <789d3358-81cf-4276-9f8e-4787df120059@lunn.ch>
References: <20261124-rk3576-otp-cpuid-mac-v4-0-d403b8a25113@flipper.net>
 <20261124-rk3576-otp-cpuid-mac-v4-3-d403b8a25113@flipper.net>
 <0aH4P5VH9HNiTXpCUTaTlvGaoUDQBnvv-0cSXtipSDkLOGjzGy96jDqsVtU0DJTWrocgoMcGFEgd0JUlF5mljVvCzGKVz4yUgDQ0s6HaDLg=@protonmail.com>
 <2f8da604-36af-4944-8168-02b046e97699@lunn.ch>
 <CAKTNdwG1sSBVKcKpHBj24nFCdc6WVKabV5=K4sJFucWpTLqRQQ@mail.gmail.com>
 <1defc5c8-ba61-40d2-99f3-6654f1743af1@lunn.ch>
 <CAKTNdwFktkMtdLW2GzqzLH+LO4kF0uY0jWpnvO5vbWmd-e4iWw@mail.gmail.com>
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
In-Reply-To: <CAKTNdwFktkMtdLW2GzqzLH+LO4kF0uY0jWpnvO5vbWmd-e4iWw@mail.gmail.com>

> > That way of_get_mac_address_nvmem() just works, so the MAC driver just
> > needs to call of_get_mac_address() or of_get_ethdev_address().
> 
> They still need to relax the size check as done by patch 2/5 in this
> series, because the CPUID cell is 16 bytes long. Srinivas rejected a
> prior version of this series that attempted to return cell contents of
> different sizes depending on the use case. Currently any cell size !=
> ETH_ALEN gets rejected by the net core, not just < ETH_ALEN.

Ah! I had not looked at the whole series.

Having to change the core like this is an argument for doing it in the
MAC driver. It asked for a MAC address. What it got back is not a MAC
address if it does not have 6 octets.

Please throw this all away and do it in the MAC driver. If there are
multiple RealTek MAC drivers involved, you can put it into a little
library and share it across the drivers.

It is actually an interesting idea. Maybe it should be placed in
of_net.c, so other drivers can use it. How generic is it having a CPU
ID in the OTP? Are there other vendors doing it?

	Andrew



