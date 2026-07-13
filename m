Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996263769FE
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940919; cv=none; b=T5+QT1gV8QfApvGOi+Zhaer6l4TLsrvEWUltwGRJ4OSeqhEUZW7yLKv+tc0C52QFti3ALyTxZG9OGItbFbQVnl0q/TDDzKDlfNopAe8vMELb9kbjgAYaxKY2Lt9IHPQAxj3RvwuqPmjTGFIkIX1NAZP91iodmtN+AV9ysLK3o1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940919; c=relaxed/simple;
	bh=by+MwEPQqTlLCS7iJO0PZb3i613G1nqvs6vP9p3Z4v8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uJLdOLPGWZ8RmDfqs0s9iT2SMq0kegCq9xlyMJXWcP0FREZB+hLxSLOmT7h9DTmvwf2jX6z0t0baCM+jWj4TZy4tpGFADZh6SmtA89C7Xc11vP6Xy33riRj/tttNF6ogDfVgcVNu6pRGVjno2gksytYvQB7iTtUbtE9Eo8VfL24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+sVLDbo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+sVLDbo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295471F00A3A;
	Mon, 13 Jul 2026 11:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783940918;
	bh=eGy6apbUIEeXVGXAwlgKW7wAM6uglNzH7WfsNa6UpC8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D+sVLDboHdrj3Dj3/W4N7QEc1XpOuaSe6WN4UNoprQpbvJqtnJKQkQj5h965/+iAp
	 5ucKbtVhNqakNM0I/eFRUUDFb7SUqPDs4uAWPFm65emvnkMJTARdP4/9G2F+sy0xDd
	 UluHxunfN5ZFzARZjUyxpFpLfXCIPkX0RHSHDZeh87n5FjXNPFAnz/X8BRqGdPdhBN
	 FUOsmO0b+HB5iR06wUsoLlqSeQ6YtE+d8NdEDeeVk/ZknkFrIMxNDydI2GupDYTEET
	 YM27ng1KCjNoqej/YAreQ0wkPma5UtviBxGkG0qNm+5uxzIIisDMNhPipQz8a61G26
	 tiWNvxHqRVYOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/8] ARM: dts: mstar: unitv2: Add regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Palmer" <daniel@thingy.jp>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260713105950.1346962-3-daniel@thingy.jp>
References: <20260713105950.1346962-1-daniel@thingy.jp>
 <20260713105950.1346962-3-daniel@thingy.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 11:08:37 +0000
Message-Id: <20260713110838.295471F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `enable-active-high` property in `reg_vcc_wifi` causes t=
he gpiolib core to forcefully invert its GPIO polarity to active-low.
--

--- Patch [2]: [PATCH 2/8] ARM: dts: mstar: unitv2: Add regulators ---
commit 45b1e50aa0d58e3444d010d9375cea0bd438d0d9
Author: Daniel Palmer <daniel@0x0f.com>
ARM: dts: mstar: unitv2: Add regulators

This commit adds fixed regulators for the core, IO, and DRAM voltage rails.
It also introduces a GPIO-controlled switch that supplies the WiFi chip.

> diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.=
dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
> --- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
> +++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-unitv2.dts
[ ... ]
> +	reg_vcc_wifi: regulator-vcc-wifi {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_wifi";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&gpio SSD20XD_GPIO_GPIO14 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Will the gpiolib core force this GPIO to active-low polarity?

Due to a legacy quirk for regulator-fixed nodes in the gpiolib core, the
GPIO_ACTIVE_HIGH flag in the phandle is ignored in favor of the boolean
enable-active-high property. Without the enable-active-high property present
here, will the WiFi chip receive inverted power control and fail to operate?

> +	};
>  };
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713105950.1346=
962-1-daniel@thingy.jp?part=3D2
