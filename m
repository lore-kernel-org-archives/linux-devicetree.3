Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAF83E0724
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 20:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617449; cv=pass; b=HJ2GWwZbmB0N+1bbmyktadLHjYL1RRPp0z+LSOMDYmoxgnnz2sZ/sx6TkA9YRLP6+sDYw9rb+RBG+KZzJTgpbpuAZ8+AbpcRq/dWT81wXFuk15n7b4uG0gR0fZUW1TLGhDWSxwGyhCDcPGUe32taDvUkbeRhvr8T7uZKh8cPFF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617449; c=relaxed/simple;
	bh=zOIYQuKqDNpStO0ViGu2tf81RloMLiMv3PTIgfzmFjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZdXT0nfT+TOxtVmnoV2mez10cjoNsOvNmW4qcJHnbNYxQOvsTDDXAax/zLIjLH6JkkubVGfiLos1JXrLrLcAL9kDqI1Y53ydLQWWcPleeXjiZQQzvzu6tV5rmu6y/Rks6DxJrQZ1q2QTJ53x6Bb4KafLW0pCwHxPFDVaZjd3Obo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASOYamZH; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASOYamZH"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so9625676a12.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778617444; cv=none;
        d=google.com; s=arc-20240605;
        b=epZiqoYE+RRzqJ3bUhG58Mm+PEjKjv+BkZtWJPatI8OLqSFP44GTZaqFo8svvQLR4+
         OsPvqzVF5nS1UIiRpokmqZKyWPerw9L+DRe97eACjlgmpQGT2uPQNgfTaTu1GN3po0ib
         gdO3BxBlNGixMNZ/fZdE5ak2X1JnT5zXjQm+UXFmMz8HkAezFoyj2+i2jRqcCvyMKj+k
         HRzEgD97pHZenmx4+s4L0Pr70xy4RgF4gDYbcRn4FUE2UWpdI5vHdhLIZCAMNGEtlhZX
         R5Sc1vKvnFDQ0bnBzRVmjlZb9ZW1EYYyrGso8dv7tqma9rLyFjn65lp6GTPX36v05XH9
         UA/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s5NbfZo3rJwfoGNoC6qpeTd0z48sbM+qfi9cSxeF1tM=;
        fh=XkhSsAWRD7jDpTSKgqq/imXh3bk6TBQeh/RhEMLazOE=;
        b=izPrfD77ix5T4ltgocfUHJZjyQ5HR52PImqWvx40kH+iSVuohd0qXnwttDUDhaCTT+
         tPcyuoZA5Kz/YpmFIGUOV8nCnywDM6LP7L9R3OZeyPKqbfIttG9TG4SI8MUEXJkL4neL
         a+NzOW5g84UTUNj5AKf4ldlrFz2/5tTH18MI9LL7U+KD/oqZnq2Ky3gOeYNrXLc9Vh1M
         UFXIyvN2DhxJOxGXHEBjzsrpZTu2XqD0QbXhCHvn4KuB5PxlLNg3kEJy8hffd4D1Plte
         VBL3NAn0l1MhAfQGhlsCAm9Jvm7tlJrU76UOzIzRlt34dUu2Wr/D11iwWyMXi7PZ3o7a
         uibw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778617444; x=1779222244; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5NbfZo3rJwfoGNoC6qpeTd0z48sbM+qfi9cSxeF1tM=;
        b=ASOYamZHqZPiLAWqwI0yx8YELqToVWlL8bsNLfOJv3OjHWlxuBnTq/axuxbopsTRkR
         gLHhC//dA6h0z9P5LAB/Bvm4DR910ramnNcqbhBtb6VT0tlPIKn23kGtmib/xX27EWZU
         OqGq7+UuXr9DDuVp9BKttMj1lRPDnaSmYQWbf0CzseSDziBWqo6qA7JRHMebsdIySuxm
         OCCB3RLZN7Qw+jTKz3y8xnyVq2A2chHmncMC8qf0yudCFDEN9yQ1Lo/eQGqGg+OYx/w2
         POnCJrDiVagq/akGAAwaQhCt9rzCVqg+Ezfb944AiB0u4QV5mdtGQETKIg3gVk8MczS1
         T0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778617444; x=1779222244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s5NbfZo3rJwfoGNoC6qpeTd0z48sbM+qfi9cSxeF1tM=;
        b=jYa5M594X1Cd5lAyQdY1mWLg9frKI/Dr8/ZteHfFah0tL+MVg4ghwjZfzv4dF9a3hM
         aHIwWwoQKbVnU37N2/Bh7A4zZ3swYppNpadtg5mFb2WFuyIRa4tOVJs9oe6jcarlf3nJ
         eExohNYh2jJv5eG27gWCKevCIa9rOM06HOruMRRp0W5ScuY8pn8Tg+HAelXgtRy1JjwA
         18X1Gc+78VpuEp0AsYfP4ot8oJzAwrC1CwWHKk0EAtlPnRt2oHCuKuCPAHUoniwt3J5A
         suQwWioloeZEV2+i4vM/DRWYwdgMLh1PTtaE8/4G9rOQmZzuW7bVFmZPH+qtxEs01fAk
         If2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8vyQP+/vaa5i6to7UtDj7Pia+cKfpUy0R9vivs+5xmnlA3J1WUslnR/NpKlSzQDNNE6OX2mwb8FcKu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr1Sq00bqIk1l7vuRlODCUcfYbNH2Au4HV9DJZZoAre7YwDbuZ
	5yKkXF5fO/fQmOzwfu6H/43bkz7r7l1aGU+rLhwLYdLGgkbnyFmL3y9TUaXHAhotu7buKy/kROL
	lGYSIGdRJUvgMZX/gQTCdfk1Hv7tAjQ==
X-Gm-Gg: Acq92OEY8VqpO/WnSpGKz33bTZ0OrVBqcr4I4B+XK27Ca1ht1+0brNkrTlTVVc/EY1z
	IdJzd9nF9pPpsKWrQ/j2DIBiMRBj3l9J69uFpKb8WmG+Ym0uPua6+AT3kHtKDf1AdO/Tl9vkLvy
	cjoPr2hl0mniHPfN2rPSK40ZEOcHiowWzWoqTrkblLNiG4BWtg529Q1P4JyKopkO+A4DX9w50wA
	n7k2oeo4bsnj2PyYJqnkI8hqftsJ7lBsD6XNtd8CAdgB1z4UBlHwQKCE5E/c/db0ti7jBVFYkIw
	FJ4=
X-Received: by 2002:a17:906:7313:b0:bc2:e83f:c438 with SMTP id
 a640c23a62f3a-bd3c161dbc9mr20196266b.31.1778617443298; Tue, 12 May 2026
 13:24:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511211143.19792-1-arouhi@sitime.com> <20260511211453.20671-1-arouhi@sitime.com>
 <20260512-cadet-overrun-c66bf033e024@spud> <CALFSGurCGzyk3mOPnyP_p2o+s9kCCQZc4MjBsDpPxqSPV1ZseA@mail.gmail.com>
In-Reply-To: <CALFSGurCGzyk3mOPnyP_p2o+s9kCCQZc4MjBsDpPxqSPV1ZseA@mail.gmail.com>
From: Ali Rouhi <rouhi.ali@gmail.com>
Date: Tue, 12 May 2026 13:23:51 -0700
X-Gm-Features: AVHnY4LmWnYP_EIb2Ffl-weepoq8wJbkHWR7bQAmE75NVC2lYu2L_5K52-anKZs
Message-ID: <CALFSGuo8_JMh5jJth+pDPfYWNn7asAgxqtjiVFZK85GcvvkTzA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] dt-bindings: dpll: add SiTime SiT9531x clock generator
To: Conor Dooley <conor@kernel.org>
Cc: jiri@resnulli.us, vadim.fedorenko@linux.dev, 
	arkadiusz.kubalewski@intel.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, cjubran@nvidia.com, Oleg.Zadorozhnyi@devoxsoftware.com, 
	devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ali Rouhi <arouhi@sitime.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2026, Conor Dooley wrote:
> This is not relevant information in a binding FYI.

Agreed =E2=80=94 removed the Linux-specific paragraph from the description.

> Description here shouldn't talk about what linux drivers do
> with the property. Remove the second sentence please.

Done =E2=80=94 reset-gpios now just says "GPIO connected to the chip's
active-low reset pin (RESETB)."

> Same here. If you even converted "uses it" to "should" or "must"
> then it'd be fine.

Reworded to describe hardware behavior: "Asserted when the device
detects a status change such as lock acquisition or loss."

> Can you explain why there's no reference to dpll-device.yaml and
> none of the properties involved are used?

That was an oversight on my part. v2 adds allOf/$ref to
dpll-device.yaml, switches to unevaluatedProperties, and includes
input-pins/output-pins sub-nodes in the second example.

Thanks for the review.

Ali


On Tue, May 12, 2026 at 1:15=E2=80=AFPM Ali Rouhi <rouhi.ali@gmail.com> wro=
te:
>
> On Tue, May 12, 2026 at 10:52=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> > This is not relevant information in a binding FYI.
>
> Agreed =E2=80=94 removed the Linux-specific paragraph from the descriptio=
n.
>
> > Description here shouldn't talk about what linux drivers do
> > with the property. Remove the second sentence please.
>
> Done =E2=80=94 reset-gpios now just says "GPIO connected to the chip's
> active-low reset pin (RESETB)."
>
> > Same here. If you even converted "uses it" to "should" or "must"
> > then it'd be fine.
>
> Reworded to describe hardware behavior: "Asserted when the device
> detects a status change such as lock acquisition or loss."
>
> > Can you explain why there's no reference to dpll-device.yaml and
> > none of the properties involved are used?
>
> That was an oversight on my part. v2 adds allOf/$ref to
> dpll-device.yaml, switches to unevaluatedProperties, and includes
> input-pins/output-pins sub-nodes in the second example.
>
> Thanks Conor for the review.
>
> Ali
>
> On Tue, May 12, 2026 at 10:52=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
>>
>> On Mon, May 11, 2026 at 02:14:52PM -0700, Ali Rouhi wrote:
>> > Add device tree binding documentation for the SiTime SiT95316
>> > and SiT95317 DPLL clock generators.
>> >
>> > Signed-off-by: Ali Rouhi <arouhi@sitime.com>
>> > ---
>> >  .../bindings/dpll/sitime,sit9531x.yaml        | 82 ++++++++++++++++++=
+
>> >  1 file changed, 82 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/dpll/sitime,sit9=
531x.yaml
>> >
>> > diff --git a/Documentation/devicetree/bindings/dpll/sitime,sit9531x.ya=
ml b/Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml
>> > new file mode 100644
>> > index 000000000000..0b05f0de65b9
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/dpll/sitime,sit9531x.yaml
>> > @@ -0,0 +1,82 @@
>> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> > +%YAML 1.2
>> > +---
>> > +$id: http://devicetree.org/schemas/dpll/sitime,sit9531x.yaml#
>> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> > +
>> > +title: SiTime SiT9531x DPLL Clock Generator
>> > +
>> > +maintainers:
>> > +  - Ali Rouhi <arouhi@sitime.com>
>> > +
>> > +description: |
>> > +  The SiTime SiT95316 and SiT95317 are I2C-controlled programmable cl=
ock
>> > +  generators with integrated DPLL for synchronization applications.  =
Both
>> > +  variants contain four PLLs with automatic/manual reference selectio=
n,
>> > +  DCO frequency adjustment, and phase offset measurement via an on-ch=
ip
>> > +  TDC (Time-to-Digital Converter).
>> > +
>> > +  The SiT95317 provides 4 inputs and 8 outputs; the SiT95316 provides
>> > +  4 inputs and 12 outputs.
>>
>>
>> > +
>> > +  Runtime configuration (reference selection, frequency, phase) is ma=
naged
>> > +  through the kernel DPLL netlink subsystem; the device tree describe=
s only
>> > +  the hardware wiring.
>>
>> This is not relevant information in a binding FYI.
>>
>> > +
>> > +properties:
>> > +  compatible:
>> > +    enum:
>> > +      - sitime,sit95316
>> > +      - sitime,sit95317
>> > +
>> > +  reg:
>> > +    maxItems: 1
>> > +
>> > +  reset-gpios:
>> > +    maxItems: 1
>> > +    description:
>> > +      GPIO connected to the chip's active-low reset pin.  If present,=
 the
>> > +      driver holds the line deasserted at probe.  Optional; boards th=
at do
>> > +      not route the reset line omit this property.
>>
>> Description here shouldn't talk about what linux drivers do with the
>> property. Remove the second sentence please.
>>
>> > +
>> > +  interrupts:
>> > +    maxItems: 1
>> > +    description:
>> > +      Interrupt from the chip's active-low INTRB output.  When wired,=
 the
>> > +      driver uses it to trigger immediate status readback instead of
>> > +      relying solely on periodic polling.  Optional.
>>
>> Same here. If you even converted "uses it" to "should" or "must" then
>> it'd be fine.
>>
>> > +
>> > +required:
>> > +  - compatible
>> > +  - reg
>>
>> Can you explain why there's no reference to dpll-device.yaml and none of
>> the properties involved are used?
>>
>> Cheers,
>> Conor.
>>
>> > +
>> > +additionalProperties: false
>> > +
>> > +examples:
>> > +  - |
>> > +    i2c {
>> > +        #address-cells =3D <1>;
>> > +        #size-cells =3D <0>;
>> > +
>> > +        clock-generator@68 {
>> > +            compatible =3D "sitime,sit95317";
>> > +            reg =3D <0x68>;
>> > +        };
>> > +    };
>> > +
>> > +  - |
>> > +    #include <dt-bindings/gpio/gpio.h>
>> > +    #include <dt-bindings/interrupt-controller/irq.h>
>> > +
>> > +    i2c {
>> > +        #address-cells =3D <1>;
>> > +        #size-cells =3D <0>;
>> > +
>> > +        clock-generator@68 {
>> > +            compatible =3D "sitime,sit95316";
>> > +            reg =3D <0x68>;
>> > +            reset-gpios =3D <&gpio 78 GPIO_ACTIVE_LOW>;
>> > +            interrupts =3D <12 IRQ_TYPE_LEVEL_LOW>;
>> > +        };
>> > +    };
>> > +...
>> > --
>> > 2.43.0
>> >
