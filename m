Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362BD3E3C62
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 07:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459862; cv=none; b=R6bBz7DO+FPQOXA+KlS8Ds/M76GW9E9mK1G/P+d7/SG9WAgOpOoPBcqPR+JN5GPUdJQK7PES32w85IBcFtgvNIOQ84I2aSNcxWBPGUlaNdjPZKWpxgadbmt+F/vKWSq3xnK7sP2hMrbe21u83lwUS9kFjsCGgkpzdUsngqio/5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459862; c=relaxed/simple;
	bh=MrE0YpDWB1rSNlwoSvXlRFBX/3x2/X3wnJR7nMmVLEg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lxLHBz/A3k6f9eDInkLQC3NYdD/8UkDe66QuSvZF4Ro5VssQQo3Kadhg5u5NUb6SuGOrNfIYZ4tnWLQiHH4lmC+N2dWY5RpVdNKrrYeDFLv1bmZPMa+Af5ZOq6Wre3/QECcz8H+y7VLY0nR4Gm2kMAHSa2FmGZvcZKoYb7+/nRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ntg9w0Na; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ntg9w0Na"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA031F00A3A;
	Fri, 26 Jun 2026 07:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782459860;
	bh=HCTIOL64YvumjJBw6F4J2kcfjSDWTEAWZj/K63o+jj0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ntg9w0NaahbqZqukaIhhKa9vzBh6do4uHbHnZNaLgBoZNlOKa2JHBE8CHk8bjCk1Y
	 O9DxWX2f/YMLGVm+IAm3UzI4B3jpabd+ytOtJvBkCFzwks4KG9fsE8Ak7HjMm58t+h
	 /hD+I/ZSzMaDmqH9T4GdRpnh6L1SNYBqMb4ooGJfEg0V7VLxk1/dd6BOM0D+gLgqrN
	 l+846EiJeXLpQGCfwBS7MKLFF1qfqbfC3x0VcGcdPoUTLxnhlOz93mmKtRb4ea5bhu
	 ZEzdNhNuB+WKzRm/NM4sF/vkVykOB7SUMITdu3JprQSU7T4cO1b2e5nxlCHR/bU0WL
	 PwhO11csG6IGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: broadcom: bcm2712: Add reboot modes to
 firmware node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260626-rpi-tryboot-v1-4-490b1c4c4970@linutronix.de>
References: <20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de>
 <20260626-rpi-tryboot-v1-4-490b1c4c4970@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 07:44:20 +0000
Message-Id: <20260626074420.8EA031F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Adding `mode-*` properties activates a dormant Use-After-Free =
and Double-Free vulnerability in the driver's unbind path.
--

commit cd92f6ce5b48afd036127289b2412bed6be015fc
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

[Severity: Critical]
This is a pre-existing issue, but does adding these properties to the
device tree activate a dormant use-after-free and double-free vulnerability
in the driver's unbind path?

Looking at drivers/firmware/raspberrypi.c, the driver registers the reboot
mode using the devm variant during probe, but also manually unregisters it
during remove:

drivers/firmware/raspberrypi.c:rpi_firmware_remove() {
    ...
    reboot_mode_unregister(&fw->reboot_mode);
    rpi_firmware_put(fw);
    ...
}

The call to rpi_firmware_put() drops the reference and frees the fw object.

Because devm_reboot_mode_register() was used during probe, the devres clean=
up
will eventually run devm_reboot_mode_release() which calls
reboot_mode_unregister() a second time. This passes the now-freed
fw->reboot_mode pointer.

Furthermore, the list strings are freed during the first unregister call:

drivers/power/reset/reboot-mode.c:reboot_mode_unregister() {
    ...
    list_for_each_entry(info, &reboot->head, list)
        kfree_const(info->mode);
    ...
}

Because the list pointers are not cleared and the list elements are preserv=
ed,
the second unregister call will iterate over the list again. Since this pat=
ch
populates that list by adding mode-normal and mode-tryboot, the second call
will try to free the already-freed info->mode pointers.

Should the manual reboot_mode_unregister() call be removed from
rpi_firmware_remove() before adding these device tree properties?

> =20
>  			firmware_clocks: clocks {
>  				compatible =3D "raspberrypi,firmware-clocks";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626-rpi-tryboo=
t-v1-0-490b1c4c4970@linutronix.de?part=3D4
