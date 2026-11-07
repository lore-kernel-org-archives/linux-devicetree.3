Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794061627;
	b=4wqN76jwtMEK0UdcAviZt6Qs2E2VY9Qxvy1zF1dWQDTV0oxhFYaoIWDq0POUdwGBlv7o
	 ADmRHslizZmrUUO3KDZA8B/gxFfOQ3YgTFNj0A6Z0ohH2jR2XDU6IbXzSJfkNBsVjZ2vq
	 pa1tPCVIBYIa9Vv+HZsbVWd2OyKJQ6R0z4GCHdYdQ8elOso/il/K9Nj8XEFUi26xipLkp
	 LVZnES4B0jrCJwKRsGQKC7+j/MIhOu9vVXx3rOSRVZdhSrxK+spIhpEDPuLwzfhU7KiUh
	 Sfg3Xm/AydgzQ/yDgRU0ao1lHawdsE63O0FRSalpl6wVQ6oLEu1ObS5uqY3UVtco91w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794061627;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=g966SAJBPKMN469l/0SQTa9Ear5vOZxRTo3iz58T7Fw=;
	b=JerDjIC6BBMtdT3ySLelHGYSqd1SUrbPmwodOnh7X/yMFtIC7XiW4aSteAa33QQI0uSs
	 Yqd/2T89NNYmXNhBuWtEn3IDupiiwFoU1rwi+Ip+XhQlRbwi7byj3kZhKmQaANApEzpFI
	 jeE4Kdohvdjgk1dtbMktrQxNkUXVpJvB1vuWshE2lIlNOOzOZjK6EnPscV0dl4pirW+98
	 Rg0jJAgk4HM0SzND+Ss0VXSOF1N+ivhfqZ5wvUcKiUG7/TVJyI5F89vpUtJZpLlBEAQ1W
	 uSsmkSE0qzumt/0fk4QaNM+gFG+Uzfm9mSlY4xbWF+dwN+GM9woMQ8ATBQpDNGNj3gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=axNhXy4q;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646C0606A332
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 14:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 646C0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=axNhXy4q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=g966
	SAJBPKMN469l/0SQTa9Ear5vOZxRTo3iz58T7Fw=; b=axNhXy4qgVj4GKKTL6co
	hxWv2oY7Q0EKHhOlArEYibtS03p8c8SXRTitM4/qgBXN5ogLgtKFMYMha3IC2lgO
	ccfwA+ioQm1XCzuEBpzP9kaYHx2rQLy+qOtzYUbUwQrdCuwKHpjIe1J3Od20fDwN
	6nOoS89IeSdM+zOL0bZ5OhtYzEDbr7gtyYoDW0EVTXFUGBqInDW0Zf1jPHln5mCi
	Q3U7ojVL6H6gbYSPs0x6s57GzZb5wGPQDO92csj3Z8BrMBHR/B2MtHAGQqhT5Kzp
	yHVgJTUsDb5q15Gfk+ys6Smq92ZMj8jndAz6eFX2QxuQYjqteY8qv0ICSA3Aepty
	/g==
Received: (qmail 2532307 invoked from network); 7 Nov 2026 15:27:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Nov 2026 15:27:04 +0100
X-UD-Smtp-Session: l3s3148p1@9c3ChbBfSvIFFu4l
Date: Sat, 7 Nov 2026 16:27:03 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: qcom-cci: Document SM8350
 compatible
Message-ID: <au81MnlqSXPnrttt@shikoro>
References: <20261104230529.3040285-1-vz@kernel.org>
 <20261104230529.3040285-2-vz@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Fj6HSmBKQx57QWtJ"
Content-Disposition: inline
In-Reply-To: <20261104230529.3040285-2-vz@kernel.org>

--Fj6HSmBKQx57QWtJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2026 at 01:05:27AM +0200, Vladimir Zapolskiy wrote:
> Add Qualcomm SM8350 SoC compatible to the CCI device tree bindings,
> SM8350 CCI is compatible with CCI v2 found on MSM8996.
>=20
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Probably qcom tree here as well...

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--Fj6HSmBKQx57QWtJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmrvNTIACgkQFA3kzBSg
KbaUAg//YgAO/T128Lm3n6VmRqJT3XChIwGo8G/v8nsBFxTxRcSrll5XQS2+yRz1
x6KjdLRoc6bQ6WErbQf0Rp7/io7zA2jN0mkXH1q9rOQNQSYVXtePfyDwh8MBFfQT
ypCcQSvC4YESPKqR6xkhsmMrjUgc1YWNzeJ1nnG0FDwqMXFzP549g2UL2edTUlJc
wo7m/9M1/Y20xdnh/a6ud3zRTBTXBITfcyjZIHeIV04jNzfJGxGQRgP3n+35a1w9
nGkwN+0GC7qGHaBaVhWIrROzlrK48Yp5xVLJMzvnKLTHN2VPBhpyM4KeEezAmo95
173Kaif0YArgwxw26W92EKJI83LbZ9XwzTQLzSwMUQl2nrm0ofZgb3lgaQ4LmFKQ
vquclSgXkB6kHiXyA1cP/7emTC0J/uT5Hyw0x75h8deBx25uUNQlxEBomC7ZGAyo
GSzs+np9+gMeUpK97aIh66biHskiMxyH7voFNHtz2idDwlPkVMLVyz69pmiAmTKa
s/r9c4jxLzrieBi8IkU/1mK8cZmc+UtnLRJvARjIgm5F/b5phWBO1TXtNmYuZgMy
HTlUMs4RgP3DIvRXYWjECEfXb7e1qYZ46XrGSl53eJiPtk2Qr/+7pv+r/thzHaCU
CYC5bScxWolnIHXGjRV5ZqJepxFnoidzXf/fTIngo9q1VGlkwZk=
=d9VW
-----END PGP SIGNATURE-----

--Fj6HSmBKQx57QWtJ--
