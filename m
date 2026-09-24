Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A8A47FAEB
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255035; cv=none; b=YIHzx5qbrzNE2txDXYN2AQ27Yzdcuxab6Bwpzl/EOMGs7qgR5c9BxbYkf+yg91S+b1481qnhIXXjHISH5S55Jsc4abGN35gTKaZBU9HHtP0/SSKeq2dsnRdiqtdlMil+WzJend+/1UORFDt2cCWgBaiKmXMlLp+fNmNOSQgZSys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255035; c=relaxed/simple;
	bh=KGPQ6MITfvlqY6Wdkayx3we3/YpxhcCnB4M7C9On/ko=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lh3nAC9lkv8bARdQIhTOT4FOp0Nssms+Db+VQOQKSgGIJhz+haSFhkW+lYUw4n4OBRukR2aBLS4Jf5iGT3yE7zYkfL93mIDWYCDE27a8DIrofQmCUNVEcDdOEHxKgcXMNimdjtgzAj+kmSkKud5oS8K11uUn1R09NitnZhWDDFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n1IS+Mc9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n1IS+Mc9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3121F000FF;
	Thu, 24 Sep 2026 13:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790255030;
	bh=dliUa4ou0CGJKNOr+oiqf/N5tkiLGOzPf8VsTYhm+04=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n1IS+Mc9dOl+NQc3ssVlVOQrKn6xAMiW7CTJEFBdFiApnGCEDdqQzDC2m4JzoX4WK
	 UKUXqgUSJJTIyrildS3XVsUuzheuD898RkrIWYjm2Py21qj+aX1WYcYGRUV8en9qI9
	 8jxhNBrRH7mlyXMNbhLc5cgS/4CvAaPjnUqtA1FS0u4fLgOzni5Dy5altIjQQ1HZkA
	 bh+sq4d9iXrCEWYhoxATvHp3To7oBwklxxSeAm8+QfM7vzTRHPikYTV+RifpFNHRP6
	 ObVinTPN3EjkIuws0YE8B/Ya8GafKSoSPv/D3XzgUN58igF1997ZRSmvxK8TBVRw3i
	 wztZXdMjKBifg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/8] ASoC: cs35l36: Implement set_tdm_slot to program
 RX and TX slots
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924-pixel3-audio-v3-5-5d06460fc8a9@ixit.cz>
References: <20260924-pixel3-audio-v3-0-5d06460fc8a9@ixit.cz>
 <20260924-pixel3-audio-v3-5-5d06460fc8a9@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 13:03:49 +0000
Message-Id: <20260924130349.DC3121F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] ASoC: cs35l36: I2S bus contention from unmapped TDM channels
- [High] ASoC: cs35l36: DAPM kcontrol corrupts TDM slot configuration
- [Medium] ASoC: cs35l36: missing error propagation for invalid TDM mask
- [Low] ASoC: cs35l36: inverted TDM mask perspective in comment
--

commit caaab40c1180fd182ef9f5dce19a698193666d09
Author: David Heidelberg <david@ixit.cz>

ASoC: cs35l36: Implement set_tdm_slot to program RX and TX slots

This commit introduces the set_tdm_slot callback for the CS35L36 codec to
allow machine drivers to dynamically program ASP RX and TX slot assignments.
The new configuration maps each bit set in the provided TDM masks to
consecutive hardware channels, enforcing maximum channel limits.

> diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
> index 89645327945f1..4d35ca6291548 100644
> --- a/sound/soc/codecs/cs35l36.c
> +++ b/sound/soc/codecs/cs35l36.c
> @@ -947,10 +947,54 @@ static const struct cs35l36_pll_config *cs35l36_get=
_clk_config(
>  	return NULL;
>  }
> =20
> +static void cs35l36_mask_to_slots(struct cs35l36_private *cs35l36,
> +				  unsigned long mask, unsigned int base_reg,
> +				  unsigned int nchan)
> +{
> +	unsigned int chan =3D 0, shift;
> +	int slot;
> +
> +	/* Two 6-bit slot fields per register, at bits 0 and 16 */
> +	for_each_set_bit(slot, &mask, BITS_PER_TYPE(mask)) {
> +		if (chan =3D=3D nchan) {
> +			dev_warn(cs35l36->dev,
> +				 "Too many slots in TDM mask: %lx\n", mask);
> +			return;

[Severity: Medium]
Will this error state be lost since this function returns void?

If a machine driver passes a mask with more bits set than supported channel=
s,
this warning prints, but cs35l36_set_tdm_slot() continues and unconditional=
ly
returns 0.

Should this configuration failure be propagated back to the sound framework
by returning a negative error code instead?

> +		}
> +
> +		shift =3D (chan % 2) * CS35L36_ASP_TX2_SLOT_SHIFT;
> +		regmap_update_bits(cs35l36->regmap, base_reg + (chan / 2) * 4,
> +				   CS35L36_ASP_RX1_SLOT_MASK << shift,
> +				   slot << shift);
> +		chan++;
> +	}

[Severity: High]
Does this leave remaining channels unmapped on their default slots if the
provided mask specifies fewer slots than the total channels?

In a multi-codec setup, the CPU DAI typically opens the stream with the tot=
al
number of channels on the bus. DAPM then powers on all asptx widgets up to
that channel count.

If we only map a subset of slots here, the remaining powered-on channels
will retain their hardware default slots and actively transmit on them.

Could this lead to hardware contention on the I2S bus and data corruption by
colliding with properly mapped channels or other codecs?

> +}
> +
> +static int cs35l36_set_tdm_slot(struct snd_soc_dai *dai,
> +				unsigned int tx_mask, unsigned int rx_mask,
> +				int slots, int slot_width)
> +{
> +	struct cs35l36_private *cs35l36 =3D
> +			snd_soc_component_get_drvdata(dai->component);
> +
> +	/* Note: rx/tx is from point of view of the CPU end */

[Severity: Low]
Is this comment accurate? The implementation below maps rx_mask to the
codec's rx register and tx_mask to the codec's tx register.

If it were from the CPU's point of view, the CPU's rx mask would map to the
codec's tx. The code correctly follows ASoC semantics (from the codec's
perspective), which makes the comment appear inverted.

> +	if (!slots || !rx_mask)
> +		rx_mask =3D BIT(0);		/* ASPRX1 in slot 0 */
> +
> +	if (!slots || !tx_mask)
> +		tx_mask =3D GENMASK(7, 0);	/* ASPTX1..8 in slots 0..7 */
> +
> +	cs35l36_mask_to_slots(cs35l36, rx_mask, CS35L36_ASP_RX1_SLOT, 1);

[Severity: High]
Could programming CS35L36_ASP_RX1_SLOT here conflict with the existing
DAPM kcontrol?

There appears to be a legacy DAPM kcontrol (cs35l36_chan_mux / chansel_enum)
that operates on bit 0 of this exact same register to toggle between
rx1 and rx2.

If a machine driver sets the rx slot to a value like 2 (binary 000010) here,
and userspace later restores the Input Mux kcontrol, could the framework
forcefully toggle bit 0 and inadvertently change the slot configuration?

> +	cs35l36_mask_to_slots(cs35l36, tx_mask, CS35L36_ASP_TX1_TX2_SLOT, 8);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-pixel3-aud=
io-v3-0-5d06460fc8a9@ixit.cz?part=3D5
