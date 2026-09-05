Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DCC1632E7
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 09:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601188; cv=none; b=XHEqyLbNaQXI4Bdb3l2JzXEn9Zn0QsNhbxAiBxzOTWM75+MpDwkuj0hV8F5f4ZudEh8Y/ksIG8Bb2Jfs3QzZfw8EL1Sv8aBKGZrlxRU9d8HyUzuwHLCGXLOh/FCxTuwjq9wy6cPY/itoVxQ8r3PjBoUveCb2E3zCpzk79nPV4zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601188; c=relaxed/simple;
	bh=Ej/JypM63uUcOAWLLrFHIg6WxEtayBaGgtShp/V8tg0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=otskwnLEBy21YiNJ8bvw4Oxg1qQAIqR9UcwCfF6ZUTDP6lKJhvYUFehEOheUcBEWGaPNhOHis4l8y0o1/lKibBUrsbljNIWsZYnyj6SYszzJKsQjSmi1r6oKE5nFT5SMB8tTgGYHOwq8FVubqb2h8DD0VsscVy5KjQ9jpdJy4/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQx7cMFD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQx7cMFD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555901F00A3D;
	Sat,  5 Sep 2026 09:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788601185;
	bh=jMMHj2KEO91Qx8V8Ju+03UpBzGK2Y2JINFC51avGEy4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AQx7cMFDD3xDzEQQzVTaRSfx1lH7jc4DNipa0zlfckuoSUxKIjPvRTiKqBF6C2ae4
	 53yO3+1qWkehmmDr0Vmv6i1WkKXQDoox/t046BZDfLqHPM0S1c8EETH+4JVTcMv+Lp
	 n4eOA5K6NSte4rd/PAewtrOVIaMJOE3cGY4CPZXnboNTt4dpF+d1p7rN55gmlcLpLR
	 0uXIFS8QyCmm2RZfikx4bEIS4ZfmYMLXl31oa9VtUnIr+xd19inK4bHYkCY+sz3v2t
	 n8Ap/bqYUFHNdr4aB4jFmYElY1h6i2sAN7tWpUMkREuTk5CDFDN5Vth3huna50DVvG
	 54qgJ8zBIXwGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: ideacentre-mini: Drop the unused
 USB MP port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jens Glathe" <jens.glathe@oldschoolsolutions.biz>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-7-9a87882973bb@oldschoolsolutions.biz>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-7-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 09:39:44 +0000
Message-Id: <20260905093945.555901F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete removal of the second USB MP port leaves unused inter=
rupts in the device tree, causing dwc3-qcom to incorrectly detect 2 ports.
--

commit 60ea82fd4a9cce2b2f56bfccffd8337ca1f4e46b
Author: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

arm64: dts: qcom: ideacentre-mini: Drop the unused USB MP port

This commit drops the unused USB MP port by removing its repeater, reset
pin, and second MP PHYs from the device tree. It also pins the controller
to only use the first set of PHYs to avoid claiming empty PHYs.

> diff --git a/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.d=
tsi b/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
> index 5a2db91d5e587..b720622c5d90e 100644
> --- a/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
[ ... ]
> @@ -1184,6 +1163,9 @@ usb_1_ss2_qmpphy_out_dp: endpoint@0 {
> =20
>  &usb_mp {
>  	status =3D "okay";
> +
> +	phys =3D <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
> +	phy-names =3D "usb2-0", "usb3-0";

[Severity: Medium]
Since the dwc3-qcom driver determines the number of active ports by counting
the dp_hs_phy_%d interrupts defined in the device tree, will this incomplete
override cause the driver to still detect two ports?

Because the interrupts-extended and interrupt-names properties inherited fr=
om
the base SoC dtsi are not overridden here, dp_hs_phy_2 and the other
second-port interrupts remain present.

During system suspend, could this lead to dwc3_qcom_suspend() polling the
unpopulated PHY and mistakenly enabling wakeup interrupts for the missing
port's floating lines? This might cause spurious wakeups or interrupt storms
that prevent deep sleep. Should the interrupt properties be overridden here
as well to drop the second port's interrupts?

>  };
> =20
>  &usb_mp_hsphy0 {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905-x1-ideacen=
tre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz?part=3D7
