Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546993B9D98;
	Wed, 10 Jun 2026 11:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090547; cv=none; b=EmcGIdnGXc5CKWXI5MBmBH/v+WgXTCyxnGKlFqMk7X/1gZ2xYp+hW5VUbzWjASUg9d+PkfkJqg7DKRQYbu7jqzlRDeY+5ibeELY209cIEOAbeGseWjPhmPNpRIZaZvjt7aKYN3oTlPyTbnIJVVRchZOw5Sr4pJahWoYlXrJbYf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090547; c=relaxed/simple;
	bh=aBDEY71A7aCboQvqZmdLZCfK9+flfFgYZqgP3Td8iQw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CUXOfhQ7qqX1jwQG027SyU4QEvFv4NLZ2CVoJIBE4bBanTavvih/AKxJGVC93RCiBh8RH0orMu6UUvQfwfvuFnJ5PEQU6bSYl8p9WYihrFDfdyTD56w0kNTe61rfKDs2h8ryG55NCSMeizTxIZRlZ2h53soPz425v9Cs+uzPP2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=LVch8VCH; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="LVch8VCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781090544;
	bh=aBDEY71A7aCboQvqZmdLZCfK9+flfFgYZqgP3Td8iQw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LVch8VCH0zomK1nWEJ90cjd/By0E1ewlQ5r2fkj526WecOoevRMgO1i6dynMrgDSC
	 CMKfHYRsoLGH5A6+q/WeH4LpdgVjogq8E6BWaft5NDo8vMO5YB6DxQO+BFizdyoToY
	 +SnQjofpJeFRyril0GtxrqlER1F89XaqcmaC9W/+RyoGBFHJTtxx+SlGRCPRSHzBFE
	 lZjas42RoA5evv+8gaWjzM0IN+KYkV3pni3kb+J09X1dg5bJ+pPZZhvIZL//ZHpRHW
	 MxUFftFZQ3jez5zOGwZ3jnQ1sIoaP7BCTa8OzmYR/Ed6kNmaWIydKoW1s2SogFhFR4
	 IkdElg6fpkrLg==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EFA2C60A14;
	Wed, 10 Jun 2026 19:22:23 +0800 (AWST)
Message-ID: <a8cdc7c23166823a8e1969408c667e6a8d758fe7.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Wed, 10 Jun 2026 20:52:23 +0930
In-Reply-To: <20260610-ventura2_initial_dts-v6-2-375d8e9d7ebf@gmail.com>
References: <20260610-ventura2_initial_dts-v6-0-375d8e9d7ebf@gmail.com>
	 <20260610-ventura2_initial_dts-v6-2-375d8e9d7ebf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Kyle,

On Wed, 2026-06-10 at 09:22 +0800, Kyle Hsieh wrote:
> Add linux device tree entry related to the Meta(Facebook) rmc-node.
> The system uses an AT2600 BMC.
> This node is named "ventura2".
>=20
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>

I have some comments on v5 that are applicable here too.

https://lore.kernel.org/all/3d56889c004fc2d11b76ace6033c7ccfb8a37d03.camel@=
codeconstruct.com.au/

Andrew
