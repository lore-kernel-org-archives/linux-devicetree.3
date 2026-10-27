Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793093998;
	b=jx/D3gXjAv71Oxk20IhCrsFCzYiy2wjp/AQYW85l5j6hXEWB2+8FqpdMtsX40YhhAHDW
	 FnNivPUtWtuScjH7+jFsRx3acx+iqIAAzhwlcqPKQzqnqN5cpjgzpugJSO54aEW9mkv3Q
	 A9DdUhMosmtlMwsUk+dKe8zk4cvDJxafKMB43X0VYP4n3TyJuevLpYZCnfWsHn0PfmS+w
	 OwfMNJ0YgM+SlrFJ99glgMcySdAZh1CaA0SzEXVPeV93NImUPHaaqz02tOfjY4uQoE/tf
	 BRwxh5+z3GDc713yAcn8yU5oe0+pkKLYLIDcXLxduUqEmhL7tyh6NaowFOgfIRuF5kA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4X+P1B6aE29va33Y1nOTBGckjA6+hBF4dxDZ8irecEY=;
	b=jPICe8DWY7TY1McGmogKbHEcofIQIOdPI+aLQbKTZgwpWTFsHtNvazUfsn+UZlRplZuu
	 vhVfvzon0pWo4kHGQVkb582EPt0ZX4tYPrqG4veyAVhOaif96eZFIA1h5ydxLyQc0eaH2
	 hAL6wlkta8t4+8PTa7nZB6tYxQIB773UGnMZWFzOwW70Wu57sh8rXnO1PgcdulMBOK2n2
	 9gIGSgCh6rBvCENv8Z6xggU0k9GYDbRAz/kX1fZur/wcXfJ3JKwpoSZrQWl/0yoSp96gj
	 qHkHXtqyqI9sDdo/E14ttrvaRSH8eFdnb5DZF77baAVKvTuTchZhYNphZCod3CJbEKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jbgipqXk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.52
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F99606A32A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 09:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F99606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jbgipqXk
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7ccb2ffe333so2148372137.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 02:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793093997; cv=none;
        d=google.com; s=arc-20260327;
        b=JGhEEbZW25XxJWpnZ6sw+lMzcbiWTmL5nzObZ14B55OBgHX/bEszDySDj+WPyibyFq
         Zk4Y3tVmmOXGh8s4Ac3e/q29O4RWcnfMnP+OMDhcwJIQ7UkJegAZQ8vBujH8NUAVdWte
         BdzwTRpRwEz2iiyyawn8zT5PFRUaOZoLiozJ6zXwsLnG1Cpsv+Jdj6C2G3o02GNGfdzi
         ojiGfWOqYRye0tp21YmPX240jHy7gXB7G1JZVon6CnIYQ7ga4ZaywWfL51LmDGPG/ySv
         74KGQvWKvcJtKHl3k0lNZUdqsxQcOIz5AaPyIfLjtLqt/ToyXg+DFdMcb6z95zNjaHnF
         CgyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4X+P1B6aE29va33Y1nOTBGckjA6+hBF4dxDZ8irecEY=;
        fh=YbJ+ysCiwNfhmnoBri2Pd1HAHx1IFfcguOv1hGKC8BM=;
        b=V8LI3Paw+MQ+rCtaieW+fcrG1AdXBcNSN64MAyP+fkjqH0qhvSfImGmZzXlG3odMJ8
         kFlE/J6Th5oXv+C70QfWRDNWZmYNKCNGfnu+JK9B+nQg5y+87WJbZSCOM6TTxnJfHGxU
         2ElSsrlgb4G+2hc3GX9Nnn+t7y1DoV+WYBS9p63+z6L42Z/Q5LZOOHlCkPUo3rkrPccM
         GuM/HnISNTWDi0kqeipHLEatjpfBr0o6NDr6WrBNRIKEFvHS4jmL3fddfraCn09pUwHz
         JltHF1KA0PlAHqD0QCSs1UkiG1XrHRnzfZARb6Km/ql4hiST8+6FCDh4ASzURVv1mlpw
         EygA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793093997; x=1793698797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4X+P1B6aE29va33Y1nOTBGckjA6+hBF4dxDZ8irecEY=;
        b=jbgipqXk/6TNxEbvLlNc6gdZFS7gSzHiaIXUNfVVdN3q94F07nj9GzMabdiRQsRP+F
         o/XOGFypEw+wijhGjN7sQwjWm4BFklcLI3EBtfWyHhpoHYyUZDxdDMQdWr4JXihw3R58
         aHsrl0M0NfG9pSxGqRcD/Nj5Z+tc0m1rfTN0Y2sd+xO8Kck0FHRfCAXgRO8+J2Q0vNrS
         2iExoS6IytX97KV5mB7bJwKQm8JXIZn1GzCAUfz82AMiashJtm976jYvCEHFiaX2Zinr
         8VHyvlk4eUGocaj55+e67vOmZIT54wKJpIJJmqyE8/3zevjyHZDXFpv8mqRRBPiZ/LsY
         +WKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093997; x=1793698797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4X+P1B6aE29va33Y1nOTBGckjA6+hBF4dxDZ8irecEY=;
        b=lf4Ox3vZ2l1Ip5x3XpaZozYfm4LrwcBvhBeKe9FWt2Kz0hKoKJAx1Bw+gkHkkxxqtk
         koCM40ibXn4SOLSq8FPMBFlDGQIGcbAOD0aVoISRdQDhzyGV2G1E/mZt7ErdGdjdV4Mo
         rWflkuSnR+f9pg/WEEbSKbb7OUvbBLrN8ZD/Ojgn/ERQV9038/C4zJ/FbpUzvnCWn1yP
         hjsO74ZsrPCyVqb28RkRf+igtnJMtHHyZ7pbpErT+n+9IVDwTSiXmWiOVX3xObIHRxF8
         Hfyg7jqjvX5+MomUKVHpnKoeL3VYG/CsiSd7kfxXbIteuoLiSqEEwOKXRB/uhcxSYZof
         Q2Pw==
X-Forwarded-Encrypted: i=1; AKwUvBz8uWaINuYEPaolS/M31DbZ7tXtXiBkgphs/ze0RO2SeGov2b4LMJcag6rH9V4W2+VIxjefEt2NOst7@vger.kernel.org
X-Gm-Message-State: AFq9FYIsJ7VbiX1FNd/WVBLA8UY+xsne3jt+nYQCGwo5ztKUlyZ0F3/k
	b55s2TSxyY/rodBXu9OxcdnapnjX5m3O+z3ihNpXK/K3FUIbuKzFzbu48eQiPN4dUqlAE2dAfCM
	z/q1YjAPCaIUA3qgVtMdXopGWZXTGg10=
X-Gm-Gg: AYBFou38LGzNWg/Gd98eugLKA5UJr2gDI+WMtK1q6N9O8a3EKDAAwFq/H14cLSa2prN
	lHdmS43SLdT92qHS0EVpCF8Y4oO+bUvmypdf8aN+ntfq5s8/ipwUgtCIbVC0EUVRZoonEE3v+1u
	+4SkA6bCXIqIZeQJ6rYpuHuJ2mMvJbGPpRQw6yYCjE2c+5oTN0yawu0/5hefso+v6/5EdAmwS9h
	AKcboctTZ79gk2rXP7fDAjGmAI0tfxHeduLvErHuJRMimqDmo0YPBFOb9G3nUZM9CjyuF8Bfugi
	WEDxbRzuxBbveokwzcHlaa5qgiYaUgqPiEf+Nc2WoV+22zTgQy/EkUjc1dhXGn34L6w2pnQDjop
	x8vrcVXH5pXZZ9tfOGdSxmd+9Uj7iq43UwVY5z7GJWp4pLMOC8jd/POkCeoRqMraZebQ5Ctbgfb
	HRKt6DjbIdXkarSNgwE1/VyeyDAENjY3GeeiMjwOuj8uUZNBt8GS9r9GBBwoC6Jpz/+K0L5nXco
	SK5/GLfgq9W+iYBvcAqiUkzPnmk4w==
X-Received: by 2002:a05:6102:c8f:b0:7c0:4d52:8cc9 with SMTP id
 ada2fe7eead31-7ce5cc8d55dmr2986698137.14.1793093997186; Tue, 27 Oct 2026
 02:39:57 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
 <20261024-submit-h616-uart-fifo-v1-v3-2-286fc1b8c3c1@gmail.com> <20261027-nifty-reliable-octopus-6cbac5@quoll>
In-Reply-To: <20261027-nifty-reliable-octopus-6cbac5@quoll>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 03:39:45 -0600
X-Gm-Features: AclHuK-P2vZ9SIQ1kD5xtHOmSa1lugBkFh7TQdGZgeHlLBc3Sp6mnxkEd0joV1c
Message-ID: <CADvTj4qrBYSyT39=xK3_oGgHdFoSH=oyDvTtLCSzW=F9KAgi3Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 2:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, Oct 24, 2026 at 02:22:24PM -0600, James Hilliard wrote:
> > The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWa=
re
> > component parameter register does not report the FIFO depth. Its option=
al
> > register layout also differs from the generic DesignWare integration.
> >
> > Add a specific compatible for the integration and allow the standard
> > fifo-size property to describe the capacity. Require the documented
> > 256-byte size for H616, retaining snps,dw-apb-uart as a fallback.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml    | 17 +++++++++=
++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.=
yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > index e2ca126d58ba..0f8fd0485879 100644
> > --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > @@ -13,6 +13,18 @@ allOf:
> >    - $ref: serial.yaml#
> >    - $ref: rs485.yaml#
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: allwinner,sun50i-h616-uart
> > +    then:
> > +      properties:
> > +        fifo-size:
> > +          const: 256
> > +      required:
> > +        - fifo-size
>
> Why do you require fifo-size if is const? It is implied by the
> compatible.

H616 has a fixed depth, but other sunxi integrations have different
depths between UART instances. For example, D1 has 64-byte FIFOs on
UART0 and 256-byte FIFOs on UART1=E2=80=935.

Should I keep this explicit for consistency for all sunxi uarts?

>
> > +
> >    - if:
> >        properties:
> >          compatible:
> > @@ -60,6 +72,7 @@ properties:
> >            - const: renesas,rzn1-uart
> >        - items:
> >            - enum:
> > +              - allwinner,sun50i-h616-uart
> >                - anlogic,dr1v90-uart
> >                - brcm,bcm11351-dw-apb-uart
> >                - brcm,bcm21664-dw-apb-uart
> > @@ -120,6 +133,10 @@ properties:
> >        - const: tx
> >        - const: rx
> >
> > +  fifo-size:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Transmit and receive FIFO capacity in bytes.
>
> Drop property, not used by any of the devices here.
>
> Best regards,
> Krzysztof
>
