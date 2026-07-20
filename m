Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFC83DB647
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556108; cv=none; b=CmxHhWitLw32YgRkjmiCU14Mug+Y0jAqvlKAQ8+lpTO+GQlWB5z9a7d2OOk2mt6arA7HBBvRROHSDgdT4/N6v7F8wwSIYSGdPPIIXPbfZaf21CzUOYcPEHU86krt5lEhWKesBaaePSV4oIiKaFULFDbeLwS+Wwm2ptXCUQhBiEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556108; c=relaxed/simple;
	bh=pX849TJYD7ZRSoarFYbcV9Etb+D5kCYSd17Z+g2eGa4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=npY5aF7I7h2t4iIcYR6uhI3fHy4WbhP6ll7UKFnEfgatJkztOSDqIccXQfRHPGXMx6dJuiJMf5h51OO3kUf6lfz5VNnyrRRiojZMyPES1vUKZyBD+Z3tNvfZlyG+7SQJk8H1Rj45ZcCJKAZi+LtJeRiCgy6NiBdbvEqAXCBF/U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CE2JuyrG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CE2JuyrG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363571F000E9;
	Mon, 20 Jul 2026 14:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784556107;
	bh=NqzZ4A0iNV8jqhCPQAvgGK5PdbKuBDQhhICaZPd51fg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CE2JuyrGT2/8aFw9ma3Pph3IjiLBZfdr9EGf3t6nR1qQTGZX3OHXNMHtJQe9SXVOv
	 M3ckDyGnvdX5PDtr/Dc945AlgHLKkDk/3NoNX9h4al80elkJKDuaee5AHxpOFG+98x
	 8n89mCHVTIYWWghvKCzUEsfAz+ezXTvk0enRNkV0C572QJLVH0hc4fFp62Ielk8F8I
	 AqkySKhpiOsaBqNmnxXaaXOGTmyDNrhBEya07T6pWTP7lhnL2GAsEbwi5TgP3pdq98
	 jfU4dQdOQup3iqMPph7TEu9py14ZXOO+BAg2w1ntjxCnqi1i4qRaZtqRcSyg+rAqi0
	 hy5tlgMUfXQOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: Document MT8196 MediaTek
 PCI-Express Gen4 S-PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720135344.84183-2-angelogioacchino.delregno@collabora.com>
References: <20260720135344.84183-1-angelogioacchino.delregno@collabora.com>
 <20260720135344.84183-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 14:01:46 +0000
Message-Id: <20260720140147.363571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Typo in the device tree binding description listing an invalid PCIe=
 link rate (6.0 GT/s instead of 8.0 GT/s).
--

--- Patch [1]: [PATCH v2 1/2] dt-bindings: phy: Document MT8196 MediaTek PC=
I-Express Gen4 S-PHY ---
commit 44ee552d23d168aeb37986df1a94ba1101ff1252
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

dt-bindings: phy: Document MT8196 MediaTek PCI-Express Gen4 S-PHY

This commit adds device tree bindings for the MT8196 MediaTek PCI-Express
Gen4 S-PHY. It documents the capabilities, register spaces, and required
properties for this PHY.

> diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-s=
phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.=
yaml
> new file mode 100644
> index 0000000000000..c24871f7e0e5a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
> @@ -0,0 +1,93 @@

[ ... ]

> +description:
> +  The MediaTek PCI-Express Gen4 S-PHY is capable of data serialization
> +  and de-serialization with 8, 10, 128 or 130 bits (16GT/s) encoding
> +  and decoding, has analog buffers, elastic buffers and mechanisms for
> +  receiver detection.
> +  This PHY supports link rates of 2.5, 5.0, 6.0 and 16.0 GT/s per-lane
                                              ^^^

[Severity: Low]
This isn't a bug, but is 6.0 GT/s a typo for 8.0 GT/s here?=20

Standard PCIe link rates are typically 2.5, 5.0, 8.0 (Gen3), and 16.0 GT/s,
while 6.0 GT/s is a rate usually associated with SATA rather than PCIe.

> +  in both Root Complex (RC) and End Point (EP) modes, depending on the
> +  chosen port.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720135344.8418=
3-1-angelogioacchino.delregno@collabora.com?part=3D1
