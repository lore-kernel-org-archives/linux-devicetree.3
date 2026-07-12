Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9588539D6FA
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 11:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783854178; cv=none; b=tBBCo7xNN8yXhHnBDE0LnGxl0UXPweR9pYyIi8/DfBTzcOne06yFmJ4Xhlp3MX9seH3DRnFB4Mff6ykS8T+ixwNBKC2E+5pW4LXEaZQyueMeBpUwJI16i53FSlRcxDxWrt7ejoqyHKwxJoGq2dYVSFHC9NAvRo26ylUaPNsvanY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783854178; c=relaxed/simple;
	bh=OSuAs6gD3oRcPCMrDnelwd9c4IC5bxejD9EDQrYpTkY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W3QS7AauWbaG59ReWNSh9WjdiJ6a+C3S9L5zoBAiQGIiM6xq3Hi2eVs3wQkITuO0K+1Wj7hmjTj6qKVHrmV65M2N9Psd0aQkk/49WDgdYIWUfNURXGvwvdWLF3Udos/KNUFdIEIoUpHDu7aAZkGjPkc5OPdpelIS+JrYEWO980w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gv8Bat/9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gv8Bat/9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3111D1F000E9;
	Sun, 12 Jul 2026 11:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783854177;
	bh=xw+rBr3nc98R/OVhQIKv36Vqr7uiCMjls7ZIOn0VSDc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gv8Bat/9+/Rc7I0myFADyz54io+hEEReMhWRUmmXd0h0poeys+H44gJyhnEvh4w6K
	 GindDW+9UIFkLZLdLf0CbfcNabPmmnzkyNYUdBATdodGL+uFOjXIRFgP6OVCFDF8ZM
	 KG+2rfLgs4tDcSzrpunXjfvIivhZcGm2ouXVIkcOM7K2Sh43h9qZcuFbMpRY+f/dSp
	 iDenk280cZ7FDZOKhuET2Psqinnnc1btJLEKnMAJeQrA17rGTRVwglwhrGQMNJYdhp
	 NH4omuZPnak+w/qUW/1tPlSyRxX557WNc0aBw2YKMM9ctQ8pcs+R9wWsUlf2Hvk+A1
	 2VeF/nM/9a9yQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: net: microchip,lan78xx: convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Lukianchikov" <avermoal@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260711105537.11065-2-avermoal@gmail.com>
References: <20260711105537.11065-2-avermoal@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 11:02:56 +0000
Message-Id: <20260712110257.3111D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The converted DT schema incorrectly rejects a 0-length `microchi=
p,led-modes` property, breaking backward compatibility.
- [Medium] Silently dropping an active maintainer from the MAINTAINERS file=
 without explanation.
--

--- Patch [1]: [PATCH v3] dt-bindings: net: microchip,lan78xx: convert to D=
T schema ---
commit 2888aafe795bb2f999fce4b5a449417cdf27043b
Author: Mikhail Lukianchikov <avermoal@gmail.com>

dt-bindings: net: microchip,lan78xx: convert to DT schema

Convert the Microchip LAN78xx family (LAN7800, LAN7801, LAN7850) binding
documentation from plain text to DT schema. The conversion adds proper
validation for the 'microchip,led-modes' property inside the MDIO node.

Link: https://lore.kernel.org/netdev/20260709181724.24682-2-avermoal@gmail.=
com

> diff --git a/Documentation/devicetree/bindings/net/microchip,lan7800.yaml=
 b/Documentation/devicetree/bindings/net/microchip,lan7800.yaml
> new file mode 100644
> index 0000000000000..730999d11e8a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/microchip,lan7800.yaml
[ ... ]
> +        properties:
> +          microchip,led-modes:
> +            $ref: /schemas/types.yaml#/definitions/uint32-array
> +            minItems: 1

[Severity: Medium]
Does setting minItems to 1 here improperly reject a 0-length property?

The original text binding specified this as a 0..4 element vector. If a dev=
ice
tree uses an empty property to explicitly disable all LEDs, it will now fail
schema validation.

> +            maxItems: 4
> +            description:
> +              Array of LED mode values for each of up to 4 LEDs.
[ ... ]
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f37a81950e250..157a677a284fc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27928,10 +27928,9 @@ F:	drivers/usb/isp1760/*
>  USB LAN78XX ETHERNET DRIVER
>  M:	Thangaraj Samynathan <Thangaraj.S@microchip.com>
>  M:	Rengarajan Sundararajan <Rengarajan.S@microchip.com>
> -M:	UNGLinuxDriver@microchip.com

[Severity: Medium]
This isn't a bug, but was the UNGLinuxDriver@microchip.com maintainer email
intentionally removed?

The commit message doesn't mention dropping this group email, which will no
longer be automatically CC'd on patches to the LAN78XX driver.

>  L:	netdev@vger.kernel.org
>  S:	Maintained

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711105537.1106=
5-2-avermoal@gmail.com?part=3D1
