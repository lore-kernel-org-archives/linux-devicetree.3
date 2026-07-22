Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60200404BE9;
	Wed, 22 Jul 2026 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784720788; cv=none; b=LTlakHP88+wEFjSDVQKhtEsjHhtipYDOOigIeYsXUp02tIQwLuC5u/rxmjexG3UP7I9y/EFvpb7gXF2EYkDuTkpxqMeOeAIy6yQc7KxX/yyftgtQayVZqQIZmeVp7g6/PpAWhyUevoEWW+8F+M9aH0ik+F9IUZ74IJjs8XwXv7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784720788; c=relaxed/simple;
	bh=nGvE3+M4u43M1SZQpAfJA3EfRI6JozazVv+5YhQ9wt0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oZY47yKBU44kgBTOdciF+apZLITRYlkZK//vzBIG9zIA/FsI/s/CDL7W3ASqOOJA5jr9sbDzR4J5y0IcIAG7fzF8tPFLfDWbSZ2r1yhkIOsmab1hrfIBPiARkUoSdwXJNbKWNjKCjjD2jKFtLoumR7fqjFRyM6aHDrVsd7P1CZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=gOcSr6C3; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="gOcSr6C3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784720785;
	bh=nGvE3+M4u43M1SZQpAfJA3EfRI6JozazVv+5YhQ9wt0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gOcSr6C3tjWVfaZA3tml4aiqNrprIE3MYqA2EGVKAd1xgO3G+530/9cspGms1beWJ
	 F9IVfyh5udQNuBsRR+TPwe2th7ay3oX3KpIlhqU19VBhTgUQWwGYpHQ9DiLJwVm/j4
	 gGwKxjklw35Xp/vw0KZ/9OF3GhUCnDhJrcx1maKji14u3wifbiOBkk5UiLm+kIoQvX
	 BKZSY3ffjkZHNsGG9+p6cEam2xQK5XpaUL262GE/+v0VdIGzGTGjot+VIX6zKLCcLi
	 +vg561piDz7O7A/UQnf09b19wer4yOabsZyTC8DwLHIFMnfavMjeQ8ecbe8jiezgD4
	 Ccv2T8G6h1hqA==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6E977662E1;
	Wed, 22 Jul 2026 19:46:24 +0800 (AWST)
Message-ID: <8a75ad0ae44f1231fd75be6a617962a4d2c58e7f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v8 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 21:16:24 +0930
In-Reply-To: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
References: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
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

Apologies for the delay in getting to this series.

On Mon, 2026-06-15 at 10:46 +0800, Kyle Hsieh wrote:
> Summary:
> Add linux device tree entry related to Meta(Facebook) ventura2.
> specific devices connected to BMC(AST2600) SoC.
>=20
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
>=20
...
> Kyle Hsieh (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: arm: aspeed: add Meta ventura=
2 board
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: ventura2: Add Meta ventu=
ra2 BMC

The two changes don't apply cleanly against bmc/linux.git
aspeed/arm/dt. Can you please rebase them so that they do?

Andrew
