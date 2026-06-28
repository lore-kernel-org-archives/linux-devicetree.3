Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C7335292A
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782652203; cv=none; b=ANhprx+d6kOz2gJHOFgv5DHF0Y1oOjXxu7DJG7FBNziUYVCOMXNdzH2zhXBswfuhEHrideLrYerK47EiV/eUDEMV05+I04z4l3h0DZ4EXs004rS/Tk8i32p/z4dahD9QJF9g0yM3hDoVfIUQXJciVU7bFaLC8rUW2+m9eaNiScI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782652203; c=relaxed/simple;
	bh=30j2JWTnF4nfIDMhuEvu3XTJ3/jpVVg2X8dymjK9WwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hf5AO3K3qrCjMtR+uJp08ruGjudVkXmy+uJlLFS6exbHcJObBHS1yMNF7PJFcCK6FrbrYLK9aMyNnwQZjS1Kj6hEny2MtnvIi/h+ybGPM2/FW3PsFhbno3ZO/wz1nRkgMtA29RLUP6/eageVHK2u+8o+Q6digT9NgdBfJtJmTco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=z3OoCoAF; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="z3OoCoAF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=YBzYnerjriaVbT8N2bTshm586aBFDL6BvkymNB/3ZYM=; b=z3OoCoAFiNYHwTGhZ0WBELIx5A
	Oh4MyRGOq0xjR2mBiBJFaaWUIx4Vpae1/sFb+b4OkfwGA4YcfFIM8OQb4zpm4494FLm/w6HyUYT4R
	CG4lmy3xyEgIqzIN2thf0RgNGoe3ZQ9t18bZpddebKOpBdi2fPtumfZnl8hIaNWzWFSZjbplnxT8S
	IsnVZhB1rzRV/Y9j85wImkVpCtSn2NqeTAMFKJPJxomLzFbxrdX8ZfeApKS05vHU0wJBWy8Xnc7sj
	tefyVF8eGz8UexW+nHmY5IEREVo73XicwAoa4SHXihyCT9IMPWz/MacOo4G+EPStnldw93ec6Id0N
	c3v6WspA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: zhao xinchao <ChrisXinchao@outlook.com>
Cc: "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: add Firefly AIO-3588L board
Date: Sun, 28 Jun 2026 15:09:48 +0200
Message-ID: <2969865.Y6S9NjorxK@diego>
In-Reply-To:
 <SA0PR19MB4572AB455CF87D8BB3CFEE6EC5E92@SA0PR19MB4572.namprd19.prod.outlook.com>
References:
 <SA0PR19MB4572AB455CF87D8BB3CFEE6EC5E92@SA0PR19MB4572.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Sonntag, 28. Juni 2026, 02:52:37 Mitteleurop=C3=A4ische Sommerzeit schri=
eb zhao xinchao:
> From: Chris Xin <chrisxinchao@outlook.com>
> Date: Sun, 28 Jun 2026 00:00:00 +0800
> Subject: [PATCH] arm64: dts: rockchip: add Firefly AIO-3588L board
>=20
> Add device tree for the Firefly AIO-3588L board based on the Rockchip
> RK3588 SoC. The board features:
> - Dual HDMI output via DesignWare HDMI QP
> - RTL8852BE WiFi on PCIe (rtw89 driver)
> - RTL8211F Ethernet
> - Single RK806 PMIC
> - LPDDR4 RAM, eMMC storage, USB 3.0
>=20
> The board DTS includes the common firefly-core-3588j.dtsi which provides
> PMIC, eMMC, and other shared configurations for Firefly RK3588 boards.
>=20
> Signed-off-by: Chris Xin <chrisxinchao@outlook.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile                      |   1 +
>  .../boot/dts/rockchip/rk3588-firefly-aio-3588l.dts         | 718 +++++++=
++++++++
>  .../boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi       | 453 +++++++=
++

This is one patch, but where is the 2nd patch add the board binding?


Heiko


