Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFACB3ECBDD
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 13:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775138333; cv=pass; b=DyIXK+NmctuLbyEUPZvPo6Qd3ra6E6mbrgcKIEjPss6tR6b+0PKvfmlnl3zK/w6d2uWFB2/fx42QLDVMG2cQgvvXDIMnQ5oz1Yt0j11JVnQcAIdiuvTBUs2bYD1FFSmOiCkl40HAzVhBkgYYS7dvsDjKMK8flp7Ih5fxPsdFXRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775138333; c=relaxed/simple;
	bh=MuxLGyy0UpsBOYdgd2XPZnijLjNR9TCllHUYIN2aEx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BGMsdrOG/nD72MG592KXz6KrZY8VvuxXPkJgOTrfzum4IBwHtuubClk4L3fwgRTv+3BPfYV4mawCqZefPjb0wYQ8EQMqXau/A5xTnMYmNSlwOEtdUMwCo/Wde3HRkGzxx1VaFuXKzqYUckqEIYS3w7NcKsyEwArad5reyMa/7Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkzX2F6O; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkzX2F6O"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso866581eec.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 06:58:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775138330; cv=none;
        d=google.com; s=arc-20240605;
        b=J3dRD+T2eVXrsUiFL0SU57ipBGMZAlmIseGqh7sofhnc1dv7/jnW3lPCcjWE8sPnNY
         CXgtXHfcQDBd7mdBAWT+oH+qqTXv74KhYWcy8kdAngOx6BslNphJ4otERnR8RBfa6vWi
         r84jRUgBzbv+J1kYOC+eFb8iz4VfEBFUy5Jc8ADfPeU6j+jvtaE5/XnrOhrJ5oo3GCqZ
         nnVdDMgSv5pApAvTgliPOzZBKC2aCBSbPrdLZj6vhGCUtzblJspjnNwPHMdMX0Ifw+tp
         XjK1ROC7rGoqFGRFmlWm4YcllPuFfEiCI0sNeQZxWx1zO9DedMzu884o0cfyyoPNZNJt
         x6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=egjpBljD5amBzEJap42Vm0ePRWfauJeguPCZGqRPuqg=;
        fh=0gAhYetw7p9XXZQMfQnEyGl206awKdcF1hGg9ckL7zM=;
        b=MsE9/4/zQ6ilZg/RcrUt2fSq0oAVb3SczV6E/7Y5XClWQMQfSquzHFBNqz0/xdZaQ3
         kyp6TUWGRqFOiINszzRu4LDCwS0QwpZqPMy4/N79fhUCO7aWjgr7BlKh3+r6fG6rboJE
         oSp/TxuLAVdxtZ0OGibngLPCVGKUrQED+qC/hz6a39JIz9yw58NzZTv4g9DjYt5MZybg
         xHdVhWwmZGNhAxkkPHsRRsMZSle9dvpn2PDsDNQLNM+H/GJlLZR/mB4kl2MNv/QNSQci
         5wr3bKZ2kSDjx7Agf5CJ/tQQLtlUTvC0ApMaWRqS+Ooks0Ybs49/GQe4Ydp5AKKchQwO
         UZNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775138330; x=1775743130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egjpBljD5amBzEJap42Vm0ePRWfauJeguPCZGqRPuqg=;
        b=BkzX2F6Ow+GT0NaIGuubM5YzB7AltV4eZdq/BB1xtSQkJAgqMplEIkkOQsLRiyV0Y+
         RR+zM11uRjiZu8zmoZZuJqIuPAbbeIgZXmzfEvFX/3+0+HKUiQ6gAI3NC4BJDWupQ9ux
         MJj+6g2kSmTtgwlRCwxPQHFSmFeRz/FEOCfUZhnLDxlsXqd3Jqe5VxYaQURdQ1Ejyf/e
         wC/eUKlCyOp1IVwDW2cTUwZznwCe4zD/nEe2NRPltbTgHbVz63pI3yq494W8F7sxz9Kh
         +zeB7pXY1nGi5R8KUUzrqTRYUrMrogIGjPAqBS10CNnKli5D8HetAI4OZduWLV49amn6
         fbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775138330; x=1775743130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=egjpBljD5amBzEJap42Vm0ePRWfauJeguPCZGqRPuqg=;
        b=M8zZ8lxtdXMUUL1zWqBgyWro4egkwLHkP4gqQO3JOSucYZGX/ZCM05vCWep4uC7bWV
         Cjko2cssrczGHnYheR+05I5rCJHNxk2a9DkY1DqI/+KIyC0jvA+477p/C3lL25eWprdE
         Rev5+CM00Zuje2Vm5q3DCYfIhz6e5f5kyOUxAwY1Ea/wJ+aAS2hXJqN0gF5YT4s9rGkC
         SuPylP7R6yCioU9Ow7eQKXDACbBiQGucH+/MVaHHOU0aYCmAX+3w6gOOi+SJ1PAcjq99
         Fs3g+eH1Mr4IbQHeRbzp+doqZ1WRQArk9NIvtHQMcDaz21Lcx1Nbacw8i1+ZnYyOuOrq
         YUSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6iYDCXYVS5ECKKAXYFjrFVfWgbfu+9EU6d9ksplkiQz4dEN7kzoYOXOVsy0OkZEjPvvTt917xO4Nm@vger.kernel.org
X-Gm-Message-State: AOJu0YyKMuGfb4oDexuoSmgeN1Qq2R+0BW4Mj1WVG8JgEvuBZjNf5zLq
	2W9AfjgiHYAAGQ6AIp0f8mWDMwTtQQ/MEBTZjpyo3Kc+j7QJQh6bXg/nm8L3lzoNUp4jx50cSNF
	S+YlNaxNst6L7+fAIhOvn9LT3hb2kejs=
X-Gm-Gg: AeBDietA04cVh8MtoB0sf2g8RHXIeqkDUGv1XYP3u0MOII6+CI7nIFinKYRxdEduJSy
	pa9IhDeWGNWJEIGxxpxTNQnJwbXetYePzcC+alyxB926zXmGGP6ta5EBhMH8GGjaUpZcvmVEhQr
	/S0WXTvN/s7wz8J8UnJSJ9twB3WKK11A9llvb+VXq5OI0h3BM98WctAZdGFCArUygiQ37EbqSVK
	baaruWKhwEA+nJJXC3klZI2GTAfx6SHo7VsqEGetY1bXizF9WhctEfOFaU25AA2fxkBb8lVSfLG
	U7xloiIwyLq4xvtD
X-Received: by 2002:a05:7300:fd18:b0:2c1:74ad:2ce1 with SMTP id
 5a478bee46e88-2c932fb1ceamr3858039eec.28.1775138329593; Thu, 02 Apr 2026
 06:58:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401104550.115715-1-Ashish.Yadav@infineon.com>
 <20260401104550.115715-2-Ashish.Yadav@infineon.com> <20260402-enlightened-analytic-leopard-ddc512@quoll>
In-Reply-To: <20260402-enlightened-analytic-leopard-ddc512@quoll>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Thu, 2 Apr 2026 19:28:37 +0530
X-Gm-Features: AQROBzCeSV-f8plt_LehmRZiHg0cu62n3ej4GjQqzEFgRQwD_gP-JIUq4OFXLks
Message-ID: <CAJKbuCbs42aMKBXypkQeMNoBwp03aK2rzJp9as0NpZo==Ospng@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks for your valuable feedback and time.
Please find my response in-line.

With Best Regards,
  Ashish Yadav

On Thu, Apr 2, 2026 at 1:14=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Wed, Apr 01, 2026 at 04:15:49PM +0530, ASHISH YADAV wrote:
> > From: Ashish Yadav <ashish.yadav@infineon.com>
> >
> > Add documentation for the device tree binding of the XDP720 eFuse.
> >
> > Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> > ---
> > This patch introduces a YAML schema describing the required and optiona=
l
> > properties for the XDP720 eFuse device node. It includes details on the
> > compatible string, register mapping, and rimon-micro-ohms(RIMON).
> >
> > The RIMON resistance is installed between the Imon pin and the ground
> > reference.
>
> Why are you adding second commit msg? Hardware description goes to
> commit msg. Redundant parts go to /dev/null.
>
>
  ACK.

> > ---
> >  .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infin=
eon,xdp720.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp=
720.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.ya=
ml
> > new file mode 100644
> > index 000000000000..bbde8ff92ae9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yam=
l
> > @@ -0,0 +1,51 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp720.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Infineon XDP720 Digital eFuse Controller
> > +
> > +maintainers:
> > +  - Ashish Yadav <ashish.yadav@infineon.com>
> > +
> > +description: |
> > +  The XDP720 is an eFuse with integrated current sensor and digital
> > +  controller. It provides accurate system telemetry (V, I, P, T) and
> > +  reports analog current at the IMON pin for post-processing.
> > +
> > +  Datasheet:
> > +     https://www.infineon.com/assets/row/public/documents/24/49/infine=
on-xdp720-001-datasheet-en.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - infineon,xdp720
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  infineon,rimon-micro-ohms:
> > +    description: |
>
> Do not need '|' unless you need to preserve formatting.
>
ACK

> > +      The value of the RIMON resistor, in micro ohms, required to enab=
le
> > +      the system overcurrent protection.
> > +
>
> Missing supply
Could you please provide more info here.

> > +required:
> > +  - compatible
> > +  - reg
>
> Here as well, most likely.
>
Could you please provide more info here.

> Best regards,
> Krzysztof
>
