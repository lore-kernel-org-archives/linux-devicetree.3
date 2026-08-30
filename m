Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D452E231A3B
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 05:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788067584; cv=none; b=Z+TXPraybH0yfOJw5BtUGiFEol3TSUA9BYVTD3Jto+UY2YoA9NWhfzdfiK+QpFtybEQ6sehkadCmL0UQ24S3NBKyqQ8ywNeeVPjuv4OKne4zYpERceq5qwKGtOlzvLy/GLh8bNrGhQfxLyZMWLhRRybCbdum1tNu35ljC6Ei9Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788067584; c=relaxed/simple;
	bh=XzwM2XDBVBADkKjVwWyTuzd6nY6kd3mZkybBgpmKYeY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Qo9cQ40iWJaXBE6bAIgsBuxF614QWuus1U0CZDyP+KqrQV05aL0ZjyAfxMox/kZhBEbybDrn9THEpWg8vtMwSoWC7Oot03+AJrTNC8D1PRad3273MIYyD4PH2ULnNOIvsbJzAZx9ZOwHDDvqlByuYcWq6R4+Xl2+o1BntdZDNts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FUpvuH0e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FUpvuH0e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7637A1F000E9;
	Sun, 30 Aug 2026 05:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788067582;
	bh=pQ29OSWKOjPmzODQ/QLN1Zi2No9oLZKPjcVDoQRtETw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FUpvuH0ea1XC59pKC51sL9PZwxwKejW4eQHpj/YSPXl2p0ZpTqewkrbMoircmnwNL
	 P+lsTqCTRqLZFCuhDmOLglmFH0EyOws5m2k/0MFrjcJHPx5DoFR04Z01TgVbfPhyV4
	 KJphpUTE0pnVIRD0zCoXv3TSzkPeurdZVhxQBDk0Mr+tOP6o6eXPekNuEe1McZFkib
	 kp/cKhWhsuZHvTF9LJHSrGyZA95k8xMEOQlRW7NsGBE4czqm3ypcgpuOAVmxodIz/V
	 UrNX8tGKZiMcCSrGdn4WkijnkbnD1yX0P4Uou4YQ1Z6gebLT1ClO2ECTyR/6okhBeV
	 7W6t58BblZmDQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next 6/9] net: mdio: add Airoha EN8811H MDIO
 device driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksei Sviridkin" <f@lex.la>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260829052546.1152446-7-f@lex.la>
References: <20260829052546.1152446-1-f@lex.la>
 <20260829052546.1152446-7-f@lex.la>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 05:26:22 +0000
Message-Id: <20260830052622.7637A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The driver lacks PM suspend/resume callbacks to recover the vola=
tile firmware state after a power cycle during system suspend.

Pre-existing issues:
- [High] The firmware download loop in `__air_write_buf` assumes the firmwa=
re size is a multiple of 4, causing an out-of-bounds read if it is not.
--

commit 03babf30d531494d26f97bc52b83619b8709ea53
Author: Aleksei Sviridkin <f@lex.la>

net: mdio: add Airoha EN8811H MDIO device driver

This commit introduces an MDIO device driver for the Airoha EN8811H.
It manages the chip as an MD32 microcontroller in bootloader mode,
polling for firmware files and downloading them once available before
it becomes an Ethernet PHY.

> diff --git a/drivers/net/mdio/mdio-airoha-en8811h.c b/drivers/net/mdio/md=
io-airoha-en8811h.c
> new file mode 100644
> index 0000000000000..e16211da3d705
> --- /dev/null
> +++ b/drivers/net/mdio/mdio-airoha-en8811h.c

[ ... ]

> +static void en8811h_mcu_fw_poll(struct work_struct *work)
> +{
> +	struct en8811h_mcu *mcu =3D container_of(to_delayed_work(work),
> +					       struct en8811h_mcu, fw_poll);
> +	struct device *dev =3D &mcu->mdiodev->dev;
> +	int ret;
> +
> +	/* The chip enumerates as a C22 PHY; MMD access is indirect */
> +	ret =3D air_en8811h_fw_download(mcu->mdiodev->bus, mcu->mdiodev->addr,
> +				      false, dev, &mcu->fw_version);

[Severity: High]
This is a pre-existing issue, but does the firmware download loop in
__air_write_buf() (called via air_en8811h_fw_download()) have a bounds
checking issue if the firmware size is not a multiple of 4?

Looking at drivers/net/phy/air_phy_lib.c:__air_write_buf():

	for (offset =3D 0; offset < fw->size; offset +=3D 4) {
		val =3D get_unaligned_le16(&fw->data[offset + 2]);
		ret =3D __mdiobus_write(bus, addr, AIR_BPBUS_WR_DATA_HIGH, val);
		if (ret < 0)
			return ret;

		val =3D get_unaligned_le16(&fw->data[offset]);
		ret =3D __mdiobus_write(bus, addr, AIR_BPBUS_WR_DATA_LOW, val);
		if (ret < 0)
			return ret;
	}

The loop blindly advances by 4 and reads at offset + 2 and offset without
verifying the remaining buffer size. A malformed or truncated firmware file
could cause an out-of-bounds read and potentially lead to a kernel crash.

> +	if (!ret) {
> +		dev_dbg(dev, "firmware %08x running after %ums\n",
> +			mcu->fw_version, mcu->waited_ms);
> +		return;
> +	}

[ ... ]

> +static const struct of_device_id en8811h_mcu_of_match[] =3D {
> +	{ .compatible =3D "airoha,en8811h-mcu" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, en8811h_mcu_of_match);
> +
> +static struct mdio_driver en8811h_mcu_driver =3D {
> +	.probe =3D en8811h_mcu_probe,
> +	.remove =3D en8811h_mcu_remove,
> +	.mdiodrv.driver =3D {
> +		.name =3D "airoha-en8811h-mcu",
> +		.of_match_table =3D en8811h_mcu_of_match,
> +	},
> +};

[Severity: Medium]
Will this device permanently fail to initialize after system suspend if pow=
er
to the MD32 chip is cut?

If the hardware platform removes power to the MD32 chip during system suspe=
nd,
its volatile RAM will be wiped, returning the chip to bootloader mode. Beca=
use
the driver lacks PM suspend and resume callbacks to re-download the firmware
upon waking, the device will remain in the bootloader state and fail
subsequent PHY communication.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829052546.1152=
446-1-f@lex.la?part=3D6
