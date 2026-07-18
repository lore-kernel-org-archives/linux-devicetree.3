Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD865344DB7
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 07:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784361091; cv=none; b=iLPCXE1yDeOE4yWbS6HnIlFONf+VFq9kG/xMtMatyy8QYtmmL6tliU9IhDFiwnfPE+6OSWlcXr9ZnmJuN9PQAidoQNoH0hdUyptXEXJNk7vsQPRkzI4sX9YfwMispCcFGJn20B4OZjif/UqSNQeoYiirrp5MqzjTytvRy6LCN54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784361091; c=relaxed/simple;
	bh=KkJvQNCZGwOddPVe9RzKTm2kcHH0WR62mljAu8Kp48k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DFCPFXaY1zggRTU9W+0pk1C1LEGlSjy8THZmrrb7YH7MNh3IWEAUZy/0NEMGGuC+cftBo8JOBCUx7p+x6OdrzXz1zvLyPkf/waer50OqTwo2nrwzmVY6z5Y1y4/teKjiA8aSdoudlyssu2g+e3trhKswWyrKyBxZj5JQTi2rzfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OytlHqZn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OytlHqZn"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47df43bfb07so2329979f8f.1
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 00:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784361088; x=1784965888; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XHuS2uW8Bo2nkF3eNBf80lun7nQgThoolW/PgIH06Nc=;
        b=OytlHqZnYEaR91vc4+WupKz28J9NWtTxXjgDOj6m9DhxF/6PpEZLYoWzxbY4HDnmbq
         wIRpFS2E/W/X0D86iRMV3WTj//LEGob2MH06u1v8umiSg9ytFMIBObCiJr7xd3q0N1/Q
         r+OVAuuRaTSds7SQw25jHJuwY90Ruk5Y2eXAJ1h3u5HntKeCGzKpziKE2Xf+pIPFZrtv
         Bemxj/sLdQw811iQ6olFFw2JyJtmupPpF6oGjYdmz2HdqpsFNs7fiDyzZj7kBnIOPrdd
         1P4hWe46Mam3S2CD7vCLY1V0VneqX2KVJxe2MMAa7fTRneGIVf/fgEpshazj6aSCSKfL
         0aZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784361088; x=1784965888;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XHuS2uW8Bo2nkF3eNBf80lun7nQgThoolW/PgIH06Nc=;
        b=dJspns+TcyVzpBK+6hTwac8bbuieAklvNpCnuKzjaxuSfVcgALEr/QzwWX8e2obELJ
         e1nj3yi4xmnRkpVQH7PaEUZd01UmXa5y3n2AzjeD3TcLwvpBXrbLP7fbtCapE8FKEYZu
         WBsezHSllreysYkD/rfEil8xw5xUuAVlgculW7Ljpccp+4mefxE/Z2p0tbBNNE2w10ZB
         ddYZrMY8Br3TwyvhTrjpNGohb6hAexBVLzZwPTBv2J3hNJJamCLz2ggiWejx1VCAxdJj
         gQ2ZgiMPcAfdzsLo9xhRr6lUX7tKmOVx/42LkvNBJFyuupmBMTAcqp5KKp6Vp8hg6SRY
         X3+w==
X-Forwarded-Encrypted: i=1; AHgh+RpSCAwifAWEgLpEgFJPhbtksgqV1RZPxgsBQP8E9rhD52heXseLqG5yDTQPiilzPb7hzTNztZ+A4ej4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt//Kl2GCLqw8ESYh0QpK5rlPbVXnAskqziFy4gPt+3M97yBX4
	8GACDxgbK4S1mLLzc1m7GmpAZabXKeQteiz4DW9dp4RnR25ZRO96nLYUUpEnk9bXDjgL0g==
X-Gm-Gg: AfdE7cm+XZHr3im0X4cAXu1rjFNV9l9RmJMOFcbKWPUzBKZEf/I9vZ+aJjFbBX3cSpd
	zdXXhA9CS6/KNBDKDIRKIowyUqsra6mJICNrayNKpqAg+l4PMdtyp2l2pnwd8pQk1LXgp7mluf4
	fgnyg+jIktP4lKrRggTcrprh6tlxo+AxgKfgiTfz7PJWl9sqNaYTW286X/eiY6ZXq98zKsLh/it
	ggA3J09PHnRgn4RAayHAd86TddpzVsfSaBPxOYdckEzk0ptDlE6feTMrv2XUwFTyPUv5Kr79gT+
	WLJ1Shh9q17Wh9hgZFAtbhukqaV3U0iloF9yQwyzAukxrezQL9o7+TGet795c80ydbMEjCzVnfn
	pXICOlzd8v3Sdmz075os4epM+XHpKDkUbitDWQsRxxyXpKX15DIa4bSlqdPpZQVfaiiWw2T3fbD
	YyFHv7lhMIuza3UIzElCbosw==
X-Received: by 2002:a05:600c:4585:b0:492:45a0:dcef with SMTP id 5b1f17b1804b1-4954a3eeb63mr65163955e9.5.1784361087691;
        Sat, 18 Jul 2026 00:51:27 -0700 (PDT)
Received: from strix.localnet ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954aa1a231sm61024895e9.1.2026.07.18.00.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 00:51:26 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Brian Masney <bmasney@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject:
 Re: [PATCH v7 01/13] dt-bindings: phy: Add zx297520v3 USB phy documentation
Date: Sat, 18 Jul 2026 10:50:46 +0300
Message-ID: <Jn1AVBXlRkmJ2q2cQbPFhA@gmail.com>
In-Reply-To: <20260717-uncovered-feathered-groundhog-eab16e@quoll>
References:
 <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
 <20260717-zx29clk-v7-1-408411cfcf36@gmail.com>
 <20260717-uncovered-feathered-groundhog-eab16e@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartTPGCLSSKQRu-pTqQQZ3W5g";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartTPGCLSSKQRu-pTqQQZ3W5g
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Date: Sat, 18 Jul 2026 10:50:46 +0300
Message-ID: <Jn1AVBXlRkmJ2q2cQbPFhA@gmail.com>
In-Reply-To: <20260717-uncovered-feathered-groundhog-eab16e@quoll>
MIME-Version: 1.0

Am Freitag, 17. Juli 2026, 09:32:18 Ostafrikanische Zeit schrieb Krzysztof=
=20
Kozlowski:
> On Fri, Jul 17, 2026 at 12:35:37AM +0300, Stefan D=C3=B6singer wrote:

> > +  resets:
> > +    items:
> > +      - description: USB phy reset
> > +      - description: HSIC phy reset
>=20
> Why do you reference here resets from the parent? That's a clear signal
> you have one device, so one device node regardless of Linux phy core
> behavior.

This is a follow-up question for the PHY maintainers, if they notice the E-
Mail thread: I'm trying to resolve an apparent conflict between DT=20
expectations and a check in the PHY core:

device_set_of_node_from_dev(dev, dev->parent);
=2E..
devm_of_phy_provider_register(dev, xlate);

Passes the letter of the check in __of_phy_provider_register(), but I am no=
t=20
sure about the spirit.

"dev" here is a MFD child node without a DT node in accordance to DT's=20
writing-bindings instructions ("DON=E2=80=99T create nodes just for the sak=
e of=20
instantiating drivers"). The PHY core prohibits a child to register a phy=20
provider to its parent node. Why?

--nextPartTPGCLSSKQRu-pTqQQZ3W5g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpbMFYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi14UQALMgF2vE7gNXf/lwdBLJ
nrd5dP9Opm9ywvrBTVh/X7JslAvqmfG7p99UPAkVxM3fHwX3i6Ep1UwKoClaM3jR
lQWQhMJ9ceYI3ZtxDqV04raEtEYdD6iKTzqXVVLVySqFLFTy1M0SHAqN8I0hWY3X
98H0UePyNZEVEQmuUTb8uxsdAMFZ1BPEatKENp2fNrge+kF60oIqjTfDYImBYPIK
uZETnPzN7W0A6GvBjL4eMVYDRPyKSw3Yn58/hkkJCYuGGANNDy4D2mf5dvUbXhvu
sqdnkAe8ABEwd7pXowiebQUmNbB+tKPpvqTRmXlr9pElhmknV7SOGYUnQt/7PeQa
pIG+ksMvRKzFsmnoinzE04Gi4EqHf8XD8mDNEa5T6Nt/KvqpbpVufXu4t04zpJkN
NXnCC66jNUQxkMmrIjncjpBtD8yvUA0Wy3C3MYYHPP+V04YRZXOrY1cJia94+zeL
iqFQL6qHoeWjICo48CFvb++qor9eaQYHk7F4goql9o9XaroH+jXZsKkIV6hyFXZ3
rZfjVgEl1Y7QQdAMihLz8zCrgM1xWHCWdSWwNEmcq2A1eCKg7F1sfG9armUWwrjE
AR5fGoqdZ4x5KV/EgQOLNxsBEPnlUVA0Qz50jlNjlFRMlBFSNDJyHJft2qOXfeDd
1fgWAHDkZiT9th1kma3dY/PQ
=0ktk
-----END PGP SIGNATURE-----

--nextPartTPGCLSSKQRu-pTqQQZ3W5g--



