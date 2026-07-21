Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E54B36EAA6
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641253; cv=none; b=N8heL6rsvwhOcu42K+td5go2y0ZPLWhJA5tizCb2M+AhI5MbPUrJmYgrBirhBOyw6Dus23xI+QdOc2pY44Ca3PWiBqrsbgXQe9SDLcwla8r1dKtr1ZNF4J/3TozM01Zk3TJ9qzwlhjcx9OaVwY5julpBwKtf9injxLQpJ7J2wwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641253; c=relaxed/simple;
	bh=KbZ2bMtZej06PdTNA6noaJ8sMiDMrqionREuebNy0bo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qT024rE8ykTI45FD7/rvtDyn5zv0bWXKPs8Stmr4LR3A0aegCeEKxT6+EtaSUhQBRlp4EBdSvhQQfqc1Mjdiuak48ZE2R07WEjtCRZI0EUXeXDf+nuLfmiEJO6eehvmJdh8KyMWXzHDIyemQO48RvjTwsdCfElpLe4WXc5ambRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CilV1L4k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CilV1L4k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F451F00A3D;
	Tue, 21 Jul 2026 13:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641252;
	bh=3ormp5lNfO1wAvSpDitEv6/w8X7s1G24QQWY9u3eLW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CilV1L4kVV2zlrwC51GrjZRIevkSgSP8KIBE7+H37zTLV7UrK6KYMYE5zxwvcRrBi
	 JG/a7a1M3ftLJNLPHqdjSMVGjhN+d1+GbxZS5FzhgZE9rMW8AG57FZAO4hvbRIc0hV
	 HT/mrgs2FmT8goviUbybf0/t0IxEU2XBQChpUSSeRlSJmpC5K1LopPKJ4uKE6w7HSx
	 9QGycG7/E9VzHO6tT0pI1utkK6TsAQC/EuUi5zxqw2HrAI6vXl1byVHbvccZHeGGzQ
	 fTLffKaJU4LluW4frQ4iHYg6LYMZSUjAdHYB9KZJqsLRUG+GxmVLuikEnbBZ9c4ytM
	 WJqGGmbHYjcng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Remove invalid
 rk3566-bigtreetech-cb2 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721133408.44240-1-festevam@gmail.com>
References: <20260721133408.44240-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 13:40:50 +0000
Message-Id: <20260721134052.44F451F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch incorrectly removes the 'ti,rt-thr' property instead o=
f correcting it to 'ti,max-rt', permanently discarding the board designer's=
 intended touchscreen resistance threshold.
--

--- Patch [1]: [PATCH] arm64: dts: rockchip: Remove invalid rk3566-bigtreet=
ech-cb2 property ---
commit f09729b87ec6a8e1dd741bb9d8987b1590909b19
Author: Fabio Estevam <festevam@gmail.com>

arm64: dts: rockchip: Remove invalid rk3566-bigtreetech-cb2 property

This commit removes the ti,rt-thr property from the rk3566-bigtreetech-cb2
device tree because it is undocumented.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi b/a=
rch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
> index b6cf03a7ba66b..542269c338daf 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
> @@ -569,7 +569,6 @@ tft_tp: touchscreen@48 {
>  		reg =3D <0x48>;
>  		status =3D "okay";
>  		ti,x-plate-ohms =3D <660>;
> -		ti,rt-thr =3D <3000>;

[Severity: Medium]
Should this property be corrected to ti,max-rt rather than being removed?

While ti,rt-thr is indeed invalid and ignored (falling back to the default
max resistance of 4095), deleting it entirely discards the board designer's
intended touchscreen resistance threshold (3000) instead of fixing the typo.

The tsc2007 driver documents ti,max-rt for this purpose, which would
preserve the configuration intent.

>  		ti,fuzzx =3D <32>;
>  		ti,fuzzy =3D <16>;
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721133408.4424=
0-1-festevam@gmail.com?part=3D1
