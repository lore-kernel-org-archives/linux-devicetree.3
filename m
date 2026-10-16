Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2DE562601
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 17:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171532; cv=none; b=kHzLsL1S8a1aUPvg/2IgFmER3D82TtmJloo57W5EuhuMjcjwCr53h7Q8O3jWwEAJzCfwbwNiJy0uVw25kxdEtv/YtsUnPcc0r8K0WF85XrAQhLPrYLVPCFuOjWHq+iTw8gII2EdKq/egyN0r9IAdTRJocoRqo3HN+mmRqnu7Mno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171532; c=relaxed/simple;
	bh=gLFnZY24OChNZmCR7dRT2viWx8x+IrZjFpn6dzb1G1o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FKkmDohACFWSfS1tuGuB1EH28CKnipMKkH3d70Q20e2Y8FYw0Jw86D9Gz1hYJH08x0f8nNzzEn+Dn5y08NxIrksDRLq39Ev9U1CUZV2hlsDKuh2bkoMs22uSsZlqGIa9ZGPEOLYQtQAqudT/8CIoFfHZkB7LJrKEfuE1lixBGMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bH9fDJY/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bH9fDJY/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2915E1F000C5;
	Fri, 16 Oct 2026 17:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792171531;
	bh=xWmWtBL11uG8RdMGj63LcIL25V809PeoKDp2Mw+6/18=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bH9fDJY/2yT9f04u8D8RVzOYKWUIFibLFAaeeYqYFslaO+fhJeSiTYoUlK5F6b3RV
	 XQx63qUHlqWo8wJKnuyT7LV6CK2qE/lfuFcxVEZ7g3LTnU37HYiRIVcPip7WjdVdzw
	 2m/k5dvm1z1K8fr/bthKHPKrt6l1wzYgWYce7U8KQ5kKgU2IBZTpG8766Hjd7EwZU2
	 Tm+NxLu2CVg+1rZiyCipHwzFNQw7Fx3Wgft8mMll7/ySf9oMA/T8E+C6wMRoc77IkE
	 CdfXn4kW7uRn1AGXgVIgD6Rzxr5jTDMeHTds0t6S8oDULBOFJQg1wTh35Q2vW4gFpZ
	 aT2C7lHN0JHYA==
Message-ID: <sashiko-outbox-174722@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/4] arm64: dts: amlogic: t7: Add thermal sensor
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261016-add-thermal-t7-vim4-v7-2-6eede5450fd4@aliel.fr>
References: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
 <20261016-add-thermal-t7-vim4-v7-2-6eede5450fd4@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 17:25:30 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] thermal: amlogic: system hang due to MMIO access before clock enab=
le
--

commit d943dedd550441fdf5ee6b1eb6eb97f02aac1ef7
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

arm64: dts: amlogic: t7: Add thermal sensor nodes

This commit adds six temperature sensor nodes to the device tree using
the amlogic,t7-thermal compatible. The nodes include references to their
required clocks and calibration data from the secure monitor.

> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boo=
t/dts/amlogic/amlogic-t7.dtsi
> index 8aa85aab30469..c81632d3984e8 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -696,6 +696,26 @@ sec_ao: ao-secure@10220 {
>  				amlogic,has-chip-id;
>  			};
> =20
> +			a73_tsensor: temperature-sensor@20000 {
> +				compatible =3D "amlogic,t7-thermal";
> +				reg =3D <0x0 0x20000 0x0 0x50>;
> +				interrupts =3D <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clkc_periphs CLKID_SYS_TS_A73>, <&clkc_periphs CLKID_TS=
>;

[Severity: High]
Does adding this thermal sensor node expose an initialization order bug
in the driver that causes a system hang?

In drivers/thermal/amlogic_thermal.c:amlogic_thermal_probe(), the thermal
zone is registered before the hardware clocks are enabled:

	pdata->tzd =3D devm_thermal_of_zone_register(&pdev->dev,
						   0,
						   pdata,
						   &amlogic_thermal_ops);
	...
	ret =3D amlogic_thermal_enable(pdata);

During registration, the thermal core synchronously queries the temperature
via the driver's .get_temp callback (amlogic_thermal_get_temp()), which
performs an MMIO read via regmap_read() on TSENSOR_STAT0.

Since the driver enables the required peripheral clocks after the thermal
zone is registered, executing this MMIO read before the necessary bus clocks
are enabled will stall the AMBA bus and hang or reboot the system.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-add-therma=
l-t7-vim4-v7-0-6eede5450fd4@aliel.fr?part=3D2
