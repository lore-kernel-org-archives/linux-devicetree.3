Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DC740F726;
	Wed, 22 Jul 2026 12:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722063; cv=none; b=ccKAWhSTmMoUO9Z07YFTAXmpbXpSin+BUSFerU/Dz+Drijcik/sdEt1QrtzENmY4/2F9mHLDjM1GgvGfaydm3dyRO4PhgFAo0M9pNk91lM6nswmglXc84BKWg7uHGaVqWbRItBB+Hg56k/pnMqlEoZpenaIXv9HcPq6G77rrn/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722063; c=relaxed/simple;
	bh=qEo3cAwztk9OWvKbynD/A3a+NoqgXRz66n8QzFJBxdU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G8L3JwCf3KgAvT2vDHOnuos1y6b99EI4NuMUH0YR9m/r0QcJiJOLlt+uxmST4cLudhRQuGzIMovN4XJMoWqPax4KMBKUo4sc1FTVKgCN3XlxTG3QOROvpqof/ZnFQQrjnj9luIdXGW3pUI5YC2hZrHY8jjhiV5kMJsEZHSqXdgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=D/OhMC7s; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="D/OhMC7s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784722057;
	bh=qEo3cAwztk9OWvKbynD/A3a+NoqgXRz66n8QzFJBxdU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=D/OhMC7s+fcNqNNul2lHX/zlar+PF4e+66S0kXD/J7seotqOU2O0XHqCZUtC99A1f
	 3geW6mwhMP3OTAYMc/oBKgZAxFYejK1q9bv3LQx8V7PMqu0XXG5DOBKxqEPCk30sDE
	 Pj47ToMpmrDMwPtYI6FgYA9zESC4cKw8mUw/Ynpchw/ubEO6I2mREqTtQmMFUBt/O+
	 2WSHAbXhk6pIBoeXleasBzpgT0BhrI2xxsb/c5oHNEtvn0687Ii7Y/bfTYN3mOpnVC
	 8E7UPmM1qAJ71Wg99WwJ2DEDHCuEG8e943Ss3uKUSnOpHJtWQyJlhDNqWQZOcnJ51k
	 HfluMi642WSQw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4BDFD662E1;
	Wed, 22 Jul 2026 20:07:37 +0800 (AWST)
Message-ID: <a6170c549dd8fe3851854de44c2bd43dd0ec1f95.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: sanmiguel: fix PDB HSC shunt
 resistor
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Mike Hsieh <mike.quanta.115@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Cosmo Chou
	 <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, Mik Lin
	 <mik.lin@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>
Date: Wed, 22 Jul 2026 21:37:37 +0930
In-Reply-To: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-1-cccf959c9b78@gmail.com>
References: 
	<20260618-sanmiguel-dts-config-hsc-lm5066i-v1-0-cccf959c9b78@gmail.com>
	 <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-1-cccf959c9b78@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-06-18 at 15:41 +0800, Mike Hsieh wrote:
> Correct the shunt-resistor-micro-ohms values for the four TI LM5066i
> hot-swap controllers on the PDB. This ensures accurate current and
> power sensor readings from the hardware monitors.
>=20
> Signed-off-by: Mike Hsieh <mike.quanta.115@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 8 ++++=
----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)

I've applied this one.

Thanks,

Andrew
