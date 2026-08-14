Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C9D372EE9
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 07:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786691359; cv=none; b=i+upD8yosXc+fmHbzYfS98E47utTuVjwVtnm6f2CsT2dkpfd2Fx8POJn+g8OS7GIIdRVY8rSSOgRFgoHoI+S0vbZpTVqkSDfM1Wk3Y5Dmgnd9sDUBNQqpv4DeuYdWFFMZ8g1wmcYxGSKg/UaHCEf5+CY9e6R3+XndDlWhDok2u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786691359; c=relaxed/simple;
	bh=8Lf7VxOWQzwvsj7hVty4ouMoCf2uOq1VIWRs1trlvTA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dEnm72f7CbQ87vMBXf7Da4+zv0fSJVTR5F6KCbpJmOr8cSuCInWBhs+0Dukq5232Byk74kwU3WMRqfI7AnZbwMaJsVGEkX3wpx4dBVhV3MV2NrbMVD5foU537fFH+P5gj5OtfqWMAaxterh5Ud54BKEdjCQOypleH1O/lhoj2KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHPmUUQZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHPmUUQZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CD81F000E9;
	Fri, 14 Aug 2026 07:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786691358;
	bh=npxA05NKwFND8TectVqu8PFbsQYarhozBa6ZOm/34eU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RHPmUUQZkWHBjw5G0DPmftcdF/Oft69MIot70L4Gwtkmkx+2uYcusi+3uDnSnpZ2r
	 luMDbgL1s1Vg2yzVOqPFrAJfuZ8KvOUybbt0VZb7O8ztFgpAuPN3Ayd00iOMndHMvl
	 9FWoxOhFaw5C2+FBbSd1M0LDsiEqcD7ZP0xzlxnjuu3s2ACxJNUFHKfqF79SQqX8fa
	 IXm5VHLVIkc4rGKfMp10KiqjOib84yJbws7LNsbAjjLhcYFRQ56JJGBoO0mnOkibEK
	 9Dkm5HaDGsidhrFU5I7o/MvZlEs6ycdkyQnA6QqfUeK2jxz3rOGsrOmJXIEdeEBUsD
	 Jp1IUGEjy02Iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V2] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP
 UFS PHY compatible for Maili
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nitin Rawat" <nitin.rawat@oss.qualcomm.com>
Cc: olteanv@gmail.com, conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260814070112.1676300-1-nitin.rawat@oss.qualcomm.com>
References: <20260814070112.1676300-1-nitin.rawat@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:09:11 +0000
Message-Id: <20260814070917.78CD81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete Binding Schema: The newly added compatible string `qc=
om,maili-qmp-ufs-phy` and its fallback `qcom,hawi-qmp-ufs-phy` are omitted =
from the `allOf` conditional blocks, and the fallback string is not defined=
 as a standalone compatible.
--

--- Patch [1]: [PATCH V2] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add =
QMP UFS PHY compatible for Maili ---
commit 85736fd391afb5ebf38138e2d5c3a36609d6c2c8
Author: Nitin Rawat <nitin.rawat@oss.qualcomm.com>

dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP UFS PHY compatible for=
 Maili

This commit documents the QMP UFS PHY compatible string for Qualcomm Maili,
using qcom,hawi-qmp-ufs-phy as a fallback.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-=
phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.=
yaml
> index b2c5c9a375a35..f74434f51653c 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> @@ -16,6 +16,10 @@ description:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - qcom,maili-qmp-ufs-phy
> +          - const: qcom,hawi-qmp-ufs-phy

[Severity: Medium]
Does the addition of this compatible string require updates to the allOf
conditional blocks further down in this file?

It appears the new qcom,maili-qmp-ufs-phy and fallback qcom,hawi-qmp-ufs-phy
strings are missing from the allOf conditional blocks that enforce hardware
constraints like clocks:

allOf:
  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,milos-qmp-ufs-phy
              - qcom,msm8998-qmp-ufs-phy

Without these updates, device trees with invalid configurations might silen=
tly
pass validation.

Also, could this cause a schema validation regression if qcom,hawi-qmp-ufs-=
phy
is missing as a standalone compatible definition under
properties.compatible.oneOf?

      - enum:
          - qcom,milos-qmp-ufs-phy
          - qcom,msm8996-qmp-ufs-phy

If a device tree uses only the Hawi compatible string, it seems it will fail
validation entirely because it is undefined as a standalone item.

>        - items:
>            - enum:
>                - qcom,qcs8300-qmp-ufs-phy

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814070112.1676=
300-1-nitin.rawat@oss.qualcomm.com?part=3D1
