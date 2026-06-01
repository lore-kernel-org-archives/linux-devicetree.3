Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA8F1C5F13
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 16:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330633; cv=none; b=NbGn8XOX7U/NULWZlJcg5qFxeA4R8befMRfNGttpdEt4IPuD1Va5QYhahwx/p/wiTNFZFWcAYlGFrodNUscwDfoWp0eeCwdqVnwEAVcOG3E0WiB7sRY1va2F1oLqtndvCDLUMgDcC3T1az8CHR4Br7GVcoYWKCsqKngNrDAYgUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330633; c=relaxed/simple;
	bh=6FS7hw6VWDwhYgG/mpaaWEDbXZmdc2ny0Iuu2UyA6qI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ja4oYFvAEdDxV+AOQBAWFNLuOUBHHvHTFsysqasHHyiVJe5BQfbzarktzep5QPqzks3xIFLkt+uHdFy21DdiqY7rJ17rL4UKkktv+xCC49EpSrtSs2eQzfv7z4vnnrWEU3JA432OG2zX/OgOoC4d8DWQqKlVr64Hj9UmO+y2gIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PppoQvXb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PppoQvXb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4991F00893;
	Mon,  1 Jun 2026 16:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780330632;
	bh=BcFBQzCBpqX6qVkNF9Eu8jFNvVgERsyaPZl3hrcwRIc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PppoQvXbYqSdrhnUdLRN8ppS2yU2KuHfXkCZCTIiS03KCg30V90T1Ivpdu8igWIzZ
	 G2YrCAw3U21nq6NPsZiSsWqmUVKlATxtCnD9XtuLDxQ5E+pkKdEV6gLp0s3qvKhPfQ
	 d/pSjy+7CJNSphk1MGkhZ+l9eaT0nyqu+yXxqdue6hE0KElPgiMt+ixef8X2IDUhGh
	 5wP/s1Rcqrzmwtz7YBKGxgfaxMCr1mQxZqUiHnSZri0db8W6jVKPNuq2QnqTBOc2/g
	 mjM3xz1hWY/8DELvJze/XENe+sfw57iIPzm4bXHl9qz5LsnnZ12KwxezE047PP1wx0
	 Xmh0kQf/f0tHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: add Vicharak Axon board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hrushiraj Gandhi" <hrushirajg23@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260601160603.167706-4-hrushirajg23@gmail.com>
References: <20260601160603.167706-4-hrushirajg23@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 16:17:12 +0000
Message-Id: <20260601161712.5D4991F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] HDMI sound cards are enabled without enabling their required I2S=
 CPU DAIs, causing permanent probe deferral.
--

commit ca10e83c8d79d810a60f06ac2d9b83eaded46a17
Author: Hrushiraj Gandhi <hrushirajg23@gmail.com>

arm64: dts: rockchip: add Vicharak Axon board

Add initial support for the Vicharak Axon single-board computer based on
the Rockchip RK3588 SoC.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts b/arch=
/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts
> new file mode 100644
> index 0000000000000..f0ba75a750e8e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts

[ ... ]

> +&hdmi0_sound {
> +	status =3D "okay";
> +};

[Severity: Medium]
Will enabling hdmi0_sound without enabling its required I2S CPU DAI (i2s5_8=
ch)
cause permanent probe deferral?

The base dtsi files set status =3D "disabled" for this I2S controller. If i=
t is
not enabled in this board DTS, won't the simple-audio-card driver indefinit=
ely
defer probing while waiting for it to be registered as an ASoC component?

[ ... ]

> +&hdmi1_sound {
> +	status =3D "okay";
> +};

[Severity: Medium]
Similarly, will hdmi1_sound also fail to probe and indefinitely defer since
its required I2S controller (i2s6_8ch) is left disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601160603.1677=
06-1-hrushirajg23@gmail.com?part=3D3
