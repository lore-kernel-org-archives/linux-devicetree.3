Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A18834388A;
	Fri,  5 Jun 2026 12:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662468; cv=pass; b=V3duXycbVPs+Sqb0hg4ua3/1rlwkm6QL2Vol/Mdmhlh4Yqars1MA8p/ohJu6tGjFNUGNvSnovs0NHG6wY9+z8Hjm2Xyj10ZocMgUBErfK/TbLLhXeeszUqDrEhi7QszWbkmD8q1mWnurz6p2e/wy4KPlhAjACV292ZHwFtq1Kv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662468; c=relaxed/simple;
	bh=XNHtznNb9YuK+Ys5xRmERxuX6qwUALEMw5FejOZwa8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KRlUGgMk43hC3sr/Kydv/J7TPY9WyQvmzjOdqq1jNjdqKielIB0Ft5To0KDDf4VWH6EWPF+2tVyzL7n0UFyrE6eEHT2+5ItOHTuREVoDq4CBKQVN2qjJQ+LXIR1HkKaCPxseIM5xwEBQDfx+sDO6W+/FydFHtA9NZlv6l+A8tHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=Nf4n3md+; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=hWWMhmjp; arc=pass smtp.client-ip=185.56.87.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="Nf4n3md+";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="hWWMhmjp"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-3q75.prod.antispam.mailspamprotection.com; s=arckey; t=1780662464;
	 b=NitIPqFgbfXb0o259pKfC5OPthZauRUak4CTjFxESuKt9kfL0fGWzy9OnGtwliyGOTcULcvGR8
	  K4mLwt0gafn6hPyXgk1LW/hD2//IVGRopnmHQeswKc5ebsZMw8j91wtJcDmnGOJSI81P3eET4X
	  8y4vj9MJWax3aR6XdeVudqF7JifKXbCkEwcXoHZ348aBcYLUGeqvVOySt0PMLD7RVG8p02jsLs
	  7rKOsj400DsnWp0HUJOXaEicLGDvFOD59GJRkktf3LZzV+ZsS7ndt3zjOqoRzSBLFWFkm3kKZk
	  49VOJ+TbLYejnBQPHedOdDOh9+NmiSSIfzAY2uqlqqU3ug==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-3q75.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-3q75.prod.antispam.mailspamprotection.com; s=arckey; t=1780662464;
	bh=XNHtznNb9YuK+Ys5xRmERxuX6qwUALEMw5FejOZwa8M=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature:DKIM-Signature;
	b=BLteGgyHE1u/0GB5kGhAiBc5SH2+pVZaACceYhkqOwkHCZ04LjJaGkM2561paxAKv3CbuwCtlu
	  fOAAHV0gLpSeBQkAPPgzxypRb0SEiOj/kIf0T+R2+vsXfmr9t+ixZ6o1AmFSjIOVfIQBdd3d9b
	  Dm9egMvU6YgeoLFT4FDJ4jNvbFDt9ak504QkVRJk2fmQ9Xe1koavIvLullj6D4JjH/HN8XYZVT
	  hNrhpTqVH/GaP4IetLIAdbLqrGzldXP20mc+9dhyLF+GDYrOrYwAIyxryl2nYZVyK1cYlwodcj
	  5QKGUR8LQxz6kCYnQrAZ7QjgLk6XunZuM+A22LgZ1ourDw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Reply-To:List-Unsubscribe;
	bh=F927iQO2yHy5r4ReVfNbFmhFmycUVmgAeB7fBG6rev8=; b=Nf4n3md+bEvNHFEDbwvwmsNN5j
	M64nYlSNHEnT7wdAlIRnuG3ZPCkRi6BdNPRb+UAHTd92xdDfpPZGRSFB8jjNnaSfEG11kvnF5jzW7
	Hi2uIy1yKRewXnfOvlUQI/WjZmG/UL7Pnsl1Kf4t7z9GuhGFMcceSgJ9SJJ82iShvWRM=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-3q75.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <francesco@valla.it>)
	id 1wVTeG-00000009oW7-1Ynh;
	Fri, 05 Jun 2026 12:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=F927iQO2yHy5r4ReVfNbFmhFmycUVmgAeB7fBG6rev8=; b=hWWMhmjpCi3qq3Fr1kFkjljgGg
	Vj11SCwNaX7NdXLQ3qtQU0cIeMp5zUEHjseLafSbXct8roL3XC0mULS233X6ryPzSD3EvxZNa3D6Z
	4wc4QhGzrtSUV1P56thuHX00CZKOx2WPSbw7LmpqnTIcF/4mX+jvQKGyYGzMmdtsRT5o=;
Received: from [95.248.69.182] (port=62513 helo=bywater.localnet)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.3)
	(envelope-from <francesco@valla.it>)
	id 1wVSqb-00000000Bzf-1M8X;
	Fri, 05 Jun 2026 11:36:21 +0000
From: Francesco Valla <francesco@valla.it>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 steven.yang@nxp.com
Subject: Re: [PATCH] arm64: dts: imx93-11x11-frdm: enable additional devices
Date: Fri, 05 Jun 2026 13:36:20 +0200
Message-ID: <_j4Ik3AsS5yfKb4Y7cSB1w@valla.it>
In-Reply-To: <aiKP3EgdrCbqtUH0@lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com>
References:
 <20260115-imx93_devices-v1-1-b2c840cafa2e@valla.it>
 <aiKP3EgdrCbqtUH0@lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 77b55c899ef279f5221f9be05f414dcb
X-AntiAbuse: ID - 77b55c899ef279f5221f9be05f414dcb
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1wVTeG-00000009oW7-1Ynh-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-3q75.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Joseph,

On venerd=C3=AC 5 giugno 2026 10:59:08 Ora legale dell=E2=80=99Europa centr=
ale Joseph Guo=20
wrote:
> On Thu, Jan 15, 2026 at 06:11:34PM +0100, Francesco Valla wrote:
> > Enable additional devices on the i.MX93 FRDM board:
> >   - CAN port and associated transceiver
> >   - Bluetooth portion of the IW612 chipset
> >   - WiFi SDIO port
> >   - user buttons
> >=20
> > The WiFi portion of the on-board IW612 chipset is still not supported
> > upstream, but since SDIO is a discoverable bus it will be probed once it
> > is.
> >=20
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
[...]

>=20
> Hi Francesco,
>=20
> Do you ever tried bluetooth feature? The bluetooth failed to scan with
> 'device-wakeup-gpios' property.
>=20
> Regards,
> Joseph
>

Yes, Bluetooth was tested using bluetoothctl, I just briefly re-tested it
with latest master branch (7.1.0-rc6).

Can you clarify what you mean with "The bluetooth failed to scan
with 'device-wakeup-gpios' property."?

Thank you

Regards,

=46rancesco


