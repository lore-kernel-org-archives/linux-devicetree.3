Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5571F2F7F09
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218279; cv=none; b=k4TgiBnRyarJIw2fynIlAtGdJ3cMvFOjzNnht8aN4GDzD75dHlrDWyK7yOnilzXd3bY2WSABjd0xIa/jpGutua5+7vsNHio31Mw8Pz6T4c13Vd/7NprZ3VOnqhUbFRFu1yeV/ePPyXI2T7e/Xo73XxbCyxSa8A7TGHjHAptUtew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218279; c=relaxed/simple;
	bh=1r08niBZ2Tqbp4ie86Vx+pagqlRjWCXSllU/SUBilGg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KK7HoHXNI5zKaaRcM2Cx//IVo/HcM70iynl3vsvSHzFU3N6xOvr2GXcX3S/5T6FJtHpQebJPfiNV58BCP9mBdhP2Rt3qz9bHvR04dFOb9N3tH5lAv8XAR37ZqFnfGLikLiK5i13phks1YFobKTczwAQ3FHDSz9qgKy0N5fgFQqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QrhZvDLu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QrhZvDLu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4297D1F000E9;
	Thu, 20 Aug 2026 09:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787218277;
	bh=8duQ0A8gf/wSEPrGUyZa0f82QBJcDB+3nmIMldx725E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QrhZvDLuNrNdSc/9YAKUxoNDJ/tYN9ro/KYVJz9IMysmtNjRF8pq8FLfRmQLwoeOZ
	 D83ndedOzoTe227mH3AnDEmN/p+tT1Br5lKRuzGlSIbQ3j2G+n3WNVkWXkMvBiPAs2
	 mnkLOWoGq9ntWBn2g/fVB/Uop2nj9D9ELlE+OLw/lE9OjWs0yaOak7bS+MkOTqpVZV
	 koGKxUigUuJPB79recX7PB2SJmJ60M67wMVCyl8+/EzrBBNwdTadlB0hlGYBztuYUp
	 MZCKShsR6OCc0ES+uLFf3gTuiXO6VEG2U+x4yoKREPQduaYQSmRPOLJdu48wSnU77Y
	 pNQEObu4sXj7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] dt-bindings: beagle: Add BeagleConnect Freedom
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, ojeda@kernel.org
In-Reply-To: <20260820-gb-uart-transport-v1-7-282da14ab7b7@beagleboard.org>
References: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
 <20260820-gb-uart-transport-v1-7-282da14ab7b7@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 09:31:16 +0000
Message-Id: <20260820093117.4297D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The binding enforces `additionalProperties: false` but fails to def=
ine `reg` and other standard bus properties, preventing its use on SPI, I2C=
, and USB buses.
--

--- Patch [7]: [PATCH 7/7] dt-bindings: beagle: Add BeagleConnect Freedom -=
--
commit d458668c4d5561c44786c09e0ae03714baa79492
Author: Ayush Singh <ayush@beagleboard.org>

dt-bindings: beagle: Add BeagleConnect Freedom

This commit adds devicetree bindings for the BeagleBoard.org BeagleConnect
Freedom board. The board exposes an MCU that can be attached to a host over
USB, UART, SPI or I2C, and is described as a child node of the corresponding
bus.

> diff --git a/Documentation/devicetree/bindings/beagle/beagle,beagleconnec=
t-freedom.yaml b/Documentation/devicetree/bindings/beagle/beagle,beagleconn=
ect-freedom.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freed=
om.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: beagle,beagleconnect-freedom
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false

[Severity: Low]
Will this reject standard bus properties like "reg" during schema validatio=
n?

Since the commit message mentions this node can be attached to SPI, I2C, or
USB buses, it will likely need standard bus properties. With
additionalProperties set to false and "reg" not defined in the properties
list, does this mean defining the node as a child on those buses will fail
dtbs_check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-gb-uart-tr=
ansport-v1-0-282da14ab7b7@beagleboard.org?part=3D7
