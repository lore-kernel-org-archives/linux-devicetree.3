Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D7D3D3D19
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383443; cv=none; b=JgVvONC08BhXgozm4EeBic+fGraDo9DCdJTwQOvV8vRt+UE9PaMttcSVCTyt6ZTufU5UBsxXp/XPtpRPJNem7D5Hl9snGf+1JxZuyOww+LHUcSxur0ZLK6ueS4V5ep+s0Bh3bRbnmX3NA+BknOC7skBE8B8lF/Wu+kXvuCs/otw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383443; c=relaxed/simple;
	bh=aLWU8hikuauy+pJbLd3JTmxSZISZwLo+duKILpCbmbM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HoLnsZNHpt4Cv5vx57we8lc86x5uTezpaeui7UxcD3Ty/K3frOUekst1E6yab7YHPImVsEJsJthEY+elq04l0LN/vwuXsShv35RK2qYJZPFiflAU77PvdovRSLEGlNMr1PGI2NMlDJd5EacbDXa3vjYZBSpRnbq4GwRpnLbYiXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A05X49v1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A05X49v1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EC01F000FF;
	Mon, 14 Sep 2026 10:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789383441;
	bh=pWPbUiYNz6DDAEQVPm0ajqtwRDhWHHjtORVHXVE0Ecw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A05X49v1hrX0HVNrR6OV1n/RljrmHEg06q4JJ0nXHbcvO92KAmWj11B5oxE1B7hSz
	 udEbGNaMji8s0ZPWvyKgWiKpQ9raI2g1ZmvqSdmLsUfRtSnvyeGaYGfPJMQsKOdP/s
	 QSoG1vx3tusog8FOOjYQtIqxpT8fFoAAWC8Nis9IDMn3VWQ1gnfOO9jc0rhEPporxq
	 mtG5KKNrqJcB/QxYha2cIfhT2Ez37kE79ow4JpHtY5qBs9pu5NR/LAUDLHAunuOj0x
	 cwV10ctmQcWpkM+KqfoXsGgnKf+JGEUcIqZ0wr0FZ6TgqBtWfxG5UE7zLVmk/8T4GB
	 6VVdgJfI+rVYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Add more compatible for
 Eliza EVKs and SoMs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260914-dts-qcom-eliza-add-ufs-variant-v1-1-78b3249eae61@oss.qualcomm.com>
References: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
 <20260914-dts-qcom-eliza-add-ufs-variant-v1-1-78b3249eae61@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 10:57:20 +0000
Message-Id: <20260914105721.49EC01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch modifies the YAML schema to strictly require 5-element st=
orage-specific compatible strings for the Eliza CQS EVK, removing the gener=
ic 3-element definition. However, it fails to update the corresponding `arc=
h/arm64/boot/dts/qcom/eliza-cqs-evk.dts` file in the same commit, which bre=
aks `make dtbs_check` validation and violates kernel bisectability rules. A=
lthough subsequent patches in the series (e.g., commit "arm64: dts: qcom: e=
liza: Rename existing EVK to suggest eMMC") remove the old `.dtb` from the =
Makefile and create new `.dts` files, they fail to actually delete the orig=
inal `eliza-cqs-evk.dts` file. This leaves an orphaned, broken file in the =
source tree that still contains the invalid compatible string and includes =
a `.dtsi` that no longer exists.
--

commit 4f90c244c9f57e32c917bcd1103262760ccb1acd
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

dt-bindings: arm: qcom: Add more compatible for Eliza EVKs and SoMs

This patch documents the eMMC and UFS storage-specific compatible strings f=
or
the Eliza CQS SoMs and EVKs, replacing the generic strings since the boards
are not yet publicly available.

> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentat=
ion/devicetree/bindings/arm/qcom.yaml
> index eddf87fbd0ccc..1dd187e92b680 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -56,7 +56,16 @@ properties:
>            - const: qcom,apq8084
> =20
>        - items:
> +          - const: qcom,eliza-cqs-evk-emmc
>            - const: qcom,eliza-cqs-evk
> +          - const: qcom,eliza-cqs-som-emmc
> +          - const: qcom,eliza-cqs-som
> +          - const: qcom,eliza
> +
> +      - items:
> +          - const: qcom,eliza-cqs-evk-ufs
> +          - const: qcom,eliza-cqs-evk
> +          - const: qcom,eliza-cqs-som-ufs
>            - const: qcom,eliza-cqs-som
>            - const: qcom,eliza
> =20

[Severity: Low]
Does this change break dtbs_check validation for the existing in-tree
device tree file?

By strictly requiring the 5-element storage-specific compatible strings here
and removing the generic 3-element definition, the existing file
arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts will fail validation until it is
updated:

arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts:
/ {
	model =3D "Qualcomm Technologies, Inc. Eliza CQS EVK";
	compatible =3D "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
...

While later commits in the series address this by creating new .dts files,
updating the schema without updating the corresponding .dts file in the same
commit breaks bisectability.

Furthermore, the original eliza-cqs-evk.dts file does not appear to be remo=
ved
at the end of the series, leaving an orphaned and broken file in the source
tree.

Could the device tree file update be squashed into this commit, or the sche=
ma
change delayed until the new device tree files are introduced and the old f=
ile
is removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-dts-qcom-e=
liza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com?part=3D1
