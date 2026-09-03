Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220B51A9B24
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 18:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788460853; cv=none; b=CTxgHWD5InAf8nDqsxCzjZyM+Vqr6Thkhom/u/Ncs4eET1zYHVLV6zv/SG3cggdwPu8YbcjrfS+y4OUkLFBG03ImpekSzz5N5nFoaIzBNOt1kgRhzHOHCbUqZBnkuQJoEWPdK01WupuDoo5fVhIlFXRJg+8byJX+LDm1pa4aaOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788460853; c=relaxed/simple;
	bh=sJkucRnOrxsMBqIi2+HABeKh84vsHz4l75giYUOW9RI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZDs4CNfWVM3n/QhQi2gUgbuiRqnM3wJp56UuvQECqXspd6sbHvdpvhzx4fkZXHjpfOlpb/HPDn3fsVBN8JRrOcweJLnNSrd8YZP322lHZ7u/5LosQJ13Pb+sHkgoQLYfUsT1v/TGTgENIdMUEjoyK1rwzhR9/i4aUxxCVvHZcEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZNaPgdX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZNaPgdX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20BBA1F000E9;
	Thu,  3 Sep 2026 18:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788460850;
	bh=rNAo1GiIlWMnw8Ina0VGuw8NdzepSTapy0MxM3/txlM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CZNaPgdXuFzpnTbbTCvnPKa8OXezJ0SdOEBWGIZs3n9Xb52BDACXD79My91TxzCVb
	 3CGEW8tWF3yG0iKEchQiNssfNB2O+XblBkKYBNbRGEwGjc4jtFIaRrlAcJpHYyYDaz
	 YG+r6R7VNH/NoB1K7Zuuhgvnx4ScQ608ScwQeFwOk331s1rFsqA1yaBVfFaztkmIUk
	 /ueaS+gzszUKWiMy9PPK9xl993nKN6qtcWISHpWsBOeu6rAxf07fra1tCXu8ICRRPB
	 lp4CByDS+K+rRKY8KXyiGfPVqIyWxuIR/pHTpqtLd+9miR8Yt78aK/4O/J44BduRz/
	 nMlW5nwOfSw5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 1/6] ASoC: qcom: sdm845: Demystify TDM masks a
 bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260903-pixel3-audio-v2-1-7c22ed915291@ixit.cz>
References: <20260903-pixel3-audio-v2-0-7c22ed915291@ixit.cz>
 <20260903-pixel3-audio-v2-1-7c22ed915291@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 18:40:49 +0000
Message-Id: <20260903184050.20BBA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect semantic definition and conflation of TDM RX/TX masks for=
 the CPU capture path.
--

commit 14c4efbbf7408318c5b2824f99db089826af6b11
Author: David Heidelberg <david@ixit.cz>

ASoC: qcom: sdm845: Demystify TDM masks a bit

This commit attempts to clarify the TDM masks by defining individual bits
for left/right speakers and microphones instead of using hardcoded hex valu=
es.

> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 6843ab8ba017e..0ce8265ab1c1f 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -23,9 +23,14 @@
>  #define DEFAULT_MCLK_RATE		24576000
>  #define TDM_BCLK_RATE		6144000
>  #define MI2S_BCLK_RATE		1536000
> -#define LEFT_SPK_TDM_TX_MASK    0x30
> -#define RIGHT_SPK_TDM_TX_MASK   0xC0
> -#define SPK_TDM_RX_MASK         0x03
> +#define LEFT_SPK_TDM_RX_MASK	BIT(0)
> +#define RIGHT_SPK_TDM_RX_MASK	BIT(1)
> +#define SPK_TDM_RX_MASK		(LEFT_SPK_TDM_RX_MASK | RIGHT_SPK_TDM_RX_MASK)
> +#define MIC1_TDM_RX_MASK	BIT(2)
> +#define MIC2_TDM_RX_MASK	BIT(3)
> +#define MIC_TDM_RX_MASK		(MIC1_TDM_RX_MASK | MIC2_TDM_RX_MASK)

[Severity: Low]
Is this naming convention accurate for the hardware routing?

Microphones capture audio, meaning they transmit data to the CPU rather than
receive it. Naming this an RX mask seems to misrepresent the physical data
flow and makes the definitions confusing.

> +#define LEFT_SPK_TDM_TX_MASK	(BIT(4) | BIT(5))
> +#define RIGHT_SPK_TDM_TX_MASK	(BIT(6) | BIT(7))

[ ... ]

> @@ -128,8 +133,10 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_s=
ubstream *substream,
>  			goto end;
>  		}
>  	} else {
> -		ret =3D snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0,
> -				8, slot_width);
> +		ret =3D snd_soc_dai_set_tdm_slot(cpu_dai,
> +					       SPK_TDM_RX_MASK |
> +					       MIC_TDM_RX_MASK, 0,
> +					       NUM_TDM_SLOTS, slot_width);

[Severity: Low]
Does this combination of masks correctly reflect the TDM slot usage for
capture in sdm845_tdm_snd_hw_params()?

It appears the speaker mask, which defines playback slots on the DOUT wire,
is being combined with the new microphone mask merely to mathematically
reconstruct the previous 0xf value.

Using an RX mask to configure the CPU transmit mask, which reads from the
DIN wire, makes the capture path configuration difficult to follow. Could
we define a proper set of TX masks for the capture path instead?

>  		if (ret < 0) {
>  			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
>  					__func__, ret);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-pixel3-aud=
io-v2-0-7c22ed915291@ixit.cz?part=3D1
