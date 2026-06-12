Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C8029E10B
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255215; cv=pass; b=Rtb8hMTvaK6mvw2f19SFZ+flfFZPD37D4cKNPC/1XTWmpnquWxVQw2U8RzwcHKUucn6Qt5qpooIJozLn3FoDnScDa9xYW3RKchRDQA+D8PPLL0lFktlNFkx7poDLqHZnVSt8MTdSQYd3SGXvi7MxVFPGXFl08p5d4P79cIYiN0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255215; c=relaxed/simple;
	bh=IsojegjKAwdLgtUNQObWKq5Q0mjssDHUxhr29/dEiVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQTRdXquVk9qXzX5jMcN77q7OFU3J4T7K92tPfl4URZ1+9nmRjUoRP/5m8y0jGmRIjihFp6r6epLa4vCNN35fUJo4GMfNktuje78BsM0MAo9TT/E15mwO+xjYrhWDykHXdGLbuCWHfMmH8grB0jlG2FKIkOaJx4Tw13PenXl7F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwGVSarp; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwGVSarp"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ce9df31130so12093576d6.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781255207; cv=none;
        d=google.com; s=arc-20240605;
        b=KmkDgs8sgEGI0Z6uNFKalpxeJB6hqRnN3suK14+EUJx6Lm4Nv22lGY7DN1GTLDzWiy
         XJxOWdaF3irQdtixSBmxL1c+ABcjkk5ARLnHR3zRkcqKMXDApH6WemShbD5/Z1FV5ha+
         WxRu2/9KtU+nQpeu09y2y6n0imCfeumChTkOMkYS9p9UBG7DFQrzTU6jkDTI24LeV7EG
         +8qMcIztxNuv+uMlFwxbCJICbb5qXNxxrBD6sAKBcVdrG9e7TMhnXMuaWoFo6mVtJg2v
         l58JLcX2cCMtCwWuuYYuwcqrhb0lXGvIkLqvhrdvjZ7WUuTudnklQHSJAV1znvfLXt7g
         wwjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jWwQjl84zpgSaQa4jqoTy8ry+T8ZHf8hg3Nkjy1g20A=;
        fh=2XZJ8FpA/tnFHksklEIR8GOPq9Q4HTWWiC/1NcexXWk=;
        b=cZGsUStmQxYcdRPZ0qugoczfY30jts9R584r//zg+iIJ3Ve21aYG8jtq7TTHalPniA
         osfu3bgfwZkIiYnQoz0olVqewmwNBuHW9+dgQ2yF/Il6Tm0fRUngF8hF1VPm/LSe5kCw
         LjaBRa5hB98jTMGNkVNIIjZmMjB/72fBu5ZhtIyLyZ/r4qhcD/Kd1nbt18Wheg/y+/5R
         vTD7CBdTK1nIAb8HbpY1ufQDW2Bz1/rR1QBe2HzIRdW83ved0L1cgX6O0objRQsmkKV9
         o0g58iAsq9M9FPpa4cEZWo202sLt/kdwaZB716o4W+ZmfaG6DPtbIw6Z/ucyEYS9LbvI
         IaQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781255207; x=1781860007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWwQjl84zpgSaQa4jqoTy8ry+T8ZHf8hg3Nkjy1g20A=;
        b=XwGVSarpY5KHHgERiE6pBCGc94GK1IoXCcBCcnVYBRBvyj2Wt0A+T5qIvLFwU+r41J
         JGOMgnfMlpdqI1IxHZbtXPwFo2QRMJaPco7bUL3SGvB1MmyDtl8Q4BP7NSQ61FvJL5rn
         Ir0+mF4R63nc0On+F0D0eXpJmRg4zpyFnEUWaZUu+QckELQIfk+DaVZtF6SERJTjrJGQ
         W3zWsV9U6t3tD0ba91oy4rfcUOfVR+r7+vBp+g3YmdYDr4KNH2ip3g8TPsYsENcLmn3/
         vBctj+esOEYd5hWE1p3mTFLYpuF0AWlGgkCR0looUoHIta1lyYdaXeJiWt/VhZjyNDxH
         lJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255207; x=1781860007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jWwQjl84zpgSaQa4jqoTy8ry+T8ZHf8hg3Nkjy1g20A=;
        b=NpNtEJy7CFSBy8BD0Gbti+YhFw2HT3hebUvBS+qrKq+dsCdy25BZLsaR016mlQ1hUT
         r5ZxPGpBYjjac0LxUoAt0r2czKVQ+VI3Uj80f38nPU6x8WDNcyIrTS0YWcdN3Yy3Fao8
         29HZ8VXReVzjdL+RH8eMrS1K+93hgkwJGgIhAg2jhHBIzJmNIq+OpH+aHu8GGbKvnQCn
         LGU+x46ZP/UE3f0Yy8Tm7H/a3UfV00+igF7mAuE4nPVLRw2h8EL66OsiEk4Lb/9iyTbP
         YaShLm1AMnSJvyXC/C5CU0MEZ/3uPchFttZ50kkMbwo/jHaN+xDlNKapaK7hYY9Q1531
         jc8g==
X-Forwarded-Encrypted: i=1; AFNElJ+s4gLSBcL4xDSCdhGOdADBIvdu1f5PEUhiK77X1mFjp4hSTmxWIOMbkO0LeWTY788Y62wIDaZzWOBP@vger.kernel.org
X-Gm-Message-State: AOJu0YzJMei+6fEINhfHiK9EqyVOhJPMf+NAY6DYigIM6YI8XptjgpVH
	elEbga64kfRofkw/6yWrrEhrhjSREqQuGt06V9VhfSoec1B7ub1pAlDH/y1H9l4dQgCAcPsVeAG
	ZDFuzb6WgGf1IRwRkNxfCKgPQ132SNr0=
X-Gm-Gg: Acq92OElZAOhgUaj0T0MsjccAjMuOvzFWYyjaj15mp9i/OnbbciwtVLdb3UEX+LrthU
	j1+nj9V+26Xhv3Cd3TNgO/5Hx+UgiA0binWQkaIqqNTsM7TN+VXp1QpMPU2b/qPAjcL1yWCz1e9
	+/RU6vaxK11VpO1ImgITQ11YjtVDLVk1qWk7TjxciAmD+pJfZd987Ejg/x5OQFZW1Bq8YsvhuOs
	cmtEkCY+e224tH7fTVWppPGnFS3xUDAXg244MHxr77+7eYjysMBkK+hMa8MTUr4zvlaRP191FiG
	5GUhEUhL
X-Received: by 2002:a05:6214:3383:b0:8ce:e416:610c with SMTP id
 6a1803df08f44-8d32cabe370mr33975566d6.19.1781255207244; Fri, 12 Jun 2026
 02:06:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-lm25066-cl-config-v1-0-02e567bf3d91@gmail.com>
 <20260611-lm25066-cl-config-v1-1-02e567bf3d91@gmail.com> <20260611-mocha-strive-a7f3265dd3f4@spud>
In-Reply-To: <20260611-mocha-strive-a7f3265dd3f4@spud>
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 12 Jun 2026 17:10:38 +0800
X-Gm-Features: AVVi8CcNLcTbD6v5Tw0D33_UI0Q9NrseU5jWT3dG2q2Uo9P-neDK5VnFrDmIZiY
Message-ID: <CAGfYmwWPhdpTLGhOdddJ0hSj-H86+XOVGTR9eDkZSVqGRLfJvQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add current
 limit properties
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Zev Weiss <zev@bewilderbeest.net>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
	Potin Lai <potin.lai@qunatatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 1:27=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, Jun 11, 2026 at 05:58:44PM +0800, Potin Lai wrote:
> > Add mutually exclusive 'ti,cl-smbus-high' and 'ti,cl-smbus-low' boolean
> > properties to configure the device's Current Limit (CL) behavior using
> > SMBus settings instead of physical pins.
> >
> > Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> > ---
> >  .../devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml  | 20 ++++++++++++=
++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.y=
aml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> > index a20f140dc79a..95ea7c26dec2 100644
> > --- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> > @@ -46,6 +46,26 @@ properties:
> >
> >      additionalProperties: false
> >
> > +  ti,cl-smbus-high:
> > +    description: |
> > +      Configure the Current Limit (CL) to use the SMBus high setting.
> > +    type: boolean
> > +
> > +  ti,cl-smbus-low:
> > +    description: |
> > +      Configure the Current Limit (CL) to use the SMBus low setting.
> > +    type: boolean
>
> What's smbus specific about this? If the pin was connected to a GPIO,
> you'd then need to have different properties or use these ones with an
> inaccurate name.
>

The "smbus" in the property name was originally meant to indicate
that the setting is configured via the internal register over the SMBus (I2=
C)
interface, rather than physical pins.

> Please also spell out "current-limit".
>

I will rename the properties to "ti,current-limit-high" and
"ti,current-limit-low"
in the next version.

Thanks,
Potin

> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
> > +
> > +dependencies:
> > +  ti,cl-smbus-high:
> > +    not:
> > +      required:
> > +        - ti,cl-smbus-low
> > +  ti,cl-smbus-low:
> > +    not:
> > +      required:
> > +        - ti,cl-smbus-high
> > +
> >  required:
> >    - compatible
> >    - reg
> >
> > --
> > 2.52.0
> >
