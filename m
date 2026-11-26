Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795732833;
	b=dbcHeHMPgi8etB6Vg193DMAzWER5hFtPykV9XZSn/50Yf5/3SpEYRZeXz9thmhFj20po
	 Ph63ZbknTSLymNxAzWSIbt+pnZWx7M441oeUOecIrp+NLCj0HPzIiNRrW66ZBvr04VQGP
	 9hGu6TtbI2b/HE6cvK4v4dt7V4SAiZnYHQhUqumTYfAc6JHa0nULt1hiJ0cT3pS71w8vh
	 S+ZWymETJLlqQno+GiAMNXXy4Z8aZBMAKf9+E9V+m5QfmPIfwitupJZEy8NKCZXvvOrnd
	 zNIoYEXRO6AMlngiy3FqkM2JKaQz3/hQ1SmIUy02FYMtExLpKzxyDeT5AN0tg2WICPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732833;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5/KydILYgp1MqJro7NmxMhzqTKDk500tIwuyQxLYRaw=;
	b=dnPDEmPxtEhKhcvLZ5a+v+ByEudFjIfJoLveKTefwSAM/zil6VFlnep9xPE+8EiSGOK0
	 fOjfX+RkW6erdiWO4lULPl6qzLfUKgSn5l8OXTE+VbGxBH8e/bcS5GGbKEgfy8Z1Jt80C
	 58KyRfwKP8uyx7Vgu0BqG75Xq+UfMwlfYl0fMAOaFJZwIJKUaS/CUEEEP9LqD7/zC5uUO
	 ParshY5bw6d4SsCSskBgz/DFq1XLn0wMdESW209BgL+/3fx9PsNnFa1ciCXEwC6xrKegJ
	 CpYZGexFcTNL5HX6aJtGs3dv0xhm2jaRbQXkhsSUNKy0tO/TO68mI+xjZy5E1/7kSww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ZQzn9QkR;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9F6606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 22:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C9F6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ZQzn9QkR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5/Ky
	dILYgp1MqJro7NmxMhzqTKDk500tIwuyQxLYRaw=; b=ZQzn9QkRXYYLVXowFjeF
	9/KwQCXjfY7n1nL3GRsUbl6bPgLD0vY97rUitxizM3BkCevuOeT7/3L+1Jw9lXFX
	Xb7bzITN5dCF6T/wHcopj3IjWtxrEav3YvfNbfabmJNr0mclhlzQd9wa7u++A6CQ
	/P/uPO75jjRAajIdM1fZ7WWsFXVYjRCNiKrpdnc6tIaITSLCgEu20N/NtXfCmW7W
	QE3XmECpWUkHDR/mApGR/C2esic6WTNqCU7JRoSLMj5BKc9ufO16GiLFX96aJl/5
	6buZZQXBxCTN5bTeqc9OUZIzsstzhvsU6eW0MVEMUU7VMFxE4KjOPrbtNBLZltPl
	Vg==
Received: (qmail 1773729 invoked from network); 26 Nov 2026 23:40:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Nov 2026 23:40:29 +0100
X-UD-Smtp-Session: l3s3148p1@zClqoTVhHKUujnv5
Date: Thu, 26 Nov 2026 23:40:28 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <Shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 17/17] arm64: dts: renesas: r8a779h0: Describe the
 PCIe AER interrupt
Message-ID: <awi1WNQZ8jEGLQaS@shikoro>
References: <20261020031049.969895-1-den@valinux.co.jp>
 <20261020031049.969895-18-den@valinux.co.jp>
 <CAMuHMdWk9pZdJ+eh0dNHrZSMVDe84_rsvmrD=pC1Fjy9wEyp1Q@mail.gmail.com>
 <awhXFPlyc3vnmjtC@z790sl>
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
	protocol="application/pgp-signature"; boundary="+Y/kQlCkEpvPUpzt"
Content-Disposition: inline
In-Reply-To: <awhXFPlyc3vnmjtC@z790sl>

--+Y/kQlCkEpvPUpzt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Koichiro Den-san,

> Mani, mind if I ask whether the series still in your review queue (it looks so
> on patchwork [1]), or whether there's no hope of it landing for some reason?

You added more people to CC and got no response. Maybe it is time to
send out v6 now? Maybe this will get attention then... sometimes it is
easier to talk over code.

Happy hacking,

   Wolfram


--+Y/kQlCkEpvPUpzt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsItVgACgkQFA3kzBSg
KbZIMhAAk+dqUXk+MuLSLKoKuO+Biu//82UdOdypJYIsTOH8C2ycdMkd3QyKQZlu
Mfz0AsrrExl6f1eoDVrtgSl4PbDPwC+FGkomdl5+xjLhHydSj4vVYMyb2aRA+LR0
FsCQVkNdQxionGgQ7sKtdryFannXETGGywUvtL3Q0V/sCpwh7sUl21LExUjS0Ie6
YfMZgElbXsn2dEn23FHE7PveumSWapjOty/qFrwZJStaaDKaO1grsrOQkeuYJcnJ
YAEHfF2//Oh/V9LK5y2AZT05q7QqFskU3FtXBJKop3j7gPZ1oovfN3Lm+k9CpLUc
b8KjFDMgo6obv1G2m6Hlbd8IjnyDrPJPEO/ameJCSAc3aQsZKZIVUEztEXWcBkbp
lxnfj3Vl8XZ/+yef6huoegXbbpABGTjQ1ocbAd8/71HW5295mmHN8Bto3fSYW7dJ
Yi7W5UGSpfEX6cvPxVogZk4HplZy42ThA8lYPc7H+Y/v4XgN26O/zz1Epnvt1jqP
pg8wK12mdXpu/N1QABqieSOgQAMUdw6kdbWB428a8Z5c4iRw4RlfZ6mPkx/tc8oy
KG8A1ogmewmI9hMFaXuPTu/tMtdqFKaDEO7aoEyztTjgFSni4TEEy5Cwp+DSKu2z
s1+kNTcY/uSNPe6iFtXgfq3WO945rGDoz/OzotdgNKI/c3n538Q=
=pJea
-----END PGP SIGNATURE-----

--+Y/kQlCkEpvPUpzt--
