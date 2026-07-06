Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9821C5F39
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344653; cv=none; b=GoBw0I7asZGABpejt1ndbNFkYdjHGGZ7aySyZPcXJ0gUrRm/pBDg1dcRDm3xGwZSU2u+SD8jhrVlyYRPCr+HFzla2Othu5yfamHSviM7U0f5Q+bkcpSQ6dghyZ7oq7SMQMDmQvWLHAlVPltC0oIi3VxG/Jhuzz6cjh0IO0kWeso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344653; c=relaxed/simple;
	bh=dWRTI4/SomIYelJzBFh1d0hHFlDBN6uajIWBwDKdeVU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fh6WaOFCHg08/Sc+oDVrxrdWR23CLexAECx09JKgLnvjtbXTpyeHlUtsmcMwsPxmYBR12UxcHfuPAPmlpK1tsxdYh4QPZplNU9giKj+lbFi0TgItvpJtJkqz0mCtgrtSVlvj8mPwyEGohTGJjCuYl8kvWjEij7WCNbWOkaySFEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0Ym0DeO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0Ym0DeO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983801F000E9;
	Mon,  6 Jul 2026 13:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783344651;
	bh=TYSx/m0N9OWnHsIXrUnghIv0qR/0MPTICl4Kro+AZjU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J0Ym0DeOYHtSYJXcYxBWxu+WjunmvJfy2XdZWYSv1EjEksNaHSoX6Mcd4R/e4YnQc
	 52mRzxjdx+/tATB3Zpj0YynKJGSHET4KlhcU0YyxhbuDCDjWnIdkEaOCm4Cevzn3J9
	 9Y7BfOEUMAut/5f9o5SgiUiARayatymp+cFnmz7af5q7I/iwVjkGkhVHvkeiDQ2swR
	 OokYvmdHD5gFjgqzF4FLyFCNKFC+FSXpVFm0gpT962IHLgmdCW3vpUx7eVOgAjmxR2
	 oSrVTkcSW6NLFvw+UbtLYLe09nqt0pnTQqcbOVHUqDQzE4hsUu7bAD1T2BdQ/fR15g
	 uBKtXaLoL9mdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais:
 Document DAI subnode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260706132009.1496321-2-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260706132009.1496321-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 13:30:51 +0000
Message-Id: <20260706133051.983801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree example uses an incorrect unit address `dai@16` for=
 `reg =3D <PRIMARY_MI2S_RX>`, which will cause a `unit_address_vs_reg` comp=
iler warning.
--

commit 34242d1a4dde8cbcb03c8b665b181f4cb4658671
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode

This commit extends the qcom,q6apm-lpass-dais device tree binding to
explicitly describe Digital Audio Interface (DAI) child nodes. It adds
#address-cells, #size-cells, and a dai@<id> pattern to document per-DAI
properties like the interface ID and associated clocks. This enables clock
line enablement from the platform side for codecs hardware wired to the SoC.

> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dai=
s.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> index 2fb95544db8b5..42d05334bd391 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml

[ ... ]

> @@ -29,7 +70,22 @@ unevaluatedProperties: false
> =20
>  examples:
>    - |
> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +
>      dais {
>          compatible =3D "qcom,q6apm-lpass-dais";
>          #sound-dai-cells =3D <1>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        dai@16 {
> +           reg =3D <PRIMARY_MI2S_RX>;

[Severity: Low]
Does this node name result in a unit_address_vs_reg warning during
make dt_binding_check?

Since PRIMARY_MI2S_RX evaluates to 16 in decimal (0x10 in hex) and unit
addresses in Device Tree node names are expected to be hexadecimal, should
this be named dai@10 instead of dai@16?

> +           clocks =3D <&q6prmcc LPASS_CLK_ID_MCLK_1
> +                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706132009.1496=
321-1-mohammad.rafi.shaik@oss.qualcomm.com?part=3D1
