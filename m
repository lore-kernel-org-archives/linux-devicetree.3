Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBE33D1CA4
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 20:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519785; cv=none; b=tnAjJN3c46ZSkRREbOOtBgfjfPnVUVxfgUVH8IvJWFM4U8jdVAf+2pNARfQEIaY9v1RqzY/AnONFEPwO+f+1h+xGmWxhqMzSawVI8uxiGWnHrgzTfW1uE6jI3Ft0BsWkcxc0uHrIvZuT8qvd3UHnCyG0jh52xHYyScVZ+o96TgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519785; c=relaxed/simple;
	bh=/I9ASgw2HlTXRZT2HeWDU8sPW4vmzP40Y+zBADWnURc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JPB50O+soKfa1yQaBUxbiZVY5U+czuOTKZD9XohjydWEfhsm2QlxzkyE+JUK7pXRQ5ANjC3jENL1msGDLaGjCCZaCT4OIeeQgHeJnyoGeMw7CuSOXXttSNgdPMO4OzftRsBU3B+DUu1zxwt9jxtLm2wFV6eQdJwuXltCQkKPLVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNs+zagA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNs+zagA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b3e03939so10861525e9.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 13:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780519782; x=1781124582; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=358Mtgqr9PnThHflx8oLv1DNt6BNQTRALDH0kJnXh6k=;
        b=iNs+zagA5QKXpS8Eqv79w/PebQPG5BiHhMnaCXrvJXFDp41AQiYsag6AmFk9Af+E0/
         e7oZ1fQ5PpLNbJlGvWUS+XEs7Jcv6gnnBY52GZlFpWfh4GbGpMC9Dk/TP9e3KQSeeBzu
         JTEeUeYKopWEkCsyywq8GDfSVeHYube0NNu2r0g/FZ02Rd+l61bYoJCkXBgqk192wRI/
         ZAeJrwEtCppoo9j6KJh47YgxBOIZ3zUzftiqmUaVZV92mT+er1bP5zXVMR8vQYJk8Drv
         JOCZhnEcKV+yDgRf2tqTjBOfAiEykRTQHiaaZQ2nUkETp/OygABuVj+fCd0f7E0GQU+s
         lwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519782; x=1781124582;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=358Mtgqr9PnThHflx8oLv1DNt6BNQTRALDH0kJnXh6k=;
        b=cPas9bKrsP9waqJYJpVatgPezll2tajFwd9U4GxEiC/voE2llZ0x5maz3tCPk3bFKQ
         X06ClEx2D1aq28c3yzia0Ip1L4po8HvySUucAPfLz3iXi9LKncnGEKxI1wFNrnvtmGG6
         4NLaey75fkxfRi8DINiN0U/g5TMpH22Q5DVRt3Gjw7gxalq6BzHf3FFMZBYirvhpV75b
         XXJTrM+YmW3cW1hdNsWt0Bha+X1ImQtGy6FN/mkCk2LlT0C4KBZ3S8D9eKF3GTNV/c08
         ePll/oxUn7XJJ7/zaCZIcqoGnF8mXx93ujmudyey0JL1nqGc6YS1g5cXtpzi8ueb37RB
         PXPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4Nt9TH7gQg3xboZgIiupP3Skz+KgtdSxNkYqqCeMCtP1SGECYFT7lw6HTQdVoXfaB8TAr4fXU5Jz6@vger.kernel.org
X-Gm-Message-State: AOJu0YwkD6uAkDkl01eXRrERZi4yKfr0aJ31z70pvBgXa25anQd0WrTW
	bOQWnkIxYrc8WmjO2rJHkIouqeWtzR9pFTuZOGmUqfk1VUg+nmjKgcGx
X-Gm-Gg: Acq92OFFD6GuP8TPkdbfYMneSj134SrsH1Cg4wsOxuJpEWKP64sqETVfmxSlDZiKHGz
	rrRiIvigCwNbnRUsrio/AYJLu/85djGkNDOZnt52SZwwH+fbArtw2p1SHV9qx63+hrbpHpUDFW8
	L8cf88UxviALGNc7Ex5krdxDmrnxlA1rQuxJxPAOqhI8P3++qnroktEQkP0mQ30cDsAi6tASCQC
	edrBQh90d8zIPZDXxVaD9WdSI/JHwbg38FnbbPxYDN1auciVw3r72Jc0rNebsmO3iNKXk+B6bdM
	jWO612OYrSLMGo6SCZ3DzVwj5kneZy1TE2Gt8NqY1nSRqjR/8z6NQHN+PDyM+a4N1IBL48GfQO4
	lGb+8ES/LWq41VOPFXcy08OPkV+xMTaYVxIsRHSNFv2KWaqDbEtIUNrYZjjNQLqxDtPjOo4sWfE
	jlPg/hWIHFaFEH53ljDADYYXwi5QHAPKY0H9TZ+K/NxDYl/v9PTts0GgByWQ==
X-Received: by 2002:a05:600c:6095:b0:490:bb60:68ca with SMTP id 5b1f17b1804b1-490bc4b54b4mr11734085e9.3.1780519782401;
        Wed, 03 Jun 2026 13:49:42 -0700 (PDT)
Received: from strix.localnet ([197.250.226.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm18512815e9.15.2026.06.03.13.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:49:41 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 0/5] ZTE zx297520v3 clock bindings and driver
Date: Wed, 03 Jun 2026 23:49:26 +0300
Message-ID: <2062167.PYKUYFuaPT@strix>
In-Reply-To: <5620a8969da87612a2d89578be656b5d00662635.camel@pengutronix.de>
References:
 <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
 <5620a8969da87612a2d89578be656b5d00662635.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart23148593.EfDdHjke4D";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart23148593.EfDdHjke4D
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 03 Jun 2026 23:49:26 +0300
Message-ID: <2062167.PYKUYFuaPT@strix>
MIME-Version: 1.0

Hi Philipp,

Am Mittwoch, 3. Juni 2026, 11:50:14 Ostafrikanische Zeit schrieben Sie:
> When there is no interaction required when operating the clk/reset
> bits, I prefer the reset driver sitting in drivers/reset as an aux
> device, especially when register access can be abstracted via a shared
> regmap. Some of the reset drivers under drivers/clk just predate the
> aux bus.

There are two interactions:

The register lock because all LSP and at least one TOP register contains both 
clocks and resets.

Shared register definition: in the case of the LSP clocks breaking up the 
composite definition would sacrifice readability.

Neither of them are insurmountable and I can certainly arrange a separation if 
asked to - but my preference is to keep them together.

--nextPart23148593.EfDdHjke4D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmogk1YbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiV0kP/jAXJ2XwCEk6Ov9f/83t
331cAIqbxbBmPnF9O4P3A0w41ADMtcz4NQVXn8vKymp2NdUgz85g6j9Dl21OvH5h
bOE3+Y3lJUNYN7g7Xq/bH0xgcpVRk3QPi0mDZ8k6RMYWIN8KMXpDyNyqUFbIomO9
8QVbtS8/oSAXydX/jkUWT0/YKKNDNAnFEZfTnKNe4y/HLxPsHi9Xulm94HWFmcR8
A4BMIyFKYFbEadZ/a61HdyM3QidwgnmEaMIbWB2zLEW+3X/GEfM8v2sc6qp9cPDX
mMQzi7d3ns3K4H8JD6VUveo2id2EhJX3IThs/RH9e4araNBdrM7f2huSt0GjNqeE
0JsQBTw/ypRHyzIgG74xlHRonnEZJZI67oDSe7IyLTa9KfTvqpwQH259eRvApZFh
zhdbljzFDiaaW+mGl+T5kXZHQxzIfpUaGDjYbYG8hDPmX2lUf+M6A6tPmvHgo1hD
VB733fUWH95J74asXaZqZKDegV6QF12zgDPIS2lFCOQSgw00FvIRnTvYJqVmFexI
4TR3b/Igs9FQ7VbDsk+mvFOKvOQZIRKi6TBho62Rs1KflnRQd0NlIKAD1Alqd7Wt
GZBVFaQNh/1L960YYzJvio1cuhVi5t1nlgzC5OYawX8+dKcBo2+gffcgBshm7pIx
51DdNXFu6LWbBbozN4tsiovJ
=zIPc
-----END PGP SIGNATURE-----

--nextPart23148593.EfDdHjke4D--



