Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993497;
	b=GMkGhAi6I6E/ffKuMolRw7185Nfwff0IKXfVtVPe+Yj63Bpy34bzsahHvixuxxWZXaAw
	 olzAHWYRAakSSRInetWiTceOB3d2S9TwwRG0ebHysGjFzJlCiVjzfUDT5n+sAoxtN7bWj
	 tFx5O/Ocu5fERA+amQYm+u9BET1YtEs/9zWTSP7il3G874MhH4OBfWrSXlWz1hCO4J7fF
	 67921K+X2Sc6jlN8upGO0a4nCj9Gus92+MywLTpCAhJ5uXzIk5Rt0+e9iTfWCY/k+D7Fq
	 aKJvUEHt9PjCFdY32lsOteXxWea6tP3Biw7Nk6NGidHXJH2VtaXGnuM5h1DVQ1+V7sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993497;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Vafyfr2jluO3rup5Bc7ra9IowMgBRMg/Oeq1u+WFKSM=;
	b=Ro6xN6wUdSN24yF/6K8LO4PIhE0jdPMd+p74f+T0t53Enu5owwOKxz2YqxR1yah8TW8Y
	 /kWY5Jixt0/9/UclmBmsDF1GxFotWnudbHzKj/HtEMKh0CnVsiQAiyvDayUWJdYP85X6E
	 9MzOUvd1f3gXFCmaZ4C/Pjox1gN47wlm6/nTQB/NITdjCowt9L4hFSHR+O5ZWA8a0RzOj
	 JDWiFXc6LIydzieNfnukAYOVFtn3gu2Usl+Jp8hc3vgv65RXbPiT5sdrFb2+qaaQWT5Gp
	 q369NVtIPiip3EUtUHATp7gKu4GR5G2RP9qlRyBao1KCgIYqhNzHX2cUM77WztFViaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y47gHwDn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E31D606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y47gHwDn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958211F000C4;
	Wed, 18 Nov 2026 09:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794993496;
	bh=Vafyfr2jluO3rup5Bc7ra9IowMgBRMg/Oeq1u+WFKSM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y47gHwDndWLbgZmHbqBS0YEAMe/pBbgTo1UBLaJ8Xwcxjxtw6ypK4srIHX69KfIVT
	 8Y6wNYTVfMCPiTVFpYPQbTM3hKwPDCla45NjfCQseWN7heAf5C/cfwil81nDo58idw
	 DLwWfOAWSktMzn8fBxe56Pk6S3o4f/8bfuPYuAEFbMRwzMlrIv89NJTjJfBwncBHzE
	 bIF3KYHqKIohDw0GQwv94W2FFjEVyiFIlbuBo/HxdTZ7Dxhwrfls3aXDQIwHQtedsR
	 +1Ao/oE2bNa5M4tqkbmesH1VQQBMa74yk2ljwzxt/W7IM2l+eGDRy7o1aPZYcB5RGE
	 8pnXe8fYwo/Rg==
Message-ID: <sashiko-outbox-220540@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: bus: Add SpacemiT K3 eSPI controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wang Yang" <yang.wang@deepcomputing.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118085742.1817536-2-yang.wang@deepcomputing.io>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
 <20261118085742.1817536-2-yang.wang@deepcomputing.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 09:18:16 +0000
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
- [Low] dt-bindings: bus: spacemit,k3-espi: unprefixed vendor properties
  and MHz units
--

commit d42a1666765549829c0c9df0a5e923d2f92c4eb4
Author: Wang Yang <yang.wang@deepcomputing.io>

dt-bindings: bus: Add SpacemiT K3 eSPI controller

This commit adds the Devicetree binding schema for the SpacemiT K3 eSPI
controller, describing its peripheral memory translation window, clocks,
resets, and link configuration properties.

> diff --git a/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml =
b/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml
> new file mode 100644
> index 0000000000000..30985ee0a61a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml
> @@ -0,0 +1,146 @@

[ ... ]

> +  pr-mem-base0:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: First peripheral memory translation base.
> +
> +  pr-mem-base1:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Second peripheral memory translation base.
> +
> +  operating-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Requested link clock frequency in MHz.
> +    enum: [20, 25, 33, 50, 66]
> +    default: 20
> +
> +  io-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Requested number of eSPI data lines.
> +    enum: [single, dual, quad]
> +    default: single
> +
> +  alert-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Use the shared IO1 line or the dedicated alert pin.
> +    enum: [io1, pin]
> +    default: io1
> +
> +  alert-type:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Electrical mode of the dedicated alert pin.
> +    enum: [open-drain, push-pull]
> +    default: open-drain
> +
> +  watchdog-timeout:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Controller watchdog counter value.
> +    maximum: 65535
> +    default: 65535
> +
> +  crc-enable:
> +    type: boolean
> +    description: Enable link CRC checking.
> +
> +  auto-gating-enable:
> +    type: boolean
> +    description: Enable automatic controller clock gating.
> +
> +  peripheral-channel-enable:
> +    type: boolean
> +    description: Enable the peripheral channel.
> +
> +  vwire-channel-enable:
> +    type: boolean
> +    description: Enable the virtual-wire channel.
> +
> +  oob-channel-enable:
> +    type: boolean
> +    description: Enable the out-of-band channel.
> +
> +  flash-channel-enable:
> +    type: boolean
> +    description: Enable the flash access channel.

[Severity: Low]
Should these controller-specific properties use the spacemit, vendor
prefix or standard Devicetree properties and unit suffixes?

Defining pr-mem-base0 through flash-channel-enable without a vendor prefix
puts 13 device-specific property names into the global DT property
namespace, contrary to Documentation/devicetree/bindings/writing-bindings.r=
st.
In addition, operating-frequency uses bare MHz numbers instead of a
standard frequency property in Hz (such as max-frequency or a -hz suffix),
and pr-mem-base0 and pr-mem-base1 encode raw peripheral memory base
addresses that duplicate the address translation already described by
ranges.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118085742.1817=
536-1-yang.wang@deepcomputing.io?part=3D1
