Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7904F4D17BD
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 22:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115972; cv=none; b=gTC0CXUVpSA2NV5EUZ64vAyXCBlUUy5CQR9dYtKEijLU2c3G9dG5ogaKBcZPWXWMPNDhcBjt9NMUWATsCZdg7gIOk9XLM4a88VXULv6RzYK+hP66MqiUshhLWYkVfIFt6HMH0F6wriWND+7R6zs5FTTG0hq1ALAMTLFIVcOLMWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115972; c=relaxed/simple;
	bh=/NkZgXQvY4urATAIP391H9sKmZUYeAd7DDwHzOLxSqU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZbVX3Y5qk3PZOc+wKlHzdxevPYMouFDl426pIgFnWQfUDeyu/LcvvyyKdN2b3XHY0L/XlMSRAXx1We5tRzvsqUBbUyQ9Vx+Wraa6tD7jC708WhT/ElX77shDoD/LUPnzpiuhZN8wmm19AV01Esqw26/P2OTxS+5KNtt1hOpH8lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9wh9UPm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9wh9UPm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0651F000FF;
	Tue, 22 Sep 2026 22:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790115962;
	bh=k0n1/uGusyeUsDRhjNGx9W+yHwj9ORfL2PXxS/3tmPA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O9wh9UPmIir5BgXV7j6CgMWel3EqgTctMwkQFCCq/s9GlH7eAjD41/ckbxZD03Jh+
	 tsSItoHTuZV4sRq29EI8NEOx89HS/QQxOtgDIoljGz4QfyGILH+ulzTU/tgLGGis1y
	 lRHh84PbOob6BDoSxP6y8Tu4QggnGYbVDolzbs3wyHjp5UZDueRIcGVksN2SLZJgnA
	 zM9dVzMiOa0oVv+wSs1XIhffdSOMeLuPyYt9UX79z5Iygu2a9lxcA95k8ey75jlwAy
	 y4kMS4jxyehmK7OE+4xkJAiS3zjmFjdglBuUNgojV6YRSZRKve4BD3pGPrK1mM3z0K
	 oFd2kvxcVLXjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] arm64: dts: arduino-imola: add support for sound
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <ca8cfb43cdc08851db1283df2108e77b22fedc6e.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <ca8cfb43cdc08851db1283df2108e77b22fedc6e.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 22:26:01 +0000
Message-Id: <20260922222602.0D0651F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ASoC: redundant BE DAI links for identical q6afe CPU DAI
--

commit bd3dd7751e736b11cf0fd37d9d4991d90e6ee507
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

arm64: dts: arduino-imola: add support for sound

Add support for sound on Arduino UNO Q board, which includes headset
playback and record, and lineout.

> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/ar=
m64/boot/dts/qcom/qrb2210-arduino-imola.dts
> index c472e13fceca4..e99d2a56dc287 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
[ ... ]
> +		ear-playback-dai-link {
> +			link-name =3D "Ear Out Playback";
> +
> +			codec {
> +				sound-dai =3D <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
> +			};
> +
> +			cpu {
> +				sound-dai =3D <&q6afedai RX_CODEC_DMA_RX_0>;
> +			};
[ ... ]
> +		hph-playback-dai-link {
> +			link-name =3D "Headphones Playback";
> +
> +			codec {
> +				sound-dai =3D <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
> +			};
> +
> +			cpu {
> +				sound-dai =3D <&q6afedai RX_CODEC_DMA_RX_0>;
> +			};
[ ... ]
> +		lo-playback-dai-link {
> +			link-name =3D "Line Out Playback";
> +
> +			codec {
> +				sound-dai =3D <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
> +			};
> +
> +			cpu {
> +				sound-dai =3D <&q6afedai RX_CODEC_DMA_RX_0>;
> +			};

[Severity: High]
Does defining multiple identical Backend (BE) DAI links cause conflicting
DSP driver operations?

This link, as well as ear-playback-dai-link and hph-playback-dai-link
defined above, map the exact same physical CPU DAI (RX_CODEC_DMA_RX_0) to t=
he
exact same Codec DAIs.

When the ALSA DPCM core registers the card, it instantiates duplicate BE
runtimes. During audio playback, if the DPCM core triggers multiple of these
BEs concurrently or sequentially, could this interrupt active audio and
corrupt the shared hardware state? For instance, q6afe_dai_prepare() in
sound/soc/qcom/qdsp6/q6afe-dai.c checks is_port_started[dai->id]; if two
runtimes call prepare on the same DAI, the driver might abruptly stop and
restart the active DSP port.

Should logical branching to different endpoints (Ear, Headphones, Line Out)
be handled internally by the Codec driver's DAPM routing graph instead of
defining redundant BE bus links?

> +
> +			platform {
> +				sound-dai =3D <&q6routing>;
> +			};
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790114902.gi=
t.srinivas.kandagatla@oss.qualcomm.com?part=3D4
