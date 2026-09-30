Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839804A3D3A
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765821; cv=pass; b=XWZ1iMaa7GcyuRTH9/l5IwIax6XIeu4DKzYrxX4lrt8vcVecuSzGLMdeQYUXFhO7kZxkLl3fuuBZALBb76n0n0UKUJXpeEUo3svUC0D/SnOBsP5Iuif7f1yOJ5h3+zRkuvQRGTdnh4+KyJZw/x1aJ1xhS+X7WnmL9VFf+Sjd3w8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765821; c=relaxed/simple;
	bh=XcbWL0nrpyuw33WpWCVIaEEAxdeZN3j0ShZSAAf0IvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlniWoJN8lv2x8LwVX2coL5clUiWLxaty6icuzK0lI+2wooL9eN1PXnKpVB8Qro3KYIuG8AZuzErEDpvmQlPy89FxyDUNLDj81cATGtL6W9LP0zDuo6rysaWOI6u/1QpmjswiLtwMtKo3Uu3/c8nW32FOxuXtTbHEoFRRHDNfC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rybekjI9; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rybekjI9"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d0522b4dso7955994eec.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 03:56:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790765813; cv=none;
        d=google.com; s=arc-20260327;
        b=MCnEF/iQdae5uM4kqVF1hgQXmkKe8PEeivXcKBD6oNwzcyUzsyMWdE+QdGwMybM3za
         KxcY0MgWEmnc9dzvEug+YhSLw3SlwjdaLIm0jxxZJX9dv6M/dNExWc87/aWYp/6lz2C8
         pXTkqZhKEhT1QyekBV/OuLV27EEWozqHaneT65KEsfFxPAE3djnPD6Qj/EQmPxk4hq+K
         e85dCBTLRHRBcJ+bWnMSjYXd+g/OyRc7CSSJNmd5kjyy5pTTM57dKIjHsIhWv/kplsnL
         HecWdHQYPIs4mbH0SWn/Ujn6zlmhKyBorfEwVga+wRT0c3xQb8M6n/s6iXl8R1HH63vg
         W7/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9e1cJ5TO1cnYCQwoGNWZgRp51pppadHuJRrjli9Xnp0=;
        fh=t9vUZubn6DO8k9kU6fnnie69T321F52MUIccdyI+VtU=;
        b=EDoNA1Pm4jVg5G8Kt3OT3YlQ/5l5N2buRprMbVOWi7JwFjIdMIXpx1Cq2x7+hR8wBB
         CctF0as49IAyePyQiySU4ex/o7hSPEyUe/Xn+G/R+K20JqnM619XaQy0B1VQnD6z2TKK
         6E4hk94jSk42covob+L5fathPiFAv2HAeVuz/GTmfXaOyfDvx4rhzxF+ZxMozIEl5Z1b
         UAWLJXPegSAsBnDnxeM3fTPENpAnV746+A/kXvLugw2lD6EvUSRJjEQLg2rf63DqDkRO
         q3JKiRnXunn7sezBn11wT39ihlO5zmc+VUeR9kFdgjshSO9NwdJrbaPDemGbneMtHFYh
         rN9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765813; x=1791370613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9e1cJ5TO1cnYCQwoGNWZgRp51pppadHuJRrjli9Xnp0=;
        b=rybekjI97RAVJGUiavX981Z73wuvlnlE/zrBODzwCInnQOwdhPlISuQ5rLl0FIPb85
         NS0FT+J/EAfjMdLE4efQfweGTUVwKjo+74cUPrWUT+QxkFgLD5E69TLxatvrCwnfajvv
         hE6PTIb2XDfEZzJPUKyrrJBilupezt+kToq6FhhJiKkNxQv6jmyvbJ1QWF4k9xwW4gYz
         45viYHNdfLBhRhAlFZ48YCyZG/aTbCBI1TKl7upDs+Zs6JEZP53FRNybEHavT1SKCLWK
         Cwx2iAXZJQNxVscL1GUC890mkO8vPNhu461SOo0EH7a6aQ/+x82aoOvCQMse7Zl6T95D
         7lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765813; x=1791370613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9e1cJ5TO1cnYCQwoGNWZgRp51pppadHuJRrjli9Xnp0=;
        b=jgHmlhuYfcc/EGe9CszreXfcyjQs965IRRaESNkNAa3n2t/Tju9O7nkoxQhOGekTcU
         2s73wxZqOHaig1ITMjDL7NXhMt8/GtPmfIomxZD1H5BFQK/3HQWh0n2pqa7BHb6Rs6fJ
         d2MvUjRoqqhSU/3f2ts2Xu9vTPw4Xbe/uUstffAiBD9DfHZs6afkB4HzAr9rATeVVDH3
         oRemDyp+tBSEsXivFb5JJmTe4UH66EG9WptQl3dlADpe6aiZrUWyPVevreYbXoyFp6N1
         UGCAwih91mlFQaLe7ZvrjvTryfhIBW01Kssh4Wssy/5VZynj0MSUbQwxEBgYp948/ROu
         xOzA==
X-Forwarded-Encrypted: i=1; AKwUvBxq736cW3uizfBL/WrTtJm4FSGgid8yQsjiOGIXVnejJSk8KXDT1Hq7zM4FHAOtmkz7ww4P2T7V9pDK@vger.kernel.org
X-Gm-Message-State: AFq9FYLRJIFCq/Urv0dqiAqdEUR2zQwZ/AURNAy1cTI5gRFPl5aMDenV
	P7t5VWhtyHMnGi1xiv+2S7SpJ1QTRESiJm6gyfzV7dS5dCLxOCiRbDTcNYy2O39cpJo9EnSnnbv
	wuzfHOgpuMdVC+IHvFwJvKOciopYqqDQ=
X-Gm-Gg: AYBFou0deKpHGAV0Pe60d/GaxXu2NDS5BIxOZ23N4WDOLMT9ZN1z1D0Cd1z9t9HK0Xw
	WxvFd4Zy/zaOsAPK0Rl8BQT2V/OdrnvJjR041iKUZDqxV3LzHC84EUGi24kAiSEVVGXTz2P0IBV
	LizAfHSSSDmPaJxZrhFsB0w7CN1ktR9scH+QI1q3c6+RQEStPZTDfRblcMNNnZCenI/DjmDUlia
	VQAn4+mh/Lu2mXHQtxJds5GL1FVjmSqqrPXuETjcmNyFPHShOkY7yTJUhrQ9S3xFKhaZJbMa2Bv
	G1QtuAgYPaIL4G3TYPIJhAsrVbQwYQhNf0+E5siLvUD/fo1TI6y7I0/kD32e+t8fbWcggYNXjIE
	xLZfTsAcLIBPwP7hnk9UlKrM=
X-Received: by 2002:a05:693c:42c8:b0:33e:a0c3:4163 with SMTP id
 5a478bee46e88-34cdcca9e48mr1323411eec.24.1790765812417; Wed, 30 Sep 2026
 03:56:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <UJZ22UtaS1GSRPlyAst1og@nvidia.com> <CAPVz0n2F8LBqFs2bJERmgvdNYgtt1OEVtK3++CP9y0gxW7gCGA@mail.gmail.com>
 <arzn-TNbOlqXqQgd@orome>
In-Reply-To: <arzn-TNbOlqXqQgd@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 13:56:40 +0300
X-Gm-Features: AclHuK9oLMebZiHh4azYE1DFmusVvYbZfHXPOcFGt1h-TD62cN-nNm6dZ6ICVfc
Message-ID: <CAPVz0n33c_uwfhsSguEfFfJ3FV=26SPtNTEpHes9f5RjnPDA_w@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:50 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 12:52:18PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12:19 =
Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wednesday, September 30, 2026 4:05=E2=80=AFPM Svyatoslav Ryhel wro=
te:
> > > > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > > > Tegra20/30 SoCs display controller.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++++++=
++++
> > > >  1 file changed, 138 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/tegra=
/nvidia,tegra-8bit-cpu.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia=
,tegra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/nvid=
ia,tegra-8bit-cpu.yaml
> > > > new file mode 100644
> > > > index 0000000000000..f0dab608b2936
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-=
8bit-cpu.yaml
> > > > @@ -0,0 +1,138 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-8bit=
-cpu.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +description: The display controller in Tegra20/30 SoCs features an
> > > > +  8-bit SPI interface that closely resembles the MIPI DBI Type B
> > > > +  protocol and is referred to as '8-bit CPU'. Each display control=
ler
> > > > +  provides two such interfaces, which can be used to send MIPI DCS
> > > > +  commands to initialize and control the panel while image data is
> > > > +  transmitted via 16/18/24-line RGB.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: nvidia,tegra-8bit-cpu
> > > > +
> > > > +  dc-gpios:
> > > > +    description: Data/command selection pin.
> > > > +    maxItems: 1
> > > > +
> > > > +  rw-gpios:
> > > > +    description: Read/write pin.
> > > > +    maxItems: 1
> > > > +
> > > > +  cs-gpios:
> > > > +    description: Chip select pin.
> > > > +    maxItems: 1
> > > > +
> > > > +  data-gpios:
> > > > +    description: Specifies a set of 8 gpio pins used to transfer d=
ata.
> > > > +    minItems: 8
> > > > +    maxItems: 8
> > >
> > > Based on my admittedly brief research, according to the TRM the displ=
ay
> > > controller can drive all of these pins - of which there are two fixed
> > > sets as you mention - directly. So we'd need to describe which interf=
ace
> > > the display is connected to in DT, but not any GPIOs (which they real=
ly
> > > aren't).
> > >
> >
> > I am perfectly fine to not expose any gpios in the binding, if this is
> > preferred. Only question, which method of interface checking would be
> > preferred. I assume if primary then nothing, if secondary - boolean
> > prop "nvidia,secondary"? Feel free to share your vision.
>
> The driver currently uses the GPIOs to program DBI commands, so I
> suspect we do need some way of controlling those pins. Or is there a way
> to have the display controller program the pins and send commands? That
> would be much preferred because it would more accurately reflect the HW
> design and possibly also simplify the driver because it doesn't need to
> parse the GPIOs and then also not use the GPIO API to set the values.
>

From what I know, GPIOs must be used and freed after use. Sets of
GPIOs are defined and remain fixed for primary and secondary
interface.

> As for selecting the interface to use, it could probably be just a
> simple, single-cell value with two valid values. That's a bit clearer
> than a boolean, because with a boolean you need to explicitly document
> what happens when it is absent.
>

I can describe boolean too, but if you want set it like "nvidia,head".
Fine by me.

> > > > +
> > > > +  nvidia,init-sequence:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +    description: Device specific set of values used in DC DISP_SPI=
_INIT_SEQ
> > > > +      registers.
> > > > +    minItems: 4
> > > > +    maxItems: 4
> > >
> > > And AIUI this is panel-specific DBI commands the display controller w=
ill
> > > transmit. So ideally the display driver should receive this data from
> > > the panel driver.
> > >
> >
> > This is not panel driver data, but it is panel or maybe even more
> > interface itself specific. TRM has no clear method of generation of
> > this seq I am aware of. Maybe I have missed smth. These 4 entries
> > co-respond to DC_DISP_SPI_INIT_SEQ_DATA_A_0,
> > DC_DISP_SPI_INIT_SEQ_DATA_B_0, DC_DISP_SPI_INIT_SEQ_DATA_C_0 and
> > DC_DISP_SPI_INIT_SEQ_DATA_D_0 registers of DC. Maybe you have some
> > info to shed some light onto method of generation of this seq. Then it
> > could be simply removed from binding and calculated internally. Thank
> > you!
>
> Even if this is interface-specific data, it is still defined by the
> panel that's being used, right?
>
> As such it'd make sense to integrate it into the panel driver and have
> some side-channel to feed it to the display controller. If there's no
> good standard way of doing so, having the display controller read it
> from the panel node and programming it at the appropriate time could
> work, too.
>
> Thierry
