Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230394;
	b=UT9N5uM4EMIK4fHTvA7+Wh/yKoMSa0vmqf4BQdeUQKKm0fDeWrPzrPc71Sd32bk8x0xQ
	 fee5KOIahHwQMFH5HUTEVL574CxGyQTdS+4KkWh63glrOohRVzhJp91iwGsE84o0rTHJ5
	 U66sHsAJiqwkrAs/lnqHLKNWDhWAY+YWFFTMV3s3ssR5+DfEEZr6DNFELxxtMY/DmBelU
	 SAVW8mMSyuB8x33SZbHjA/1Mi7RmshANSzfDVVPrplrWktTLgTSCQ4GYfNW41nPGQpBxa
	 bkR2rXL41Ux1/Tn647KKwKJtxNGOvcr6m9YG8jHOQWXhKA5MY1qCAQjdtXCrS0psnhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230394;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P2CseK4PLhhUVTux3q6e+JbxK54hmaZXg/zvaDcsLzw=;
	b=Qx01rIChSxcEynWbfPVEXt4hnMVDeQMuFXe1nn8zMIr8Cwt7qMYcxqZSpb+lCuJ+GpwK
	 6rmmDYKW6edvdY/ckLb6Q/gS03UgIdwrdnb6KPjLxWeZWz/Ze+s4gfcPqXe5DeDEJ8Si+
	 kCeqz4VBK+UQCk0LE3v37+flKqxziyp214zXGJV3vX1nnDImsD0aMw2SijrURfxlvcF24
	 +hwfucyEhFSUMkf+lBFINmjiFgtL5w0Tp1DoQrv//FmlZWgMQ7xkDZCjO2fj7BmxbwdHt
	 BZDic/x+ZDXaGM7HsJsqZ7u4p3LgO6ST8AVXIgW11o2nzl2m4ZFwzxj1vgJsSo5hvzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HvNT8cEO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38860606A326
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HvNT8cEO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63251F008A3;
	Mon,  9 Nov 2026 13:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794230393;
	bh=P2CseK4PLhhUVTux3q6e+JbxK54hmaZXg/zvaDcsLzw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HvNT8cEO6owuvnKQNsLzNGbAsW0gvpk9rYG9XK0dVKY/4kXENYTrFci9nAmdkHRY5
	 A6ck+fOYhWSHw0Sc2R2f8edVMj5f2W3TBpArYm1vGTmfG/AgQVsp+B5XM9yv6PJSpc
	 sLxfA0q6Xe6T+Awy+gOGAVkFs/Ob3RYp+RZBN7Fv/yN6LvTr9vluYPzNmaOxlnV/Xy
	 6Wl9HjxtTckPuBXzxsc79OjudW9cXHBgskN260Ta4FCPACqtdnGXqZ1dbe+vmUqgXd
	 24Ompc7AggUEhAXfiGpnOZED8WlY13wMwMWFUfofu+kjkXBnH3Kz507gmP/fanj90a
	 3kP9DZqmhu2jQ==
Message-ID: <sashiko-outbox-205000@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/10] dt-bindings: ptp: Document TSCSS hardware on
 Qualcomm Nord and Shikra SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imran Shaik" <imran.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108-tscss-v2-3-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-3-d5f575010427@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 13:19:53 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dt-bindings: ptp: qcom,nord-tscss: missing reg constraints in
  allOf
- [Low] dt-bindings: ptp: qcom,nord-tscss: invalid fallback and variant
  split
--

commit cdeb0d9b5fccebd2b2b765c9fc60dd95752de832
Author: Imran Shaik <imran.shaik@oss.qualcomm.com>

dt-bindings: ptp: Document TSCSS hardware on Qualcomm Nord and Shikra SoCs

This commit adds the devicetree binding schema for the Timestamp Counter
Subsystem (TSCSS) on Qualcomm Nord and Shikra SoCs.

> diff --git a/Documentation/devicetree/bindings/ptp/qcom,nord-tscss.yaml b=
/Documentation/devicetree/bindings/ptp/qcom,nord-tscss.yaml
> new file mode 100644
> index 0000000000000..9d49e66a35c98
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ptp/qcom,nord-tscss.yaml

[ ... ]

> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,nord-tscss
> +      - items:
> +          - const: qcom,shikra-tscss
> +          - const: qcom,nord-tscss
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 3
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: tsc
> +      - const: etu
> +      - const: timer

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        reg-names:
> +          contains:
> +            const: etu
> +    then:
> +      required:
> +        - interrupts
> +        - interrupt-names
> +        - pinctrl-names
> +        - qcom,etu-slice
> +        - qcom,etu-event-sel
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,shikra-tscss
> +    then:
> +      properties:
> +        reg-names:
> +          minItems: 1
> +          items:
> +            - const: tsc
> +            - const: etu
> +        pinctrl-names:
> +          maxItems: 8
> +        qcom,etu-slice:
> +          maxItems: 8
> +        qcom,etu-event-sel:
> +          maxItems: 8

[Severity: Low]
Should these allOf conditionals also constrain reg to match reg-names?

When reg-names contains etu, reg is not given minItems: 2, so a node with
a single reg entry still passes validation.  Similarly, the
qcom,shikra-tscss branch restricts reg-names to tsc and etu without
setting maxItems: 2 on reg (and redefines the items list instead of setting
maxItems: 2 on reg-names), allowing 3 reg entries on Shikra.

[Severity: Low]
Is qcom,nord-tscss a valid fallback compatible for qcom,shikra-tscss?

Nord has a timer register region and up to 32 ETU slices, whereas Shikra
lacks the timer region and only supports 8 slices, so a Shikra device is a
subset rather than backwards-compatible with Nord.  Combining them also
requires per-compatible overrides for reg-names, pinctrl-names,
qcom,etu-slice, and qcom,etu-event-sel; should qcom,shikra-tscss be split
or grouped with a matching 2-region TSCSS schema instead of falling back to
qcom,nord-tscss?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-tscss-v2-0=
-d5f575010427@oss.qualcomm.com?part=3D3
