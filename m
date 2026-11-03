Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732947;
	b=KdTlK3dSYvZ9HYkZpMPxS/J5RparzMcJOPXfBJrJ0MbQZQQ9X7v68NxKMjTWLo9NKTED
	 cfGQPH7WiwIyvqbyFFn2Ux8mZju/oU2M2f/qCiUkmba+WxVQTX5DD1FFLyNFjU2091ijj
	 D+YL2K0Q1tbHzZ6OqABgBSv3YIfze+vzLi674Opb94KyaO+wE68Zqj7uL5on3qMt5zXU8
	 dKS1pzKq76Mx0MqQS3AlM/cWlqNvCaB5UKukES0e8Oqc/pqSMOMgLbhf2OA7q2q391DFZ
	 li8F7ThzJ91NnndCpQN1Evijf5w5xbP1LkGyJXXGEYx/a0sTp60ApEp3scIfqwU/MSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732947;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=R+P3IkoL4I5ZNgNuJJGHc28hYyVfwE/0EISTFVpNB28=;
	b=BaQjJY9jFYU8mSm4W+SiBJBXw/Ce0+MO259uUQWBTqwYT5T2ZYaTuQEUyyYUuDOj6qB6
	 5ITpd6E/+aqb1c8Z4LI8wsA4e3a3GOd4AdND9AH1Q1eugQO//SKWYxHjnNAbt9yQ8dy6M
	 SQOgXxeUaemV0TM/Egkga8ruiL3MXAIjwJq0MJr/3RNvGdpS9WW7tqSStqBGrcMxt3IEO
	 HHoNG47PMt2hs9V1GQALb19VxDKKvIq6Wqla0/0OH6zJ4KAMWlhDlDqbVEBbDJpjLuXUK
	 X1fXC58SYGZ4xSwBGkGNXn1hDOp7PBjSRg+3eJmrS2neXukgsys04fOUZhq587umjzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=1QIv0Fjm;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F6D606A32E
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 19:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78F6D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=1QIv0Fjm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=R+P3IkoL4I5ZNgNuJJGHc28hYyVfwE/0EISTFVpNB28=; b=1QIv0FjmCBDhMcBIA6j2CeXlgG
	X2AmJiqbdXSvExoFWs0UMYDqCg0UuC/ktXCfLwbeW6a4bHetxNrG9nR4rR/Xvk/n6qb2GndGr2VCB
	YDqz0JQLwdZ2rwY039n5ZXwVPlcaovrUZe4ZTjWVotxnvFofUPkqGGqtrktC1wKG73oBSCqoDhGiS
	hiQ5nyhBqvNWlyn1xtt37hRDJ+W8I1NZeTM+PwjRLGqHndrWQsmOcaO1Ey6CZEIk5XnQx+SiVRNkz
	3ZNZf8ac20FVqPkQiTHKz9hBY5b/QK3wt+zy/Mlq1dm8dYjFFa9fvCFN8vuNPctnxOl8EuSmk0EsL
	lyIzLQ0w==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>,
 devicetree@vger.kernel.org, shawn.lin@rock-chips.com,
 diederik@cknow-tech.com, michael.riesch@collabora.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: timer: rockchip: Add rk3568 compatible
Date: Tue, 03 Nov 2026 20:08:51 +0100
Message-ID: <2607835.uoxibFcf9D@diego>
In-Reply-To:
 <PH0PR19MB9973388CD960185681A4C3E16DA5692@PH0PR19MB997338.namprd19.prod.outlook.com>
References:
 <20261103153144.343764-1-macroalpha82@gmail.com> <3661431.qSoW2BAyJ8@diego>
 <PH0PR19MB9973388CD960185681A4C3E16DA5692@PH0PR19MB997338.namprd19.prod.outlook.com>
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

Am Dienstag, 3. November 2026, 19:07:19 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Chris Morgan:
> On Tue, Nov 03, 2026 at 06:01:37PM +0100, Heiko St=C3=BCbner wrote:
> > Hi Chris,
> >=20
> > Am Dienstag, 3. November 2026, 16:31:43 Mitteleurop=C3=A4ische Normalze=
it schrieb Chris Morgan:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > >=20
> > > Add compatible string for Rockchip RK3568 timer.
> > >=20
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml | 1 +
> >=20
> > Please make sure to check get_maintainers to catch all needed recipient=
s.
> >=20
> > # scripts/get_maintainer.pl -f Documentation/devicetree/bindings/timer/=
rockchip,rk-timer.yaml
> >=20
> > you're especially missing the clocksource maintainers:
> >     Daniel Lezcano <daniel.lezcano@kernel.org> (maintainer:CLOCKSOURCE,=
 CLOCKEVENT DRIVERS,in file)
> >     Thomas Gleixner <tglx@kernel.org> (maintainer:CLOCKSOURCE, CLOCKEVE=
NT DRIVERS)
> >=20
> > and some additional lists:
> >     linux-kernel@vger.kernel.org (open list:CLOCKSOURCE, CLOCKEVENT DRI=
VERS)
> >     linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip S=
oC support)
> >=20
> > the clocksource part does not seem to have a dedicated list, so
> > linux-kernel should be included.
> >=20
> >=20
> > Heiko
> >=20
> >=20
>=20
> I apologize, sorry about that. I assumed since I was only modifying the
> device-tree and bindings I didn't need to copy the rest of the teams.
>=20
> Should I resubmit with the additional names?

very likely ... i.e. the binding is generally going through the driver-tree
here the tree holding the clocksource drivers.

=46or me to apply the binding, I'd definitly need an Ack from the clocksour=
ce
people.


Heiko


