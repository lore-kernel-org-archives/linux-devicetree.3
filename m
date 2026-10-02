Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4A748EC7A
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935059; cv=none; b=uA8943gnWasQctRmrQSAyooZMOuQ98dLikBiRi4GCW6fFueRDy26AYY/Y9bw+RmVb1V9DHlhUQcDSaDTMajV+ab08OZGXOD/mXZW5xo9kSC+tXP8FjRBV0XBf5mgMNYqL08sDOA6OZ/0J7P1Y+scbMNasm+4OSnffAvlSXUbxSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935059; c=relaxed/simple;
	bh=bq0BI4EtUwIqKTsl+V2VNwPj8wCAyWYOSmiBSaUbGDg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oX320p+9nyDDaaI+evOUYlF0Pi6adFf2lungObJd9QBWNC5DgMT0mNHMWRw9nHZj2RhSyQU6LXifBrX3oNQE9H7unmJY5O4EDkbvMX1K45TRLbGRnng23A9JXyzUr2UeFCZP60so75pe8GviO18sQKaEqeRC0pP2M6/Q+sfM6Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOumYXfW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOumYXfW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80941F0089D;
	Fri,  2 Oct 2026 09:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790935058;
	bh=OPhykRUFfTkGXf3QI3hkUnST9bUMEbYLeSrSgVO4OUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hOumYXfWulDe8gW3gRm0xGuup7wSHE/EmbsQpbeJionIxDMGgS/O7JQT4HZxvX7W9
	 LoCaQwgglAuDGC2nEZYnh3dY7RzH+LXtiV8OdOawdCZ9fjBGJGjMlVLXLCO8KoWsLz
	 NDO7k+GoBkxbAZ9mER/VHtB+rg9SrLcGlO4Z5XyaJw5vWBPPoz4haOyeDnI2EddVUl
	 8XaXItQ36Ih9Hpe8dTGu2G0aPbttgJrcG2pZWEeSOx5QakVEmBU25uJEtKYJbSch4k
	 JhJsKcLJru/rv0l6w+Gga2plp6q7KwAO2VpdNFL8YKQijW46n1jRRkhbCHK8pn2l/Y
	 NYozGkQmI1HmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] ASoC: pcm179x: Add pcm1796 as compatible with
 pcm1792a
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9tYW4gU21yxb4=?= <roman@amarulasolutions.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261002-work-v1-4-f0e53bc7331f@amarulasolutions.com>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
 <20261002-work-v1-4-f0e53bc7331f@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:57:37 +0000
Message-Id: <20261002095737.C80941F0089D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] spi: missing pcm1796 spi_device_id breaks module autoloading
--

commit 8959b1de4bb8c22b7a8a0f59806c5a6f767c0c82
Author: Roman Smr=C5=BE <roman@amarulasolutions.com>

ASoC: pcm179x: Add pcm1796 as compatible with pcm1792a

The PCM1796 is fully compatible with the PCM1792A.

> diff --git a/sound/soc/codecs/pcm179x-spi.c b/sound/soc/codecs/pcm179x-sp=
i.c
> index 192fee90c9714..e5e4b942acfc5 100644
> --- a/sound/soc/codecs/pcm179x-spi.c
> +++ b/sound/soc/codecs/pcm179x-spi.c
> @@ -31,6 +31,7 @@ static int pcm179x_spi_probe(struct spi_device *spi)
> =20
>  static const struct of_device_id pcm179x_of_match[] __maybe_unused =3D {
>  	{ .compatible =3D "ti,pcm1792a", },
> +	{ .compatible =3D "ti,pcm1796" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, pcm179x_of_match);

[Severity: High]
Should pcm179x_spi_ids[] also include an entry for "pcm1796"?

Without a "pcm1796" entry in pcm179x_spi_ids[], SPI module autoloading fails
for DT-instantiated devices and legacy board-file matching fails.

The SPI core (__spi_register_driver()) explicitly enforces OF-to-SPI ID
parity and will emit a warning during driver registration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-work-v1-0-=
f0e53bc7331f@amarulasolutions.com?part=3D4
