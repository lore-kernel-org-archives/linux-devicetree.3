Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644545;
	b=Wv3JQ6lS6G+o2qQGaeRie1oAyJVul6OzEWM7rEHkDBiEiX5nDBbtH+Jsge2AKa1CFS2w
	 PIXbiYVgxYUJVmWv+OvM5e9O6VbwSV8ha8OIqjf5txcXm0yE1S9dBeAgrLAm93NDHSWRJ
	 j3wlxBj5hP1KwaG0zkdWcxXjneoYPkHt6C0NKfVz38xgG7ub8OjKRvtMFb8eMt0KuOOld
	 EskaZVrwTUfMv7Dwhq2gK/MyuN8OBFs6TQdXIPc3YewbyMpu9GrcEDzHqlOg6OBuQlgab
	 3O1KtOQtNtoBGFcYbYQN3fmtgPa8SfhwlY483/Bra8hwYNR7+Ec+fa3BGS3NEnD7VOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644545;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=zgSLzQzvj94+CU+RMzv+1QgkSdJmrKstSCWUmbLgimg=;
	b=VhUGSO7T1P4muO81s1AgpFuam5XgPct6QcT7QiWE8LFaRt2VRDjIAd7vMWW47A8J477E
	 nha1+SU0ZQ93QU+T0ROF6zT1W86/9f4reV2uXpIhtrR2Anoi2sT0vjVZqn0ZBdKN1h6z5
	 Qt2H1tZvuFk3CS6H3md+zDNkBTfS/LGM46BpOIQwg6qWysxT5GycM4Bjm6E7g7z7C3tzt
	 Sxh5Q/jwxCEExPdXFBvk8IjWWRswmlKFvIZf1z9DrCj8ogJm6gad75rmDniV9UitZqKU9
	 9dhKilsu5yQ+Q6jgjDK4zGtPFuIK5J1yuYH4QUWNyhIJIDRFfTFucM09exiflC79H+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=HsNp5YFE;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFDF606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEFDF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=HsNp5YFE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=zgSLzQzvj94+CU+RMzv+1QgkSdJmrKstSCWUmbLgimg=; b=HsNp5YFEYBEH6UIUl7uJpBPD1S
	kEIA7BRehcSxPC8vULQaJazoTL0GdjJL7hD8w7drcGk0CSQ8hcQM1B4dy+GJjLclNwiOWZfRyFLWr
	+suXXRhIMkmnzVfBdPq2NLCT1Q64oA9E26MGiul15QwbdlV1JUj4vyf064M7J++yKTa1d6pT+t8NY
	nw6HPSmHE4tIWNW/kSMme56UlQyOXvNaFAQ8qq6KvPZE49326kHNWJuQB1JBpL+7fCsubwcI8bF2S
	DKE6Kc02+6PwO/YtowuVgKPb5D+y3DkqDMQZIahZ/kefWPRVofdUvrqaTG1n+gJvbeBY7SBXUql0J
	u8jqCAow==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, John Clark <inindev@gmail.com>,
 Detlev Casanova <detlev.casanova@collabora.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject:
 Re: [PATCH 0/7] arm64: dts: rockchip: Updates to RGMII PHYs on Sige5 and
 NanoPi M5
Date: Wed, 25 Nov 2026 23:08:50 +0100
Message-ID: <Cu3H0uEZRa63R-pg_rJRCw@sntech.de>
In-Reply-To:
 <CAKTNdwFrQErYOgG9gnCc3g6JOGoimKa2AOKMs3LAcBVYuDuE0w@mail.gmail.com>
References:
 <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
 <179563805247.3885553.6358930861216631692.b4-ty@b4>
 <CAKTNdwFrQErYOgG9gnCc3g6JOGoimKa2AOKMs3LAcBVYuDuE0w@mail.gmail.com>
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

Hey Alexey,

Am Mittwoch, 25. November 2026, 22:58:09 Mitteleurop=C3=A4ische Normalzeit =
schrieb Alexey Charkov:
> On Thu, Nov 26, 2026 at 12:21=E2=80=AFAM Heiko Stuebner <heiko@sntech.de>=
 wrote:
> >
> >
> > On Fri, 20 Nov 2026 14:48:08 +0400, Alexey Charkov wrote:
> > > Both ArmSoM Sige5 and NanoPi M5 boards use the same Realtek RGMII PHYs
> > > which currently share an issue preventing them from enumeration unles=
s an
> > > earlier boot stage left them out of reset: at power-on, their reset l=
ines
> > > are asserted, so they cannot answer an MDIO probe. Until they answer,=
 the
> > > OS cannot look up the ID to match a driver. And until the OS has a dr=
iver,
> > > nothing releases their reset line.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/7] arm64: dts: rockchip: Describe NanoPi M5 Ethernet PHYs by their ID
> >       commit: 693e0c4f00389a097d710577ed5c24c4ac3f75a7
> > [2/7] arm64: dts: rockchip: Describe Sige5 Ethernet PHYs by their ID
> >       commit: 5d839ad9553f90c727157c45471a911f64cd067a
> > [3/7] arm64: dts: rockchip: Drop NanoPi M5 PHY reference clocks
> >       commit: 9c83b53e6c858a9a8f00ca82ecd1f46d2d723b70
> > [4/7] arm64: dts: rockchip: Enable ALDPS on NanoPi M5 Ethernet PHYs
> >       commit: 620ad5b09bec5abd83d35bf23c1af1fb68eed80b
> > [5/7] arm64: dts: rockchip: Enable ALDPS on Sige5 Ethernet PHYs
> >       commit: e48f1d304f7b69b47c6f98b701aa6f8c84ffbb9a
> > [6/7] arm64: dts: rockchip: Shorten NanoPi M5 Ethernet PHY reset to dat=
asheet timing
> >       commit: 5efab9e7c28448f6035e7216255f7b76b28ff97b
> > [7/7] arm64: dts: rockchip: Shorten Sige5 Ethernet PHY reset to datashe=
et timing
> >       commit: a2a390e7fa9e73ff07d2a9fc002114e299483202
>=20
> Would you mind dropping the last two patches here? Sashiko pointed out
> that a later revision of the datasheet prescribes longer reset timings
> vs. those in the revision I had, and with those in mind it's not worth
> the churn.
>=20
> The rest should be fine.

I've now dropped=20
a2a390e7fa9e arm64: dts: rockchip: Shorten Sige5 Ethernet PHY reset to data=
sheet timing
5efab9e7c284 arm64: dts: rockchip: Shorten NanoPi M5 Ethernet PHY reset to =
datasheet timing

force-pushed the branch and re-created my for-next branch, so they
should be gone now :-)


Heiko


