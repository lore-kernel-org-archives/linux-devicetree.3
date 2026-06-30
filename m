Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E542C0261
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 21:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853798; cv=none; b=Em5iG9KEHurMYZF3siDcULK5sHskLCM7D9/1eHas37k83Gm0U3pYOMpDawLLX3N6WtWvbGLWw/wn0g13hd9TiEowzVceV1tot+kNvvkvJFXB+fQb3pii2+cf5WB4ZJvevLexsr9lUQ0+hB1C0SJ8QD6eX214H9guFs9Yem1yZk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853798; c=relaxed/simple;
	bh=YxRzUHjO8jKxp6MYBQWAS4ZIikszFnbxYfm+tqBnmi8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hicWOgOqBJgDzfrD+G2lP7Ym88K27Kj7Ek/5QqNN52iTf6cag9Ye2cwZROS4WSCsu0JeqtN9prAPga0/1LMDN9PE6SC7b+Bdm8yEih6Q/w4d3fIHhshskPOEOewCtyXK0gdwVIi3FOmiRNJcERuJMKFvBnHJC05ENABa9aVO0PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDU3Zv8g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDU3Zv8g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5468C1F000E9;
	Tue, 30 Jun 2026 21:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782853796;
	bh=iRw/oK63ll8f4iuI1X4e6yPSft3W+STyP6gLfQnqjek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nDU3Zv8gZXdf0NezgqA5HCe6nHCyu5sdLckoEeCCbXEOQFaJhx5YGekYgwzpE7HLk
	 9Le/q9Nj9BUQp2sR1BUtOzTcEneo5RPeW0wYpuzi3k6dUcjUgQCWCNikhPFGkKyV8v
	 Ncs7lD8UlAvHdClYbxER3f+cqZ1v06F5IrJ07XkwRFubWRqvVyezcHeTpIGs8oKki9
	 aSwvfT2GDKRVtfk441fKarSc/5i3gW/0+Nmd8Yn9SzOAQ457RC/HLHtrvqepe5ydv9
	 6WX6iFme2CU7CE2gCt9V/aPWDIYmbQCVYziz/XGhrNSN6oMPwdOMjtSMDStGwDoABd
	 xCSsaGssIqJrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: broadcom: bcm2712: Add reboot modes
 to firmware node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260630-rpi-tryboot-v2-4-f68d2dc6aa27@linutronix.de>
References: <20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de>
 <20260630-rpi-tryboot-v2-4-f68d2dc6aa27@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 21:09:55 +0000
Message-Id: <20260630210956.5468C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free in devm_reboot_mode_unregister during driver unbind
- [High] Endianness bug in reboot mode magic value parsing
--

commit 29798275c02dc4226f698253632e8ea76033c96b
Author: Gregor Herburger <gregor.herburger@linutronix.de>

arm64: dts: broadcom: bcm2712: Add reboot modes to firmware node

The raspberry pi firmware driver allows the tryboot reboot mode. Add
this mode and normal boot mode to the node.

> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arc=
h/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> index b7a6bc34ae1ab..67095c7ff770d 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> @@ -49,6 +49,8 @@ firmware: rpi-firmware {
>  			compatible =3D "raspberrypi,bcm2835-firmware", "simple-mfd";
> =20
>  			mboxes =3D <&mailbox>;
> +			mode-normal =3D <0>;
> +			mode-tryboot =3D <1>;

[Severity: High]
This is a pre-existing issue, but enabling the reboot mode in the device
tree exposes a use-after-free during driver unbind.

The reboot mode is registered using devres, but is embedded in a manually
refcounted struct:

drivers/firmware/raspberrypi.c:rpi_firmware_probe() {
    ...
    fw->reboot_mode.dev =3D dev;
    fw->reboot_mode.write =3D rpi_firmware_reboot_mode_write;
    ret =3D devm_reboot_mode_register(dev, &fw->reboot_mode);
    ...
}

When the driver is unbound, rpi_firmware_remove() drops the final reference
to fw, freeing it before devres cleanup runs:

drivers/firmware/raspberrypi.c:rpi_firmware_remove() {
    ...
    rpi_firmware_put(fw);
    ...
}

Will this cause memory corruption when the driver core later invokes
devm_reboot_mode_release() and accesses &fw->reboot_mode?


[Severity: High]
This is a pre-existing issue, but does this feature work correctly on
big-endian kernels?

The CPU-endian magic variable is passed by reference to the hardware
communication layer without cpu_to_le32() conversion:

drivers/firmware/raspberrypi.c:rpi_firmware_reboot_mode_write() {
    ...
    if (magic)
        ret =3D rpi_firmware_property(fw, RPI_FIRMWARE_SET_REBOOT_FLAGS,
                                    &magic, sizeof(magic));
    ...
}

Since the reboot-mode framework parses the device tree property into a
CPU-endian unsigned int, passing it directly to rpi_firmware_property() will
send the wrong value to the little-endian VideoCore firmware.

Should magic be converted to little-endian before it is sent to the firmwar=
e?

> =20
>  			firmware_clocks: clocks {
>  				compatible =3D "raspberrypi,firmware-clocks";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-rpi-tryboo=
t-v2-0-f68d2dc6aa27@linutronix.de?part=3D4
