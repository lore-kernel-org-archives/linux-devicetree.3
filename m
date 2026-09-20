Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EE33D3302
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881438; cv=none; b=HNDOMzO4TNbVTTTBwZXed6LflMj9tS8NFVWY0UF3Orww3jfeswTFDJswDXz4WLnyVY5HSGN22TS/Ot28Hfr4uC/skSe3r6NnfqE3mYrklMOlIgozXp4vkgnM7Mz6q/fsJWe8bVmj+i3C9L3F4MlaIXIzzn6zdBvhWd4YZSSbzuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881438; c=relaxed/simple;
	bh=jfQbRwPVSn5OanZ4+Pz15n1kIyL3fku4C6Id/zUNQsk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QEMTiHSNmSQnjnEz5uRpK6+qmeSgqqTHiY21mvnoa3OtSegbmaH9spkeZ1jUSh8hMSm5NI3i55q+jz5swMLgiB4YHucTfsBjPRj1h5ayMNCXt3wJJ/nns9nQzQRa4pqgZyQ/+th+kLqVG8PKM31/dB8Bzvx56NZj9ffrpVYZhWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aPUoSKq+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPUoSKq+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7901A1F000FF;
	Sun, 20 Sep 2026 05:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789881436;
	bh=ssIdbC1XZrBEGpmDWgTTCoGRO0/+vb/DN9yjaQ3qVvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aPUoSKq+mCeDcYth4lu+DAB0u7gjpLmfBamyVU5cSmuyKb/V6yCVaZj/H8t8mnj2U
	 5No+/mRnvueZFJuKG6ji9CztoH1J8XvbOxF37XU56FNxe1mzxoFNxjic6ODWMxOoHl
	 Unm7xdRJuh4TF02W3l9F3SZ7oKbbjCFqON+ut8nFHEkL8hAwHbcayGvpD9V0wPzdlV
	 wNMO/84QnmsFoMrcS1eTouo8lokAHqEJrIoFXu5j9fmCUKbHBtsxL8lpRLAyVVMg0Y
	 /NxEofcS9DJtPfH3bc2haoHXfunJUZjjJ2REtiMelFvKA37BUsUWRSQoQ9rxkk8NSZ
	 7zVWbyFWHo6Ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 24/28] arm64: dts: apple: t8112-j493: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260920-macaudio-v1-24-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-24-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:17:16 +0000
Message-Id: <20260920051716.7901A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: unit_address_vs_reg dtc warning in sound dai-link nodes
--

commit 42436807c12f7cee010fe3350f1045b5d88f9126
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t8112-j493: Add speaker/headset jack nodes

The M2 MacBook Pro integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

> diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/d=
ts/apple/t8112-j493.dts
> index 7cea5c5948108..eb401ae8773e5 100644
> --- a/arch/arm64/boot/dts/apple/t8112-j493.dts
> +++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
[ ... ]
> +/ {
> +	sound: sound {
> +		compatible =3D "apple,j493-macaudio", "apple,macaudio";
> +		model =3D "MacBook Pro J493";
> +
> +		dai-link@0 {
> +			dai-tdm-idle-mode-0 =3D "zero";

[Severity: Low]
Does the sound node need #address-cells and #size-cells properties,
along with a reg property here in dai-link@0? The device tree compiler
will emit a unit_address_vs_reg warning during the build because this child
node uses a unit address without a reg property.

> +			dai-tdm-idle-mode-2 =3D "zero";
> +			dai-tdm-slot-tx-idle-mask-0 =3D <0xf0f0>;
> +			dai-tdm-slot-tx-idle-mask-2 =3D <0x0f0f>;
> +
> +			link-name =3D "Speakers";
[ ... ]
> +		dai-link@1 {
> +			link-name =3D "Headphone Jack";

[Severity: Low]
Similarly, does this second dai-link child node need a reg property to
match its unit address and prevent a unit_address_vs_reg dtc warning?

> +
> +			codec {
> +				sound-dai =3D <&jack_codec>;
> +			};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D24
