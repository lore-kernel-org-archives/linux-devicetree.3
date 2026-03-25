Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F3A3B7B93;
	Wed, 25 Mar 2026 10:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434734; cv=none; b=k0ITFr4jsF28+7yAAlrXLZhUgDm5KgV7bXz5TKZVN7imtKij7lo9PR+tsfr/neB8y0Mu63WvZcHQPj9C/RKKYOrYb9LpJJcxGH8DGmHkmW9Qg2INm7iCYU7MrKIF9yjj+FVhDvPSJAh7XPG5/08G/pbaVNfkmSBeb6X86XGMR7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434734; c=relaxed/simple;
	bh=FzTTRUzL/ZZ7Ln0Ns38q9GaqFjqu7n1C5tzFiktCu3Q=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=e0zxtA60U40UtfwOyJMt+jZ18MhYX6Ju+96LpIBlwDi+2WnefmyVBRKv+pJ3OJPtY/FUYLpH3o4QPXZ4m9vv3D/6m1rGOufUCcxzcEIZIu2LP2uC72SzTHLpwud8Qr1H4b/wSU8nUYON6GWjLFbr/qffT2EfP09aQtlP6nAh5EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=anV/GIpt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vPKDJhxf; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="anV/GIpt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vPKDJhxf"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8CFD31400219;
	Wed, 25 Mar 2026 06:32:12 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 25 Mar 2026 06:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774434732;
	 x=1774521132; bh=PcRO1NS2oDeg1E+vmYQzsnkDfERWn8h/Qdjm2aphaMg=; b=
	anV/GIpt46yqdPvtNPX2lLCd+r470fmmo+t2N5JbsdaeVEmc2NwuYs7JVoPyT5NP
	63nXQgdrsK6p+F6uHeko/nv5FrmC0CtxbIke7axH9GaRjxa2zGDyXdkQ1Nmp0PNQ
	4UHUkuXkvXu425ZOR7kEnpcmFNxjbcuw5UTuox0yHtwy1VRCarM9Z5yULPlmeSwF
	+8gXsMhpx7uFwXJYofse4a191HiUGFY4l0Qm4OksIuPgl5N7Zoyn2rewum0Fz/rz
	dFRtJoAK8XiI+t6cjXyD3T8dJRKwOjP9FHkPGjI67OJ5DWEFgcXnEmCwFz8w8cNF
	UN6Qp8Oyy0nBn7VQnaWkdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774434732; x=
	1774521132; bh=PcRO1NS2oDeg1E+vmYQzsnkDfERWn8h/Qdjm2aphaMg=; b=v
	PKDJhxfS8OSyCXWjTVHVQNzvKFongTUNhjaZUAZ+kuQEE00t27nJmDMtlva70AMf
	M3O3ZBpL3TNCpAf7pyRMOV0khfZ5MMJKFURrttMqzDn6R381htLgDGIy3XYfve6J
	n6O96Up4QWrEqct5x+Qta988J4Bd7ai1BqAiG62OHsfFjontsEAtLbpZapGRkQIy
	9PlmQEisIJ08lXC9ySNyZDcbJ3u2CwBN5Y5Cp9rIbOYumM114gAh0fNnjpoZu/Nk
	Wka+Be30YCQE9bu6z0HP7WWijRbYK6bQSAczFYcU3KnCeY25Tj3vkVlmUGbWUoLD
	XsQduGPrY2jTmf4bdKmCA==
X-ME-Sender: <xms:q7nDaStoaHUSoi9PKzVx1puWwaszqKDxJ9R4xAeQZJDVc2lw268yYQ>
    <xme:q7nDaSTQPfjfVAtBoeVYEdO4JpslCUOZXEzTG3T5tMT7As9BUWTkw-UkAjOb279_U
    r405xqqq1cgXLRUcXjLMK3VfX7M3S-HoyziJ-AI731PREwosOWPwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdegvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhomhgrihhnrd
    hgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhp
    vghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuhhsthgtrdhguh
    esghhmrghilhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhu
    gihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegtohhnohhrrdguohholhgvhi
    esmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhg
    vghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:q7nDaf55Ox_da8hQrAl5yaoptX-uyRJlHj4CUehEww5BAZjGWGeMCQ>
    <xmx:q7nDaa6cF0_hbiaQYAeEqj-eVkyZmmquRq4TXeL6u2NMTWxQnUPQPQ>
    <xmx:q7nDaRRz-sum-nLM7oKXhxKQAsyfRo82lXwqxBDjIlonbAibjHaFjQ>
    <xmx:q7nDaS8I6Q1RX5rHnEPKBIQAwqWdhsUvzwPz51RAqLy7seD_HMYjSA>
    <xmx:rLnDaftqmIH9tHbuyQsdGNMY_LqIChelT2ZP3szAyYPbXVSXOidP6XTz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0DC74700069; Wed, 25 Mar 2026 06:32:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ASG4bdBXeNMN
Date: Wed, 25 Mar 2026 11:31:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Romain Gantois" <romain.gantois@bootlin.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Felix Gu" <ustc.gu@gmail.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 "Conor.Dooley" <conor.dooley@microchip.com>
Message-Id: <e66a0925-b676-4113-9951-ee973866d388@app.fastmail.com>
In-Reply-To: <20260325-fpc202-leds-v2-0-a2f4da739b92@bootlin.com>
References: <20260325-fpc202-leds-v2-0-a2f4da739b92@bootlin.com>
Subject: Re: [PATCH RESEND v2 0/3] misc: ti_fpc202: Add LED support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Mar 25, 2026, at 10:54, Romain Gantois wrote:
> ---
> Changes in v2:
> - Avoided selecting foreign subsystems in Kconfig
> - Rebased on conflicting bugfix series
> - Link to v1: 
> https://lore.kernel.org/r/20260127-fpc202-leds-v1-0-ebd0cfb9f9a1@bootlin.com

Looks good to me, thanks for updating it.

     Arnd
