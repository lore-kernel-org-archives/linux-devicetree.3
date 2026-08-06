Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DB13CF678
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027119; cv=none; b=I7E15zmw5GH0Ek5stOvr9We+n+R01NhHU6IT+Cla5PucbYH4OUOFbN3enPs6aQtIDk33Ru5RLG2oU6gHUEQkl1J1WYE9WZcMHc6mwUGCuAbb0qViZm3JOSlt5mYfqymPOYjg+qyrZCQgAAGBPFAVKToNNHdRb+EY7ChZRJXJVtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027119; c=relaxed/simple;
	bh=ryowZGZC6de3xf0thrSsQTy2fUWjOZjHpiVuGr11+NY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I78lkHmbrbqUpqYhCxRqF4rF7osly2s0kIbIr3xEKvG+Dg1DYMhOfLH4QKucGflkJXD6eWSdiTZqyxqk72WziJ/P2VfA1GioQaBcEr7CENlKbR6fpa3nnlF4mEyuvexbG18X7VzEHvjSqNbTb5UT/DVjiNXviB2iYFQCKgPG8XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YK6dPdkO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YK6dPdkO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F095A1F00A3A;
	Thu,  6 Aug 2026 14:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786027117;
	bh=eL4PPqnUJjaYr1sW91h8XnyDx4G6gl7cLy4qdXomaQY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YK6dPdkOaYfsadriUcBBnVJDLDjRceTdds+pQ2eJBWRZAGlfwoALcLSDeYwk0y7gX
	 DDHIVmrqK+arIPbtLZQ+bkLyZ2AapVxOTYSfm9Xq/lMLQgGZUNk3qvXaBctsA/3PQg
	 QgsvyGtWHgECSDDvSSmL21QMqoCGA2AIZTIMDWKsxvwJleGqQy0p6DKdpBIJEHhguH
	 NrMwObRpcL+Z2a+I0ECLzoy4BflhjQoDE/ax4GKQgjZx71z6Hl4YkgMhImj3ExdTOu
	 hTFbanIDIH10jM4Ockvnjn0f/H3+yVEyblayTo1JonT0Pr63W/TIjOJNeCxfbHF420
	 B38X6SjLhNL5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 2/9] dt-bindings: net: lan9645x: add
 LAN9645X switch bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260805-dsa_lan9645x_switch_driver_base-v11-2-007ebc983a0a@microchip.com>
References: <20260805-dsa_lan9645x_switch_driver_base-v11-0-007ebc983a0a@microchip.com>
 <20260805-dsa_lan9645x_switch_driver_base-v11-2-007ebc983a0a@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 14:38:36 +0000
Message-Id: <20260806143836.F095A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The schema lacks an `mdio` node definition while setting `uneval=
uatedProperties: false` at the root, which inadvertently prevents instantia=
tion of the integrated PHYs referenced in the example.
- [Medium] Invalid constraint and usage of RGMII internal delay properties =
in combination with `phy-mode =3D "rgmii"`.
--

--- Patch [2]: [PATCH net-next v11 2/9] dt-bindings: net: lan9645x: add LAN=
9645X switch bindings ---
commit 36eb3256c1e8bdeb280de04a105905650e50438f
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

dt-bindings: net: lan9645x: add LAN9645X switch bindings

Add bindings for LAN9645X switch. We use a fallback compatible for the
smallest SKU microchip,lan96455s-switch.

> diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan96455=
s-switch.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan9645=
5s-switch.yaml
> new file mode 100644
> index 0000000000000..043fb48922b41
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switc=
h.yaml
> @@ -0,0 +1,111 @@
[ ... ]
> +        properties:
> +          rx-internal-delay-ps:
> +            const: 2000
> +
> +          tx-internal-delay-ps:
> +            const: 2000

[Severity: Medium]
Is it intended to restrict the rx-internal-delay-ps and tx-internal-delay-ps
properties to exactly 2000?

[ ... ]
> +required:
> +  - compatible
> +  - reg
> +  - ethernet-ports
> +
> +unevaluatedProperties: false

[Severity: Medium]
Since the switch has integrated PHYs, will users need to define them in an
mdio node to correctly resolve the phy-handle references?

If so, won't this unevaluatedProperties: false at the root level reject the
device tree, as the mdio node is not defined in the properties block or
inherited from dsa.yaml?

[ ... ]
> +            ethernet-port@7 {
> +                reg =3D <7>;
> +                phy-mode =3D "rgmii";
> +                ethernet =3D <&cpu_host_port>;
> +                rx-internal-delay-ps =3D <2000>;
> +                tx-internal-delay-ps =3D <2000>;

[Severity: Medium]
Can this combination of phy-mode =3D "rgmii" and a 2000ps internal delay be=
 used
here?

According to the ethernet controller bindings, phy-mode =3D "rgmii" implies
the delay is implemented on the PCB. Adding a 2000ps internal MAC delay on
top of this might result in a double delay.

If the hardware has fixed internal delays, should this use
phy-mode =3D "rgmii-id" instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-dsa_lan964=
5x_switch_driver_base-v11-0-007ebc983a0a@microchip.com?part=3D2
