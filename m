Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675143;
	b=z9jdGpGJoPBa06KI6bT+n9BuPSmv/hp+Nv3yjgXSEt0DzR40UUMSVxv8k/JHXw7kyxUq
	 oeQE4f/aN6qyJNUJx313fn1foBbTtVSFYFTVDXl/oqmUyyfZC724vY1v/zkJ7T3eBkvnj
	 CopF7LLUDRynL27I6fCgYjylp+vVmKOd8n9xWPVZkLuOdlb7MYJHYBoNBZg8Wv67zItD7
	 lV8k/2B7lgKcAboW4ymNQajRxVxb4L+8VrU7lxAHqZbkSEKf8UoMufar5q1bgdIcyP3TL
	 scF+LVjo9oTxQhmcGqQk2eVojy9iByGpJKjrazjcZh+HwUw3beW4JpGzTUNQ/Z5kOKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675143;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=b4ne9ThXtt69HR6jnoMjn534RR6i78BAndXqgjI1v44=;
	b=IKWCdwK4umptNyN6woqhu6ld5/ezN3fPgWNdDb10kdDzYN6oeHSO4cMUQIVImUmZzJj3
	 rcZh0GOSjHfX5PZiNM+6JRnMSZFBPnlmRjSJQ99WLQ42GVTkQZuc658pB1KViTqMQCRLq
	 DSCqv6GWwcGsw5RgKVHtGpP2GOm3fzyiwwnJ/o58NHbYg/G78hCxmLYPNND8W8cOFC33Q
	 0ci+tR7v8udKZY8rXA6HDJX4UGj4e0htpz6afgej+V+TeykKGk3CMnRuPBv9yI3EAknj9
	 esz2uN5/scV8dfReCIs/NeQAcXXrJffQ0RpHH2Nmw2vIzLkvUkEkPeZdMocrfi5uYiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=TErgIb5q;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321BD606A31E;
	Thu, 26 Nov 2026 06:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 321BD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=TErgIb5q
Received: from hawking.lan (ntp.lan [10.0.1.1])
	by www.nmnhosting.com (Postfix) with ESMTPSA id 87AC4403EF;
	Thu, 26 Nov 2026 17:38:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795675130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=b4ne9ThXtt69HR6jnoMjn534RR6i78BAndXqgjI1v44=;
	b=TErgIb5qsIr4OV+W5Ma7ioOeWnaMFhSpCd4MzCnP038vthBJlHi2praUjyZZDC1cWbu9aG
	TztwVABXzFWDIL1+33mia2y/spQxUZ8CYV+/b2vzzMw49EnyShHNTTpv9gOpzevC7U2djl
	fLKaYMOQCUFMly6QnlsVO7jhmIcTS+HuMK6MZlzOUU4bbGurEOE4jErv0dn2EEXhXr8sAx
	Afm/DOoGoUD5H9O96eIvAzbH6IY4LuDr7Men/2yUyQD1CgaTxABXH1PXaaE9Gzl8HUuFz2
	aBHtCkTCRg3n8VSI/AQhmwnsYjEUV4s3b8b0VJvbtYpw4lKerdgeLQj5876AWQ==
Message-ID: <45cc88379ea6cce9ca77b513c53b9e54677fac20.camel@d-silva.org>
Subject: Re: [PATCH 0/5] net: stmmac: dwmac-sun55i: Add Allwinner A733
 GMAC210 support
From: Alastair D'Silva <alastair@d-silva.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S . Miller"	 <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski	 <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai	
 <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland	 <samuel@sholland.org>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>,  Maxime Ripard <mripard@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 26 Nov 2026 17:38:50 +1100
In-Reply-To: <DN4XLH7YJ13T.3O62DYGNJ67FQ@pigmoral.tech>
References: <20261125130613.4191841-1-alastair@d-silva.org>
	 <DN4XLH7YJ13T.3O62DYGNJ67FQ@pigmoral.tech>
Autocrypt: addr=alastair@d-silva.org; prefer-encrypt=mutual;
 keydata=mQINBGactvoBEADBFM2HqfQUUM4j40ZQPyYzmnM8S6zrycO0ipDDPMs7nZMzyzGzOdqfS
 VB/tuYvZOOKVWzJuWJ5aT/YyHx54r3L+D5hTkEG0sXPVJky3yTS9sbHEMSLBHb8TVVuhPVPuieV4g
 Nkqg5POMTidk8xAw50WpV++tUlewXVSciehnuCQPXhXMP7FcCh4uO8LdN7E8m7ir1LafKTFfoWPah
 KVT8NGG9r+ucrFcN5F+VnHxTDaI68yRPkNdtUWmp22wIX1KwDCtKFrndYO4p5Hv2hlDKomsuIIHHn
 muQGRwuh0xpf0nVJNF8ETZHMzxQLfo3e/HvxBFOTkwY9w7CuuQFZchbhS0I3PfmGT0+jiNcdfqjDC
 fPPB5uhy+DkR6wO72vuwFYUrpU2mdliDSdKEtWBHulnXMJjpBOXetfIwhI8G2dTVg59lN5i9DvJZc
 7y1Sp+qfZQ4P9qpYZyQEKR4GNDOdnm6F2LW2cZkcyAU/Ii765zdDMTQMIzZNSxT/FcDd0K1voTNRl
 QHbQw+kmIMhzSv2JefcC9oNbE0XYzcBDNP5T3O/4itOQ90GCKQEPAbIPeBjlQif7kkyvo/H6yv4s9
 duuK7zbJD9AID/+KGLkpU3p68VDB/C2ZSb9rQz3p1CJNSfsX/CPk7sPqA7RKZ4a2B0hSJ2pJCncNZ
 KXtMlkkm/FmewARAQABtCdBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFpckBkLXNpbHZhLm9yZz6JAl
 EEEwEKADsWIQTQGemDFwqYyU/dBWv75AdnjVo60gUCZpy2+gIbAwULCQgHAgIiAgYVCgkICwIEFgI
 DAQIeBwIXgAAKCRD75AdnjVo60qHZEACJnLfpS71Hk8bX0CLCNJ5wgqdZD3pBHEdbv9Ux9kRlZp4a
 ZFwlg9ltwBjl2dZP3PLtD9xQdsdYKVippKd5a7ZZC2y81oDaHjeC9LnPYn8+ce3mGE/+gRyoNfToY
 N06DeUNJKSlZ9t11UIqZCgfp12u16/Yrigy8C4ihEeHXlLhNX6JkeJR5gsHXJnC7vSuMZY+Qz2R72
 ZidWg+cd2WDMGop5sbTvc+55q94A7vTMlWzaix5HdbEUA3sd2U0dMBju5QodRGGhDQMcCu64TydRD
 MtMzzOk9ThJ036ze3HASWGOppyQmaw58k+XNzbHlr9Sc1LsFUNF7zpWXac2rzlywbyRAdFIT/TC76
 hy9zOkwIo2nwA/tdIwLx1j0UZPpAMQmcDUvJqZh6sE+fv6HN0yMPr+sSYJmriMt8Z6leCEHQXOHVI
 SI5z5FvV3coMmHYRq6aXpfs/8SLiYgkV3B0HE/E18Y3j1OkeLYoqIH1VfzQZeCSL/S77NYvk60/MV
 1HFSyqLdUR3uWZI4uZzoEcMoB0GX33uCTp2Ntc00+wSntwekCUQLCMLUb7dZrbpVuobHoWWtkiD2I
 uE5kAiaVwwwzM0BUwiM6VzVoKbeECz93rdsNtwoDqM0NtzoISC46H/BKVQ9mRNXDO4ThEBpJ4H2Tn
 mPNRYYcR0u2mNy1EJII04w==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


On Thu, 2026-11-26 at 14:33 +0800, Junhui Liu wrote:
> Hi Alastair,
>=20
> On Wed Nov 25, 2026 at 9:06 PM CST, Alastair D'Silva wrote:
> > This series enables Gigabit Ethernet (GMAC0) on the Allwinner A733 SoC
> > and the Xunlong Orange Pi 4 Pro board.
> >=20
> > The goal is working 1000BASE-T RGMII Ethernet with mainline drivers and
> > bindings. Tested on the Orange Pi 4 Pro with a YT8531 PHY (DHCP, ping,
> > and iperf3 at 1Gbps/Full).
>=20
<snip>
> There is already a series [1] posted adding A733 GMAC210 support.
> Did you check that?
>=20
> I think it would be better to add Ethernet support for Orange Pi 4 Pro
> based on that series.
>=20
> [1] https://lore.kernel.org/all/20260923-allwinner-a733-gmac-support-v3-0=
-
> 15735155a789@baylibre.com/

Ah, I completely missed that! I'll test & review it.

Cheers,

--=20
Alastair D'Silva
