Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876590;
	b=5cvfQJjgfnbBakKZ+r7qwN0AJnqVgB+rItPm133gFcPuon4Jj/dwTuvkffRtqdZAiLQY
	 u6Laef7ifkFh08lo0NOnWE1D0US3g6uDItjAomvobYz6keMdKZY1s03H1RDQJj3E3yDiq
	 d69Kg+CuEusUjcvBwJBOhP6RwL1aiu37g/8DJ3QGe+tfu6MHH44i+lvJwc+k7YFLaIbhq
	 cNDuQW8ODH+RXquDCAReoDCjFj6/kVVo5O+mBeX8731+RPTfUnEl1ba85+WRV1UKzcIUo
	 txJWNJdiA/pq5sV6eKx8mZTfmDB61ljXss0BBPwsztfYCk85HY6qXLjRexNSzYAUaVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876590;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=13lBv/7a7JTvYW44n0Wmhj4OnWieb31HZiXNf6Mu23U=;
	b=dd1SpQ7jZgOYDnhdC64Clp6QFCy6oL+hFc98H/8GeeRnkvSQXTVGrqIPb4t7q8r01jVB
	 B8LpHDTnzrxHyzIYreBXRTZkJC3iiptJ8LODJ3tH61RltLjJ+ZccRyh6Whd7zjHEcsP/O
	 E4mTkqHvAPyV0uIGILRVGyXzdYWRfl/ops9LzjSkOA4QICuNgs3mVfKghlf86cYc3i728
	 rL8En8ffksVaFe/mJZ6yDO7fJ5LKZmdxlEfKbd7zXNL5pY05jx3ImrLtvbdSV4kaE6269
	 qXjhXKuRnla3ZSTFGSB5uAf3VN2kgI5HHKbMk3gWyRIdDOgyYn8cwlhadnkizQn+A9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTc35MGb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2C7606A32E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTc35MGb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CBF21F000C1;
	Thu,  5 Nov 2026 11:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793876589;
	bh=13lBv/7a7JTvYW44n0Wmhj4OnWieb31HZiXNf6Mu23U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TTc35MGbWGIjIKxXa/NKqvf5g3ba2uWJguFpKGng3Jh9I55d67fnPFIQt9imnmDV1
	 ji5KRtra8EYt+AXluJmntjazlI8qOOZLBXc3WSn/XCpihaqRTCoScRN/Xhd2kaXcNk
	 0GQQssAF8TO9nzLyLDMAEUN/4PCUUyPB6A7+G1F1V3nUP6QVhxCymIxXNENRMuCvJ5
	 yKbKDH1QgHz6byxou9zilfwqlwQNBAV4aaBSaA8OKevxHVOsjQVtpJdLGjno+2m/jl
	 6Ubu5skAiFNlqlS3hoAJuix75fccuNPsDx+kgTxeSKIqDx/VY1xn9yLMEapE3cuvM1
	 zGrFwcrrznUwQ==
Message-ID: <sashiko-outbox-198903@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: glymur-crd: add DisplayPort audio
 DAI link
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chiluka Rohith" <rohith.chiluka@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105104013.614413-1-rohith.chiluka@oss.qualcomm.com>
References: <20261105104013.614413-1-rohith.chiluka@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 11:03:09 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: glymur-crd: dp-dai-link breaks sound probe on ma=
hua-crd
- [Medium] arm64: dts: qcom: glymur-crd: missing mdss_dp0 DAI link and disa=
bled mdss_dp1 on mahua-crd
--

commit 08a824dc35410c5805c76e45de4e1800714bcfaf
Author: Chiluka Rohith <rohith.chiluka@oss.qualcomm.com>

arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI link

This commit adds a DisplayPort RX DAI link to the sound node in
glymur-crd.dtsi, connecting the q6apmbedai DISPLAY_PORT_RX_1 backend to the
mdss_dp1 controller.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/d=
ts/qcom/glymur-crd.dtsi
> index 58158b51fe295..eee75da201983 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -268,6 +268,22 @@ platform {
>  			};
>  		};
> =20
> +		dp-dai-link {
> +			link-name =3D "DISPLAY_PORT-RX";
> +
> +			codec {
> +				sound-dai =3D <&mdss_dp1>;
> +			};

[Severity: High]
Does adding this dp-dai-link unconditionally in glymur-crd.dtsi break sound
card probing on mahua-crd?

In arch/arm64/boot/dts/qcom/glymur.dtsi, mdss_dp1 is disabled by default. It
is only enabled in arch/arm64/boot/dts/qcom/glymur-crd.dts:

&mdss_dp1 {
	status =3D "okay";
};

However, arch/arm64/boot/dts/qcom/mahua-crd.dts also includes glymur-crd.dt=
si
without enabling mdss_dp1:

#include "mahua.dtsi"
#include "glymur-crd.dtsi"

When mahua-crd boots, x1e80100_platform_probe() -> qcom_snd_parse_of()
iterates over all available child nodes of /sound and calls
snd_soc_of_get_dai_link_codecs() -> snd_soc_of_get_dlc() ->
snd_soc_get_dlc():

sound/soc/qcom/common.c:qcom_snd_parse_of() {
	...
		if (codec) {
			ret =3D snd_soc_of_get_dai_link_codecs(dev, codec, link);
			if (ret < 0) {
				dev_err_probe(dev, ret,
					      "%s: codec dai not found\n", link->name);
				return ret;
			}
	...
}

Because mdss_dp1 remains disabled on mahua-crd, its ASoC component is never
registered, causing snd_soc_get_dlc() to return -EPROBE_DEFER permanently a=
nd
preventing the entire sound card (including speaker playback and VA DMIC
capture) from registering on Mahua CRD.

> +
> +			cpu {
> +				sound-dai =3D <&q6apmbedai DISPLAY_PORT_RX_1>;
> +			};
> +
> +			platform {
> +				sound-dai =3D <&q6apm>;
> +			};
> +		};

[Severity: Medium]
Should mdss_dp0 (DISPLAY_PORT_RX_0) also be wired up here, and should the n=
ode
and link names match the other qcom,glymur-sndcard boards?

Both USB Type-C connectors in arch/arm64/boot/dts/qcom/glymur-crd.dtsi route
DisplayPort (connector@0 via usb_0_qmpphy to mdss_dp0, and connector@1 via
usb_1_qmpphy to mdss_dp1), and arch/arm64/boot/dts/qcom/glymur-crd.dts enab=
les
both mdss_dp0 and mdss_dp1:

&mdss_dp0 {
	status =3D "okay";
};

&mdss_dp0_out {
	link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 810000000=
0>;
};

&mdss_dp1 {
	status =3D "okay";
};

Additionally, sibling boards using the same sound card driver
(sound/soc/qcom/x1e80100.c), such as
arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts and
arch/arm64/boot/dts/qcom/x1-crd.dtsi, define both links using
displayport-0-dai-link and displayport-1-dai-link:

		displayport-0-dai-link {
			link-name =3D "DisplayPort0 Playback";

			cpu {
				sound-dai =3D <&q6apmbedai DISPLAY_PORT_RX_0>;
			};

			codec {
				sound-dai =3D <&mdss_dp0>;
			};

			platform {
				sound-dai =3D <&q6apm>;
			};
		};

		displayport-1-dai-link {
			link-name =3D "DisplayPort1 Playback";

Wait: if mdss_dp0 and mdss_dp1 are only enabled in glymur-crd.dts while
remaining disabled in mahua-crd.dts, should the DisplayPort DAI links either
be placed in glymur-crd.dts or have mdss_dp0 and mdss_dp1 enabled across the
boards that include glymur-crd.dtsi?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105104013.6144=
13-1-rohith.chiluka@oss.qualcomm.com?part=3D1
