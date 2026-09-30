Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D094CCDCE
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769401; cv=pass; b=m/cWkEUTb8HPyJsw9KvAyFAwn5VZovtvMo4g/KCPh21S9s71sog8ug627eMUA9ThBo3qrdjtCH5EtH/SMOHHZgIIK1DpYvKDZPUlWQ71jjW0TUbeAt3rGcEDaXhAH+oqgld072Oe+7MEG/kIPDz4hxqZHVaIemmL+ZSbhq/TBhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769401; c=relaxed/simple;
	bh=rv+dzbO6L5HwhMD3iGr/BBvwxIAcXGr9izjWAdufBwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=doBfU+G6lckigKpOtosrUph6eponXcF4c4jTUIFqisjCuybZJCQP2BFscSflpauOp8KhCWN6gKQp4fTBlKVxFFGCu4120bWKuLgA83gzVlLTnr5HSfBws1lMMpD3i+Ni7JgPoYKk5CZ5qKZEqGdZtT7BnHtF6I7c/JtMiE3da/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoTATub7; arc=pass smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoTATub7"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd046b87so3852994c88.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:56:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790769398; cv=none;
        d=google.com; s=arc-20260327;
        b=FE3Qy8ZdxGOLk+wPA1ei7CBUPSVOgvvSi0OWoEYJnfunbGe4+9wkxflBgTtd8/bJAj
         /NjX/tYzp4klb36azcoHXJdeNAvi3/YuDkSrhJvEoa8AwJGk7OqH9jilxrUGJpumAVLQ
         E+gH3dbp0qprHA1n2QMFTNGnOdMhlfoc6voiT/Wav/fnmXY5G8KTB8LV2PPMMtkGZ+KK
         Rbhq45YAjJTsy90M9ELzTmC91iYDjSsNLF88JiJ/Gi8L0/vzFHZO6dlRux1sAtor0ZAj
         Bj0SXZexksN3U9Er9BS6vKVfJitcxxrSvonqiZcRBVks3Zydh8k+LX0tHwmtjqgI9O1R
         vUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yOi1xGJqgS9LzwvMIA8Rqod0f0w6LITZ2YMI6SsIEdk=;
        fh=EXQSLVd4qMPqVwQutp/wBLzbra6iyaLpTFefZ7sWcrc=;
        b=E6XX17aNFxf50wSUROPaCjv5DlVMWshKJIJOdxsOYxF05/U0Y8zLN9aNBn25VhOx4J
         KT5Hz5i2zUZlO8QIY3bsMCldQ4VpU0c/tlvaj+DneCkheoKTMslmL0CF0Yh3UILWShk4
         NEjSyM4+35RPGK3beRMJmDcnoLfhThcxRhanrvRjhcyIlHmBFGOnX90a7pzD2Hd++B2w
         +Mule7JAu+Gbe5a9S4rBTLfjz7AIJMDAPexO9aKShJ2rOxpfW1wE1q6Hd0C+xa7LcHc0
         s41QDNLpwMh1QMruzeDqbVPYmL2TAU4a7YTsvqaqMsR+WEsKVuEWq0Ctq0DhPXWryE22
         0bKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790769398; x=1791374198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yOi1xGJqgS9LzwvMIA8Rqod0f0w6LITZ2YMI6SsIEdk=;
        b=GoTATub7KfzRD+oJxrsUE7XrIaAGmGWj6f6+2CEteteYcO+MJrOUVrynM5wFCTQ7Vy
         bl2FlHiz7u2jZMiMjtXejRGM5Z6ROCcdixLrHJTmJZhzwPdcmtsS2nraItegsRfJhyE/
         5+a+xGja3DPnGZKLP0zH2UnYFkmHkrjZsfc0SVYv90yQpmPEZNZwZSvW3WgnAqCj1pMn
         I2Pd5QsKfgvTitUysQFM8G9N4ntdSsOx7+MhHHLheuF4+HT47rL6lFaSRZlsu+i8m7sm
         UmdlI33/ZZeFuiBMea8RHJRHm+XHLbS/UV4SJhKnYUhESKltFQJapV+YXQBrVE1UdOO3
         8mjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769398; x=1791374198;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yOi1xGJqgS9LzwvMIA8Rqod0f0w6LITZ2YMI6SsIEdk=;
        b=0pQaPT/75faR/YcMU2Laduby8yX4K8FNBP7AwB4+3IpVzd3XHVwU1BOqYDe9gx1FeM
         +Jxqjs6rIaoHRlwXrgc7zxgXn2AG5hr9qQSZfPpsUQdPUjI/awtwGqL8zbZR6Qpp/eRV
         /RPmDnsU1OcXkmOGiKP1Aw4HmIf3i6qGQsXJRst6Vo0JFvAuVhlu1wDp67rBeqD0aXfX
         C480jX32s8Eno4CGjzsX21rNx6uGbnKNQmv3Uz8yXLStDxC6kUmTqgyTS9W9HmEwq0zN
         5X1XvCoS3Yq83p8dJDZxIFJFE84r2LVDYXJ4I1xu3KO51NhB8e6TRqtAUXqgiX3lqDbq
         otuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyVIH1ISunsaWsLCR/uGlaRjuG6griVzwc+MK4dMTNjwl0U9aSdNP4lfwEllXunbmDqGYAkzUqUw//@vger.kernel.org
X-Gm-Message-State: AFuF++kZcQx7aHuizA5/V2Es8PglpMOkpK9l2OL/eODfDJtgOlUXMs4/
	JsdW8z/VTRGYd+uleFdY1T9AGMQ33kMSdNsquE/PpGfLlDgrLTHo5QG0WbxJVHK5Yk082OlP9DK
	IZTNp9kdxziagl9x1phtH8bV3Baed2KU=
X-Gm-Gg: AYBFou3y2DyGTtHcI+uBOC/y5zrCqIHoThkCv8WB9QtaiIrm2fS+sOZxgmD8onmscGA
	9CQNTyJThpNBrsgKYJz/f5eQeqwA9+kbIwNh2fQqgqF3STiSvkqeHIgdj7f19LjG5tQUM8O59N0
	I4h+lLuvUGyCtq1cpSjHRNtXoDrpzL9llVHa+TFmKOQYeOE8lPxFkt7P1ijV8zp0BqXXn8/32hN
	WjyAK8/CrazxVpPNDb4ya+fxcpQBH469D2e84ftjkObU8/lHrMSD4pFFPn1zWF9nSlFVlgF+jli
	+uE7kaikqz/SnODE/7cIR7pOWhLcYLhDeA/iBK5g/IgfYpFt02XFU2qIIhMXDP2RXn4pif3QgMG
	mgmU1K0lJ7SPk
X-Received: by 2002:a05:701b:2611:b0:144:d792:8be5 with SMTP id
 a92af1059eb24-14d33680cc3mr1029225c88.42.1790769397896; Wed, 30 Sep 2026
 04:56:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <UJZ22UtaS1GSRPlyAst1og@nvidia.com> <CAPVz0n2F8LBqFs2bJERmgvdNYgtt1OEVtK3++CP9y0gxW7gCGA@mail.gmail.com>
 <arzn-TNbOlqXqQgd@orome> <CAPVz0n33c_uwfhsSguEfFfJ3FV=26SPtNTEpHes9f5RjnPDA_w@mail.gmail.com>
 <arz1wzEI_7e7ruKi@orome>
In-Reply-To: <arz1wzEI_7e7ruKi@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 14:56:26 +0300
X-Gm-Features: AclHuK-jagRAWDSvA026O_Jnox8tuvSOQdVM_QI0nIj8TPkLU1ik19zpdv3Pldc
Message-ID: <CAPVz0n12oiuc=5wjeNCuNtJpe-M7Ys=rHn0TOExc0qkweVQnuA@mail.gmail.com>
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

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 14:46 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 01:56:40PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:50 =
Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, Sep 30, 2026 at 12:52:18PM +0300, Svyatoslav Ryhel wrote:
> > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12=
:19 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Wednesday, September 30, 2026 4:05=E2=80=AFPM Svyatoslav Ryhel=
 wrote:
> > > > > > Document 8-bit CPU parallel MIPI DBI Type B interface provided =
by
> > > > > > Tegra20/30 SoCs display controller.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++=
++++++++
> > > > > >  1 file changed, 138 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/display/t=
egra/nvidia,tegra-8bit-cpu.yaml
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/display/tegra/nv=
idia,tegra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/=
nvidia,tegra-8bit-cpu.yaml
> > > > > > new file mode 100644
> > > > > > index 0000000000000..f0dab608b2936
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,te=
gra-8bit-cpu.yaml
> > > > > > @@ -0,0 +1,138 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-=
8bit-cpu.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > +
> > > > > > +description: The display controller in Tegra20/30 SoCs feature=
s an
> > > > > > +  8-bit SPI interface that closely resembles the MIPI DBI Type=
 B
> > > > > > +  protocol and is referred to as '8-bit CPU'. Each display con=
troller
> > > > > > +  provides two such interfaces, which can be used to send MIPI=
 DCS
> > > > > > +  commands to initialize and control the panel while image dat=
a is
> > > > > > +  transmitted via 16/18/24-line RGB.
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    const: nvidia,tegra-8bit-cpu
> > > > > > +
> > > > > > +  dc-gpios:
> > > > > > +    description: Data/command selection pin.
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  rw-gpios:
> > > > > > +    description: Read/write pin.
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  cs-gpios:
> > > > > > +    description: Chip select pin.
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  data-gpios:
> > > > > > +    description: Specifies a set of 8 gpio pins used to transf=
er data.
> > > > > > +    minItems: 8
> > > > > > +    maxItems: 8
> > > > >
> > > > > Based on my admittedly brief research, according to the TRM the d=
isplay
> > > > > controller can drive all of these pins - of which there are two f=
ixed
> > > > > sets as you mention - directly. So we'd need to describe which in=
terface
> > > > > the display is connected to in DT, but not any GPIOs (which they =
really
> > > > > aren't).
> > > > >
> > > >
> > > > I am perfectly fine to not expose any gpios in the binding, if this=
 is
> > > > preferred. Only question, which method of interface checking would =
be
> > > > preferred. I assume if primary then nothing, if secondary - boolean
> > > > prop "nvidia,secondary"? Feel free to share your vision.
> > >
> > > The driver currently uses the GPIOs to program DBI commands, so I
> > > suspect we do need some way of controlling those pins. Or is there a =
way
> > > to have the display controller program the pins and send commands? Th=
at
> > > would be much preferred because it would more accurately reflect the =
HW
> > > design and possibly also simplify the driver because it doesn't need =
to
> > > parse the GPIOs and then also not use the GPIO API to set the values.
> > >
> >
> > From what I know, GPIOs must be used and freed after use. Sets of
> > GPIOs are defined and remain fixed for primary and secondary
> > interface.
>
> So you're saying that we need the GPIO handling in the RGB/DBI driver to
> prevent anyone else from using these GPIOs and potentially messing with
> the DBI communication?
>

No, gpios are used for dbi communcation while their sfio versions are
used to transfer RGB data. So there is no risk in external
intereference.

> It feels like there should be a better mechanism for that than requiring
> the DC driver to request all the GPIOs. Maybe these should be excluded
> from the range of valid GPIOs?
>

NO! These gpios can be used for random purposes on devices with non-RGB set=
ups.

> We can make sure that device tree isn't going to use these on a given
> platform, but there's still the risk of users grabbing them via sysfs or
> the chardev API.
>

Well, defining them in the schema as it is now and adding a note that
gpios specified in the binding cannot be re-used/shared may be a
solution. But overall it is impossible to reuse gpios dedicated for
dbi by hw design. They cannot be shared or used for other purposes if
dbi is used.

> > > As for selecting the interface to use, it could probably be just a
> > > simple, single-cell value with two valid values. That's a bit clearer
> > > than a boolean, because with a boolean you need to explicitly documen=
t
> > > what happens when it is absent.
> > >
> >
> > I can describe boolean too, but if you want set it like "nvidia,head".
> > Fine by me.
>
> Yeah, I'd prefer it to be explicit which mode of operation is selected.
>
> Thierry
