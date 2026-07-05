Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79DE233938;
	Sun,  5 Jul 2026 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783262284; cv=none; b=inW5vw5LX3nLzWC8p7oB36GdIp5dv5nYjxm77iNpTdwWeBidG3zbuCyXkAOUAwUPg5RBdaUeZrae3OkM6IUekmdRIyQkMz/OD3ylG4Nzt0KTirQLPWOBYkIMBB0bUyy8LPk4a26smFEJ4hDbw1NNPm1yPqFCd1swvFf7+kcrHoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783262284; c=relaxed/simple;
	bh=4rCe3IJiq/w2EFrF4fGo1iuA4FaOPAQK1+phS8J4PGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6id5nFEIH8PQ30wfRTb3xP3o8EHqVcQIBcDDlpykVX/aYL+gO+T2IA2I2eXWbWl3NmrVnuqbNW715fQaM3NebWoiaYw6Ebx58/EwP/KXNHaHTr++aT3vnVKPIVY8x2tnYNmdnJUW9Sy7De04FBzBkvn99jJrRNLb1tyVsZvF1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+U4h6we; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+U4h6we"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4DE1F000E9;
	Sun,  5 Jul 2026 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783262283;
	bh=4rCe3IJiq/w2EFrF4fGo1iuA4FaOPAQK1+phS8J4PGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l+U4h6weTEU/7rdUooiwRpJMdOB2D2eY55FdKkJ9Tcheom6mzuYDVErgBnNyQ9nuW
	 juZBRd/80Ct/xwLq6mX2vgB1wVPYSMsaiMDRy/zTmpkL0sbf3L+pXe6MtUKI6q+8S5
	 HJ7u7913fhzU6L6CXVSW77cqcJSIdipmrvRONPa/5qDUN9IAc+QLsrjeOtk/52ewuk
	 taVeV/zSpc1WAwap3uhM2z8rqv+WWyT0rA2YO/ikn/E/c8uS5/u70RVo3fxA43O52C
	 nmdOiEXqQFRffzFB4uwKJCC7S4Ghg2H+IMJIr2+ilYWPscguvK05AMP4Jh+VQ7B0P9
	 xikfCn9hG9crw==
Date: Sun, 5 Jul 2026 15:38:00 +0100
From: Conor Dooley <conor@kernel.org>
To: LemonFan-maker <2254650260@qq.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4
 board
Message-ID: <20260705-matriarch-epic-37add5cb97b8@spud>
References: <20260705135014.1004166-1-2254650260@qq.com>
 <tencent_B1442A024A02EFD704ECC0F098F663588209@qq.com>
 <20260705-palatable-hardening-48f73a84244c@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AiyjtgLGtmtocOb6"
Content-Disposition: inline
In-Reply-To: <20260705-palatable-hardening-48f73a84244c@spud>

--AiyjtgLGtmtocOb6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 05, 2026 at 03:37:00PM +0100, Conor Dooley wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Actually no, I just noticed you're not using your real name/a known
identity. un-acked until you sort that out.



--AiyjtgLGtmtocOb6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakpsRwAKCRB4tDGHoIJi
0iv7AQDlI/S8W/uC7NLohqtnaUzRyTEyxMjx5+TZHoEo+08voAD9EAEe7olwNwvE
kZGcfmUBU9zm6Zt4/tB/cqelxRH4iAs=
=h9QI
-----END PGP SIGNATURE-----

--AiyjtgLGtmtocOb6--
