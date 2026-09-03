Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CFA4BC019
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 14:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446817; cv=none; b=HNRIItQlgLZlixtT2jF4PLY3qAcrc9+krU773DBEOJpcPOz0RhNHQK9Ar9EbDGwPTV053ApLLzljqCePXT1iYMVfq5sIc5/djWqlsQHQ62nn3ZVC+8Yux/nP/CfjMldlVasS5wnq4LnIuNWsnRsIhIexdKyeht5hDEy9uq6Me+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446817; c=relaxed/simple;
	bh=sHQlViTFr3AwytHJe40AUPFc8hbyQrKBGJrcQFbX1tE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pQZVNgdj9CwNHDxz6dSO+PnF6QnNxVL9B6ia4IL8+xwrJukr71H9Op8ZOzWEGv/5EfYDKYnys3KRGdQF0vG0mldjV2H+Svm/Ha7p8LXjrASVUKW3gYHFDGxy0bvLeHKatjNhxxu6cCW72hnKZeO6Qv/TsVXFkM2QHL9xe9VlhH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUPgw6JD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUPgw6JD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1791F00A3A;
	Thu,  3 Sep 2026 14:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788446816;
	bh=+qs3EBF9nenvfUTPLlMjM9Xf+f4F2PfRSpFYfdDb/8M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NUPgw6JD0c0gkfHn8p6HlVRkZnxba+cWUi4dplbf/B6zR7pklDQm+aB9d0gPmA0bs
	 37tPHA901TXZUf8GIR2Vu0RZ3XkcmpF5Ob6v3kwt7CahB19ocCpc9m7XDvIci25fUP
	 yA1NxUNfx9w+ck++Kwx4e55dbR/hKeNTueLhUWFcV+eCdbBI2b4EAu7fFIbrFdNAo2
	 SGsi/3Mq4pwcNfwwLK5vCRFHY/2CT0Wu7rwN+/EoK4eZTk2VBD0TobaGotIPlwEhRJ
	 7mOtRmrSqFmUFJC/sKJkmL1wwAdaCnmaUaIaplGskLlAR314+HP4W3sBRXP1NsbRq/
	 2fe/wykQzijWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: qcom,qusb2: Straighten out
 SM6125 and MSM8996
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, olteanv@gmail.com
In-Reply-To: <20260903-topic-8996_61x5_qusb2phy-v2-1-4c3f980a4560@oss.qualcomm.com>
References: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
 <20260903-topic-8996_61x5_qusb2phy-v2-1-4c3f980a4560@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 14:46:55 +0000
Message-Id: <20260903144655.BB1791F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding change causes dtbs_check to fail for existing in-tre=
e MSM8996 and SM6125 device trees, and introduces an architectural disconne=
ct with the driver's unconditional regulator requests.
--

commit a8357f1a883ddad429bf80e6c26f5fba143404de
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

dt-bindings: phy: qcom,qusb2: Straighten out SM6125 and MSM8996

SM6125 DT currently uses just the MSM8996 compatible (without a primary
SM6125-specific one). This commit adds a new compatible for SM6125 with
a SM6115 fallback. It also updates the MSM8996 binding to require
power-domains and required-opps instead of vdd-supply.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/=
Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> index 001fd0ccc9852..cfc5a1d16b7f2 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
[ ... ]
> @@ -187,6 +195,22 @@ allOf:
>          qcom,preemphasis-width: false
>          qcom,hsdisc-trim-value: false
> =20
> +  # On MSM8996, VDD is supplied via the MX power domain
> +  - if:
> +      properties:
> +        compatible:
> +          const: qcom,msm8996-qusb2-phy
> +    then:
> +      required:
> +        - power-domains
> +        - required-opps

[Severity: Medium]
Will this break dtbs_check for existing in-tree MSM8996 and SM6125 device
trees by mandating power-domains for MSM8996 before the in-tree device
trees are updated?

While this dtbs_check breakage is resolved later in the series by commit
"arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs" and commit
"arm64: dts: qcom: sm6125: Fix QUSB2 compatible", does this change create
an architectural disconnect with the driver that remains unresolved?

Looking at drivers/phy/qualcomm/phy-qcom-qusb2.c, it unconditionally
requires the vdd regulator:

drivers/phy/qualcomm/phy-qcom-qusb2.c:qusb2_phy_vreg_names[] =3D {
        "vdd", "vdda-pll", "vdda-phy-dpdm",
};

If a strictly schema-compliant device tree omits vdd-supply for MSM8996,
would this cause the driver to fail probing when it unconditionally fetches
vdd via devm_regulator_bulk_get()?

> +    else:
> +      properties:
> +        power-domains: false
> +        required-opps: false
> +      required:
> +        - vdd-supply

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-topic-8996=
_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com?part=3D1
