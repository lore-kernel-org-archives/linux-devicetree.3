Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D573612FE
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 01:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783558933; cv=none; b=eLbEc9MPRE6ouT+6QqX8LFk7CdPe8s8vNLtd8g/Ez5LYqev/fl3VFAhWKJEKoiu9SI2PNeOLasf71k2yYejHRQAg8JBtwvG/Sss/oKIfdGrGui4xI8vczxxTWqqrsTNa0HKWV1itCFKKzXguwhxuBeVCs1Yiptj1ojNQ7/Jj+rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783558933; c=relaxed/simple;
	bh=vgc6bChoJEv8+j1nBt63NiI/+BNM6Ny6yhqwx0Uh5wU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lhq/mhlQkC+NhNR0UZS3kW2cmwCko2ve8U5x/jf9b3/lVYCoiyzCinmZ1GSzLXfhwRQcxNjOuHERQAaNTZOdsmvGURp87oMyfioKkImrvWOAGx9OA1cN1lQpkepHn5afIpiIqx/ehVVsRIVOoxySiBGrv5NiDE/VRkqKMGIjKeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G92lW6wH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G92lW6wH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7C41F000E9;
	Thu,  9 Jul 2026 01:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783558932;
	bh=PVc6/Lecgx8lpMGW8KqX8JAW6CeU7CmbJF1zzJ/MCsU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G92lW6wHp1tDT5qGcEUXho/0LncyJa3s0dNgVamxgyFO4KHN84yYqTxPT5fcxG3Eb
	 es94w/tZ0OsJQHt39BARc+j9SLCYAs4icV0iHF0uDhSIyd+mTCDzY9rjrkF51Tx77b
	 Fj8il0d4+1dfuwwUZ9h38Za9bh29Z00R3d/UsrEyt8cQMq9BKj7DsWsota3kbOo7vF
	 60eK1XQMVMyBLBJky1PrXwxhxsFoQ36GE1EyaLjRJZXzV0WQGfTJm9F3QI94ZhQbLc
	 Z4iOLD/3sFDhNpEyhfRS58imEpVvbmF9QEMwczy6ItCn7SLTBhKEM9COdQKcZfVqZD
	 /gJN/PEMP2TzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 3/3] ARM: dts: helios4: add SATA regulator supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709005005.1587852-4-rosenp@gmail.com>
References: <20260709005005.1587852-1-rosenp@gmail.com>
 <20260709005005.1587852-4-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 01:02:11 +0000
Message-Id: <20260709010212.3D7C41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The struct device reference acquired by of_find_device_by_node() i=
s never released, causing a memory leak.
--

--- Patch [1]: [PATCHv2 3/3] ARM: dts: helios4: add SATA regulator supplies=
 ---
commit 737d149c64d97348e97b79fed6b2378d4f1a140f
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: helios4: add SATA regulator supplies

The ahci-mvebu driver and libahci_platform request three supplies
on SATA controller and port nodes to avoid regulator core boot notices.
The SATA controller and PHY are powered by the 3.3V I/O rail, while the
four disk bays are powered by the 5V HDD rail.

> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index ec134e22bae3e..af1e81638f829 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -217,13 +217,17 @@ sata@a8000 {
>  				status =3D "okay";
>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;
> +				ahci-supply =3D <&reg_3p3v>;
> +				phy-supply =3D <&reg_3p3v>;
> =20
>  				sata0: sata-port@0 {
>  					reg =3D <0>;
> +					target-supply =3D <&reg_5p0v_hdd>;

[Severity: High]
This is a pre-existing issue and was not introduced by this patch, but does=
n't
adding these supplies increase the chance of memory leaks during probe
deferrals?

In drivers/ata/libahci_platform.c:ahci_platform_get_resources(), the device
reference acquired by of_find_device_by_node() is never released:

			port_dev =3D of_find_device_by_node(child);

			if (port_dev) {
				rc =3D ahci_platform_get_regulator(hpriv, port,
								&port_dev->dev);
				if (rc =3D=3D -EPROBE_DEFER)
					goto err_out;
			}

If the newly added target-supply regulators return -EPROBE_DEFER, the probe
fails and is retried. This unconditionally leaks a struct platform_device
reference on every retry because put_device() is never called for port_dev.

>  				};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709005005.1587=
852-4-rosenp@gmail.com?part=3D1
