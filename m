Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1C23ECBED
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 22:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787007455; cv=none; b=IV2Bn8eZLxOCx8LVLjr0mTfMaFpfmpUaDjmT5FKPCKMiElfA+xbdJbLAdnSURmEgs+KTHwYAQjJ0FkypTimPTK4/S2CuoVGR2UheyybHDM5lN9IW4SGm0e6Z0ZInN58TUvaiFbow+/rK15KZNEguwMtdP3sr5wakteYwFiauEvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787007455; c=relaxed/simple;
	bh=6KIgCE33aqsVZr1WoS1rPusJzf0C1eBl9GEG3GdM/+o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RqXA55NMaE2XO1dh6HHWJJpe61PNqoPTqTIJc1AUJ8/X/WT2gC3mgjOzlNJypPwqyDEZHTLs6gXvHlMJQ1AouaBYmftRg9+m9Xq5H1rgLEyJkK26Y7EMQsoOwzBPDIx44VWHO676XGKTp9aEhpdgoMlDN8ECXmMMMoARFqSUMzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBA+67EX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBA+67EX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68AB01F000E9;
	Mon, 17 Aug 2026 22:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787007453;
	bh=6KIgCE33aqsVZr1WoS1rPusJzf0C1eBl9GEG3GdM/+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VBA+67EXLlR7q9mKfjaANHtnCIGeEybc5fBnCs9HWWBKW4DrDYbfF/IySmTmxm/yU
	 xGus3Va8rW2L6cKmM/kqxM1ph6OVUpN+etB481NPyWWu2lZhYXDwXXSbiROtvZbg1Z
	 52pVQoiYoqEQ+WOsFhGdXk5b08dKPIXe/HZDerk8BpCyZjwZq2NfnX/ChTocwQk/ZI
	 iVcQ0AmcptmfZc4lOKIRBZJZ50CmoVQbrsKvzWWTUofMDfiY92nkZ8CyXkGrz6vj1X
	 WD3v4hH6wP9sFRv28Sbwr1Itk+J5pjJJOvNr5nLdmVrknM1DuJigcvpVTsW+Mw2IsH
	 NwLvXrLLMAUYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: net: ti,davinci-emac: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260817-ti-davinci-emac-v1-1-022678d966e9@gmail.com>
References: <20260817-ti-davinci-emac-v1-1-022678d966e9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 22:57:32 +0000
Message-Id: <20260817225733.68AB01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch adds a new YAML schema for the DaVinci EMAC but fails to =
delete the original text binding file.
--

--- Patch [1]: [PATCH] dt-bindings: net: ti,davinci-emac: Convert to DT sch=
ema ---
commit cf3960563a2013243fe811ff3c6e1c07a1de9ddc
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: net: ti,davinci-emac: Convert to DT schema

Convert Texas Instruments DaVinci EMAC binding from text to DT schema.
Updates the binding to include previously undocumented properties, modifies
required properties, and marks hwmods as deprecated.

> diff --git a/Documentation/devicetree/bindings/net/ti,davinci-emac.yaml b=
/Documentation/devicetree/bindings/net/ti,davinci-emac.yaml
> new file mode 100644

[Severity: Low]
This isn't a bug, but did this commit miss deleting the original text
binding?

Looking at the tree, Documentation/devicetree/bindings/net/davinci_emac.txt
is still present. Conversions to DT schema typically remove the old .txt
file in the same patch to prevent having duplicate documentation.

> index 0000000000000..cb1394f6f2d40
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ti,davinci-emac.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-ti-davinci=
-emac-v1-1-022678d966e9@gmail.com?part=3D1
