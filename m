Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325AF390601
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778593448; cv=pass; b=QbQ3xEXDtrNRDZWd01XcM5c0arpssKvtJ4UH31+Uzda8Aws7ShIx0pBsYX47PG4uS+wPlgrORKhFwUaALLwTRUqQvx23H7Scq1PhPuGVYSFd9f6OO9lCMIKuvqGiVghAN08TpBm6lKZSdPVeJKk3kzJh5PMCBuOeD+MG+yVWJA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778593448; c=relaxed/simple;
	bh=UIBbDdY/6Vl81uBfM5dEV50W8t5LzE4VYm82dl6aad0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/FDEfb7MeQwhi3zu0Vwxg6A1WWSLfDwtN06qQ//MPqYNSTyBnbjAhjdPhT8e37W2+5m+dG8KClpu+Y6aOaZmN1cL/4bEnKVz14PWOu5mzdfASbDCQ9xIdvjs6T7T+bCRHzMOy3F90PUtFepmYwlaxBQYWHAAsjFUSrnabjdrr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c82K61M6; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c82K61M6"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-394421230afso4038051fa.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778593445; cv=none;
        d=google.com; s=arc-20240605;
        b=dxxL+hVBTmPkVud//yIVONH4aWoqtxlYmCGpYBWKMNlgQC+g5TZL2G0hnPcWeM+yll
         PJM8wlIXATWf0sn/a7MhXYH/Gj++x4kVBwmpiuYYkubIyNXC79ytZKAWsLHoGsq9y3/P
         DeiFD1JCVh5xk1eH08QeRNJQA/Htg3U4Y0QrCP9/64dvLrG2JPTWljPIwx1+YxqC+o1R
         QpDSJ8+WHlIRTVjxenL+GCDbArP2VPJsBs228Sa3K6+/zaG/wje/n447QfET4rbDO/Ki
         P3EV7u3sJOTmS72D7TCZRbGEpAOnMwT1v8t6nU2OdLt340ueGQCLAgmaCmhiVK1w0PzQ
         yogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UIBbDdY/6Vl81uBfM5dEV50W8t5LzE4VYm82dl6aad0=;
        fh=x7piqJQjGJaG9J28ZQW2vGQFBWlCdcno1LspV0O7FQU=;
        b=KTpRvZ0BIDWJmQuDpuTevCb4OOk9//UXzVheZd9WgIcRIEWfQg8air/0B/LpLs9oE/
         hQOkG8tpQPt+6C7UrzxmT2JsCPGCGWsgBZ7BAmFCUu/fkf+rqgZBmqVovCYJo7AJYO5m
         sBdyAvo37061tlE+PBMec8exmBvyDPl9vK6JGAhVwFrYi2ZsEnPt9e5SSn8QOoboLshe
         cAAxEvX8DAhFmXe42ITeTWovo4p43YFOgUmeNB6HcyLHuyr7cPfkiBYHUHjTQiMCRnXp
         fG0g43h7wcQx9284kpNgHOjKEL0mqvuY+RIGVxM1H9s1uq8fUdwS9d/UlrrHD5CdVMeN
         ipag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778593445; x=1779198245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIBbDdY/6Vl81uBfM5dEV50W8t5LzE4VYm82dl6aad0=;
        b=c82K61M6hzRoZ6F05wTTTpoXfEPmMUrDS56hhUrA3bOxzxZOA1GmxE6bXNruquiEIq
         XAEIS/UphqVjEzW6utPMe2Yj9r4kWeuGxAt2YcI/IaLaKtBmVEfDOXLup0xtrILXNdWA
         8j2W4aQpgKySgoAixImMYEIeW1hBpHrYUxC9yXvpfbRvOGv5JJ0lSoOX45aCIDZqZp/l
         U73epMdtC6ePsTemG2YQmcjtzpyVHzGY7HdEGjtF5YvW8z2o8uPt0MsIpxhdhSufAoaI
         3HQJaczDLdjZUGOI/qLcs5qStyWzcDReRfuuXK+OpG89f5u/nQlVOunRZOhOx01g3dka
         Tkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778593445; x=1779198245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UIBbDdY/6Vl81uBfM5dEV50W8t5LzE4VYm82dl6aad0=;
        b=BDAEqVIrUm5upeL9xb31P+v8zfxCpP/6ZxNOAoxr4UAF4N9uWAGWahNtyBv7Jz/K0R
         MYNQRODWtdqRYeSc0TVNRqn90w5fMfgQ+1gl8EWoMpN26BHqF74jm9NUXlcWN/Qp0Y1i
         VVbvKQ/4TyQhEI1TEkR7DDR1upG3xQcD1orqNTTfPLPl9VQCbnssPQG+RhGtUmw8vSfO
         LHaYr5n+AfFdJuWtCUX06sd6ytLQnwID58ZR4m2cS1HNXd1ZsCKRGH9Ul5QCbBiZrXSP
         8fg9YqTfMuSn/USdGX0O51ct4lrZX07SdcpZzgHFAJBQtiYAbyGlJUu0/VJysnRqAEnp
         YWhA==
X-Forwarded-Encrypted: i=1; AFNElJ8iTnoXxVv3ZnugiJskG9LpAndfaeFKmjfwrzD3/ifCFaHHoCiAHuuLLkshLmEupiHNP5ug9+paWJjc@vger.kernel.org
X-Gm-Message-State: AOJu0YxiMJARpwsSnmutjXt8gg+bH6v3gvXA/bo1fW/oHatOmn2AgbD+
	olDyA6+mC+eyU9OD3ceyk8LurbVpFs3X/Pl9ziAvAbGaZv7v6eXb8Dy3uiO06lzbkKJ87Bv7iFC
	VSm6MuXgapLXOUpjsSpLgzLl4KK4/MxGupY0O
X-Gm-Gg: Acq92OGxSmJLVBdHvrgna6nuy8ZhF5H5gX+L7lQGPt04Ne/8gOlOGdlmSGmWcAt5w5D
	V/ImmT8HZ+P5RUMRaz29h2A0VGbC4QVy0y9gBnaKUVKhM4QiUzjTBhYG+m8an/vJEQwSuQtZDDY
	lFp9IhR2pXCt2AT6E9pH3YsxglTU3S9O1VSn9qwt8QwRKH8s6BdIbd1h9BRTM77qPCxCbLRo+I7
	fxAX/dhmtTkvg43VZ8mTdsgxhtPq3voTZuDkNL4TPOjYb7dWBUpf+klyJIzywwVUJhfSHDae2Fz
	sJcARfaF2uZP8lKzb+/eLa31PmfVXLsoqae+cl5AREiek+s3mxQxj2TiN9k/DhVvSBMD66eg
X-Received: by 2002:a2e:be10:0:b0:393:ca4d:2313 with SMTP id
 38308e7fff4ca-39408002f04mr46273671fa.5.1778593445018; Tue, 12 May 2026
 06:44:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
 <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com>
 <f04fadf2-8d73-435b-b713-9d07e48e80ae@lunn.ch> <CAOMZO5Dm8FgzOfyp=6ZuDc=528FiqCPVYF07PjMGVP0Paye6vg@mail.gmail.com>
In-Reply-To: <CAOMZO5Dm8FgzOfyp=6ZuDc=528FiqCPVYF07PjMGVP0Paye6vg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 12 May 2026 10:43:53 -0300
X-Gm-Features: AVHnY4LZUMkE_oZU8jhYuGqiMMJ-pFMt78stSfr4BKQ4Jreq-iTmwB4N5o8icjY
Message-ID: <CAOMZO5CscUL=uj0dqmUjoxXNvJHfH4hsno9-jLLrLx=09na5kQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: imx6qdl-sabrelite: add mdio phy address 0
To: Andrew Lunn <andrew@lunn.ch>, Gary Bisson <bisson.gary@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 9:23=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:

> On this board, U-Boot checks for the Ethernet PHY at addresses 4, 5, 6, a=
nd 7:
>
> https://github.com/u-boot/u-boot/blob/master/board/boundary/nitrogen6x/ni=
trogen6x.c#L287-L296
>
> In this case, shouldn't U-Boot fix up the Ethernet PHY address accordingl=
y?
>
> Something like mx6cuboxi does:
>
> https://github.com/u-boot/u-boot/blob/master/board/solidrun/mx6cuboxi/mx6=
cuboxi.c#L414-L446

And from the devicetree side, imx6qdl-sr-som lists the possible
Ethernet PHY addresses it can support:

https://github.com/gregkh/linux/blob/master/arch/arm/boot/dts/nxp/imx/imx6q=
dl-sr-som.dtsi#L72-L95
