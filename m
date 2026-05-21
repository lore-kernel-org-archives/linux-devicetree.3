Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342B713A3F7
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377196; cv=none; b=HLiD9scQyx6URkpAnWRdOwwK/zQD1xvXu44U7jGPs/IF8gWppld1u3PVbNILGNrtlHquOlz/5Z68QHhZw2Jeh5Jg68w3TUeLiRTrQYcPAZwCRS19g1RPgvWap28GBCcaLD0Rz0a4EhnhqrI4rIw4A6AMYt0p2WeOrduUmKh1JCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377196; c=relaxed/simple;
	bh=0PtztILgUijSrxdvcppANANlGgHw96a/MDb8yztgJyY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QYsZVWSt68oM2Dab+Sze/W3w9KUSA7NJSnErGY94mpK5K5PlSoAmMadcwnYU8G7tbhf0SV06XTqDunryN0c2VYcEerk6Cd6DiL+5E8o1ch8k5KLkk8uMJBPCqe5mQE/q4auj3WmNoZJ8zvVQpPU8tvEkirDuCoQduoZFqpeJw3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTghoVT7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTghoVT7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3BB1F000E9;
	Thu, 21 May 2026 15:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779377194;
	bh=Pt9vJVof8fX2iM0BfTh/qRMqJiJKnBmsC/csDFGT+bU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kTghoVT7OGGxa92rE2YnIU1OgDtRimc148pU+6cYetn6odHa3iwpZNkz1MSuDBtUd
	 nkQBb5OK9HBPV2pxDCecm1VYW2BE61fNJUa9qe6mqzRf5ddbwlr4ESDs2ezNuUSDGV
	 V1eanK3PmW+ooApWtegCSUuGlA31LzArbbHFel4m4JfeE9LxMUIyyXqZJECuYsC0mm
	 Gy4ErwYGPTH+TMc2INc/QG1dN5X8NJ1ZYlZ5doyhAFRdipYh2Q32Xs6Jn1PWhz5vs5
	 /7+iaarhRntLxwbrpZSJRv863sqtc2p8EdedB7DR0ieLLol6740jmAgRkPorIDsKcu
	 54A9pRwCOaf2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 01/15] dt-bindings: display: panel: Move Logic
 Technologies LT170410-2WHC to LVDS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vitor Soares" <ivitro@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521150038.103538-18-ivitro@gmail.com>
References: <20260521150038.103538-18-ivitro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 15:26:34 +0000
Message-Id: <20260521152634.9B3BB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Moving the LT170410-2WHC panel from panel-simple.yaml to panel-l=
vds.yaml breaks backwards compatibility and enforces unnecessary DT propert=
ies, as the panel is already supported by the panel-simple driver.
--

commit 2566a5e0031b5362bab9727f188d6fff83345dfc
Author: Vitor Soares <vitor.soares@toradex.com>

dt-bindings: display: panel: Move Logic Technologies LT170410-2WHC to LVDS

This commit moves the Logic Technologies LT170410-2WHC panel compatible
string from the panel-simple binding to the panel-lvds binding.

> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.y=
aml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> index b31c67babaa86..9db96dd724b24 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -58,6 +58,8 @@ properties:
>            - hydis,hv070wx2-1e0
>            # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT =
LCD LVDS panel
>            - jenson,bl-jt60050-01a
> +          # Logic Technologies LT170410-2WHC 10.1" 1280x800 IPS TFT Cap =
Touch Mod.
> +          - logictechno,lt170410-2whc

[Severity: Medium]
Will this break device tree backward compatibility for existing users?

The panel-lvds.yaml schema expects the compatible string to be a two-item
array ending with the generic "panel-lvds" fallback. Existing device trees
using compatible =3D "logictechno,lt170410-2whc" will now fail schema
validation because they lack the fallback string.

Additionally, panel-lvds requires explicit properties like data-mapping,
width-mm, height-mm, and panel-timing to be defined in the device tree.

Since the panel-simple driver inherently supports LVDS panels and already
hardcodes the panel's configuration (timings, dimensions, etc.), is there
a reason to move it to panel-lvds and mandate these generic properties in
the device tree?

If LVDS-specific properties like data-mapping are needed, could we keep
the compatible string in panel-simple.yaml and add it to the conditional
exception list that allows data-mapping instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521150038.1035=
38-17-ivitro@gmail.com?part=3D1
