Received: from mail-dy2-f18.google.com (mail-dy2-f18.google.com [74.125.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA744E0B9E
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773888; cv=pass; b=bXUEjXNLsPtIRXkJ+0NHnFNiaD+Ayp8wJDje0QzIAo52MynpYWLOPIe14fLzwcB0lm+0Ztc8cBNBQR6CbJFS5bt5OFmizRooPpG+t3XUSzaQ1ypbCYRt/TBRFjbYmKlcg7l4EOw8bSzBgyLwaOirR0jzfXuqMItz00LH69jRqyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773888; c=relaxed/simple;
	bh=Zt8I0rLvsyoWaB8MFKSA6VF9+DaTZuRYcVHpW7GrWDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fc4r12Z18Mwyg/C+ThOayOyo+Df/yzfht21gfpO0A0Z791u4FTf+PQTcvaCU33qvt85VjABI3lz6qqZ7IIwxFVsasvbUiaauZAUt9ZvCSDlsXtg+iM+sFH1xVDQ7Bye7Pd1YWIw1mY4XUoe27i/P1FuYBJzmH80xGwvoJf+V5L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNtPvpJM; arc=pass smtp.client-ip=74.125.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNtPvpJM"
Received: by mail-dy2-f18.google.com with SMTP id 5a478bee46e88-342773d94a7so3298754eec.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790773863; cv=none;
        d=google.com; s=arc-20260327;
        b=PiRvNAvK5i4JnLjkeysHEMQ2dcEFox8crr2h7qjJel5HTvV1gYbToeIMjg/X/4Bk3m
         Rd/YyBqToDRQUBm8CrWrX3EY8W6oPwdZIUyjzez3Mj7czpeGT2+hAypzjNtWviUAbuLP
         jTo8SsOiF1PGLAyFVa969UaIsR0tLiMRl8oWKvcUGCHUHnzT+UQ+ELtZ5DEIK2jNcNut
         rdx9hDO4ZosFGi0qH1xBvqxH1qY1KFse9JDfbC0eolcDjUvVjm7f+jlDXoLQyJqNLhd4
         r8dlZesKYbnphhJ6F/Lu14sQwYEs9A8U+9odlsy/4sU7/WwA3kNCywgT4l4QfmMpMNcN
         sVlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LAcpYy8Y+KFMyBoefBiZVG5Vh10XWP5p2hVnta/lBBU=;
        fh=rj7t9ONe7E6OB/xSRI/8Xw8DbAfiXANwuTn5IWv0lH8=;
        b=q5fVilIpcoqe1m21NZlPyUSrpfRF4ZqumMrds+0panU+9cQB+f/YhVnU2n62fq0qSL
         9LHxCZZO1PACVXe02cX3mL52i3AJftvlEcav+XSG49q4aQD7qBQC/0DCBFo6s/SUYiNB
         L6RxH5KCYNuC8FBde69QeE7ffLfTr9mgC1HMcgeWeKle6kbOtXn/pE9K2Mq7I4kXet7I
         x9/oCAjJt0MiODnl68WpeVbixX4V7KvHVtTMxudFH0JSVDLHtTRBBdGT5wJjqkcK4xUp
         a3DsUniICBDMBc8FDxJ95K99QVnqeXB2VCajm+ENZevQCtbxKxfKRvwGSN5E1/tOeRpL
         6Z4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790773863; x=1791378663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LAcpYy8Y+KFMyBoefBiZVG5Vh10XWP5p2hVnta/lBBU=;
        b=VNtPvpJMSRf+Iz5RkG2YCEprFK/z7SsWmXEYc4ujWJQiBi+8Yj42wkZS9epDEjvqrg
         Kzd8JE9v5hkziOQ5WaGz5r3DoESExEWd+BF2o7Scdyr9Z23PmEh2SSuw3Bf9pyYtLq6Z
         kcM9Jm5MUdRCpU90QDCR1SWH1lhmMXpFK3w9YmIURO1MQLJarvA6vaPjpJ94d/eb/2sJ
         VBH1JrOGO257kGek+l1+CPhUkkvzTTj77pVPcsSUtIyqsHPK0Gvf88ukpgS/aMi11JoR
         Utlfj2q9JZvyNo/55wRoYxjVq75TDeaUxMJ7rJypZSk0asSp8P+A15XrE6ZbJoethWAk
         hI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773863; x=1791378663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAcpYy8Y+KFMyBoefBiZVG5Vh10XWP5p2hVnta/lBBU=;
        b=stZ1ZfyXDfPmgA1DkZ5A9R0Baqh4c3pQnSxlv6oHQxQa5hfyoE0eO8a/ym0eDrgnb0
         evn38SbygrDV0iHNxPXLReT0pRoK5EJiX9uYr0X4g4Hewk00o5rZhmra8zsOSpvrOcJp
         kai7/WtIUQPXSZtkz+Y32u5C2lR7ED/TSuMuJG+rnCXxP4GVXmICB0zVjV9RiqgyYC0l
         5SwfsImfl8j6Hc06r3bVqYOlZ6Y0nP4eLE9/E3zbAEMC0b7/cLT71lcBG4Ksg5Ui5A9v
         vk5us9O9w2SgROZfPps8QQxXMM2t9H3Relig09uMSH0Y9QQMfXgkPWBAJ0F64+OeYAcj
         RTBg==
X-Forwarded-Encrypted: i=1; AKwUvBxamckj0FWkyj1m95+tlvS+OCzlLbNVT+IhYVF9DVu9xxnV9o73XNk0SkjQguQaIjF6CMqE3/E6GIJT@vger.kernel.org
X-Gm-Message-State: AFq9FYKd778j+H3mnsopAjz/BVCLpwlmWhlQK9lahyIEC3DIBZMDLETw
	pGE1x2AGJtSkD5ZNul6Koc0VInIkTGefzdYsEeqcgH5VUJ9OhQub2FgV4qT97tgjBsSEbRQdMCB
	WMDDtTPlwh1gWzC7NH7TSHJivXgwQaKo=
X-Gm-Gg: AYBFou137dnVkvl6pKv5hYUEdsXQieP8+7BF88/mn6/ClBmRo+hu6cy4CS1GQPrLu7D
	oIgBPlqxaAH91L9x13d4/iagOQbaRtd7rAKLId4LvGltf279TgfhN+IVFjvcTdgozBqZfsQ8FsD
	TJGhYXcNDkKvqNEAc1yJBgTI4fOLmv9DxdXL0ChOaZbAa7L2xaixxEwRi2SPtlOskXv5y2qgVnq
	Bij1ugBt5uRFJsQ+YmpRbQSoUOo1QxmGNGGOh0vvkKla1PctJvoJhXDxFSHNNJoS/o+BOckvIba
	nVGaU1nQgTK+fCeSThff++8Iorm7l3lUA+fh7GPAPD2dFCaQvhku7lGCiDe3BxxJZGZqlsuN4BM
	6XgzBERiwu8un
X-Received: by 2002:a05:7301:4b06:b0:33c:16f1:2e11 with SMTP id
 5a478bee46e88-34cdb6ed6b1mr1708219eec.7.1790773862800; Wed, 30 Sep 2026
 06:11:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <UJZ22UtaS1GSRPlyAst1og@nvidia.com> <CAPVz0n2F8LBqFs2bJERmgvdNYgtt1OEVtK3++CP9y0gxW7gCGA@mail.gmail.com>
 <arzn-TNbOlqXqQgd@orome> <CAPVz0n33c_uwfhsSguEfFfJ3FV=26SPtNTEpHes9f5RjnPDA_w@mail.gmail.com>
 <arz1wzEI_7e7ruKi@orome> <CAPVz0n12oiuc=5wjeNCuNtJpe-M7Ys=rHn0TOExc0qkweVQnuA@mail.gmail.com>
 <ar0HCfSKR9yr9Z44@orome>
In-Reply-To: <ar0HCfSKR9yr9Z44@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 16:10:50 +0300
X-Gm-Features: AclHuK9PDl69Sotr67TThU9DWzl51KL70LQ5tx9814AsWsSrWDYmjdY2XxCFv1M
Message-ID: <CAPVz0n26bPgAYjAdpqknPdMeQgYd=QEfZLX2VsACmkTQNJ581w@mail.gmail.com>
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

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 15:58 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 02:56:26PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 14:46 =
Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, Sep 30, 2026 at 01:56:40PM +0300, Svyatoslav Ryhel wrote:
> > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13=
:50 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Wed, Sep 30, 2026 at 12:52:18PM +0300, Svyatoslav Ryhel wrote:
> > > > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=
=BE 12:19 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > > >
> > > > > > > On Wednesday, September 30, 2026 4:05=E2=80=AFPM Svyatoslav R=
yhel wrote:
> > > > > > > > Document 8-bit CPU parallel MIPI DBI Type B interface provi=
ded by
> > > > > > > > Tegra20/30 SoCs display controller.
> > > > > > > >
> > > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > ---
> > > > > > > >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++=
++++++++++++
> > > > > > > >  1 file changed, 138 insertions(+)
> > > > > > > >  create mode 100644 Documentation/devicetree/bindings/displ=
ay/tegra/nvidia,tegra-8bit-cpu.yaml
> > > > > > > >
> > > > > > > > diff --git a/Documentation/devicetree/bindings/display/tegr=
a/nvidia,tegra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/te=
gra/nvidia,tegra-8bit-cpu.yaml
> > > > > > > > new file mode 100644
> > > > > > > > index 0000000000000..f0dab608b2936
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidi=
a,tegra-8bit-cpu.yaml
> > > > > > > > @@ -0,0 +1,138 @@
> > > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > > +%YAML 1.2
> > > > > > > > +---
> > > > > > > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,te=
gra-8bit-cpu.yaml#
> > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > +
> > > > > > > > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > > > > > > > +
> > > > > > > > +maintainers:
> > > > > > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > +
> > > > > > > > +description: The display controller in Tegra20/30 SoCs fea=
tures an
> > > > > > > > +  8-bit SPI interface that closely resembles the MIPI DBI =
Type B
> > > > > > > > +  protocol and is referred to as '8-bit CPU'. Each display=
 controller
> > > > > > > > +  provides two such interfaces, which can be used to send =
MIPI DCS
> > > > > > > > +  commands to initialize and control the panel while image=
 data is
> > > > > > > > +  transmitted via 16/18/24-line RGB.
> > > > > > > > +
> > > > > > > > +properties:
> > > > > > > > +  compatible:
> > > > > > > > +    const: nvidia,tegra-8bit-cpu
> > > > > > > > +
> > > > > > > > +  dc-gpios:
> > > > > > > > +    description: Data/command selection pin.
> > > > > > > > +    maxItems: 1
> > > > > > > > +
> > > > > > > > +  rw-gpios:
> > > > > > > > +    description: Read/write pin.
> > > > > > > > +    maxItems: 1
> > > > > > > > +
> > > > > > > > +  cs-gpios:
> > > > > > > > +    description: Chip select pin.
> > > > > > > > +    maxItems: 1
> > > > > > > > +
> > > > > > > > +  data-gpios:
> > > > > > > > +    description: Specifies a set of 8 gpio pins used to tr=
ansfer data.
> > > > > > > > +    minItems: 8
> > > > > > > > +    maxItems: 8
> > > > > > >
> > > > > > > Based on my admittedly brief research, according to the TRM t=
he display
> > > > > > > controller can drive all of these pins - of which there are t=
wo fixed
> > > > > > > sets as you mention - directly. So we'd need to describe whic=
h interface
> > > > > > > the display is connected to in DT, but not any GPIOs (which t=
hey really
> > > > > > > aren't).
> > > > > > >
> > > > > >
> > > > > > I am perfectly fine to not expose any gpios in the binding, if =
this is
> > > > > > preferred. Only question, which method of interface checking wo=
uld be
> > > > > > preferred. I assume if primary then nothing, if secondary - boo=
lean
> > > > > > prop "nvidia,secondary"? Feel free to share your vision.
> > > > >
> > > > > The driver currently uses the GPIOs to program DBI commands, so I
> > > > > suspect we do need some way of controlling those pins. Or is ther=
e a way
> > > > > to have the display controller program the pins and send commands=
? That
> > > > > would be much preferred because it would more accurately reflect =
the HW
> > > > > design and possibly also simplify the driver because it doesn't n=
eed to
> > > > > parse the GPIOs and then also not use the GPIO API to set the val=
ues.
> > > > >
> > > >
> > > > From what I know, GPIOs must be used and freed after use. Sets of
> > > > GPIOs are defined and remain fixed for primary and secondary
> > > > interface.
> > >
> > > So you're saying that we need the GPIO handling in the RGB/DBI driver=
 to
> > > prevent anyone else from using these GPIOs and potentially messing wi=
th
> > > the DBI communication?
> > >
> >
> > No, gpios are used for dbi communcation while their sfio versions are
> > used to transfer RGB data. So there is no risk in external
> > intereference.
> >
> > > It feels like there should be a better mechanism for that than requir=
ing
> > > the DC driver to request all the GPIOs. Maybe these should be exclude=
d
> > > from the range of valid GPIOs?
> > >
> >
> > NO! These gpios can be used for random purposes on devices with non-RGB=
 setups.
> >
> > > We can make sure that device tree isn't going to use these on a given
> > > platform, but there's still the risk of users grabbing them via sysfs=
 or
> > > the chardev API.
> > >
> >
> > Well, defining them in the schema as it is now and adding a note that
> > gpios specified in the binding cannot be re-used/shared may be a
> > solution. But overall it is impossible to reuse gpios dedicated for
> > dbi by hw design. They cannot be shared or used for other purposes if
> > dbi is used.
>
> My concern was that somebody might try to use these pins as GPIOs, in
> which case the GPIO and pin controllers are going to interoperate and
> reprogram the pin functions, potentially making the DBI interface
> malfunction.
>

If 8bit interface is in use these gpios cannot be used for anything
else. You can be sure of that.

> Or is there some other hardware mechanism to prevent this from
> happening?
>

yes, pins are physically linked to the panel

> Thierry
