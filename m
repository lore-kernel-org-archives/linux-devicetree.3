Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A554949E8
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640071; cv=pass; b=lZ6AnDorbSLqSuLuw0TdOV8TVEVCsDhFeBDVPl3uQ3aqxZcG1h0/saezZq8zicLn+uY9+TMIJRf7F988PL9aaYA7rOeu/oXIo4pSiNZuEFeDbylmd9m7PV6ibBOu1VRpexsiNRFgSatWwu/mkIc6IwR08cov4m2vLae/Oho2dXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640071; c=relaxed/simple;
	bh=7Fvq3zqL/KzBPneeBMfdo/0oBRye38WJc9bujdH1Mjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kXvsV4/pM+9NrI+oVe+222xWiCpowsOUA85KCWklxcHcMCNh4mbj6FF+dPb5xEL9h3F1w9QOOafz/ale2i2pzqnoJC3yYyT0/SiidWrpVqv2PycJbOiOxHrIjSJ6UlnEsFW6iQXlHfNUivRE4Ss6/0Pcnc6SlPZftWo5B1l8tmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTiy+2Fm; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTiy+2Fm"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15e62c695cso1395966b.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786640064; cv=none;
        d=google.com; s=arc-20260327;
        b=eQVcbklFX3ygu+QeI7SCUURaP+/mCUdi23lpPbuJRHHYPbYuYfuZAEvT0yR9xVzeqi
         1oWY+Dg5SW+As4/O4+ly6h6B0xkayosMp5w2km80tVPeT5uUOMfU+6EXTEGxcx8j1JCS
         QoAMm1+gRPGxmy75gYk42aToXPD3TEVS2i+5Ay0hg85Y8HxPdb24kg7c2qGismHEVHpz
         ApvgoDD6w4aDDdhBv1iGnAocTCQ366a3bhnNVgdyWOn8YpFthK3n1VM4D6Yj8Ltm4Fi/
         yqIRm0vGZ72EuNPa0JTbqRN03zpQ8kQICBgVPiSvYT0PMwCF1BYXN724wmOlGYLYGDeM
         FiFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ww9P2ixuZzBUhiTpprwhy2KM8BvHef44lGTvhAxYQG4=;
        fh=iseqqzWtftf/Nvjgm6RMLZYkoxrU8uKphU8Pf03J5/0=;
        b=GTZ4KkCePi9V8bJDW4xtkLUAWIseB7LBcydcirSZ9v2MFiXSsxzzXgwOfleeEXtG+M
         QYniio+4xVB2ffMQ3/wCjJ+9l1Tci+pjpktigqDceTESN+qc8xEAGeQsL5MWjR4uJogH
         HpRu76uBuNboXCtI5hJnDGfkqCYz7jaGMhBk/T8+qzUqWE+9jk+PhZYW1MSjIAbAdpri
         QCFevCIhlfMulS0XkzXLviaNU0iZU1YgCMNApU9RkzwvwJGk+vYwni1pgj+crXJmPLw+
         hkFdY9fys4vukox6BCpPQT7y0WUVH97S3tRNN8D0nNuVsZG74kKuAbAN0jnOa0e0i8mq
         lC4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786640064; x=1787244864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ww9P2ixuZzBUhiTpprwhy2KM8BvHef44lGTvhAxYQG4=;
        b=aTiy+2FmIqZ5QAvJ9hUxnsAHjuo+qgdvdyOUQ1D0bfhf29sIdgekdLeQHm1aVc5n+s
         pSXiGcVuA8aFAnbuGk8fwXK9p11ke4XQD+x9MQpmoR3wZhqHmC1vAtaL0s03c+UwzkQa
         Fn2NonS2bpXByGRSfHQpABhvI+1v398/bOsaVMNbjBSgf8iKDpwxD6yCcJHhJbCryfXe
         mNJ1pDWnq1Ca6gwm7wLCYUERje/k0D6GsWTWHsjh1av+IPgRdvmI+QK/gGaEC2rMg4nE
         Ickhu4Vtl70LTfBjBu+fD0xYnj6RY25Ijmad8sScoEbaVIFk9E3I1hbWAl3el0t76hkG
         bD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786640064; x=1787244864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ww9P2ixuZzBUhiTpprwhy2KM8BvHef44lGTvhAxYQG4=;
        b=B/8fENz78t5xk5w5N3D0NZ7/KUqLo2hFRt8igEXkhc3ITY7HFQPBljcPVXh2btWuLi
         pAXm/qEUxrQCfFzOTpykpNSpYUb06WmSBvCtGWvh0FNVOS6RPDtMVK8lXylvfQUtd27K
         HlDwncfxIf+6zUMy/eAI1fk/N4KHOKzSR8C42FvSsBhJ8F7mu2gvHSxlLIe6mbNQIPev
         +fTe7JWfxsSj7PFtT0DF2zf39HKm+DKZ12Sqf+8V2Hf9X/pOOS7hlLgXBuG/fti2iXoH
         OCOk+VZPx87C4dndi0GZBHbLnW9FMZEx5r0GERuLOgOz9mNEPLBAG15PCb+epBhNyzaC
         /DhA==
X-Forwarded-Encrypted: i=1; AHgh+RoQDdsihBm8lRsUkklDoWI7ipvHqqH4Z7XZ5n4GKPMivkZN05W17nkxBdkxoF27SFQ8wOMXqdaDpCKn@vger.kernel.org
X-Gm-Message-State: AOJu0YxAMstodnI2TVNjkB26e5ZWRqBny05T7vuJi2KX6VrrcSv23rno
	+Mii7VlQaC1/iqu4jzjs8rQ5eUB/XhTLWrjvnmcnXR4SKRe84Pg/sQ361uFR+yxEW7OgzPA7LrW
	TrkfmVdfNnS5AtTlzP79Xt4iSPX7buPQ=
X-Gm-Gg: AR+sD1297EjOrO68ULdeXAY9uA2+EUshiQnZV00bRdcRTXSCJoiAWL1BWu/+zvH0OqF
	DGryVGocONvjTvn8tekQGCdYIgcTGX0OOkdLzvDFe9P8x2TlVHnu/TUvuzwxmvx7zA/wrJNJt0W
	TWDAOeBiXKZZbp/XeyEghyqZ7663+MmwWF2lWgCUNoMcMJj7E2+clRiarCdLH2m+5B95+1EzqOm
	D820Ym65NQUk46cW+ZEOXiPYYuVzjIcz9ognR0yrCA6ye/NiTPvrX6i+tRtE4JVNCZPJiKDUhBZ
	3x7tpu1bZUh9gx5L3AehePok0ZcCcqE3zxXatuK7QmDsSyX4MpCzq7SZRvHH5EHpcCJbhuQt36b
	Qf00=
X-Received: by 2002:a17:907:3c8a:b0:c16:1290:11a7 with SMTP id
 a640c23a62f3a-c2108f6adc6mr198642866b.1.1786640063579; Thu, 13 Aug 2026
 09:54:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com> <20260813164117.DE8F01F00A3A@smtp.kernel.org>
In-Reply-To: <20260813164117.DE8F01F00A3A@smtp.kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 13 Aug 2026 22:24:12 +0530
X-Gm-Features: AUfX_mzwE_muvtzUi7sgoturtrvJi-GJEAPGrT1WA_uTWsInh6m2LlCJF_HFSLY
Message-ID: <CAOWyW_6Wayw0gKMyhpy2wE6oSbikM3fKCopqxHodddM9zt1-FQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 10:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The schema enforces non-compliant, legacy device tree node nam=
es (containing underscores) for child nodes via `patternProperties`, blocki=
ng the use of standard generic names and contradicting the commit message.
Yes nodes with underscores are kept not to break older dts/dtsi files
which uses underscores
> - [Low] The YAML example references undefined phandles (`&devctrl` and `&=
pllctrl`), which will cause a fatal `dtc` compilation error during `make dt=
_binding_check`.
no this won't cause any errors related to references ( tested on version 20=
26.7)
> --
>
> --- Patch [1]: [PATCH] dt-bindings: mfd: ti,keystone-devctrl: Convert to =
DT schema ---
> commit f59b6bface010fc243ef7f899dbb8dddf737e2c5
> Author: Bhargav Joshi <j.bhargav.u@gmail.com>
>
> dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema
>
> Converts the Texas Instruments Keystone Device State Control binding from
> legacy text format to DT schema. Adds "simple-mfd" support, enforces chil=
d
> bus properties, and adds validations for standard child nodes.
>
> > diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.=
yaml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
> [ ... ]
> > +patternProperties:
> > +  "^keystone_dsp_gpio@[0-9a-f]+$":
> > +    type: object
> > +    description: Keystone DSP GPIO controller
> > +
> > +  "^keystone_irq@[0-9a-f]+$":
> > +    type: object
> > +    description: Keystone DSP to ARM interrupt controller
>
> [Severity: Medium]
> The commit message mentions updating node names to conform with standard
> Devicetree specifications. However, these patternProperties enforce names
> with underscores like "keystone_dsp_gpio" and "keystone_irq".
>
> Does this block the use of standard generic names (like "gpio" or
> "interrupt-controller")? Because additionalProperties is false, using gen=
eric
> names in a DTS file would cause validation errors. Could these patterns b=
e
> updated to match generic names instead?
>
> [ ... ]
> > +examples:
> [ ... ]
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    device-state-control@2620000 {
> > +        compatible =3D "ti,keystone-devctrl", "syscon", "simple-mfd";
> > +        reg =3D <0x02620000 0x1000>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
> > +        ranges =3D <0x0 0x02620000 0x1000>;
> > +
> > +        keystone_irq@2a0 {
> > +            compatible =3D "ti,keystone-irq";
> > +            reg =3D <0x2a0 0x4>;
> > +            interrupts =3D <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
> > +            interrupt-controller;
> > +            #interrupt-cells =3D <1>;
> > +            ti,syscon-dev =3D <&devctrl 0x2a0>;
> > +        };
> > +
> > +        reset-controller@328 {
> > +            compatible =3D "ti,keystone-reset";
> > +            reg =3D <0x328 0x10>;
> > +            ti,syscon-pll =3D <&pllctrl 0xe4>;
> > +            ti,syscon-dev =3D <&devctrl 0x328>;
> > +            ti,wdt-list =3D <0>;
> > +        };
> > +    };
>
> [Severity: Low]
> The example uses phandles for &devctrl and &pllctrl, but it appears these
> labels are not defined in the example block.
>
> Won't this cause a fatal dtc compilation error during make dt_binding_che=
ck?
> Could we define these labels on the parent node or a dummy node in the
> example so that the build succeeds?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-ti-keyst=
one-devctrl-v1-1-6f0aa87d9af8@gmail.com?part=3D1
