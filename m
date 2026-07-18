Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2330435E948
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 09:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365922; cv=none; b=u7nH3RayBSLghwOKuuqkaJqFN9RLmcZ658cs9vkO97sYkiXL97E9zBbs3kQsUnDhIsC9UD6plPO8X6r7i2kdDaIxFrHe39YzTTGqdf/uMBS8X8y0C+i2Ru1o1wUYWGgHSJMWxw9IWqRE9zzETOEYJaq/Mkhi6xzmOKcJgU1Se/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365922; c=relaxed/simple;
	bh=yrsR3AdbCIM8lOhHPGujhMAfDZwzGxt25FqRLYf6uaU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ndNUoDj+96aecEvpzDJg4HO8WLIqWHWSrEPv1LQYfnIp3VsWTLfF+/5OiLOmqCLWLvmpMjhjQR7tKQdf81ibKV9PSKHFggAbi3qXxuw1geMXL4ySTRh3BF9SuMlwLENQfXqXOwtbqdEjMExvU22dVIhbUOa0KmVFkda9AXxGREI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Atsh+UR3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Atsh+UR3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65AE21F000E9;
	Sat, 18 Jul 2026 09:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784365920;
	bh=Szm3e1s5DVw/nWZX0kmk6gz6B97jYm2fffijIXySo9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Atsh+UR3M/WB3FhXrap0LS9facggSODnHfYHaBZtiEsBHLzS7MYQ4H6iDY3AgNlcP
	 Aas78aZ5mA7kvhWAx4I+5QsgEkcBsn8Dnvkh+3j4QXXxRe0fy56air8K3vfMgrCPtg
	 zmbImMQFnNXvW9UEN8dIcwpUXa22OrxszhYueLyCuRW2JUbOiZ99MjzVQntOSDdNch
	 Ph4KopHPy1LgSX8ckJYNDymoWePOmfVANiM6KKc+BJQwB82sx6h+OuL3mGDrhOMVYb
	 hGo6G9MAxFYZpTy0A/yyhI8SNcMBtYOeZIOCycqwC7KyevLLR8dg2vKh79thUdZiD6
	 fNSwroPkJG6cQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: enable HDMI RX audio
 capture on Orange Pi 5 Plus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Paunovic" <royalnet026@gmail.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260718085728.6797-5-royalnet026@gmail.com>
References: <20260718085728.6797-1-royalnet026@gmail.com>
 <20260718085728.6797-5-royalnet026@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 09:11:59 +0000
Message-Id: <20260718091200.65AE21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The audio_work delayed work is not cancelled during system suspend=
, leading to a fatal bus fault.
- [Medium] Incorrect use of be32_to_cpu() for unconditional byte swapping b=
reaks audio capture on big-endian architectures.
--

--- Patch [4]: [PATCH v3 4/4] arm64: dts: rockchip: enable HDMI RX audio ca=
pture on Orange Pi 5 Plus ---
commit 030cd8fd5334b79e1751dec57b1de1f5fa4e3df3
Author: Igor Paunovic <royalnet026@gmail.com>

arm64: dts: rockchip: enable HDMI RX audio capture on Orange Pi 5 Plus

This patch routes the HDMI receiver audio to the i2s7_8ch interface. It cre=
ates
a simple-audio-card configuration to expose a capture-only ALSA card driven
by the HDMI input. The setup uses the receiver as the bitclock and frame ma=
ster.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> index 145986695720a..2a68610cddbc3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> @@ -37,6 +37,22 @@ hdmi1_con_in: endpoint {
>  		};
>  	};
> =20
> +	hdmiin-sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,name =3D "rockchip,hdmiin";
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,bitclock-master =3D <&hdmiin_codec>;
> +		simple-audio-card,frame-master =3D <&hdmiin_codec>;
> +
> +		simple-audio-card,cpu {
> +			sound-dai =3D <&i2s7_8ch>;
> +		};
> +
> +		hdmiin_codec: simple-audio-card,codec {
> +			sound-dai =3D <&hdmi_receiver 0>;

[Severity: High]
Does exposing this codec to the ALSA subsystem trigger a suspend regression=
 in
the hdmirx driver?

Looking at the underlying codec driver hdmirx_suspend() in snps_hdmirx.c:

drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c:hdmirx_suspend()
{
	struct snps_hdmirx_dev *hdmirx_dev =3D dev_get_drvdata(dev);

	hdmirx_disable_irq(dev);

	/* TODO store CEC HW state */
	disable_irq(hdmirx_dev->cec->irq);

	return hdmirx_disable(dev);
}

The audio_work delayed work is queued on system_unbound_wq, which is not
freezable, but this suspend callback doesn't cancel it.=20

If system suspend is initiated while audio capture is active, the worker
could fire after clocks are disabled via hdmirx_disable(), resulting in
a bus fault when it performs MMIO reads.

[Severity: Medium]
Will this audio capture work correctly on big-endian architectures?

The underlying hdmirx_audio_fs() driver function uses be32_to_cpu() for an
unconditional byte swap when calculating the ACR subpacket:

drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c:hdmirx_audio_fs()
{
...
	acr_cts =3D be32_to_cpu((__force __be32)acr_pb3_0) & 0xfffff;
	acr_n =3D (be32_to_cpu((__force __be32)acr_pb7_4) & 0x0fffff00) >> 8;
...
}

Since be32_to_cpu() behaves as a no-op on big-endian CPUs, the bytes remain
unswapped, causing the bitwise masking to extract the wrong bytes for the
ACR CTS and N fields.=20

Should swab32() be used here instead to ensure the byte swap happens
unconditionally on all architectures?

> +		};
> +	};
> +

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718085728.6797=
-1-royalnet026@gmail.com?part=3D4
