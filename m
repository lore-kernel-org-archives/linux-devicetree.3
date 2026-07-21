Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06E630FC21;
	Tue, 21 Jul 2026 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784638886; cv=none; b=b/ZjMX54/nmx1DsKpK5QLId0os8cgzEEi7KaUmTdC73gmrxBPjvB1t2SI6YTZmtH6JjydtJigQBEWFg2W3N8oBPp2yYnKHZYAM7TyKJe3t+/Wdu2HJrVb7jZ/LK43ncJ4lrT6xgzqIlUPGScn6go+pSAXVwXzOJxSyyaHiU6GE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784638886; c=relaxed/simple;
	bh=jDIsAzSEANLN3Zvfmo+7EkO4M0Cfs6rJV2i2gh5Sf1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MB4pHA8O5Thb2oxZVCvVMJ9YS7OJKOWs7tW48LFJ/5/uDz7GueA/ltqX/UVk0hHZr0MKGMDelVpmm9/GuksL8m2X6thg1UmKYs8WL+g4tT70gFdUS4HTNSIceTeY+6dYM9U8N/wgdchDHxo3C6IdhjSM9mIUFCZEoE68WXbIiXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=TJ4Oysv4; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="TJ4Oysv4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=pSOO82rGZ9vf4QviO3ci9+FEx87mVFslO4kBFj925fQ=; b=TJ4Oysv43cFrTxhtyiWLeDZnBv
	2AjXndaq382fbBu49j+SvshHJlKW8X8MFF2nNBBQI7TXsDoyXKgAVTj0oezpBn35Dq//vFxkPGVEc
	y2QuOd35TUYgbiGGSAgrs/Fcp6Tr+nYrrSFHod5KE+odP6OWylUmkF4MgNGf71dQty8u75VZwyaHO
	HgudQ3MHNt5DOKl4jWhN1lRd+O3tkqelcDlo/55VjuDU+nTy8x1vx8ymNKKHqfbjctkgAr2A4EreE
	DBLj0GGCI7N/RYtMRhq95q3Yn2AFDUzwdiIrz+JpLe2tOsVJqrBx4lIqyuUMcNJHLEDF7O8eT0t/3
	+zlTW0oQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Simon Glass <sjg@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Fabio Estevam <festevam@nabladev.com>, devicetree@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Bartosz Golaszewski <brgl@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Riesch <michael.riesch@collabora.com>, Rob Herring <robh@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Yao Zi <ziyao@disroot.org>,
 huang lin <hl@rock-chips.com>, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 3/6] dt-bindings: soc: rockchip: grf: Add RV1106 compatibles
Date: Tue, 21 Jul 2026 14:30:53 +0200
Message-ID: <3926001.VQhiAETyHQ@diego>
In-Reply-To: <20260721-didactic-tan-dodo-112ffc@quoll>
References:
 <20260714193656.2196447-1-sjg@chromium.org>
 <20260714193656.2196447-4-sjg@chromium.org>
 <20260721-didactic-tan-dodo-112ffc@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Krzysztof,

Am Dienstag, 21. Juli 2026, 10:16:33 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Krzysztof Kozlowski:
> On Tue, Jul 14, 2026 at 01:36:40PM -0600, Simon Glass wrote:
> > Add the compatibles for the general register files of the Rockchip
> > RV1106: the main GRF, and the per-bank GPIO IOC blocks used by the pin
> > controller.
> >=20
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >=20
> > Changes in v2:
> > - Drop the grf-cru clock-controller child and use the syscon-only
> >   group for the main GRF, since the CRU now provides the MMC phase
> >   clocks
> > - Use a single gpio-ioc compatible for the per-bank IOC blocks in
> >   place of the ioc and pmuioc regions
> >=20
> >  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/=
Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> > index 2cc43742b8e3..fd9235ac1334 100644
> > --- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> > +++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> > @@ -64,6 +64,8 @@ properties:
> >                - rockchip,rk3588-vo1-grf
> >                - rockchip,rk3588-vop-grf
> >                - rockchip,rv1103b-ioc
> > +              - rockchip,rv1106-gpio-ioc
>=20
> And this also answers my previous email (pinctrl/gpio bank): you have
> one GPIO IOC, not multiple ones, although commit msg tells different
> story. Confusing. The compatible here defines register layout (see
> writing bindings - it is explicitly documented there) so do you have one
> device or multiple with the same register layout?

It's actually option 3 ;-) .

The TRM describes separate General-Register-Files
	GPIO0 - the actual GPIO controller -  0xFF380000
GPIO0_IOC - 0xFF388000  (pinconfig)
	[ bunch of other devices like the video encoder ]
	GPIO1 - 0xFF530000
GPIO1_IOC - 0xFF538000
	...
GPIO2_IOC - 0xFF548000=20
	...
GPIO3_IOC - 0xFF558000
	...
GPIO4_IOC - 0xFF568000

But their register-layouts are definitly not identical. For example in
GPIO0_IOC there is one register controlling Schmitt Triggers at offset
0x58, ( GPIO0_IOC_GPIO0A_IE_SMT ) - because only the first 8 pins have
those, while in GPIO1_IOC, 4 SMT register start at 0x280.

So they do need separate compatibles, per your comment.


Heiko



