Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792972971;
	b=GCSqTuOthT+6xxcLioB5nuS3lwnF6hgR4awL2Nx0VPXBy7XhlQHXJuWmCzuFlz5qm83C
	 H4aWQY5EO433YoZlOWXJAkUQDZb8k4CCza+D2XKu7VuJsfvEbRZUZ2Em7Xse9YY0Aqkrd
	 ysIJqMCoxu09gG13hmIhpqXXvJYhjLR1CHM6ZUHPCn1bwMXqhMp4xZFyJiSpT1iHIs8N/
	 Swxj7Hx7qKAAbACmbFumXB5zd+oIR57evcFSBMSjHVnJ2vncXIiZ8YFLp748XW9aCLWH1
	 nEwoABW9RaaKeGWG3zCbGTRSlp610F6jvfYUA+tre9ZxK93SNX4q843T1plMfIZ3W9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792972971;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Z+28+ZjUF/oTgy7GObUAo0loSd/iuprnCT52E30OBg8=;
	b=ATWkFPHikkDGyqK4KAwL53rJsBSwl2srmodpcWq4bH13wB8L0qyTSuj8H8ic+N46jEst
	 9P45NOhah+bE5U6uuPqkQshZG95d7+4cgVDsrxlgOxHz/0LMcjgq7pe4LDtWy+P54w2SL
	 lf/mEIZv+1hnDgyDyy0hAV7iUc2eNGEddVPi6Rrn3fmMJIJByfnY6Pzl53IE3emy/UpVm
	 R+GHuEO9aDm38KfIMvQVpo3TTCNAH4OPWjLa/r0ncNVC8Qga0mDbknkBA+J3kNKzAeRDW
	 Y7ZXwATU6K3L/U/Mux4jRwtYblAncevrU2hbgPO0TDfi+R+00t23OzUEtZdSWEO8fXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j93zgCj3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC65606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j93zgCj3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A851F01825;
	Mon, 26 Oct 2026 00:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792972970;
	bh=Z+28+ZjUF/oTgy7GObUAo0loSd/iuprnCT52E30OBg8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j93zgCj30357Ju7TjICFSo6CWyrdVV8Cr5Gci9i8NZLybgpGIjAYwFb8LDiIACwAt
	 j9TD/Wwl5El4sxWwIiTDVq2ZcGJhhcQaSyAHzHT6thO/f9y0FWKinPMefz7iBrFeFr
	 jWmBTksCZpzBw4PVxvzBfmGp4ptpjlxHvI6VPBmFzSFwOjI3UXAfKtRdVafQfblERs
	 4wdl191Amx3gg4YC7TP985nGoxTOg+SAwjvH0v5ImN7U9BkB1itZBK2IxPsgxvVpDs
	 MSNvtH3aw7G9aIxghthGqQ/roMnFc7kHs6oVm40OtRmdxHJefrAk70P2vd3arH7KwE
	 8tnjP5sM5Si/Q==
Message-ID: <sashiko-outbox-184542@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: platform: introduce EC for Dell XPS
 13 9345
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksandrs Vinarskis" <alex@vinarskis.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026-dell-xps-9345-ec-v7-1-828ce301b839@vinarskis.com>
References: <20261026-dell-xps-9345-ec-v7-0-828ce301b839@vinarskis.com>
 <20261026-dell-xps-9345-ec-v7-1-828ce301b839@vinarskis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 00:02:49 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: syntax error in dell,xps13-9345-ec.yaml example io-cha=
nnels
--

commit 6b26d06321d0162521ee363bfa4a27b82eb6cc2e
Author: Aleksandrs Vinarskis <alex@vinarskis.com>

dt-bindings: platform: introduce EC for Dell XPS 13 9345

This commit adds Device Tree bindings for the Embedded Controller (EC) in
the Dell XPS 13 9345 (platform codename tributo).

> diff --git a/Documentation/devicetree/bindings/embedded-controller/dell,x=
ps13-9345-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/d=
ell,xps13-9345-ec.yaml
> new file mode 100644
> index 0000000000000..29cbb837a31b8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-93=
45-ec.yaml
> @@ -0,0 +1,90 @@

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        embedded-controller@3b {
> +            compatible =3D "dell,xps13-9345-ec";
> +            reg =3D <0x3b>;
> +            interrupts-extended =3D <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
> +
> +            io-channels =3D <&pmk8550_vadc 0x14a>,
> +                          <&pmk8550_vadc 0x14b>,
> +                          <&pmk8550_vadc 0x144>,
> +                          <&pmk8550_vadc 0x145>,
> +                          <&pmk8550_vadc 0x146>,
> +                          <&pmk8550_vadc 0x147>,
> +                          <&pmk8550_vadc 0x148>,
> +            io-channel-names =3D "sys_therm1",

[Severity: Low]
In the examples section of
Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.ya=
ml,
the last entry of io-channels in embedded-controller@3b ends with a comma
instead of a semicolon before io-channel-names.

Should <&pmk8550_vadc 0x148>, end with a semicolon instead so that
dt_binding_check does not fail with a dtc syntax error when compiling the
example?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-dell-xps-9=
345-ec-v7-0-828ce301b839@vinarskis.com?part=3D1
