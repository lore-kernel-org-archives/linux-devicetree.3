Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1BD2F12CE
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357935; cv=none; b=gwLR4RikxhrABtwNkx445BaSj9/S0hwOKe6Kwx/0926mPFF3NoxHBXjJo0e9IR7smH6zkUl/Q8xIF4S53rsFyJZh6gbVkXMUETwl0JJqhpsMIHwnKfBA529BleU0WmjZ97TNIUfJcV5BRhQExGI26x7zJb4ZZD3NNC6kLetKCvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357935; c=relaxed/simple;
	bh=9Qaxnft5QcjEe+8OGMPo6pcL4qMHnO2VQLIGwoXXX70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbJt+c3O4kdTsedgPvg6d77zbO4m6pPTWeUbvsPvfcT7+p1IQSHFtP48k7Nq/bCjSEciT2nVlkktnbFiY5d3xjUp6yK6H9wbLNDPk+YktpyQ0W91+sKbTtkE46kT9TQxecXSXD3F8X+pJwDdYveaPYIL+bO7DfqaJ9AlqXM9kIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=N2AhnmO6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="N2AhnmO6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493d3135e9bso12576385e9.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783357931; x=1783962731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Qaxnft5QcjEe+8OGMPo6pcL4qMHnO2VQLIGwoXXX70=;
        b=N2AhnmO6qH2PcgazgauOqjcnYJCAfUD8BXzo0vfgNpSHNK3oQR7N/PcMILpCwT1KPq
         KmX3pQt0GsXNx5PsnLQvt4SVQzIwOJjNeDvkObkrVGuEd3NhS4Xgp5PjqNH7j2S3Qi0d
         CyVicMWbPZqZlTeB9nmghjLlRefD9oJocEeLVaODdqj7jul7BxX4A/6AqZLGqktOzXK1
         YX9sijuJy4Ll8gjKnNHAF99+I34v3OP0yWko8elnXAP2KIPs3JETNtD2oskPeH17Erzw
         DL8pVSar5jl7bHM+o8MKy0a/NWjL58cxnKQDAqImHhUIe/zen7npTRECQI7mo5pgOFmR
         3EsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357931; x=1783962731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Qaxnft5QcjEe+8OGMPo6pcL4qMHnO2VQLIGwoXXX70=;
        b=mRJzVu4oug9N5Zs7zwWe+3pk5y/A82dMe3rR8i6D3Sejd1ysN/iJbGvguTKmzMlRuE
         tmnZn5g9JRxcpj2vgKEL/NLBYW6VRG4fwW7lxgo1yoQ1TSpFujpWmZfm/Wn+ne2Tqe1b
         zEAa+5Qlie2Siiu/N5A97Qyo/j0qkv05MCB6BrQwpFzHcUFDnony9c6+tFAayrwabWUb
         ZeWPUsxPhswo6uJzghXvrCBkrRDyKCVZQh/327miLw85nswFWJGFCITERtTqESn/057u
         4UO/b6WYlTXMZhjHG1c95CkpOWk0ZCHrc8Sx2SBA2l8Qyci5iGJd9LTr3yatdipo2lTt
         Zqdw==
X-Forwarded-Encrypted: i=1; AHgh+RoIV4PlhKJ2r7HHRMB6tW4PSVYsV4KTqpiY+8AHNzAWYLnFsLyi6IvvJUK/MB190a3gQsqlGRtG1iPr@vger.kernel.org
X-Gm-Message-State: AOJu0YxYYkr+iZe8y984uUuo4MP4FvhWrp+ado9Ohx3TCHKZzFr9umnd
	tLkkAhSoGjviOGIazE+AZGcfYLEFshcAlfTyWYY17dRgoErUc+Ajnj7Kk1HDNqexFf0=
X-Gm-Gg: AfdE7cnuXDM5DCTun9CE/My8uEEVSmg0UNT2hIS45lEPTKrrpmZpdH3aE0U0ET0JR3q
	UBb4DYeLAALCE8HUs/tzaCf6xmSRrTSfhtDoofKNBeGDnIzXl4w/4UB7FfiP5ku+uo+noFMxF2P
	W29Nrqng5C8LKQ+1BLAHwg1g2IlR1GZgNniZSFlceltbu3k5KBwbTttaRPFVsOkZhx90vcKLmE8
	BvfX5Yx6aPbBSkYclSlHyqKv8OollvI7tCfer/dPTsZFs937jkZkVNfr7AadFaJhVZhbTz/6PdO
	jl2WfzEjqU4uNHVy9nh6jkZIKU0tGmgB1KH3BA/iufXX76mrKiNx3yQZAPrbEbYkiVgBzuLjVzs
	NVry+moqXJtYC7qdIW9uM2L97dKFqwt02KeFL67+BY2IfdmCrOa6EpDf3LZObH9focUDU0Dj9vb
	yAu8mn0pqOfRb4CQ+/r/2QqXpVpKOEllS1nePu2tBLu2QPiMcRRAqli9LreOH/7HJ4Vf57WMC1D
	x8=
X-Received: by 2002:a05:600c:5395:b0:493:a5d0:d1a1 with SMTP id 5b1f17b1804b1-493df076a4bmr16790325e9.31.1783357931631;
        Mon, 06 Jul 2026 10:12:11 -0700 (PDT)
Received: from localhost (p200300f65f47db0404eb41111570ffdc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4eb:4111:1570:ffdc])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c6375764sm337785835e9.5.2026.07.06.10.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:12:10 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:12:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
	Kory Maincent <kory.maincent@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Daniel Golle <daniel@makrotopia.org>, =?utf-8?B?QmrDuHJu?= Mork <bjorn@mork.no>
Subject: Re: [PATCH net-next v5 2/4] net: pse-pd: add Realtek/Broadcom PSE
 MCU core
Message-ID: <akvhq1YcUFP6eizf@monoceros>
References: <20260706112425.3149226-1-jelonek.jonas@gmail.com>
 <20260706112425.3149226-3-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="apc7am3fmzbmx2nr"
Content-Disposition: inline
In-Reply-To: <20260706112425.3149226-3-jelonek.jonas@gmail.com>


--apc7am3fmzbmx2nr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH net-next v5 2/4] net: pse-pd: add Realtek/Broadcom PSE
 MCU core
MIME-Version: 1.0

Hello,

On Mon, Jul 06, 2026 at 11:24:22AM +0000, Jonas Jelonek wrote:
> +#include <linux/mod_devicetable.h>

Please only include those <linux/device-id/*.h> that you actively need.
I'm working on getting rid of <linux/mod_devicetable.h>, so please don't
introduce new users.

Best regards
Uwe

--apc7am3fmzbmx2nr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpL4eYACgkQj4D7WH0S
/k6+5AgAm3qO0xKJJhBH9p6HlFmRDo8vQdEDyKRnzn8xXCoR1DY35sx0w/TXAGjb
agwxL+lihe7DRNl9CoRJvSS7N0gUL1GYvceTOMqp+LY1hOkHJa8aVd6LxpGa3+E0
YD38sCkSBzrHuX5m77awrFD3HfcqGfSxqEPsY8Ew18i9ja0LpBQ3XEx3MTeOZZS2
1/IynC9RQj3xL5Q1QpTYsCSqAtCBu7zksVn+bCkTI/k77WEbX4RGs9uwMf7Futu8
CuaTJc1Fqjx7mlZPuqF6uWCB7u12JdMi6QnRk337CFf+B7FzgreNTL5qx6RPFEw4
it+yXyRgBxgFj/bfOuAqnHcEXp8iSw==
=A8qs
-----END PGP SIGNATURE-----

--apc7am3fmzbmx2nr--
