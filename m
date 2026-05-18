Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54EA37E2F9;
	Mon, 18 May 2026 05:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779080545; cv=none; b=kLZlmPcCSp7ReQoT237TIf7STvB2QBpC2IR0JTqfl8thW3JhFU0lmZci7wMBl7VelyhS6SOYS3WSsGWXVfJwSYOoXXPEgS8igKMLE+l8Vdu0DA0jnUc9R6rMy8IpERd2uY3LqvDrVeisFzCxLuoN+OjiYE4vWaEGmdtFmwm692o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779080545; c=relaxed/simple;
	bh=MiGtwoPUHm2LKcxW6fZx/3aamAm5XYlTqpOjgktt4wc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mPtEKHMIQY7pryoHFZjti1KrV/Pf6CAoclBqF4AId8d+TgYmhiNawtzn5l71zaB5awFpaPjYFqTNJe5PtFa6hEkFEp1SrcJcVQPrctmpkM0OLIATgyay5wFfTswq5Ooq5xC5HVSZaIYuOAoKM6Guwp3I03B3vyhIsPcIeszAWd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=V537ku1D; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="V537ku1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779080541;
	bh=MiGtwoPUHm2LKcxW6fZx/3aamAm5XYlTqpOjgktt4wc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=V537ku1DUKlUnpyvBfXQTRmZtwO0M9khnjhFoZkwPTTuzgNGZqasZSPR5Te2AfLL8
	 ItvG8QguMR+XGSAv6MWwz3a0bet/9Lp/HiNboJXGR/8CJ80lkx3QfL3epnsseycq8S
	 0h/zIuGQjFnu8hhGLLhBePg9654iI5vzrPDdYjeRcyX06qP/srM8ht6XAnce+hZAAY
	 Z6xFiVbkR9MFSXnPOsYGwZ2UvL3Nu5uKIvmgXcSTkKsm88+hWVyef070efjPirRHbb
	 XWHGtVvqACFfk4jEQW17pzudzceTavrZNNDrg8d/AtrJ0kpi/Ka7eqeQgBnaeLz2ab
	 cUPr/h6oqO78g==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A23266025D;
	Mon, 18 May 2026 13:02:19 +0800 (AWST)
Message-ID: <23203c124a158536c272d1bffb2657a0d713f8ce.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 0/3] ARM: dts: aspeed-g6: add AST2600 I3C nodes and
 bindings
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Lee Jones <lee@kernel.org>,
  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Joel Stanley <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, maciej.lawniczak@intel.com
Date: Mon, 18 May 2026 14:32:19 +0930
In-Reply-To: <15956b70-c6c2-4e3d-8f15-471a274d6e2d@linux.intel.com>
References: <cover.1777058942.git.dawid.glazik@linux.intel.com>
	 <15956b70-c6c2-4e3d-8f15-471a274d6e2d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Dawid,

On Mon, 2026-05-11 at 16:14 +0200, Dawid Glazik wrote:
> On 4/24/2026 10:20 PM, Dawid Glazik wrote:
> > This series reworks and resubmits AST2600 I3C DTS updates that were
> > originally posted in 2024, but stalled without further upstream
> > progress.[1] The series was rebased onto the current tree and merge
> > conflicts were resolved.
> >=20
> > The patches first move I2C controller nodes under the APB simple-bus
> > for layout consistency, then document aspeed,ast2600-i3c-global in
> > the syscon binding, and finally add AST2600 I3C controller nodes in
> > aspeed-g6.dtsi.
> >=20
> > Jeremy agreed in a separate email thread that I can continue this
> > series under my authorship.
> >=20
> > Link: https://lore.kernel.org/all/9d8c03d742fa9767f30e23d75ddf0baf4296c=
88e.1714647917.git.jk@codeconstruct.com.au/
> >=20
> > Dawid Glazik (3):
> > =C2=A0=C2=A0 ARM: dts: aspeed-g6: move i2c controllers directly into ap=
b node
> > =C2=A0=C2=A0 dt-bindings: mfd: syscon: add aspeed,ast2600-i3c-global co=
mpatible
> > =C2=A0=C2=A0 ARM: dts: aspeed-g6: Add nodes for i3c controllers
> >=20
> > =C2=A0 .../devicetree/bindings/mfd/syscon.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 543 ++++++++++--------
> > =C2=A0 2 files changed, 318 insertions(+), 227 deletions(-)
> >=20
> >=20
> > base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
>=20
> Hi all,
>=20
> Gentle ping for this series:
> https://lore.kernel.org/all/cover.1777058942.git.dawid.glazik@linux.intel=
.com/#t
>=20
> I received Reviewed-by from Krzysztof Kozlowski (thank you).
> Could I please get feedback/ack from maintainers on the remaining parts,
> especially ASPEED DTS?
>=20
> If preferred, I can respin/rebase the series.
>=20

Sorry for the delay.

Given Krzysztof's R-b tag for patch 2 I've applied 3 (along with 1) to
the BMC tree. Patch 2 should be picked up by Lee through the MFD tree.

Cheers,

Andrew
