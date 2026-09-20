Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67E21CFA2
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881443; cv=none; b=TM5A/4OaLFQNCjHiDkfPWdy46K+70Tss0iYJBCuwDdx8KQuBzaWI5tMADsR15BnEIA6yikmCIA1eMmHbdFmL3R4cz0WAvTA4KjRyTYKG63UKjnVUWch+sJDfbqCdI/FufjI0H0+7hTnG/DgtG/nWlUcWBU7tsY3uYD6TO76HnJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881443; c=relaxed/simple;
	bh=qkrhUrtiIUbeEdXipXUyMNyNOUg+87kp5OdAzWGN7Ko=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gyJF7eXym7HdL6nQQtWzbTFUR7otSVqPvI0yn26LQ8jriMmJ1I8rPEVK6CtlwUru8NOkgDtlgEmkhLu3dU53IcfptdJKJELiqyRuuJO9GWY6L5A12osa1yA2HBZpVgMwvO4pPJGhIp1rlZ44h4c/n4QDJKo7EveueknlPozcNjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRvbUzjw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRvbUzjw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA031F000FF;
	Sun, 20 Sep 2026 05:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789881442;
	bh=iu9IODT3VnySIigM5wM9RaN7s0pE9e3wT+Crv9Kxa2E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dRvbUzjwiGVbliFHll00RPGZTG6/UoCnctkbFRxkjBiC160IY9gE6iyV2gWtklOH6
	 PKXe4CYvvdATbldO3hAIlxOVKhb9iDHevVCWbqbLtVjuqvNqAjahTYMiqEnV1qojg6
	 rZGX6UbgHd7F/gddhlFWCaehap7NUUV7rn8uuMcUeBVfKKjrBAoPpz/bxX9rETYkRP
	 /4dWeq6lRJhorRTt5QDEhaDjG1DXdEVBCr0MO6VrYnbcZb5SCHn/A5D83CqKcF2q6H
	 Eh22yb/HPLuo+yhK+lP3F2GclPP3V9e3FJ1jLRY3A/+O9LumBCPfaDIx4lHAEWQNxj
	 S0uJFWcmiWr+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 25/28] arm64: dts: apple: t600x-j31x: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260920-macaudio-v1-25-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-25-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:17:21 +0000
Message-Id: <20260920051722.3CA031F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: typo in dai-tdm-slot-tx-idle-mask property prevents TDM idl=
e configuration
--

commit f5c52499a0a647e882ff3e2323a3096d2ee9614e
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t600x-j31x: Add speaker/headset jack nodes
   =20
This commit adds I2C nodes for the speaker and headset jack audio codecs
used in the M1 Pro/Max MacBooks. It also configures the audio routing by
adding the sound machine driver node.

> diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/=
boot/dts/apple/t600x-j314-j316.dtsi
> index caded1636f3d2..7afd385ce57dc 100644
> --- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
[ ... ]
> +/ {
> +	sound: sound {
> +		/* Compatible is set for each machine */
> +
> +		dai-link@0 {
> +			dai-tdm-idle-mode-0 =3D "zero";
> +			dai-tdm-idle-mode-3 =3D "zero";
> +			dai-tdm-slot-tx-idle-mode-0 =3D <0xf0f0f0>;
> +			dai-tdm-slot-tx-idle-mode-3 =3D <0x0f0f0f>;

[Severity: Medium]
Does the ASoC machine driver look for the property with the "-mode" suffix
here?

Looking at macaudio_get_codec_idle_props() in sound/soc/apple/macaudio.c, it
appears the driver expects dai-tdm-slot-tx-idle-mask-%d to read these
bitmasks. Since the device tree spells this as "...-idle-mode-%d", the
property is not found and the idle_mask will remain 0.

Could this lead to unused TDM slots remaining unmasked during idle, causing
I2S bus noise or zero-stuffing failures?

> +
> +			link-name =3D "Speakers";
> +
> +			codec {
> +				sound-dai =3D <&speaker_left_woof1>,
> +					    <&speaker_left_tweet>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D25
