Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B56D477E4D
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326703; cv=pass; b=kySWRohgggVaFlfHRLuw2rMWyprPXfo0ok6wm0EunyNNPe58+bI54oLzAVnbiUoXO79N26/oEZGj/WjBvVUoCuHxAImNhXLdnviXa8S+KHP09ESPqkS56ydHLid6Py77Yc36cbK+WlCQWhQ7w0w3ofENynVsAWQGb+3bQP7Pklw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326703; c=relaxed/simple;
	bh=tJAIP7ku+ZxB+r28vhmLkgX3mbVwNmbhgQohrHSueZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UKsMRoNdzNH1NiJ8tp+YEx4buRobuRfygpg9b3s0RU0f/jUS0f+8rX/BPhs5rjzd9WI/2PXcyqW3+Hf5mtcsmiN0p5g6U0xPTFSMaSD8Bn610dd+xks0ii9UlZ5PYvv83cQNSwmJ9euXTe7GfwcJpF8LzhLhY2RJXN8/kn/H7ZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7YWDonG; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7YWDonG"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aae90f528fso756817a12.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 01:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790326700; cv=none;
        d=google.com; s=arc-20260327;
        b=G+0ze4NGgK7xMvBELF8c0CkkzM0/xx3yMoioRk7nD/fdQYjNyonDFuW6JtiDK9bGws
         rNFL9aOsXHPAdQrSiXNLKaJPqwZcRhtzMYKYOvFCqpEST2j/sp4WLnYXrRjUgyJhcqaK
         ksyZ1jFUSgsQyZfFUuBeFCFh71XVdocRenLzL6tu6lw7gbx+guIkiifHl+a5k+B3uxdO
         9VUfmGCBb20D0YfN0WG1Uoc9rkoifwoFnR+TqHFxzQ4i9KqFZDZ/Dnor4o8+RPqRUtbH
         gTrEYfzHxF8KDNYnbpKJMRjE1PebNmsHpIhjvAVNugpX+2TzZQtpsTF7Myz5SDYo0E0b
         va1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ehsnNAs5lqgd+jMHAHbLYiglcHWM9eLT3Pf26YZWoEs=;
        fh=ksateVOVswzl0Y72sA4EyfhcZbPRHhzu6kH/TTUwrrM=;
        b=VSc9kq/JZHvQcrTmtNxhHlXzp/QZQPUDK6BI8oSPaXBojpeibw6PU7K9ljE2Vy/GeQ
         wgFuNPIESzZhnAVERWNonIQSZ3duveBNvPer9u1wm58yHRj6C06mwv0SMcj/hAdj8HvR
         o4X4k1gjYwomUVjg7PNlDG6s2zV6cYH7Vub7Zr+SWL8Ikvkmp9/Fs1ZBvi4IopsVWsy6
         trBsLNEhZyCqzsrL4WUKOLEJcqTXvdy4xKSCm9apivLl/WkZQtxT82zaT2GQBb+9EzQ0
         fpTz8WHic55B6jMTbom+gmDNUwWUq3WQM16n6tljJKMjbtbVeaYI4132MHXdl5Bx4L7z
         k32g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790326700; x=1790931500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ehsnNAs5lqgd+jMHAHbLYiglcHWM9eLT3Pf26YZWoEs=;
        b=r7YWDonGcyrse7m0prdv4iRrxzEp7SWmCby85gxHgQz5oXk/gdG8U6kEmbgBTsqChR
         w/Id7Us2Q3wkGhZSe2D3Uojrn9THLOef+t6s4m+8jr5K/6f//zUpxJ7HZISrRKdFzZT+
         NybEqsA10jiZy9VMPqW/HW+TbCgLIyaKwplIeD4inyBzozh8SAgt8AUjTinf8c/l6jn+
         liGQbDEXkoL2O+SXw8++E6E36HWb2r2+aYbWI7O3pvppmMRb+fnFnHHb5wzn3N/MwdQ6
         t3WCWzrYasDeSBOPXfLKvjzkQcVi1J9EssZWwMdf3h+vRlKhOsZlmOCGU+pK/+io3gLV
         5/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326700; x=1790931500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehsnNAs5lqgd+jMHAHbLYiglcHWM9eLT3Pf26YZWoEs=;
        b=JOIIJbGJyk4gv5LPoYZzkC426hASYXJqS+UEu88TrWMZw7nDpVAGMG0Db6puHyXC0u
         AAMtdzhimiwCp/4XIWTiOfvpcD+5d0dozXDv5d514tvDw6SOQimzC1/Gqo9CFPX5R5sz
         PliowzJr208tT1Y1/Jfs2DkY6QcqVbmC+9AhYpKTyP0iXiqCQfJBRc/0W92Z+FnOnwYb
         n9zgGwsUDjkWcjmBLoGRfNlFD7m5sXdaOy3Wrc6X44xMt1X2zMM0i+B/A9s0KaamGz6+
         HoVorwUg9ySw+D32R1N90JaSWI991M270qbWX+ESm/mVBqKhJSmdUkuj9SlSm+mb4Tob
         l/Jw==
X-Forwarded-Encrypted: i=1; AKwUvBzioaDUYnLgx/gDdvXXDobwlWxlGvNbopjWPAwImmmDFEx9WrLu92WAeMeS+d9d3gxO1AR+Yxwn6De6@vger.kernel.org
X-Gm-Message-State: AFuF++nKIxPB/FpeFyhNidcZsVNhkd3CneijVrfmpw8zCCuPC0dI7bCU
	MVW5BzTE0mueX7L9UqaKYgIjglUGI4qMH6O0pfCHVR8zQcJzSYU4hZK8W4/VxaC67xZuqWYolDq
	MMXqyegESHnq1lbvU/SctewAR7IJNHvk=
X-Gm-Gg: AYBFou3/Poul5AaMDjPi6RyZtxTV0OkTwgQJO0qY8yqbZ5t6rXo7QyE6egyfD0aevx7
	vr6fSntFi1lyWmgeqxhJcrsYlw4fWz8/2rxldlMZLbdZrfQnV7UiU0K3n/NEVOD/X6XCYX0iYfz
	vwT364/M+DDoz4cZzzhd73ZpRv1gbn3UWcp7zQy0ZDSQLUGe09u5gg3QNTm39jt19KYhBNQNHU6
	Y/ZbEmtmmv5/WgReCC4LDlrDEEslRRrVBvrmbuPG1MsL0Rfjn+jn/HCYChTcLKEh6JHjmTc3yqJ
	kWaVfhERFuoUtkOvXZVWG5heBPeoH62su/E34pJizWv8R77acPJazME=
X-Received: by 2002:a05:6402:23c7:b0:6a5:f9cc:748b with SMTP id
 4fb4d7f45d1cf-6aac8f41743mr3736862a12.9.1790326699532; Fri, 25 Sep 2026
 01:58:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923201035.51007-1-maximpedraza@gmail.com>
 <20260923201035.51007-3-maximpedraza@gmail.com> <179025038211.3068273.9854294306608483193.robh@kernel.org>
In-Reply-To: <179025038211.3068273.9854294306608483193.robh@kernel.org>
From: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Date: Fri, 25 Sep 2026 10:58:08 +0200
X-Gm-Features: AclHuK8UoHGNzTIzOHVGCymE1Tu15-rHTqYzXC5JvMhzujI-l5PLt4dMq7Zlh-4
Message-ID: <CAEUXW=Gh6wMk1i=x_KT0eSdkHeHs8Hkxkj4hfsuTRyY6=aphpw@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: display: add a device tree supplied
 boot logo
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, linux-fbdev@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

> Documentation/devicetree/bindings/display/boot-logo-clut224.example.dtb: =
chosen: 'logo' does not match any of the regexes: '^framebuffer', '^pinctrl=
-[0-9]+$'
> from schema $id: http://devicetree.org/schemas/chosen.yaml

Expected: chosen.yaml only allows framebuffer nodes under /chosen. You
closed pull request 204 until the binding settles, so I will send a new
one for the node as it ends up.

> The base for the series is generally the latest rc1.

Noted.

The binding is going to change, though. Thomas asked for the logo to go
through the DRM splash client [1] rather than fbdev [2], and that client
takes BMP images. Before reworking it, would a BMP in a property be
acceptable to you:

chosen {
logo {
compatible =3D "boot-logo";
image =3D /incbin/("logo.bmp");
logo-position =3D <(-1) (-1)>;
};
};

with memory-region as the alternative to image, exactly one of the two,
or would you rather have the pixels described the way simple-framebuffer
does, with width, height, stride and format? The BMP keeps the kernel
side small, since the client already parses BMP headers, and the header
gives it a size to check against the property length. The raw form is
closer to what DT already describes, at the cost of a second drawing
path in the client.

[1] https://lore.kernel.org/dri-devel/20260510-drm_client_splash-v3-0-a9aee=
9f0b2fc@valla.it/
[2] https://lore.kernel.org/all/64e273d4-2660-437d-8871-e2bfa3c377c9@suse.d=
e/

Max

El jue, 24 sept 2026 a las 13:49, Rob Herring (Arm)
(<robh@kernel.org>) escribi=C3=B3:
>
>
> On Wed, 23 Sep 2026 22:10:30 +0200, Max Pedraza wrote:
> > Embedded products frequently need a product specific boot logo. Today t=
hat
> > means pointing CONFIG_LOGO_LINUX_CLUT224_FILE at a different image, whi=
ch
> > bakes it into the kernel image: a change of branding, or a second produ=
ct
> > sharing the same board support package, requires a separate kernel buil=
d,
> > and requalifying that kernel for what is a cosmetic change.
> >
> > Add a binding for a "boot-logo-clut224" node, which carries the logo
> > in the same paletted format the built-in CLUT224 logos already use, plu=
s a
> > few optional properties describing where on the screen it is drawn.
> >
> > The node lives under /chosen because a logo is configuration handed ove=
r by
> > firmware rather than a description of the hardware. Open Firmware, whic=
h
> > the device tree descends from, carried a boot logo in the same spirit a=
s
> > the oem-logo variable under /options, and simple-framebuffer nodes live
> > under /chosen today for the same reason.
> >
> > The palette size is derived from the length of the "clut" property rath=
er
> > than spelled out separately, and "data" holds plain palette indices; th=
e
> > 32 entry offset the frame buffer layer reserves for the console is an
> > implementation detail and is applied by the kernel, not by the binding.
> >
> > "logo-position" takes -1 on an axis to mean centre on that axis rather =
than
> > carrying a separate boolean for it. A boolean can only centre both axes=
 or
> > neither, and next to explicit coordinates it would have to override the=
m
> > silently when a device tree gave both.
> >
> > A rotation turns the logo, not the screen. "logo-position" and
> > "logo-offset" are screen pixels whatever "logo-rotation" says, and a
> > quarter turn only changes how much room the logo takes up. Placing the
> > logo in a frame that turns with it would make the same pair of
> > coordinates mean different places on the same panel, decided by a
> > property that is meant to describe the image.
> >
> > Every coordinate is bounded. The kernel clamps them anyway, since it ca=
nnot
> > trust a device tree, but a value that cannot possibly be meant is worth
> > catching in dtbs_check rather than on the panel.
> >
> > Signed-off-by: Max Pedraza <maximpedraza@gmail.com>
> > ---
> >  .../bindings/display/boot-logo-clut224.yaml   | 135 ++++++++++++++++++
> >  MAINTAINERS                                   |   1 +
> >  2 files changed, 136 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/boot-logo=
-clut224.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/boot-logo-clut224.example.dtb: =
chosen: 'logo' does not match any of the regexes: '^framebuffer', '^pinctrl=
-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/chosen.yaml
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260923201035.=
51007-3-maximpedraza@gmail.com
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
