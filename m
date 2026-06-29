Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985513B2FE6
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 22:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782772974; cv=none; b=SfpTILamgTabBpF/9S/1ieYhbHy0cdivkyDzTUuMwvpVzXIh3QCLrh+7DTSTB9LDWBzR6vnw/OyKcFQ+dqU4efedwCkOkhSuwkEEY4MW7o6g3QzovNp9vpdUbN+4hE6YF+0zgfZsTc4yZoByWMPUUkCmXOvXgZfYkcM/hvF+vdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782772974; c=relaxed/simple;
	bh=ysCz8ihASRTvzdtfvOZiHxAY6FX6rYEWLMM49jjeog0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BN56DBTOo9HUSk+qnjgMEt2DwIlEwK41Zoid3aREOtucHYAfaP/IVckRPHMiUTQIW7O4ldiZ6+h6cGbqhyG4puGHrzwdgAfP3b2aXA2niRgVqE924xzwb1Nxu5XRbHqIk+CAfPZxcWY4tbQ2hdmZc5fnpRPBuP2VrIoFeWMBmq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBf6R9X8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBf6R9X8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D2D1F000E9;
	Mon, 29 Jun 2026 22:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782772973;
	bh=8P87hXQ2N+wZ7PCZo3GZ+dKz5sjsfV2cue9mxDg6sIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eBf6R9X8LvzWG8QGNFphwjxUc3RKX8J7+ZrYzuAw+uK31/0IVn23kqgur31VpM+2T
	 7yM/rS5h563fDjmP5DGsUozoKJ/IBHGz7z9/lroAz3ftyBLqQ4To7PfPcYNF45Z10s
	 lwb0xgRw/faZKe8aw5wDbuOQ4j0Y9rzx7BmYKxJQZqTFkC/ajPQgEI0pt2OyBq+CZU
	 W1odhrcmCODP0k4iFzHxlid8Rft5TKYrtOv/EyriX6aQ4VOweJ61dZ40tRqpXm46qL
	 j8WgQJPyAxj3ZYq0IUfq1oRf5qcVlsKgVCrxnlqCo7ZoYaTIBvBNKNby3tlDnUVKW0
	 mFU+jBeFukc8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: ti: Add support for the
 phyCORE-AM67x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nathan Morrisson" <nmorrisson@phytec.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260629223353.1495209-2-nmorrisson@phytec.com>
References: <20260629223353.1495209-1-nmorrisson@phytec.com>
 <20260629223353.1495209-2-nmorrisson@phytec.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 22:42:52 +0000
Message-Id: <20260629224253.12D2D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The ASoC `simple-audio-card,routing` array contains reversed rou=
tes for the physical speakers, mapping the codec outputs as sinks and the s=
peakers as sources.
--

commit 9dfefe3748ffabcd91be3c99b1fecce0ae98ac5f
Author: Nathan Morrisson <nmorrisson@phytec.com>

arm64: dts: ti: Add support for the phyCORE-AM67x

This commit adds support for the PHYTEC phyCORE-AM67x SoM and the
corresponding phyBOARD-Rigel carrier board. It enables various features
including audio playback, Ethernet, CAN, and eMMC.

Link: https://www.phytec.com/product/phycore-am67x/
Link: https://www.phytec.com/product/phyboard-am67x-development-kit/

> diff --git a/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts b/arch/a=
rm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts
> new file mode 100644
> index 0000000000000..26dcda26061f9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts

[ ... ]

> +	sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,widgets =3D
> +			"Microphone", "Mic Jack",
> +			"Headphone", "Headphone Jack",
> +			"Line", "Stereo Jack",
> +			"Speaker", "L SPKR",
> +			"Speaker", "R SPKR";
> +		simple-audio-card,routing =3D
> +			"MIC1RP", "Mic Jack",
> +			"Mic Jack", "MICBIAS",
> +			"Headphone Jack", "HPL",
> +			"Headphone Jack", "HPR",
> +			"MIC1LM", "Stereo Jack",
> +			"MIC1LP", "Stereo Jack",
> +			"SPL", "L SPKR",
> +			"SPR", "R SPKR";

[Severity: Medium]
Are the routing endpoints for the physical speakers reversed here?

The simple-audio-card,routing property uses the syntax "sink", "source".
By defining "SPL", "L SPKR", the codec output pin SPL is treated as a sink
and the physical speaker L SPKR is treated as a source.

Because the speaker widget is an endpoint with no outputs and the codec
output pin has no inputs, DAPM cannot build a valid audio path. This will
cause the speaker audio path to fail to initialize.

Should these be defined as "L SPKR", "SPL" and "R SPKR", "SPR" instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629223353.1495=
209-1-nmorrisson@phytec.com?part=3D2
