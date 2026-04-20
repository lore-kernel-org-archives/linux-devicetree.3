Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D581364E98;
	Mon, 20 Apr 2026 15:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776697728; cv=none; b=u+uYVusXcfUwo3XxD20Ts5QSsEZ46xph09osGNxq8VmXGfeQHSielj9F3CTJx2aEBdwb0hcWjih9TSpKiqFHTG3Jo+tUa7Fv5AQtpljleSpV1e5cP+uO5Ogw25N/biTb7OFLkIrL8rJD3J4BiS4ypWmEyHyhidKX4jj2J3TNUOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776697728; c=relaxed/simple;
	bh=oVesiwJLOatc+0XV5UOiPSqBrx1C3ZXBBwI+K3W8XFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jDF0B0+JCX5sJoU/b/XzV6a574Ca+jZBs0uqBmfpIPY6T9fDx/Eu2kQcVamDnT0a4c1CkJKyiw0fTCv+8Qd9oRGODG7GO5LCkKWmofb7yJl1HoyHVjpkouNNLu10PzoczgXspwd6HNwg242VC1q1nWiM5XldkOl+GxySmzl8dFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=EcmtL1ko; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="EcmtL1ko"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=GRPriQZt7VyS6kWuPERur2gAon2Iu5ktl6SXcUzdsKM=; b=EcmtL1ko2hxqdMPGOJSmH0gJqF
	eOk7UIZkvYbg6xm5hhyKFDcKMB5Ol4VdiX1sdFj8JeDpFC2d1q8A9aDcNCNCwFWKLf/K1C7i/J1Vf
	Zd+VD726MK8NbBhPoyjBqHH/y31NPQLrzsBaZ4oZfmHeJR4TMENXJSyb1eKCK02H+By+M61+jGCSf
	TFuE1xikDrSziT8gf9Ti+dsFl6uL9bN4JS0mwAFwS4/LOfQ8ydMKPFX3p19RJhSy5wIXuX+mypfgV
	Kkgv1IbgnFCpDavyRoOIP+Hrijao8TF1S67rwX8r7gGYKHWw+hBGWOhD/2LKYngwfraXASsozlwQT
	yhGdd50Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 00/40] arm64: dts: rockchip: Wire up frl-enable-gpios for
 RK3576/RK3588 boards
Date: Mon, 20 Apr 2026 17:08:26 +0200
Message-ID: <2744059.tIAgqjz4sF@phil>
In-Reply-To: <66f9574c-8dff-4de2-bf54-20f1c1e64c24@collabora.com>
References:
 <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
 <2435759.n0HT0TaD9V@phil>
 <66f9574c-8dff-4de2-bf54-20f1c1e64c24@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Cristian,

Am Montag, 20. April 2026, 13:10:27 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Cristian Ciocaltea:
> On 4/18/26 2:18 AM, Heiko Stuebner wrote:
> > Am Freitag, 17. April 2026, 19:55:17 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Cristian Ciocaltea:
> >> On 4/17/26 2:34 PM, Heiko Stuebner wrote:
> >>> Am Freitag, 17. April 2026, 11:24:34 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Cristian Ciocaltea:
> >>>
> >>> [...]
> >>>
> >>>> Cristian Ciocaltea (40):
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-100ask-ds=
hanpi-a1
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-armsom-si=
ge5
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb1-v10
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-evb2-v10
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-luckfox-c=
ore3576
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-m5
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-r7=
6s
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-roc-pc
> >>>>       arm64: dts: rockchip: Add frl-enable-gpios to rk3576-rock-4d
> >>>
> >>> I do think one patch per SoC (rk3576, rk3588, rk3588s) would make more
> >>> sense, because these patches really are mostly identical :-)
> >>
> >> Yeah, apologies for the large number of patches, I went this way to al=
low
> >> per-board reviews.  As previously noted, I tried to identify the GPIO =
pins from
> >> multiple sources, so I'm not entirely sure about the accuracy in every=
 case.
> >>
> >> Would it be preferable to squash the patches per SoC and board vendor,=
 instead?
> >=20
> > I really would just do it per soc .. so 3 patches. That is a size that =
is
> > still reviewable for people, who can then check for their board.
> >=20
> > If the patch is labeled "Add frl-enable-gpios for all RK3588s boards", I
> > do expect people to notice it the same as "oh _my_ board gets changed".
> > ("all" could also be "most" :-) ).
>=20
> Ack. =20
>=20
> I would still keep the more invasive changes =E2=80=94 such as those touc=
hing
> the regulator hacks =E2=80=94 in separate patches, though.

sure, that sounds perfectly reasonable :-) .

Heiko



