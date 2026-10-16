Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A42B45C709
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137634; cv=none; b=rowUUr5W9asdWi2tO0BDXNAWS1kmM3R59fmW0YDEJ3ImSgy2TeeTS57jeZkINSMQ6mUBk7nffreEudB/nmxSZz341+jlsYScwTwcRdHvqbVLr6uNuuPM5Hoo0HsbpOmuCs8ZfA/gys0bf+A5xPxr+gr8j8GtNKtYWw0osWjkx1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137634; c=relaxed/simple;
	bh=j0rmTah5ss+YPI8piEbKn49t3Z2GM0a9hHpjPIvbkLA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gcSOrw/dUCd/WNXjTTE/EN+cPBr/f5LIemeBvxFWa/CAFYY0vyl270bRJ598VqbURIsqo5d5rfBY8UB8F9IpXQ/L52Z5TSDPN+Bs3xMdYMPESVE5osnLPawAQGtqBLXvAR/OPJ2sRZyHhYViNam3wQyf3peuPxfNF7U3VsQSVbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AcipLVd5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcipLVd5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041AB1F000C4;
	Fri, 16 Oct 2026 08:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792137633;
	bh=TyYGwKZ7zY/niKxvNPsjvHOrKnoDLS4RTIS3ikeJ0gI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AcipLVd5dYvpPpVIVF//6TFMHSVYHqwqsZAVGD0Cxb7/7g6W+paB6hBvlYRMM5Suv
	 sGM8X/GluPgw/4uDz02rREghNcM8AESrqJaN04zF89PoD6HMJvxGOBoEhQWKZcgUhG
	 OdRp7ZbfOgStqn29Ia8XWYkyxUEYU7OHS2HodjBpXeFlQGDEC4Q6dKE3yFk2N5kxwr
	 ogW6kbgK3+05AnF4wC77Eq39Nzicr9u/GTBF1J5sZjvgtqPcdsy/+eSBfJryWk8AXJ
	 CyZJ8t6QS0HURGP1tJ/4npg8t3S12ISnwYFcgPimkyDpZ1YXuXWudbjSrMxVpd6u/C
	 En3kLWrTLZnwA==
Message-ID: <sashiko-outbox-173985@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: motorola-dubai: Add sound card
 with aw88261 speakers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016073157.611956-6-val@packett.cool>
References: <20261016073157.611956-1-val@packett.cool>
 <20261016073157.611956-6-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 08:00:32 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: aw88261 audio channel assignment inverted
- [Low] commit-message: inaccurate description of power-domains removal
--

commit df15644ca6ae81e8d6c78e4e8358dd5c5c68d8f0
Author: Val Packett <val@packett.cool>
arm64: dts: qcom: motorola-dubai: Add sound card with aw88261 speakers

This commit enables the sndcard node with MultiMedia frontends, a USB offlo=
ad
RX link, and two aw88261 speaker amplifiers. It also fixes the audiocc
compatible string and removes power-domains from a node.

> While here, use the correct compatible for audiocc for this phone,
> and remove references to power-domains from a 'reserved' node.

[Severity: Low]
Is this description accurate? The patch code removes the power-domains
property from lpass_audiocc, which is a clock controller, not a reserved
memory node.

> diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi b=
/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
> index 3860ab8508a09..1e1c195de1af1 100644
> --- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi

[ ... ]

> @@ -699,6 +701,40 @@ &gpu_zap_shader {
>  	firmware-name =3D "qcom/sm7325/motorola/dubai/a660_zap.mbn";
>  };
> =20
> +&i2c1 {
> +	clock-frequency =3D <100000>;
> +
> +	status =3D "okay";
> +
> +	/* Bottom speaker */
> +	aw88261_r: audio-codec@34 {
> +		compatible =3D "awinic,aw88261";
> +		reg =3D <0x34>;
> +
> +		dvdd-supply =3D <&vreg_l18b_1p8>;
> +		sound-name-prefix =3D "Amplifier R";
> +		firmware-name =3D "qcom/sm7325/motorola/dubai/aw88261_acf.bin";
> +
> +		awinic,audio-channel =3D <0>;

[Severity: Medium]
Does this assign the right physical speaker to the left audio channel?
Channel 0 is typically the left channel, which contradicts the
"Amplifier R" and "Bottom speaker" designation. This might result
in inverted stereo audio playback.

> +
> +		#sound-dai-cells =3D <0>;
> +	};
> +
> +	/* Top speaker / ear speaker */
> +	aw88261_l: audio-codec@35 {
> +		compatible =3D "awinic,aw88261";
> +		reg =3D <0x35>;
> +
> +		dvdd-supply =3D <&vreg_l18b_1p8>;
> +		sound-name-prefix =3D "Amplifier L";
> +		firmware-name =3D "qcom/sm7325/motorola/dubai/aw88261_acf.bin";
> +
> +		awinic,audio-channel =3D <1>;

[Severity: Medium]
Similarly, does this assign the left physical speaker to the right audio
channel? Assigning 1 (typically the right channel) to the top/left
speaker contradicts its physical placement and name.

> +
> +		#sound-dai-cells =3D <0>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016073157.6119=
56-1-val@packett.cool?part=3D5
