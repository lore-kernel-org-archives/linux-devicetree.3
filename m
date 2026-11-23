Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467264;
	b=TzDUZZWreOW9aDDsVvgWdSr54UXxZea/+ibaX4hm6qEtWExIKOjsNAaNJ9CLeS4RYGH6
	 KggknuJX9uZCa1x8eAt6xyIX8z8Fe5mopqxOLZ/4AG7rer3OT7OLleL1jN1OeGKtGfleN
	 iK+pDJ5kOunMpxEWluGGCxldoFec/f6zs8LsmlIDCtpnRNUFXWZanzOeNxd54+z6bVBEm
	 HZHTxlN9/QhZwu29ySwkwgz6oLHdXenDO3rR6rN4TZvzCUxRTZooTYcfrBDdtPtOVtisb
	 t1giMVxUy7y4yx9Pd81UvBYs+9bsTuP14f6sX5/b9W4av913JStSnyE5C+WoSiqefcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467264;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=9kwWGU/9XS+mypuJXIfY4mEcVCcegopNjEMl3o9RBnU=;
	b=fx2sNG9aMcQJ0WBwZdbsG6XTWgK5WoxTc49vvu2ReWuSgeiPr73Tt82hhIlP2HlKkrtR
	 hdN0xRW9USsRrloBrla9QPAgHZMxO9RD7M/q/ah6XecCH7u74JjCuGAiqeWEKGbn7vKLr
	 VDG0htVKydc5O+yy1x5fvIfeCuWnQfna9AwRnGnoPJYR2eizfiXMz4/Ay7ImFjudmgMh1
	 Y1L3A0Gg7lEN2kWF8wr3Z0t/Td+/zAzSVJK0+IQV1LZbNiPQEHk21Z2Yc08tvTkAjOVTO
	 FF6yo2O+yQufFgty9o3lZ2T97ZobcZ4wGGNf1FyQ8L++d7JGvPvTg0vcwpUaBUYm28Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=EWobnZB3;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BBE606A31E;
	Mon, 23 Nov 2026 20:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2BBE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=EWobnZB3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9kwWGU/9XS+mypuJXIfY4mEcVCcegopNjEMl3o9RBnU=; b=EWobnZB3eRH0Z/c9+cvmY5m4mE
	2uUmCGnrC7Lthwr9+mj82ikAfK3S1HKDhJdYIkNxb7oTyTMeLKHKbB3Djf0X3QZ3If4IwvLx6fk37
	a5mWZ7j6Jb3d+tTgPoQQrIOx7o3pENI7z7rk2dqgNXLOCWsPg31/TEGONQfGI4GnRWXA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVb3D-000tJt-3G; Mon, 23 Nov 2026 21:54:11 +0100
Date: Mon, 23 Nov 2026 21:54:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: filipp.dunsky@gmail.com
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/3] Add Cortina Systems CS7542 MDIO
 controller support
Message-ID: <25226a92-b234-4c1d-96c8-24ab5b9878fa@lunn.ch>
References: <20261123-b4-cs7542-mdio-v2-0-30465e831853@gmail.com>
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
In-Reply-To: <20261123-b4-cs7542-mdio-v2-0-30465e831853@gmail.com>

On Mon, Nov 23, 2026 at 11:40:37PM +0300, Fil Dunsky via B4 Relay wrote:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

  Resending after review

  Allow at least 24 hours to pass between postings. This will ensure
  reviewers from all geographical locations have a chance to chime
  in. Do not wait too long (weeks) between postings either as it will
  make it harder for reviewers to recall all the context.

  Andrew
