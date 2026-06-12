Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD222D94BA;
	Fri, 12 Jun 2026 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781247868; cv=none; b=pYMgn2tCvin5m27cUCJfI6NsNiqzl/W7qA8UhNLWtPLJb5tGmWoY+XfKylhzc5FNpz+QontK6CVSlhzjZgRUFs5eiI2lC4SGv3qllJzhCtTCUGDK61+NO0DfPf8DiVSfPEIG+rY9Kar6BbAWA3CULOlNNmIqAM2ahIapDkfoPMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781247868; c=relaxed/simple;
	bh=4XXQEzCnyfkthDAyc4q/tCycPwsLOatT0cKMR40kMQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7e2kgFWYyQTIyr3YXEnCVkkeH5OOpWujUdmzhCJzEnSc7in87waM6Kys0Xm1qy0JDX6KTQ7613hfIV6W6cy87PzHP6pH4IPTHPAU2wmtHRnuqjMU9scLaJeSgby11bjltLzWYucQIDBRkqDbUD452vOFQq/pZ1S+53cMYqk5gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=PUjiF3GO; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="PUjiF3GO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=q58Br9cyLJr5mgSZSCUbf47rrGbOeR1q3kZq91cin4k=; b=PUjiF3GOr6Sl8D4so7fIzjcB+7
	OOOXo2iv625TlpqzdjbMa6VMNyHE9ZxEkdpCpzsFqTK1DAH1jNFm79ShgwHdJyo7rlQT0jumOuZF2
	k6xtgbdqNa3y1M5Wm2QynafcicgKD5tCbXb7qXSTPt32rkoOfRjMAz3uOc/So+PxtSjs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wXvw1-007I5V-7v; Fri, 12 Jun 2026 09:04:09 +0200
Date: Fri, 12 Jun 2026 09:04:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
Message-ID: <1b10c279-bdb7-4901-aa40-bca36dcec350@lunn.ch>
References: <20260611-ventura2_initial_dts-v7-0-a61d8902bc5f@gmail.com>
 <20260611-ventura2_initial_dts-v7-2-a61d8902bc5f@gmail.com>
 <843dc0ff-a504-4237-b0f4-d92be07e2465@lunn.ch>
 <CAF7HswOi3fPMFppPoGmh0QELiPz4Po4cyWuDrEHLY2vNMyKE9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF7HswOi3fPMFppPoGmh0QELiPz4Po4cyWuDrEHLY2vNMyKE9g@mail.gmail.com>

> The EEPROM is physically isolated by a hardware I2C multiplexer.
> By default, the mux connects the EEPROM directly to the Marvell switch
> for its routine operation and configuration loading. The BMC's I2C bus is
> physically disconnected from the EEPROM during this time.

I think some comments would be good. It was not clear to my how this
works.

	Andrew
