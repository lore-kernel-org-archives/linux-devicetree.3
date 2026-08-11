Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5807534040A
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 19:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786477201; cv=none; b=L4ybuk3Jp1FhtHwYv2zC0n2tNSRt8g/E6uZW6SdBoJKPvaubSTPH/IWbQiEyDsHFi8sssdRlcl6Z2AHB+8FYEh4j6jVxE9jt6YJRau+OI5fisiHoT8txXGSwYfyaunyey1PZBkDyRUZ+BxVfPbCGIWjTwPOmTmg5tkI6zxvHGZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786477201; c=relaxed/simple;
	bh=pgiJ+JezIJ6lmnVFDyh//VMkbitFC/qewyFgLI3XIMg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EXe7fvCiyo+krrt+4P3cj81T3BGtepS49fYuy6fb6dV+Htgs2ihrdgcSljckj6UoRLu10HIss+rUc/17B4YC8txWJd4kZszAiJfLnSAZ/jwY9/NNMr0eAbcuuZ5TEKWYdR4Fot+a/ICMTwc6K0kV3jilZWtqeBjJ+gAwhMoaT6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBQrs/PP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBQrs/PP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1ED1F000E9;
	Tue, 11 Aug 2026 19:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786477199;
	bh=8B1rmRB6+K9tOu8wEoeQ3bBW3Zl2aAYYHE8kG3IsUEA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QBQrs/PP0bRnUxFOLnniOoKOFrRzpU1pOvalS8G6xpJMGaaX0bHINkmxxhk2CO17z
	 QX3euRnAemO4L+B3ven+QLqyK6sHAHDwkPjgkWNjoI3v4pp2zh7ZB/56P9VQLnHxtM
	 vqS2FdqKVzDYuUUp8tHiB/fWJZmATbtML5UWedTJ6ITS97FYx67ldsXO1NdYWm6xFc
	 ymoCIxn82ZJHkMQlyDugbrj+ZnkNFSJEJdvtLptMnF/VOyAwB7hwQbGVrL4H26eqXp
	 5is/kt49xpaxKu14QLJr1bN3fFs5+xd+HsmRjf/cKe9zCKEasDHNtg6nBSrv9y2l+j
	 wE7mGs4O5JMGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] dt-bindings: net: brcm,bcm4329-fmac: add nvmem-cells
 for MAC address
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260811192829.123410-1-rosenp@gmail.com>
References: <20260811192829.123410-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 19:39:58 +0000
Message-Id: <20260811193958.EF1ED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch claims to fix a dtbs_check failure in bcm4709-linksys-=
ea9200.dts by updating the brcm,bcm4329-fmac wireless binding. However, the=
 bcm4709-linksys-ea9200.dts device tree does not contain any brcm,bcm4329-f=
mac nodes. The actual nvmem-cells property triggering the validation error =
in that file is located in a DSA ethernet switch port node (port@4 of &srab=
). As a result, the patch completely fails to fix the cited validation erro=
r and its justification is misattributed.
--

--- Patch [1]: [PATCHv2] dt-bindings: net: brcm,bcm4329-fmac: add nvmem-cel=
ls for MAC address ---
commit 9d4080c22265cf928d39764eafdb9bcf9fa9f241
Author: Rosen Penev <rosenp@gmail.com>

dt-bindings: net: brcm,bcm4329-fmac: add nvmem-cells for MAC address

This commit adds constraints for nvmem-cells and nvmem-cell-names to the
brcm,bcm4329-fmac binding. It aims to resolve dtbs_check failures related
to unevaluated properties.

> The nvmem-cells and nvmem-cell-names properties are used to supply a
> MAC address to the brcmfmac wireless controller. Nodes such as
> bcm4709-linksys-ea9200.dts fail dtbs_check with:
>=20
>     Unevaluated properties are not allowed ('nvmem-cell-names',
>     'nvmem-cells' were unexpected)

[Severity: Medium]
The commit message claims this patch fixes a dtbs_check failure in
bcm4709-linksys-ea9200.dts, but is this accurate?

Looking at arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts, the
nvmem-cells property causing the error is located in a DSA ethernet switch
port node, not a wireless controller:

		port@4 {
			label =3D "wan";

			nvmem-cells =3D <&et2macaddr 1>;
			nvmem-cell-names =3D "mac-address";
		};

Since the bcm4709-linksys-ea9200.dts device tree does not contain any
brcm,bcm4329-fmac nodes, updating the brcm,bcm4329-fmac wireless binding
will not fix the cited dtbs_check error.=20

Should the commit message be updated to cite a different device tree, or
should this fix be applied to the DSA switch port binding instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811192829.1234=
10-1-rosenp@gmail.com?part=3D1
