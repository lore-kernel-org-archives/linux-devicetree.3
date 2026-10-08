Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3602931F4
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 01:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791424798; cv=none; b=pZcJU1McdnZz+IORMQSqvN5nTcNkYN8dRVvMPrcYZ4+5enSvGrf2SZwOuJocgoF5hFbvJQZRTq4BJU2wK5o5J2IKBEdoBQmdvgBmmKl0Wbli1u1uHv4v4na2PCmkWsERziiwdQ38Y7eYt+ytc+S3pn2xuVNgEG3pC1W8piVcDxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791424798; c=relaxed/simple;
	bh=GmMtFkMlPCpfBTOPvCKyv0wHF+BhpfcTWzEMpED0TjA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Xg8mAsFEdoKclqeouUNormoXGUxGDHLld0uyY5+1ndrRHw711MEYv6P6EhkSCP5EiyEPcZHyGGAMlWVfGlIL16YOmcuSLvl271GfO57uI3vImUVWj8s3YE/8/YFdjaD0aAT0PmIKgvnBg2egwGjgyYF1imjVPMnstYUKIeEQH00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGmt42y0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGmt42y0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723721F000FF;
	Thu,  8 Oct 2026 01:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791424796;
	bh=CULGASgaM5QwicWqxVjMv2H10qJZYBMk49z7tW84dlk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HGmt42y0pB81p5iZJtDQIQEqzu1ejin5yyTRreydzL4ZDHopbJ7x1ECgn5muvR2Eq
	 +KPhr4/Kk6TfEi6feAG8AY+LZVhJErNR3c09Bqip6h+zXTOvLRgP/F6jbNc2iPYvzb
	 yfhfGyZJ0j5lpaj5PcNbmqojhoI7G+7l7kqkiDztBy68yR8WXt1vQlUmzm4KCYftUI
	 kO27Gw/GQvG5m32yqmSxcUM8yBVN8d0uHcdb0O/1ZUqEyxk0EceDPFlJ2UTIngIOJw
	 hsYO7kwqEQUsTL710kEJ5cWn+jxnMvOZICXAN6Zpb3A7//7VQfkXkfpCcFhVY2YtRs
	 O9kgx0ASA8LrA==
Message-ID: <sashiko-outbox-163503@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add Nord cfg_ahb clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org
In-Reply-To: <20261008015017.3359804-2-shengchao.guo@oss.qualcomm.com>
References: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
 <20261008015017.3359804-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 01:59:56 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: phy: qmp-usb43dp: missing minItems constraint for cfg_=
ahb clock
--

commit 764bc6428baefa52be476d672ac87df285751a59
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Nord cfg_ahb clock

This commit adds the Nord compatible string to the qmp-usb43dp PHY binding.
It includes Nord in the conditional blocks that require a fifth cfg_ahb clo=
ck.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb4=
3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb4=
3dp-phy.yaml
> index 13e64fe510b8f..809bd4e1090a7 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy=
.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy=
.yaml
> @@ -209,6 +209,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,nord-qmp-usb3-dp-phy
>                - qcom,sc7180-qmp-usb3-dp-phy
>                - qcom,sdm845-qmp-usb3-dp-phy
>      then:
>        properties:
>          clocks:
>            maxItems: 5
>          clock-names:
>            items:
>              - const: aux
>              - const: ref
>              - const: com_aux
>              - const: usb3_pipe
>              - const: cfg_ahb

[Severity: Low]
The conditional block for platforms that require the fifth cfg_ahb clock
defines a 5-item list for clock-names, but it fails to specify minItems: 5=
=20
for clocks or clock-names.

Because the global schema allows minItems: 4, a device tree providing only
4 clocks will pass schema validation.

The driver uses devm_clk_bulk_get_optional() for these clocks, so it won't
fail to probe. However, as stated in the commit message, the cfg_ahb clock
is strictly required to gate the AHB2PHY bridge and access PHY registers.
Accessing unclocked registers will lead to a system hang or PHY failure.

Should this block include minItems: 5 to correctly enforce the presence of
the 5th clock? A follow-up check through the series ends shows this was not
corrected.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008015017.3359=
804-1-shengchao.guo@oss.qualcomm.com?part=3D1
