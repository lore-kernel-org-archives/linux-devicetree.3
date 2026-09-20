Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869132E266C
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881288; cv=none; b=Pw181iALbU/JXl9GSlGt5+knsb5+hGtQ3kJ5W6htRW475geIDBqiBx91oKX8uP99r40RyCHVav7X8BCB+0chIX8x+lwXS/YA/pQ3TsvvIcpYLkDL6dYtsoMZc9cmCXiCLmIsgrU6931BzB1f+nqSqPbzf0/NOSfNo0/tLjxAuRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881288; c=relaxed/simple;
	bh=3LkMcEP8MoEzVL2bXqPsoyIQ2xAx5h3bJBze8cHkbpc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GK/W3PmMoYUWGYNNK/YdECGiPK06hJ5CFj1aLrRSGMO7WYlWv4OcHgEnYC5lFCzUcjtWNLHF6nu/CaEjR46w+y+YAsx8qZrkeZ3j5VBDlvK4w7Nr1ganYwYt/2LEdmsI3PAlET70qzwQicpjePN3kaMkUSREXBCF8o68qHuTE4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZfoAnmI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZfoAnmI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6961F000FF;
	Sun, 20 Sep 2026 05:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789881287;
	bh=EuOwvle3ijVWTnWJpbmXTR/DSHhfTIVfiu3htmVCQh4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AZfoAnmIPHk5mzbvKHsk3JP9oByB9d587Q5TgDEwMGOC47TiO9zsm/uefUslMYSJk
	 bIX//8l0bczbQAa8qps8f/uJlmoEdD0vPWE8LfBvbOm+3YpBHlKGxwGcMVVBXUGqxf
	 Uq/Dk9RVgNP9pYLXVCQ/LJHX12aVjTrAu16KjfmLbh99zReQoBpkELgK5xbsj4H9wg
	 AjOsmnGb2eG8sEwG7WFsBoX3BieCIW+k9qVVUObsjtkm7VOq+R6T26ULcTSKCA4Dep
	 JWZ5vRKpWeyo3wr8NrUpqAyW8stYM3XmF/Ut5mbBHwm6D3fE95xG3cN116O1cu7c65
	 LCkWEud+a71rg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 21/28] arm64: dts: apple: t8112-j413: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260920-macaudio-v1-21-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-21-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:14:46 +0000
Message-Id: <20260920051446.EB6961F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] ASoC: macaudio: hardware damage due to missing tweeter safety =
limits
--

commit 9fe19e1d62cebe58a30bdc3d79379ba02c88819c
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t8112-j413: Add speaker/headset jack nodes

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

> diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/d=
ts/apple/t8112-j413.dts
> index 7ccfceb080930..38d0e33c701c5 100644
> --- a/arch/arm64/boot/dts/apple/t8112-j413.dts
> +++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
> @@ -92,4 +92,105 @@ &fpwm1 {
[ ... ]
> +	speaker_right_tweet: codec@3c {
> +		compatible =3D "ti,sn012776", "ti,tas2764";
> +		reg =3D <0x3c>;
> +		interrupts-extended =3D <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios =3D <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "Right Tweet";

[Severity: Critical]
Does this prefix bypass the mandatory safety limits for the right tweeter?

The machine driver configures an 800 Hz high-pass filter and a -20dB volume
limit by passing the "* Tweeter " wildcard pattern to macaudio_set_speaker(=
):

sound/soc/apple/macaudio.c:macaudio_fixup_controls() {
	...
	CHECK(macaudio_set_speaker, "* Tweeter ", true, 0);
	...
}

Since the left tweeter is named "Left Tweeter", the wildcard match returns 1
hit. The driver checks for a minimum of 1 hit, so it does not report an err=
or
and the probe succeeds.

However, "Right Tweet" will silently fail to match the "* Tweeter " pattern,
leaving its controls unconfigured.

Could this lead to physical hardware damage by allowing unfiltered,
full-amplitude bass frequencies to reach the right tweeter during playback?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D21
