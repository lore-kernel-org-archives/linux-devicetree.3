Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F40A35E1D1
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 09:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781859637; cv=none; b=nJ1WfZeZaYtZiL+g9U6BUzgniuFFrIoBka6SGbZHSy/5BIAX4cH/iTLCMxXQVntrS1jC36/ri6sw+NALtqnloIZta+c7TVYmz8sh2lwG9k0sqBNlSMFQnmsgOFILIXpHKCfPrvcphVHz27DjrGU0pv+LuqSfU/UdhFKSWP2lwOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781859637; c=relaxed/simple;
	bh=rz0ddqJKJeIu8H+gn1wd6cEZInTp7THrifuX5A6Kr24=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eX0M4rFFcuGpmEG9qpeke1bmHEfTJY3J8kbyRsyyiaQCXaDzIv16yKz0s4LoI0YXizk5YBxM/TRCijOjJcw1uhxjM/XTcPY0ER/x2YQ3PWfqN2OcoUl2BBevWEktw3b3vfwzm7rPTmmRPKcdcJU0VKZvZygqpmxVvEQx2Vgr/wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkKn2JEQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkKn2JEQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89EB51F000E9;
	Fri, 19 Jun 2026 09:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781859635;
	bh=f+Hx5eVTs6aUXnQnVVgRXh76LrlI5l0LCeBX1vITBUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IkKn2JEQvk2wH7hicDvz9T+8nQASjeqEkNwMw9yARD2TLAlkU0AWOQkAsYU04Tr1C
	 G/hed4o0V2aDXMDlLlSyZQ54NBu3H5RtwmOQP34bGZV2Uk4/DlsrbBMuV+zM7DZo32
	 TRJ4mQWXmcqr01AiBZtkOy00Q9WIdnjrdQkLwzsHM9DPZcexd1kHsvKspPSE903bKL
	 hgIr48wDiKOy+XJlpIvLtblqmIrFj+23Bv67LIsjPNTAe3KUGtZ7DpLAOYS558vWuc
	 bJnEGi9TOnT0QBjqeQCkkVABQCcsBtAmUEHeAfAg0M4M/uBpEIbphvEWVoz1k9TISO
	 WG/zfej6Y+RQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] arm64: dts: renesas: r9a09g047e57-smarc: add
 DA7212 audio codec support
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260619083951.3777556-5-john.madieu.xa@bp.renesas.com>
References: <20260619083951.3777556-1-john.madieu.xa@bp.renesas.com>
 <20260619083951.3777556-5-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 09:00:35 +0000
Message-Id: <20260619090035.89EB51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `&i2c1` node is missing `status =3D "okay";`, meaning the I2=
C controller and the DA7212 audio codec will not be probed.
- [Low] The patch references undefined device tree labels `audio_clkb` and =
`audio_clkc`, which will result in a fatal `dtc` compilation error.
--

commit e73e5f92dd2a1aa13133b29d66da034cb803fffc
Author: John Madieu <john.madieu.xa@bp.renesas.com>

arm64: dts: renesas: r9a09g047e57-smarc: add DA7212 audio codec support

This commit adds support for the DA7212 audio codec on the RZ/G3E SMARC2 EVK
board. It enables the audio graph card and configures the codec on the I2C1=
 bus.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/ar=
m64/boot/dts/renesas/r9a09g047e57-smarc.dts
> index 6372f582a7c41..ac525b73c1bb1 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
[ ... ]
> +	sound_card: sound {
> +		compatible =3D "audio-graph-card";
> +
> +		label =3D "snd-rzg3e";
> +
> +		dais =3D <&rsnd_port0>;	/* DA7212 */
> +	};
> +};
> +
> +&audio_clkb {
> +	clock-frequency =3D <11289600>;
> +};
> +
> +&audio_clkc {
> +	clock-frequency =3D <12288000>;
>  };

[Severity: Low]
Are the audio_clkb and audio_clkc labels defined in the included dtsi files?
It looks like dtc might fail with a compilation error if they are not.

[ ... ]
>  &i2c0 {
>  	pinctrl-names =3D "default";
>  };
> =20
> +&i2c1 {
> +	da7212: codec@1a {
> +		compatible =3D "dlg,da7212";

[Severity: Medium]
Does this node need a status =3D "okay"; property?

If the I2C controller is disabled by default in the SoC base device tree, it
looks like it will remain disabled and the codec will not be probed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619083951.3777=
556-1-john.madieu.xa@bp.renesas.com?part=3D4
