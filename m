Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A0B49552B
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859386; cv=none; b=I9ETOAvALfzsRpl2/nr+Ly1OzksG1AvBlDlXcaCEI5MxlZ5Biza77PR8y01Cnz5zpwHSx7mVncmLsi2H2S0rbhu1CZGNg8HnELI1I3iFkbRHLVincbpUWA0yTTq6T9zTwRp/Q4RCSS2mc1ROQvWFlNBOXK+EIH2UmfxicMbKgyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859386; c=relaxed/simple;
	bh=TKQ1GE4oM9/aNVBCsSTQqLr9IrbqnQ5pOqaBrLEOFKo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V8eKyvKv+zsLtZk8N8/Wzfkhh5Rf/z51JGUEuX5OIB4qBl3HRuzd6V1YInnO5eYcw3tmG9T2FGxjmrtCgOf6b9OHsICilLfTrO4QYlsjEkIMqx+UtcQkX8jA2/xeE/KR8CcUM0ELNamfMj3qed6w/yd0rn2e6Vl06P9otC0U0D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSmW/S9f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSmW/S9f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F70D1F00A3A;
	Tue,  8 Sep 2026 09:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788859384;
	bh=P70ckUGmFA0DQji5BNrPRgiESozocWAWcZroz+GWNdk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bSmW/S9fDqoZpUFOII6Lvd8lNLwEMaeUBk8/XQYZ06NNF2kCj4ZTMOHDrQPFatlcB
	 ssf4xvtDN2pqC1soTkvKKspy9Lkk7Giow5Ah0E2glYhSDUDNUtkK5m+fg+o/NqfOuU
	 EHTVw78Ne5rcZxV/ho2UhC5g7Y4wmkFOBFRxlooMBZ4z8Ll/xw+Dz1EKpuSGzOlTjT
	 whDxJLA7FoclBhGVaBocWKRUmmtLuSGn2DLzME7sezL17cyiEB33Mf9681FJrYfTSt
	 ng/2Mux07mMRsjNM5wi+/r74Vnna0suNqgrOSfiYqqd25D3+X0L2My1czu14SBSgw/
	 RauT7QEJhVzRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/5] ASoC: airoha: Add machine driver for Airoha
 AN7581
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260908090448.3332-6-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
 <20260908090448.3332-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 09:23:04 +0000
Message-Id: <20260908092304.7F70D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Global static structures (`an7581_wm8960_card` and `an7581_wm8960_=
dai_links`) are modified during probe without protection, leading to state =
corruption and potential Use-After-Free.
- [Medium] OF node references acquired via `of_parse_phandle()` are leaked =
on the successful probe path and never released on driver unbind.
- [Low] Duplicate platform components are defined and bound to each DAI lin=
k.
--

commit 7051186115da5c8ed0db19bf2c3b4aac46840edd
Author: Christian Marangi <ansuelsmth@gmail.com>

ASoC: airoha: Add machine driver for Airoha AN7581
   =20
Add support for the machine driver for Airoha AN7581 paired with the WM8960
i2c codec. This driver creates the sound card for the AFE driver.

> diff --git a/sound/soc/mediatek/an7581/an7581-wm8960.c b/sound/soc/mediat=
ek/an7581/an7581-wm8960.c
> new file mode 100644
> index 0000000000000..03ea5732563cf
> --- /dev/null
> +++ b/sound/soc/mediatek/an7581/an7581-wm8960.c
> @@ -0,0 +1,161 @@
[ ... ]
> +SND_SOC_DAILINK_DEFS(playback,
> +		     DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
> +		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
> +		     DAILINK_COMP_ARRAY(COMP_EMPTY(), COMP_EMPTY()));

[Severity: Low]
Are two platform components necessary for this DAI link?

The code defines two empty platform components here, and later assigns the
exact same device node to both of them.

[ ... ]
> +static int an7581_wm8960_machine_probe(struct platform_device *pdev)
> +{
> +	struct device_node *platform_dai_node, *codec_dai_node;
> +	struct snd_soc_card *card =3D &an7581_wm8960_card;
> +	struct device_node *of_platform, *codec;
> +	struct snd_soc_dai_link *dai_link;
> +	int i, d, ret;
> +
> +	card->dev =3D &pdev->dev;

[Severity: High]
Does this code modify a global static structure during probe?

The an7581_wm8960_card structure is statically defined, but its dev pointer
is overwritten with a per-device pointer here.

If the driver is unbound and rebound, or if multiple instances of this devi=
ce
exist, could this lead to state corruption or a use-after-free when
device-managed memory is released?

> +
> +	of_platform =3D of_get_child_by_name(pdev->dev.of_node, "platform");
> +
> +	if (of_platform) {
> +		platform_dai_node =3D of_parse_phandle(of_platform, "sound-dai", 0);
> +		of_node_put(of_platform);
[ ... ]
> +	for_each_card_prelinks(card, i, dai_link) {
> +		struct snd_soc_dai_link_component *platform;
> +
> +		dai_link->num_platforms =3D 2;
> +		for_each_link_platforms(dai_link, d, platform) {
> +			if (platform->name)
> +				continue;
> +			platform->of_node =3D platform_dai_node;

[Severity: Low]
Does this code assign the exact same platform_dai_node to both platform
components?

Since dai_link->num_platforms is 2 and we have two empty platform components
defined, this will bind the same component twice.

> +		}
> +	}
> +
> +	codec =3D of_get_child_by_name(pdev->dev.of_node, "codec");
> +
> +	if (codec) {
> +		codec_dai_node =3D of_parse_phandle(codec, "sound-dai", 0);
[ ... ]
> +	for_each_card_prelinks(card, i, dai_link) {
> +		if (dai_link->codecs->name)
> +			continue;
> +		dai_link->codecs->of_node =3D codec_dai_node;

[Severity: High]
Does this code modify the globally shared an7581_wm8960_dai_links array?

Writing a per-device codec_dai_node to a global structure could cause issues
if the device is unbound, leading to dangling pointers for future probes.

> +	}
> +
> +	ret =3D snd_soc_of_parse_audio_routing(card, "audio-routing");

[Severity: High]
Does this introduce a use-after-free risk?

The snd_soc_of_parse_audio_routing function allocates device-managed memory
for the routes and stores the pointer in the global static
card->of_dapm_routes.

If the device is unbound, this memory will be freed, but the global structu=
re
will still hold a dangling pointer.

> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to parse audio-routing: %d\n", ret);
> +		goto err_of_node_put;
> +	}
> +
> +	ret =3D devm_snd_soc_register_card(&pdev->dev, card);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card fail\n", __fu=
nc__);
> +		goto err_of_node_put;
> +	}
> +
> +	return 0;

[Severity: Medium]
Will this successful return path leak the platform_dai_node and
codec_dai_node references?

The references acquired via of_parse_phandle() earlier in the function are
not released on success.

Since there is no .remove callback or device-managed cleanup action registe=
red
to release them upon driver unbind, could these device node references be
permanently lost?

> +
> +err_of_node_put:
> +	of_node_put(platform_dai_node);
> +	of_node_put(codec_dai_node);
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908090448.3332=
-1-ansuelsmth@gmail.com?part=3D5
