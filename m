Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CB742BC52
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893058; cv=none; b=rDLv70LUUQI1CvUbuak2B48F2g05cpEL/iSdK0WpYdzz/xDamJ/V1vCjNaj9DbhvcKWzTp3dVRMXDm+4Whg4hsL1qFVD5Merq277G4/aVk38xGwWRf3BMQWzkdzfgCJs6SHJuULMvez+/hPuW8/EKl2otL/irI0ov+92/d9pUZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893058; c=relaxed/simple;
	bh=cAc9HsR6aB+vrJYxabunDUznFCAnG4Ga+7btaX7Y3U4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lTOHTlIV8EkxUnsEojHp0AZEbcANtbD6cb3jJEtPePENPMyaBIBDb7vh7/RdIWlbYFdrR//aNFBRpcrhNus4iM1C3GbG/GrTjmv7SjZJaqsZbbd+RG6necTcFR5LX9CI5pX9u6tSMIyt4ukzY8nRdVbmkNuj4Yl+W6zDP3sNYMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCkBFT/2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCkBFT/2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5021F00A3D;
	Fri, 24 Jul 2026 11:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784893057;
	bh=cYlJcabLX9rxZ0bEgatkyduKnuir/bSuVHGl8aws7r8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UCkBFT/2IYc8VE5ulgxBLlKtSijnhVTZXjmIoFzWEapkZzwF0JSbLsbWiOywDQWJz
	 KUK2xBIyKVpL0St+4f8X+cYjNkEmHNwmnBAWqggA6DkuPhG/sBNxkgMJi89GL+NI3q
	 62rl3VWOp94of/DmtoIZrF17LAfId73GOwH83yTAvyBB2p0ftRgNREJWioyLjLpcgp
	 uOcH9mZwINIWCTPdVs3PN8KEPzi9vWQBFwEvljLttoaiFrdgG2kWg+pLV64mxu3e85
	 HZiXjOH/90opdqT5MEkNiNXHwsgyDsD0SEbjqSUGHInLLRk++8OQ9GiTECVarw9n+/
	 y1/2hp+njBrFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: nvmem: mediatek: efuse: add mt6572
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260724-6572-nvmem-v2-1-e58d16a29621@protonmail.com>
References: <20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com>
 <20260724-6572-nvmem-v2-1-e58d16a29621@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 11:37:36 +0000
Message-Id: <20260724113736.BE5021F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The new `mediatek,mt6572-efuse` compatible string is defined as =
a standalone enum without a generic fallback, yet the driver lacks support =
for it.
--

--- Patch [1]: [PATCH v2 1/3] dt-bindings: nvmem: mediatek: efuse: add mt65=
72 ---
commit 16da21605192748d95ca1fe2779220ec48ccf918
Author: Roman Vivchar <rva333@protonmail.com>

dt-bindings: nvmem: mediatek: efuse: add mt6572

This commit adds a compatible string for the MediaTek MT6572 SoC efuse
controller to the binding schema. It introduces a new enum block for both
the new mt6572 string and the existing mt8186 string.

> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml =
b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> index f9323b3ecfc83..e109471649412 100644
> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -24,13 +24,16 @@ properties:
> =20
>    compatible:
>      oneOf:
> +      - enum:
> +          - mediatek,mt6572-efuse

[Severity: Medium]
Will device trees using this new compatible string fail to probe?

The mediatek,mt6572-efuse string is defined here as a standalone enum
without a generic mediatek,efuse fallback. However, the mtk-efuse driver
in drivers/nvmem/mtk-efuse.c does not match mediatek,mt6572-efuse
specifically.

If a system integrator strictly follows this schema, the device node will
not probe. Conversely, if the device tree includes the mediatek,efuse
fallback so the driver can match and probe, it will fail dtbs_check
validation because this schema does not expect the fallback in an items
list.

Should mediatek,mt6572-efuse be defined alongside the generic
mediatek,efuse fallback instead of as a standalone enum?

> +          - mediatek,mt8186-efuse
> +
>        - items:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-6572-nvmem=
-v2-0-e58d16a29621@protonmail.com?part=3D1
