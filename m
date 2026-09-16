Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4326644780D
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546218; cv=none; b=podMSlWydYbWLuWmlnmlxawJvKM2Ys//R02rCgD51LZSzQEiclflIc4hHxi5wdpejjA4nePPtWFRwWmFZdcDp4wnxxi52QdE7UCgQNG4LJcjug430f0ieEb5XBtpKAAsfZ0XKh1V5DH0ULjHjVi4g9TaB4S5KIfwaMOGOFFgJ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546218; c=relaxed/simple;
	bh=DsDJ7x0UoAtGrjAMvNfgZlPZ2A70UJOWX8wLAKt8/9k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VsO6CFlM3Qt2kWu1EpXgePcgt5HQoaTrGjzeUw8/2o08eR+w5Tb3OWdpUqA+gnMAc76vZ2FSBpXvwHh3VXG4pudzOUZUMbLMgvrATOO/OIX7wjH7V9+DvCYawL/x3M+Y6AV8RVsP0/mwZ9e8OugdmYuq8T3WVYnf3isSeYDLwrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XicFy3Zi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XicFy3Zi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2CFA1F000FF;
	Wed, 16 Sep 2026 08:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789546203;
	bh=8901aF9xyumI4lRUhviu/ge2Iu/+N5ZENhdmSL78qNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XicFy3ZiyO75GZbXax0AaHXdTVn68PhSplAV64gtyeHbzLGr0VvfIcy2TEUCDzSzX
	 wuf4M2zWtFNUAiWgAz0+IiO7D09kM7eFcCOU1NZ4JEPXvStHn/TyqnV4Sj3sTGZ/eG
	 izC0quWTTvLB6Zp9uv/WqeJG0eArQ4fy2gf9Au0lb+dN/8k+V9JNeeQ95UeCoBSyln
	 nf6qp/YAhSiiCwr8dxe/GiQ61tKC966m9xJT5dj9GyLJ87Cm91Ty7sC5s7yV0fD8jB
	 TKBtFDCK4672STf6FZXGHqf9Ty5sSn2qqfyWl/PHgMVfL9X3je/wTfm9ao2sa212wC
	 wFb5MDaNB9RkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 10/15] dt-bindings: usb: mediatek,mtk-xhci: Switch to
 ports for USB connections
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916075745.3549953-11-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
 <20260916075745.3549953-11-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 08:10:02 +0000
Message-Id: <20260916081002.C2CFA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: validation failure due to removed 'port' node
--

commit 40ec61fbce26b9243d28fee1a4cb89c268bd0a10
Author: Chen-Yu Tsai <wenst@chromium.org>

dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections

This commit replaces the single port node with a ports sub-node for
describing USB connections in the MediaTek XHCI binding. It maps port 1 to
Super Speed and port 2 to High Speed, matching the hardware capabilities.

> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml=
 b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index 231e6f35a986f..d6c75bd20b785 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -107,10 +107,6 @@ properties:
>        - description: USB3/SS(P) PHY
>        - description: USB2/HS PHY
> =20
> -  port:
> -    $ref: /schemas/graph.yaml#/properties/port
> -    description: Super Speed (SS) Output endpoint to a Type-C connector
> -

[Severity: Medium]
Will this cause dtbs_check to fail for existing in-tree users?

The mediatek,mtk-xhci binding removes the port property, but there are
still existing in-tree device trees that use it. For example, in
arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi under &xhci1:

	port {
		xhci_ss_ep: endpoint {
			remote-endpoint =3D <&typec_con_ss>;
		};
	};

Because the schema enforces additionalProperties: false, the presence of
the now-undocumented port node in the DTS causes a validation error when
running make dtbs_check on ARM64 MediaTek platforms.

Should the port property be kept as deprecated, or should the in-tree
users be updated at the same time?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916075745.3549=
953-1-wenst@chromium.org?part=3D10
