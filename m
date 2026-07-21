Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A750C3469F6
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628916; cv=none; b=EVofjVQdIt6VSOYcx5iyGIkonZpBngYI2APrZDCPGFYcIMf94056DbU1zp5IZuvn3pIE8R6FDDv66P0ZcIm4iRnvjD6WLgNl4gFHSY+RnIif/FsaMnZMalgjKQO3NmsDzd6vwHHxMGuvAwe9PXdRfMBP+h/ilqU3LvsZiVU/Tzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628916; c=relaxed/simple;
	bh=aZMqD/cj1sT9PpgUH9U4gEAsomtzSvutYVuVHHY2QdY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZsS0ABuufC6mb51RUrAeBg8qXW6Ky5e13hvN7WikgLZEJ8QINAG8+UcaWWBDGAPRbn5+qRhIZ04e9Bd2BoS/Fx1nKT/OHZvZr0KJ657OFnz1rIRQuYoAzLjQ7d9J9e8NaYqqb4vWg9db+OOnx28ZcTBc9vdVG7b1dPQUyUVXBLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHSe9kc0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHSe9kc0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC311F000E9;
	Tue, 21 Jul 2026 10:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628915;
	bh=aDORCqBtsuArRSzTjDZzkw9qQE3ZioDrD4yTuN7D5AM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jHSe9kc06rBj55sV1+jn42PEfw7m1XlsgcRqbnplnssXKtUv/WIG0QXOsGlVR9i8e
	 ggLNa4YAaq8w+jRIRxEGmBTloLNW/obijiHykA17tInlH85ESK4baaA3hRS8Tcd0Vb
	 rJ62e80+BTuyeuJ1crOmBEcqXBk14oRxEpkxY4N1Xpzhz2Go1iWAOJzj5U0meD3cM1
	 VPb+Btm5/n0F1XccPcRWv8fFgyN6JlHbtWe6GGNooBIu6pZ1buvXYXciXqVCarURxs
	 8yRmhBAMyQXBOv1M2ndOjqCgXwMy3YG1fcl2PdyXeZEixHZD1aBBa1f2oqOQHL4N4o
	 7zv1UTNSf4pYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2 RESEND] ARM: tegra: Add device-tree for Motorola
 Atrix 4G and Droid X2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721100245.444623-3-clamor95@gmail.com>
References: <20260721100245.444623-1-clamor95@gmail.com>
 <20260721100245.444623-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:15:14 +0000
Message-Id: <20260721101515.4AC311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Two separate GPIO switches map to the same absolute switch code =
(`SW_DOCK`) in the same `gpio-keys` device, causing erratic state clobberin=
g.
--

--- Patch [2]: [PATCH v1 2/2 RESEND] ARM: tegra: Add device-tree for Motoro=
la Atrix 4G and Droid X2 ---
commit efb4cc03675fda13ada4c5318a7f54d006cf5b05
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: Add device-tree for Motorola Atrix 4G and Droid X2

This commit adds device-trees for the Motorola Atrix 4G and Droid X2,
which are NVIDIA Tegra20-based smartphones.

> diff --git a/arch/arm/boot/dts/nvidia/tegra20-motorola-daytona.dts b/arch=
/arm/boot/dts/nvidia/tegra20-motorola-daytona.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm/boot/dts/nvidia/tegra20-motorola-daytona.dts

[ ... ]

> +	extcon-keys {
> +		compatible =3D "gpio-keys";
> +
> +		switch-dock-hall-sensor-north {
> +			label =3D "Dock Hall sensor (north)";
> +			gpios =3D <&gpio TEGRA_GPIO(S, 2) GPIO_ACTIVE_LOW>;
> +			linux,input-type =3D <EV_SW>;
> +			linux,code =3D <SW_DOCK>;
> +			debounce-interval =3D <500>;
> +			wakeup-event-action =3D <EV_ACT_ASSERTED>;
> +			wakeup-source;
> +		};
> +
> +		switch-dock-hall-sensor-south {
> +			label =3D "Dock Hall sensor (south)";
> +			gpios =3D <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
> +			linux,input-type =3D <EV_SW>;
> +			linux,code =3D <SW_DOCK>;

[Severity: Medium]
Both switch-dock-hall-sensor-north and switch-dock-hall-sensor-south map
to the same SW_DOCK code within a single gpio-keys device.

Since the gpio-keys driver creates a single input device for the extcon-keys
node and iterates sequentially over all defined buttons to report their
current state at boot and resume, won't the south sensor state overwrite
the north sensor state before input_sync() is called?

If the device is docked in a way that activates the north sensor but not
the south sensor, it seems this could result in an incorrect undocked state
being reported. At runtime, could changes in one sensor also incorrectly
clobber the shared SW_DOCK state, such as an undocked event being emitted
if the south sensor drops while the north sensor remains active?

> +			debounce-interval =3D <500>;
> +			wakeup-event-action =3D <EV_ACT_ASSERTED>;
> +			wakeup-source;
> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721100245.4446=
23-1-clamor95@gmail.com?part=3D2
