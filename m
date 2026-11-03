Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725310;
	b=SFQjZtTCq4fMke1JnpkfP7k9mMXYxz5GbuOL6nxvD1iDXSd0d4SBJg3Wy5ZCiCA3U+s+
	 m8j+x3DjLIQzeZBmouDCL/zr7TpeB8YMGRk7/QnOtipONOTNxkO+NpCn7gVqbMoKuBhWK
	 FFNK7PPVbaarsHMR+BJiEfe5aTMaILRv/thvFC8ym0Q7yh3rni3QJYMcufYH7cuKrE299
	 j4AFsuCXudP1/MIOINzVD9eCGy6dxucx6M9d87JuaQM5lWKp9Hm5GNIFWKzUmxWKwI6vO
	 5kse35BEnbQ69DRaVCx3gzti5/SHVUW1ToH9Y8Rx21QD+/nYx9sLqg0ALzN1Io0LYDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725310;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=ek9smadtLyva7J0eFk6xYHOFlCqPp9k7Ck6t1GYbu0s=;
	b=Ing/pofrGsLjBBn06QnXMgCtU9qZBsdN1wy0L+x7R2xQiVPXFODX49kfH0TSN5MhbK7A
	 B5iCyjS03k/jjHa6UM7VNC9rtBcLV26w097PKgpf0VCnXPZAxemXLOBScOBiMCiDpJbqU
	 swqq7Pf/QKvfi4LVQNHL7/9vXrCA/yLqXB1QDF+Vlnxu95yxE46118NLTQdS4JQQWs1il
	 kjrImx+T77dxS/V98OjGWMhZVxJyncMjghjjbzQX9DbDukzt7VHCKij6CWWYlv5/oLy7E
	 ANNPRNr3qCd/Ba22EnpPvTWiDsGMQQm5YhJ9rJ4Zdo9Td3jD4G0AMMW5C5xsn3aYAwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=LdjTITSv;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FCD606A329
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 17:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19FCD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=LdjTITSv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ek9smadtLyva7J0eFk6xYHOFlCqPp9k7Ck6t1GYbu0s=; b=LdjTITSv1I6D7UC1Qub88SVZvI
	Hb90AQA9XrPIUiMSVuhEjbBgReVtl3UQxNgT3At+Md6wz4AvwCKfEY0+g0xfSxvsfurYp49VFXgfi
	WBEAISPOtxRDKc6c37EBQrWpvSZuFaT6vGco5L+ucUnMd8OjTC5gS/8PWpkqELc21dpRPi/1lM5q4
	LWMJ/oh4v/C9X4qdYnM/SrVjjl0loixpr3Gl7m/AHmZ4hxTIMlhSKCy/fPqCxy7eFECWW1656n2r3
	iT3PXvmceFeDntihwjdDi9QjEjyEA3aeGSA15jFZYOy5invJGeQe+uHQI303ZjmHhymS6Zc/klBqO
	lgefN9+Q==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, shawn.lin@rock-chips.com,
 diederik@cknow-tech.com, michael.riesch@collabora.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: timer: rockchip: Add rk3568 compatible
Date: Tue, 03 Nov 2026 18:01:37 +0100
Message-ID: <3661431.qSoW2BAyJ8@diego>
In-Reply-To: <20261103153144.343764-2-macroalpha82@gmail.com>
References:
 <20261103153144.343764-1-macroalpha82@gmail.com>
 <20261103153144.343764-2-macroalpha82@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Chris,

Am Dienstag, 3. November 2026, 16:31:43 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Chris Morgan:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add compatible string for Rockchip RK3568 timer.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml | 1 +

Please make sure to check get_maintainers to catch all needed recipients.

# scripts/get_maintainer.pl -f Documentation/devicetree/bindings/timer/rock=
chip,rk-timer.yaml

you're especially missing the clocksource maintainers:
    Daniel Lezcano <daniel.lezcano@kernel.org> (maintainer:CLOCKSOURCE, CLO=
CKEVENT DRIVERS,in file)
    Thomas Gleixner <tglx@kernel.org> (maintainer:CLOCKSOURCE, CLOCKEVENT D=
RIVERS)

and some additional lists:
    linux-kernel@vger.kernel.org (open list:CLOCKSOURCE, CLOCKEVENT DRIVERS)
    linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC s=
upport)

the clocksource part does not seem to have a dedicated list, so
linux-kernel should be included.


Heiko


