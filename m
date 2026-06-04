Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACCF2EC0A4
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586594; cv=none; b=YpnTWUA11B2sQ1/Nt4Jc9ANF6ng8o/nxyiVmVvhSXuxwmze8vEfE3zRbuvoZI0MrMKUUzfq/UdPo+mEiNzRlCOmK7cnePC7PkaVrWN9nj21Y/n8ifwAB4PTzNXngcRg800oOA162+o0O02tPDdV4tYAUm6vudnGP1UHDIuv0wOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586594; c=relaxed/simple;
	bh=pVuZuEBIULjzQABGGJSQfIDgV0lIC+f74CyYOz83UH0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UBNQ8rSI/XZ6c1uRp2zTFSlum8NWM7TXU+LbD6wowS24aa44Bbwhly8/OnKelPE63q3IGe0b3z0htZ0XmTUCPt1T6+8Txo20rWEMMMafcY21sHhFyyVmMoEkkGMOJPBuRhj55sIsE5WsmmkP9MMhTtxRiT0EkIiOLEJKQ8HKnYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV9uP-0008Cm-TC; Thu, 04 Jun 2026 17:23:01 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV9uP-0016D7-1k;
	Thu, 04 Jun 2026 17:23:01 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wV9uP-00000000CcW-1o5o;
	Thu, 04 Jun 2026 17:23:01 +0200
Message-ID: <f92114a3658185b57bffe546c0f4079a9d39afce.camel@pengutronix.de>
Subject: Re: [PATCH RFC v3 0/5] ZTE zx297520v3 clock bindings and driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,  Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney	 <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 04 Jun 2026 17:23:01 +0200
In-Reply-To: <2062167.PYKUYFuaPT@strix>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
	 <5620a8969da87612a2d89578be656b5d00662635.camel@pengutronix.de>
	 <2062167.PYKUYFuaPT@strix>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

Hi Stefan,

On Mi, 2026-06-03 at 23:49 +0300, Stefan D=C3=B6singer wrote:
> Hi Philipp,
>=20
> Am Mittwoch, 3. Juni 2026, 11:50:14 Ostafrikanische Zeit schrieben Sie:
> > When there is no interaction required when operating the clk/reset
> > bits, I prefer the reset driver sitting in drivers/reset as an aux
> > device, especially when register access can be abstracted via a shared
> > regmap. Some of the reset drivers under drivers/clk just predate the
> > aux bus.
>=20
> There are two interactions:
>=20
> The register lock because all LSP and at least one TOP register contains =
both=20
> clocks and resets.

That could be solved with regmap.

> Shared register definition: in the case of the LSP clocks breaking up the=
=20
> composite definition would sacrifice readability.

That is a matter of perspective.

I had a harder time validating that the resets[] array is properly
initialized from the two different composite arrays because of the
unordered reset_ids, and some remaining resets[] being filled via code.

It would be much simpler if you split the reset definitions out into a
single, separate, const array, indexed by reset id. In fact,
I would suggest this even if you don't intend to move the reset code.

> Neither of them are insurmountable and I can certainly arrange a separati=
on if=20
> asked to - but my preference is to keep them together.

I'll leave this up to the clock maintainers.

regards
Philipp
