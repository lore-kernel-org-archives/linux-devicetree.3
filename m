Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388495;
	b=YPAOKoLordC8dseBk6mUxPamk52wDpZWGOrwZbhXss9GJA+b6oQJ4fv+joNcdgkH2+7b
	 5SBD9thjL0NBpH0ZKtaGbHnBrb4UP5Tww/Xo5Orgse+UZnu9O5M9JC6Pkkq3EWuVM2kWY
	 XoL6HaCJmCx8FvWkFdDxuyglEW93W5LXLPvzXt+I4VmYGcd52oc/Iyq2pTI4vtkE4C5mu
	 K66p6q/3Zxr1n+aUNMzAIQD57n2yFZPKWwZNkg5uY/pkgL1Bar/xSgQFgWpt3XfbYvAqW
	 KkTCHf5U6e0q8jhGyJ2gjMoqu+CdIifvffn6jzorwWJiY3pGOYRs/bo2ZrHNYgykoFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kxkRXuYhMPK0C30vvCMKN0f/tz8st3ZMYqyTNqjHyuc=;
	b=VULKEE/2JfwvRMeCnqbqViG8tIaz7ATXeVcVkdgS9icLbyAoLMB1dl7e3jt74K0/Yl5G
	 vRharpnagZ5RXOGkIxA2YwJERtwj5FMvb+3fS8fw6pK0WkQa6SV/56yfPRUprl90jwfa7
	 hXH/4Db6TVBaKF+L2kYO7TSAaug3VAGFNZUsYDDUUq/tloeHvZwd6csNH9rtnkQAKZLgA
	 zWYgRi6wU629njKSCdzDJ2tl7CmXWfzshu58Yye13p4dxy+gaPBwpwgTaee+7RSTNtlsQ
	 DqyBI5pHIlRu1K4K3dWpmG09OrZB2Z6zLK623rwxy08zz8pUYx6+PJTxWibZd383SHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Mo3o/ejO";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF978606A321
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 09:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF978606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mo3o/ejO
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1935307f8f.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 01:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794388493; x=1794993293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kxkRXuYhMPK0C30vvCMKN0f/tz8st3ZMYqyTNqjHyuc=;
        b=Mo3o/ejO5eEm/4lsClFXD97OGtT2rZOLvBTBTgG1NveGUf2IHBjdEX2ZBRkaCeSkAN
         0+B15HUnQdIeOEuw1osEeAv8iy8zw09HeRfarjQ4Ou1p8eQF/JgrdyyRH4Akkovy82PA
         gFGholXanrrhUyhHmi8WxQJy5CQ039dFebXE15W89v9z2UFB8YJBgXX1KmQUC4U8Rd2S
         /dHTh4gHXH8KKaKb6onZbYvygCi+/+Gf2S0rb+Tm8KtNxDVjkKYo4goh3h1rxRh6l3sV
         s2T7URet6HooCiQOE1OtLDSK/rLoB2/oDPc51diEwiNpFJ0TwW+YTrFVg3rgZ3I5y37q
         sLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794388493; x=1794993293;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxkRXuYhMPK0C30vvCMKN0f/tz8st3ZMYqyTNqjHyuc=;
        b=F1DR08UI4TfcLQX9MG3fQMgp/zZDhNdWgVIz+dGqfgarJbRycRDxITDYeF6tAio9iW
         uw7PZKZuoEKiOJRjhStVBSoMNfx2EnjZFAbkTeixp1gch/I415wtTxT56m/a1PqYpr5H
         Gq8B1IOFr9zQ2fzKQLky2/etsqrnj+j6WzFD56UPb1qiaWih2c2tFjzrTqeGRvP+d9fV
         y3MtuxzAkc7A0d31jXj5DoWFMvQ0oJeq2tKE2sLZIBb6BQLbgSLG4vpxV5hd4Re4DAXN
         IpAdwJgoQLnCeth2V2F1aCihkisUqpVyeBLzPLoapZ/BOJLEugh4EWlQAJ+VgG/a92JB
         r5iw==
X-Forwarded-Encrypted: i=1; AL+hErGzIbFqZ8IgvVghFsxEnY+u7ePyHWtazmmSKzBLTLb5qKEChuRoBj24sKLs9loAftvhMkq+VS25OL5t@vger.kernel.org
X-Gm-Message-State: APuU4Z+9XsjKvT9Wac4ZQlZIHkNwsvBVM8DaVLIvN2mqc2HmdOftSNAl
	0y0xRyyvJX3VfSJjmuQ7CcpF3p19q3dWvCTfEwPzNky2Hw1IzBYBL6XQ
X-Gm-Gg: AYBFou1BXX0dw5IEe+NlRoBf9XpSKC3TjV0eGLHY5MmCy7ZaINapX3Ad43Xb7VixZsj
	UcOnkbTjwkouNqD0cqfuMP1xsxgEjhPR8u7ooZpJV1cZZl9DBjAjLro6B2aNr4DXDwEprq4PHxp
	VBf9yJFE3ASyCdmjg+z/Amj8BqrGS54uKBS1T/DJ34cJuP4Fhpy6VcFwxlEIVznw1lVdsYXjjYX
	6OiVIcWKZSr7olQ2N1OTB1+qMD7HrJ4c8kjjKqxlKmLuk/7P1eZXE8zymJTPUE4WyGhfs97bF41
	ArtmmRxCZKxSzlpiOeoqnHjERYMox50mrVet4ycbCM89HtCqDujuU86Ed+X+sK6BzPQLBtz7q1N
	tjvNDRzUhMLVZy0C2PvgQr16Pro9grLA8UrriNKsgLPcYAIITO/ZAh2ApQQLASA9+h/o8+fWIJy
	w063uM6zeDRPA4YCjLHUiJY5BmfKfBIfW9QDprOKW0hU0jcg3/wxm9tTgz0GhalGTkSz3sVOOW8
	RofitkLAsOsiqcw5FdKMraglW93yz16M4JEmK6p7EnMhcaY/5CbTXTPRUBFxn3ZsQDJzWkbxSIK
	eAJYSUEZCTXKIw2RZlPWPVyPdnY0InzoHlTq+EgXvXSgDncB/5mwdXNM99FRbCRJzwzcMkG3t04
	/8QaI9+khBlmpOov+BytvJTXoegAbtU7jdGgAZLBXTFYSYYhsYxugDgHvhdKPvg==
X-Received: by 2002:a05:600c:6994:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4ba0935bd68mr32873845e9.4.1794388492912;
        Wed, 11 Nov 2026 01:14:52 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02005946sm145501635e9.1.2026.11.11.01.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:14:52 -0800 (PST)
Date: Wed, 11 Nov 2026 10:14:50 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Frank Li <Frank.li@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com, Nate.D@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet
 LEDs to carrier boards
Message-ID: <avQyCgitN-stXoS7@Lord-Beerus.station>
References: <20261105101739.10614-1-stefano.r@variscite.com>
 <auy-OW_td7N8oHK_@SMW015318>
 <auzAh7404GAsY-U0@Lord-Beerus.station>
 <9c416362-4e28-4327-b8c3-bd789d2922f0@lunn.ch>
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
In-Reply-To: <9c416362-4e28-4327-b8c3-bd789d2922f0@lunn.ch>

On Wed, Nov 11, 2026 at 03:03:12AM +0100, Andrew Lunn wrote:
> > 2. The Ethernet connectors, LEDs and their wiring are on the carrier.
> 
> The PHY itself is on the Module?
> 
>     Andrew

Hi Andrew,

Yes, the PHYs whose LED configurations I'm moving are physically
located on the SOM.

I'm moving them following the approach we previously discussed here:

https://lore.kernel.org/all/31f30651-7c99-42cb-9e27-e4806529d137@lunn.ch/

https://lore.kernel.org/all/fac81a12-92c9-4e29-96ca-473c18fca675@lunn.ch/

Best Regards,
Stefano
