Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342526;
	b=4vFYOEQ0tO+Zihk07F8IfyoYxaDl8gIRkbqHaCRzP4Pc/HI3a4SuKjw+56kirqPXoPl7
	 nCFR6+3XOTZ3rg+AvjMZliOIxzu/Vc8WMJe/T4Fu4he+R68bTOizvz+h897uNSq1Lp84N
	 Hn04HhSSDwqfFQpxBEaqpsHNkDggxPz4yhuedG8CDzhGV/8C7ZIJPWis8DuVzok9MGOsA
	 +GypU7PJVT8AowZseuqYwyVo01XGoG2UB6YLTY3moCfjqiW0OzksfWl/D1M0/Vc7R+X48
	 J5PzVNTTDs8JLPVd7AupDuJGpgO1VXrUGf7R7DZ3i0ZnCul5s4h0I+HAVP7VpG+P7uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342526;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YzPcy3JDxWaTCSh9vLfad6QICLHYP98JbuXO7wfCEmw=;
	b=aQi5fl8Mih7WkCyNKbixzUuiHguBHuNoxIB7w6Tyudl+JlvoO/9gnUMck9lUmqXpU99q
	 L0WV6WCKs/CoEjZgLNOpaLcNmPY54h1eiyrePrzAvhwaYvll0jy/PJGdTBL92CQUKSvYM
	 l3jubzWllVfzZJw0FyuOWI2bSKmzhAsxFlNZQ6Do1EcvJCjqBk9HD8ki2A/TkfTv2pQkc
	 KMPce+uQ7dxv52N4I0fhXzMsVQCApB9RHvOcZet2B+nXE1f7A2E0imGTpo/b/j5XgkDLW
	 uixg8HbXvPGbHpEuMj1UJuv7ph1NgFo664o7Lz1jh3mfQYYA4t6Y8kUJneSQPod03Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BeiKpE4Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52BE606BA7F
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 20:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BeiKpE4Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 816771F008A6
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 20:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794342525;
	bh=YzPcy3JDxWaTCSh9vLfad6QICLHYP98JbuXO7wfCEmw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BeiKpE4YTA4Xml9UOLVQ78n98hVI2Nd8SzzNUKRbWZdwetwGQroztbvp0bClrYMWH
	 HaFfC2wwbeExv1CUNfWB60HOaPBOyqrsyabnsgnNYjIwz20+wo3ahCl+etUXav3hTQ
	 zX60y0hoForwLTLvIcVbZnJreQrHagazjAKIJiLubb/NcYCvduOsVYKe9Pl0SKGLvl
	 N4AwuJQdruCWNtpcS/bnzUYwoGQ63F5f5sc89ZSHqdKt51Cchg2QKsPavNmFKn2f/+
	 jDhK6h0/XVCOSgZ69sE4Vyp+At7tOw9AysXDVMRKAOYjCXkiZaChV2XLa6HWE8blth
	 K69CCe/BXmqlA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso3723785a12.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:28:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGxhEoQMbmw3u9H6DhwirWzJqeU5a56TdH4MKgP596D03OQ9uVj5iz9oVe57TpSw1FG+M/8ssEeUbtW@vger.kernel.org
X-Gm-Message-State: APuU4Z8/UL9mJSDWZA76MlfdLYsfHhoZnTzgpEOiLK8ILqpDKduZ6ns+
	DcALTB+8S5z1xGPq35pFlzVHItyXuX7MbMZ7v7fmUIL9NNzrs04pUNWPZfG/R2NP5wac+I5R47W
	nTqXqIPOsk5Hk1R/PTjTqne8t2/frlw==
X-Received: by 2002:a05:6402:e05:b0:6b5:4f5c:cb8 with SMTP id
 4fb4d7f45d1cf-6b77781c362mr293488a12.44.1794342523958; Tue, 10 Nov 2026
 12:28:43 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110023400.319579-1-festevam@gmail.com>
In-Reply-To: <20261110023400.319579-1-festevam@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Nov 2026 14:28:32 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJO6rB8o_PD4vPn-Rh9VA3OcforAO7pf2S5pV4vBUYHSg@mail.gmail.com>
X-Gm-Features: AclHuK-NZ6fOyjM4oBJ5iMdBqCUpXBznkor5D6_ATIkN28BuQbdRonv8PJTgNjg
Message-ID: <CAL_JsqJO6rB8o_PD4vPn-Rh9VA3OcforAO7pf2S5pV4vBUYHSg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: imx: Document fsl,pcr
To: Fabio Estevam <festevam@gmail.com>
Cc: p.zabel@pengutronix.de, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 8:34=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> Some i.MX25 and i.MX27 devicetree display nodes contain fsl,pcr, but
> the property has no schema type. As a result, dt-core.yaml reports
> its raw bytes as an invalid property:
>
>   imx27-phytec-phycard-s-rdk.dtb: display: fsl,pcr:
>   b'\xf0\xc8\x80\x80' is not of type
>   'object', 'integer', 'array', 'boolean', 'null'
>
> Document fsl,pcr as a uint32. The property belongs to the display node
> referenced by the display phandle and is not valid on the LCD controller
> node.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Explicitly forbid fsl,pcr on the controller through allOf, addressing
>   the Sashiko review, while retaining its uint32 type for decoding the
>   property in legacy display nodes.
>
>  .../devicetree/bindings/display/imx/fsl,imx-lcdc.yaml  | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.y=
aml b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
> index 84610b5690c4..450f95098c99 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
> @@ -65,7 +65,17 @@ properties:
>      description:
>        LCDC Sharp Configuration Register value.
>
> +  fsl,pcr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      LCDC Panel Configuration Register value used in the display node
> +      referenced by the display property.
> +
>  allOf:
> +  # Define the type above for decoding, but forbid it on the controller.
> +  - properties:
> +      fsl,pcr: false

That does fix the warning, but still leaves display nodes unvalidated.
This needs to go in a new schema. Since there's no compatible on these
nodes, we need something like this to apply the schema:

select:
  required:
    - fsl,pcr

Then the schema is this property, model, bits-per-pixel and a $ref to
panel-common.yaml.

Rob
