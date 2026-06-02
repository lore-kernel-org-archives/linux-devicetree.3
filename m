Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998CC201278
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 08:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389746; cv=none; b=Ln1iWDcmGeTYyc91ca/1Cenuckm9ZFTWZTYpSoZEBP/aq1I75Bn0TjasprNjXQ0rq8VeISQtmIzqSsNnsE/6FHAq4lZCvgd+S2vaBy40jNZBFHOwjN6PictZUkMpMgKo/ivObbu+qKm0ja88XhQUu56cbKchRRH8z0l+QK+rFsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389746; c=relaxed/simple;
	bh=vgeNc5exBaUs5k7Cq0UKj0OGXv+iWZtUwMePQeqEwZs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tZ0M4g1ukJqncnh8vQJdtDzVzqehejXi6VOCn8vn4NJ7MCKPpbAis0/EV2/cSal1imPxXFyeOn3Kog+Q64QOzG38R1if8vGu75UliwfIo+1D8uBgeJBLkfnWiF9X4uqaP3GjwbLjlQDsHihKzPLQEb0DTnZu0gBTqDSKyhQLR7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxJbAh6s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxJbAh6s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E201F00893;
	Tue,  2 Jun 2026 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780389745;
	bh=hPgx69AvwKXqC6RCK9xac8Bb47l2nUsL+mqF53bI0U4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fxJbAh6sqD0XLh6y4iR+SqlJq8XFQO0qVdd2Ypuj1xEmDxyHVJxExXGI0IZ+L6UQ8
	 8MWDGz5qp6Lblk59S2zBa9GatpPx8QPhkwkdRhmA5wbfUeBIouUJU6sOx3LyDC8xKP
	 nx7CQJ+qATtPRhnfp8rE41CaThK4rCIXxIOe7Mynnuhol+c0onebRYC0nZe2k/tb+2
	 CBhrJJg9gs7VES7UV5LIrh8Ddidy6+TtVpgDOXSfLAoragcC6mfezetxANwRClYNQo
	 iLkmAsBhn/A77EADXgcQsNrvpXz5lf9V436ODFx5UwEq0SpuyXr1iAxoQe1U1kinzr
	 NWmZIvyhR8NWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s:
 set GPI DMA channels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260602081451.3808833-4-zhengxingda@iscas.ac.cn>
References: <20260602081451.3808833-4-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 08:42:24 +0000
Message-Id: <20260602084225.13E201F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect channel reference in error cleanup path of gpi_ch_init c=
auses resource leaks and hardware state inconsistency.
--

commit de0b4a765a18a5d7af04a98b890d09dd31cb2362
Author: Icenowy Zheng <zhengxingda@iscas.ac.cn>

arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: set GPI DMA channels

This commit adds GPI interface availability information to the device tree =
by
setting the dma-channel-mask and marking the status as okay. This ensures
that HLOS does not touch restricted GPI interfaces, preventing system hangs.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b=
/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index d84ca010ab9dc..119eeb1560e16 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -704,14 +704,17 @@ &dispcc0 {
>  };
> =20
>  &gpi_dma0 {
> +	dma-channel-mask =3D <0x3>;

[Severity: High]
This is a pre-existing issue, but since this patch enables GPI DMA interfac=
es
that might fail to initialize, it could expose an error cleanup bug in the
GPI driver itself.

Looking at the error paths in drivers/dma/qcom/gpi.c:gpi_ch_init():

    error_start_chan:
        for (i =3D i - 1; i >=3D 0; i--) {
            gpi_stop_chan(&gpii->gchan[i]);
            gpi_send_cmd(gpii, gchan, GPI_CH_CMD_RESET);
        }
        i =3D 2;
    error_alloc_chan:
        for (i =3D i - 1; i >=3D 0; i--)
            gpi_reset_chan(gchan, GPI_CH_CMD_DE_ALLOC);

Are these loops referencing the correct channel during cleanup?

By using the fixed function argument gchan instead of the iterated channel
&gpii->gchan[i] in gpi_send_cmd() and gpi_reset_chan(), it appears this path
would repeatedly issue reset and de-alloc commands to the same fixed channel
while entirely skipping the cleanup for the successfully allocated or start=
ed
channels.

Could this leak the previously initialized DMA channels and leave their
hardware state active, potentially causing hardware lockups?

>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602081451.3808=
833-1-zhengxingda@iscas.ac.cn?part=3D3
