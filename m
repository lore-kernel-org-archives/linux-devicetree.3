Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745560;
	b=PsqbMm5Ictko2x9ugPILw/r4Su7FZOQWGKdetcms5IIE7NLf6IxNCVXkreWN//r+mI7O
	 z0U6c+siNkUC7T4vtr0d+4vPWWx9g1mKOJiALbL1fa7HjiYHUPhWHIvYi4w0JPpefZT0k
	 JYltzHPgdJLccTMODwFFHG+RnvQAhNL2uWfHVuIXgnrm8HWFF7nw/MmjKHpZya7uKAY11
	 WnxzSa4QoYA2UzzHA3AFHlU6mZMp3vCgTwMgcUx+ZyiFe/x37pFGA/6a/y6mGB7+1OVh+
	 ssoRMFE6Qsn8zcDRPIFLDoNSFsD0JokHd8R/l/6ZTS0p57q/p3dwa/WQS/y+3EPGt2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745560;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WUlbIRIxRBrzeriXpA0JDk9wpe7FK4dVNCDJgpiaqlU=;
	b=1OsifHQ8JuaU8aS7LHVjQWoqQxcZ4ncW7QAAg70b2Eo2DG59YTS9asumtvhhC1K0/wX4
	 2lXOZ75Sut016zUaSo+ydf1/HhP+Fbl7CYWCt5TIpLOpAKL7pDpX0QuIP453KxIBIbDbs
	 Bk7Lm3XJKXNlsx+in24FaKUOIo4GtQGGU8PmbRekyhS+dB0/KGGkUfAo5SqPjZe0aSQw6
	 HMWMBXDhFQQwbM9aVfoG7ZGn6/QSdUv+Nbc91OF9oouACJBk4d2P96SbWf1L9ZNX9CP6/
	 1rXE2XanLMlSpPCoXuel3VNoyOkgBDLFydtBB4igCTGsa44JT06atCgpHhMwCmFFerA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VF8iEAlW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BE9606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VF8iEAlW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F161F00893;
	Fri, 27 Nov 2026 02:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795745559;
	bh=WUlbIRIxRBrzeriXpA0JDk9wpe7FK4dVNCDJgpiaqlU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VF8iEAlW5Imvwq/SPvz3rta8fI+NUDM00C+/tIUKkkSbawQ6LKDpzNuvN1HWXMtJJ
	 DmcPau+Q1uGNFe98it/vSeNYhpj12+GUPmNzRk0zS/GKFw+GKzptNpd9DXfyYj6th0
	 3u5f/j+xebCdkG5KAL+IsSgc7e62aLIukLue4Ng23/AJoHMqcqV8a8n9evYUH4BYvX
	 FcNXps6Iv5muZdWPjI84ka1iBh3j8rdFZfIY2HC4+fWaudcAAsbEP8YVIasvb7UUtM
	 +jDlzdluRy7bqTJUG7+LfmNtuk+xGe9ZqWglKlK0QxFjPoMMAvQiQgRqpKvGEjK7nT
	 lEAzSG03ZwDGQ==
Message-ID: <sashiko-outbox-236434@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: sitronix,st7701: make
 the port optional for DSI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Romain TISSERAND" <romain.tisserand@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127020815.1621790-2-romain.tisserand@gmail.com>
References: <20261127020815.1621790-1-romain.tisserand@gmail.com>
 <20261127020815.1621790-2-romain.tisserand@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 02:12:39 +0000
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
- [Low] dt-bindings: display: sitronix,st7701: duplicate if/then for
  rg28xx-panel
--

commit 8125a9df8a4287a7ea90e2141e5a278695835f1d
Author: Romain TISSERAND <romain.tisserand@gmail.com>

dt-bindings: display: panel: sitronix,st7701: make the port optional for DSI

This commit removes port from the top-level required list in the
sitronix,st7701 binding and makes it required only for the SPI-controlled
anbernic,rg28xx-panel.

> diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7=
701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.=
yaml
> index 044b84d8638d6..3ca9aa215b7f8 100644
> --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
> @@ -54,7 +54,6 @@ required:
>    - reg
>    - VCC-supply
>    - IOVCC-supply
> -  - port
>    - reset-gpios
> =20
>  allOf:
> @@ -69,6 +68,16 @@ allOf:
>      then:
>        $ref: /schemas/spi/spi-peripheral-props.yaml#
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            # RGB input, controlled over SPI
> +            const: anbernic,rg28xx-panel
> +    then:
> +      required:
> +        - port

[Severity: Low]
This isn't a bug, but the block right above under allOf already matches
anbernic,rg28xx-panel:

Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml:
  - if:
      properties:
        compatible:
          contains:
            # SPI connected panels
            enum:
              - anbernic,rg28xx-panel
    then:
      $ref: /schemas/spi/spi-peripheral-props.yaml#

Can required: [port] be added to that existing then: clause instead of
adding a second if/then block for the same compatible string, matching how
2f50e0a0f9d3 ("dt-bindings: display: panel: Make DSI panels port optional")
handled ilitek,ili9806e.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127020815.1621=
790-1-romain.tisserand@gmail.com?part=3D1
