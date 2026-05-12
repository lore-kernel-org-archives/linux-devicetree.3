Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21017083C
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778552083; cv=none; b=gdfM7azAf9LV+NpKl4Let+6FzCLYI4fLUUOOu7W15IjFOH5D0/eYe2Zt7Sid3UJOzxxwHUyul5ZydOXsNDUh+lK5KAnsJhQ+o157aVEbiURjLZaHT3DzIJz7+oIS5gOYNbhe4Sx5k04mBFxS9SI7V6doS9sS3YjJO72ki/9r9yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778552083; c=relaxed/simple;
	bh=7gMp63dIVb8F+8U2aJkcMlxC6FtgrMdN5nWsztx9wV4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JmgGBzSXZIciHWoWfIjBwiAay+9SjsiwnvnRBMM0SgZTnKUy9ByBXDnfVyjuFb/5xHlYxwb36htlQN7lZhuYGY+zHpGMX1/MF/LtKxu/RfDCPmi8YttHqBfAQLFz1rQwvGH2WCuHYEpZ+fDSJ4P2AFzw8O0NKKsAJYICh0guCsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kug6yplD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kug6yplD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347D1C2BCB0;
	Tue, 12 May 2026 02:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778552083;
	bh=7gMp63dIVb8F+8U2aJkcMlxC6FtgrMdN5nWsztx9wV4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Kug6yplDc27PbmWQKX1j3PzQtBq4JzkiylDafHW63GcQBRrr+LXrox5qpnEgJIgXG
	 Z6qdps4gMC+dEDg525DRSkctaMA2we1bEVbEwV/1NLI2gd19AGaUG+idvep6ET6GWR
	 QQKudI11mySduU7DAXdwfqWnzQeG1qfQkRSq6NPtU/PoPgL/HOz2+O/tAyUPhP0maF
	 FBGkj7JNUfJDSXWfnxsjAnHyjtqHYJ2vWZDqNBJipicHP9NwsuLdKDJdK+SYC156xh
	 KLdq5TRbT85HKpjkfr51gktn+kNPddm4Rb3qEJhLdTi4+vSGBTEHPAtGgOn6IXhpqQ
	 xhWksbLr9E03w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC
 and power infrastructure
Reply-To: sashiko@lists.linux.dev
To: "Andre Heider" <a.heider@gmail.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260511111116.1109643-2-a.heider@gmail.com>
References: <20260511111116.1109643-2-a.heider@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 02:14:42 +0000
Message-Id: <20260512021443.347D1C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The node name `regulator-vcc-40v` incorrectly implies a 40V regulat=
or, whereas it is configured for 4.0V.
--

commit 31559fd8aa980bcda8336aa1515122f80207c34b
Author: Andre Heider <a.heider@gmail.com>

riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure

This commit enables i2c8 and adds the connected SpacemiT P1 PMIC with
its related regulators for the board's power infrastructure.

> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/=
boot/dts/spacemit/k1-musepi-pro.dts
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts

[ ... ]

> +	reg_vcc_4v0: regulator-vcc-40v {

This isn't a bug, but there appears to be a typo in the node name. The 40v
suffix implies a 40V regulator, whereas the regulator properties configure
it for 4.0V. Should this be named regulator-vcc-4v0 or similar to match the
label and configuration?

> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VCC4V0";
> +		regulator-min-microvolt =3D <4000000>;
> +		regulator-max-microvolt =3D <4000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		vin-supply =3D <&reg_usb_vbus>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511111116.1109=
643-1-a.heider@gmail.com?part=3D1
