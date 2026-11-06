Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793971432;
	b=NdnH8alBjK0H/36U5rkP6PS4aCzOPZHgAwJYpUL7l9i+fL4mb0/S1HOPyt+yubEatfo1
	 EqXPKiVt+QH8IIV949KdeTn+nLP6TdNTQzdYr2RyFTTrphd/bbnIdkNEZT8xq7eNiYOz9
	 KZ3FL6BdyG+b1EAts/m2RTbW9ASWz4gyRpiT/3atpikppurgxq5opjGFT8nJMqxRKdfmQ
	 UVfMwImUUPb7BHFQRfk8lWS79KM/hXef7hrxnwwgTMZJMYNwJE8fCc0HQNzuRXLX9Akxi
	 gGfb/RsS1YHPCXVI7svjm17jrPViSpy0bMsqZUkmXvYEEp6+FvH457tgQF4xluEzxog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xAJq9wytSX4+H+WLnHrUbYxJzmWP89byfUacTSBPi9M=;
	b=xnvctrFFO93czftJW6WfcrydGM2wqIttb4VmKVDDJoscZk1HqbzQzu6jhb3C4LgP+h2l
	 xlIEhADRyR+5/jxiCzE1MQ/Xbzk45OAP3D/mFjwQInhuKGWrFRKK9rFIN24IKUx0+sYyp
	 GxRC2TYtEqVqRRjk073BOfDKYVT7zZ6HmqeQriisD6Bq13LAk0O1uwrge7A8z+sshcQER
	 8ecL3/uoUGi4dARktqjRLj7VncveNbTUty88gZjX9a0LqSje+AjEHMygtRsYXeLFegxAM
	 L65/VgrBUYxobghrKfoKzIYZzA+se0/uwHnJhL2jx2LwBX8vH8hN/uF11H79YtDLUWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UHyT6Y3I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B725D606A32C
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 13:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B725D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UHyT6Y3I
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c40db84b4b5so5206766b.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 05:23:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793971430; cv=none;
        d=google.com; s=arc-20260327;
        b=CrprE+HtNTCL0YSHGb7o6GsdL85iYd531p25XaeUuwrfaaxhvqayWLZNS/9KLTBsbE
         MQcMmmuqC7yUSeFEb8BCdtWBGJcyqf3cAO+gCpZG3lZjaBqJbk39t93p93CX0WhELJdM
         GaPP/KA18Pmg+aI2jqm3q7iRleoaV+q3w2bfPRros6jZA3kLQdR5M/L8cwfEsxtL36by
         kyU2+lY3OMABgTNrO3DhEI4GZvmyVUNVONJQCvSNVOFUcUulxNIcOtNdzgNNILi1qYgE
         YMiS/UHsrwgDa7OCYtwlCJ7ZPoPeTKLjCNrO7b3SLheFfiTZIiLP2ELIf9g7RbMLi9W7
         a/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xAJq9wytSX4+H+WLnHrUbYxJzmWP89byfUacTSBPi9M=;
        fh=RIbr40C722tsL7VFgKhlYnfGul/q321FN0dOZ+QmPck=;
        b=G/IhWOx8a5/O+Ff0RP+/YjbTM4jf2fK0sQGyEPmmP48QsueLwdHFUUD4/wij5eOy3H
         xqg6UT4e66iOtkLInYYroigEi0FJI/EUPgrTs57wlzk3KiajbKVXZ4sdzmHlVq4OaGft
         pIeClIXXlGebyaxSRTSVbpzo6Xl4GEEibMkzDK013qPvFqpdh1SyhtkXfYaS98hwc+hH
         Z/9eQ9osX77TzJupXsdr/tIhlT4EAJJ70xgtkTr5GlBWyRmO2/dPOG2z8WKzxepr+dZb
         6U0krwEHu3FRVH1/A6hnPhEzUwqSE9mP1SwP/ZqmFWvlKLapQQnk7Wmf2OVB9C/STsxE
         MqDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971430; x=1794576230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xAJq9wytSX4+H+WLnHrUbYxJzmWP89byfUacTSBPi9M=;
        b=UHyT6Y3IlscQit7QAcP8D623Xc5Zrq05PDz517rtZczx8QFEHTMAADKhgDY4BNamP4
         6bmfp7EpufEZgX2ulI45dbgCntQnaqCe8Sg3oI7Y68x0Blwkjy8UlEZv2OTyYWIGT18a
         6OH/TcOBsVVLjxeXjnVt0O7s0f2dBLb3uWvO9noZfSowQfNG8/KqFFQ9vvqWgkBX/N1x
         Dn0IrAIjGHl0tyT8l0i0S+bS1rzcEuNfqu4DnRQGh3V/IIF+msfVcZni59LpVqkd+UY0
         cYpTTPqxm8xvbVgUKQMvoJy/xuTOqCOA0knDOWVL8XwOw2Szsamxt9fOkBDN6MWWAETD
         ZnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971430; x=1794576230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAJq9wytSX4+H+WLnHrUbYxJzmWP89byfUacTSBPi9M=;
        b=Gb2bHRzrxnTj3fsjFmNlX1xS+zpW9XtErUAIECApFAfQX3C7hArLR5urJ1eEWm8Lvp
         z9iL5vvS0mzgU2Isc6qRQ98bbNoKlywGNSqhsp7ixm28R4a9EOI4HGyGCWFM+OxdEgRU
         fRy4G3srLOzCq1CNrGZA8lfFkj3swyx1FoL01e/szjHojlicwzNDbQomF6usM5PDGLY9
         gQyMawXyEUfaaID7wYEZ78cfPJboWz7EbXw05BOPRWZn5aWw1LSpBE6qri1Sxc4nopTL
         XyiSCBPL5bb2hcfgxHFmIBl12eu2yt6IsOjfynpd3ZlsObkd1dZ0aM9KA3D6czdo4eie
         2F2A==
X-Forwarded-Encrypted: i=1; AKwUvByc9WvKrddLnJcukeLPSTO3y6G54nhXpZFR3JDwkCh4RQeCn63GM106BWQfGQiwj1yWreTmAGWigIVN@vger.kernel.org
X-Gm-Message-State: APuU4Z8iKCtpoXCNsO5zj0T0vP93PZcreoUWDBcSJCxoLkgTyJ87gozT
	rhKvw+BpC1sBn03CLHQrzYrAejBghP0IBlMUFW7Esxyg6ESu/9+lg2Ed6w/1MPxOoksf+3x3VyG
	Aw3rtxpPGLRRhq7WKcZLI9GZeJGAvw5s=
X-Gm-Gg: AYBFou2QbogQqWM4kd94QmPRr7A2TkmhTJWdWaMhZCZ/6KyFCr2XTo14mNdUY7d9gBE
	R5siXb8Wl/OzeEeRQGWN/rK2asvuN0tMVXR/EONwNz1pLSKYEMPuXF40cBtMDXDRaMyfIEXY902
	tD4osUswiMin0kqNmpFW4WJJouRquGSlUA29GDxeU/ts9RkEy+UnEH8g3Rz/GVxgzkArYMMVtQB
	88Gv9DKNOfONrTwZExgxsg28HWYQ7N1fIB0v7yJ4s1ABZHVBNte8y56kog31P9FLemuGa1qFx+w
	anWRK/MCfvCRlxs5ilkmhGcdeOlxeEhx4d/SyWd8U/SumFfxJ9VFR4C5/QJtCU6qq/lGfwue8xC
	153B4zzHnySg7Q66cW0bD84mNhYISZGS6RQAk5dTWZMWwniOun6+Qsmh4wy6dBIVGjtu2USQ=
X-Received: by 2002:a17:907:29cf:b0:c34:db91:aa1e with SMTP id
 a640c23a62f3a-c4d34cbe4c6mr224296666b.4.1793971429837; Fri, 06 Nov 2026
 05:23:49 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003-ti-l3-noc-v1-1-9bd18cac33e9@gmail.com> <20261026222231.GA4050519-robh@kernel.org>
In-Reply-To: <20261026222231.GA4050519-robh@kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 6 Nov 2026 18:53:38 +0530
X-Gm-Features: AclHuK8vIx7cA9UMBf-q_bEDwVRNbmqHS9QHzWz5buXv8XkHwyi7N95tZvdJH68
Message-ID: <CAOWyW_7XoSeZ4iBzPt3VpV6R=T8vRa+WjPcw5bSOP0XjmXBTvA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: omap-l3-noc: Convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Santosh Shilimkar <santosh.shilimkar@ti.com>, Sricharan R <r.sricharan@ti.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 27, 2026 at 3:52=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sat, Oct 03, 2026 at 12:28:32AM +0530, Bhargav Joshi wrote:
> > Convert TI L3 NoC binding from text to DT schema format. Older OMAP3
> > uses the SMX variant which also acts as a bus parent with simple-bus
> > compatible so child nodes are allowed using patternproperties. Mark
> > ti,hwmods deprecated as it is no longer needed and only used by older
> > omap3-l3-smx.
> >
> > Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> > ---
> >  .../devicetree/bindings/arm/omap/l3-noc.txt        |  23 ----
> >  .../bindings/arm/omap/ti,omap-l3-noc.yaml          | 149 +++++++++++++=
++++++++
>
> This should move to bindings/soc/ti/ or bindings/bus/ perhaps.
>
> >  2 files changed, 149 insertions(+), 23 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt b/Do=
cumentation/devicetree/bindings/arm/omap/l3-noc.txt
> > deleted file mode 100644
> > index 161448da959d2..0000000000000
> > --- a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -* TI - L3 Network On Chip (NoC)
> > -
> > -This version is an implementation of the generic NoC IP
> > -provided by Arteris.
> > -
> > -Required properties:
> > -- compatible : Should be "ti,omap3-l3-smx" for OMAP3 family
> > -               Should be "ti,omap4-l3-noc" for OMAP4 family
> > -               Should be "ti,omap5-l3-noc" for OMAP5 family
> > -            Should be "ti,dra7-l3-noc" for DRA7 family
> > -               Should be "ti,am4372-l3-noc" for AM43 family
> > -- reg:       Contains L3 register address range for each noc domain.
> > -- ti,hwmods: "l3_main_1", ... One hwmod for each noc domain.
> > -
> > -Examples:
> > -
> > -ocp {
> > -     compatible =3D "ti,omap4-l3-noc", "simple-bus";
> > -     #address-cells =3D <1>;
> > -     #size-cells =3D <1>;
> > -     ranges;
> > -     ti,hwmods =3D "l3_main_1", "l3_main_2", "l3_main_3";
> > -};
> > diff --git a/Documentation/devicetree/bindings/arm/omap/ti,omap-l3-noc.=
yaml b/Documentation/devicetree/bindings/arm/omap/ti,omap-l3-noc.yaml
> > new file mode 100644
> > index 0000000000000..a72a0f4e64332
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/omap/ti,omap-l3-noc.yaml
> > @@ -0,0 +1,149 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/omap/ti,omap-l3-noc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI OMAP L3 Network On Chip (NoC) Interconnect
> > +
> > +maintainers:
> > +  - Santosh Shilimkar <santosh.shilimkar@ti.com>
> > +  - Sricharan R <r.sricharan@ti.com>
> > +
> > +description:
> > +  The L3 interconnect is an implementation of the generic NoC IP provi=
ded by
> > +  Arteris. OMAP3 uses the SMX variant while OMAP4/5, DRA7, and AM4372 =
use the
> > +  NoC variant.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: ti,omap3-l3-smx
> > +          - const: simple-bus
> > +      - enum:
> > +          - ti,omap4-l3-noc
> > +          - ti,omap5-l3-noc
> > +          - ti,dra7-l3-noc
> > +          - ti,am4372-l3-noc
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 3
>
> Need to define what each region is.
>
> > +
> > +  interrupts:
> > +    minItems: 2
> > +    maxItems: 2
>
> Need to define what each interrupt is.
>
sure.
> > +
> > +  ti,hwmods:
> > +    description: hwmod names for each NoC domain.
> > +    $ref: /schemas/types.yaml#/definitions/string-array
> > +    deprecated: true
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +  ranges: true
> > +
> > +patternProperties:
> > +  "^(.*@[0-9a-fA-F]+|regulator-abb-mpu)$":
>
> I suspect that regulator-abb-mpu should be moved out of this node.
Sorry for late reply.
On OMAP3 the ABB registers are both inside the PRM, so prm would be accurat=
e
parent. However, on OMAP3 the L3 SMX node is deliberately the flat bus for =
the
whole SoC. The OMAP3 prm node is also not a bus so the ABB node can't be ne=
sted
there.
So for v2 I'll rename the ABB node to standard regulator@483072f0 instead.

>
> A-F is generally not used for unit-addresses. Do we need it?
will remove it in V2.
>
> Rob
