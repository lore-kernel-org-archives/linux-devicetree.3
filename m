Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422898;
	b=V2o5su6Cvi4x0zJr1W9WQnz17FzbFXbEfg1eZAOrsOwsLV6962bvqqd1lD83buHsOaVH
	 1ON0HrwNsIxEI5qolIL8w3cA9j/puH3xQ0CNDjK5lD634TBdu0t4KP6k7xP1whYbHb+A5
	 DBIcBV5IJWRVJQFDymX2aSDLLzsHm0CZMVi3CyFMHZPiKrwdJirZQ3nUbFDRkhWs99Ebh
	 EkXU+inBs5EmgcZHdB7Be3nAgANVLWyz25TDqWtk8xlT8JZUwREyfDyOP0pv2fc48HzTK
	 9XmN6YBet/IG1HgnN5PelRA3rqzNxUKrqMsgC38swkwAo5blRzoQVKxv5B8OosiddcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422898;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lzI0tNsLyUyrWyDu7YugFNUzkoiLbACEMQ/CfarIk+g=;
	b=wCnPjT1MlzfZGt/57kjior58fyd3YRXlPc1KUOunAh6eKCcg3h4C5/w5RRL5Q/iLRVyc
	 ihisNeMqTeI/2QztD0aC46ODnbHqLfyV8AfvI0q8KYYDACau/SNGncxb98dsWuTDIa+Bn
	 mw6mRVwdUu+WLUIrOR9OmjmZ2yWrw7P0hL7WtG++mjG/EemF+cQsSgJ3dwgZ2KyG2Iyem
	 zhwKD4BTD1NmefzPCCo3+cB0kszTZ1T27jffI9W8lQIU3nXYG4LRxrXHSWO8OeegIR/2u
	 aip1FY5dg/h8CqOrGLm7fxNj1UuATQc9QNmwpuqEoiFvzTaFrxC9Ld5BSLqE9jR9uOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O1dw9a6O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB29606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O1dw9a6O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588B31F00A05;
	Wed, 11 Nov 2026 18:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794422897;
	bh=lzI0tNsLyUyrWyDu7YugFNUzkoiLbACEMQ/CfarIk+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O1dw9a6Oqa8lxILfDM3d0ldqqYLSDaB4s1tLOKyoAVrrkektrdlQdyNL53a4N8wnR
	 o7vn/AqllOrbOv52QKtldzQt9//XSnofaKzNKYpQdI1KTBd6zrm1nSo9RBkHXRnIF3
	 JFWTyAS+3mHHL9byxCybZGdFXSCQnsOTspJFuBw8WdDH7/DjEevhLd+x1cVgxJF2Yt
	 JCwqEmFgGXM5bkWRk68rhc4ZTtzRRMwJsfsk9MoFScqwySH+iHEDry7IxQyVKV1qDp
	 qZQ5Am+7qpYLq+1uiMLhESl4RMcRuVW5Vqj+E1m8WiOqADrrMCxw4TDIRkRSavpCLP
	 R/G/cG2e9xcpQ==
Message-ID: <sashiko-outbox-209493@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: msm8916: Disable disconnected
 DSI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 18:48:16 +0000
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
- [High] arm64: dts: qcom: msm8916: mdss_dsi0 left disabled on apq8016
  boards
--

commit 1c53100e6d0a805c4396ae622f04768b412718b0
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

arm64: dts: qcom: msm8916: Disable disconnected DSI

This commit disables mdss_dsi0 and mdss_dsi0_phy by default in msm8916.dtsi
and enables them in board DTS files that have a panel or bridge attached.

> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/d=
ts/qcom/apq8016-sbc.dts
> index ba6ccf0db16ab..6c94489f5f707 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> @@ -262,6 +262,10 @@ &mdss_dsi0_out {
>  	remote-endpoint =3D <&adv7533_in>;
>  };
> =20
> +&mdss_dsi0_phy {
> +	status =3D "okay";
> +};
> +
>  &mpss {
>  	status =3D "okay";
> =20
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts b/arch=
/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
> index ce75046ffdac4..370ad8b01a1a0 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
> @@ -218,6 +218,10 @@ &mdss_dsi0_out {
>  	remote-endpoint =3D <&adv7533_in>;
>  };
> =20
> +&mdss_dsi0_phy {
> +	status =3D "okay";
> +};
> +
>  &pm8916_codec {
>  	qcom,mbhc-vthreshold-low =3D <75 150 237 450 500>;
>  	qcom,mbhc-vthreshold-high =3D <75 150 237 450 500>;

[Severity: High]
Should apq8016-sbc.dts and apq8016-schneider-hmibsc.dts also enable
&mdss_dsi0?

Both boards connect DSI0 to the ADV7533 bridge via &mdss_dsi0_out and do
not have an existing &mdss_dsi0 block.  With mdss_dsi0 disabled in
msm8916.dtsi, the DSI controller and ADV7533 bridge fail to probe on both
boards.  Furthermore, because apq8016-schneider-hmibsc.dts leaves &gpu
disabled, msm_drv_probe() finds zero sub-components and passes a NULL
match pointer to component_master_add_with_match(), causing a NULL pointer
dereference at boot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-display-ms=
m-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com?part=3D1
