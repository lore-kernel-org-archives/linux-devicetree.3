Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8607C29B78B
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102190; cv=none; b=JxOJVSMPuXck0kleA6wCcq6rzPjhrkSKRsrIDOk2iwoLpjIltLGkDTMzwd+uPdXBZSzHElzSd6gSaueD1RVNyLl+wFjeQnIjrPJVW3Gvw9fid7QzGnJQ0W8KrQB+MUoZRqhNUBeM9hC2k9vPqgfmqUIfVokYnQ4MGmP/g11WGvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102190; c=relaxed/simple;
	bh=erGcHFRfGfCfRW/oxrlsFwU+AsEK2B3Sm+iXWStpIK4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ukjrkS6KuTzuskUJOu6Vd0UCMsmb1OlLdUvMlJFYb0JM0TEMFPnhMFXm+efoSJyQJPG7W2mxeRNoZmMotl7xHmpJVJ+FamAqq0DmlqI6y1/gr3DIlvXY3ClY9OXicN4r3U9qV+Qvi/Qoyt4LutTaROF/vgvxnzSgxN9zBbwGqd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5SxNlvr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5SxNlvr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E531F00898;
	Sat, 30 May 2026 00:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102189;
	bh=6veM4/+T81xaEwo/WdCoZkG0g7LKMMXi8MXCm0abK10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U5SxNlvrahxlg2fOUIt8KTwy8W5QIheMLVnrFbm0kon2pwe7tAsVCXCpM9mHk9Ase
	 dX2ivkZL6UIfPiAATtlmvEKtqxQmx61BzGf9UNELzYH9uXZ0aPZTrRXuQkZrQ9fcHE
	 9EEXZZyN92g4Vl8w90TQ2nOUkq0fz9j+FsvBd9PWErh2LtnBvMGH/OiCudLYOgA9GO
	 mu0jCKWJN8ajTnoABP049Ox4xFhELdRJubfjKuiXuWIcpY/cFN7974s5Soq65yjgl3
	 llaAfWuaDJK+/QIhMy5gxwrP0hjb7qt+T/wfo0Kn2ACmIK3kJ/81WYyJC/eDNSkQmJ
	 +VUAzIxXTSeug==
From: sashiko-bot@kernel.org
Subject: Re: [net-next v5 2/4] dt-bindings: net: starfive,jh7110-dwmac: Add
 jhb100 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Minda Chen" <minda.chen@starfivetech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260527084108.121416-3-minda.chen@starfivetech.com>
References: <20260527084108.121416-3-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:49:48 +0000
Message-Id: <20260530004948.E8E531F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing conditional constraints for `clocks` and `clock-names` a=
llows invalid clock configurations to silently pass schema validation.
--

commit 20465cf4546f85d0e237ceacdadbcf9c0b47c74b
Author: Minda Chen <minda.chen@starfivetech.com>

dt-bindings: net: starfive,jh7110-dwmac: Add jhb100 support

This commit adds support for the jhb100 GMAC, introducing a new compatible
string and corresponding single reset and interrupt properties. It also add=
s a
new SGMII RX clock to the global clocks list to support the jhb100 hardware.

> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.=
yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> index 0d1962980f57f..fdcc61c65f87d 100644
> --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
[ ... ]
>    clocks:
> +    minItems: 5
>      items:
>        - description: GMAC main clock
>        - description: GMAC AHB clock
>        - description: PTP clock
>        - description: TX clock
>        - description: GTX clock
> +      - description: SGMII RX clock
> =20
>    clock-names:
> +    minItems: 5
>      items:
>        - const: stmmaceth
>        - const: pclk
>        - const: ptp_ref
>        - const: tx
>        - const: gtx
> +      - const: sgmii_rx

[Severity: Medium]
Since the global definition of clocks and clock-names now implicitly allows
6 items for the new sgmii_rx clock, do the conditionals for older generatio=
ns
need updates?

Without explicitly adding maxItems: 5 to the existing if-then blocks for
starfive,jh7110-dwmac and starfive,jh7100-dwmac, it appears device trees
for older hardware can now specify 6 clocks and silently pass validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527084108.1214=
16-1-minda.chen@starfivetech.com?part=3D2
