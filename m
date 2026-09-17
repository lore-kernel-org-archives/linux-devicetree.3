Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4F62DA76C
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 07:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630857; cv=none; b=ifWAYusP8EWrBMj8ddPlo0t83Ma4SNqkCd4iXCWnJS2UQ0q8DByEwo6qS20O7iDlVygU9YVd/ALkjVuC7Nj/vjwAUS2Uf3iD+aTD7W3Yf38EXqJsi9guZQV69v90y60Xwo7xab7wLRT6gvrcFJiVBkbCqICouW14gdyvjXBuVbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630857; c=relaxed/simple;
	bh=qAhAefdBo1Pc0z5RKc1I4uSQpsMN80Rg707ZECDMJms=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iC07bvQUYPMpJqu2AkZ49rIvKeTZyV5DkwQYqdIfVAouBW8z07GPyIpa24QA8vWV2LLDP9NmDCSiCRAp6TQ87jSkVL9xcXePaVRSJvy5tSO4Bs9PN3rfbCC84UNIAV60dqtWqubnB6HTCHneBVNlfwKKzW42+uNth7AXOhUbEFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mur1sKvn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mur1sKvn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8D21F000FF;
	Thu, 17 Sep 2026 07:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789630856;
	bh=GYGWNwmhjXTmjZeLjs1N/8v2p7hF8S+a4Q9jgdnaC6w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mur1sKvn3rcGCw9GMEsuiOgOwezLoNDrGXz0URgux7aOKqqR8xfSy2OsCZdIhtSh6
	 MFAf72cefh8WkQSVYvKFplZkNt1+0Y4XzO4hg8NmpEy856VMGYmMlMj4X3ZInHou3r
	 HmJoztzn0fYsXxVJ3HJoMHMiALfp8tG3mbsH4ZF7RL2EaVuQzbq8q3vV3Nwl6IvWWL
	 s3mdEeT3aULhAbBo4s+jTiNZX19B+fRWUepsmlaoCkIipm+fmgp9Q2rqy+UaoMgKtM
	 QE3l82NMPqEzzGoFJJjVroXDb5wdnei/qHeicSA/r+lmXXj5oRJX4bVTV8jEoqk4UY
	 ab8T1cP5xckzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: mtu3: add mt6595
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917-6595-mtu3-v1-1-a2ba7c230d68@protonmail.com>
References: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com>
 <20260917-6595-mtu3-v1-1-a2ba7c230d68@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 07:40:55 +0000
Message-Id: <20260917074055.DA8D21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: usb: missing mt6595-xhci compatible string
--

commit bf0442b1c6b34e3d41069513b9f9734a69cb287d
Author: Roman Vivchar <rva333@protonmail.com>

dt-bindings: usb: mtu3: add mt6595

This commit adds a new compatible string to the device tree bindings for the
MTU3 IP block found on the MediaTek mt6595 SoC.

> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/D=
ocumentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> index 21fc6bbe954f9..4538df164a16d 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> @@ -22,6 +22,7 @@ properties:
>      items:
>        - enum:
>            - mediatek,mt2712-mtu3
> +          - mediatek,mt6595-mtu3

[Severity: Low]
Does this also require a corresponding update to the xHCI binding file?

When the mt6595 MTU3 controller is configured in host or OTG mode, it
instantiates an xHCI child node for host functionality. This requires an
SoC-specific compatible string in the device tree (e.g.,
"mediatek,mt6595-xhci").

Because this compatible string is missing from the properties:compatible:it=
ems:enum
definition within Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.y=
aml:

  compatible:
    items:
      - enum:
          - mediatek,mt2701-xhci
          - mediatek,mt2712-xhci

will valid mt6595 device tree configurations fail schema validation when
running dtbs_check?

>            - mediatek,mt8173-mtu3
>            - mediatek,mt8183-mtu3
>            - mediatek,mt8186-mtu3

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-6595-mtu3-=
v1-0-a2ba7c230d68@protonmail.com?part=3D1
