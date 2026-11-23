Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463874;
	b=ARhdpSXu9ODmRfUnyzKB76hfNq6ZBCSo+XAfKFu4ncv4sbNoZb9qFqKb0mjtbjpuDKgz
	 yJuyUkwWCMEq6ftnZ3r4sCHC5GZ5AmRL5wjkKDHdC+xnjklLITDU++ufXYDlU2/hPkfM5
	 sK0sTCIFVD3+JGYOaEDF6WZ8B26AV08oLUNGN5/vTz1o/4NQU8tmwE7tbbdMy0e5OKYyA
	 y2UXOupZeu9JQvhoNgPTHgIs6VpTiRK9vzfQGyJWsZCx80FiWCWiWsYThaSEa6W8psyt1
	 4XewwCQI4oU/4tP4Xp7N0yUDO/CmexTMxqXsENdNoBSOoQSBz+7r4urycqHa8/hE9tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463874;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=D7q7cBjmg1g9miWY5cP21kvzMw2hIFRfrX+Qy8eFRzk=;
	b=WMs9MpSFKPJOoY20Lr+62z++n8AefmYE8lzSbARBG+iaGnCXI8NtrWE5VBsmrCJDdPA5
	 KkVpKbdRUdO6ZBwe0I3SgiogiyB0QdPDj/r8e+m4cIrBBRnkpegQzqMEHWOuY6qF8Weu+
	 1pZKkX1Yg7yQNhI7+Y8BdEW/BCJtzpTcbJvy+CnGqfIC/QtET2O8lwW6srwW8sfSEd5l4
	 geE6+PDFZE5jZi9DfozhL4KNCcjoJAGrH6FVeCsJmQp3iEhsTmhqoosLaClHghQf3Nw5k
	 01yqCdO4sdBthRjoN6ljyslQhCsDUYvkPFCXZ5CR7jrvBV3c4Yid6V9P4VD6JmWihUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=3T9mqLlg;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69217606A31F;
	Mon, 23 Nov 2026 19:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69217606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=3T9mqLlg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=D7q7cBjmg1g9miWY5cP21kvzMw2hIFRfrX+Qy8eFRzk=; b=3T9mqLlgtPoBR9w6y9TGRQXD/R
	xCYTRGqWyQlkKtd4IxmBwovjdUDN/AQI3cqK9I/6NR/EhbWXw0cC+wDAgUReUNNP/wRdiB0JDkyRI
	CBghBzOEzCpyvbFL/4UkThqeejtXWzSQD4bgtvgAGf/vhOG1qITUNfHeeyqsIZTtHIIQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVaAX-000skY-KP; Mon, 23 Nov 2026 20:57:41 +0100
Date: Mon, 23 Nov 2026 20:57:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: hix5hd2_gmac: support fixed-link
 and mdio child
Message-ID: <a9a587e3-f7d0-4a67-8815-f12e5ff49628@lunn.ch>
References: <20261122230134.3366017-1-mmyangfl@gmail.com>
 <20261122230134.3366017-3-mmyangfl@gmail.com>
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
In-Reply-To: <20261122230134.3366017-3-mmyangfl@gmail.com>

On Mon, Nov 23, 2026 at 07:01:31AM +0800, David Yang wrote:
> On Hi3716cv200 hix5hd2_gmac is found directly linked to another MAC
> without PHY. The driver didn't take fixed-link into account and failed
> probe when the node has no phy-handle. Add support for fixed-link.
> 
> With a fixed link declared on the MAC node, of_mdiobus_register() treats
> the reg-less fixed-link child as a PHY candidate and walks all 32 bus
> addresses, printing "scan phy fixed-link at address X" for each address.
> Register the bus based on if the PHY attached to a given interface is
> described in the device tree or not, like commit ef8a2e27289e ("net:
> macb: fix probing of PHY not described in the dt").

Please split this patch up.

Add support for the optional mdio node.

Then add support for fixed link.

These are logically different things, so should be in different
patches.

    Andrew

---
pw-bot: cr
