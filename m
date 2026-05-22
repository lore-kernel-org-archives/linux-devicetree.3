Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF0B313283;
	Fri, 22 May 2026 18:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779473547; cv=none; b=pQiWaLAcOI2xa9ilkggwVK1J+eMHodZfYeHE2e0zBGkvCgjZ9sXukl/kfaG+wxTDDcIGwOFa27974RSZDb0lXshx3C7uOwQb4k2Xz99e7rmoQJ9tSoaIX0NE3hw8CBvwUGM5CiCC+7ZbmWzw8uvRfEgbI2c3fS0YpuhFZ5UyHAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779473547; c=relaxed/simple;
	bh=icOFYfweWR4cZSdfdSqn77825BhGdKLFPkpPZx7TpjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=buep4BL6YLpdL2H7M/bXm5d7XZJvY2wHGmzfVYEstQZntYAgSgsJWo8Ji1vtv/gQsVdcrf3iFGdjU1kNjjvKd2PG+va9qkogownrv3NyPU0RTT/Dp+ICzR+RgdUpjILbrnp5+x7ZaLN+dYWpz+sxymOduoTkBwvQFqVLTtglaJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=dzRXfq8/; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="dzRXfq8/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Mfj0bqiwU9UZ/DaM4TVZqwuHk8x0pXX2xh+cE5s1V+I=; b=dzRXfq8/YrF1Yi4wB568ZSCqdo
	3n8Kva9fbQUVYp5Ryiw+ZwV6/2QPa53TMybIxEQhbDqVVxwCoGp7K+F5CMP+jv9hZG4NOl0glTJVs
	5xkQ+3KamDiI6whiQ5+3jvboscKzFa3VjnX+j6Nng0EnViz6z7/YoUWtU4IR8QlYjd9mglHEc2IHi
	6EhNgJbWmoXIrGhXU74k2zQCqp5ooqO6zgvKZsfQnf20Wt8Flblb1fSPIUeoJ1zaaJInd/u2bGTb6
	vLD3eD4mq1SJlkwCzo2OiN5luTrko2Vm2NthN43bHv9gZK09g36WXFHc5cRK8QRilKbwXo6gxAxiF
	Fat2Ghsw==;
From: Heiko Stuebner <heiko@sntech.de>
To: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Cc: linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
 dario.binacchi@amarulasolutions.com,
 Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Axelera AI
Date: Fri, 22 May 2026 20:12:16 +0200
Message-ID: <23231974.Yz81rIOvuz@phil>
In-Reply-To: <20260522174918.61523-2-patrick.barsanti@amarulasolutions.com>
References:
 <20260522174918.61523-1-patrick.barsanti@amarulasolutions.com>
 <20260522174918.61523-2-patrick.barsanti@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 22. Mai 2026, 19:49:16 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Patrick Barsanti:
> Axelera AI is an EU-based provider of AIPUs for edge AI inference.
>=20
> Link: https://axelera.ai/
> Signed-off-by: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 28784d66ae7b..595ad9423ece 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -217,6 +217,8 @@ patternProperties:
>      description: Avnet, Inc.
>    "^awinic,.*":
>      description: Shanghai Awinic Technology Co., Ltd.
> +  "^axelera,.*":
> +    description: Axelera AI

description: Axelera AI B.V.

Which is the dutch equivalent to a Ltd., so that is the full company name.
See
https://axelera.ai/hubfs/Axelera%20T%26C%20Sales%20Feb%202026.pdf?hsLang=3D=
en

>    "^axentia,.*":
>      description: Axentia Technologies AB
>    "^axiado,.*":
>=20




