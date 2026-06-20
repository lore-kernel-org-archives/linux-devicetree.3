Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2283330641
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 06:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781936989; cv=none; b=h+8+xpFV6TmfkS8AvocjqtbyuNIJbkbUwkuxiF6qD8hZ4k2tJ6W1IqyDz2F1xJWOnSh0Gzx79ojpXhC4M9fKVy4qRcvVD1KCcmoj3JX5mnfI5Bqvl+HX5u0YFDfkzWHvBt2ifqdCMkANkSgDn1FBmUJOvIEst2KPwFhGhW9HpvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781936989; c=relaxed/simple;
	bh=0g9A+TLfn/vlgSmQeJ+nB3NrvclfAGAMzYdHLRx0ktY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ptPucRdR/xuNZ3/7o10YRtYJh7xpDM6gxZpay0+yHPE/o4OL0BF66AZD9/PsH9WztEhwSQQZjh3BfTMcuTBf5ggXwrZStR6ixmdK4WpJkXwCExwDZ4XE9dj2oSqO5+M+TdbDGyx8V6YsKYFrf+cH2JnOZCN3/0c9vMKTtQrs5LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klScQcSi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klScQcSi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1161F000E9;
	Sat, 20 Jun 2026 06:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781936988;
	bh=5Q8fwDlXxMZREjLgDpLnygeQsF4qO3MNCdBAy7HrNO0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=klScQcSiOiEo79BWfUwCPF3NXLP/fo+vfsBFi/ortVMOlfuH2hbEEIpXUaDZ27t/4
	 YtEr/bcVilZccMyvyc7hadIOb2B4snUtzDWr42wpK+suxDBDL3Nce5ItT38Eh4aRPa
	 +QlPglzNY6BACtnA4k3rzBlCFGdCz1BuWhG5CvikqumD36DEpv9aZEAUXTZcxBw+pD
	 KnDmqtN/qFcxO/c0h1l0v26o+ZghznHJA3SLF/nbe17CrFCKqoISZIsQdhGd0cE4Rz
	 ckwIxrapNlfBDgKeohJ6xoqYSfQs7I0dFVkw7jqMWMgo/PnUe0hmfkzco/ZkXfY/AD
	 4OKjNsruluDfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] riscv: dts: spacemit: enable the i2c2 adapter on K3
 Pico-ITX board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aurelien Jarno" <aurelien@aurel32.net>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260620062238.3199108-3-aurelien@aurel32.net>
References: <20260620062238.3199108-1-aurelien@aurel32.net>
 <20260620062238.3199108-3-aurelien@aurel32.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 06:29:47 +0000
Message-Id: <20260620062948.0A1161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The pinctrl subnode is named `i2c2-0-pins` but belongs to the `i2c2=
-1-cfg` parent node.
- [Low] Missing space before the assignment operator in `bias-pull-up=3D <0=
>;`.
--

commit 4dc6c92d42831e85b38f3350c15707d0e2b3af18
Author: Aurelien Jarno <aurelien@aurel32.net>

riscv: dts: spacemit: enable the i2c2 adapter on K3 Pico-ITX board

This commit defines the I2C2 pinctrl properties and enables the adapter
on the K3 Pico-ITX board. It will be used by the 24c02 eeprom.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/bo=
ot/dts/spacemit/k3-pinctrl.dtsi
> index 23899d3f308a0..c9fe9c2e5aeee 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi

[ ... ]

> @@ -45,6 +45,17 @@ gmac0-phy-0-pins {
>  		};
>  	};
> =20
> +	/omit-if-no-ref/
> +	i2c2_1_cfg: i2c2-1-cfg {
> +		i2c2-0-pins {

[Severity: Low]
This isn't a bug, but should this subnode be named i2c2-1-pins to match
the i2c2-1-cfg parent node? It seems to diverge from the standard naming
pattern where the suffix of the parent and child matches.

> +			pinmux =3D <K3_PADCONF(46, 5)>,	/* i2c2 scl */
> +				 <K3_PADCONF(47, 5)>;	/* i2c2 sda */
> +
> +			bias-pull-up=3D <0>;

[Severity: Low]
This isn't a bug, but there is a missing space before the equals sign
here, which diverges from the spacing used in the surrounding code.

> +			drive-strength =3D <25>;
> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620062238.3199=
108-1-aurelien@aurel32.net?part=3D2
