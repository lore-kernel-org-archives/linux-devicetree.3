Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0373E3E5581
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 20:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778273408; cv=none; b=p8+aysBpe7abZhbAw5/SEsaOJ1CzX9zvqznpYrj7qrgoNGYqNnvbcRvff/UrFOtjl3+Qw/Y5WDPlilUhGR6pMkDkzuSdvSYgFM/xxNI9GnEl6U6kZ2E/tj+weVHgN7EiUA8dU5yqBOxB10HD6VXovINRNA5zEzMBpa7XUzEulkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778273408; c=relaxed/simple;
	bh=Ad6wzIkS3AV4AfAFGmBEdth5z6+E/Tja/xEq6zTP2YY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oU+imUUn+W12gDYfXeLWRZHIO1TrAHiWsL/lR9ElpIyfMSSCezsHy17MRP7xWu+Sfd4/2CIE1U45xW7niwOBfj3ChDcpo+/7yPNpyoPcsKDZA1hjxV9rZ94gsajDyIjLIJCyi8smumUHJkKcpi5/3T7pbhQEnu9Eo8qFNuCMKlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sNn2Z498; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sNn2Z498"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655C6C2BCB0;
	Fri,  8 May 2026 20:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778273407;
	bh=Ad6wzIkS3AV4AfAFGmBEdth5z6+E/Tja/xEq6zTP2YY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=sNn2Z498FwrBqQxzMzHGSr27J1H4e86ZzDx/qmtTMFeyO1iFoSxmfdW7eLbzlesdZ
	 kYUF7qFRTeyehU0cXpYWxeVJxT7lzhdtPumkN0Ltz4Y4TgfnVmzAymxUsXn9uZ4FFl
	 n+qxTnZoSilawelFT3eIxn70PWEnUG3benVATh+qmYtMPCOIh/OzHxmStIDbPSPu7a
	 0Atm3jq0Wdx3zOE6veFy2mvVkMla+M0tcw9YA/rdTxOoF1w5unpcACXZBlNAVQdz5N
	 GuXIG5m0nFUCS+AX69PIkd2nAA89HknEF0nt9sRyhHzDOchF1cn4uZdAC9q2InRAyN
	 GyUMb8vm4tfXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: bridge: Add Lontium LT7911EXC eDP
 to MIPI DSI bridge
Reply-To: sashiko@lists.linux.dev
To: syyang@lontium.com
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260508134702.4713-2-syyang@lontium.com>
References: <20260508134702.4713-2-syyang@lontium.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 20:50:06 +0000
Message-Id: <20260508205007.655C6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The binding lacks support for the dual-port MIPI DSI output clai=
med in the commit message.
- [Low] Typographical errors in the commit message alter the meaning and re=
duce clarity.
--

commit d7e3500f4741bb0ae26a44a80c52b86455bf1c05
Author: Sunyun Yang <syyang@lontium.com>

dt-bindings: bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge

This commit adds the device tree binding schema for the Lontium LT7911EXC.
This device is an I2C-controlled bridge that converts eDP 1.4 input to MIPI
DSI output.

> The LT7911EXC is an I2C-controlled bridge that Receiver eDP1.4
> and output signal/dual port mipi dsi.

This isn't a bug, but there appear to be a few typos in the commit message
description. The word Receiver reads like it should be receives, and the
word signal looks like a typo for single.

> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt7=
911exc.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt79=
11exc.yaml
> new file mode 100644
> index 0000000000000..3290b10ce8835
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.=
yaml

[ ... ]

>   ports:
>     $ref: /schemas/graph.yaml#/properties/ports
>=20
>     properties:
>       port@0:
>         $ref: /schemas/graph.yaml#/properties/port
>         description: Video port for eDP input.
>=20
>       port@1:
>         $ref: /schemas/graph.yaml#/properties/port
>         description: Video port for MIPI DSI output.

Since the commit message indicates the hardware supports dual port MIPI DSI
output, should the schema define a secondary DSI interface here?

Without a second endpoint or an additional port defined, it seems device
tree authors would be unable to properly model a dual-port display panel
connection.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508134702.4713=
-1-syyang@lontium.com?part=3D1
