Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316344;
	b=Mvqt0rCSu5f1KNTwzVsuySmsc96xwiTSfx+eTFq0gjUj5Z6WiUXKGRKihFJ0ej0ieDfG
	 340okriFRdA9FgwDpQRaZigyERV01u3A8EIzFLm2FP//n+lYzI31oAB4ASs2TDdV+u6sL
	 BItJj5XoFWuvhjOzAIWAUdn6W5IQwKizn5IxRzv6dZe1yaRp3P5pYJiTxkHASvFWc7SXG
	 hErCYm4SezTkcPNNyOfbAXL/RkFEns4r46XGfIo1Jku8HUMwJFEe0+rfKwY3MJ3NzA+j3
	 VI1UHTqKnlGokPyCmN0U9qmzBguupJR7MjCFhAQkVevkPH+AM6h+/OJgBA69owiK8sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316344;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4TnoQ31cxBTJa9Bni6H9V/OFa4756WScSdnspb3np/Q=;
	b=5Hns5MRq9l1moirvjwtfjykLy2d7q3hVkGLJEOV4L2Gt2AvZM966zkaYwSMingIu/ppj
	 SWIk7q/A8QEJzDdNRKKBRI+kFGVzIV85joNHgYEjavXgWsLe4N51+GNNUEY21pIqoqutf
	 NpI1qf/RiGlmmVHE553BCOWdQ979dH6Ez83DtULHeCnXt5wlhbj+zfWkBNYlolwNgr2s/
	 1sqj1kZgk+03oqxlqjfhys0HYwPDyfVkYTAvZBNwXWf3YeKFtVxqCSSEWYEsisWnet8TS
	 8ks92PsDfyaVB2DzH/mAQIrbYYALWAzpDJKN96dxSxRliLKB72oSmazsMb6y6qrnAZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jVvygpft;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC09606A749
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 13:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jVvygpft
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DE41F008A6;
	Tue, 10 Nov 2026 13:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794316343;
	bh=4TnoQ31cxBTJa9Bni6H9V/OFa4756WScSdnspb3np/Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jVvygpftu8kxS/GLStdNtNg9TcIAr59kxoVu0CZOdGYKfmGM6SElTJOPDpjvJdsSH
	 NDAIq1RuPGp2chlprozu7Sc7H84ajxOr6jbknBelEG8oV0jucdP9ajhBLgBs7EARpA
	 FHjDSWEtDh87WLJprhI4xoGxglD5UkNrtSihYmXxXD4pCzBPj1wu3B7GVOQiBucAQI
	 DYsLU5dWAZFLeD4x7vTZLvdHpjmtUL38D0kBJ0m+R3ze47yZrc4Jq4X3LdoDE5ZNoa
	 6rCVNsOInx5T6wQSMc9r/kASCXQjshkpOXcYAnBa8VWPyzrM8lNJYwtvJdzr0/vDp3
	 s2iugZto2KkZA==
Message-ID: <sashiko-outbox-207102@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: msm8916: Disable disconnected DSI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-display-msm-of-graph-v1-1-0f3106f817b4@oss.qualcomm.com>
References: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
 <20261110-display-msm-of-graph-v1-1-0f3106f817b4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 13:12:22 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: msm8916: broken display and probe crash on
  apq8016 boards
--

commit 84868fbeac14d1ada5236c28cee63ebec6ea8fbd
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

arm64: dts: qcom: msm8916: Disable disconnected DSI

This commit disables mdss_dsi0 and mdss_dsi0_phy by default in msm8916.dtsi
and enables them in four Samsung board DTS files that define a DSI panel.

> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/=
qcom/msm8916.dtsi
> index e39743e220438..7d351cd15f901 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1634,6 +1634,8 @@ mdss_dsi0: dsi@1a98000 {
>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;
> =20
> +				status =3D "disabled";
> +
>  				ports {
>  					#address-cells =3D <1>;
>  					#size-cells =3D <0>;
> @@ -1668,6 +1670,8 @@ mdss_dsi0_phy: phy@1a98300 {
>  				clocks =3D <&gcc GCC_MDSS_AHB_CLK>,
>  					 <&xo_board>;
>  				clock-names =3D "iface", "ref";
> +
> +				status =3D "disabled";
>  			};
>  		};

[Severity: High]
Does disabling mdss_dsi0 and mdss_dsi0_phy here break display and audio on
apq8016-sbc.dts and apq8016-schneider-hmibsc.dts, and cause a NULL pointer
dereference during boot on apq8016-schneider-hmibsc.dts?

Both APQ8016 boards enable &mdss and connect &mdss_dsi0_out to an I2C
ADV7533 DSI-to-HDMI bridge (remote-endpoint =3D <&adv7533_in>) instead of a
child panel node, without setting status =3D "okay" on &mdss_dsi0 or
&mdss_dsi0_phy.  With mdss_dsi0 disabled, adv7533_parse_dt() fails with
-ENODEV because of_graph_get_remote_node() sees an unavailable remote paren=
t,
which also prevents the &sound card referencing &adv_bridge from probing.

In addition, on apq8016-schneider-hmibsc.dts where &mdss is enabled and &gpu
remains disabled, add_mdp_components() skips the disabled mdss_dsi0 node and
leaves match as NULL.  mdp5_dev_probe() -> msm_drv_probe() then passes
match =3D NULL to component_master_add_with_match(), which dereferences
match->num.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-display-ms=
m-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com?part=3D1
