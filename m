Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CA74D6C34
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070807; cv=none; b=cWP+fFxIR52v6ciFDoKJ9kyrNFKyVPqPU63eFyMB8hvlMtzxCxXgAPpCRxn4G9MQ7cAjDjtNiMaQVjr2RKNrHtJkliCucZWq1hvzw/NTj8Dy7WtlMhcLjCuAiFC9yqnrgzYq8BIwaetHjFaFHru/3DlPnjp4pv43QcunKSDy7Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070807; c=relaxed/simple;
	bh=gFrPVDC5DPDb5Pxzs5zwAsF34aVIEx6QBi+d0ixDiLw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SJxAmKqLKBGLdNjLUmqB+De+tc2LxNHyu4nZG9pE3R5XJdWINR5gKtVk2SgqZRtoU1PD0A3gxi2gjsxZMaYt1cAdIndJ0jqIxmQkI+vrzRgSp02F+9v5gozuIxTtzvFGaV80VVWRui9TgkPf4pwZFwoN9afLeZkF2I3zhui67C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzOAyVtS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzOAyVtS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2C21F000FF;
	Tue, 22 Sep 2026 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790070805;
	bh=7HgYadzINES0J5/XIPrmls1R1qjwWIZq+Jrr7ji1ETc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fzOAyVtSj8qrDhCNFYGb2exeOQdmSKQKEUtiuJQJ3oBIcD6xp6WrWog//KkiRf3zf
	 D/zf6ftK5ku0ExccorDt/bmrAJenkHL8RvP60WsZ6O1onGn65BFpbLEssM6y6zt1EK
	 SQpwE7OH6fw5bZbM+FpXCjBEnexn5c9QtMdqj2dJDNy12Ioxqs0Rikggb62vRKivxo
	 SsrmK7F9JRmrEN0yKx3nuAp6TFdTObHK+9ukHKgrn9A/O3Ji/kxu0QaX2wqwJE1kqF
	 ghJGB4d87tluq04lNStRCghESblH+QqKEimE6P98p01mlJKALfvGcGR5YgeY83OCI2
	 FIpyLOWTaPiFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/8] ASoC: qcom: lpass-va-macro: Add shikra
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260922-add_shikra_support-v1-4-6c6cb6444caf@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-4-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:53:25 +0000
Message-Id: <20260922095325.7D2C21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ASoC: lpass-va-macro: static version assignment bypasses hardwar=
e cross-check
--

commit 56f2a447aaf7dc3ac69e03680c277ea0d7300890
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: lpass-va-macro: Add shikra compatible

This commit adds shikra specific VA macro data and register programming
needed by the LPASS codec v4.1 implementation. It extends the VA macro
with four adaptive filter blocks and adds the new registers as a separate
reg_default array.

> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-v=
a-macro.c
> index 03d6434a4a126..02dc3346924f1 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
[ ... ]
> @@ -463,6 +674,27 @@ static const struct regmap_config va_regmap_config =
=3D {
[ ... ]
> +static const struct regmap_config va_4_1_regmap_config =3D {
> +	.name =3D "va_macro",
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.cache_type =3D REGCACHE_MAPLE,
> +	.reg_defaults =3D va_4_1_defaults,
> +	.num_reg_defaults =3D ARRAY_SIZE(va_4_1_defaults),
> +	.max_register =3D VA_4_1_MAX_OFFSET,
> +	.volatile_reg =3D va_is_volatile_register,
> +	.readable_reg =3D va_is_readable_register,
> +	.writeable_reg =3D va_is_rw_register,
> +};
> +
> +static const struct va_macro_data shikra_va_data =3D {
> +	.has_swr_master =3D true,
> +	.has_npl_clk =3D true,
> +	.version =3D LPASS_CODEC_VERSION_4_1,

[Severity: Medium]
Does this static version assignment bypass the hardware cross-check?

The commit message states that probe cross-checks the register layout again=
st
the version reported by the hardware. However, setting the version here cau=
ses
the probe function to skip reading the hardware register entirely:

sound/soc/codecs/lpass-va-macro.c:va_macro_probe() {
	...
	if (data->version) {
		lpass_macro_set_codec_version(data->version);
	} else {
		/* read version from register */
		ret =3D va_macro_set_lpass_codec_version(va);
		if (ret)
			goto err_rpm_put;
	}
	...
}

Because data->version evaluates to true for the shikra compatible,
va_macro_set_lpass_codec_version() is bypassed. If a mismatched device tree
is booted on older hardware that is not v4.1, could this lead to bus errors
by accessing unsupported ADPT registers?

> +	.regmap_config =3D &va_4_1_regmap_config,
> +};
> +
>  static int va_clk_rsc_fs_gen_request(struct va_macro *va, bool enable)
>  {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-add_shikra=
_support-v1-0-6c6cb6444caf@oss.qualcomm.com?part=3D4
