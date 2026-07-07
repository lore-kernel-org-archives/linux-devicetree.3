Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9DA42A7A4
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 14:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435204; cv=none; b=XC3S/EmYCyp+e6rxqhV417WIr6CY1C0jH7pph3yuw7Z3UiaFnCIhQyccNEO2jPkZ+42oyAWme79lU2Hh1qSdSIkHdPrlAqinRd4XVzNisnryV8WfnUsqn413ioKeiET1dptDRViijIyZjrZQugGUF2fuIHMR2a9dSUqMfqIdiyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435204; c=relaxed/simple;
	bh=13/M1txX3R5/+mbASE9Xcj2uS5VW2cVt6Pe8o4ojgvg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SnmakLTdCNFcQotJbYg/VD8j6SXok+iaEEYZRlRGvBJBUgAB/c00h88KlIKB8Mi+NoFb+prQDx4tGCwHoRJuKB0/NxxCqyybcISV0jUyYQTYf1lrlAYyGCpr78rYKgu1PYIiXrs4q/mLfZoEoxftXV56e6RCPQJyxoe89pMa/WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AzEywunZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzEywunZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F7F1F000E9;
	Tue,  7 Jul 2026 14:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783435203;
	bh=E1iBZ6cPnQ4gEYgzs9wy1KrlEaGY546LUXneG77oi6w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AzEywunZ4UZ9z6CRSWvxRZ7YNdDHbwjRbBWKnhGukmFyrrIUtTkWMn4nsvVbyA1KT
	 Tx1AIBEyEYNyYGDjYDtjMIMgyycA6TwbRMpjCScvfx1dw/FwSBORt3Vv9wqzHa+LFy
	 bnst2RBoiaqjtZ52RZLw5PVfdgNDbZE4935lxzU1++hhXzo3VGQhIXZik97+gCqvW2
	 sc34u/SwAyF2RXG5pGTE1QKdlH2HFHHH2naPdxYF62sqx7j4DyumlVHHmelUAlj4oc
	 7h/6LqcBFOMK4G6BZT8d9ctPzWESCDw4qVxD7+CHEiORNaKAKvhLPpp5s2Nty1+YKi
	 0JFg0iQIUMjsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] firmware: raspberrypi: Add reboot mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707-rpi-tryboot-v3-3-fda82fe7ed76@linutronix.de>
References: <20260707-rpi-tryboot-v3-0-fda82fe7ed76@linutronix.de>
 <20260707-rpi-tryboot-v3-3-fda82fe7ed76@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 14:40:02 +0000
Message-Id: <20260707144002.C1F7F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] TOCTOU race in `rpi_firmware_get` allows `kref_get_unless_zero` to=
 execute on freed memory during concurrent driver unbinding.
--

--- Patch [3]: [PATCH v3 3/4] firmware: raspberrypi: Add reboot mode suppor=
t ---
commit 0477b96e458c7ecca585d15b527bfef8d16f88fc
Author: Gregor Herburger <gregor.herburger@linutronix.de>
Subject: firmware: raspberrypi: Add reboot mode support

This commit adds tryboot mode support to the Raspberry Pi firmware driver to
enable an A/B update scheme. It registers a reboot mode driver to send the
RPI_FIRMWARE_SET_REBOOT_FLAGS message. Additionally, it transitions the
firmware context teardown to be devres-managed to safely register the reboot
mode.

> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberryp=
i.c
> index 0aa322e9a2e73..2a0c40b8052e5 100644
> --- a/drivers/firmware/raspberrypi.c
> +++ b/drivers/firmware/raspberrypi.c
[ ... ]
> @@ -302,9 +331,14 @@ static int rpi_firmware_probe(struct platform_device=
 *pdev)
> =20
>  	platform_set_drvdata(pdev, fw);
> =20
> +	ret =3D devm_add_action_or_reset(dev, devm_rpi_firmware_put, fw);
> +	if (ret)
> +		return ret;
> +

[Severity: High]
This is a pre-existing issue, but modifying the teardown sequence brings up=
 a
question about rpi_firmware_get().

Can a concurrent driver unbind and probe trigger a use-after-free in
rpi_firmware_get()?

If a privileged user triggers unbinding, the driver core executes
device_unbind_cleanup(). This calls devres_release_all(), which now triggers
devm_rpi_firmware_put(), dropping the kref to 0 and freeing the fw object.
Crucially, the driver core clears the drvdata after devres_release_all().

If another thread concurrently probes a dependent driver, rpi_firmware_get()
could locklessly read the drvdata pointer before it is cleared:

drivers/firmware/raspberrypi.c:rpi_firmware_get() {
    ...
    fw =3D platform_get_drvdata(pdev);
    if (!fw)
        goto err_put_device;

    if (!kref_get_unless_zero(&fw->consumers))
        goto err_put_device;
    ...
}

Since fw could already be freed by devm_rpi_firmware_put(), passing it to
kref_get_unless_zero() would access freed memory. Does the retrieval of
drvdata need synchronization to protect against concurrent unbinding?

>  	rpi_firmware_print_firmware_revision(fw);
>  	rpi_register_hwmon_driver(dev, fw);
>  	rpi_register_clk_driver(dev);
> +	rpi_register_reboot_mode(dev, fw);
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-rpi-tryboo=
t-v3-0-fda82fe7ed76@linutronix.de?part=3D3
