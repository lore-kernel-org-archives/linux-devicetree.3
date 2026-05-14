Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD87B2D836D
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 18:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782872; cv=pass; b=TuS2aucERo+ld5hMPorfESRJx8QBNjDT3iuzrR6mY7QYOgjkVZx11y49ZoPOZTP5q+v75nQkKXE+cfxP7BdyYv8VKF2ICi1YzorYZAtsL1GjXgeiq1Wy8Ug1jP05BYyD/0nDdlniQDTmkq228MmoRihcwgEdlASQRGVDfX0siHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782872; c=relaxed/simple;
	bh=sVgrU4LUQVlOmJPrbCpiviOHJw3E5Hcx1bjF0HIyIEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZY2tfYL7ZbtqwIZcCSkT0U7SBH3X1cs+oS8DphMqmQl5hsQ77f4BxktkzsrTOKbe1q6OnCRcj3DWRHGSnE3Ta+JbKkLrHuYLSdy+NLuTp9gfEewJbxKKXbxNjPsRneHhNOrXVddhKS4ay9uQDF5AVsAocUus37GlmreyDAWrlSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9tqlzXA; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9tqlzXA"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a8f9841616so1478820e87.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 11:21:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778782869; cv=none;
        d=google.com; s=arc-20240605;
        b=DsxEpiImfSUFMZ4NGz2WMhDKHLpz5FeQBUSN+lonydXzUxNHStqEyHewCKrQjebDY/
         VGs1d/DPzanp8niAakrb60akdE7PoB0h+Cg8y7l/rn8EiCasG/CbtoCMTr61J1C783vB
         cc7y/G6f3hsouEoS3/Y1TSZFzzL3SrbFBg4g51ZMfGwYWOrKnqlY2zQGbf4a+BaRQyqd
         J2kddqkLR6NaNmbOQRWw1f0qCWRz3DuQ+moUhYlrQAt4JEJ3xBUZwthplwjuMQfDsm6J
         ipkzsznmRONgFnJvjH49DDFVWExk/0JLXcsu6Z6KK3WoIUur1D31l1LA42z38cKejHjk
         pn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9VzaPyNiCnG2bYdEp6C9uaWnOU2qbaQUwImHVjXg1wE=;
        fh=xhHtB886LZLK7v9JfNBBPvy4DoujMN1pc4V9oGnA35o=;
        b=OLR6zztFnygjzIh3WRGa2kB5dEvoMmciZ5Ccwz2nrLFuv9NzTlFDa3U4w2yw2qxOOz
         AHPWDHjKFS20aEFrMnHAG++iLtCvl11cz4ud9SEUhqs9fEZ2JB5m/9qdwsrgHeQXqdFO
         CAwPoXMpfalUsj7USuQ+HzIX3g0HMzbxocicuMuWLRGyiXARvd4gTbgOW/V68GBGQUp9
         z01zwSt4K36yl7Aw/8+l9GqrurMZ+TQmIdPgdZCDCpYHxcge3InkqIl8yX/g8Ykhvh9h
         x4HTrh4tQZJq3jI3oYyUO2EypTjPl8M4/jIgDLGwlZFAObMLH271pU2i+ModwXKRkQYe
         k5XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778782869; x=1779387669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VzaPyNiCnG2bYdEp6C9uaWnOU2qbaQUwImHVjXg1wE=;
        b=D9tqlzXA08f01zNLRgVbLDBpaZxRkgD6doLGAhc1oFfGkGHsKHTIVzcXgVa1Vdpq7x
         ZIoJGvX6Dj9mAqcnRbwd9d8MTe9K7an5pl+anGW5LMMtdnM4UuNCkzxG9FoeiPpfTr11
         VIOAVcPzYfDan2hoVF4R83qc2dYGeOL8X/MNgiQ51IeZg3fG6SVh7LGczhsm7bBFrlkf
         W8uu3wU7fWx+TGXBy55B+ZeVAKbaKtE1XKpCB8B0xEXWyjIEl2Iz4Z4aMB1kDWKykWGH
         l8rriUSpZw3BOvDBCyWvc9P1DqlZrz9UO4LsDv08jlLJEyocxcFifoai9lDwVAW7EMkE
         /uDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778782869; x=1779387669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9VzaPyNiCnG2bYdEp6C9uaWnOU2qbaQUwImHVjXg1wE=;
        b=TdtEubDVxc5lmy+GVUd+DEk4r7Kere1uw7J4lMg4tM3GXU9Kt2c/fRrTl/D/9lusHB
         V78m4fBHSMFOs2jPfSoJJN/gEez7N2zCV9t5yZ95eFXgYpKupIOSgw8xjHsUY2SUKDVi
         WLPBMavfgd+ilCtoATfpNYIRpC1rZzZSEhRHSxWolX4KdtJvOOjTd40S80vA4kf1j5Bo
         oId+bWFtw/VD8AGvCHyFXiFWCj+HP7nfbCnF9xYHKhSGc2rEFWoJVtjtzGV7CZU0867t
         YHlGm/megr/a/RbeLro+bNRXxR46sVqIfTT1mdxmrfHI7VNus9v7qcT+bWjiRTjVXjxj
         QnOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+sNPYmUqY9Q8cBOi5dpb7ayImKp+UV2S9sI7AtDF5w+Dhp2//8MH5mo/P3LQoE0/QhxE5aY0PYmMnr@vger.kernel.org
X-Gm-Message-State: AOJu0YybyqSdBNJtuKCWtZzWC6ahVz+pjzil9HCO+PrCYRaxa/LVm3o8
	Hvb0bho2zyFyoXm2XGm9RLjYel5CPLQDq/zZZhjAsz4pRoAezJmLxZWAVL+rzBQln3f8ikl7Vxf
	LhILHkGjQstCBC2lTqCIXoMcSyZo4oRM=
X-Gm-Gg: Acq92OHdgtLq9ZMBKHK/iqf6yE51cGGIkuysCSQw8ybtl4a5T0bPhXAyldiw/HR5oIz
	fUjWAgKrDU6SQSAkCDa+o9se775JMECRaqQWjJAG0pa1OhGrZdrobGRDE1pv1vZlKz2AEPMb5wt
	C2W56cg24Blx+hkrXGrcCPf+vjpASLdA2A4W52Ns0RCiAzl5UGuFXf4WpixBnGJX8cHVpkhpxzD
	rIglygf6AP4w/ZiZRAr5sXyiBdtPl+e4CZX12nL+yu58zhs1fLxS+/BMrRxwJQu2vOe5gq5ms7M
	SkxJLWZyKiPJyssodhvK9Aq5Z0OXLRlMJql1Xarafk9KdL9BaU2d7DuV5LuuXQRPTAIxqB2a1es
	MRas=
X-Received: by 2002:a05:6512:a8e:b0:5a8:d14c:a14d with SMTP id
 2adb3069b0e04-5aa0e612dd9mr62162e87.18.1778782868840; Thu, 14 May 2026
 11:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-icna35xx-v2-0-45acd1dfa566@gmail.com>
 <20260514-icna35xx-v2-1-45acd1dfa566@gmail.com> <20260514-ambush-salvation-ce6616190390@spud>
In-Reply-To: <20260514-ambush-salvation-ce6616190390@spud>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 14 May 2026 13:20:57 -0500
X-Gm-Features: AVHnY4LodS78wV4Pv4nIlOxmJkr0uXWhKDVmV5qztzmHBoRa8eR1jCxw_j852JA
Message-ID: <CALHNRZ8ukiSM2+uj+Qg6rVbUjjFeo88HQjLZsFHbHBs_GTy_1Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Chipone ICNA 35xx
 OLED driver bindings
To: Conor Dooley <conor@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 1:07=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, May 14, 2026 at 12:24:49PM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > The Chipone ICNA35xx series of DDICs are high refresh, low power
> > MIPI-DSI drivers for OLED panels. The icna3512 is used by the Ayn Odin =
2
> > Portal and the icna3520 is used by the Ayn Thor top panel and the Ayn
> > Odin 3.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  .../bindings/display/panel/chipone,icna35xx.yaml   | 79 ++++++++++++++=
++++++++
> >  1 file changed, 79 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/chipone,ic=
na35xx.yaml b/Documentation/devicetree/bindings/display/panel/chipone,icna3=
5xx.yaml
> > new file mode 100644
> > index 00000000000000..6464d8d0cf86d5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/chipone,icna35xx.=
yaml
>
> Filename matching a compatible please.

Does this require splitting / duplicating the files for each ddic, or
can one be arbitrarily picked and the other stay with it?

> > @@ -0,0 +1,79 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/chipone,icna35xx.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Chipone ICNA35xx display drivers
> > +
> > +maintainers:
> > +  - Neil Armstrong <neil.armstrong@linaro.org>
> > +
> > +description:
> > +  The Chipone ICNA35xx are a series of DDICs connected
> > +  using a MIPI-DSI video interface.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - ayaneo,pocketds-panel-top
> > +              - ayntec,odin2portal-panel
> > +          - const: chipone,icna3512
> > +
> > +      - items:
> > +          - enum:
> > +              - ayntec,odin3-panel
> > +              - ayntec,thor-panel-top
> > +          - const: chipone,icna3520
>
> Commit message should state why these ddics are not compatible with one
> another.

Ack. Short version: some of the mipi vendor commands don't match.

> Rest of this seems okay.
>
> pw-bot: changes-requested
>
> Thanks,
> Conor.

Aaron
