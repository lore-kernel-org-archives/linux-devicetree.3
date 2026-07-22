Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787C32D661C;
	Wed, 22 Jul 2026 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704487; cv=none; b=CfBEeCXNa50Iv1sN4wlxJzNnEM2SQCvRhbnGB20JlLKMXSeSVqS6OUCxMwmzr7rpCmVfJCPzOCZMKRoJp/Ln8/HFO8hauPB3Z0H+KKO5edRXePQr5Usq3oSpA6tG39J8ePgM6CwNIcsNDYBvhU7KZizrE1Y0xcF4C2ZCpi/7EUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704487; c=relaxed/simple;
	bh=ewtaf/n/usdJ+GRJDxLAOz4V63fe/JKprJj8bOO8Fow=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D6LK4VTFkpuzfKDU+dAXFqJzOBkEKXkg1561EK4WnNwhF8FuP8Ge/dCvVurKDPcB5m1Hyk15TRzuEhCQhbHOD/PeRiDmwMoRwYE+He3SyWDzDt0HyXCgXi2QBKQTwwTX19UoZqimzGAigx2K/kiJKl7lcsr3IOn5MWdu83wwLTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=RvkCfaYV; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="RvkCfaYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784704483;
	bh=ewtaf/n/usdJ+GRJDxLAOz4V63fe/JKprJj8bOO8Fow=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RvkCfaYViCH3L6gzmFbVpfXLjgDELs2eDRVHsSpSfXKUF47+Zv+8CFOuZrRoy0bC2
	 ojr/OGWJvRfMwzsFy/d14vWmJLDclEtnhMvRH0y+9QlZzhNsicmHBNCbXlb6avBhgo
	 ufrdcraDoB3zolpnXWIrLalF9ddivcoEUnTXshF8gNA/ibMA83z4oJsQsK/y6/JgoL
	 0fiEhg6FWWyVaiM9AT9ezNmTzsPpLuLAMqBfCBjoqz+mljfbkuVnZcFR4P5gIR4LVd
	 PG3IxwqRcqgrrKeXMtDos1+cKpfy/PCUie8ZXDdVfrKcpT1eyS5trl/iXQnvlH5Aal
	 KkN1a8eIrYZnQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ABE2E65B37;
	Wed, 22 Jul 2026 15:14:42 +0800 (AWST)
Message-ID: <27318e19dee124898b95a10f9cad28f456835da4.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/2] ARM: dts: aspeed: bletchley: Add second source
 devices
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cosmo Chou <chou.cosmo@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	cosmo.chou@quantatw.com
Date: Wed, 22 Jul 2026 16:44:41 +0930
In-Reply-To: <20260714120816.1504058-1-chou.cosmo@gmail.com>
References: <20260714120816.1504058-1-chou.cosmo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Cosmo,

On Tue, 2026-07-14 at 20:08 +0800, Cosmo Chou wrote:
> Add second source RTC (ISL1208) and LED controllers (PCA9532) for the
> Bletchley platform.
>=20
> Cosmo Chou (2):
> =C2=A0 ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
> =C2=A0 ARM: dts: aspeed: bletchley: Add second source PCA9532 LED control=
lers
>=20
> =C2=A0.../aspeed/aspeed-bmc-facebook-bletchley.dts=C2=A0 | 294 ++++++++++=
++++++++
> =C2=A01 file changed, 294 insertions(+)

A quick inspection of both patches suggests the nodes aren't ordered by
ascending address. Can you please style-check your work?

We now have scripts/dtc/dt-check-style. I would appreciate further
patches for bletchley cleaning up the rest of the issues it identifies
in strict mode.

Andrew
