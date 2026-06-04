Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E9636DA02
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 02:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780540002; cv=none; b=UWtMKivDHIWhmmnPyAgK6x4ddaGmBuN7jQfxA3vqW+Fsec2lAbVdr4kXxnPpDV33NLJsKvcHCVEpFDXWYN76ltpSBihz0CLuKPyzUBc1RFFJa+/bT6ofdqGnuX4NLNY2TBqyoF4maWrvZ9aauMPQoWHbL0mmFF3JHEUOmbBCvy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780540002; c=relaxed/simple;
	bh=GV6YaeA17JPDD7CT7xQTOqEoxpS92IPQBwJI7sZ+hbU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=afMDNyDj4s4QKMoDykWKihuVRQ3QMj4q0QkbWXIu4Y+pm6f96jDgWei35/9BTzWZXtc1XOrkuhXicWog89J42PvfR4A+GmfXPdwrylU4ys+deB03qjSBAb0cxfAidRxZkWyvmaRAxj1MxeLabMHhvBT1WNtBsVz62mxKNWr6eDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRfP/gM+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRfP/gM+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07331F00893;
	Thu,  4 Jun 2026 02:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780539998;
	bh=84GqsZEeY6R49bx29tbrQ43V9pClusQ6ifHSsV+X8WE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IRfP/gM+H6AihTuYQERib2O9LPih6tG9jUyTAKo7gRFYG89LNRsrn5UbTZ/G2jdZW
	 xOlec9o9SHNuvhEkFEfyc1guHeKFgS6xm6tPPWoa52ubIIhMEQ+gDdMIVxOAanXyz8
	 hsrUvXk6dUJlcUX39OHQhw/jM6gFEDrpcRA6oeSR/GaQHdNIOM4zu4ed4dfl7momWf
	 9iXtH5r+KnYBB3kghdliZFc3Wq1gWLIEku/cbC8f0kRMeEKQuheKqQb1p50imPl0Em
	 fObALKxJP68HrlGQEW8B3Ya4UAFoYNaVNaRB+GY/PzuU9yZxrgb466mj6Po2DclbtW
	 PGh8fbCeOYgzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] ASoC: loongson: Add Loongson-2K0300 CTCISZ
 Forever Pi sound card support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <1b2fa7b37c354df6ac7b2c1c5f9f3fac2b8af3ff.1780538113.git.zhoubinbin@loongson.cn>
References: <1b2fa7b37c354df6ac7b2c1c5f9f3fac2b8af3ff.1780538113.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 02:26:38 +0000
Message-Id: <20260604022638.B07331F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized pointer `codec_dai_name` is used if the required dev=
ice property is missing.
--

commit ca8a45881e3592679d02b8f941222c143f73d4c0
Author: Binbin Zhou <zhoubinbin@loongson.cn>

ASoC: loongson: Add Loongson-2K0300 CTCISZ Forever Pi sound card support

The Loongson-2K0300 audio card uses a different DAI format compared to
existing Loongson platforms. Move the dai_fmt setting from the static DAI
link to runtime hw_params via snd_soc_runtime_set_dai_fmt(), and pass the
correct format through driver match data.

> diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loon=
gson_card.c
> index 7910d5d9ac4ff..9200e8476c1fa 100644
> --- a/sound/soc/loongson/loongson_card.c
> +++ b/sound/soc/loongson/loongson_card.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this file I
noticed a pre-existing issue in loongson_card_parse_acpi().

Is it possible for the "codec-dai-name" device property to be missing?

In loongson_card_parse_acpi(), codec_dai_name is declared without being
initialized:

	const char *codec_dai_name;
	...
	device_property_read_string(card->dev, "codec-dai-name", &codec_dai_name);

	for (i =3D 0; i < card->num_links; i++) {
		loongson_dai_links[i].platforms->name =3D dev_name(phy_dev);
		loongson_dai_links[i].codecs->name =3D codec_name;
		loongson_dai_links[i].codecs->dai_name =3D codec_dai_name;
	}

If device_property_read_string() returns an error because the property is
missing, codec_dai_name remains uninitialized garbage. This garbage pointer
is then assigned to the global loongson_dai_links[i].codecs->dai_name,
which ASoC core will dereference during component matching.

Could this lead to a kernel panic if the firmware lacks this property? Shou=
ld
the return value of device_property_read_string() be checked or a default
value be provided?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780538113.gi=
t.zhoubinbin@loongson.cn?part=3D5
