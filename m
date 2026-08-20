Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1127A2E7F17
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 22:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787264133; cv=none; b=gNfEuj2g1U8cmnMYkLQrrjvjicFPAm7YMBYmPI3KFOfCmQ3VV/Y2Htp840J0i/Iq4KzidhQ/lQOcUZ8Qjdne5PQmpuq+Hnr2SJlCpTGyx0zKV1ZobfXd9lgzl2+tzXHUYGa9kPnkfTG9McByEAd8cwQXNNhjAr/IAZZkQsa4cVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787264133; c=relaxed/simple;
	bh=hDIw4T09Z0SDjmEMm+bRycRTjn9tjESO74Rt7uiSUho=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CedIrJivnXyChyBMeT5JFLoIYOoKjfyoKCEOH7NwfrXXtJ44kESBxnd8ZGN7WdRy41fzqlm7dd1K+yGP7uD2OtGTKRSIJBqFPgZUghMF6cNgklXozTTRUhYclYHohd+VKqrdMZH6ELbWuZiLonAKkI9AASvi6ZZDIrLUoSVbQyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bR4sc5EB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bR4sc5EB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5773E1F000E9;
	Thu, 20 Aug 2026 22:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787264131;
	bh=aia50rx8ieo50GPBGH3o39btDXBl9Mcja2h78bCquDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bR4sc5EB0iO/9x18mZxKGUrPqFLKaoKaQ5T1jnZbJa1Pl9CL5WkKWLlqQBGjeobQF
	 9otNRb2mMhbxNftYdE1oom9QU4gO+VxIEuVtmjydtyijGvnsWeuiaBcc1GEtNM0ytT
	 xO8er9NAdDUzI8v+L7dsHTMvNRsfkV4nMpYe1NjuG5cPjlBCfu4gsRvCcfdquXsgl3
	 pd5IKgOnE/yX/pviBeF9spsqBQcaqjaEyyoiUZuabZ+ChEzfv2Pgl2lkIQiZjd1EK/
	 W/Ayp9CHWJn5QxaJNbEpe59SfMffjh5nMbB/mIa+msqZbVfvjRSpeKT3Xuxhlp1noa
	 d2Uo0OU9YDlzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-am62-lp-sk: add out-band-wakeup
 property to m_can devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kendall Willis" <k-willis@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260820-smth-v1-1-e1738a38d58e@ti.com>
References: <20260820-smth-v1-0-e1738a38d58e@ti.com>
 <20260820-smth-v1-1-e1738a38d58e@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 22:15:30 +0000
Message-Id: <20260820221531.5773E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `out-band-wakeup` property is added to the device tree but i=
s completely ignored by the kernel because no driver or core code parses it.
--

--- Patch [1]: [PATCH 1/4] arm64: dts: ti: k3-am62-lp-sk: add out-band-wake=
up property to m_can devices ---
commit 74f82c5ded5daaf7cf6527a753badc1049e2cd79
Author: Kendall Willis <k-willis@ti.com>

arm64: dts: ti: k3-am62-lp-sk: add out-band-wakeup property to m_can devices

This commit adds the out-band-wakeup property to the mcu_mcan0 and
mcu_mcan1 nodes in the k3-am62-lp-sk device tree. The commit message states
this allows the out_band_wakeup flag to be enabled during suspend for m_can
devices.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/d=
ts/ti/k3-am62-lp-sk.dts
> index dfd65c00f5b95..011f2f3703755 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> @@ -283,6 +283,7 @@ &gpmc0 {
>  };
> =20
>  &mcu_mcan0 {
> +	out-band-wakeup;

[Severity: Medium]
Is this property parsed anywhere in the kernel?

Looking at the kernel code, there doesn't appear to be any driver or core
code that reads the out-band-wakeup property, nor does it seem to be defined
in any device tree bindings.

Without a driver (such as m_can) parsing this property and setting the flag,
the intended wakeup functionality from deep low power states will fail to
operate.

Are there missing driver changes that should accompany this device tree
modification to actually enable this feature?

>  	pinctrl-names =3D "default", "wakeup";
>  	pinctrl-0 =3D <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default=
>;
>  	pinctrl-1 =3D <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
> @@ -294,6 +295,7 @@ &mcu_mcan0 {
>  };
> =20
>  &mcu_mcan1 {
> +	out-band-wakeup;
>  	pinctrl-names =3D "default", "wakeup";
>  	pinctrl-0 =3D <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default=
>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-smth-v1-0-=
e1738a38d58e@ti.com?part=3D1
