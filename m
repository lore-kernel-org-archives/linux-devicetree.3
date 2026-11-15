Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794782225;
	b=VkfkMpSSxRQDq3vf6z/7zcviaJkg4Yx4PRdfIbvrN79Rp7SVWW+aBWxuZuPBNUcmw83X
	 GszQyobc2V3R0LQItrKqibI6ldH36EZ3eIafSKElT69+eYzEhw8rEOmfPwUN1qIGtCzUE
	 xnslvWINtpDVc9AA+Kckb22GQC83prRLAEIbdRZiqNmjiE8kD912VWuH5kk1zcPOr/2HU
	 GdaG6YhRFARdK9l5FL6Bn7dXwUO9EdFvoXXGtyCHleWW1HQWg7XFfRFeqFuSWv53OubGS
	 RlT20JMhNFsc9bPe3zmD6CBFT6Ks0Fjr2iGj/CiwqMMBuYse6ta4yOHkRHjm40GMySg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782225;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nraGc+Ficn59rB9MoVoTUdKQoL+FeqzmnSrPInxQ2is=;
	b=x4Uaylut2IYQcp8rUWoiq+hy8vBZnPHSpyDZjpcB3bwcjTBojfEIjJQgD0NxXkxG9j+C
	 vBlnI5Fz/Y6neqXeD/tVdXakEf4+nx8HCuKw0iN5n2qRwn7xLTXHgjboJCJPCLQl4Xg+a
	 u70x61thgIQ5P5jBL7kWlnSoEmKu8uG+0KmyBMTeOSBRTsmhCzdkyfXu2yt5odZpAl9UB
	 t7NXUIJcgEK4yjSy/kUY2ECao8u2069KGia/fiuVvpju6Dl7it9mDbBSlTEeb0gnis5c7
	 xKKhkZZFMpFUuVYuD4/SCGObQ4ManCkrMW4mwK/auMJFHjzbCvpFp0eqJnfxlCllTvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GFB3IIXQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D82606A31F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 22:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GFB3IIXQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C627A1F000C4;
	Sun, 15 Nov 2026 22:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794782225;
	bh=nraGc+Ficn59rB9MoVoTUdKQoL+FeqzmnSrPInxQ2is=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GFB3IIXQ0O35hvi3prtGKBAovZIqxa2I15rVMYKxqDoJaI0C86ktsOuxRkXX6F+eh
	 teHKqModFrKGkGtpC7Qkj7S0mc7BJWg3GFUq3UZXL+zMxzS1RrbBEDgrKNieGOh2mR
	 nEaaJVf1w65J4C1HjtCIAGe1GIu6rl9HVKr+s19ZdwwktWDkNmPmgweO0iACfcUD27
	 cnhk9UIKr9Gzm2i5JweGrk6ql/zBUFg9k0SFkBF4uS2DmWuxNJYC0doQVJShAqiFFT
	 B5waIq3QEyvWgaoJztBbBCUkOFiciMvAVjnswxel0IPjcmrxADVTaR0+i47eb1RU9S
	 Dxq9O1PkZ15PA==
Message-ID: <sashiko-outbox-215882@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: amlogic: g12: Add ranges to periphs
 pinctrl node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261115-fix-amlogic-dt-warnings-v1-4-94cbd67a32ea@aliel.fr>
References: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
 <20261115-fix-amlogic-dt-warnings-v1-4-94cbd67a32ea@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 22:37:04 +0000
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
- [Low] arm64: dts: amlogic: commit subject and message mismatch with
  modified nodes
--

commit d018b851d0b76ba5915a6bfa884a1b1c4be5d03e
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

> arm64: dts: amlogic: g12: Add ranges to periphs pinctrl node
>
> Building the amlogic DTBs with W=3D1 reports the following warnings
> for the periphs pinctrl node:
>
>   meson-g12-common.dtsi:271.33-1554.7: Warning (unit_address_vs_reg):
>   /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no
>   reg or ranges property
>   meson-g12-common.dtsi:1768.27-2040.6: Warning (unit_address_vs_reg):
>   /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg
>   or ranges property
>   meson-g12-common.dtsi:271.33-1554.7: Warning (simple_bus_reg):
>   /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges
>   property
>   meson-g12-common.dtsi:1768.27-2040.6: Warning (simple_bus_reg):
>   /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
>   meson-g12-common.dtsi:2239.23-2279.6: Warning
>   (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000:
>   unnecessary #address-cells/#size-cells without "ranges", "dma-ranges"
>   or child "reg" or "ranges" property
>
> The pinctrl node has no reg property of its own, and its empty
> "ranges;" does not describe which address space is translated to the
> children
>
>   /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells
>   without "ranges", "dma-ranges" or child "reg" or "ranges" property
>
> The DSI controller node has no child nodes with a reg property,
> so #address-cells and #size-cells serve no purpose. Remove them.
>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

[Severity: Low]
This isn't a bug, but the commit subject and opening sentence only mention
the periphs_pinctrl node (pinctrl@40), whereas the patch also adds ranges to
ao_pinctrl (pinctrl@14) and removes #address-cells and #size-cells from the
unrelated mipi_dsi node (dsi@7000).

Should the mipi_dsi change be split into a separate commit (or reflected in
the subject alongside ao_pinctrl), and the duplicated dsi@7000 warning text
after the unpunctuated sentence ("...translated to the children") be cleaned
up?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-fix-amlogi=
c-dt-warnings-v1-0-94cbd67a32ea@aliel.fr?part=3D4
