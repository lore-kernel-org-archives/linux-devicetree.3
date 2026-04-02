Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F75317DFE7
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 13:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775137268; cv=pass; b=DZEzYTuxP1fv+JiXoeBiq5iACaaqEIp6dpYP8RQXksujrTfFu3EVhbURhO9uzGO7PYrTyL17d2u1BEfksUeVpXN307xTIyBYLF85GFb2BfyhCz0pD8dZolOeoGUNlFgYXoVMkRnrfZQPd2bM0SwNlPN3aO0o/6pp3eEl+sLKyaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775137268; c=relaxed/simple;
	bh=j31LenoTy1uKvnVqhIeRFwZCEF7f7Cchst3+394Z+mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kDorZgmOWRfwo+t0JjQm2f2j6S7sCIxVdFWeUiGy36+wswkOSkaBdkjyNKujKcAOBwdn+57XHKvNyAUKCam11nl87x6Q6RMiUkFWe+aJaPGYtp6TinPuS1hcpY6pVzk3wpNZi9r31nn3vSPAQxYkQvXCAyTaITH3HWfVF4B2+g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4NxVPk/; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4NxVPk/"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso848036eec.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 06:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775137267; cv=none;
        d=google.com; s=arc-20240605;
        b=OpeNUpkJmNU536u8RxI+Ywf5CX/gsJzFTmWrmSxBAAdb8J/r5Hc9S02UzYgyDMgAyU
         SAmp/qwRFuYiGGD5uuRUiw7p4pNH0Ln6eiBni/YU6N7tAUjGKTZbpIAsSCbvjp1UeHN+
         Gy/JOxK9FUfe5mL2R3S2N2MJt6Kr/xFGx6mv+wI7R5XmoKGwlTjpYavCtUpfgDbo+iLH
         TNrag8hl+Af1HEgcJcv3kiz2gO00Dg02yHZlz9tSlXPdBfWCvM1FHo/3ROa5MY4B5piM
         f0s32N16I/10q6WOt3mfR/V5BKMF3yRzSic5wlAEWst5nQT4eAvuDHXwcwaQXF2d5g5i
         OOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bzprnD2NwNOBSnHYwPc+3qZ075TLzZE8A65ElDi788w=;
        fh=hPZaVLy5eC1/wWzBkZFMgOA0hVs6l7hp4b9usQngk+8=;
        b=TKKSWL9HNTmTy56Ln0rCAZLuAHVnpYCtC+XNPG1AlFcSsIm+8YaHXH5xAgLSI4mWGx
         7OdL5FyPYoEDKnQhRKoaLDok2vzrxIYXUxB6xXe4k3+IxV0wXOjs1/ntiNI7J6IYn6vI
         4Z6hRJ+RennO8kIYoOgI34b0eAlKYzxZmhWs0iFsPCARyBZyzb7JNUajlalZ7k6xVUq3
         YaNHTxJtM6ZE1DrRqMUiW+SY8y4MrQ1iAV8yrJFK+2HEm6OtCReDpbhXqqhfhSWnMmgk
         lVKSac/+cjPaLudiZ7w0uAnuotQZp36SDEKqtthTu1qljXoFIxcLSqH8hIzCD8+M5gI+
         yALQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775137267; x=1775742067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzprnD2NwNOBSnHYwPc+3qZ075TLzZE8A65ElDi788w=;
        b=j4NxVPk/PM1awsgXhlfTfVYzAKhaJQNehx6pOV2xBxITHH41UhQl78uR/B0EkJhypd
         hbnNBew+l6HZNje03eJHF1H3n9ju1Xso16r3T79VH1VYUuCUejQ0Hq64vajrQT71n5Em
         scBp5WgoUIi1mAdn/g5JKLq6C92LRoLH3tR9zaAGD9UDZEBEsMaEkNvAWdDI43oarqiA
         0M2RTCyNuYj5GFoqNYI0GsoPpq8lqLYWMlhooJwuyy/KrJAbsrFe4iyDaMjI0JiquHZo
         tAmCGyomiH+g8N8+kmRbY4mFD5DGH6v1GBb0JfFhoiXjdqSTgN3CU7N+STVTUd5fCjrz
         QFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775137267; x=1775742067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bzprnD2NwNOBSnHYwPc+3qZ075TLzZE8A65ElDi788w=;
        b=S9NjNCAVVG8khnYSY8Q5pHVzXqGsmn0zdPeeoUvxaEIJYhIoGZYhukw5yp3s9dEmk5
         11csT/71sVxnnyXoKx4dzd35GtcXv6r08CHOGMvAqG9aeZKcQo0zZOWFC23jpnYpiGrP
         FFchWqhH2i/qsJIF2s5RqdsWuPIqkzbyIARrHz7bzHaRGOBxSsZWgMKgS9oj2c1jGZcR
         qJrlQ/RSvYuCzoXMfIjqoBRw1PlRR7a97U3p2Cx1itmAZZKYY0LK2ZHtH8AEljIIyaMJ
         YUK63nYpkfDbKf5tVdcKEc8F4XQaKRZhCcnZJ8nBexpXk140OfzANFa+U9bDDX8qWr4o
         T0HA==
X-Forwarded-Encrypted: i=1; AJvYcCVMMDb0cNKllMUYgWIz0fD1TLS4t/Z37MClSATD+qQp/nuo6/QrziNc1/t0DC9cRUJKsVRB7h0o/T4q@vger.kernel.org
X-Gm-Message-State: AOJu0YzR5BeaZxtw1vTF8gO6qh+TBUM0AK5i4VtIzl77oSy+oiVd4Xnm
	ejTWBbchjHU2NIpZUcc//1k1UDIoNE+HxpXHx9m88V16daOMROvV+cGQQFPKPy4XgEExjtUFazT
	okayy3BK82IWEwnhDjAUYXH7744DrMI4=
X-Gm-Gg: AeBDiespvr0evjDHjh+7/3GuyVvZOQUOnN88NljQE5P6s1mOyGGPdZS+dewAUWKEiaP
	X55JLOWLtaCyU0H4VujJGEyb9Agewc+e6yFlB9Q532bYIMlpYYI7TKGCdEwwBnBF3GMfCxCxQmt
	WP12wpSA5o5hQ7HoPeyQ1+gntmHDEcOrg7H3isg5F3Ps0LFXVcEFGRXNSsY4NZbSjDmCB9fKco9
	DyvpO4wo0oNDMYlbMLRZ7G81n/XCoBleKqynoJR+OeyVG/hJbtVSx9VFd4GLhAA0SR1mIMvSGvl
	n/M3Ug==
X-Received: by 2002:a05:7301:f83:b0:2cb:4b8f:b2bd with SMTP id
 5a478bee46e88-2cb4b8fb38cmr464544eec.6.1775137266531; Thu, 02 Apr 2026
 06:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330102345.37065-1-Ashish.Yadav@infineon.com>
 <20260330102345.37065-2-Ashish.Yadav@infineon.com> <177487146147.2070608.2849563543220120287.robh@kernel.org>
In-Reply-To: <177487146147.2070608.2849563543220120287.robh@kernel.org>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Thu, 2 Apr 2026 19:10:53 +0530
X-Gm-Features: AQROBzDpt0f9VPS6lmST0qZzeJ30vGsEijfXAAYlIHDTMAUfdpzcYnc60p6UGko
Message-ID: <CAJKbuCaPxeFdc-Y4XjRoXy=Ck6Ne6j1c0TJYmz0bmn1GqgWwmQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Ashish Yadav <ashish.yadav@infineon.com>, 
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Thanks for your feedback and time.

'make dt_binding_check' issue is address in:
https://lore.kernel.org/all/20260401104550.115715-1-Ashish.Yadav@infineon.c=
om/

With Best Regards
   Ashish Yadav

On Mon, Mar 30, 2026 at 5:21=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Mon, 30 Mar 2026 15:53:44 +0530, ASHISH YADAV wrote:
> > From: Ashish Yadav <ashish.yadav@infineon.com>
> >
> > Add documentation for the device tree binding of the XDP720 eFuse.
> >
> > Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> > ---
> >
> > This patch introduces a YAML schema describing the required and optiona=
l
> > properties for the XDP720 eFuse device node. It includes details on the
> > compatible string, register mapping, and rimon-micro-ohms(RIMON).
> >
> > The RIMON resistance is installed between the Imon pin and the ground
> > reference.
> > ---
> >  .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 52 +++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infin=
eon,xdp720.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/h=
wmon/pmbus/infineon,xdp720.yaml: properties:infineon,rimon-micro-ohms: '$re=
f' should not be valid under {'const': '$ref'}
>         hint: Standard unit suffix properties don't need a type $ref
>         from schema $id: http://devicetree.org/meta-schemas/core.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/h=
wmon/pmbus/infineon,xdp720.yaml: properties:infineon,rimon-micro-ohms: '$re=
f' should not be valid under {'const': '$ref'}
>         hint: Standard unit suffix properties don't need a type $ref
>         from schema $id: http://devicetree.org/meta-schemas/core.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/h=
wmon/pmbus/infineon,xdp720.example.dtb: hwmon@11 (infineon,xdp720): infineo=
n,rimon-micro-ohms: 1098000000 is not of type 'array'
>         from schema $id: http://devicetree.org/schemas/property-units.yam=
l
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/h=
wmon/pmbus/infineon,xdp720.example.dtb: hwmon@11 (infineon,xdp720): infineo=
n,rimon-micro-ohms: 1098000000 is not of type 'array'
>         from schema $id: http://devicetree.org/schemas/property-units.yam=
l
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260330102345.=
37065-2-Ashish.Yadav@infineon.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>
