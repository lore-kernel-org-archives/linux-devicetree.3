Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B7B370AC6
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234520; cv=none; b=Wde5sszsu5SLihtnkw2bEcQEagdR6uMAwNTARfpG5AyXHHEfXRv758uDPeQq/2C4OOZG90REUVyHruzq9phe+t7f2ie159elgJBx67r3MpY2/9KsDL3FueyVzZ6YZbWOaiHxxirN6flfFozYebLc5Vh6VLpLkoX/LesRcMe2C3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234520; c=relaxed/simple;
	bh=7vaGEo6GyLu2pDQIQOiM/A68JL2okdc87HrR6FUaD58=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n32gaFz/IUDSpfKHdT61yT2YMcvd59c7Zq3Kj44mea1INPBj6ZJnvXrOtdtIPw1B3ICvzSfzfI2IzOKTpMGADm3S2sWF7zFWdzyq8OnfGZzC2DTcrhGBtOHR/gMpC+gtwQFU7JzY41w3XmSrBxxM3+XA58i0RQt6xN+HpVtxCr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TiyqeQwq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TiyqeQwq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3891F000FF;
	Thu, 24 Sep 2026 07:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790234518;
	bh=EGnrERugVJ2329F6Jcle2TkqVq1jTOlt4Mly3UBrjR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TiyqeQwq/a5XHuFWqBPzNJPHNsPHecii9tfUY1LHWWevuc3aAT6bDCNkDwMniI3pW
	 +/TNw1JF/yTgNJYFyIEMYZLQSrYfFUBeTFvyJVjOnj1n9j/KDooFktMLli7se1ppsB
	 QT2xmzOW8zh3r5wLIZMYKgRK/0GPyoy6AEQMkYAVWnvGbbRtgcAhw6VDM1+A34D+A2
	 sZFkzGIHyBElhNQK6xXb5gydHFcCn5GmqyEsQcMQvmikm23GchknYNRbAoImqIKlju
	 lf7IeGxD0vo7rblxd3kp9nUiYkqibx3Gb+R88x2WQ8CbI5b54W7EHnEpquvxdIcy6Y
	 mAdMzfxrweXNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa
 ROCK 3B
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Wermuth" <adam@wermuth.pl>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260924071445.441822-2-adam@wermuth.pl>
References: <20260924071445.441822-1-adam@wermuth.pl>
 <20260924071445.441822-2-adam@wermuth.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 07:21:58 +0000
Message-Id: <20260924072158.8E3891F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: false 5V VBUS dependency for M.2 WWAN slot
--

commit 87931f73c3a7da52681aaf73a831d1638bf48ff3
Author: Adam Wermuth <adam@wermuth.pl>

arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa ROCK 3B

This commit routes the USB 2.0 data lines of the M.2 B-key slot to USB2_HOS=
T3
by enabling the ehci/ohci controllers and the usb2phy1 host port, allowing
LTE modems and other modules to enumerate.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64=
/boot/dts/rockchip/rk3568-rock-3b.dts
> index 149a5306bb032..ad9a91c0d0d0e 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts

[ ... ]

> @@ -780,6 +788,11 @@ &usb2phy1 {
>  	status =3D "okay";
>  };
> =20
> +&usb2phy1_host {
> +	phy-supply =3D <&vcc5v0_usb_host>;

[Severity: Medium]
Does this create a false 5V VBUS dependency for the M.2 WWAN slot?

The M.2 specification dictates 3.3V power and no VBUS pin. By associating t=
he
5V external Type-A VBUS regulator (vcc5v0_usb_host) with the M.2 slot's PHY
here, the PHY core will automatically enable this regulator when initialize=
d.

Will this force the 5V rail to remain active as long as the M.2 LTE modem's
USB PHY is active, leading to unnecessary power consumption even when exter=
nal
ports are unused?

> +	status =3D "okay";
> +};
> +
>  &usb2phy1_otg {
>  	phy-supply =3D <&vcc5v0_usb_host>;
>  	status =3D "okay";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924071445.4418=
22-1-adam@wermuth.pl?part=3D1
