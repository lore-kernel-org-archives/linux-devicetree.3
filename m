Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37806233945
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785119640; cv=none; b=S88SJE8pIQUF9uHZyQZsGj0WsRUcRjoV9lZe/aLr20lRgoefKNukajHeECmglo/mbGGLVVWUbu8F+NcFeGwGV2aLWUQZ9YxvQGJJjsuWJvxIQDmYG1MKKu6owuH2pTMDbgRg6H7v57eGZ30FLKscMUC/OA7AJdfqoNTazN8BnHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785119640; c=relaxed/simple;
	bh=PWDVfJ0cj0lvRDimuo8brkW2f7eICdYkt5xDWTrLmGo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RhzOcJ+hl5NJC1i/RdI4TIAaG6xlplMtmgidnR9jhOAvweSLKWF50/59PHMJ+EcwH3J0cX7dudj1m0dj6LItZNRL84S5ZOMxM/xuk02P5eKBb5YNk3y5BAEXm/tb2HiZ9uhl8/ipUZ3MTVrLhYv6/it8kjgn9jgibirXXB4b+Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SwjnUWQr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwjnUWQr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B791F000E9;
	Mon, 27 Jul 2026 02:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785119638;
	bh=cPg3WxTouEvN+tAVDFpsrFV/xXbQ0VyOEiQYmGsCP+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SwjnUWQrQGorAwr25I13dKy+NIadwj017nw8fpsWuh6NwEG+tzOApw1v1qegCE2QB
	 RdQeLqnoBghnzYg1Wx1I5dHC6hUpyvdRCinBt2ZyFZKlKgkYZ22xXQG0YFrBSzqNgU
	 5zGhHHqXgJMNECLMWgH+ldt73cWllCZLVL8JPPQM2xFhDCJOeAZmy+w03Vlm6vg6VH
	 2MzyC5m1r0hYjkCBop5CuiFCbaSFwcMFWJXVzM9pBKMq/PGChMRZOYc7mmN6rWN7xz
	 I5BsNS0uKY3+mZAFNFVSMgbS8UqKT3c/5rbFofnwEvEPa5Z+EphO5f4D2W6vmpWjWF
	 GNtXA+vQuSMpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDMI
 bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hermes Wu" <Hermes.wu@ite.com.tw>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260727-upstream-it6625-it6626-v8-1-2c3b0f9524fc@ite.com.tw>
References: <20260727-upstream-it6625-it6626-v8-0-2c3b0f9524fc@ite.com.tw>
 <20260727-upstream-it6625-it6626-v8-1-2c3b0f9524fc@ite.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 02:33:58 +0000
Message-Id: <20260727023358.84B791F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree schema incorrectly allows `bus-type` to be confi=
gured as C-PHY (1) for `ite,it6625` devices, which only support D-PHY (4).
--

--- Patch [1]: [PATCH v8 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDM=
I bridge ---
commit fa0e1ae27e2934f8fdb2a29be488c42a9ccd6645
Author: Hermes Wu <Hermes.wu@ite.com.tw>

dt-bindings: media: add ITE IT6625/IT6626 HDMI bridge

Document the devicetree binding for the ITE IT6625/IT6626 HDMI to
MIPI CSI-2 bridge. The device exposes two graph ports and supports
split or clone mode.

> diff --git a/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml =
b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
> new file mode 100644
> index 0000000000000..756fe655f534f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ite,it6625.yaml
[ ... ]
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: CSI-2 output port MIPI0
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
[ ... ]
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ite,it6626
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              properties:
> +                endpoint:
> +                  required:
> +                    - bus-type

[Severity: Medium]
The patch notes mention dropping the allOf branch that forces bus-type to=20
const 4 for ite,it6625 because the value is implied by the compatible strin=
g.
Does removing this constraint prevent the schema from verifying the hardware
limitations?

Since the base endpoint property allows both C-PHY (1) and D-PHY (4) global=
ly,
if a devicetree author explicitly adds bus-type =3D <1> to an ite,it6625 no=
de,
wouldn't the schema silently pass validation even though the hardware only=
=20
supports D-PHY?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-upstream-i=
t6625-it6626-v8-0-2c3b0f9524fc@ite.com.tw?part=3D1
