Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C051E273D9F
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 05:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780810986; cv=none; b=N7HjIjbekVi4BBsH8vzxcVq49Q6O6HLH5kGYgRUA/NwL+R2VWz5jGXKP99zDQbyRaNjrds4ksJLjNCiSp3puUpVx19aFtrCV3ndCFk2lq9juKu7sc2LEdcaZDpOgugxMAdyHTAmQ5qpMxCCIKAdZzK7gDSg8xIwVJ2nKz1MDOn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780810986; c=relaxed/simple;
	bh=wxgErc7k7vm/zWUslMMqkFxT6SZRf0ld97dzSO/GeT0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m/vJPgrh0wgt8kGzWGJ1skhPx8y+VoEiJ9PcHvpV5rPEvizxPvoC9zOdgDKKhoxZB3U70eySOMQZsZ53QYgkiecHM+LQHBKLY+jdANbI1vfPYKr5KqLZnXf6zyk8U0ROZEY+t2nebzDQoMajplTLfV9VZR1rYYz7G/MLf6mEmJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooycFDAf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooycFDAf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A8B1F00893;
	Sun,  7 Jun 2026 05:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780810985;
	bh=N6vs3tOzbGG1YVkqgoTs2QYraXr8qUuJVZH6l3uy90I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ooycFDAfa24FZDV7LgdmdSXiG82bFysChVWaKy2ug4ZBNI8Bb8ANWkzvhDMojD+b7
	 bht3WTsaHVnTs+xEW1FBaxtKK0647GLUVkCB3JstD5LCTFBOI0Gzp0VoWohMvnN8zE
	 kHBMeWt1+RcLZyVrGDNdtdohY84jm8Bgg46BISnwOb7OxJ+sqHz3ehJPZIPp8+vymV
	 L1noSgrNS16T8/6ymPHjJN/VBDZLbjNTdPB6sXjDX/hIUoo+28f8+FBHC91JGtOh/x
	 M8AxrmPXryZ1k7tLmpoBytdQqT1cs2ULH4Nvy3uChxRfkmzRx3iIEX3uC/kE/J0TrG
	 pDMQ9CGH1tu9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 15/16] dt-bindings: net: add onsemi's S2500
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260605-s2500-mac-phy-support-v4-15-de0fbc13c6d8@onsemi.com>
References: <20260605-s2500-mac-phy-support-v4-15-de0fbc13c6d8@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 05:43:04 +0000
Message-Id: <20260607054305.12A8B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The Device Tree binding and example encode a temporary software =
workaround for an interrupt trigger type instead of describing the actual h=
ardware specification.
--

commit 4625f72902becee75fd7fad94c017813fc2d4435
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

dt-bindings: net: add onsemi's S2500

This commit adds the YAML device tree binding for the onsemi S2500 IEEE
802.3cg Ethernet transceiver device. It specifies IRQ triggers based on
current framework limitations rather than the hardware specification.

> diff --git a/Documentation/devicetree/bindings/net/onnn,s2500.yaml b/Docu=
mentation/devicetree/bindings/net/onnn,s2500.yaml
> new file mode 100644
> index 0000000000000..11edf10508d9f
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
Device trees are meant to be OS-agnostic hardware descriptions. Since the
commit message notes the OPEN Alliance specification calls for a level-low
interrupt, does it make sense to encode a temporary OS software workaround
(IRQ_TYPE_EDGE_FALLING) into the stable binding example?

Could the binding and example accurately reflect the hardware using
IRQ_TYPE_LEVEL_LOW, and the temporary workaround be confined to the driver
or framework code instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-s2500-mac-=
phy-support-v4-0-de0fbc13c6d8@onsemi.com?part=3D15
