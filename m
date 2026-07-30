Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAD5407CF6
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409910; cv=none; b=VKfQky2YBd5khdY7AY2Ge0TX2TLhf957F5WuP0+ISyvhal6YdJV4n4o2FjUl6PvqOnab7bu1NlsHnaYonwelpijtac5BOlapUF7o7gUCNwFqZclOgd54kSKPU1SZHxdh76cpw6c3oPs2F62pCYMm9CKNQfiXihH5Zm6GrvzeW1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409910; c=relaxed/simple;
	bh=lE7jYHdCoJCymPc5N6qKNLtT7AlxwASSmyMUcJXxCTU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AmcyglrY4edrktoMXjvn0AhKr8oIQ3Y57UhSdBkxvRycEQAYFDER5qHJ/8KRLtLb8D30akeT4RTAgQsUsUsY2JNTrBeHwyfDMUDzbfSjYl73VaDh7dR/JYBAWa4sEjvEbrUA9uPNBqeep1XGzVsg9yH1TMpY3lw4x4BmKwEYMGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DH+dPdzA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DH+dPdzA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BA11F000E9;
	Thu, 30 Jul 2026 11:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785409905;
	bh=fNEl68DN/uNa+L4AqvfuOkEmAsvcUUAhRCmbq3Pcr7w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DH+dPdzAkG0FNMnMa6YGDYFBFdjM4Vj3meRVwWo6IAnWi2oxG+vtiSkGTVe6lnVWt
	 F3W5VrxEw4R7L3B2J2/zQU44xuZgVpcSx4HV+VERQz7jJqCkV7iJKahLnBwoDaPHTB
	 xjtuLvBPKkR9EByeaaovxyGS4Uk74kZ11m/3TOE6/O5KlcnXJ2+6O12O/LJgaFr8Zh
	 5CjxOTxewgz+oGid3RiA/pxRsl8Hn3XmE6QIp/jUwu9Sn2FvvwWJQcp9U+RwX7Efl8
	 HHKdJv4DCdMN9+6raINBGn8budmiTzuE+K6zAz8ihYkKEC1itgZeghLsxHAxmi27cQ
	 MHAO0MyPghDmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3 3/4] firmware: raspberrypi: Add reboot mode
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730-rpi-tryboot-v3-3-849c001d67f8@linutronix.de>
References: <20260730-rpi-tryboot-v3-0-849c001d67f8@linutronix.de>
 <20260730-rpi-tryboot-v3-3-849c001d67f8@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 11:11:44 +0000
Message-Id: <20260730111144.E3BA11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] fw->cl.dev becomes a dangling pointer if the firmware device is de=
stroyed while a consumer holds a reference to fw.
- [High] fw can be accessed after it is freed because drvdata is not cleare=
d before freeing fw during driver unbind or probe failure.
--

--- Patch [3]: [PATCH RESEND v3 3/4] firmware: raspberrypi: Add reboot mode=
 support ---
commit 7622e7ef47694e51ed746363fd587b5883406973
Author: Gregor Herburger <gregor.herburger@linutronix.de>

firmware: raspberrypi: Add reboot mode support

The Raspberry Pi firmware has a tryboot mode where it tries to boot from
another partition. This commit enables this by registering a reboot mode
driver. It also replaces the manual rpi_firmware_put() with a
devres-managed call to safely register the reboot mode.

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

[Severity: High]
This is a pre-existing issue, but can fw be accessed after it is freed
because drvdata is not explicitly cleared?

During unbind, devm_rpi_firmware_put is executed by devres, which drops the
kref and frees fw. However, the driver core does not clear drvdata until
device_unbind_cleanup completes (which happens after devres actions).

If rpi_firmware_get() is called concurrently by another thread, would it
fetch the uncleared but freed fw pointer via platform_get_drvdata(pdev) and
call kref_get_unless_zero(&fw->consumers), resulting in a use-after-free?


[Severity: High]
This isn't a bug introduced by this patch, but wouldn't fw->cl.dev become a
dangling pointer if the firmware device is destroyed while a consumer holds=
 a
reference to fw?

In rpi_firmware_get(), the consumer retrieves the firmware context and
increments its kref (fw->consumers), but then drops the reference to the
platform device itself:

drivers/firmware/raspberrypi.c:rpi_firmware_get() {
    ...
    put_device(&pdev->dev);
    ...
}

If the device is subsequently unregistered (e.g., via DT overlay removal), =
the
device struct is freed, but the consumer still holds a reference to fw.

Any subsequent failing mailbox transaction will call dev_err(fw->cl.dev, ..=
.)
in rpi_firmware_transaction() and dereference the freed device pointer.

>  	rpi_firmware_print_firmware_revision(fw);
>  	rpi_register_hwmon_driver(dev, fw);
>  	rpi_register_clk_driver(dev);
> +	rpi_register_reboot_mode(dev, fw);
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-rpi-tryboo=
t-v3-0-849c001d67f8@linutronix.de?part=3D3
