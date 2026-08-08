Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E0C3A7848
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 08:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786176843; cv=none; b=M3D6+mKGt3GdOBX25vPXdftpEGskrOqByTiQAN0iojx0dhAWddn2GchNh0PxujYEVU94m2IN/OS2ZIAT/UZOGeNqvpZMCWnO431sJCKRB8gCPdFILUu02/yZ0A+5QWJcCFtUdCIPe6WBvbvbBnIxy5QoTP6/ZBpkJSOpehZxDKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786176843; c=relaxed/simple;
	bh=HGut404TuuTH6DYUJysmFnN8nbnUFXRoP6Efx4nIGXA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EEyKmMIaMP5jPODM5awIB356Cb+dqNlh17nIGtr4HvTqVuBAeIA6W5lWlD9HLXSOs4eFDs14cBWR2OYaf/yPI8EGrLCX6uy9g9q7Aa81oXSKDwcoMtuIsSgp2bO4VW4Bocs712i2rKDMiCW6EXIfP2D8TL7rGzmUSqOw3PQa8hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VvUKKb/p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VvUKKb/p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0841F000E9;
	Sat,  8 Aug 2026 08:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786176841;
	bh=jxl10uy4NJVNxI9UzhYrVJzWT2OXGFU8sa1A+23EP0w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VvUKKb/poMllu3PiXNbmMYvZW4TW/lyoXj7C8s5V3R9kPvDzdw9QiHDPsWNgxzhj5
	 092/H3eUNBrjG4CCS1Fc/KLZtzG6VmNDRkzc4RK5kN6SkW5mLl0vywHHAd/bKqCb2o
	 mP+mK4T2GqVPqzZPnWcuyVH1BO/GyLG7DXvT8qE0jUzJHO+QX9UScrreA3ukxmq1mW
	 MQ/wwS+6/AsrJzGZmtMvi4gFPTt1IMkeDCBX2o7Yrj7nZOnPXg55mZEI86WpQB2Rdx
	 ToBCU6sySZ+dtVOyMgKM6Eiv/bgUUQQEBGPs/J9CtulY+2FEsJM8ntS/15qWc6DJ9+
	 M4nQneuE7hAng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/2] dt-bindings: bridge: Add Lontium
 LT9611C(EX/UXD) MIPI DSI to HDMI driver
Reply-To: sashiko-reviews@lists.linux.dev
To: mohit.dsor@oss.qualcomm.com
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260808-lt9611c-v7-v10-1-ee90a136d82a@oss.qualcomm.com>
References: <20260808-lt9611c-v7-v10-0-ee90a136d82a@oss.qualcomm.com>
 <20260808-lt9611c-v7-v10-1-ee90a136d82a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 08:14:00 +0000
Message-Id: <20260808081401.3C0841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The binding title inaccurately describes all variants as '2 Port', =
despite the newly added LT9611C being a 1-port device.
- [Low] The commit message contains a typo that changes the meaning and mak=
es the sentence difficult to understand: 'Receiver signal/dual port' instea=
d of 'receives single/dual port'.
--

--- Patch [1]: [PATCH v10 1/2] dt-bindings: bridge: Add Lontium LT9611C(EX/=
UXD) MIPI DSI to HDMI driver ---
commit 289235c0c9457d9357c713f43f18d3182cc0f7d7
Author: Sunyun Yang <syyang@lontium.com>

dt-bindings: bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver

This commit updates the Lontium LT9611 bridge bindings to add support for
the LT9611C, LT9611EX, and LT9611UXD variants. It adds the new compatible
strings and enforces a single-port configuration specifically for the LT961=
1C.

> LT9611C(EX/UXD) is an I2C-controlled chip that Receiver signal/dual port
> mipi dsi and output hdmi, differences in hardware features:

[Severity: Low]
This isn't a bug, but there appear to be a few typos in this description.
Would it be clearer to rephrase "Receiver signal/dual port" to "receives
single/dual port"?

> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9=
611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.=
yaml
> index 429a06057ae85..194aeaac601f3 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> @@ -4,19 +4,23 @@
>  $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
> +title: Lontium LT9611(UXC/C/EX/UXD) 2 Port MIPI DSI to HDMI Bridge

[Severity: Low]
This isn't a bug, but does the "2 Port" descriptor still apply to all the
variants listed here?=20

Since the LT9611C is described in the commit message as a 1-port device and
its second port is correctly disabled later in this schema, retaining "2 Po=
rt"
in the overall title might cause some confusion.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808-lt9611c-v7=
-v10-0-ee90a136d82a@oss.qualcomm.com?part=3D1
