Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC4B39D6E9
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 22:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786747302; cv=none; b=j4ruyD4EKz3WV3peklWPU9OKFIf9UGhWE3S8dSpr6iXr32PX6f68luS1JXsyez28vUDMm+Cg+xjEUuqiEvVl3+zMmavi2As4WiojDLo2WypdutYDoXFhCm1J2uup9rRabzO4sjz7st9J8mC9Tao/dkMw6EJaJG4ClbRp24fEEss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786747302; c=relaxed/simple;
	bh=Wu1sf/stBRoh2XIeKqACIsDyhi841ybKR2dLMLUH8jo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U/zALkL3nzuHwFiuaDLA4tNDcyx7IqSBineBENPGT0PQP9rEXKEztHdNr/wJmZNh+XSEQ7daDAsFKuLCq37RtpM6F8sCqsG9bcgrYHnYiZigv+f7PNBMIqV7q9kUOyL6pRjbRUkX3biogL7Vqhh6Yjx5EssnQo+5uAFWl7DmJVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDrElyU2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDrElyU2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD311F000E9;
	Fri, 14 Aug 2026 22:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786747301;
	bh=V2Ub4oKMma+l5nNMJgNr7zD0tS4PTD9jfmCz5z6uZ6I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SDrElyU2VNVLQI3wgU1iWmffoRKmLLH7inCSozjIjBQSxsQOctRRB+HUe40+VmU51
	 d470T3U8NNX7vfDpraZo8ImKDY75Inc2p4WWqJQOoilO6MfQkJn/IcWaTY5qWDBqTk
	 5/jv6sItwt/ARyeOGPeGNOsM9r2xxiKP9502iejn+OCHpOOmcwW0yQeCE8yuHtPXuS
	 Lr8gyIMGJEXa3v3Rsk/mtaaWBvo3VMEdqLswO8i6qDVcMTsrULmQ1M0ogq6cH1YlVw
	 LdMOXqL7iJ1ipMOCgJs5NBeeFMYuhReDpIM3ux6apXwsfwen/vYbe73B2e1+zVvhS7
	 gdZz6nrFv3Few==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: cs35l45: Adds support for SYNC bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ricardo Rivera-Matos" <rriveram@opensource.cirrus.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260814223456.611160-2-rriveram@opensource.cirrus.com>
References: <20260814223456.611160-1-rriveram@opensource.cirrus.com>
 <20260814223456.611160-2-rriveram@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 22:41:40 +0000
Message-Id: <20260814224141.0AD311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] cs35l45_sync_en_put() incorrectly returns 0 instead of 1 when th=
e control value is successfully changed.
- [Medium] The driver ignores hardware update failures in cs35l45_sync_en_p=
ut(), potentially desynchronizing software and hardware state.
--

--- Patch [2]: [PATCH v2 2/2] ASoC: cs35l45: Adds support for SYNC bus ---
commit 6cfd479679d81732828972b84bd776a3f10f10e2
Author: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>

ASoC: cs35l45: Adds support for SYNC bus

Adds support for the multidevice synchronization (SYNC) bus. Initial
support only includes software (SW) data packets.

> diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
> index a032bb23b4ac7..9f0cdfe9fb92e 100644
> --- a/sound/soc/codecs/cs35l45.c
> +++ b/sound/soc/codecs/cs35l45.c

[ ... ]

> +static int cs35l45_sync_en_put(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D
> +			snd_soc_kcontrol_component(kcontrol);
> +	struct cs35l45_private *cs35l45 =3D
> +			snd_soc_component_get_drvdata(component);
> +
> +	if (!cs35l45->sync_pin_set)
> +		return -EPERM;
> +
> +	if (ucontrol->value.integer.value[0] =3D=3D cs35l45->sync_en)
> +		return 0;
> +
> +	if ((bool)ucontrol->value.integer.value[0])
> +		regmap_set_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_=
EN_MASK);
> +	else
> +		regmap_clear_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYN=
C_EN_MASK);
> +
> +	cs35l45->sync_en =3D ucontrol->value.integer.value[0];

[Severity: Medium]
Does this code need to check the return value of regmap_set_bits() and
regmap_clear_bits() before updating the local software cache?

If the I2C/SPI bus transaction fails, cs35l45->sync_en will be updated even
though the hardware state remains unchanged, potentially desynchronizing
software and hardware state.

> +
> +	return 0;

[Severity: Medium]
Should this return 1 instead of 0 when the value is actually changed?

In the ALSA kcontrol API, put callbacks must return 1 when the hardware or
cached state is successfully changed, so that ALSA mixer UIs and audio serv=
ers
receive a SNDRV_CTL_EVENT_MASK_VALUE notification. Returning 0 here might l=
ead
to state desynchronization in userspace.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814223456.6111=
60-1-rriveram@opensource.cirrus.com?part=3D2
