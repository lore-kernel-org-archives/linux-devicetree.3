Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B37E472F64;
	Wed, 22 Jul 2026 07:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706341; cv=none; b=OW1hTGqkmr+q6dV0/PtPJtEOi9Qy8CfFCO76QHi0kEVvNwhcnLIt6wVgE0PPGElOZNcSsrJyYzvP0EUYGtcJYnV2vhzm6ASspD+bn9k+Fbq8L7zzNxgFADhXh8q2R5OFjp1R7hOC/VUMjrJAnaOyQcUEnMAzor08myyxVGzl7CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706341; c=relaxed/simple;
	bh=pjNHemqaPS8NDXPxRQIP6YJX3tVfT9dCTTrh65R05DA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QmpBfpvGuin8GV1NJRs+ZDZvkrVIzJlk3Dxt0gps3JQsh6MOKKTaVG4uUApNl62W08AxlkOSP392AVjSN1MpbuSx9nRjNNjny9EqdRnTBSEbHM9QOmcO3IisJGKGvOo860evBRBzX2ZiYwyd4V7lSoNuiW8BEywNYQaZm0ppo4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=dGfWOxgQ; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="dGfWOxgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784706337;
	bh=F0DOZ6IJ9ra0/dlBSWtiIdXa1p1W7GVECGzod3oAz00=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dGfWOxgQM8b6nirRFWRn9PTfUHrA5xIHQZBzIx9qrKgUwiomGtO1iWJ5XwL/JnDo1
	 jg7gjWJfkrUEqXd+2QnhKu8NO1p0ScMontpwibmhx3uTJxzeX+7zwbep6nJZbI9OSx
	 IPO3D0OyTjPs0o7+u/wU6oWLtvSOMfT0xw1pIx0hmHI2tXwJs7xeWkHCz6wtiGehrB
	 E5gCcMaQlYKxVUNZexGGUlPH9+Pp0sQe0kc2jGVhkUPyoA/LH8GgzCtEeCC91xfHjU
	 wIWGUI6OT38gJReLxhRh7NP12NFcRRhypHRQtODNP/yEJI/zK6mu1eNCfwRMlGSyop
	 nQrVYOTMewLAg==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 424E8662E1;
	Wed, 22 Jul 2026 15:45:37 +0800 (AWST)
Message-ID: <b707f061cbdfe52f8d72ccd33ec177113e20a5e5.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jacky Huang <jackyhuang@nvidia.com>, joel@jms.id.au, robh@kernel.org, 
	krzysztof.kozlowski@oss.qualcomm.com, conor+dt@kernel.org, andrew@lunn.ch
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Date: Wed, 22 Jul 2026 17:15:36 +0930
In-Reply-To: <20260710054849.3178747-3-jackyhuang@nvidia.com>
References: <20260710054849.3178747-1-jackyhuang@nvidia.com>
	 <20260710054849.3178747-3-jackyhuang@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Jacky,

On Fri, 2026-07-10 at 14:46 +0900, Jacky Huang wrote:
> Add the device tree for the Aspeed AST2600 BMC for NVIDIA's Vera
> Rubin NVL compute platform.
>=20
> MAC0 uses phy-mode =3D "rgmii-id" because the on-board PHY supplies
> both RGMII internal delays.=C2=A0 The matching U-Boot device tree does no=
t
> enable SoC-side MAC clock delays, leaving the MAC internal delay at
> zero so the PHY-provided delay is not doubled by the MAC controller.
>=20
> The corresponding U-Boot change has been submitted to openbmc/u-boot:
> Link: https://lore.kernel.org/all/20260629105202.1417679-1-jackyhuang@nvi=
dia.com/
>=20
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
> ---
> v3: reword the &mac0 comment per Andrew Lunn's feedback.
>=20
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts=C2=A0=C2=A0 | 901 +++++=
+++++++++++++
> =C2=A02 files changed, 902 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nv=
l-bmc.dts

We now have scripts/dtc/dt-check-style, and going forward I'm asking
that all new devicetree submissions pass in strict mode.

Currently:

   $ ../scripts/dtc/dt-check-style --mode strict ../arch/arm/boot/dts/aspee=
d/aspeed-bmc-nvidia-vr-nvl-bmc.dts 2>&1 | wc -l
   152

Can you please address those?

Andrew
