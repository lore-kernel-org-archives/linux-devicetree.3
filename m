Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590176;
	b=zTV/hkX8w6br9AUuS0v+7kKgsFlOp2xYWu8wNDG2dPZHlm0Cj5q2AuFI/RwayIVV8GrY
	 JXDTqtYjvhnOw3ytOhzyrppdTHw0OzL8pITgE0Ikv8vEhV7kkEotNO6mskZQGb0quKa/i
	 2xpnO/ffd5Wlc8qyTvGamWHMFIzIO0yBwTWPGDRyMgJXmWmy8NOXkVY9gFiPqM6yic912
	 RxTyKuozG+GCDbRqSiNbkITehMKw20zLso55nNTwG13Dmu6pYz7sgb0cW0LiHy+tsH83n
	 9QYAyZiuJGZiqxhpm2vT7t9A45lqsutNr8ssN4sZTmukQx9/bfb4YfgKZP85Caw2VTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590176;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=630ZcaqByTv+QEWkHoMi/EEkqaHMDXg9RV3gjffuefs=;
	b=aiJaBJc8HzQOPPHdqVJdwePgLc/Xz5mA12gRB5AnxzspzR8uVfU3D6GanpZHTWYY/XLN
	 jiNUHonZSg5RHF15LVMtHu2Q7PYGq8peulZ3IZwZ10Xxyx4zU8C1hesoLNASRENAz6DXR
	 ocHn7GcfI8CYee0AuIv+vDJ6vlKocoNdEglcWlXKiojtpIQXdTp7luwdRgc1ga6WAU55j
	 kCrStS4D7hW6vnOXIwh2v2+gH16BO5oTSUPaRtMWXU0d0N8orvTOwPZf6CTarFOZH51/p
	 7B80xYN5+Hjlo7TyC9YVjotFtY7SgQKDVVJ/NofNkxTVY+2abQRwR2Ti9nj+LN062jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLJYUZzG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19E460703F8
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 17:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLJYUZzG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082EE1F000C8;
	Fri, 13 Nov 2026 17:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794590176;
	bh=630ZcaqByTv+QEWkHoMi/EEkqaHMDXg9RV3gjffuefs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jLJYUZzGnaW+togi/UqdCtgeTd42PJ94j4iTX0+jvtE3sFPRMTr5VujoyUUDaI82w
	 lih5fjtelXQAX7laad05YpvLEHnCNKpwaTUO1uRwQ6MaRPEvY4H7LIhHeTqI6cTiKB
	 AMuIfWOd9BIVQ/moT1/rEkVArwrRGsvB3JH3vl3LJkwyoglDE747N0ch7zqJcI2mjg
	 6IGDRZHyWRDuWNJjVNSJGFZ30HxnEbZaqHuob1lFlqaRGUeLs97Y7cmKfYEZuJh1hP
	 rjdy3YVnDNZlMFzBVGAUWfouvH5xHzoHe3DRUF4ZcnC41Rx+P69rkgjabtmFqbj75Z
	 jbFLTxrgOwAlQ==
Message-ID: <sashiko-outbox-213289@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: mediatek: Add MT8173 Amazon suez
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-3-d3b8865fa50f@gmail.com>
References: <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com>
 <20261113-rbrue-suez-upstreaming-amazon-suez-dts-v2-3-d3b8865fa50f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 17:16:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: mediatek: undocumented mediatek,mt8173-keypad
  compatible enabled
--

commit 2503b241917cd19d3cef775979876bb2182fbb3e
Author: Ryan Brue <ryanbrue.dev@gmail.com>

arm64: dts: mediatek: Add MT8173 Amazon suez

This commit adds a device tree for the MT8173-based Amazon Fire HD 10
(2017) tablet (codename suez).

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts b/arch/a=
rm64/boot/dts/mediatek/mt8173-amazon-suez.dts
> new file mode 100644
> index 0000000000000..042b41e7d5675
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts

[ ... ]

> +&keyboard {
> +	/* Each key is reported in all eight rows of its column */
> +	keypad,num-rows =3D <8>;
> +	keypad,num-columns =3D <9>;
> +	linux,keymap =3D <MATRIX_KEY(0, 0, KEY_VOLUMEUP)
> +			MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)>;
> +	debounce-delay-ms =3D <32>;
> +	wakeup-source;
> +	status =3D "okay";
> +};

[Severity: Low]
Does enabling &keyboard cause make dtbs_check to fail on
mt8173-amazon-suez.dtb?

The keyboard@10010000 node in arch/arm64/boot/dts/mediatek/mt8173.dtsi sets
compatible =3D "mediatek,mt8173-keypad", "mediatek,mt6779-keypad", and
"mediatek,mt8173-keypad" is not listed in
Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-rbrue-suez=
-upstreaming-amazon-suez-dts-v2-0-d3b8865fa50f@gmail.com?part=3D3
