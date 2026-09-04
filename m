Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F27038E8AB
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 23:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788563007; cv=none; b=NzFtxEUbjtDeNoXaY0WpFXgqwDkoovMYmnN45r/OyVrcIkh+L0/FgXDuqhZI2Rr7Ml1i8e4xjjtyU2TM+N0EBSW9R3rkBSEniA7xTHcwk2Jrfp5RYD/WikTRT7ctwjbS+FYOPo3Zh5O0OZvCdwrvBbvkig6Ug0gdKaZQrNkrIpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788563007; c=relaxed/simple;
	bh=e2iQHPFXzzYM04k3LYqS1KSzSbf27khzvAjDbqDE9JM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mfZkOthOvkMKDa02f0i6eV9mbXcqQB9Zarp3+ZaEb6rRujThhwWdUwlh0q1vbtwqpnAJLIo5Yk5LIKp9I3AwaEmpAzW39xrxjm9PiJr7o1XVoA5nAX/U6ENDbEgvQYiiUVr5UVX1xE4TBOzO4U2ez9+b79K2JemmAPHpbhjoV7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9XHE5bm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9XHE5bm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB291F00A3D;
	Fri,  4 Sep 2026 23:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788563006;
	bh=A8JAS0NlVf6A+PFS2P1gkRIvfuwh3zxuNeKUhhw86lg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m9XHE5bmBSXE0bDxpotDVnrGHZuRKkx22QJqw4QzuV8InVFpFuPmUa0DEkkW3fv8C
	 QJ3JHdwrBLrPeo4of+1Vr4DgucsiH/KUEqdchtLTQDfIBG5dbJ7ImT3VQelFDgxkWE
	 1fjOaSRX80NGWxMCfjX/QgFaIBX+ma5ACGo/b7EDtc6y91q69RSFRasgLgtcw8VBV2
	 4HY5+OsLi0kZHatGFNY52nfOr42AM7qsAJKrrt3r83c3mtX0eZeYWY4H/MENmSyAJc
	 9+vkYjzL0yZrRNhEVZQAjG7c+jCKitvje4SQjXnWhPZnbEAfhZ7Nu7W7jZ9rJQjdwS
	 dM+NWOVZ3Zt9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: mediatek: Add #{address,size}-cells to
 Chromium-based /firmware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Brian Norris" <briannorris@chromium.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260904155621.v2.1.I33d1d66d4724587a981f706243cdc2f264670a40@changeid>
References: <20260904155621.v2.1.I33d1d66d4724587a981f706243cdc2f264670a40@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 23:03:25 +0000
Message-Id: <20260904230325.CBB291F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing '=3D' in property assignments for #address-cells and #size-=
cells causes a build failure.
--

commit 32a566c4dedbeab82eeb3c544e3cf871695f6990
Author: Brian Norris <briannorris@chromium.org>

arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based /firmware

This commit adds #address-cells and #size-cells properties to the /firmware
node in various Chromium-based MediaTek device trees. This fixes a probe
failure for coreboot_table introduced by requiring #address-cells for
translating non-translatable addresses.

Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/

> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8183-kukui.dtsi
> index 69cab9f9c5308..fa359440ed60e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -22,6 +22,11 @@ chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> =20
> +	firmware {
> +		#address-cells <2>;
> +		#size-cells <2>;

[Severity: Low]
Are the '=3D' signs missing from these property assignments? Omitting them
typically causes a parsing syntax error in dtc, which will break the
make dtbs build for the mt8183-kukui platform.

> +	};
> +
>  	backlight_lcd0: backlight_lcd0 {
>  		compatible =3D "pwm-backlight";
>  		pwms =3D <&pwm0 0 500000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904155621.v2.1=
.I33d1d66d4724587a981f706243cdc2f264670a40@changeid?part=3D1
