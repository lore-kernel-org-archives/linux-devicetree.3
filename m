Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800BB3F9264
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963578; cv=none; b=RNKlj8XaW+tkrNdSHVeULfj9xqvfL/ENO6CSDkKFWvXPG/LXVTQ+1587mdRqKQeKjOmanRGJcoj/0RCjDUx9b+fmA5qgaMtlFrxaG8dMu2pqU9YFUHDZjrIngSF+OSBm4y+gUbpU2f+SLevOy2Hl0R8HwY3Nafgq6HYD0tDphZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963578; c=relaxed/simple;
	bh=A0wlTP5QirkVj1vVjgUQYgtxYdB1Mlt/9owHmgmdwgs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DAl65xE4DOiiC7BF2jdZLF5kqvjh3aHtLjQeAioCwP7W9zZHtFqKE2Km+sIW1CvBgwtIp9fEuozyxdRSmFhaom5SKw4TINNvH6OKbFpLN3TXfeqiTE5/aR9K6rdER4GlVTqkI8I6yws67oS4HCaEXShPSZw5nymC6onr53fxd3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsWX3Mp1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsWX3Mp1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4631F000E9;
	Mon, 17 Aug 2026 10:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786963575;
	bh=moOTgpGYf9tmFtLGoS7eW4pqiPbnIk0zZaJGnNZaVRU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jsWX3Mp10NnVKVDH97NjHzjMhicAWCS4nio5I81UVY2b3CKPT67AaXjIl6pjQC/Zh
	 qwJU3ZPUrQ94EU7y77bFcuBmuNRfgdneMHbz3m4jyos9qicNPp3/wwR7apHjFs1fxi
	 pBRvj3LdXYlbLkeH+eoQx3TTYOkt9tVtPQ/BRkgk100IO6UMaJ93O87CzBlbvkAVSn
	 hOsQSo9MzW22ltTEasMrHvG0CNk4K8KSh8YLsSCRf56JwdKdX81T+jgcdQ3AzvRHSe
	 08z0YL1g5vkvBE2Fdv56x3+p9JoBaURlH5Ct9AO51CM5cqKltNiqWzB0qnjPn94WOB
	 w/qkuUfg600tw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable
 GPIOs on CN12
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260817103255.49565-2-wsa+renesas@sang-engineering.com>
References: <20260817103255.49565-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 10:46:14 +0000
Message-Id: <20260817104615.3D4631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `pinctrl-0` and `pinctrl-names` properties are incorrectly p=
laced in the `&gpio2b` child port node instead of the parent `&gpio2` contr=
oller node, causing the pinmux configuration to be completely ignored at ru=
ntime.
--

--- Patch [1]: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable =
GPIOs on CN12 ---
commit 36b1187107fd9570845145160bae9fb449b21c31
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>

ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable GPIOs on CN12

This commit enables GPIOs on CN12 for the RZN1D400 evaluation board. It adds
the pinmux configurations for the CN12 pins and assigns them to the gpio2b
node.

> diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/a=
rm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> index 97a339b30d764..e5bff296ea4a9 100644
> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> @@ -53,6 +53,11 @@ led@1 {
>  	};
>  };
> =20
> +&gpio2b {
> +	pinctrl-0 =3D <&pins_cn12>;
> +	pinctrl-names =3D "default";
> +};

[Severity: Medium]
Will these pinctrl properties be ignored here?

The Linux device core parses devicetree pinctrl properties by calling
pinctrl_bind_pins() strictly during driver probing. Since the gpio-dwapb
driver binds to the parent gpio2 controller node, the child port nodes like
gpio2b are never probed as independent platform devices.=20

Because gpio2b bypasses the probe path, the pinctrl core will not process
these properties, leaving the pins unconfigured. Should these pinctrl
properties be placed in the parent &gpio2 node instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817103255.4956=
5-2-wsa+renesas@sang-engineering.com?part=3D1
