Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9752DC767;
	Sun,  9 Aug 2026 10:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786272487; cv=none; b=Ma4obnJxB5hlmZDnbStqm4t/eluStiMMVysIwSaDVPMzoGOyh3yN2NC6v640dA7sf2qngNlus23W+lAJ7ZvhWONNPCVuWhORCFYM/SKggWOPaIPiFUl5WwYx+JKtn6riDtA19ulofrfIEVZnC+DPv0jXwuOEJ1lmNh/Cs7e1qN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786272487; c=relaxed/simple;
	bh=WeAMV/JXwxlsaJ+cTHouHiYVCt+kLJIJxaCNtxRnDvU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ah54sHbwqZe+NE7scoUgGDsv6u8wGiZhkqBeM3telRMj76fR4Gq8lZ3MSFcDNco7wPT6dsjbcPKcaF0s9Fvoa6nhnahgs1hiOsAmxAOE53MIfhGpR8kPqrgRnMWNx4hcdL70oS/FY54+0n43FxwAXvvnB7t120D9ndLqntT0QdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=N2NCMho/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="N2NCMho/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 596291A14C9;
	Sun,  9 Aug 2026 10:48:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 194A76033B;
	Sun,  9 Aug 2026 10:48:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 885E111C489E6;
	Sun,  9 Aug 2026 12:47:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786272477; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e7CIxp+l5MECOPxVN0jimE1PwbWGeYvkhnCVaEe9UeY=;
	b=N2NCMho/Ypy7Hzhs6KIxnF5v3QUvFQ+WwGreDJwRo0jdx9R6gIqXI3u75axucsgseiBlGs
	fwnnuytw1/WDUgjD/JqBTR0kpc/Xqsxl3yQKMM+33Ny+quohujFjF0L3/pP6T/VcA33RDH
	eePLun6Pk60UJDCOIDgMG3XQvixdF8Q71QBDn3x0iIlg+3GjkcNJZ77LWz2uDTyaVWwTVg
	Sxug6n3ljWx45TnNY4BXIr9mI/gxWJRlNt+F6OhBJLjrNOFtIXcPk0Jh18rkC2860jsKDT
	V19ZNSaUIW2F1HC15xBuh13X2pfsHdmd/MXAuPDX2IC2GmazATgv9qa7DUWlpQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dennis Gilmore <dennis@ausil.us>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2 0/3] ARM: dts: helios4: add regulator supplies
In-Reply-To: <20260709005005.1587852-1-rosenp@gmail.com>
References: <20260709005005.1587852-1-rosenp@gmail.com>
Date: Sun, 09 Aug 2026 12:47:55 +0200
Message-ID: <871pc7muxw.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Rosen Penev,

> This series adds missing vcc-supply properties to the EEPROM and GPIO
> expander on the Helios4, adds SATA regulator supplies.
>
> v2: remove thermal patch
>
> Rosen Penev (3):
>   ARM: dts: helios4: add vcc-supply to EEPROM
>   ARM: dts: helios4: add vcc-supply to GPIO expander
>   ARM: dts: helios4: add SATA regulator supplies
>

Applied on mvebu/dt

Thanks,

Gregory


>  arch/arm/boot/dts/marvell/armada-388-helios4.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
