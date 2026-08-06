Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788334334B1
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786055642; cv=none; b=oVjxBAe3krIK4yifzJ7/72+r9f07SOqb/9sTytC1zxA0LccaajxJfRynwAXWrKP+1P/4/c4taqasbkZ7F0Ttcp8o84n4EyZc6WRw6gsApGpuJRbBTZgIDF6HSJ6dB69gg+UwXm3bROjiggPN5WkohJ0rRdKelTV8XXp5Z8bs+g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786055642; c=relaxed/simple;
	bh=pIpIqo8xcJk5eVdkX0oKfusgNfcblRDhrLnLYSuSq5U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YRab7GzQOaX4cgGni9H6qUXAOCRXzemdsmC66/qfjjNpRUkosN+gLr5lsKo+FHtPxv1DhfZZ/QD/WmTptlLwyGu389mqTsebLFa1614BUVk4/Y+H5AmAVS+07VyLyYZEZTL1a0SlBg33x+s91JDLvKNz0UB2F1UYt5QsXzAE4Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iD6XK1DX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iD6XK1DX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73151F000E9;
	Thu,  6 Aug 2026 22:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786055639;
	bh=ay0KQof2H4KKh7Dok+6LrTItL5QQZXVMbbZpcs8FZv0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iD6XK1DXbJV9/EwZDECCiBDIm3gqgmEAM3TcLu/a0VhGEdGGEM8dv8nyRyDO99nzR
	 MSYCnbUkfToz/8E9T0CUGWdvhFDljFsmg/7qEH1X3hz7uTRFldR70/COpTHKAarOJ7
	 Aqx92FIh5rzHd86PFzZQcdAm1z3r34S1sdtAUyTPMcpLeox/Xg5SinBiqSelV7NZcb
	 dmXy4/aS7PTlFdZetnriECwGogFctGr2pm4N6V7j8PpQJ2ncKR0wQIfa2lxauWMKnT
	 q2jNFv4PQrv9gxQAoXkid8g1ttLY/WVcaJFNTY0j/ErBzXs7fbyF16rQs56/TCG2bO
	 ix+YWiJ8X8h0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 34/37] pinctrl: airoha: add support of en7523 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806220615.4078303-35-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-35-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:33:58 +0000
Message-Id: <20260806223358.E73151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Missing open-drain configuration array causes runtime `-EINVAL` pr=
obe failures

Pre-existing issues:
- [High] Hardcoded SCU compatible string causes probe failure on EN7523
--

--- Patch [34]: [PATCH v11 34/37] pinctrl: airoha: add support of en7523 So=
C ---
commit 923709aee684a9571b7d6f8e6ecdbaff7482d40d
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add support of en7523 SoC

This patch adds support of Airoha en7523 SoC pin controller.

> diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/ai=
roha/pinctrl-en7523.c
> new file mode 100644
> index 0000000000000..91490418e9ab1
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/pinctrl-en7523.c

[ ... ]

> +static const struct airoha_pinctrl_match_data pinctrl_match_data =3D {
> +	.pinctrl_name =3D KBUILD_MODNAME,
> +	.pinctrl_owner =3D THIS_MODULE,
> +	.pins =3D pinctrl_pins,
> +	.num_pins =3D ARRAY_SIZE(pinctrl_pins),
> +	.grps =3D pinctrl_groups,
> +	.num_grps =3D ARRAY_SIZE(pinctrl_groups),
> +	.funcs =3D pinctrl_funcs,
> +	.num_funcs =3D ARRAY_SIZE(pinctrl_funcs),
> +	.confs_info =3D {
> +		[AIROHA_PINCTRL_CONFS_PULLUP] =3D {
> +			.confs =3D pinctrl_pullup_conf,
> +			.num_confs =3D ARRAY_SIZE(pinctrl_pullup_conf),
> +		},
> +		[AIROHA_PINCTRL_CONFS_PULLDOWN] =3D {
> +			.confs =3D pinctrl_pulldown_conf,
> +			.num_confs =3D ARRAY_SIZE(pinctrl_pulldown_conf),
> +		},
> +		[AIROHA_PINCTRL_CONFS_DRIVE_E2] =3D {
> +			.confs =3D pinctrl_drive_e2_conf,
> +			.num_confs =3D ARRAY_SIZE(pinctrl_drive_e2_conf),
> +		},
> +		[AIROHA_PINCTRL_CONFS_DRIVE_E4] =3D {
> +			.confs =3D pinctrl_drive_e4_conf,
> +			.num_confs =3D ARRAY_SIZE(pinctrl_drive_e4_conf),
> +		},
> +	},
> +};

[Severity: High]
Does this miss the open-drain configuration array (AIROHA_PINCTRL_CONFS_PCI=
E_RST_OD)?

The EN7523 device tree binding explicitly defines open-drain configurations
for pcie_reset pins. If a consumer device requests open-drain configuration,
the pinctrl core will try to apply it.

Because this confs_info array omits AIROHA_PINCTRL_CONFS_PCIE_RST_OD,
airoha_pinctrl_get_conf_reg() will return NULL, causing airoha_pinctrl_set_=
conf()
to return -EINVAL:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinctrl_set_conf() {
    ...
    reg =3D airoha_pinctrl_get_conf_reg(confs_info->confs,
                                      confs_info->num_confs,
                                      pin);
    if (!reg)
        return -EINVAL;
    ...
}

Since the pinctrl core treats -EINVAL as a fatal error (unlike -ENOTSUPP),
will this permanently fail the pin configuration and abort the consumer
device's probe?

[ ... ]

> +static struct platform_driver airoha_pinctrl_driver =3D {
> +	.probe =3D airoha_pinctrl_probe,
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
This isn't a bug introduced by this patch, but will this probe succeed on
EN7523?

Looking at airoha_pinctrl_probe() in pinctrl-airoha.c, the SCU compatible
string is currently hardcoded:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinctrl_probe() {
    ...
    map =3D syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
    ...
}

If the EN7523 device tree correctly uses its own SCU compatible (e.g.,
"airoha,en7523-chip-scu") instead of the EN7581 string, will the lookup fail
and abort the probe for the entire SoC?

> +	.driver =3D {
> +		.name =3D "pinctrl-airoha-en7523",
> +		.of_match_table =3D airoha_pinctrl_of_match,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D34
