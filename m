Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51A1311C15
	for <devicetree@vger.kernel.org>; Sat,  2 May 2026 10:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777717364; cv=none; b=mkyteN6P+EJJlhgYRhQfn9eSsa+Qy/j3JRDaATGzVYgb/N987zdbR/9CI9gWsNIqmJZsMGTXvJK2v2upLwLLvJ6jAhCwkuW81qSKywmXN3qT4MXvIRY5hGcYkxSCDXbUA4H23tiY/L8BL5k0MD8RFL7iKQ9hdkUMffjeqgWauIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777717364; c=relaxed/simple;
	bh=0mqKH+GuH6X+sdOPUQ3O+8XIPBC9gNOh+871wOidZYY=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=Y/2gHp/DTmVvJxl84O6XQ5KobOAlmXmaHibsLOAC9yM+dk6jhJPRGRYvt8ZWA6m6BjDSIwgK78+vggW18vM2iRD08vue0jgP5ZJanIHw3Ctyhumu+vnwu7pANKjdsqf+3EJ8uuPbsgTAC2SbO8RebtTIClCHTOy460pxUaWyqzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DZ+RtjeO; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DZ+RtjeO"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777717349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BbnEszm/PmeV98ZXBrarbNHFdx3a5ydIzCvCJ4oa3xg=;
	b=DZ+RtjeOqUIRi7xLXEr2nmh+M7SqhdoverehoZWlI9YrMO0UF9jumTDJB1ZzEZP+54X9QG
	ivwkbLBRErJisC9xJDm478D8cYtLjO82TLc4HmMGf3piEglx4uF3FV64j1Or6aF+8754V5
	pRaASGAWwj5Prm01IHLeg7nqanlmIUI=
Date: Sat, 02 May 2026 10:22:25 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <7a4d6015e991aaf80b9ffcaaf8fa76799d56649a@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v2 0/4] some BPI-R4Pro dts updates
To: "Frank Wunderlich" <linux@fw-web.de>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, "Daniel Golle" <daniel@makrotopia.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, "Andrew
 LaMarche" <andrewjlamarche@gmail.com>,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260412092333.6371-1-linux@fw-web.de>
References: <20260412092333.6371-1-linux@fw-web.de>
X-Migadu-Flow: FLOW_OUT

Hi

just a gentle ping

do i need to change anything? i wonder why i do not see this series in de=
vicetree patchwork...

Am 12. April 2026 um 11:23 schrieb "Frank Wunderlich" <linux@fw-web.de ma=
ilto:linux@fw-web.de?to=3D%22Frank%20Wunderlich%22%20%3Clinux%40fw-web.de=
%3E >:
>=20
>=20From: Frank Wunderlich <frank-w@public-files.de>
>=20
>=20There are some parts of BPI-R4Pro DTS that need to be changed. Curren=
tly
> there should be not much users of the mainline-dts and we noticed some
> things while openwrt integration.
>=20
>=20v2:
> - added mgmt port renaming as this patch is still outstanding to keep
>  all in one series
>  https://patchwork.kernel.org/project/linux-mediatek/patch/202603032020=
06.37515-1-linux@fw-web.de/
> - dropped default-state in gpio-leds patch as suggested by daniel
>=20
>=20Frank Wunderlich (4):
>  arm64: dts: mediatek: mt7988a-bpi-r4pro: rename mgmt port to lan5
>  arm64: dts: mediatek: mt7988a-bpi-r4pro: drop duplicate fan properties
>  arm64: dts: mediatek: mt7988a-bpi-r4pro: update gpio-leds
>  arm64: dts: mediatek: mt7988a-bpi-r4pro: rework pcie gpio-hog handling
>=20
>=20 arch/arm64/boot/dts/mediatek/Makefile | 8 ++++++++
>  .../mt7988a-bananapi-bpi-r4-pro-cn13.dtso | 20 +++++++++++++++++++
>  .../mt7988a-bananapi-bpi-r4-pro-cn14.dtso | 20 +++++++++++++++++++
>  .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 15 +++-----------
>  4 files changed, 51 insertions(+), 12 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r=
4-pro-cn13.dtso
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r=
4-pro-cn14.dtso
>=20
>=20--=20
>=202.43.0
>=20

regards=20Frank
