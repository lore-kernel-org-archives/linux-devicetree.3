Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF5A39446D
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 18:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788460859; cv=none; b=ra7ybxta6U/x7KOS0smjZc+RlZw6WcGaIMwe/VwIYd+roioxKeLXLYFZ3g8/kBvOiMJ1HchD+hBquINOHrTfT9ayNsOEngZPJ34/MsUepHvLqqrJ4Lp8L+MGw48Dn1PudhruAag3eh/G8lE/kZiF8omuuyOTVsVhAtac/4SVKgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788460859; c=relaxed/simple;
	bh=+Vx5LCYENnyFzFX8jcJ6SYmi5+eqDrMsHMOW7XfdtIg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B/nx9HaTK2eCkiFmjNrP1feGSrG0457jWhRe+GU7QeYgByHLofDipteESj/ERyAWKzd9i0vTHB/D5w+yblPCS6Kdmki15xk1Wmqx6z56l9hE0SWTi3bdTitKBw287As1qCNDlGA/iW8zQNPndD4rzsjrGHEBw0cwJGZKVxyKMQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XyxbS+P4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyxbS+P4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B225E1F000E9;
	Thu,  3 Sep 2026 18:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788460857;
	bh=jPd/adH93nyLA0bhhJAIL2pyuEGtKyvNcTMgTbmQ8ao=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XyxbS+P4BZU5bbwZLBYsm034g3HoHqgL6fvLIVhJjcJ6xdBHgRuHYHAVuyTOEV5a4
	 ktbSw685oZB+y0BIjfBboH78q36ddsasMou/NM3mAUgv0wKGZ5K2Z2Xu+KuvJA2Fzd
	 baGqbzvJ9SzpD7pdxDZkuqNsY1HnCc2T8Rgj7sTdzbH1TcsAKDNDK4UnafL1FPwuOq
	 4hu2pW5xFdGJVgyH2uY1FAO9K4Po+4D147oQYJjS/WeAM2/l84pmsoVkuAy/492qPI
	 e6C+YhklJnbVh/4QLwAlpmeb8AW2iREoiiElA0pglPV2F3aMnfsCJ4+Up43XamLcLu
	 9YcCqKN7Ib5cg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 5/6] ASoC: cs35l36: Implement set_tdm_slot to
 program RX and TX slots
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260903-pixel3-audio-v2-5-7c22ed915291@ixit.cz>
References: <20260903-pixel3-audio-v2-0-7c22ed915291@ixit.cz>
 <20260903-pixel3-audio-v2-5-7c22ed915291@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 18:40:56 +0000
Message-Id: <20260903184056.B225E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unmapped TDM channels are not disabled and retain their default sl=
ot assignments, leading to TDM slot collisions.
- [High] The new set_tdm_slot configures the RX TDM slot via a register tha=
t aliases an existing ALSA user control, introducing state corruption.
--

commit af0d8ef24a330447b6254f7aa04fa7142a333d1b
Author: David Heidelberg <david@ixit.cz>

ASoC: cs35l36: Implement set_tdm_slot to program RX and TX slots

This commit implements the set_tdm_slot DAI operation for the CS35L36 codec,
allowing machine drivers to program ASP RX and TX slots. It maps bits in the
provided RX and TX masks to consecutive codec channels, and sets hardware
defaults if no slots are passed.

> diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
> index 89645327945f1..4d35ca6291548 100644
> --- a/sound/soc/codecs/cs35l36.c
> +++ b/sound/soc/codecs/cs35l36.c

[ ... ]

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
> +		}
> +
> +		shift =3D (chan % 2) * CS35L36_ASP_TX2_SLOT_SHIFT;
> +		regmap_update_bits(cs35l36->regmap, base_reg + (chan / 2) * 4,
> +				   CS35L36_ASP_RX1_SLOT_MASK << shift,
> +				   slot << shift);
> +		chan++;
> +	}

[Severity: High]
What happens to the remaining hardware channels if the provided mask has fe=
wer
set bits than the total number of hardware channels?

The loop finishes processing once all set bits are consumed, which seems to
ignore the remaining hardware channels and leaves them in a potentially
dangerous active state on their default slots.

For example, if a machine driver passes a tx_mask with fewer set bits than =
the
total number of hardware channels (8) to map a subset of slots (e.g.,
tx_mask =3D 0x30 to use slots 4 and 5), this loop assigns those slots to the
first channels (ASPTX1 and ASPTX2). It terminates early without modifying t=
he
remaining channels (ASPTX3..8), leaving them at their hardware default slots
(slots 2..7).

If DAPM later enables these unmapped channels (e.g., via the 'AMP Capture'
path), they will transmit on their default slots. In this example, ASPTX5
defaults to slot 4, which collides directly with the explicitly mapped ASPT=
X1
on slot 4.

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
Does configuring the RX TDM slot via CS35L36_ASP_RX1_SLOT alias an existing
ALSA user control?

The driver exposes bit 0 of this exact register to userspace as a DAPM audio
routing control ('Input Mux') here:

sound/soc/codecs/cs35l36.c:
    static SOC_ENUM_SINGLE_DECL(chansel_enum, CS35L36_ASP_RX1_SLOT, 0,
                                cs35l36_chan_text);

Because both the DAI configuration callback and an ALSA user control manage=
 the
LSB of this register, will saving and restoring ALSA state (e.g., via
alsactl restore on boot) silently overwrite bit 0 of the TDM slot configured
by the machine driver?

For example, if the machine driver configures TDM slot 4 (binary 100), and
userspace restores 'RX2' (value 1), the slot will be corrupted to 5
(binary 101), breaking the machine driver's hardware configuration.

> +	cs35l36_mask_to_slots(cs35l36, tx_mask, CS35L36_ASP_TX1_TX2_SLOT, 8);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-pixel3-aud=
io-v2-0-7c22ed915291@ixit.cz?part=3D5
