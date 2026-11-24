Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480839;
	b=L9N4DV1e0CoPxTM1ML8OA+HfjFuTFRN4BsjdmxCxpF+KeKPRhYOtOFgO3wvG850mOCSQ
	 ubbEYZ/cEcKHMA4lbPrD/LQVgDu5+fkSOMtHWgXGYJTZo7gKO59XdDjmbibpvyrLIYSNs
	 U0Gekju3zsv11JcnOAZNhUF7sCvtHIvsCplbcq4FEK6vt8QMVrIzA3FyqsbOWMyPdNvPy
	 9NA5ycyK004rBmVbo5wCyAhIDK8uwC919klYzWvQaquYXgvIIuCmQ1rBeG+Ia2Uv+eaEF
	 duRf3F0lWrGOv2Ocsbm+8e5mo6vrq9fA5s5/onGoWbtEAUlT4lqTA11KWUITZsscOFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480839;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oXOmEymlLhGvxYC2DcRRg7okeq4lsC29GL/NI09EpkY=;
	b=JYnFr3LznX4O5CiR32fmXPnZTqQfGzFo1ppqq8agV5vGRes9TOb6G+ukwYiOqNXc1bRD
	 Dcgu6mvb5kw+YP1U0+ykLbIAGwpvAUesgw5bdpoGHy0lLBZIg2r2rI2U09kQBJeg/YYgw
	 07VCr2BYHfG8lEEnEeXxacC3LwOffXVzjZqXKdLBN8PLtpHVACf7skyTfW7bT5jVpURl6
	 oo4UutFCRmK1RsH7ICSn8rUbdGcOwK4YtgXD8gDr5GLe3fgIU4OpbmjAoEFwIvY48QkKC
	 EeR+qmb/7nxuNwMfL0satOagiGwtmh0zmBGNCQfEGDvSAbcA5KaQUKqwnd8EBt5Pzdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HTYF3AsR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CFD606A334;
	Tue, 24 Nov 2026 00:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HTYF3AsR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED871F00A3E;
	Tue, 24 Nov 2026 00:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795480839;
	bh=oXOmEymlLhGvxYC2DcRRg7okeq4lsC29GL/NI09EpkY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HTYF3AsRtmc/f6w8/EZq4nxnX0H+E1oCRlbnkZcF+snmfAZKxYGXwCX0ouZPJlqDC
	 FERvRKr4/apXJn2AtF76PYDi1fzRreCBgzl5psb981lI3kbcPwgxuGIoWuOqNw6QBF
	 Q6eyD7jj8aqmh2PXWxNrINNzumQZW5UWzLfAAwCTkMdu/nqyJ/8P2mp0Db/b7KbSsS
	 P0H0Ba+hmdRRDrk0mVAUTfIfz6UEqbRVMjQRUFs6KU/AAXEEatveHKX7AvJkINwOvu
	 h7Z9Eywf0WUyFxoMdErPPPDJz7uoq8txXXhtc1TXquChqNKI97525Xc8zJTTNIRMb8
	 wOgWSPjZSGYKg==
Subject: Re: [PATCH net-next v16 03/13] dt-bindings: dpll: add SiTime SiT95316
 clock generator
From: netdev-bot+sashiko@kernel.org
To: arouhi@sitime.com
Cc: jiri@resnulli.us, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, ivecera@redhat.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 cjubran@nvidia.com, Oleg.Zadorozhnyi@devoxsoftware.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 00:40:38 +0000
Message-ID: <179548083810.3135.6950210693310283023@kernel.org>
In-Reply-To: <20261119225752.41846-4-arouhi@sitime.com>
References: <20261119225752.41846-4-arouhi@sitime.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The new binding uses the shared dpll-pin.yaml property
  `supported-frequencies-hz` with 32-bit cells, and nothing states the…

--

dt-bindings: dpll: add SiTime SiT95316 clock generator

This adds a DT binding for the SiTime SiT95316/SiT95317 DPLL clock
generators. It describes the XO, reset, interrupt, supplies and the
input/output pins on top of dpll-device.yaml, and it adds a MAINTAINERS
entry for the binding.

> diff --git a/Documentation/devicetree/bindings/dpll/sitime,sit95316.yaml b/Documentation/devicetree/bindings/dpll/sitime,sit95316.yaml
> new file mode 100644
> index 0000000000000..5356a73a80620
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dpll/sitime,sit95316.yaml

[ ... ]

> +  input-pins:
> +    type: object
> +    patternProperties:
> +      "^pin@[0-9a-f]+$":
> +        type: object
> +        properties:
> +          reg:
> +            maximum: 7
> +
> +          supported-frequencies-hz:
> +            maxItems: 1
> +            description:
> +              The rate wired to the input, in Hz, as a single entry.  An
> +              input runs at the rate the board feeds it and has no
> +              frequency to select, so that entry is what the pin reports
> +              as its frequency.

[Severity: Low]
Should this binding state the cell width of supported-frequencies-hz?

The shared definition in dpll-pin.yaml has no type:

  supported-frequencies-hz:
    description: List of supported frequencies for this pin, expressed in Hz.

The only other binding that uses it, microchip,zl30731.yaml, writes it
as 64-bit:

    supported-frequencies-hz = /bits/ 64 <1>;

zl3073x_pin_props_get() in drivers/dpll/zl3073x/prop.c reads it with
fwnode_property_count_u64().

The example in this binding uses 32-bit cells. The sit9531x driver added
later in this series reads the property with fwnode_property_count_u32()
and fwnode_property_read_u32_array().

A DTB does not record cell width. So a sitime node written the zl30731
way, for example:

    supported-frequencies-hz = /bits/ 64 <10000000>;

would be read by the sit9531x driver as two u32 entries, [0, 10000000].

For an input pin, the driver takes the pin rate from freqs[0], so the
pin would report 0 Hz. For an output pin, an extra 0 Hz entry would be
advertised. Output pins have no maxItems limit, so validation would not
catch that case.

Could the encoding be stated here, for example with a uint32-array $ref
or a note in the per-pin description? Or could the type be fixed once in
dpll-pin.yaml, so the two DPLL bindings don't use different encodings
without saying so?

[ ... ]

> +                pin@0 {
> +                    reg = <0>;
> +                    label = "clkin0";
> +                    connection-type = "ext";
> +                    supported-frequencies-hz = <10000000>;
> +                };

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119225752.41846-1-arouhi%40sitime.com
