Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E222B4FE2E2
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073899; cv=none; b=b6SYAQOvmbqxHTOiuCIUGJvjryzbI+rSHgHQRSH+v2HWJ8WrnFS9OkM5IoVVn0lU6/2EpWrleeDJuE8T4c7H3pJfUdaBFxirtBZMOYKGeybjOEKOooUlkJJL5aKdMRXZMw8JYE9+a6TwZeJFT2ON7gHWr54bKKcyw7dMBzbWWO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073899; c=relaxed/simple;
	bh=hK2Lfq5K1b355WCjatxrOTlkCm63SFejXt709L22neQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y3nlW1ZPnzEia4GmiO+COd3ux9Oludd9NjSXIPxgozuFmmvl3kA1t89+ae3zy892DMPaVXtlRmYKOY23vS9FDdzmJJ0ZbZjvNrZ+Sjj20cu4NBcPV3/P8gmSpAvl1T1D2mFMGzQkC2LXnbAd0JoOmaf9wcIlD7JU7m2U7nbMlV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEarRqbU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEarRqbU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF4F1F00893;
	Tue, 22 Sep 2026 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790073897;
	bh=igggbBkMwAOXUpaeDWiX4uNsay1zAdu36o6EqcmzFM0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jEarRqbUKhIVk3se7eXkdwYHKFna1S2vsKZQNZUzN6WZziJ66H00rkaawIEL93RMU
	 Q/6nkLS5QhQG5ePdvhDhr6M9dtqvz4e5d65/I0XxtABZKIperAR5yZHv+VCdobFoJV
	 3sdgrguZYwcs/oLAq4btdtZe7n4mK9mJfrHJHA/pPd0VkQaYRJodZi86AQlfTe++p2
	 UsDIKzE0DpgbReCtZbb+xv8clZ5A2IMwaBeB1VGaYg5CmNsj+i00DKCng1WM7ujznK
	 wP6kaWPktaCpotd8MvThj06Zm9lEB3C3X04UIAv1t3WiMZKb9xs19/K/wDpLPU0WlZ
	 5b/PoV5A4O+gA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: mtu3: add mt6595
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260922-6595-mtu3-v2-1-71203a362b36@protonmail.com>
References: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
 <20260922-6595-mtu3-v2-1-71203a362b36@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:44:56 +0000
Message-Id: <20260922104456.EAF4F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: usb: mtu3: missing companion xhci compatible for mt6595
--

commit 69c32994e4cd3df8ae84107c2e4552ba6293f82d
Author: Roman Vivchar <rva333@protonmail.com>

dt-bindings: usb: mtu3: add mt6595

Add a compatible string for the MTU3 IP found on the MediaTek mt6595 SoC.

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
Does the addition of this compatible string trigger a validation failure
during dtbs_check for mt6595 boards utilizing host or OTG modes?

The mediatek,mtu3.yaml schema enforces that any xHCI child node must comply
with the companion schema:

Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml:
  "^usb@[0-9a-f]+$":
    type: object
    $ref: /schemas/usb/mediatek,mtk-xhci.yaml#

When a device tree for mt6595 configures the MTU3 controller in host or
dual-role mode, it requires a child xHCI node with the mediatek,mt6595-xhci
compatible string.

However, this companion schema is omitted from the patch and does not list
the new compatible string:

Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml:
  compatible:
    items:
      - enum:
          - mediatek,mt2701-xhci
          - mediatek,mt2712-xhci

Should mediatek,mtk-xhci.yaml be updated to include mediatek,mt6595-xhci to
support the mandatory xHCI child node?

>            - mediatek,mt8173-mtu3
>            - mediatek,mt8183-mtu3
>            - mediatek,mt8186-mtu3

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-6595-mtu3-=
v2-0-71203a362b36@protonmail.com?part=3D1
