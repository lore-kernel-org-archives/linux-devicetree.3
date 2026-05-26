Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99116372B3D
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779780125; cv=none; b=YzyBrBbIqFRHvQqi24dk0rvbBTXhuOJm7ia59uZw6qf0RbIYOt3F2oFVrYwGnQeJkk5GNydIlPsbscvFK3NrRFrgOmtV6Wwp2vMWEvIqvpnfmhIFYGT1WewHh8785QaxivQAXEW2PuNegDmcnf+knSSpDe5zFK42DWqyR8nMIwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779780125; c=relaxed/simple;
	bh=IY9Q1nC63JTkDQ3s6GzbQs/euNAExrtLPmdM3a/zaVE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D5XDMr4GbyLcQwxT/fecZS1rgOvfVGm/6kDe/gtAM20fuyIczp8iDKM/PXgHWXz4WHEoSNwJFVz5rFpYerzPJ4gDQzv3s4GJMZy+O7y0BAL4UlTBaIjsVZdIIyQyIOWVQqL3Is7bcbz89mV9H/l3rfWLtVAkHMGuOhMERnWuYGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZcuL5zr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZcuL5zr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5881F000E9;
	Tue, 26 May 2026 07:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779780124;
	bh=mR7gRbkaNjbft5VYMef78ku/C7p+0ikNMZF2/IIzCpw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hZcuL5zrXHvLiQMovADNsjoFxH1ttMfGnJbZHY/Bg8sl8QC9ocJxtozgeHLpd32NS
	 thf31lBzTphpgOwT1ssgF8jJ7G8fm1nXBc4+TlEUh+FtTTDfucW+Ib29GGvGpdCqUW
	 ZvtcC5tNgAj985LRslLglnuMgDdwPw2SOOn3GE3PG/Fzppwus8obb+YEGqgEbgOUtm
	 vyWPAxHcf6gZ9b+cRFMOJZ/pM7ScKwllF8lsRQZOQb1WD6B5Cl6fW3aYOaZ66avuyg
	 O0GBhDAbPhGiJbjDLEd76m/X5x1f1jQvAg1ZBR8KVZDz1VMoIWyEudc8M+92zfYVI6
	 czdOecP8QkwKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: socfpga: agilex5: enable i3c0 and i3c1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <219d67474c90843f4768cba2598e79cfafcc1ac2.1779778817.git.adrian.ho.yin.ng@altera.com>
References: <219d67474c90843f4768cba2598e79cfafcc1ac2.1779778817.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 07:22:03 +0000
Message-Id: <20260526072204.1A5881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The i3c0 and i3c1 nodes are enabled but lack the required `resets`=
 and `reset-names` properties, structurally exposing the system to initiali=
zation failures or kernel panics.
--

commit f5368d005c11d976c73173b7cd6fde413ccc26cb
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

arm64: dts: socfpga: agilex5: enable i3c0 and i3c1

This commit enables the i3c0 and i3c1 nodes for the Agilex5 development kit
by setting their status to okay.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/a=
rm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> index 262bb3e8e5c72..7f6fab5068676 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
[ ... ]
> @@ -61,6 +61,14 @@ &gpio1 {
>  	status =3D "okay";
>  };
> =20
> +&i3c0 {
> +	status =3D "okay";
> +};
> +
> +&i3c1 {
> +	status =3D "okay";
> +};

[Severity: High]
This is a pre-existing issue, but the i3c0 and i3c1 nodes defined in the
base socfpga_agilex5.dtsi file lack the resets and reset-names properties.

By enabling the nodes here, does this expose the system to initialization
failures or a bus hang during probe?

The Synopsys DesignWare I3C driver requests an optional reset control named
core_rst via devm_reset_control_get_optional_exclusive_deasserted(). If the
bootloader leaves these peripherals in reset, the driver will receive NULL
for the reset control and proceed without deasserting the reset line, which
can cause an AXI bus hang when accessing registers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/219d67474c90843f476=
8cba2598e79cfafcc1ac2.1779778817.git.adrian.ho.yin.ng@altera.com?part=3D1
