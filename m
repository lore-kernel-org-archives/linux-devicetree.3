Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBFE36F43F
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776959530; cv=none; b=ksnad7oiDJ6XtSCqdLFGwJHkgw9g6jW+wD9cidFMafggLmgy4H+wvpJTbwR4EK3l+yZmhubyMuC9Kr1dUCKQEU3IN22XTHmPZoii9WwOsnlbH4IYo1ZMjhsLQGm0wNLFhQ5O8A37Gjn4SLzfhgffeaYCQmLz2RswD3DY4mNSgJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776959530; c=relaxed/simple;
	bh=nbIC7OtgfY565xf3RSYO88GoJUbI204rE1bt9wishCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ofk7S7p+mgfyTTy1Slurgj+ru1e2guL7wTy8WyvooRhI15JlTDbOOEveKlDsPaa/nk4jzia12j2YWslkVwapxrsEcpDwcztxfRX+8Go+QiEGqNOItgr19ObUxM+vxnh7i7gp/Bn1dMLlyZLkxqLw/4WDskn4VBopMzv9Zl/ifGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MQdTx4a1; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MQdTx4a1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2F1A9C5EF13;
	Thu, 23 Apr 2026 15:52:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8CBE600DD;
	Thu, 23 Apr 2026 15:52:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3DD9F10720579;
	Thu, 23 Apr 2026 17:51:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776959522; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nbIC7OtgfY565xf3RSYO88GoJUbI204rE1bt9wishCo=;
	b=MQdTx4a1JQCBHZR9LSRv2S79DyJQG+J6wKo22OQCkTvP+DLXey7PrxdH89BgdN0y3ADFpZ
	gz4ms0zomvNgYyX5GOZAx0bUlljV3bsOvk7XosCWRPVEhOpoDJNhGWQuSDduF3FmJgsiI2
	nxeFkdjsaEYuo35BL6bslTM5tZZlIZE/lqvac2FphnQc8ox/m9gciAqAkJqfixC3ouRU+V
	A/5fP7qoe/Bsf4BmjxEYLMl+5lYDDOa+oeZ7o3/sLoSpqWwNxaxIFHGXHXpbDLOhPFDUvs
	r1yY0sIMXIjAT/Wumef1D7FHAQWUuVpuENnMy8rlMynyCdslC4lSaMOaa6K1yw==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 p.zabel@pengutronix.de, huangyifeng@eswincomputing.com,
 dongxuyang@eswincomputing.com, bmasney@redhat.com,
 dongxuyang@eswincomputing.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v3 2/3] clk: eswin: Add eic7700 HSP clock driver
Date: Thu, 23 Apr 2026 17:51:58 +0200
Message-ID: <HbNhp5--QBi-9nHQ7E_UnA@bootlin.com>
In-Reply-To: <20260423091114.2326-1-dongxuyang@eswincomputing.com>
References:
 <20260423090904.2108-1-dongxuyang@eswincomputing.com>
 <20260423091114.2326-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Thursday, 23 April 2026 at 11:11:14 CEST, dongxuyang@eswincomputing.com =
wrote:
> rom: Xuyang Dong <dongxuyang@eswincomputing.com>
>=20
> Add driver for the ESWIN EIC7700 high-speed peripherals system
> clock controller and register an auxiliary device for system
> reset controller which is named as "hsp-reset".
>=20
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

Reviewed-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



