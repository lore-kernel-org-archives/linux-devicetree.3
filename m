Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC383BB4A
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 22:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787004306; cv=none; b=oUxcjFGFyh5dGchIwp2mjb50EcoaX4kRi0xvAzoiXqnlOb405UCyk4Q8wwTPT7H3ipXvZGzD9J5L96yzDjp3OCfg6HGWumbzbV7Oy6sqogifP89VR3VtlPSxU0aa2curCYgrqfRpU0G/t0dbOtm6WXfMIT57CJEj92m1UtpTdwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787004306; c=relaxed/simple;
	bh=fEAORXYFpBb82DSpe2v2exXM24dMnjIpPL3anQEtakE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dO9UPuyJZLJI0TCBmd/QPC/Y5MQHVbuGHRBrkKhgK5OutXRInphJFIgeHDzfTq5iiS/uoqZ1N9KxiG+f7ijTzbu+275pR8OQO76SSmu8f09MQAn05Wh+ROyVdF2lOGt2qEszWt2S+3UbeM4GhQuNueuQZOLk2icWGP5Lubx3W1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJyiEfzC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJyiEfzC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4674D1F000E9;
	Mon, 17 Aug 2026 22:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787004304;
	bh=KYUO5//Afl8PxtCln39S2yXHOIt3rgTugizbOoiD/ec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WJyiEfzCW2VAh7cqoha+1O9gmrWOAv1m+DxlwcqIWlW16i9t8zm+YP7gKgKfk6Miy
	 oFRUcY9lw0YqmXC6rQsTbBSbXltUyf6DkadMpYiPZZtiZhV2B7wcNeIm+12JGkCXPo
	 NBeEtrGSE69UOpPnOy1g5oW36LainvbLMPGPr6JJCEeGB9Jrc8N7JTw/G93/jeh8f/
	 VeaffE9iValsRxXMb27m50TC3MwZ1k0UzIh9dkLZ5S8J6QbuW5Pt1t7SMkjxMeE6Og
	 G2CmWpsX7U1OGuVWck6oHvKxrQnEONYmQRQLgoF7n/HtLmhCZSPdGF6fw+1KWJCg5W
	 ylITcerwS1dqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] ARM: dts: armada: WRT3200ACM: add
 marvell,ignore-regulatory-hint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Georgi Valkov" <gvalkov@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817215428.84740-2-gvalkov@gmail.com>
References: <CADOrJmbTyrGGkq+9OJDXCgTa2HvNo8BWxoE6yjafcrOq7WNamw@mail.gmail.com>
 <20260817215428.84740-1-gvalkov@gmail.com>
 <20260817215428.84740-2-gvalkov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 22:05:03 +0000
Message-Id: <20260817220504.4674D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit adds the device tree property `marvell,ignore-regulat=
ory-hint` to the WRT3200ACM DTS, but the corresponding parser and logic in =
the `mwifiex` driver is missing from the tree.
--

--- Patch [2]: [PATCH v5 2/3] ARM: dts: armada: WRT3200ACM: add marvell,ign=
ore-regulatory-hint ---
commit f221d0ed898a6646fd79f05bc58d44fefe8c2296
Author: Georgi Valkov <gvalkov@gmail.com>

ARM: dts: armada: WRT3200ACM: add marvell,ignore-regulatory-hint

This commit adds the marvell,ignore-regulatory-hint property to the WRT3200=
ACM
device tree. The property signals the mwifiex driver to ignore an incorrect
regulatory hint from the ROM, allowing userspace to set the correct platform
regulatory domain.

> diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arc=
h/arm/boot/dts/marvell/armada-385-linksys-rango.dts
> index 4ab45f294de22..b93c5c419962f 100644
> --- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
> +++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
> @@ -165,6 +165,15 @@ &sdhci {
>  	wp-inverted;
>  	bus-width =3D <8>;
>  	status =3D "okay";
> +
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	wifi@1 {
> +		compatible =3D "marvell,sd8897";
> +		reg =3D <1>;
> +		marvell,ignore-regulatory-hint;

[Severity: Medium]
Is the corresponding parser and logic for this property missing from the ke=
rnel
tree?

It doesn't appear there is any support for the marvell,ignore-regulatory-hi=
nt
property added to wifi@1 in the mainline mwifiex driver. Since the property=
 is
not parsed anywhere, the regulatory conflict won't be resolved and the 5 GHz
radio will remain restricted when booting with this device tree.

Are there plans to send a companion patch to the wireless tree to actually
implement this feature?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817215428.8474=
0-1-gvalkov@gmail.com?part=3D2
