Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795673594;
	b=0HWom+INDhaFStQpoAvN0miO4HqdsrHxq7rN6NeNnmeTpE4xmw9eavaaqABQ6/ehu1ne
	 P/7ZRZtXLTO4O6f6zAWkVdRcwjN54nYDHHt4H5DzJomJnYZ+BKFmP0ajwGRNBs4wM1Hcz
	 jj/tCpyD1Zm3RCvOCxvjG4HZX0qNfRJDPTbrRsT6hNagpgK3N9vSDH8uGQ1IHg6a/c0Il
	 cRk63TFmhIEaTllrbXsC/J1b6hWV5TTttBW272Gl1Dz51P3vxC+8eKwKq3caqjbTejqPU
	 yzjo2oPwq0agyPlhIWLWV/MyMEaP43wE+Cz/lwemisgd4Hc6Z//Wl6XfbRxJfpJIY1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673594;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iLHgSF/n7XKvLP1gIjWglwvMShWzX1CPzOnA5uOo/UA=;
	b=Q6YBSs8mIZXF0oKKeShM1CVtnOv5LYv89pUSoh1YCunHoiyvFkw0UyQVh2Ot/0BommyP
	 B5TBdlZFXjHEEXAzaAOrYFSQQ9EeO2AuVc2lYq4ERo3NH8BTJQ5qdbALzXlRMUNAV3gR/
	 oyiWNOPA+P+l0FEtS3xVgF4gK20yzqxzKaUkZaU695+AnLHC6M3BJE4Q7hprVX5fKrCBw
	 QpFKBoUDevThxziDT6oyKsZ/sJpdElkTuMI9QtBLCN6oQ3Q1adWlqW2xlsErI+2sNzm5f
	 pkdQjxCa5r0eYevudLyYhGE73bzf25e5o678EHKsdVfn6GVsbKYowZL+Rqgobi96S5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=anBStro1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6809606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=anBStro1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF461F000C0;
	Thu, 26 Nov 2026 06:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795673594;
	bh=iLHgSF/n7XKvLP1gIjWglwvMShWzX1CPzOnA5uOo/UA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=anBStro1tUkQacVN4eXXDJrXHhMLJDCdp9hrpWVeFWdru3xESklNMONn8n+AfSvxA
	 7DV5sL6ichqEox+xstvNfFrFdhN9HDxcLGQJ1hIHhSM0IWmxg4BE9EmzSmHXz9Q8dd
	 cSU/E0Ijvc8/e2BC9fHVs80PRun3Mn3bpdhTCqAHU9ba22yABPmfeJ2+avNvzd3v56
	 pEmCuRlAtY3C+64d+8xREtsWcsRoHN0cx1i6Gr5HIO6rSm2Z5cJxwaGCL6MELr6eJe
	 dwyodyqCFaplNnYF+Gg5FVoew8hoVdw4TzBGZSlCx+XoFsiTQmR9rrQEW2q4P+iU0A
	 0da10C7hfVEpQ==
Message-ID: <sashiko-outbox-234829@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: display: add CIX Sky1 DisplayPort
 transmitter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Liu" <Luo.Liu@cixtech.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126060003.3979478-2-Luo.Liu@cixtech.com>
References: <20261126060003.3979478-1-Luo.Liu@cixtech.com>
 <20261126060003.3979478-2-Luo.Liu@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 06:13:14 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dt-bindings: display: cix,sky1-dp: missing ports/port@1 and
  aux-bus in schema
--

commit 0fd2cf4952ac57efa52ecd81791109f84491673b
Author: Luo Liu <Luo.Liu@cixtech.com>

dt-bindings: display: add CIX Sky1 DisplayPort transmitter

This commit adds the Device Tree binding schema for the Trilinear
DisplayPort transmitter integrated on CIX Sky1.

> diff --git a/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml b=
/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
> new file mode 100644
> index 0000000000000..2cb4dbb8d5fe5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/cix,sky1-dp.yaml
> @@ -0,0 +1,102 @@

[ ... ]

> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Video input from the Mali D71 display pipeline (Komeda) that drives
> +      this controller. The link to the sink is through phys (USB-C combo=
 PHY
> +      or the native DP PHY), not a second OF graph port on the DPTX.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - resets
> +  - phys
> +  - port
> +
> +additionalProperties: false

[Severity: Medium]
Should this schema define a ports container with port@0 (input) and
port@1 (output), as well as an optional aux-bus property for eDP panels,
instead of requiring a single unnumbered top-level port node?

The phys property only references the local SoC PHY provider and does not
describe downstream sink or AUX bus topology.  In addition, an output port
cannot be added as an optional property later while a top-level unnumbered
port node is required: of_graph_get_port_by_id() scopes port lookup
exclusively to a ports child node whenever one is present, so a board DTS
adding ports/port@1 would hide an SoC DTSI top-level port node unless the
binding is migrated from port to ports.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126060003.3979=
478-1-Luo.Liu@cixtech.com?part=3D1
