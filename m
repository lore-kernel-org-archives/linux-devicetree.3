Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027FB381B0D
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787905372; cv=none; b=GVctXPZMmyTtq8v0Ou41NshC+Bp+6vHYEGlowZP9muFmGpabrLlRCePkbONJJJ0Q9aCbj7GuiA8302IWCa1t6bSEf7XmzQhzD2m77glCB849MK3IQzcWiVhesFxQG5/OF9JDOqUiA9YDmjPK/xsv/pFcZihal1zNBoUKv8FL0Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787905372; c=relaxed/simple;
	bh=6791UxSCWp+c1dgVnPhlEmuv1c0PeOfHdqN+VlYyxcY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rZi+v4T4q8EEdDsSLsNVmI1LTKY1Wd/T78JURnndCBhFcMtUXj2T6ZdufuWM8Seu7UdNUUfO0IvE4AIoMOxGsRsOcpWOXddZvi9+fBPdW7wTc+UVmzRvjsIuH7OFP9CrJK0M8R2/gyvxzIW2nkjL35AjUZnY95tARyoZkXd+Xco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ihe+HLUc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ihe+HLUc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C9A1F000E9;
	Fri, 28 Aug 2026 08:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787905369;
	bh=Y6F4OoW7AGDZc+c/lGGOUcRFjCu5mnvpIjpa+pwqHtA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ihe+HLUc77miKeZPidXpo5py8QP/G+OAtSFfVQVK3Fn7ey6qG4mAIJSDDSwnGhkUj
	 5Nlr62uxKdkUhKkqk1tfr35LQs3vJ8UtFnuNZL+5iAl0dhJd/jNDHS5/Nj2sAf1ARI
	 NMNMoQmmjusDYQ6hnI9UHzkYCmD5n/h3rTHvhnMhCC3+DAULyt+fgWBwMIpSGzPyHM
	 mGZzbSHAylOr+OGA1OUXiJs/lrUemdfoxWLWjQOJ1dngveB0QQObZnKVf+Yrw5rWyl
	 U/B9CATbwPmvStCthXvMGN8vNDF3hVBDsMa6jcYSOC700oYASJcUYJUrO7HrPmzhL8
	 0/0YinhI2XNZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding
 for non-MP controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>
References: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 08:22:48 +0000
Message-Id: <20260828082249.40C9A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Moving `qcom,glymur-dwc3` to a different `if-then` conditional blo=
ck changes the positional requirements of the `interrupt-names` array, brea=
king ABI and schema validation for existing device trees.
--

commit 15d826b7f9c1b0ac7d9038a76e721573a86a768f
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding for non-MP controllers

This commit modifies the device tree binding for the Glymur non-multiport
USB controllers to allow a maximum of 6 interrupts. It moves the compatible
string to a different conditional block to accommodate both hs_phy_irq and
ss_phy_irq.

Link: https://lore.kernel.org/all/20260803-glymur-usb-binding-fixes-v1-1-9c=
e334777387@oss.qualcomm.com/

> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/=
Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index ea60f7220afe3..3bef18f9557e1 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml

[ ... ]

> @@ -547,6 +546,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,eliza-dwc3
> +              - qcom,glymur-dwc3

[Severity: High]
Does moving this compatible string to the qcom,eliza-dwc3 conditional block
inadvertently break the device tree schema ABI for existing platforms?

The original qcom,milos-dwc3 block matched the baseline interrupt sequence
used by existing device trees, requiring dp_hs_phy_irq at index 2:

allOf / if block for qcom,milos-dwc3:
        interrupt-names:
          minItems: 4
          items:
            - const: dwc_usb3
            - const: pwr_event
            - const: dp_hs_phy_irq

The target qcom,eliza-dwc3 block imposes a different positional requirement,
expecting hs_phy_irq at index 2 and dp_hs_phy_irq at index 3:

allOf / if block for qcom,eliza-dwc3:
        interrupt-names:
          minItems: 5
          items:
            - const: dwc_usb3
            - const: pwr_event
            - const: hs_phy_irq
            - const: dp_hs_phy_irq

Looking at existing configurations, such as usb_0 in
arch/arm64/boot/dts/qcom/glymur.dtsi, the layout defines dp_hs_phy_irq
as the third interrupt:

arch/arm64/boot/dts/qcom/glymur.dtsi:usb_0 {
                interrupt-names =3D "dwc_usb3",
                                  "pwr_event",
                                  "dp_hs_phy_irq",
                                  "dm_hs_phy_irq",
                                  "ss_phy_irq";
}

Since JSON schema arrays evaluate items positionally, won't this change
cause existing in-tree device trees to fail dtbs_check validation?

>                - qcom,ipq4019-dwc3
>                - qcom,ipq8064-dwc3
>                - qcom,kaanapali-dwc3

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828081542.5279=
6-1-krishna.kurapati@oss.qualcomm.com?part=3D1
