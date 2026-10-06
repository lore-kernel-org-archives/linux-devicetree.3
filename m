Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B813E40EB
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284904; cv=pass; b=Gmpj2SznM9D/dcLD8MwPU1Sn/4nvsYThqjNEQUwz+H6QTpPAu47kzfBHRWMxsKPMxZUwvg97+iSna+FwCzeyqOqrSjxOGJx2ZfVjVetkQ14n0TgeSXDJI4byQaDsW8RyjnAwQMmdnKKGNHMmwI+WQkVq5Uvk61zWABjh9Qt1edY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284904; c=relaxed/simple;
	bh=mu/t0nX9SJf6wo8N8jq58J5MNpmsuozgdWxvH8xSVO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPFB9vRlEOUkVPSdXtuSEE+jcOvMxd+0u4rIN57z8X6J+BWfUEG8YH1SfneRPcw6pjEVKQDYdnZ94M3DribyY9HU1nd5G7Kx+NWx6IRI1c9Vhmlib0LpNioCsFdXEiIxHCYT6xdLYKeSLJjrPFpRcSxR/GXJ+fnyBWZsnYXo/Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KT1hCJ8A; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KT1hCJ8A"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so5008255e9.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 04:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791284901; cv=none;
        d=google.com; s=arc-20260327;
        b=ootjUBb2s/PQ+qEnPAWTnZa/2BZveDbBrYOx/LsBZSoSO2+nYYXeWQOf15V9qG6dI3
         zHi0yRxDmXog79wPmpBhaFPqZZoUDsWnQKwXOuzqHwSHK9GOu8jOoaOybMz+/R2awb7p
         k/FiY7OI5TZIw3K+4FAkd6pRmqQFpStPX0TsvNxyTc7i/byxotYiPaZ3z1s4Ot3kCGXH
         w0aYiBaNLD655K/0lG10XUxGtR7NDVMVzf3MBdQq9FaaMmfcBEY+R1f7t3v7BlcK3QiJ
         x9FjWruS8f6utW5+ohE/10CPjJBFXIJKLExa+viJGZzaq3AZrNfSmS/cr9OcubH1D4uC
         y8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yJ8PE6Uy4bwH6wDfLl1X3RI3sdy7oVAtm672ES1XxF4=;
        fh=5G6te33TkuJV0AqgSiuNRD7o7plXDDgW5arifAv+GxA=;
        b=BgGD6rs0zMnaSC0M3uThbav8dawR5HLq/6APlc/87/feK7y5gG0BBrpGq7PMNwyOIF
         VAZW3iDAYwKWlkQNhd8RpC9xc+OX1+wOiYQYCCdt3LarCeVMrMtrM3zGxMQg3MFdI5d9
         M8X18B3IYNkVz295KiflDV1NdqdB9RJQ0SmnFXBweVFdCWLBL1vF655FOcjc4Dgf9HwR
         KkT4wc18qd1qNmOemdqeZF9i8LnpQu3WW82OK84F3HgHttcZv4cfCNipNzr2eysvTxwB
         /O+EqUWytexnxQuRV4J53RUPQ90WfBJNkq3+mXeN1gXmrMVmAl/vKT384Gc+uHQ4TRML
         UdqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791284901; x=1791889701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yJ8PE6Uy4bwH6wDfLl1X3RI3sdy7oVAtm672ES1XxF4=;
        b=KT1hCJ8A7oqKyx/HwsCOpG/k8CUyOUxNqnqhANXA3v/D501wdyMQD/7fxto87CZA23
         b3H+9lTW9z58X+AKuT14XbGFYQSc1xd1lqqLdXpVWoFNwSUYUxqZQ0hqqzLjjMSk5GtP
         apdhWwTQ25paigoxcYFhy9CfgjlHYl1WPntyi0sQEXRbnMTOb70P0a3JPwAXpuqw1ABG
         oprA+Ble1uL+FudlWSAqhEngp0vooE9sZMMOS44hSUzextuaQPfpjx20CHbxdBGCyJps
         EWUTG/dqKLOhd/vvkRkl5FdwdCEklePWrRzo2hlVlzEBzwEUv8OxLdv3+ycau8Xwhmjc
         KJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284901; x=1791889701;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJ8PE6Uy4bwH6wDfLl1X3RI3sdy7oVAtm672ES1XxF4=;
        b=VgqB2kvQHFNKx4XiTJzI906hBelwNieD4z8J4ib0ZBgKwrf2WYWlNyQoW/p3FbjgDh
         X4fwt1eCIoVSlqgpgv+NTRRChlyqs8USZbPqtLLAWAnV5Qwqoq6Yek7v4N8Eo32Wnk8n
         U6qefXoSV4ZQag1EZ63whYAb2HMRt9O0WqiPSMULuom+hQfV8+P9ddEenzXyoGJsjN1u
         9KreB1ZHMJtgyDSbX5Rg6HOyIFScc8dGsyP1ZP/1VkXNeZBi9bbjQfj7GbUPQjyED0WB
         J2X2tjMIIc1wn49XI7GFR9tfkp6wGQVOsxQw+Whsw/Ex3Gwt2Jp9uisEyMjSkfhA0Kl/
         fM6A==
X-Forwarded-Encrypted: i=1; AKwUvBw41ftwPbVHVm4/o815SNrzU/IIvLiljXgiuWZkg70Jc8BCn/OfQqoylG5PJBdGtbWvJkqHx1a0YC24@vger.kernel.org
X-Gm-Message-State: AFuF++na3eaDTwhjGG/fKrf+GkglCeVmNOx6QmGRyYYczhkCcH0DGPMv
	16dCDVIZ9Q2OV04MB/b6Yv5Hx085vhjJ+1coHyH+92J1EFe+Uc9T730d5FHnQgumQU8jgJ/EBbk
	0/HIMEcSIZ8rVBF5tRKjBI4mJtHz1NB4=
X-Gm-Gg: AYBFou0ageO4QnIhMZaoUbLph73z/l7wFeqvr+wG4MO5cemDT24v7joJh4KdmvHG6f6
	PZF9Xnhdr+tLPPvEnp4hwW0EXB22p2wcQjIOi4Kb6hklAyP4oPKBwhDPLqFg3jpNdruL9xxTH+5
	QU2QvkUHHh+A85wQxgG/n9iyCybJKAO+kZskbN0XOBTuCLAoWjCn9XOOJi9k5RMeJDRkfgWIUxd
	QL0Q4ICUuktgoYZ/ZH7iW/upClh591zTMJve3bG+pOr2PkzXWFuaTFkpPEW24HlU6EFngyej14O
	HxsCHEakoHON50j4MokPAxCQYzVw/9NEowKIDCw7iogTj5N5a6Yrhb4AOsfJFn9vjO0l96UU25T
	gqU+9EYFIqFyjpot3Bspl5YkNW5+LNRkghHml1w687gABz//rM8HYDX8MObO7uOKK9Uc10VHZ
X-Received: by 2002:a05:600c:8b55:b0:4a0:13ea:2ec3 with SMTP id
 5b1f17b1804b1-4a17b55f8d4mr16436125e9.35.1791284900622; Tue, 06 Oct 2026
 04:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org> <20260928-mali-c55-renesas-dts-v3-1-2cf7eb746ebb@kernel.org>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-1-2cf7eb746ebb@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Oct 2026 12:07:53 +0100
X-Gm-Features: AclHuK93-zqsTFDUIXHtLL21RUOx75gjaGfM2OXZX3yb6vwYcEZ12igB1pL2UyA
Message-ID: <CA+V-a8t_WZpq+n_z8zk7M+OpWExRZydZaS3W1uxi6dH7SukXtg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: media: renesas,r9a09g057-ivc:
 Describe additional interrupts
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Thank you for the patch.

On Mon, Sep 28, 2026 at 1:32=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> The RZ/V2H IVC provides input frame-start and frame-stop completion
> interrupts alongside its input frame-end interrupt.
>
> Describe these optional interrupts, keeping frame end first and requiring
> only that entry to preserve support for existing device trees. Extend the
> example to show all three interrupts using mock interrupt numbers.
>
> Assisted-by: LLM
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../devicetree/bindings/media/renesas,r9a09g057-ivc.yaml      | 11 +++++=
++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/renesas,r9a09g057-iv=
c.yaml b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> index c09cbd8c9e35..3eeb1a92c9cf 100644
> --- a/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
> @@ -21,7 +21,11 @@ properties:
>      maxItems: 1
>
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Image input frame-end interrupt
> +      - description: Image input frame-start interrupt
> +      - description: Frame-stop processing completion interrupt
>
>    clocks:
>      items:
> @@ -92,7 +96,10 @@ examples:
>                 <&cpg 0xd3>;
>        reset-names =3D "reg", "axi", "isp";
>
> -      interrupts =3D <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
> +      /* Example interrupt numbers. */
> +      interrupts =3D <GIC_SPI 103 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 104 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
>
I think it would be better to use the actual interrupt numbers used on
the RZ/V2H(P) SoC. Most of the Renesas bindings use the actual
interrupt numbers.

Rest LGTM,
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>        port {
>          ivc_out: endpoint {
>
> --
> 2.55.0
>
>
