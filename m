Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571592;
	b=vfdBNPny1e1fsellLZUz46VB2kKc0EzAYqxLjA0nbfUI4/ZsumsU1NIizvCkzQzAS3t2
	 +HYWc0JZezSOOUMkdF7yfQqz9xmGtUTEY47HsBRIK3TySTpwmZNvzaC37sj3I/l94Q+Ee
	 abp4r2/IZkcqml7Ql9pzb1YwOzpcJcCX/mQYWWo+vXMLcONdpEqFdfnz3Klih3MEbylRL
	 gt91gcVNkpuAuTW1S+3FihSs7qVDKV23FO9VXFoLBYIWM0RPDjwJ/sMetjHYE1cKd4fLc
	 lCzg7ztuRVizr3BW6H3VyjQGrj+saY4IV4MspzaBFjg94OoqQws43NEU7t5Sgkp++SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571592;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=RlMmBJaoFVmxxA9FM3cQTpEG1wm1O3AcY8dpRqM2fYI=;
	b=X1W+EBJDbRCwdojSoVGuhSuGq1aPbiezPl8udoHBGFxs6R/cFWmBhE7sHz3ydiMl0v8z
	 bTGXUJXn4DlrpjrMSTEc6NR2NIyoJtnPUEQexpBD6SRsMJgZTeG7i1MeRun8xPCWMywhU
	 bBbalwkGnzXCsWL9daUo0ovI5V8a7XGmZQpgkklGPY8LyuEizTmyUCd+U51JCRr6hLvms
	 gNK3Lv0jRCVCne5W9z5t/nco0ktWC1Ez/EZWwxSi2xOi0SEgFEn2HxMhijVwoq4inDNoM
	 yqirQ3pusDVNb98L0aRv6UW3VtFwGjIH0awUUwLcAzY1ZQys4VfYUOWCuFPQPrDKsCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b="Im3G/s89";
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2475E606A339
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2475E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=Im3G/s89
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=RlMmBJaoFVmxxA9FM3cQTpEG1wm1O3AcY8dpRqM2fYI=; b=Im3G/s89G/FO2EZ5tMahT52ktm
	iOfGJMjkmb4qCWjJ/iIbvyijS1l5gGkKgcGml7frVALCyYLTuJX9BKVgbqhRcrhmSSr+1xE1CtfSN
	2vK1HwKYYgbeyT9EPNEFGJaRVJ9+HZix+vpIfeqfjofs3bcqNlV8V0jeYMtH0L3RqFey4Jd5cGECw
	zx2O9aUmmSYdGZOke4G633my6buU5BYfuN9cyOpDLbVJXsjhDamQ9MFaUL58VndidhbuZ8jL2AY5r
	6R4DSx6Fa+0VvWKSmheX/8kNIxIy8sgI9g/D5aGlJLyj8mJlGm7JVK/kCtZ8LihwFU5lwDz0r1S4h
	nzPvjJLg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, joachim.eastwood@gmail.com
Cc: Shawn Lin <Shawn.lin@rock-chips.com>,
 Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Joachim Eastwood <joachim.eastwood@gmail.com>
Subject:
 Re: [PATCH v2 0/9] arm64: dts: rockchip: NanoPi 6 series fixes and
 improvements
Date: Sun, 01 Nov 2026 23:19:46 +0100
Message-ID: <17766357.Ash8RoxBsO@diego>
In-Reply-To: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
References: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
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

Hi Joachim

Am Sonntag, 1. November 2026, 22:55:18 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Joachim Eastwood via B4 Relay:
> This patch series contains a few fixes and miscellaneous improvements
> for the NanoPi 6 series of boards.
>=20
> Patch 1 fixes the voltage range on the SDMMC regulator.
> Patch 2 enables HS400 mode on eMMC. Tested on my M6 board.
> Patch 3 adds an IIO HWMON device to monitor the input voltage.
> Patch 4 moves a regulator that only exist R6 boards to the correct dtsi.
> Patch 5-9 renames DT names to match the schematics signals/nets.
>=20
> If patch 5-9 is just considered churn I'll drop them. These are more
> nice to have and just makes it easier to cross-reference DT and
> schematics.
>=20
> Schematics for the boards can be found here:
> M6: https://wiki.friendlyelec.com/wiki/images/8/85/NanoPi_M6_2405_SCH.PDF
> R6C: https://wiki.friendlyelec.com/wiki/images/f/f7/NanoPi_R6C_2302_SCH.P=
DF
> R6S: https://wiki.friendlyelec.com/wiki/images/2/2f/NanoPi_R6S_2208_SCH.P=
DF
>=20
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
> Changes in v2:
> - Add schematic links to cover letter to ease review
> - Renamed rtl8211f node to gmac
> - Add R-b tags from Shawn Lin
> - Rebased on v7.4-rc1
> - Link to v1: https://patch.msgid.link/20261014-nanopi-m6-improvements-v1=
=2D0-e713f71eb4d3@gmail.com

looks like we worked at the same time :-) .

As you will have seen just now, I applied your v1, so please send any
needed changes as follow up patches.


Thanks
Heiko


