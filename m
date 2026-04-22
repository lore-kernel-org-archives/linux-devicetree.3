Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB50382376
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 08:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776845301; cv=none; b=ff+d7US/o5r19TvI5jKekpUwIVioWLTc4qPts0rMxO6kyskNzQzbwWK+YhkbQkgHK5zSr/V2UUMVlq0C61FU9O2gTvSX1w8Az7BIu/pP4DBFRuM3/CtMCn5oKDYNs4g8xcsLDKRdOo70myNbyljAzG9ZEfoLDIXlJF4BkDzew6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776845301; c=relaxed/simple;
	bh=f4NTEKOb0TYPzwx83555aZf8ormuUaXr6ZqLdxM4fGQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=utrsVpzT6uoxi9wFRNi1+iJQVlwvt/LCkvyFE7u2BurwsijRtYkzTlnqwrMJjshHJMskW00DhaDDQho0hoqRwNj4iAJiophYucYTBF/AtfiTzli6MNIaO71PUnIn6/iaoaNHZ94oC6gl70ZBdgPD4mG/R/p+AO1UrmBRc+SrgJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M/Ss/FQB; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M/Ss/FQB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 145144E42AAD;
	Wed, 22 Apr 2026 08:08:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD026600DD;
	Wed, 22 Apr 2026 08:08:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50A3210460A3E;
	Wed, 22 Apr 2026 10:08:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776845296; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ok/jDao3QWG80+zWCp1k65124isQJzzQbc2D1YJo5sA=;
	b=M/Ss/FQBq/QU57FoaB+yrUWa8nP1Z4ZxnvQO2psZ7Wbhqswl57GHd27JnXUpvuyqAMzUMi
	9NuBBXAv51qpepXszjoSlQbbOWwzCGzvy0pos0FO2fCVICOMjktJHE1zJQwCrxD7z8ZTUb
	FECM0gD/gh285SVjsm9QygsHvBgj+MPfFIBxsx58hOqYbsz6BCksKqtoo4NcweibazK/r8
	RovbaHM1aIY/dZREHsuzsCCG9NNykN7WNEJummlJB3av+Hk6CVvy7ghFooWYNPFyd3jdja
	QgQF5dBZmxeiNyUzBP4nkJ63w1lrD0KJMkPa7vv3d0hTLASfvdZ9+9OauI0vVg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v9 2/3] mtd: spi-nand: Add support for randomizer
In-Reply-To: <20260422070203.698716-3-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Wed, 22 Apr 2026 15:02:02 +0800")
References: <20260422070203.698716-1-linchengming884@gmail.com>
	<20260422070203.698716-3-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Apr 2026 10:08:10 +0200
Message-ID: <87a4uv5set.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Cheng Ming,

> +static int spinand_randomizer_init(struct spinand_device *spinand)
> +{
> +	struct device_node *np =3D spinand->spimem->spi->dev.of_node;
> +	u32 rand_val;
> +	int ret;
> +
> +	if (!spinand->set_randomizer)
> +		return 0;
> +
> +	ret =3D of_property_read_u32(np, "nand-randomizer", &rand_val);
> +	if (ret)
> +		return 0;
> +
> +	return spinand->set_randomizer(spinand, rand_val =3D=3D 1);

You do not need the "=3D=3D 1" part. rand_val is cast into a boolean, so any
non zero value will be taken understood as an "enable" and zero will be
treated as "disable", which is fine.

The rest looks fine.

Thanks,
Miqu=C3=A8l
