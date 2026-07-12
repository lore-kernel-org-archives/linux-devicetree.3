Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2755537A820
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 22:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783894979; cv=none; b=E0JY2pSdWXZU0MGsk4eqS9Hbdobh1igJaaEmM1yxpa1fVswqi/Cr8yX6ughBiW5Oyt35qKgkyR4wzvRVYxDa1de3AI06W7o2Zu2XaQJ5TWIkVw92DZnZSSJWLGNYTDJyjpikTw/FeWXg6ojs+5PkP4UsUd1t8uc+Q24mxaU6eEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783894979; c=relaxed/simple;
	bh=8WRZxD4H8+tY9oaiz5xLvkGilYbPiA92y2Jesbmxnro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlHjr+xw/L2w/JLT4xJvGYpSjSs4e1myAZB11+Otk0hGm4LjfISoXR2S1D29HV6wwUugncmzuS6UBrlvoJSU/bKuMGHHJm5Kq9XynnD0/TE1yTLxvFMFVTQDFY5nMcRzQ7z9MyP3LCYHEMls1kfPCzxB82C4xcou1omkheTzoNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nAhAIMZo; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nAhAIMZo"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47d6c634f45so1288636f8f.3
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783894977; x=1784499777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8WRZxD4H8+tY9oaiz5xLvkGilYbPiA92y2Jesbmxnro=;
        b=nAhAIMZo/IvRqATdC2+4nvuMHx8v/2qJHt+WGnwWhoB2TXIYWixQot20r9o2Kl71Ve
         OjeTS1/8o9ZU9FZ0U9+lb/qkfsq0RiND+FlpB/oaOCDe5jn6WCq6+xbESWEaEv3/o+7q
         ZB09SviaIZgOp9H1KhmDf4a+j5lMng0+XN+5lFDzHcHxnP/hXhlkNdQNx9tCF0CXgthr
         /jT4xh6YWYOynhr+KjB00pqQ6vnGlqRDqQ7pG1Q91JpRh49Y256fYjdMxqxvA2DtAKQp
         FUBIKCNKN4SDMU6hE2T1zTCC+Q0BjX0E7Stjj0RUQdT1t8Gv5Iv5V6jEUQN2vp2MQuyG
         qlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783894977; x=1784499777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8WRZxD4H8+tY9oaiz5xLvkGilYbPiA92y2Jesbmxnro=;
        b=Z9mDzNVWUSpn24M3ITMqc3dvUCjDQn0CijdmuDzoSgI+4Ck4p103S5ojpix5heB7EH
         W5XRILhg0Gd5QFmShOfZG7boTlyTJY8wtIgcEd7FJ87E2HdIljBYnIyTtZcGR9OFRlzG
         I8R0b2PNa1osXKj/YCbub34y2HsGzJKjYWd4VneZNEWWuowWoHx54ZO/3trPKxG2iDzC
         PBdQSgfIzVVMz66w967C9fQWXouR4irCRgl2f5momMhSceKEOypLCxs7lEUVp2HTrMLv
         90QwKDaZC7PcjW2EvtrZNttMwdfSIpXUZpzvVqysRhuUXjwIIbvccV1hy1C2amN50kmp
         ru7A==
X-Forwarded-Encrypted: i=1; AHgh+RrLQLK+y9FwNGQk+ToJjvnm6caSDxoWGXtqER64XjunT931ZMG8du9T6WaXmLtVdetNsw/B8/PNRQYP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/lL7eG/HBv3UuwZg4SGuYlx1J7f6pbHsCkZad6h3+y3RELYM5
	9j+rOpIFieoV5pqd8FgSskFGAW0AO5towpXd3uiGPgxEdVfq1UY4ehoqdnxP7lTViqs=
X-Gm-Gg: AfdE7ckeM9yI1YgpoaUMCAGdkCz5s8gK7kNCnrFgcrZmxYcAIkg4dImVDT2gIE2+Gkr
	HYrSnbYJ08SIhYnIGiOLzSGQ8ytndtkfQFZXYJKJNMbBbuOBLxe9yArEwQBVWAI8nu5qcHJJ9p7
	7kDOC1Kp+kfVylFLBdmA3Sgs1/BDrOJ67MHhWyEHKbEsqf/GM6VwaaA8Ad17iXN9ZtF0BCBVdf0
	LFWESK2fXUUf/dTGwzc5LTD+/QUIeeyVAXpwp19DXSxQlVbcxEzPTjjJdXCWLm9k+zudcaxJI6s
	JXNTt0iv4hD5AqxMI9JLu0hjK0kYSu/0uToul/r/tkASayJRaVasqrQw6Rsyf9WqzvTvlpYonTv
	kf7c5rZ14kj0cbSspEznXxCh42w73V4dOwsQZ5FnATFH7tCW19YIBgaNQxTDyEZWVyOmRCdxeLh
	PKuxcqrztFzGuit4H2o8GRG8KDALEp
X-Received: by 2002:a5d:59a4:0:b0:472:9bf7:2f58 with SMTP id ffacd0b85a97d-47f2dcc69e2mr6731266f8f.36.1783894976653;
        Sun, 12 Jul 2026 15:22:56 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f213e8sm78667437f8f.34.2026.07.12.15.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:22:55 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:22:54 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] clk: renesas: Add R-Car X5H CPG driver
Message-ID: <alQTnZwVRwpVTVUf@monoceros>
References: <cover.1783505142.git.geert+renesas@glider.be>
 <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ak3qgcbynp5sb6ym"
Content-Disposition: inline
In-Reply-To: <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>


--ak3qgcbynp5sb6ym
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/6] clk: renesas: Add R-Car X5H CPG driver
MIME-Version: 1.0

Hello Geert,

On Wed, Jul 08, 2026 at 12:15:08PM +0200, Geert Uytterhoeven wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Ditto for patch 4.

Thanks
Uwe

--ak3qgcbynp5sb6ym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpUE7sACgkQj4D7WH0S
/k692Af/VsqjHq8LAyiXwd69+QSwZHSG0U4MEBmnqkTcJ6mPo3Q1tfbuac0TZGpR
buYByMLca9o6W+7RHLvf+/Zr3Deak9AlTYe0KCuPpU7D8l92MkJ9qyU4qaQWyxrI
Hv1YMMYA5G+C8pvTfUspprOv7ql6Xa7cYPsIo3jLpjbhJL3dg7EiCHHjEt/TyipW
XDBbz9nhJzlzRZZzwDROzHctrH75sRADO/UfFjRhtDmkYC4qRs2tvJk7mEMQ9TG0
ZBnRKl3liOyOP0apWQ9wSU/MuVwRJ+l7pTHIihy3BPhzxJM+7fQFIzy3bdjFMWZY
qnwvvfAtAsXvn3SjgrZe5nuPmhpk5A==
=z1Ow
-----END PGP SIGNATURE-----

--ak3qgcbynp5sb6ym--
