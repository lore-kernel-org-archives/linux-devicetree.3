Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A26E64AA4
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112798; cv=none; b=e1NTHbIUUSEiCLcDGmXMD8srNaKPrLGxCj6uz9/AkL1UNjrVbTcPGdVN1bL61oXr6uOOwEjCDDA6gPc5mjih4hNWpMUTBAte3BTfkA4Vph0UP0M6wWTyiCKtgB4yohG7iFFkvw0jR4YH1+dYjHC4SGhC+jp3/FaYalg7HgUDsaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112798; c=relaxed/simple;
	bh=dcbegfIT75r+BtDPix/k/0cHTAvX8uOvkJdiDLNy6io=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nFGwxb5habPZ/kW2q1PN+dfWWIlnxCc6zy8KijDfEhQkdu1fhM28gNQxDbjf32+xRm1l2Igpeva4jK94i3PrUbrOS+/4wgkZVu9hJxa6xSJ+POBVoB0reTerdpto+Np1cPCRrX4dk8cOirgW8DxVunh1Exry2xiB0t71whswjxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=stGVFnjU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="stGVFnjU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C942AC2BCB7;
	Mon, 18 May 2026 13:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779112798;
	bh=dcbegfIT75r+BtDPix/k/0cHTAvX8uOvkJdiDLNy6io=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=stGVFnjUJ0WA5RfUKEFVcgSiJVbAJYZgZAKAk3X5k+JORTIINIYSJvzT6zBN+erqF
	 79rWw+/15RL04O1xA+qwr0GXq6T8YQTUF9WG37kqzV55M7uJR2lRRJUMFcat46G3by
	 89OjDq/kfFeWDPCDVqG6Su4Zgy56kkjo583RHQ7Li/KoSIhL94TKJBvfo7BYjA0CcA
	 d0CDaCjPbsAcBUicEWM93GWnU5Y2Xja2LEY5Y+O0sZDak+XprbnjTH0Ys1ZmcU3MyP
	 gWTNiEPLzejR9LbWRzxiuQ+v/5fNzPaCTnO2W3ylduyW9kgSPq5NgfqC/+yL1dDxeY
	 GpP9tOGD+BHGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rakesh Kota" <rakesh.kota@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260518-add_dc_in_support-v1-1-31fbaa329879@oss.qualcomm.com>
References: <20260518-add_dc_in_support-v1-1-31fbaa329879@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 13:59:57 +0000
Message-Id: <20260518135957.C942AC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree binding description references Linux-specific subsy=
stem constants and dictates OS software behavior instead of strictly descri=
bing the hardware.
--

commit 27eac983fdf61301b30bef6fc60e922a67eecbbd
Author: Rakesh Kota <rakesh.kota@oss.qualcomm.com>

dt-bindings: soc: qcom: pmic-glink: Document batteryless property

This commit documents a new boolean property, qcom,batteryless, for the
PMIC Glink battery manager node. It is intended for systems powered by 12V
DC adapters rather than batteries.

> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.y=
aml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index ff01d2f3ee5be..5f7b90d37ea09 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml

[ ... ]

> @@ -72,6 +72,14 @@ properties:
>        - const: charge_limit_end
>        - const: charge_limit_delta
> =20
> +  qcom,batteryless:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      When present, the battery manager registers the power supply as
> +      POWER_SUPPLY_TYPE_MAINS instead of BATTERY. This is intended for
> +      12V DC adapters, where exposing the supply as a battery would
> +      incorrectly trigger userspace battery power-saving sequences.

This isn't a bug, but does this description reference Linux-specific
subsystem constants rather than strictly describing the hardware?

Device tree bindings are expected to be OS-agnostic and describe physical
hardware characteristics. The current text explicitly mentions
POWER_SUPPLY_TYPE_MAINS, BATTERY, and userspace behavior.

Could this be rephrased to focus on the physical hardware state, such as
indicating the system is powered by a continuous fixed DC source, instead
of dictating OS driver behavior?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-add_dc_in_=
support-v1-0-31fbaa329879@oss.qualcomm.com?part=3D1
