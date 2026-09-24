Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66AF48CD6D
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256987; cv=none; b=KbOYfgHd9WiMNniyZC6AQGunWenVcpZn66wk1WHJMYubZ/+RNT4oyPe7EfxUHV3cLqS33aR4agaVqtpeovUGzDRBRPjTimvWm7DI5m77rSNN6Nv9b6LnJP7EGKtW0qCoBwaOkOHtOjs3W7hxaP7/cjR4ZO0XSKSNnNmMxM0Bg2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256987; c=relaxed/simple;
	bh=WFOYeFzUZGl1S6UF0vRHWcRC5FwhBGmt2v/s7HMfBug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Eivmb+2nnPUwaSlH1dVECW63c4HzzRPBVHCOo6f8Cem/bxeKJiCjRE+3tvwpI01GTLAs49K1/ys1ejX7o1ctdNTOHNhAAB29g/NmbF2KMbPIngMFAfwL7eswi3LnUZDyG6ukXCgi3Om4HcYJ/9VAXuwoPxhjKnXyZvqIuTvyKDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcME7i0E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcME7i0E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BB81F000FF;
	Thu, 24 Sep 2026 13:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790256975;
	bh=OIHZqnAFy4Lt89MbHK5keefC/+L2Q1ZgPR+xETqPmPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jcME7i0EJ9ehpYN0wA+c9LLRCuLfc4WMc3oTvIyGkkdwIfHl0RILOT34o/konmOFp
	 JNWeUhytg2dr2cyslHDxR2tSJPv4spH8+JLaGFOr7HWMw9OWH8VeJaokwvD5og3itF
	 sW/WpaWgctb1GtxtUvnxMJnlk92lMIKSgCXuQzs6KOTnzrR+Pw7WMYc4cSp40GyEBG
	 WznEbwYjetfiPLOI3a7qQCf+inICJWJcVIMkt9vM2yosAmzy0QAREAmBVQ6EVazcMF
	 U8XJ90e5taSRIGDPeDVPpxRJBFjfV31o+ieXJVVewPVVvYs2OpW5nSYqcRA7ln7UQx
	 Nl0WCvk9ZnQcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/8] ASoC: cs35l36: Implement set_tdm_slot to program
 RX and TX slots
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260924-pixel3-audio-v4-5-85b5d133aa5e@ixit.cz>
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
 <20260924-pixel3-audio-v4-5-85b5d133aa5e@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 13:36:14 +0000
Message-Id: <20260924133615.19BB81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ASoC: cs35l36: DAPM 'Input Mux' conflicts with set_tdm_slot over A=
SP_RX1_SLOT
--

commit b9a33ee349c8716b47c6a0d1a24434c14d2f72d5
Author: David Heidelberg <david@ixit.cz>

ASoC: cs35l36: Implement set_tdm_slot to program RX and TX slots

Program the ASP RX and TX slot registers from the TDM masks passed by
the machine driver. Each set bit in a mask names a slot; codec channels
are assigned to those slots in order, ASPRX1 taking the first RX slot
and ASPTX1..TX8 the first eight TX slots.

> diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
> index 170588be4dbe3..5fc8ec292e3c4 100644
> --- a/sound/soc/codecs/cs35l36.c
> +++ b/sound/soc/codecs/cs35l36.c
[ ... ]
> @@ -947,6 +947,49 @@ static const struct cs35l36_pll_config *cs35l36_get_=
clk_config(
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
> +		}
> +
> +		shift =3D (chan % 2) * CS35L36_ASP_TX2_SLOT_SHIFT;
> +		regmap_update_bits(cs35l36->regmap, base_reg + (chan / 2) * 4,
> +				   CS35L36_ASP_RX1_SLOT_MASK << shift,
> +				   slot << shift);
> +		chan++;
> +	}
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
> +	if (!slots || !rx_mask)
> +		rx_mask =3D BIT(0);		/* ASPRX1 in slot 0 */
> +
> +	if (!slots || !tx_mask)
> +		tx_mask =3D GENMASK(7, 0);	/* ASPTX1..8 in slots 0..7 */
> +
> +	cs35l36_mask_to_slots(cs35l36, rx_mask, CS35L36_ASP_RX1_SLOT, 1);

[Severity: High]
Does overwriting CS35L36_ASP_RX1_SLOT here conflict with the DAPM "Input Mu=
x"
control?

The CS35L36_ASP_RX1_SLOT register is already exposed to userspace as a DAPM
enum (chansel_enum).

If a machine driver sets the TDM slot using snd_soc_dai_set_tdm_slot(), it
overwrites this register via regmap_update_bits() in cs35l36_mask_to_slots(=
).

However, if userspace later modifies the mixer control, DAPM will write back
to the register. Because the enum only covers 1 bit (options 'RX1' and 'RX2=
'),
it will overwrite bit 0, corrupting the TDM slot assigned by the machine
driver.

Can this cause the ALSA DAPM state to fall out of sync with the hardware and
allow unprivileged userspace to unknowingly break audio routing?

> +	cs35l36_mask_to_slots(cs35l36, tx_mask, CS35L36_ASP_TX1_TX2_SLOT, 8);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-pixel3-aud=
io-v4-0-85b5d133aa5e@ixit.cz?part=3D5
