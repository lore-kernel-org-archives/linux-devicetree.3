Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C821A29ACDD
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 17:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780249490; cv=none; b=qobVVDUlrkWZooC7JBtKDJCRxP5DzhziSXtFtHtwXfWEelQ0L1PRUEdMvtrxwspB2TAEkWqtpVX/gBdWGIsORz83Jy6cX2rkhbOelvPOiEgh+p0A1nt0OSXWwXVahWRVhvFtKuIMYmTxjzYay9aqjgKC3+8edG20OwV9/TY2z+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780249490; c=relaxed/simple;
	bh=Xd/FwvTv5dh3MYxFn2DCgqgMqt62UPZ7nq/ZmFI1P9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARO3Q6JGT3jx07IUL+bbbedcD+bgtAoIz3UwdequiUfODOAhCFa8Lw55VhJEUTISJEEUUA5+u0Q8csi8OxZtb/CxZL8YT0RoG2dSLJWXWwsBNzls/se5Rk7tAWKfNK6ix7I1WUUwKqgMga+eUMsuhxn5EqZbfAFUsZ4iZI+t7Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/AbNNkn; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/AbNNkn"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-6cfd9f4d6f5so232236137.3
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 10:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780249488; x=1780854288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ISFXBkZkZECisL/zJWlMQKvCNsNkkqN/b3igeJTiU3k=;
        b=m/AbNNknmc/rkjgGXNhqV3FiIIqJr3BfzvSxG7KOxg9J0CRypEOj1Jdiu4VioERSaG
         89Wjtcv3woqcHypHcL0MToLRBzj59dB51rU4tTUIQf3EAVMnKGQplN4Gvd6hMus1Dfjg
         nNHjTCgMuSA03DmMSQQ+GHVU73rew17Sw9FoHUe+9gojnVnnOkEeoUQE6UG0JiYwAKUe
         knQ7Ne2O1pZjs0rsVxhqppOx/s1eIcJKMF7Zv4lsJjDjcS4QooqHGofxoh1tyiyHb7lq
         0xUz/BXRHXfzVqOKJ/W40EcWtw47bjXeLFK4nUyoolPSoDErCsmk+/gTk5JfkR6G9SWe
         AyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780249488; x=1780854288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISFXBkZkZECisL/zJWlMQKvCNsNkkqN/b3igeJTiU3k=;
        b=JePiNr89ET/Kj6AFBXBmjmnQDM3QvoeEjx6DDsMAMKm2UlBG7UsLPQxkiqjXqXQoYr
         xjbVapakfjvUaKVt96CQ0tgKyMgI97mh7ScJW+RxOPTWHsoxH3PSalV7KxUYPg4p/sWD
         6xgmi3nY/fTsgFW8G7Vl+t+te6MXOBSXXO43cGdGe4gdszPJ/k0Gav41JZssOGVgcv7y
         Gndt7ePgxGKjUMTLvyYmoIHLgY0xZ6igJbKnDAscQpxx67FQrRDX7Y/t3GGpdeStbTkN
         aU/MqraOG8bznMW2w3v4fGpBAWRNlWsQp8VtvLyh0ldg8cnFkbcRsVw0ySFv0AzPc+Hx
         Bb5A==
X-Forwarded-Encrypted: i=1; AFNElJ99gBi9n6JDuzCiYIPpZPZBF9e2NJNuzwe8yALEh1PX2nf7p4mR5ZAitH4IwIQM2ngPj4C4rsP3564B@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn3BUUAbFQDdrlSIx/0UVDKUeoQO8B01iId5LgNQ+dZ7gOJGsf
	uxJsSbu7ani92X0mvHRMuABJ3jyGdSnbVvt3FlpyJ4nDFmSzgVOjaoco
X-Gm-Gg: Acq92OF1EtGWFjROrWOBhN1bjlwgssrlS8sX4kyS3omOe4ZiITzljGN5GNireTvmGcA
	UC7G9acWDuFUJqms51ZqU7E/oq5xcXWEkVYDS3nVkWAaCp1lcHlwktSFESmxToolZFWUGTCotnE
	0N12QdhiSD1/xuNNjHbTwvxx3RdJ5sbNDglrCkW9vUNbyq7aD14Qe70bqhEIfuX5PIH1QYcLg5J
	swupwSCvUa7OzdW5A0nBrXGG1WQOYCDD0AVoY6AFFTrsh3OxwMYXn9Y5Dnm+raVQjKWwRB90w/u
	ITJS3Q8uKUVfujhlVP9J2ccpNtnaLNh2iPU+8b6qq5Xxmupc2eqF8F4+wptZbM0oWCMaDeAbuII
	U7pfgj+sdAjxLB8ELaLPNDCwtCKLI1ZPQgOItLpTzTGi6zDcKMkDGwnd53eb76Pu7Vvdb6r7mhC
	/AsJf8TEwdXRG+16jJNbuqX+LV2c6K2P3fWr9TJhxDrpQ=
X-Received: by 2002:a05:6102:c13:b0:66a:4052:3e20 with SMTP id ada2fe7eead31-6c6a850a490mr2615546137.26.1780249487642;
        Sun, 31 May 2026 10:44:47 -0700 (PDT)
Received: from localhost ([2804:30c:1f02:6000:8b59:7c96:762e:9faa])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963aba8b912sm4199223241.5.2026.05.31.10.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:44:45 -0700 (PDT)
Date: Sun, 31 May 2026 14:45:08 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Wadim Mueller <wafgo01@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: iio: flow: add Sensirion SLF3S
 liquid flow sensor
Message-ID: <ahxzpBcqN6o6q4a4@debian-BULLSEYE-live-builder-AMD64>
References: <20260530205435.37326-1-wafgo01@gmail.com>
 <20260530205435.37326-3-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530205435.37326-3-wafgo01@gmail.com>

Hello Wadim,

The dt doc looks good to me.
A couple of minor comments inline.

On 05/30, Wadim Mueller wrote:
> Document the bindings for the Sensirion SLF3S family of digital
> liquid-flow sensors on I2C.  The family currently covers the
> SLF3S-0600F, SLF3S-1300F and SLF3S-4000B variants.
> 
> The driver auto-detects the variant from the product-information
> register at probe time; the per-variant compatible strings exist
> for documentation and dt_binding_check purposes.
> 
> The active calibration medium (water / IPA) is runtime-switchable
> via the in_volumeflow_medium sysfs attribute and therefore not a
> DT property.
> 
> Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> ---
>  .../bindings/iio/flow/sensirion,slf3s.yaml    | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  8 +++
>  2 files changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
> new file mode 100644
> index 000000000..dc41120e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/flow/sensirion,slf3s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sensirion SLF3S liquid flow sensor
> +
> +maintainers:
> +  - Wadim Mueller <wafgo01@gmail.com>
> +
> +description:
> +  Family of digital liquid-flow sensors from Sensirion with I2C
> +  interface.  All family members share the same register map; sub-types
> +  differ only in the flow scale factor and the calibrated measurement
> +  range, both of which are detected at probe time via the
> +  product-information register.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sensirion,slf3s-0600f
> +      - sensirion,slf3s-1300f
> +      - sensirion,slf3s-4000b
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply: true

We could add a mention to the IRQ pin to make the doc more complete.

  interrupts:
    maxItems: 1

Though, I see the chip has an unused pin. If future designs implement an
aditional IRQ signaling on that unused pin, we would need to add extra
properties to the dt-doc to specify the number of interrupts each design has.
Anyway, documenting the IRQ now is probably okay even if we have to update it
in the future.

> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        flow-sensor@8 {
> +            compatible = "sensirion,slf3s-0600f";
> +            reg = <0x08>;
> +            vdd-supply = <&reg_3v3>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 06a8c7457..222a03b6d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24187,6 +24187,14 @@ S:	Maintained
>  F:	Documentation/ABI/testing/sysfs-bus-iio-chemical-sgp40
>  F:	drivers/iio/chemical/sgp40.c
>  
> +SENSIRION SLF3S LIQUID FLOW SENSOR DRIVER
> +M:	Wadim Mueller <wafgo01@gmail.com>
> +R:	Maxwell Doose <m32285159@gmail.com>
> +L:	linux-iio@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
> +F:	drivers/iio/flow/slf3s.c
The driver file is added in patch 2 so the above line would be introduced in the
second patch.

With the MAINTAINERS entry adjustment,
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

> +
>  SENSIRION SPS30 AIR POLLUTION SENSOR DRIVER
>  M:	Tomasz Duszynski <tduszyns@gmail.com>
>  S:	Maintained
> -- 
> 2.52.0
> 
> 
