Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D495847ECF3
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 14:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990173; cv=pass; b=P78kok9Af23dfgepnKQJkvb9MLwQX4iArw79A5chT6Pdffs/3MRpfy2uqRLgu+Xdp4NmB1aaEdVYAJvXmGxGlW41QBm1NJqCjtpo0kGHGqr6liiCPelKGXewrHmpeMNoFwu3INvYSPYfSmlRMGKpKa62dRFH2Fg4JA/NK+eGL00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990173; c=relaxed/simple;
	bh=QIUgAXjTfXdQ0fftjlz2SQAnm7krisRfODCg+xCLSOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjYNKUnQXf3l7dlj2ximghJ5r9k8friohRTQMHsdld3xSZl6yz3uRjYEyMElANaTkhOP4MWIOXWGWt9NyvUFAaWuKlI9Y9zo4Hua9Ned1Hu6ptR3O+UyxalswbGl6chOJhahNELgrjI2kOCRVgHaJiYDlpZAfbjAEUyUBdeBhuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VecXaCoF; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VecXaCoF"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1309f4ee97fso1940726c88.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777990171; cv=none;
        d=google.com; s=arc-20240605;
        b=YkL3xRQzG4CnR7wYXysnECwzbxjwnnwGrm5xcKT+xah9T0D0OyyTSLLjQhfZSpZjtS
         /+qaWknP2WhnT4MU6RJylnNhnawfj9L4Au4FW4FD+J8g+IGqb79ux+Xs0aZlEkMpGjC+
         T29ytkzPL4qlhuxt0QQns80k03KfSjML7WfCNNnDFYELWHV/Gav/oyyrD2S3VSbwZ0tv
         QFQpfhdAU/lIOuXcpMe8nGGtaKtVC0d098W8vxjRA4RG+a4roBhzastbi75N/QwtEiGu
         Mt/H6KZqWRRH2xQL23kRoov6GqLy64z0PIzO2+POnFVgyX0avaCMdvOf7/PeMhm/3yln
         +I9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RuVZOBew+6vTm7k8LkHh8xz2Ehd/Dui+tNqUwCYx1KA=;
        fh=icIDc3aDMDPwwspmz4GBNy4KLCUsCqcjMQxWMVVd9GI=;
        b=NREDrB55TxHaLTEv2xFkLsUSyAL9UCes7vg6K27y9Cbwq8WnURtAMiu0n8yA00Ugd0
         P4O4G3DKn2Df7ucFbb60C0I+NJv5koueTxHBpixZLHypMFX8smj+k01at/l34r7TEyyS
         Kh+xrtJBxDhKC0+haM/YYg7MCf04HbNT+Gc5bwXFjSQANCoHi2SxuWiAi2ZJ5A8D4gap
         sHPJpx11+KSNZ0gpz52kQ3AUW2BXbGyGrGemujdCMeQkMxoharNHsacBbJI4nca58b/c
         w71ycVw34epMNY2jhdOdfFbcFNxLGeGJDSo7pPB4BMBrwph5WYrm9WMgtGgRw1cbesfJ
         3zxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777990171; x=1778594971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuVZOBew+6vTm7k8LkHh8xz2Ehd/Dui+tNqUwCYx1KA=;
        b=VecXaCoFlIj9CqmoVNapgknLoHjl5RbI7HTwA7DtfGRlcC6E22N0GaKT7r1YraulGs
         xmRiytC0MEgStfDP9FOjBk40yn7t0zz0yIffLqjffTpculdaFVlTre69Y4SlTeRhg7oS
         7m8NvmTmZC/daLqvqzQHRrVeXf7rlqNOgxHns9IfIFEvWEGPKJ5K9yQej3qtNiOv9+iD
         7DgyscpKn2zdAF6/T9H6YxE5OLNzAHZHI6cPklSaiEhRvMlpZowiuoPz5uk8hOWI+VkV
         FFYQQqRy6Vfe2+DvpnBtkGGNWd+902DP8tK3A4rIaU/S2QoL/Xi5JlGRPPpkj9+N52vg
         eWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777990171; x=1778594971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RuVZOBew+6vTm7k8LkHh8xz2Ehd/Dui+tNqUwCYx1KA=;
        b=ndNNQ7hy40epNb+DOz4y/+Wm/ok3Y5yxmhBtl3alYX+Pa6Hn1YRXX/EpOCdlrHS7cK
         uibTH5jYIH86STdSkKYhB3j9qCpZUQgEVrgHst3Vl+JsQ2zjM0tfnJAvORkbWrmhmA+W
         PCkf9B9XpUWB1RrYAe6qwl2YqUAgDdh1PxTtBaleQWr6NeekFMHpFzqeuxpl+FwGHkCJ
         38oPBnGQGtKcHUbWoZ5VMyWMTe35vdRI0L/dg12LB8fortp0zpKM1RvNyHpwuugPXI5w
         L+z19sd/iCea+PRY3SmxowJRB94Q/yBTCgxS4nnAR41oEGNDCuaD5PLV5ZZI0W0gDV6J
         lMcw==
X-Forwarded-Encrypted: i=1; AFNElJ/xBjyWmmU+r6db48H81+4e2AlGYbQJcQBzMoCPRN8B01E+LCuDsMxZx8i09RcsasuLw5zLt4Jx1pWh@vger.kernel.org
X-Gm-Message-State: AOJu0YwCjGP4NA1+yg7M9/82W77jdXGqwOdQk7nK1TxAvRiw1L8TuoMT
	ZPc3XcHhN3V3BPqdehNPSL6HbZ3xqdpat1+P/P3DBOdr8nxxLxj+FQ4SL0DPqgxN6noRKKEqMrh
	1cwGTeXUpMPp9gQ7rdLcf6i+VIRKhFYI=
X-Gm-Gg: AeBDieujl+EqRn1J43Zxm58WZEvkW/SPsBYfDMUU4uhAwyz8AOnM65nVlvo7RYYwOdZ
	Ecxgp9CzEHhZX9YMg4WlARKYp1vPg4AZLOMdJajuC1Z/z/PSb6Bof32IJ2iZhOocJ7thhvtEJk0
	ezT2f7GFQVWLd+jnlOA4DPiYRYRcrtbBFrDRKzAhen5O3vuRFjecNELewUIXqzexJy/QbRD/bCF
	i7bALEf51LhSaS3Z9r9ExV7rRv8V3QBx/c5fr6Izk7/ikBn/n3pIQ83N+85ZRaUuf7tlKJU4531
	PLTnpvTdo7kt0/sXCl8=
X-Received: by 2002:a05:7022:ec0d:b0:12d:de3e:be8a with SMTP id
 a92af1059eb24-12dfd84ad53mr6079578c88.38.1777990169343; Tue, 05 May 2026
 07:09:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
 <20260306103614.3208182-2-eagle.alexander923@gmail.com> <20260505101505.GB1547435@killaraus.ideasonboard.com>
In-Reply-To: <20260505101505.GB1547435@killaraus.ideasonboard.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Tue, 5 May 2026 17:09:18 +0300
X-Gm-Features: AVHnY4K5pDjrENvEpiJMrGAVMy-6LYV9HIrklrW4bEN1kY6a11Q-A9LNKZtqIe4
Message-ID: <CAP1tNvQBKWkd0e9Yr+3swhaiHvkzUV+Ewb1qLF2kEYZy78meCQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234
 image sensor binding
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Dongcheng Yan <dongcheng.yan@intel.com>, 
	devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Jingjing Xiong <jingjing.xiong@intel.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Laurent.

> On Fri, Mar 06, 2026 at 01:36:13PM +0300, Alexander Shiyan wrote:
> > Add devicetree binding for the onsemi AR0234 CMOS image sensor.
> >
> > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> > ---
> >  .../bindings/media/i2c/onnn,ar0234.yaml       | 109 ++++++++++++++++++
> >  1 file changed, 109 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar=
0234.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.ya=
ml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> > new file mode 100644
> > index 000000000000..d93fa99e6535
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> > @@ -0,0 +1,109 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/onnn,ar0234.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ON Semiconductor AR0234 1/2.6-inch CMOS Digital Image Sensor
> > +
> > +description:
> > +  The AR0234 is a 1/2.6-inch CMOS digital image sensor with a pixel
> > +  array of 1940x1220 pixels, capable of 1920x1200 resolution at up
> > +  to 120 fps. It supports MIPI CSI-2 output with 1, 2, or 4 data lanes=
,
> > +  and raw Bayer (8/10-bit) or monochrome output.
> > +
> > +properties:
> > +  compatible:
> > +    const: onnn,ar0234cs
>
> Should we define separate compatible strings for the mono and colour
> variants ? I know you identify the variant at runtime in the driver, but
> avoid I2C communication at boot time can be beneficial (to reduce boot
> time, and also to avoid flashing the privacy LED on systems that have
> one, albeit the latter is probably less applicable to the AR0234).

We could do it like this =E2=80=94 Color: ar0234cssc, Mono: ar0234cssm.
But the current approach is more universal...
Could we add two compatible strings and keep the base one for auto-detectio=
n?
For detection, it would still be good to check the identifier anyway...
Or just add two compatible strings but detect connected variant in any case=
?

Thanks!
