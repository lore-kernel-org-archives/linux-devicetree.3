Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809A5413230
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 12:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791378003; cv=none; b=C7NUOOMvGKc6ZKL625CGH2nUtpLPC4DgCHxWOkx+q/9PqjZ7rw2tvXu+PdejYElMg7/10zseEMl+fLhe1R+6IZPNtoxUjsPJ9CgBAnPDxQau3s24N6kfgJ6dI2kwurahF+vwLurQa+z9piBYnDFkUVlgQsZp0WjLjCSfc36ZA3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791378003; c=relaxed/simple;
	bh=WVk9mvbI1lq8ofL0doOyPRuJ+FWSn0mR7B0c7u/sjmo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=A72PyBJsrGpdciJmTktpexsg6GUqpgvxGUdGzkGbG60wLbT0Z+QUwqaakuYXG0SBvMzEqlBhXyjmw0IsPNR0AvZFoJ0Qnp1/FaUXRtoHfTOegqDKCmzybU+eNe9B3LxSQWRbBUzOpMDE8WTDYQHzzvp322Qx1KBYQg2qfDWq8Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bilaY8a6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bilaY8a6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2BC1F0089B;
	Wed,  7 Oct 2026 12:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791377989;
	bh=J7RgpLbmJ1vdUXiYbJA/R4h6PObbIt5d9Obi9yR6r0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bilaY8a6l46XWwZs1GdUhFS+wn95/S3ELvxp22/WVtTeq5e55981u9wf0xLq9PBdL
	 uMwIPboL7ebKlmRYiRexIjdC1jzhM0999n2mSpKyUHIDM+hGZPiutbX0WBKZK7NqHj
	 L35qmtiqP2GNVda9FOSmxn6/dYf1HojEGypVvkbmU6baibiVdbnzhHQ1c10TpHIyVU
	 FkOAVc9+10b49kik3cnomNJlA/HHmUAjBax0uYcFC8wK+stIT5XuNyURQ0B0+dIWDt
	 Mtzs7M3+D48n7QzSU0m0Ml8EgBIXITKaWVtxntTR8Lu3ieDTrxr84y+SQ+Icqa/uxO
	 TiY+gREa4df+g==
Message-ID: <sashiko-outbox-163019@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohit Dsor" <mohit.dsor@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261007-master_lt9611uxd-v4-1-9986704e2a7b@oss.qualcomm.com>
References: <20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com>
 <20261007-master_lt9611uxd-v4-1-9986704e2a7b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 12:59:49 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dts: Invalid compatible 'lontium,lt9611uxd' lacks driver support
- [High] dts: Incorrect reset-gpios polarity holds LT9611 bridge in reset
--

commit d181c75b1ca5c7813638aeaae19d81602f7108ef
Author: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD HDMI bridge support

Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-iqs-evk.dts
> index 5df30ad8211f8..fee93410b2e43 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
[ ... ]
> @@ -23,6 +24,98 @@ aliases {
[ ... ]
> +&i2c4 {
> +	status =3D "okay";
> +
> +	lt9611uxd: lt9611uxd@41 {
> +		compatible =3D "lontium,lt9611uxd";

[Severity: High]
Does this compatible string have a corresponding driver implementation and =
DT
binding?

There is no of_device_id match for "lontium,lt9611uxd" in any driver in the
kernel (the Lontium bridge drivers in drivers/gpu/drm/bridge/ only support
"lontium,lt9611" and "lontium,lt9611uxc"), nor is there an associated DT
binding. Because no driver will bind to this node, the display output will
silently fail to initialize.

> +		reg =3D <0x41>;
> +		interrupts-extended =3D <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios =3D <&tlmm 76 GPIO_ACTIVE_LOW>;

[Severity: High]
Does this reset polarity interact correctly with the driver's hardcoded res=
et
sequence?

The existing Lontium bridge drivers (lt9611 and lt9611uxc) are implemented
with an inverted reset sequence. They call
gpiod_set_value_cansleep(reset_gpio, 1) at the end of their reset routine
(lt9611_reset()) to take the device out of reset, assuming the DT specifies
GPIO_ACTIVE_HIGH as a workaround.

When GPIO_ACTIVE_LOW is used instead, the gpiolib subsystem translates the
logical 1 to a physical 0 (LOW). This will drive the reset pin physically L=
OW
at the end of initialization, trapping the bridge in reset indefinitely and
causing probe failures and I2C communication timeouts.

> +		vcc-supply =3D <&vreg_disp_3p3>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007-master_lt9=
611uxd-v4-0-9986704e2a7b@oss.qualcomm.com?part=3D1
