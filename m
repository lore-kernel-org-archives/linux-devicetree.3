Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825432;
	b=fCHcNFzQQc+XVYxCs3WAem7RhCLzoXUB5+bjfIdB8cK5/apKn5MYKTMIxMI18hgWQ1vs
	 lyNIPA/D850DniWSxwJ39205R3FbS5IKWYq7fRp2W7e14DtnxdDi6idKhlY9a54hOAUKY
	 VJU8QuxHNK7qGlBoGQRhBDjPooI8pTCsvOG9MwMLOXU0qG3tUHYZDc0zX+fkerh1etN9U
	 RshzvC60yOUWGBuXkqcGjXWMltdYA+MkyPqPIIgSBjRWQBfnvBdOZPpdNYm0c81MJF8RW
	 OkgQIu12bcLNVNI51YiCw+YI0dnOH3uPB0yjhpRdLNod8K8kSZXYrh0rDqcCXsX1bOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825432;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8nFiLiDouyCi+3MrWQIbh2gd3TRYxuw+CjOhWtqEDPI=;
	b=ZTHrfbVzVmlrpEOyvvwSSBfmg/G286xTX20kYSt27ZwGImbJDbnz3ptcHsIx+PPf62sb
	 QTBOSpmmYEUifUQ0G2Wd25Exn32i/8BztLWT2z24kiulS7hAQr01yvKCZPx8uB4hl0TeU
	 Dy695pSHUUKEx/b49mFqFizNJbQJC+VgLpQzOfpKS1TXYSRp7ryBGWZ9r1ZteCNsE4VSU
	 SgbGOpASq63VpzA1EIx2CXIOYK0+r9DE9C/ZRuLwUmIqvKt7r/BSJyokMmP8xrFrxdNA0
	 LbCv9WZu0aaLZk1iRjIsPpdyXMeoWQZxIg1c6BVGH0YvLu13HcrRCAY99AfHpiFsRUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gZMa8KF/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09DA606A330
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gZMa8KF/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9381F000C5;
	Mon, 16 Nov 2026 10:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825431;
	bh=8nFiLiDouyCi+3MrWQIbh2gd3TRYxuw+CjOhWtqEDPI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gZMa8KF/jL/y1zRJrMn5tfH9kyjuPNeEpx1cRA1OO0mbMHK7LVHlw0YfLoxvRYrOt
	 rqAPgmKh3BfVCYfUQ6pSJzI4a8mICLZL9A5Z+U9SP3i4J3LIpi5Gxov9JUj+6Zd4bX
	 KRTbKQVXzECE/n6DmPGyx7yjeij+IcHVz9x/CebCe62N2EsVXpnSKI5snfTpA8AhgW
	 aiXiqYNzYcc0agJTouE4xdMpEjk4yB0nRfFU3BjHY6mkVtx4+oFd+hunLpASUFGinI
	 5eVf8+VyuV9KpGh8d3JtZ9hWnQb/aqtmO9a9RgXc5Y1I9Kjf1W/I1DJ0FElgaRyjqO
	 71AH6KkvEcvTw==
Message-ID: <sashiko-outbox-216747@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: st: add delay on imx335 reset gpio on
 stm32mp257f-ev1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alain Volmat" <alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-stm32mp-imx335-fix-v1-2-01f538260f00@foss.st.com>
References: <20261116-stm32mp-imx335-fix-v1-0-01f538260f00@foss.st.com>
 <20261116-stm32mp-imx335-fix-v1-2-01f538260f00@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 10:37:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: st: missing Fixes trailer for imx335 reset delay fix
--

commit d05cafa7e3f2f1d1ef9b09227251c4bdc48b52a8
Author: Alain Volmat <alain.volmat@foss.st.com>

> arm64: dts: st: add delay on imx335 reset gpio on stm32mp257f-ev1
>
> The imx335 reset gpio is connected to the sensor reset via an RC hence
> a delay is needed in order to take into account the time needed to
> reach the level for which the sensor sees the correct level.
> This prevent having imx335 power-on issues due to the fact that the
> driver is trying to access to the sensor while the reset hasn't been
> yet properly handled.
>
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

[Severity: Low]
This fixes imx335 power-on failures on stm32mp257f-ev1.  Should it
include:

  Fixes: 8df9bff27889 ("arm64: dts: st: enable imx335/csi/dcmipp pipeline o=
n stm32mp257f-ev1")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-stm32mp-im=
x335-fix-v1-0-01f538260f00@foss.st.com?part=3D2
