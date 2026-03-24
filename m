Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABBB35838E
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 22:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774391285; cv=none; b=pjLBmDfpraJb/fAdgymirTJoJdpV8AII4MkNkVY2BGzNOvwEBvFhvsg1cfN+5KFdJwBMSUmIX7jPv2UdVyyJv6HCID0BRRKtOJOeHOTSf/ldYbDwzJyE0rxT+zYX4z8E6GkvO6O8nnlhBWvLvjo8owy5MitoX2131eLrrxJFUvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774391285; c=relaxed/simple;
	bh=V3gld30CC/yUh8wAsj33dTrf4cqP87g/8NsYlEhB37I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jl9HV6haK0l66SVp91fTwAi/I3pUvZZXbocuo99g134o/pN+x4NOhg109BN4SipR3AK21/rl0fE3q+YST7SFc2hpeXn3Akovep/DogkO70GwXHEzBZovGrHrNRXiQS/OpAju0wqDAcbrGyA5QudZA0F2EJcsTZmdbjhY2e1FHlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=EvgsFLXu; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="EvgsFLXu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=V3gld30CC/yUh8wAsj33dTrf4cqP87g/8NsYlEhB37I=; b=EvgsFLXu69P0N9Jf299wrsywDx
	PK4xGnPpKiCThvwYdqEjq+sp2g5tZxgGCU+b54CIpjprafspupOR9czL0pQhwQ6/Kq2qUd1xON3hN
	WZwGHSdcTbgSrxe/J74zhUOY7eDKpswDDtQtkcgtdeE2TvrcrN/db5gjh9pr+tr9y5vgBF5oL97MH
	N+NZO8wpf7TWHrLqWkuzYkMFIp02XYFqj/Fl8imG8IdxD7285qg5dMcmSZXPAW8eBWgfSoe++bClI
	pWDf8t/UpIt17ZAdnDuxdL8vRm4NYuEoo1YjMILVfGoE+ovbKabHUhqjvAgbqdiauyjjzfVEybRyT
	X+/jf6Yg==;
From: Heiko Stuebner <heiko@sntech.de>
To: MidG971 <midgy971@gmail.com>, Jonas Karlman <jonas@kwiboo.xyz>
Cc: linux-rockchip@lists.infradead.org, shawn.lin@rock-chips.com,
 jonas@kwiboo.se, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject:
 Re: [PATCH v5] arm64: dts: rockchip: rock-3b: Model PI6C20100 as
 gated-fixed-clock
Date: Tue, 24 Mar 2026 23:27:47 +0100
Message-ID: <10821700.nUPlyArG6x@phil>
In-Reply-To: <533f27c9-e970-449b-a431-4ba41a566aaf@kwiboo.xyz>
References:
 <20260320094441.128263-1-midgy971@gmail.com>
 <177437177535.786081.7519498810130807269.b4-ty@sntech.de>
 <533f27c9-e970-449b-a431-4ba41a566aaf@kwiboo.xyz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Jonas,

Am Dienstag, 24. M=C3=A4rz 2026, 18:15:38 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Jonas Karlman:
> Hi Heiko,
>=20
> On 3/24/2026 6:04 PM, Heiko Stuebner wrote:
> >=20
> > On Fri, 20 Mar 2026 10:44:41 +0100, MidG971 wrote:
> >> The Radxa ROCK 3B uses a PI6C20100 PCIe reference clock buffer to
> >> provide a 100MHz reference clock to the PCIe 3.0 PHY and controllers.
> >> This chip is currently modeled only as a fixed regulator
> >> (vcc3v3_pi6c_03), with no clock output representation.
> >>
> >> The PI6C20100 is a clock generator, not a power supply. Model it
> >> properly as a gated-fixed-clock, following the pattern established
> >> for the Rock 5 ITX and other boards with similar PCIe clock buffer
> >> chips.
> >>
> >> [...]
> >=20
> > Applied, thanks!
>=20
> My comments from v3 [1] was not addressed in v4 och v5. E.g.
> regulator-always-on/boot-on not being removed and redundant comments.
>=20
> [1] https://lore.kernel.org/all/fec0f25d-733a-4b6c-aef1-2ac51bd15798@kwib=
oo.se/

thank you so much for noticing. Looks like that AI thing is
working "well" ;-) .

I've droped the patch and recreated the for-next branch now.

@Midgy, please honor feedback in future revisions.

Thanks
Heiko


