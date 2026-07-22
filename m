Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EC32ECE86
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784764661; cv=none; b=GnFQjZo62f3q4WiISp5ynlW1xMZ//iXiOv0i1GD5TkrxZ9YXCoVcIiVLqDDl34XmdyE8qqdQk+UOa4PM+YL7ks7Zy5W5eLej0y5vZ9hNFi3lN6dyxgsQ13Tp1dO/gxRecL24o3Xtf9jhxrdoOtYMt0DrxL/gUX9B3UwhwU1A9l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784764661; c=relaxed/simple;
	bh=rknCAmiPDh1K+zxeu49rhDx19pyFIGE6PFMJONao1nQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hlkd3tVwoNLhlmLNKfR/m4WsEOE4TKnzoXWMV8+mEwKkdVrsCO77c2/Lh2wiik34nqKqBky9nLEb0rwllrhhsTTFCcebWhtz/BH7aLWWHIVv97Br18kLznqCzW5ma+23HnFTq2VZXX8HZpinCUqFha+MpYbWEZq7ph85yR7lakI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W81R3YPC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W81R3YPC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5C11F000E9;
	Wed, 22 Jul 2026 23:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784764659;
	bh=TXngCbX43XpZCoZpb7d8WOaSMM4EWZ54yO62tHPcx9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W81R3YPCd1dbSPwrTEAf0YNknvqZHDGhM8xXRutastCy+ZLsehekgyZGBW8nDIkHZ
	 l686OeEgYpDNmnj5Ik6CGBlOowIj9suhI2AVXnimIwwoKMwRjVvDmHmCccat9HX7dT
	 1vDAylCLEPsu062URiznIcmR/nZIx9JWpblzw3rZUm9SasGVNEZUH8L8d+UZcSva3j
	 pHU6jMKvMOq72+aur/Gx3xWnxBe+aluBg+ziicBpdtbfTMcfhvrezSoKskzm07swaD
	 94yMJrf1WTJXzH20h4npuLEC60o+y3n7ZO+pLj93r25n4ax1OIH1aJw2+qg4bxwVsd
	 g1vjscgQn7BvQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 5/8] ASoC: SDCA: class_function: xlate sound-dai
 cell by entity index
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722234221.884765-6-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-6-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 23:57:39 +0000
Message-Id: <20260722235739.6E5C11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing validation of `args->args_count` before accessing `args-=
>args[0]` leads to reading uninitialized stack memory, causing arbitrary DA=
I matching or information leaks, and breaking the fallback for zero-cell so=
und-dai references.
--

--- Patch [5]: [RFC PATCH 5/8] ASoC: SDCA: class_function: xlate sound-dai =
cell by entity index ---
commit 1d17bfb5417d13a6da7e95f412ebc5f6ec81d329
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: SDCA: class_function: xlate sound-dai cell by entity index
   =20
This commit registers a custom of_xlate_dai_name for SDCA functions. It map=
s=20
a "sound-dai" phandle cell to a DAI by matching the cell value against the=
=20
SDCA entity array index instead of relying on default positional mapping.

> diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_c=
lass_function.c
> index 905c96ed6172f..b0fbe243d732c 100644
> --- a/sound/soc/sdca/sdca_class_function.c
> +++ b/sound/soc/sdca/sdca_class_function.c
[ ... ]
> @@ -216,9 +216,44 @@ static int class_function_set_jack(struct snd_soc_co=
mponent *component,
[ ... ]
> +static int class_function_of_xlate_dai_name(struct snd_soc_component *co=
mponent,
> +					    const struct of_phandle_args *args,
> +					    const char **dai_name)
> +{
> +	struct class_function_drv *drv =3D snd_soc_component_get_drvdata(compon=
ent);
> +	struct sdca_function_data *function =3D drv->function;
> +	int target =3D args->args[0];

[Severity: Medium]
Could this read uninitialized stack memory if args->args_count is 0?

When a devicetree defines #sound-dai-cells =3D <0> for the SDCA function no=
de,
the core of_parse_phandle_with_args() successfully returns with args_count =
=3D 0.

Because the of_phandle_args structure is often allocated on the stack in=20
callers like snd_soc_of_get_dlc(), the args->args array is left uninitializ=
ed.

Does this code need to verify args->args_count >=3D 1 before accessing
args->args[0] to prevent matching against random stack values?

If args_count is 0, should it return -ENOTSUPP to allow ALSA's default
0-cell handling to proceed instead of returning -EINVAL?

> +	int i;
> +
> +	for (i =3D 0; i < function->num_entities - 1; i++) {
[ ... ]
> +		if (i =3D=3D target) {
> +			*dai_name =3D entity->label;
> +			return 0;
> +		}
> +	}
> +
> +	dev_err(component->dev, "xlate: no dataport entity at index %d (num_ent=
ities=3D%d)\n",
> +		target, function->num_entities);

[Severity: Medium]
If target is populated from an uninitialized args->args[0] due to a 0-cell
reference, does printing it here leak kernel stack memory to the log?

> +	return -EINVAL;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722234221.8847=
65-1-srinivas.kandagatla@oss.qualcomm.com?part=3D5
