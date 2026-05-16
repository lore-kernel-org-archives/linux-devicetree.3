Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B038175A60
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 14:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778941708; cv=none; b=cJn1vxkZQRms+PAIg10RnJ1j73OjLLWMxVmFJXeaR7HTyA2pwhpF9CscQf5VKOSkTaUGSOZ99W8/hL1LQMpzIGXPF8hYteOEp1PQ0Qrisn0v5ahktmNkhx39u/18X0KYTlWIVX6so8tcWBKQkRlSWDPKHfyHCWFGBNa7cPiIlXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778941708; c=relaxed/simple;
	bh=ce+lvmO30gJ71ZgeZZ/5pIz18AnNb5xeMFJ0ll5nEeM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eelcgcx5yGWHFhjLv3DARBEHtYq3SmwGq2L7BLinXbUc5QkDovYE5Cwcx+fg5155+VdoAJ6SeZJvzOiNXZWQ9lKAe6Kju5b20Y2X4dhhcquN8DREFl2Q1pJurY7/RYUpncIDw2T7ICPm5dJhYchq0RkmpEjVqCwgk1R15Ms1qpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUZfGtti; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUZfGtti"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E794C19425;
	Sat, 16 May 2026 14:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778941707;
	bh=ce+lvmO30gJ71ZgeZZ/5pIz18AnNb5xeMFJ0ll5nEeM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pUZfGttiX/txC+/l2RwET4nRNYT144bBio0Szs6/5HaXCIB9zJyWWdwVZVDeTTaYt
	 qJaWEDv+uH7Vp6sP+DXMGoZ5ukPQdxiuAoMY7AOSYcB4/D01x+rwLVFsE0ZvYJLkih
	 UTfBKOsjaJ67WdEMFMPWVJb2AqAEGa4cW3kw+w1wnDGBoSiF3gneyudY8zk9kLVWUH
	 nRBZHb1TzqY3aKFOII4lnwokHqpi59X/Vyot/IRoLrV0mZogJ13xPQPuvAiaLbGscc
	 2DZ2slNC+ShpTxMuATCNt6syb0uM9OM0W9PHV9nIo1taxiCVCtgmJ9lBvwUT1JB+h5
	 CEfymzf9WkNWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add Sony IMX678
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jai Luthra" <jai.luthra@ideasonboard.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260516-imx678-v2-1-4854ac61d6fb@ideasonboard.com>
References: <20260516-imx678-v2-1-4854ac61d6fb@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 14:28:26 +0000
Message-Id: <20260516142827.4E794C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The binding defines `xclr-gpios` instead of the standard `reset-gpi=
os` property.
--

commit 509a0ec53ea479ccac82b92f2f55a9650f4691ac
Author: Jai Luthra <jai.luthra@ideasonboard.com>

dt-bindings: media: i2c: Add Sony IMX678

Sony IMX678 is an 8.4 Megapixel CMOS sensor that outputs pixels over MIPI
CSI-2 bus. This commit adds device tree bindings for it.

> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> new file mode 100644
> index 0000000000000..8f12853f40e62
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
[ ... ]
> +  dvdd-supply:
> +    description: Digital power supply (1.2V)
> +
> +  xclr-gpios:
> +    description: Sensor XCLR GPIO
> +    maxItems: 1

Should this use the standard reset-gpios property instead of the datasheet
pin name xclr-gpios?

Device tree bindings typically use reset-gpios to describe reset lines for
consistency across media sensors, rather than hardware-specific pin names.

[ ... ]
> +            avdd-supply =3D <&camera_avdd_3v3>;
> +            ovdd-supply =3D <&camera_ovdd_1v8>;
> +            dvdd-supply =3D <&camera_dvdd_1v2>;
> +
> +            xclr-gpios =3D <&gpio 0 GPIO_ACTIVE_HIGH>;

Similarly, does the example need to be updated to reflect reset-gpios if
the property name is changed above?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-imx678-v2-=
0-4854ac61d6fb@ideasonboard.com?part=3D1
