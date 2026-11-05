Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876213;
	b=Nb33cWPlQHvr/lMMAx82cychEe8AqfBcJPOjJLv0DEOBKZ+hHCff+WP/fhR9vhN0NA/+
	 NzJ5kDDW1aOrbi6JVAdb/4cFmFfkQG71adcw5hRERvmHvQig70y3b/8yNW5NJFGGxCrjx
	 K+pLIUSD2TM9GrkTVs+qhNHL3m49hEAbw/tHNQ1LV/btcsXuZw+6LPGFM/4PvZDMJDHCJ
	 FKScP4dskhFPfK8AoRjP7wUFvGPqZlSrmGl80DwwimqjxBcfca+1oDtNOvZ/sCdsSn4nb
	 WVuN+Qa39w7RmTwuEnPHp7TfZEIJ+/m0jOdEQN4B26NY43CxBktXXPeEecypDa3o+Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876213;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KxfXLjH3fR/wQtSUf+yxqX5AiEAfserI+p5lczWBtLE=;
	b=aEs9+ONTbTXgkoW0PtTJIsCZsMBn4DO5c//SndG3LrDlmOIx4W+tOnbhoZmf3jB4pjDE
	 A3tq5c8IGEMbbihPL8lvdidfgHdSNuiM6ou6o6YkqkZ0EpW7AIZxhhCna6ssWzVLKe8Mf
	 2m5uyW/yKbFxrx2juxC2YCc18b4SZ/W9hc0JtSYvMrLO6gDxq7cnCLaIeeLDxg1XYJXwi
	 6i+77clVcxplTd/pIJWOiiBCS5ktEVo44Kp5Wq4GGvOSDjs2dd91aNf1wm6h2iQSZcprz
	 3YBboMrFqfw77KPEm2r+AxzDLcftGcfsNtrqtO1P/tD9zyb9X5Ci6ZybciONabj7vvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Naqeh72l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB1C606A328
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Naqeh72l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52A51F000C1;
	Thu,  5 Nov 2026 10:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793876213;
	bh=KxfXLjH3fR/wQtSUf+yxqX5AiEAfserI+p5lczWBtLE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Naqeh72lB52wDW+CbGmvT9oAUqrliOz7N414HZ4TG6ZaxnSNCsvBTb5w2knVv/Fz5
	 aoc53H8JdayTlQoFNiv0ES/tIpNQlRBeMhDt2UKs/dnaG1NV7wKd0OM++XY4XcS1SH
	 Sn1TpqbLiSdYNHcbdhTadZLPsroRkWfbZrnv+OyZJz5oRiOucWztSoslK91huelkq+
	 tbSLBBylKs34m1sX1sR/OiIO2UwwLFkdGzXBmPx7GQOdePVB/z4E6YzkWMdf2nr9d8
	 jiEZrULlj3PoQA2gZjtiGynYc6LXGOi8fwQ+3ndfFv3e2Ez4ycqWN46mV4+HFrAIap
	 66fx9u72LNuhg==
Message-ID: <sashiko-outbox-198891@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: glymur-crd: add DisplayPort audio
 DAI link
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chiluka Rohith" <rohith.chiluka@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105104624.621024-1-rohith.chiluka@oss.qualcomm.com>
References: <20261105104624.621024-1-rohith.chiluka@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 10:56:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: glymur-crd: dp-dai-link breaks sound probe on ma=
hua-crd
--

commit a434cb6530336de83a46c26f22333629bcaaf510
Author: Chiluka Rohith <rohith.chiluka@oss.qualcomm.com>

arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI link

This commit adds a DisplayPort RX DAI link to the sound node in
glymur-crd.dtsi, wiring the DISPLAY_PORT_RX_1 backend of q6apmbedai to the
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
> +
> +			cpu {
> +				sound-dai =3D <&q6apmbedai DISPLAY_PORT_RX_1>;
> +			};
> +
> +			platform {
> +				sound-dai =3D <&q6apm>;
> +			};
> +		};

[Severity: High]
Will adding this unconditionally enabled dp-dai-link node in glymur-crd.dtsi
break sound card probe on mahua-crd?

arch/arm64/boot/dts/qcom/glymur-crd.dtsi is shared by both glymur-crd.dts a=
nd
mahua-crd.dts:

arch/arm64/boot/dts/qcom/mahua-crd.dts:
    #include "mahua.dtsi"
    #include "glymur-crd.dtsi"

In arch/arm64/boot/dts/qcom/glymur.dtsi (included by both glymur-crd.dts and
mahua.dtsi), mdss_dp0 and mdss_dp1 default to disabled:

arch/arm64/boot/dts/qcom/glymur.dtsi:
    mdss_dp1: displayport-controller@aea0000 {
        ...
        #sound-dai-cells =3D <0>;

        status =3D "disabled";

mdss_dp0 and mdss_dp1 are only enabled in glymur-crd.dts, while remaining
disabled in mahua.dtsi and mahua-crd.dts:

arch/arm64/boot/dts/qcom/glymur-crd.dts:
    &mdss_dp0 {
        status =3D "okay";
    };

    &mdss_dp1 {
        status =3D "okay";
    };

When x1e80100_platform_probe() -> qcom_snd_parse_of() parses the available
child nodes of /sound on mahua-crd, it calls:

qcom_snd_parse_of()
  -> snd_soc_of_get_dai_link_codecs()
    -> snd_soc_of_get_dlc()
      -> snd_soc_get_dlc()

Because mdss_dp1 is disabled on mahua-crd, the DP controller never probes or
registers its hdmi-audio-codec ASoC component, causing snd_soc_get_dlc() to
return -EPROBE_DEFER indefinitely and preventing the entire sound card (and
existing WSA speaker and VA capture links) from probing on Mahua CRD.

In addition, glymur-crd.dts enables both mdss_dp0 and mdss_dp1, whereas this
patch only adds a DAI link for mdss_dp1. Should the DP DAI link(s) match the
enabled DP controllers and only be enabled where the corresponding mdss_dp
nodes are enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105104624.6210=
24-1-rohith.chiluka@oss.qualcomm.com?part=3D1
