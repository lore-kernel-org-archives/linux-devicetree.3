Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877113;
	b=jZRbVkh7VrJCL0JIlIwclGuBjFjsCXEtpqGZNFRksQH515oFGOl1EDiHsQggdEP+5I2i
	 upTFf9ND7xzpS3vERKZUBEWWOR3DTCjR/xEtAnRXC4DUNH4WSmyVpaClndB59a8Przx+E
	 jQEXWlCCR91f8ewqGE4KFg8m1Zkl7pJbUgD6XQBBVt2YkN0yWMEC1OKsDWrpVLomcmR4p
	 BcJAWqo2qYimBXy4m/p4yryfTxZEfUHzhn12R8QudXbHG09zoypFepJxHEZsZbxxCMDJA
	 cgXIb2iBwBe32Bk3o4ZIZXpM0Vu6xckDlXDKYeE7riRgPAhIlni7VW+yOgVnI/6kZ7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877113;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=J11xV2o3Vb0E7JyrpIkAKauDnv6xWZzEQhwWJ4zuOKI=;
	b=3oV/Vr7tpsnfbnhyJad/yGsaqysiAcPly1IitkeihQp8WyLXX30Egf+fLTjtT+VLKXmz
	 CuOr3KkigPWZRuPYnt/DB5YRXXwB5F7iNKycZMnZly4z+VmjW6F7Hdfse9K7+WE/JJ7B6
	 2PPkKlRF6vb3/p6SudupXXCL/dCr/AW6tLUUtlHGoYtwbJyL/ndMZWIKlaNUZFEU4l+MH
	 9Qr+TzKwyjeJuY4rC9y1Er1beQixeby6od1GE9s156AoxnBjqvDKTdG6HTzATudUAb9MH
	 O653QCrtxkAvCA8nOz09MKdaDfPNcSdSBKUXN0q0FQH41hkDByFhWrmxhVufk3rFB4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ogVaQ8dH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FDF606D82C
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ogVaQ8dH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C381F000C1;
	Thu,  5 Nov 2026 11:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793877112;
	bh=J11xV2o3Vb0E7JyrpIkAKauDnv6xWZzEQhwWJ4zuOKI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ogVaQ8dHPEgxX1WooKAHBMWNzKcoKBNt8xvcaIi3ULAzLZQdC5WhtbTryrjuXlHcx
	 fQMPnNfvoaHO7bllYNqa1vRyt+3w6E+uYZhqifDRCDzCozVnWfcCjMx3rZz+Lq1Cpx
	 QfeWjnxY/WjQxx3wqzpnXNT7/QoMNvIVKxUSPagyXStoJWmDODNTvKEJX7tzs5s8mz
	 DgrKXycjE6WdfVfSiq9/SqxKcnNO3lBCT3qr5HjGMuvWB5DkMcvgHHgdbUgNjTU9BE
	 c6C2/aZkRFd8gaDbg/LiQg75N6dd7CSa6duTU7pRaBGfGQo5FBpgz1keG77qSFERIP
	 ufP4uk5Px9m0Q==
Message-ID: <sashiko-outbox-198914@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: glymur-crd: add DisplayPort audio
 DAI link
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chiluka Rohith" <rohith.chiluka@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105104657.621104-1-rohith.chiluka@oss.qualcomm.com>
References: <20261105104657.621104-1-rohith.chiluka@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 11:11:51 +0000
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
- [Medium] arm64: dts: qcom: glymur-crd: incomplete and unenabled DP audio =
DAI link
--

commit bb4f3b10ef946c74b24095ec32db334ac56b222c
Author: Chiluka Rohith <rohith.chiluka@oss.qualcomm.com>

arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI link

This commit adds a DisplayPort RX DAI link to the sound node in
glymur-crd.dtsi, wiring the DISPLAY_PORT_RX_1 backend of q6apm to the
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
Does adding this active dp-dai-link node to the shared
arch/arm64/boot/dts/qcom/glymur-crd.dtsi break probing of the entire sound
card on mahua-crd?

arch/arm64/boot/dts/qcom/glymur-crd.dtsi is included by both
arch/arm64/boot/dts/qcom/glymur-crd.dts and
arch/arm64/boot/dts/qcom/mahua-crd.dts:

arch/arm64/boot/dts/qcom/mahua-crd.dts:
    #include "mahua.dtsi"
    #include "glymur-crd.dtsi"

In arch/arm64/boot/dts/qcom/glymur.dtsi, mdss_dp1 defaults to disabled:

arch/arm64/boot/dts/qcom/glymur.dtsi:
    mdss_dp1: displayport-controller@af5c000 {
        ...
        #sound-dai-cells =3D <0>;

        status =3D "disabled";
    };

While arch/arm64/boot/dts/qcom/glymur-crd.dts enables mdss_dp1, neither
glymur-crd.dtsi nor mahua-crd.dts enables it.

When booting mahua-crd, x1e80100_platform_probe() -> qcom_snd_parse_of()
iterates over all available child nodes of /sound and calls
snd_soc_of_get_dai_link_codecs() -> snd_soc_of_get_dlc() ->
snd_soc_get_dlc():

sound/soc/qcom/common.c:qcom_snd_parse_of()
    if (codec) {
        ret =3D snd_soc_of_get_dai_link_codecs(dev, codec, link);
        if (ret < 0) {
            dev_err_probe(dev, ret,
                          "%s: codec dai not found\n", link->name);
            return ret;
        }
    }

Because mdss_dp1 is disabled on mahua-crd, msm_dp_display_probe() never runs
for mdss_dp1 and never registers its ASoC codec component, causing
snd_soc_get_dlc() to return -EPROBE_DEFER permanently and preventing the
qcom,glymur-sndcard sound card (including WSA speaker playback and VA DMIC
capture) from registering on mahua-crd.

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
Should this also wire up the first DisplayPort controller (mdss_dp0 with
DISPLAY_PORT_RX_0) and follow the DisplayPort DAI link naming used by other
boards handled by sound/soc/qcom/x1e80100.c?

In arch/arm64/boot/dts/qcom/glymur-crd.dtsi, two DisplayPort-capable USB-C
connectors are defined under pmic-glink (connector@0 routed via usb_0_qmpphy
to mdss_dp0, and connector@1 routed via usb_1_qmpphy to mdss_dp1), and
arch/arm64/boot/dts/qcom/glymur-crd.dts enables both controllers:

arch/arm64/boot/dts/qcom/glymur-crd.dts:
    &mdss_dp0 {
        status =3D "okay";
    };
    ...
    &mdss_dp1 {
        status =3D "okay";
    };

However, this patch only adds a link for mdss_dp1 (DISPLAY_PORT_RX_1) and
omits mdss_dp0 (DISPLAY_PORT_RX_0).

In addition, other boards using sound/soc/qcom/x1e80100.c (such as
arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts, which also
uses compatible =3D "qcom,glymur-sndcard", as well as x1-crd.dtsi) name the=
se
nodes displayport-0-dai-link and displayport-1-dai-link with link-name set
to "DisplayPort0 Playback" and "DisplayPort1 Playback" instead of
dp-dai-link and "DISPLAY_PORT-RX":

arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts:
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
        ...
    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105104657.6211=
04-1-rohith.chiluka@oss.qualcomm.com?part=3D1
