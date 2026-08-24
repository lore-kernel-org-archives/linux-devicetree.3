Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F1C19E7F7
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558898; cv=none; b=EFzphr68dvgtS4BBj+yPR4a6d3w8NeJtrkGwxPB3Cm37Wmwkx2qiQTB15XWtamMz03UiDl5cjdpL4HOGHMX/Eep2bxAgReOTgM8sD3OXjccRBZnFccQcILZv0nMw6eCvMie8HUQ5ExukVUrlRyMTfz59Im9OA9xXhZS5B2K/830=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558898; c=relaxed/simple;
	bh=vtQS7veMS8oodFuxGI48LkXhYqFkcx8X6rc8okKISes=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UzuUmiqU/OMXY1NYJU91013YL+N+sq0Ylio//lrZnneLUZPgF8gu8rvg3GUnrzR9nwpbD+Hy9/I6Y7dnNp7SJIY/oBnFDyESq9enzD/u7go1nsJSkwHLUqh9GxJAPN8QbmeXtv8zcyhG9FFc6LnoisxRIU3IKX6hTicZvH7m30I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O40kFkzh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O40kFkzh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2356E1F000E9;
	Mon, 24 Aug 2026 08:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787558896;
	bh=LopnHwcuhYdKx8mtKDkpKL6jjLv/9THTIT9QmLzm2Kg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O40kFkzhN4oQHqd5tcE/uu/Wh1lNVLNVgqUJz3ZuMUzsFklJhS9kVmx3WvbRGLG+w
	 uJRmieUL+aYhsJ6A9PCSIrrOQ1Sj+uxwrJq1PzBM3icgDJZrwx4zixbOZQFpQZVOOR
	 sGkxgnyE4P/cHraBryWUwNrBkMMKkmRVR6u1L7QV8I5juxUB/p7JwjaIZyJsktwzSm
	 zCPKK3w0wU95+PSHPGaG12DayYs+V7XhoOyTBPOi4hmOk4IAoHiZo8jIfPenhsD6UB
	 Psd4mSFNgCckIsEPOOuwGzssXvjtV1G6W/4o46VqlvZed9ZUXzfGVdrpIe9adEqGw+
	 yxIweNMvZ9dqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824075936.2904336-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260824075936.2904336-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 08:08:15 +0000
Message-Id: <20260824080816.2356E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `rtc0` alias is inserted out of alphabetical order.
--

--- Patch [3]: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC s=
upport ---
commit 4c031325b18a88190b2540d40329c1e40cc8033e
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support
   =20
Enable RTC support on RZ/T2H and RZ/N2H EVKs.

> diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch=
/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> index e86e6d3aa8a34..add0718f98dcd 100644
> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -21,6 +21,7 @@ aliases {
>  		mmc0 =3D &sdhi0;
>  		mmc1 =3D &sdhi1;
>  		serial0 =3D &sci0;
> +		rtc0 =3D &rtc0;

[Severity: Low]
This isn't a bug, but should the rtc0 alias be placed before serial0 to
maintain strict alphabetical ordering in the aliases node?

>  		spi0 =3D &xspi0;
>  		spi1 =3D &xspi1;
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824075936.2904=
336-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D3
