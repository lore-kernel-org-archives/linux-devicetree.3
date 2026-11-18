Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992901;
	b=DR/ekcaeCk3+cCbnvX6hhd3UF5g8jQ0SlJDNT62MOyNWelu2fPqZu3BIB/v8LEst2SFD
	 dmeNNqwgZuyGdCn5uTttrF9Drs1tbqJGw0UYSYc/YKUN1hTIDhaWvIO2G0wtlxTnuWl28
	 YU4+lZQg/bam3vm9mxHLsuHQRq85puhtXU8BT+3AogZfeM67BXcmAEK9itFCQC+thARP0
	 bsS0h/BiG+73MKmU7X/LbLV7T3vaLn7SjEMAuuuCxmalM9bvnLnEsEAikskcNVrw3G/nO
	 LS796CM7DxGZwx9iiYZ+m4nisrhSHj99Dz3sUMIPwEwNfgqww4twyK0eWIyMCYK4qHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992901;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=i3hBbm2ECJiICqB2+aIdldTQDFqZaM/Bvb/CsYUMXKg=;
	b=Scqxia1TBX/XPXFi1lcHOSprC1/4Abrw1tfcWbf9VcEzvcENqWCzMYhD6bGiiyUXJ7gd
	 S27f2t7E2+1dYZyLebzuu6hNBSRhKreYmjDJfblnfK2rgF3s8Fmh9movvGgyKesDj6G9I
	 HaY6g4KDWnjLOOz8iGamOvCIreJ4gbtOVjUk+s7IxKPKdVHiu8ibjElZmNZY6D8JcxvEn
	 SPDzfS6ED/jyICHXqU/yAzC+awdU6qzJ4CA3oRU7TqPOMyKEEVpWbS1wHv8yMo5aT3VDg
	 p6dhRdHTggzyeEJqy7JR4GufxYWT2Ixb91hl252Syca5BezoYvl0B8WMzzP3rWHcPOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IeL0e6eS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ECC606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IeL0e6eS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A631F000C4;
	Wed, 18 Nov 2026 09:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794992900;
	bh=i3hBbm2ECJiICqB2+aIdldTQDFqZaM/Bvb/CsYUMXKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IeL0e6eSuFqRShPqjLn0v6R2yNX0PXGL1FwNgIUlb2P6k7Eka/HiNGM2bDlU7zsiv
	 qtX5Hf7JD0Y9t2PNl1+Jhzv2it4UprLwC0nP3947keEqOvviea4X+pEjHa0fExpt0y
	 KtamEH+1MULYIW3f35CJLXuj2Db84xftCWT0hPfNOZvRwooAQZTorAJaefvUmVMGbZ
	 jqcz+SrvuB/n26Cw6p8d/dCi6DRrNtEA1f9TxA1h9kHZMnRl1bSSuzYKyfhyJCrYJC
	 w4uvMjAw9KcOA+9trxZQFmmUKhKWJBUNZsLQVhg7bQGn/Zap+8xyQAhtHER6YIbqND
	 hj9duwCMvY/2Q==
Message-ID: <sashiko-outbox-220532@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/9] riscv: dts: spacemit: Add K3 eSPI pin group
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wang Yang" <yang.wang@deepcomputing.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118085742.1817536-7-yang.wang@deepcomputing.io>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
 <20261118085742.1817536-7-yang.wang@deepcomputing.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 09:08:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] riscv: dts: spacemit: boolean bias-pull-up in espi0_2_cfg
  selects strong pull
- [Low] riscv: dts: spacemit: espi0_2_cfg drive-strength 25 mA at 1.8V
  selects DS10
--

commit 4a5d2c0bc1f2695686ef3889084fb07b26b11220
Author: Wang Yang <yang.wang@deepcomputing.io>

riscv: dts: spacemit: Add K3 eSPI pin group

This commit adds the espi0_2_cfg pin configuration group for eSPI0 on pads =
91
through 98 in the SpacemiT K3 pinctrl device tree.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/bo=
ot/dts/spacemit/k3-pinctrl.dtsi
> index cb4f4f4e33aff..5bae382fa7e15 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> @@ -11,6 +11,30 @@
>  #define K3_GPIO(x)	(x / 32) (x % 32)
> =20
>  &pinctrl {
> +	espi0_2_cfg: espi0-2-cfg {
> +		espi0-0-pins {
> +			pinmux =3D <K3_PADCONF(91, 4)>,	/* espi0 d0 */
> +				 <K3_PADCONF(92, 4)>,	/* espi0 d1 */
> +				 <K3_PADCONF(93, 4)>,	/* espi0 d2 */
> +				 <K3_PADCONF(94, 4)>,	/* espi0 d3 */
> +				 <K3_PADCONF(95, 4)>,	/* espi0 cs */
> +				 <K3_PADCONF(97, 4)>,	/* espi0 reset */
> +				 <K3_PADCONF(98, 4)>;	/* espi0 alert */
> +
> +			bias-pull-up;			/* normal pull-up */

[Severity: Medium]
Should this be bias-pull-up =3D <0> instead of a boolean property?

Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml requires
an integer argument (0 for normal pull-up, 1 for strong pull-up), so a bare
bias-pull-up fails dtbs_check.  At runtime, generic pinconf supplies a
default argument of 1 when no cell value is given, causing
spacemit_pinconf_generate_config() to set PAD_STRONG_PULL instead of normal
pull-up.

> +			drive-strength =3D <25>;		/* DS8 */
> +			power-source =3D <1800>;
> +		};
> +
> +		espi0-1-pins {
> +			pinmux =3D <K3_PADCONF(96, 4)>;	/* espi0 clk */
> +
> +			bias-pull-down;			/* normal pull-down */
> +			drive-strength =3D <25>;		/* DS8 */
> +			power-source =3D <1800>;
> +		};
> +	};

[Severity: Low]
Does drive-strength =3D <25> with power-source =3D <1800> select DS10 rathe=
r than
the DS8 noted in the comments?

In drivers/pinctrl/spacemit/pinctrl-k1.c, k3_drive_conf maps 25 mA to
register value 8 (DS8) only at 3.3V (ds_3v3_tbl).  For 1.8V pads
(ds_1v8_tbl), 25 mA maps to register value 10 (DS10), while DS8 corresponds
to 21 mA.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118085742.1817=
536-1-yang.wang@deepcomputing.io?part=3D6
