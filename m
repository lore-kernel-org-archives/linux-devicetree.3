Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463183;
	b=Wyaz9o5TtpSNECndiXGpzW6D4JmcwYvm4PP27tS7w9fbiXjNs/NOUEsufyolrmE+C27z
	 pulcZdrtj1U/fB1+gxzZNGeGdoQkFLHWroVWS3GJ6iDVpAarqRE+Ibd3U+P9dIQL5B2l8
	 7o+yptAvMFlsugSsJfumHqYeDhfgpFl8/rOcSm6t/9i6mXOxeu9MTwjluleLag6shY6LX
	 uGFtBnf1JlE5IV5+nc7fBw359UT7xLSsgaqGF0kOTNOCsLDav2V/2MFNfkLRtsLKmzBPg
	 Mv3+V8Rhqg1WdlkB4Za6bzv0zTM1wqXNZJrdyMYNwBNlj8guFtgrKVR4vsf/iHhLkPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463183;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KE41Jy27ffz827pHQMFOPzKZ8B9e/3qLveo/Z2KJPcU=;
	b=hF1glLemNe3nxnouaCu8g3iIqmbTdJ+54ObVjKfra+I6yQzuMNOR7m3JF3VZ32E6K0HW
	 Py5vgTjlCxoi04wQ+IcVGjREWQh/Czxl3YD+RfhRbnfEqt5smykyeSQErGjaUiV2hu6dS
	 n4OWMXSYRqOlvzqG9vw/oAH89124K/wbEC2MH72Z/p0gexznXELtCR0EyISc1ccNdLGDN
	 J6KGNRQB6VB+vxzrnxnN9g5W5Q5uJFRs2Vm+DLog5FWoAqkCyRGXu75mq1VWw6vdrv16A
	 Bp08LOCV9XDrrXgizCUIGCLO39/UM7K/NEc32wUvKwpoe6NUKfPzVKACz1sabeirUGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AvhsxErT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086AF606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AvhsxErT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B211F000CF;
	Mon, 23 Nov 2026 19:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795463182;
	bh=KE41Jy27ffz827pHQMFOPzKZ8B9e/3qLveo/Z2KJPcU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AvhsxErTE3cwKxdVFuZSnPngjpWN7dWNwsNGzx9Y7ZvMER2FkYRSTHy4aphsMAnUp
	 M30rnU2L2AHgYioi+sKcVXFci2RltrGjRULL8PiA6GXgzAfCYq/+sXJwO4ajhtJj3V
	 3O58Vb072H02/BM5FuvzfxIdfyt7q1jNl/T4db7/7+aRn5liTdEvJXoZuMGzZ9OD+X
	 aZtLcw8hT+UQJX7+MWdhmMPpv0NWrLp4YqQD9b4h8GdMknkCuDfM+b+o9qZMEt2Oi9
	 xsoxDhNYk2/7PXnUx7RGTqmt1sE9TnD6j7g1HvFRu+lmr86Ok4yZEua3jBhn3U5pxo
	 mTLPI+Qu7OEeQ==
Message-ID: <sashiko-outbox-229956@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/11] dt-bindings: soc: amlogic:
 meson-gx-hhi-sysctrl: Fix compatible matching in conditionals
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20261123-meson-drm-create-hdmitx-phy-v4-1-3fb94f5534ca@aliel.fr>
References: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr>
 <20261123-meson-drm-create-hdmitx-phy-v4-1-3fb94f5534ca@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 19:46:21 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: soc: amlogic: missing Fixes trailers for
  conditional matching fix
--

commit 0cda355d81fb14b7a8b1c5dafc9b6d3f2114d679
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

> dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Fix compatible matching =
in conditionals
>
> The conditional schemas select on "compatible" with a bare enum. On a
> list such as:
>
>   compatible =3D "amlogic,meson-gx-hhi-sysctrl", "syscon", "simple-mfd";
>
> an enum applied to the whole array only matches single-entry lists, so
> the if: blocks never match as intended and the per-variant constraints
> are not applied reliably.
>
> Wrap the enums in "contains" so that the conditions match on any entry
> of the compatible list.
>
> Doing so exposes the "phy" child node of "amlogic,meson-gx-hhi-sysctrl":
> it was forbidden (phy: false), but some DT legitimately describe an
> "amlogic,g12a-mipi-dphy-analog" PHY node under this system controller,
> which resulted in dtbs_check warnings such as:
>
>   system-controller@0 (amlogic,meson-gx-hhi-sysctrl): False schema does
>   not allow {'compatible': ['amlogic,g12a-mipi-dphy-analog'],
>   '#phy-cells': 0, ...}
>
> Allow the phy child node for amlogic,meson-gx-hhi-sysctrl by referencing
> the amlogic,g12a-mipi-dphy-analog binding instead of rejecting it.
>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

[Severity: Low]
Should this include Fixes: tags for the commits that introduced the bare
compatible enum conditionals and the phy: false restriction?

  Fixes: 4d023beb3998 ("dt-bindings: soc: amlogic: document System Control =
registers")
  Fixes: 960a4140ade8 ("dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: Doc=
ument the System Control registers found on early Meson SoC")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-meson-drm-=
create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr?part=3D1
