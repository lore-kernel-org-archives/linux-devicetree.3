Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC7941167E
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102742; cv=pass; b=uJko2yW04L3MhlMHZCPErK0jmTU7mepfOywmuPhtZ2Cn62Vxk1rHVH9MDcJk/kF3f16c2t2+VjRXDDaOOauXBPi6Wu2AmR0T+hWReNeGiKwJR4AtVEKdd5iUbxgyFNZ4NLF4cJ+HGhlroR/psS5NPEnTBGU1K/l508DC8fuv4AQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102742; c=relaxed/simple;
	bh=GswxPypzPfEQ3WUnspGh8ax+2FMG/mXlBTk2AXjL34M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wy8GvSYQqAslZWkNw/1ByHNWZEBlQ0ozArkdzsAU4yfMqCOiXDHSDBBQ6b0XPIc661utIUK8ohY3AWv9dwFldjIiSe9kra1Dq2AXiV7vhTU3FlVEmjerN6sPj5kL2v/yx5HULrRigCnPD99FZ3ugQ5Mr8cAN06BkU/E2fnubkLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PS+V+z/l; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PS+V+z/l"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3075ce9c05aso919282eec.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781102740; cv=none;
        d=google.com; s=arc-20240605;
        b=R0gu8zmuym4buUCFdgtFY/pOu9F0+U6aSHEFdzgbJ4eFFtldkOpcegRLip140hQL2i
         NwFC/N0rzt5vVvGINF0sCL6HFyKE3Z4FWmeERUXiY28WKqGHmiUJG6dd8mvAOJi+NARn
         Dfh44vIi2gUbXsynwSLyFjaktwpxHCE5xc+ukKv1j0UgeOoY8F1A5PO4LkiOphuwZ8zE
         DrVJ3j4P0PqGY2/XAtLI7drkOUDh9jX7obWOcFDqDHo0ZzLB3rOuWnQD9JtUYoE2QvD9
         6MPa5Ud8rncY+ooV9C52FaU2xW4Wjinr9vP46Bkyr2l33N2raPtleEWcofJW9pCP5sdt
         lu5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c9jdnGhl8zT/c5+VTx28YYMOorOCQjdA4WuOVZ2PMo0=;
        fh=4rbCAr6B/jSDSviBpNzEfl+1nEGKwRNStf1Mb/yaTdU=;
        b=Swtnrh0F4RcKJqL2RZdZSSUEu2ksLgUKs7u2ggsJ7tDbRHrckRMDq9sn1cHpCv5kdH
         N3eef1mR6a3rp6Ci2VX5/nNLkmweZt5r8uJ9nnR9XOfBOj5CUFakDjDejjMwvxvMTfw/
         DUBvlNcQPkv6cwok2rVhMJCpc/MO4FdySFG+B1gcQuHoCJlU4h3OHeR+SzyECoET0MHB
         EgxUGT1xFSdTaGorltYj4bz+C3QK/mmiKyTARu+32PWWwOLQigfKotU0qEJpMFvukFN/
         aAserrKuGjN8agVPqtsRALE5wF/Seg/DBpBuULgXamWx1yxCUTkfu1WO5s39BtZqcFfL
         C1Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102740; x=1781707540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9jdnGhl8zT/c5+VTx28YYMOorOCQjdA4WuOVZ2PMo0=;
        b=PS+V+z/lvGHsNMiNLqAsuwXOJkGXmiJ7LdnOhP8LK5ZZ9ZfeboGuHxsVDIoBJsGeST
         qNCto5PN+wb7quOFQQdpV0kU4Hu+YaoYXZVqPMUurk6HluuoWyOPymeXxzolPkocYUDi
         EwsWfEFqo2XSpWWX6Cu3HFv3RqI2SdG0afwCDT3XMDVcNs6XGHQMbZZmqaCDuX5eWFrL
         N8ewC4XeYxBO9tSOG2FAnC2X43MxtriY0lh9PedRNcZ0ghV2JV4L2BiKDAq4fkJLKD57
         ghmcWTg4mfbxLje27RUG6Uu4P33Mr8oUt0b858zMNFeohBFYIPUxGY55huG86dzO6Thl
         ZSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102740; x=1781707540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9jdnGhl8zT/c5+VTx28YYMOorOCQjdA4WuOVZ2PMo0=;
        b=C6pnG0YwyjJXhkN5xDf6d9kEnEDIDRxGIIxaIPs7Twisd0Kqnx1+J0RmyIzDNLnOZt
         gjrG2O67R1ov1c+tYicW8IUzGuR217TnW5PmZx3Bg7NmfJaRVweHVCmt8BmjKPIO86Ee
         OAIVeG8uv8k0JnsX0/WgxEA2MPMfR6Q72W2oOdakpYFGL7epflv05+taMPF2F/4ngvWR
         AbUJOIykgjsaSeOwLFgrHw1y9Tl6AqI8WLtQPJxIY91Nymlemu8vM1coqbJr2AKJ+sYN
         4/ioFsJ0HeWMqkqGkcWizdaZVqWsUIhKCmjn6RqqNKGarZYbkeBEypAjGfuyupTVJ6+a
         Xl/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9gT03hdcajjBu2Ts0ZEANena4cldl3oBX/1fOee7lQQw+XdCcZNAypIkKoo6lbgG18xR3pTUlbFFNj@vger.kernel.org
X-Gm-Message-State: AOJu0YxT8vUiPJ/LyImeGauCO/DqCpQ/7Yn8ITFRnGb9Srtt68pgLLKx
	3WVHU3BK3BsXUE5fwVxOqw1LUGikQv0U7VxFEsOafWpz3hG1oWmCJMj8+MMzYhA+AtGHqnk3HSR
	9NCNz4ywmUV+AOo3u2gEZZnDPep50wfY=
X-Gm-Gg: Acq92OFToFwSmB89GVswB/4wJlNd6Cb4wZie3RFMgH/1xTBiZKg3r1x0NalTfHc5tfg
	9RKu/Y5L+veA0FRsvHeOqTWy4is4yL6S2W9ffuBahR5X+uVAWLpptxACyvDIe9DIb5KWOVksFOn
	zRGzy7iuGzkb7P7M8YG45f1P8oNLYDcbmlpYToAbL1Eo7CL/PABZua3/LzQxmXlgS7774d5vE7J
	wWpPwXxMs+j+l9VurO1Z6KqYl+zo/AFQOYWgsMTeCAqg4LePTgbLmbFElMZDUdz0+OASAexhvFM
	jh3uua2qjPPFC9lCf48=
X-Received: by 2002:a05:7300:4307:b0:2ce:3aa1:d39b with SMTP id
 5a478bee46e88-3077b1e1921mr16407205eec.20.1781102739833; Wed, 10 Jun 2026
 07:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-15-clamor95@gmail.com>
 <aihoH9Pmzufa9pnE@ashevche-desk.local>
In-Reply-To: <aihoH9Pmzufa9pnE@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 10 Jun 2026 17:45:28 +0300
X-Gm-Features: AVVi8CdnB8ApS2xg5kxxnd98RqCsR1fmVPgPcGfJlrd3mQBMI1CAmZLqR9DFIrc
Message-ID: <CAPVz0n0m+i7wexfC0BWwvdOuJxDk_=x+EpxEbNmoHN1AsEmfNg@mail.gmail.com>
Subject: Re: [PATCH v4 14/14] video: leds: backlight: lm3533: Support getting
 LED sources from DT
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 9 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 22:23=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Jun 06, 2026 at 07:57:38AM +0300, Svyatoslav Ryhel wrote:
> > Add Control Bank to HVLED/LVLED muxing support based on the led-sources
> > defined in the device tree.
>
> ...
>
> >  static int lm3533_led_setup(struct lm3533_led *led)
> >  {
> > -     int ret;
> > +     u32 output_cfg_shift =3D 0;
>
> No need to assign the default to this.
>

This is a personal preference, compiler will optimize it if this is not nee=
ded.

> > +     u32 output_cfg_val =3D 0;
> > +     u32 output_cfg_mask =3D 0;
> > +     int ret, i;
>
> No need to add 'i'.
>

This is personal preference as well. There is no strict rule that
iteration variable must be defined strictly in the for loop.

> > +     if (led->num_leds) {
> > +             for (i =3D 0; i < led->num_leds; i++) {
>
>                 for (unsigned int i =3D 0; i < led->num_leds; i++) {
>
> > +                     if (led->leds[i] >=3D LM3533_LVCTRLBANK_MAX)
> > +                             continue;
> > +
> > +                     output_cfg_shift =3D led->leds[i] * 2;
> > +                     output_cfg_val |=3D led->id << output_cfg_shift;
> > +                     output_cfg_mask |=3D OUTPUT_LVLED_MASK << output_=
cfg_shift;
> > +             }
> > +
> > +             /* LVLED1, LVLED2 and LVLED3 */
> > +             ret =3D regmap_update_bits(led->regmap, LM3533_REG_OUTPUT=
_CONF1,
> > +                                      output_cfg_mask << OUTPUT_CONF1_=
SHIFT,
> > +                                      output_cfg_val << OUTPUT_CONF1_S=
HIFT);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /* LVLED4 and LVLED5 */
> > +             ret =3D regmap_update_bits(led->regmap, LM3533_REG_OUTPUT=
_CONF2,
> > +                                      output_cfg_mask >> OUTPUT_CONF2_=
SHIFT,
> > +                                      output_cfg_val >> OUTPUT_CONF2_S=
HIFT);
> > +             if (ret)
> > +                     return ret;
> > +     }
>
> ...
>
> > +     if (led->num_leds > 0) {
> > +             ret =3D device_property_read_u32_array(&pdev->dev, "led-s=
ources",
> > +                                                  led->leds, led->num_=
leds);
> > +             if (ret) {
> > +                     dev_err(&pdev->dev, "failed to get led-sources\n"=
);
> > +                     goto err_deregister;
> > +             }
> > +     }
>
> This and other pieces may benefit from local variable
>
>         struct device *dev =3D &pdev->dev;
>
> defined at the top of the function.
>

Yes, but this would require an additional patch, which I will not add
to this already overinflated series.

> ...
>
> >  static int lm3533_bl_setup(struct lm3533_bl *bl)
>
> As per above.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
