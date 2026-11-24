Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795548541;
	b=3y4ZFEHJ0eQ/RHupOkfXgclmP2ltty4/LYCq1A1QMPn32Tld0F3sEvDNNTcuyNXpZQ2Z
	 HuW6iAR10Lfa9An9QU11k3Rv7ItgZmppk+RsKnjzVzH3jaFZcw3CcX6fLxT2rLhXNX7cm
	 FRPNBwLllGWT+a41+199AOc+usMgkLExXyx9ArwqdxSkekzXCcg90JKPPKiMIt2lhZT+Q
	 UyoZpvrNtJigyoHnisMY104lFE+pJm7TtCnERbbkhCVvhy1Q22YUZNHNmIp57sStrsqJr
	 S5PgT/1UyYgHeYkjlhKOvzW+7Khjjj9mPTYSCxqvxj+SjP3Xa6T4wxYbFlJrYCx1rPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548541;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=AZKTz25LzBygdb9w2zLuwlp5q46A0Y0VCsBmhcn/DiE=;
	b=kExN3SWewISeR7aK2bVFelKhiVyHVqZWwK998G/HEFIwGj+h+j+dZGRtpusq6VZsidkx
	 hKSr5IXcl1cGQ58DXegeyyHQ8LuhJ52M7JiVfFittQSfERSnJ41hTT+JMhPpuPt1K6HuW
	 cWOGLIFmxMq51a3iuPyp0XV9MnlU/rFZJFNYICFgOqJ/IkZREcGNMBukojoz2T7KIhpNA
	 3at6i9kwkGb9waY3tQmpb4nLDRYLLxnuQhqTTdIPmUGG02EfyuOQJ8ANVJpkF1rbB+lpg
	 e2iECAxjaM9whQLXizW9LZwehiadLtJ9nqG0pFSdHnYXnJMbRKlXtngDzzWrjUwpO9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="Ye1/3y9n";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5A7606A31E;
	Tue, 24 Nov 2026 19:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F5A7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Ye1/3y9n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AZKTz25LzBygdb9w2zLuwlp5q46A0Y0VCsBmhcn/DiE=; b=Ye1/3y9nC0E8uG2Tf89xBseSiC
	rsiyFJHq5ynym6xazFtmGgwmxLMgx+wIJCcUDY/Vo+N7Q0qtMZ3IOYSdrCQfu03RzWCxScLtm/mvi
	OrCPUbmN0bichpQNwquUPLAFHinrW2YP6Y6skerLmcLRQfIguk1qTcrHFW96yR4qGOZ8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVwCB-0018nP-4H; Tue, 24 Nov 2026 20:28:51 +0100
Date: Tue, 24 Nov 2026 20:28:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: netdev-bot+sashiko@kernel.org
Cc: filipp.dunsky@gmail.com, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, hkallweit1@gmail.com,
	linux@armlinux.org.uk, andrew+netdev@lunn.ch,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: Add Cortina CS7542 MDIO
 controller
Message-ID: <22c76d61-d604-445a-9aba-f52e19f93ccb@lunn.ch>
References: <20261123-b4-cs7542-mdio-v1-1-626d0a0e3b4d@gmail.com>
 <179554724588.3135.13754934088283070222@kernel.org>
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
In-Reply-To: <179554724588.3135.13754934088283070222@kernel.org>

> [Severity: Medium]
> Is this schema missing an input clock, and possibly a reset?
> 
> The description says the block has an MDC prescaler, which means it
> divides some input clock. The schema only adds compatible and reg on top of
> mdio.yaml. With unevaluatedProperties: false, any DT node that has a clocks
> or resets property fails validation.

It does get messy to add this later, since you have to keep backwards
compatibility to old DT blobs which don't have it.

If you can add the clock to the SoC .dtsi file now, it will make
things simpler later, even if the current driver does not use it.

	Andrew
