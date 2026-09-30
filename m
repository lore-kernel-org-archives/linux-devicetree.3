Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD9A3B52F8
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761953; cv=pass; b=QfBF7eKn4jOqh7J00gP69QJBnEGy9pBzPvwow+R00OV2z1wfBFS85JQu/JRngXVkzPuo3eTwKGYj7MIx4rYCLdp14dL5RCdIlKlCn1TRhRbI8urc6R3N3FWm6j96NdB24S6yvmnwc4S3fIaFBqDjkTStFE5feMtDo6dRq+Z0SpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761953; c=relaxed/simple;
	bh=bjD/Y05Lpd5GylJNzOLs802z3oVBzEjhypxLuBXLRos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kR0yZN3PW5AnoBvX9KiSlAs852aeCOJNtSP6o9OsxqfNPdSzZAtMo6XhPHpPYqyJkB7O65/FNcLF9T6sAd5U7VTQiPCjzni30xbenC+tXS8cWdHvUQ2L+qxmLzTNdG6TDquP/70v31auXmVPcgIo/Ly5OLqxjCd3ho0q4dOMI58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URJwwz3Q; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URJwwz3Q"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-341d0522b4dso7878497eec.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 02:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790761950; cv=none;
        d=google.com; s=arc-20260327;
        b=ALmvHYrEYDdvUj3s2HI3RzrEd9pqKMdb94yEK6NggfXYtnx1z/H3X/mgTEDcx6a8b3
         jqTr6llaG9FrRoK6HN5nE6Mlgw/dXHC66p9F3NVPHpngoS/Oz6mEbvg40Tb0c+MuGafo
         2AVBYQM2bKaEzgEI1g7n5fELaR4Eed6n3AyQukKPa1HGrZtC+kpOWinSjeYnJwcjd3uK
         sZtpWRm2hYTvF/SmJ4TZR6Pz7H4Akf6YquSMWXmoRAOv6m4vGBJ2qPvqUauTLQA180SZ
         7tn89Vuc7GlSofUl86fixmtupsu6OKQ0oPgoClyR18A5oS+P9v4GLBQaLbL71dP631RQ
         P6cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PRT+bVkpUAp+N5S99zEO9+WtEZoje0u1sUGfRr0LWg4=;
        fh=2KnpiDSYocTspNI739DvvgT0gvQSmXMJ9uOopKKgjv8=;
        b=Y2ogFvNtcKGg09BmxSZryUeRwvTxnCFvZYLsTzchAXvfETQ4le2AdSia/Tw6EhW40d
         l+NqGWZB3lwH6StqiyoiX9qCoxYWEQ8gUIBrMQdl3spaxpe9pFhitjOVrvSKSwB8mF6Y
         wjZrnYbmLN+UsR89m0f2RaTPLgcmWWGCMk2NtDGZa6ZD+9N5+jH3Z+k/6Av6OaKTVCzd
         DrgHVMy57VeTnMHNZPfC1+XueAhCf+aMrAQpal1f21TPXCIM7ZGn/LWW/n/qHkgL180b
         E/8FGwdTwslwNzLvyEGBqeiVCRdDrVOq8U0ahrRTdvOOM69odO4rjIIcD0kJnaaae5Y1
         +9CQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790761950; x=1791366750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PRT+bVkpUAp+N5S99zEO9+WtEZoje0u1sUGfRr0LWg4=;
        b=URJwwz3Q5weOK8SyIeMRj5F6yJ9v6l6sXJ9AbEhqyfRMLLcEgG/y0ajmZtJelRTAgY
         tpIHSS/f7fHcbTiCmSMJpRDVXhxlwk2Nz4zkVvQtPUXAbhYzzR9mxKnrFAKqxXAI8XvH
         sNZtB4MbFXRo5nmUKBRar6YsUmjYMFmpTs5nL5m4UXzF8NjeaixLrY50K481otxFBPUy
         OGTrrWcTvatQ78993Scd09nN3nsBqIgFhQnJ90OFlfvPUgNuyanY/OaDmWsp2FcnAnF1
         Qtb56g8dBAza1X7uoXnI676Do76lJ0DRXrX1TFtWdS4HV1/+27LWpLQZi1O7sURziALW
         NwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761950; x=1791366750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRT+bVkpUAp+N5S99zEO9+WtEZoje0u1sUGfRr0LWg4=;
        b=z8E5AzWNmVOfgW+QduY70JlN+eax4IwxUAQJ4cP8jwZgZxzwIurixyZyjFfpwndyZ/
         YbSCD9+k1M8rQ9oTP5cRa87LK7IXW2TgJyllOkJFWdDQ2mI7f+8wsEjMP9bo5uC+lJwk
         qkt+r08UDC7qQ7rjun0jnM1ARptoRR0BmpKpcSZC4gHqqmwwufDIiOriQBWprHbyf/wA
         NZLB33qCrgOH2qL5ZwIdTpOCU7TPpcjxZGM77z8CTuiTtrB39Pb16LUJTEGhG20gKgDp
         2lRbVeF/y6LxrmwvIbWx2NnC+ezBQDxBFgJIOE71xoE4KdGXTsS0Sg68xXpdYs8DRxRC
         4ZyA==
X-Forwarded-Encrypted: i=1; AKwUvBzGHZKdVDj+pTUvkxahcqZ5qNpLErmQLAkgFPg+FQbsAouJ/46jGdhBroPIS3cZ+JNPThUY8ES8CWfG@vger.kernel.org
X-Gm-Message-State: AFuF++lRclxQ76Aol1M6gRp0LPotex3a7L409vw1sf45oUJMCzN3DhuO
	Rq1bEoqEOV6ipOfAuEWjYr8HrYCkJOX8yqCVxum9msyiKOtnnx2tHYKNxy27QNu2lcaLgP/GiSs
	IlRS9cBXcNsxB7YNvTcreSSyqzCxBA4c=
X-Gm-Gg: AYBFou1BM6s0wrJmrU9+YrImdgQmchgZIcaiBBXnT1krDVIfrDEKJQAFG5pDHEPpM9T
	rp7DnyjL6YpC3lkVviIkmA5xeNKeN+JLPTC5eSGiXH4G5PlO0mjsjUHhPEMMLAmKkZml5+iv6EV
	6YgwRfGLTO+ikiyKd2LVzQlY9tXJoo0+gC2zy3B6MQJtIaSObHXw5JQZVyisktUXMT9MhyzXMWR
	QT+gQJY0A2T2kgPUMpfje6NlZXMFbXJolG3lKbQrezDq+n2Fk9gHOwpKoqF7c1yIMJNz+X2nR0+
	WvsXvfoXMyxNXws9AEvdaOfZrSVDRqedrVTo0wA1zc+Y1UhyuLV7afQ698HHL9D52LSLtjBoC2D
	o3TQHtDmson4w
X-Received: by 2002:a05:7301:2624:b0:342:d7a0:2f40 with SMTP id
 5a478bee46e88-34cdbbd634cmr1436523eec.7.1790761949877; Wed, 30 Sep 2026
 02:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <UJZ22UtaS1GSRPlyAst1og@nvidia.com>
In-Reply-To: <UJZ22UtaS1GSRPlyAst1og@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 12:52:18 +0300
X-Gm-Features: AclHuK_PjMkrSZpZDbHZxmDO9H7m9qGOop4eAvIoUg-ZusCaq49UWziUnYzuIM8
Message-ID: <CAPVz0n2F8LBqFs2bJERmgvdNYgtt1OEVtK3++CP9y0gxW7gCGA@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12:19 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wednesday, September 30, 2026 4:05=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > Tegra20/30 SoCs display controller.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++++++++++
> >  1 file changed, 138 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra-8bit-cpu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra-8bit-cpu.yaml
> > new file mode 100644
> > index 0000000000000..f0dab608b2936
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-8bit=
-cpu.yaml
> > @@ -0,0 +1,138 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-8bit-cpu=
.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description: The display controller in Tegra20/30 SoCs features an
> > +  8-bit SPI interface that closely resembles the MIPI DBI Type B
> > +  protocol and is referred to as '8-bit CPU'. Each display controller
> > +  provides two such interfaces, which can be used to send MIPI DCS
> > +  commands to initialize and control the panel while image data is
> > +  transmitted via 16/18/24-line RGB.
> > +
> > +properties:
> > +  compatible:
> > +    const: nvidia,tegra-8bit-cpu
> > +
> > +  dc-gpios:
> > +    description: Data/command selection pin.
> > +    maxItems: 1
> > +
> > +  rw-gpios:
> > +    description: Read/write pin.
> > +    maxItems: 1
> > +
> > +  cs-gpios:
> > +    description: Chip select pin.
> > +    maxItems: 1
> > +
> > +  data-gpios:
> > +    description: Specifies a set of 8 gpio pins used to transfer data.
> > +    minItems: 8
> > +    maxItems: 8
>
> Based on my admittedly brief research, according to the TRM the display
> controller can drive all of these pins - of which there are two fixed
> sets as you mention - directly. So we'd need to describe which interface
> the display is connected to in DT, but not any GPIOs (which they really
> aren't).
>

I am perfectly fine to not expose any gpios in the binding, if this is
preferred. Only question, which method of interface checking would be
preferred. I assume if primary then nothing, if secondary - boolean
prop "nvidia,secondary"? Feel free to share your vision.

> > +
> > +  nvidia,init-sequence:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description: Device specific set of values used in DC DISP_SPI_INI=
T_SEQ
> > +      registers.
> > +    minItems: 4
> > +    maxItems: 4
>
> And AIUI this is panel-specific DBI commands the display controller will
> transmit. So ideally the display driver should receive this data from
> the panel driver.
>

This is not panel driver data, but it is panel or maybe even more
interface itself specific. TRM has no clear method of generation of
this seq I am aware of. Maybe I have missed smth. These 4 entries
co-respond to DC_DISP_SPI_INIT_SEQ_DATA_A_0,
DC_DISP_SPI_INIT_SEQ_DATA_B_0, DC_DISP_SPI_INIT_SEQ_DATA_C_0 and
DC_DISP_SPI_INIT_SEQ_DATA_D_0 registers of DC. Maybe you have some
info to shed some light onto method of generation of this seq. Then it
could be simply removed from binding and calculated internally. Thank
you!

> Thank you
> Mikko
>
