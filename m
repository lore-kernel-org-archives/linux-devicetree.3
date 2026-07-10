Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B281C36C0AB
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 17:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706138; cv=none; b=MPt72PRRiTsRYLF2lbxQSplneuHVt1x3xeMeAhzZjirOeBqKsBNLq1vpfqAbIN1eZtv1avV4/FcUAp0E/oginZFOBqHmQ2OQH++cUXBbj7e971qTXe/KNh9pFZOWR0WOb/mULHgThb1a42JtlO4gA2v50TCq9GPmubbBiXxnCK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706138; c=relaxed/simple;
	bh=TNe1wpIURKjw2jQYt6lQaMw364mQpTedpVeH0C5zjd8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kj0Zc44eOVvchFTMORahb5o+e1cneS8VsdcBG4jHQy7wqEFyFlSbWJE5isQLaYamoAmRcC33HSueKfeyI48Acesaqx7tCs1aPlSZ1/nsZexvsLA1fVWCHb3SIIhN8S/D9I9jCAi7zlxPBERfaN+VSMOBwhzAbvUNomsFj+utdqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=miOCZoGt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="miOCZoGt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112AA1F000E9;
	Fri, 10 Jul 2026 17:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706137;
	bh=IKpsYSdUgmDOOjHDq69KgtY8F6r6RVeEKg1Y5sljBIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=miOCZoGtdICUWoCwity3JzYOCtDiJLEtuhjtegZlCZN3Z4ZMeehdHazjo6q38P7WI
	 ZjAMa74RhK8AdcI8LibQCoasqMbi0rKUhBsXdgBj24j7+xH9zsQO+YIMMpe49vObed
	 DX1Rv8bv+klS7pz6rvqcZ6Js9n5VbzFWaEUlmy0vgJ6sIRAyEDo3SAgcuqAchekAKv
	 NBHwvGE0GMmFSBk8DQH/D9gXsUXTXIXDA+L6lva+iwXBMScFVoC4ixacHM1FjlU6zS
	 6uJUJ3k+7Nq3zYoeZ698YhF7YdHbGx4pZwAxpTmIwRuOC/ieoXy3dc5iEDcZkEQ3AO
	 Hdytu9GUIGeeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: ti: Add support for Variscite
 VAR-SOM-AM62
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <ed1d477de1855fa8de3d88a491aa489a3bdbb7f7.1783689915.git.stefano.r@variscite.com>
References: <cover.1783689915.git.stefano.r@variscite.com>
 <ed1d477de1855fa8de3d88a491aa489a3bdbb7f7.1783689915.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 17:55:36 +0000
Message-Id: <20260710175537.112AA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `main_i2c3` interface is enabled by default in the SOM devic=
e tree without any attached SOM-specific child peripherals, contradicting t=
he commit message's design rule.
--

--- Patch [2]: [PATCH v3 2/3] arm64: dts: ti: Add support for Variscite VAR=
-SOM-AM62 ---
commit b50e7e0d210badd0bd12a9c466cdaf9cdf2bfcaf
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: ti: Add support for Variscite VAR-SOM-AM62

Add device tree support for the Variscite VAR-SOM-AM62 system on module.
This SOM is designed to be used with various carrier boards.

Link: https://variscite.com/system-on-module-som/ti-sitara-am62x/var-som-am=
62/

> diff --git a/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi b/arch/arm64/bo=
ot/dts/ti/k3-am625-var-som.dtsi
> new file mode 100644
> index 0000000000000..c2daa56c35e17
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi

[ ... ]

> +&main_i2c3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c3>;
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";
> +};
> +

[Severity: Medium]
The commit message states: "Only SOM-specific peripherals are enabled by
default. Carrier board specific interfaces are left disabled to be enabled =
in
the respective carrier board device trees."

However, main_i2c3 is enabled here with no SOM-specific child peripherals
attached. Should this interface be left disabled by default to allow carrier
boards to use these pins (e.g., for UART0 CTS/RTS) without having to explic=
itly
disable main_i2c3 first?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783689915.gi=
t.stefano.r@variscite.com?part=3D2
