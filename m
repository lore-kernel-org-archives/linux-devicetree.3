Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE24380FFB
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860601; cv=none; b=dPbbBoqYxmqrrrfBLPH1kvSzaFnt6fVNmIhB5cL6g+PPP3A9mS/olK2Ts5eJ3F+6BPsXp66wAHyzNgJgRaN5jrHIOFGcsPoWGD4knZYbazVGFnAlt5j3UdPgJ009e1trmjn/ZDTQL3Uxc++m4ohYb1uuoW2EpnqMBBtclYyvS0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860601; c=relaxed/simple;
	bh=1dHYX1ENDmeyN9WDsXdnpVJouTxVzPPh7D7Ht3uj5Hc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TkRGeDfpMcnbkBOCITomm2leNUUFhSlU3nbikgMOq1cXJIGeG77Jmux39QP0ShNKsxmcqro6rB9s27jBGqSWEAYa9usDkNS0V79r2xCm5gkWxjSZ792DqguX4f6UUwZacce2NUK8+LgiouP3NFzeHQs+FBl6LF9MstPyZN/GJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bz/f5XCm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bz/f5XCm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8331F000E9;
	Tue,  4 Aug 2026 16:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860599;
	bh=MMqjVSFxgen0lYnzrDbida01K+TpKnYNsXRPBmFyyq8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bz/f5XCmBstH+kkMtzF2TJomiyt1d26LzI06p0seIBsFuTfS4kwxbCY3NItEZCWT4
	 kc7mqcIeXjBpDb+mqofKk9NQm2hMMyy/0QgAgKPINk3j0ozKO6QStBDJbSaAmjA/VW
	 SfgxZd9ZXuvzqZBtRQpzZVITkQKFxxOLDApm2S60fTRZsRs4Frm0seq2Vwxnnc2siw
	 M4GnF3uPOGAQ0dcPTQEHgo1a3Kpp/+W1/6/dxbtXqWkrtBfB0IGXhiCIYF0fhRDRJA
	 Q4DyxwbBgVDRkmHJqyoNZCz1/gTWqsAVNIW91RIg/hB62vKqM7PFgbmrTa0CyhM68C
	 FPTCbeP62JRNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 16/36] pinctrl: airoha: minor improvements
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804160419.3592327-17-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-17-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:23:19 +0000
Message-Id: <20260804162319.6A8331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The newly added function-scoped `err` variable is shadowed by an ex=
isting local `err` variable inside the switch statement.

Pre-existing issues:
- [High] The commit adds missing error checks for PIN_CONFIG_BIAS_* setting=
s but fails to do the same for PIN_CONFIG_DRIVE_STRENGTH and PIN_CONFIG_DRI=
VE_OPEN_DRAIN in the same switch statement.
--

--- Patch [16]: [PATCH v9 16/36] pinctrl: airoha: minor improvements ---
commit f4dfe61b91abddcba631650033db26be051c2e35
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: minor improvements

Changes:
 * use field_get() macro instead of direct bit operations
 * improve error handling

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index e4ccf357df892..f982a75d4253e 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
[ ... ]
> @@ -2996,7 +2996,7 @@ static int airoha_pinconf_set(struct pinctrl_dev *p=
ctrl_dev,
>  			      unsigned int num_configs)
>  {
>  	struct airoha_pinctrl *pinctrl =3D pinctrl_dev_get_drvdata(pctrl_dev);
> -	int i;
> +	int i, err;

[Severity: Low]
Does the inner err declaration inside the PIN_CONFIG_OUTPUT_ENABLE block
shadow this newly added function-scoped err variable?

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinconf_set() {
    ...
		case PIN_CONFIG_OUTPUT_ENABLE:
		case PIN_CONFIG_INPUT_ENABLE:
		case PIN_CONFIG_LEVEL: {
			bool input =3D param =3D=3D PIN_CONFIG_INPUT_ENABLE;
			int err;
    ...
}

This could trigger -Wshadow compiler warnings.

> =20
>  	for (i =3D 0; i < num_configs; i++) {
>  		u32 param =3D pinconf_to_config_param(configs[i]);
[ ... ]
>  		case PIN_CONFIG_BIAS_PULL_DOWN:
> -			airoha_pinctrl_set_pulldown_conf(pinctrl, pin, 1);
> -			airoha_pinctrl_set_pullup_conf(pinctrl, pin, 0);
> +			err =3D airoha_pinctrl_set_pulldown_conf(pinctrl, pin, 1);
> +			if (err)
> +				return err;
> +
> +			err =3D airoha_pinctrl_set_pullup_conf(pinctrl, pin, 0);
> +			if (err)
> +				return err;
> +
>  			break;
>  		case PIN_CONFIG_DRIVE_STRENGTH: {
>  			u32 e2 =3D 0, e4 =3D 0;

[Severity: High]
This is a pre-existing issue, but since this patch improves error handling =
for
the PIN_CONFIG_BIAS_* settings, shouldn't we also check the return values f=
or
PIN_CONFIG_DRIVE_STRENGTH and PIN_CONFIG_DRIVE_OPEN_DRAIN in the same switch
statement?

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinconf_set() {
    ...
			airoha_pinctrl_set_drive_e2_conf(pinctrl, pin, e2);
			airoha_pinctrl_set_drive_e4_conf(pinctrl, pin, e4);
			break;
		}
		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
			airoha_pinctrl_set_pcie_rst_od_conf(pinctrl, pin, !!arg);
			break;
    ...
}

If a caller requests these configurations on a pin that does not support th=
em,
the underlying airoha_pinctrl_get_conf_reg() returns NULL, causing
airoha_pinctrl_set_conf() to return -EINVAL.

Because the macro invocations ignore this return value, airoha_pinconf_set()
silently succeeds. Could this make board bring-up or device configuration b=
ugs
hard to debug?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D16
