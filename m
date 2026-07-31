Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B33E14A60F
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785474651; cv=none; b=tze9jc67lm/T26fetnoPF1z9pXUTHD181AlElkQxvRDsZAkjBYBKPeQZmErdPwuOJoHsUFIbpeQz/Or4x8s4pbiOegXm67RrOPZvrwWFxgAzbDcE5yZnOt0KkGrwkD86qRMv8Nkixsg4mR8aAvc2F0fcTNWV6hLy1zmEEgox38Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785474651; c=relaxed/simple;
	bh=dJIVUgGZgEYT88P9EpOsrMabMYcwRBmyTrnd0ES7T8Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g05U6PqqCT0RK1Kx3QKXP2MQg6GmcHdtK31SXTXUokjeE1tHGDtWeOfzHSor7StwThns0Odr9kxIbgO9eEM3Og849GARduWiNfU7DkMke1eCJL/6XW0p1s/QZ9dNvZvnuVZediFvx64/O5DY11qAGKQf2sfNJeg+bF5f0ANE+Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfxJkgNm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfxJkgNm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445451F000E9;
	Fri, 31 Jul 2026 05:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785474649;
	bh=PvhUeT1XaflhwaF8goQ1ScOrzbI5x/AEaohJAW5sL8s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HfxJkgNmcnu1FV1I7UbJ7iG4V/wjHlu2sq/sYlCBCqZYCio8DeHDGt8eHVvTWf9OW
	 GDqCwDH2NGHUdhRa/sQAL6+bmdYm2nZY8BxXBW4IVassxOeWVAwLZOv5rNbMzCHvuj
	 ZRfzHc41cOngovjYFK9uQlANUGSmgK/Fp0Z8l8KD0iXBis9jBRUvM4r9EBrS32RyTx
	 EHEZ6qhMIzJgWbuiGLj9i+mOigLxZX61Cq83/Je8FOc5BcqnKH68VKhhJCtWdfBlAT
	 JD7Xsv7sOW3E5EY38xjsDi0xOSAtA4WUlAQ6i4KdT7XMpz+6UOU8T2tBDyNMJ1m0DO
	 LpZQgSMn7BFyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 compatible string for SM8475
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260731-sm8475-pmic-glink-v2-1-28c04928ef22@proton.me>
References: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me>
 <20260731-sm8475-pmic-glink-v2-1-28c04928ef22@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 05:10:48 +0000
Message-Id: <20260731051049.445451F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The new compatible string `qcom,sm8475-pmic-glink` is missing from=
 driver match tables, which will cause functional failures for UCSI (Type-C=
 PD) and potentially the Battery Manager.
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add =
compatible string for SM8475 ---
commit 6029f64195b0d5f78f56d1dc22f18faabeb47c53
Author: Esteban Urrutia <esteuwu@proton.me>

dt-bindings: soc: qcom: qcom,pmic-glink: Add compatible string for SM8475

This commit adds a new compatible string for the SM8475 SoC to the pmic-gli=
nk
binding. It separates the SM8475 from SM8450 and SM8550 due to process desi=
gn
differences.

> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.y=
aml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index 16ad4f5698fc3..c80c724113816 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -30,6 +30,7 @@ properties:
>                - qcom,sc8280xp-pmic-glink
>                - qcom,sm8350-pmic-glink
>                - qcom,sm8450-pmic-glink
> +              - qcom,sm8475-pmic-glink

[Severity: High]
Should this compatible string also be added to the driver match tables in
drivers/usb/typec/ucsi/ucsi_glink.c and drivers/power/supply/qcom_battmgr.c?

Looking at pmic_glink_ucsi_of_quirks in drivers/usb/typec/ucsi/ucsi_glink.c,
missing this compatible string causes of_match_device to return NULL. Since
both SM8450 and SM8550 require quirk_sm8450 to enable UCSI_DELAY_DEVICE_PDO=
S,
missing this quirk on SM8475 might lead to USB Type-C Power Delivery
negotiation failures.

Additionally, in qcom_battmgr_of_variants in qcom_battmgr.c, an unlisted
compatible string implicitly falls back to QCOM_BATTMGR_SM8350. Does SM8475
require the QCOM_BATTMGR_SM8550 variant instead, and could this cause batte=
ry
manager regressions?

>                - qcom,sm8550-pmic-glink
>            - const: qcom,pmic-glink
>        - items:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-sm8475-pmi=
c-glink-v2-0-28c04928ef22@proton.me?part=3D1
