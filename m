Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609C1194C96
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 01:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784250745; cv=none; b=WZ7/T7PZFrV9PooxbqkTT5tabFzgEPUa8QcAL9M+kcFZyiQfCMUAK8L0lxYSnOleYBkP3z7Nxdykft+on+8myWl8F/S2wvD9rUoFNSrnIxoJ3QWxEB5VfQr0UyTp279Eber3ecuMs5zmBWwjN75f77+RF3W8XO8nt/sg5jqdb3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784250745; c=relaxed/simple;
	bh=vXfIqqepDP8p5zP7c8Hs2nnLLHbA26kLUb8mUfSfjkw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uZberXTqsWZlkoMDwy2GSO1eu39gpfmuYRMXcs20VhVp9dl2GNbHFXZl157wMSn/Valu2OuxqlEjB6Enz+mM8D4otrWtJq4QxhjJ5RYDyBslVNMAnNfNhNJJLvTRIXzar4DLUT4+Jh1xJwMkZ4Dxfkfu+6VfQU3QpREdQsk1k68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lg3vxVEi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lg3vxVEi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24A71F000E9;
	Fri, 17 Jul 2026 01:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784250744;
	bh=RkZ7wpnl9IZcN/0/D+5DPL3iFBZh3ONFBzRDmUShDug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lg3vxVEiIR9PRWeNb3vQ7TmZKujpsdTqWRkywxEu/l4Mkk9bFH51UIxFELkfCPl/o
	 nN6zTI/MNXvzOfMQERT98ozQEE0/crdwZUKeoXQavigGV03OqGxGCRuA9VQduOpbwX
	 //QsUqRI5mcMpAAdLJq2NM+nLd82TUFlBbVqNPdVRWCAvSyoj+3WRiF/CU1rLpbGMg
	 KqSFdkozs7one4TTzOe4pBVyLbpelc7A/VJqbH/8Rfjb/JH1Umg2rE0GfVYTsr58Uz
	 gLkRbVuNW5hsI8NdmlH0VQjcYpXFfh3NoCDe7HzO078KDQEVuajW85w37dwjd7kaNX
	 vmuznAkDYXaLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Keep rk3399-roc-pc-plus work
 LED on
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717010736.578419-3-festevam@gmail.com>
References: <20260717010736.578419-1-festevam@gmail.com>
 <20260717010736.578419-3-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 01:12:23 +0000
Message-Id: <20260717011223.C24A71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message describes the work LED as a "prominent blue f=
ront-panel status LED", but the patch fails to override the inherited "gree=
n:work" label, resulting in a code and commit message mismatch.
--

--- Patch [3]: [PATCH 3/3] arm64: dts: rockchip: Keep rk3399-roc-pc-plus wo=
rk LED on ---
commit 7bd9a09829c15f03ac88e155bb13da9235dada8c
Author: Fabio Estevam <festevam@nabladev.com>

arm64: dts: rockchip: Keep rk3399-roc-pc-plus work LED on
   =20
This commit overrides the default LED trigger for the rk3399-roc-pc-plus
work LED to default-on. It changes the behavior from a distracting continuo=
us
blink to a steady status indication.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts b/arch/a=
rm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
> index f87bc7b6afc14..7e8039b19be7e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
> @@ -93,6 +93,10 @@ leds {
>  	};
>  };
> =20
> +&work_led {
> +	linux,default-trigger =3D "default-on";
> +};

[Severity: Medium]
The commit message mentions this is the prominent blue front-panel status L=
ED.
Since the board inherits from rk3399-roc-pc.dtsi where the work LED is
typically configured with the green:work label, does this node also need a
color or label override?

If the inherited label is not overridden here, the sysfs interface might
misrepresent the physical blue LED as green, causing a mismatch between the
commit message's description and the resulting device tree.

> +
>  &fusb0 {
>  	vbus-supply =3D <&vcc_vbus_typec1>;
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717010736.5784=
19-1-festevam@gmail.com?part=3D3
