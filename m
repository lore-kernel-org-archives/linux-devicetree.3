Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9DF41166D
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542896; cv=none; b=iXLeUOHzeBFrQi45pfczVVOANIF66VGietF+PJTaQu+6qiSa1XN6Hr2u3+4eBwq/M0pcpPlKPFTyF507iCKh/pErGG7C8RwXRIZisO4zxb9WycCkqpAjKH1W1+dvs0AdB127pEO5B9Dbk1VQtj5KILYxnGKIX5oYNOSRJq05JLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542896; c=relaxed/simple;
	bh=vibvfS7+kab8k1f2Bkoo77L171s+ipH6pP8MtioJgOM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fJOvQTEUUL8VcHd8vEB4XS1vQnbfdrvAl+lTEt99sqYfZmFkRWjs3//RtKYK72YztWsd1bgxp/1aY/y8ZITSSj0leL/Jhzy9hnkjc+LRg0SQKBBCjUnSsGcwcQWje727/PlqD+STaSf0+dShGIKKxksSy2ImzPnCNTu8qZtQDM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=En1baTbY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="En1baTbY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F53B1F00A3A;
	Mon, 15 Jun 2026 17:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781542895;
	bh=wO+O8S0JG7F+Y7S+umbKuN6ykeDA0/uAqh+k9ab1gD8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=En1baTbYnUZWpSEwtrDvsY6b0uSUI0Ji9cf7MnEzUatpO6erDcvxvkjdiUy0xxRRZ
	 BSIrmrULWdIhrgAEyj1hYmnnleWHyQISHJP/Vqnm4vPBdgoQZLHsMDMpK0lM/z4d+o
	 Jly7USB9klehfBm0XBOWJWJTPfM+QoKrziOr0SWjkzP1aYYueAHkebDgjd9WWg9BQE
	 8WspR6XHfddyNbmVyS0YeAk9fH9i9TXUMB9WesVRO47DuhIx9K2KVNMieKsX/6JkTY
	 7uF1xBefC/0IwusZDD15ZLDDaLFH2dp0Z/MGZYImOX/VglFaX0n25rM/wjKkIDRLMt
	 +tPbpv1Hn214Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 14/15] dt-bindings: net: add onsemi's S2500
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260614-s2500-mac-phy-support-v5-14-89874b72f725@onsemi.com>
References: <20260614-s2500-mac-phy-support-v5-14-89874b72f725@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 17:01:34 +0000
Message-Id: <20260615170135.5F53B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree binding example incorrectly configures a level-t=
riggered hardware interrupt as edge-triggered (IRQ_TYPE_EDGE_FALLING) inste=
ad of level-low (IRQ_TYPE_LEVEL_LOW) to document a software work-around rat=
her than the hardware specification.
--

commit ec7eac5028b65bdc87468f9d30d6acc2c8cd7494
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

dt-bindings: net: add onsemi's S2500

This commit adds a new device tree binding for the onsemi S2500 10BASE-T1S
MACPHY Ethernet Controller. It documents the required properties for the
SPI-connected device and provides an example configuration.

> diff --git a/Documentation/devicetree/bindings/net/onnn,s2500.yaml b/Docu=
mentation/devicetree/bindings/net/onnn,s2500.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/onnn,s2500.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    spi {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      ethernet@0 {
> +        compatible =3D "onnn,s2500";
> +        reg =3D <0>;
> +        pinctrl-names =3D "default";
> +        pinctrl-0 =3D <&eth0_pins>;
> +        interrupt-parent =3D <&gpio>;
> +        interrupts =3D <25 IRQ_TYPE_EDGE_FALLING>;

[Severity: Medium]
The commit message mentions the OPEN Alliance specification requires a
level-low interrupt, but the example configures an edge-triggered falling
interrupt to work around a Linux software framework bug.

Should the device tree binding example accurately describe the physical
hardware (IRQ_TYPE_LEVEL_LOW) rather than documenting an OS-specific
software workaround?

Treating a level-sensitive interrupt as edge-sensitive could lead to
missed interrupts and stall the MAC-PHY hardware state machine if the
interrupt line is held low due to multiple pending events. Is it possible
to reflect the correct hardware state in the binding, while handling
the temporary software workaround internally within the driver?

> +        spi-max-frequency =3D <15000000>;
> +      };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614-s2500-mac-=
phy-support-v5-0-89874b72f725@onsemi.com?part=3D14
