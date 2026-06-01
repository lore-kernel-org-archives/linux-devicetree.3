Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA99E38399E
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 07:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780297572; cv=pass; b=YWvPyonCVc3TR6twPmOQbGF6BFr/ms4NlapG0hfJDePRQs4/8Tesld9h1T+jm08Nic5tBmQyf4U7G71oWWTpI7vpXEefsUATXbZC2IrIAm6m5boOv8CPea3Vs2XBnVAwTxKgGUNQ+/MTJ2xxNLImJB48AcDZEj5AaYSBrT6NhCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780297572; c=relaxed/simple;
	bh=zL43rRNUkROQAXRx+lI+JoRTxX9AjBpJcLNzRh35qx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCpSb3rqA2t+s5XybBiqzhucQuk1luS+cw38x2pFLJ8synbelUCIGUA3OVFuIXaR50rYruMxMS/Jqy89Z6441HkxEf7eVFsjH3ELQiDyIRyh/r+7aBOnW5j01iNnxt+EWe6xphIgueCyq5gFCUrv97kvPfB7nm0fqNPCSG/DhqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGTnmNmW; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGTnmNmW"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304d555293aso5229000eec.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 00:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780297569; cv=none;
        d=google.com; s=arc-20240605;
        b=cuj++TJRhd8bIqKVNnabfYLu91V5fafvD9cg+V3FFsu5vUQPdC9TTEvQa7xcg6cInm
         nNuCZoVgqV/l6ZQ/pHebt7ZTOF7Uw9k7M/5t4Hpd4L968WVpWh+HGE/qy9WO7dxUPs3K
         0jWf83Q51Eui1R4tlBtHqwa+VK5xGGB9KLnjLKJ2tK5Auzg+h8H3wMW9mqErz9wu0V23
         9iMHnQGWQDq724ki3oCINmXlhTX/CEyfBM39w638/KHA9MGJ8kwoslj/DikvlG8UF3GA
         IXTTUgefZb3Fcq0XdqeMA1FLKEdBBgV5hhYp78tMR/7ASgqD29DciaLW/oZrPsAztFDH
         bTCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o6x1wbXvenVeekia93enMRo3NGuqJ+euTvBULiNrpXA=;
        fh=6/z6lnMY+E2Eu7XKS/MIRZ5fgbPzfyFf9FQjKj0yhbE=;
        b=C3/+AZg/biPqIOHNSvjfW9vlgaxdcL5oKp9zajQ0oZcqpdh31b3mtlXyw3lYznzb/p
         gsW09dhqbVNsps7awq2EDDSKPuE49wms73kHKq2UN+X7RZltVmqikO9vQJdtivmanahE
         mN1oXFywmj8VuJvHUtE7aXVUEt+7sNKtyoxsMP7Yv2WG2N5Pl9EBtqcGvdOXOD/3hUqu
         vCIaF5JgX92M0+GO5IZ0rh9HQBVb9BwHWZU9coCbZ2tsbnydLFgE+csOxsAXcX8GqGR2
         yhaGZ7DA6FtB4CaDGDx+fpUbjxa//dM4aBtfoJ86r3H/auGsyvQgPvIBEXPDITIzcDcy
         DFbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780297569; x=1780902369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6x1wbXvenVeekia93enMRo3NGuqJ+euTvBULiNrpXA=;
        b=aGTnmNmWbnsu0mGB+qitdiaExDNjMsb8AhWrlAw4UNumOnynSTJd2hEDLVxEHT3YJy
         nEKYBJVMF9CKmqb8ZsDE1zwu6n1b2+QAcVwCHtNmIMn1q5dZLgNWOFHO/OqNZngzyYl+
         DYgxcerc96ABaV1nio70X+QUWg/oa+ya+NfoJOLGrtfRwXKSNR5OjXSGjvkQclodAZnC
         ndJSKEv+IAa5/4ArFeziD0PBuFGkqqste+Yj6R1Wcm8iJxizmifSXgPe7LTW5H9ubynQ
         7nOgEOr6xmzt0+IoWUD/GqHKFTvvSNjylJLguf3iCJgb+EstLPNrH8uxIf5GEZDyKPwG
         obBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780297569; x=1780902369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6x1wbXvenVeekia93enMRo3NGuqJ+euTvBULiNrpXA=;
        b=RlbvK1FU/lmCUb6vaM4OLNrUxNobkZUxhaR1WaqPQSBkd0idb6FBt7J5KQDIBC+Aqq
         R3dxZm+GxHUuAvzeSS1H5RJMNWruNbytay1cVmS5Wdc2icw8oA+ZxoDrwDMbdEIZGeEQ
         YPJ8Bhe21rEN4Kd8IMB9d9Vgt6GA5WR1yLJAhmsFLy+tjACRVgcOD+Lge+pNfYuIwY1g
         OezJAYm+xnKD8TYRRJPwzrXJuXOHL2K8PzemJ2/ajZsCeqKSTx9D9+WuhIEaK4Ir+ee/
         RNv0H/zRaTDfBZm5viJTz5zwjR5WjxDnStWPYevv86sZmRCGN6pMBQ2Zl+mdUlldNjeJ
         Ib1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8a631XiBwB1nE9t/ibo/0Fhkg7LSD3OEo8fQhCMVvycGcMSniaALiY9Y4/9IW/fwk970w7pe6rIn9Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd1A9XvLJJPD8MWHw60IX++vx7bfYnPQz3NiqMiRzA58cb30A/
	N45osGVKYue/TfnJNithU7z4hTM1dNzCE0MER9wMULaZhjmRekpQ3EP4dOMEJgcT4EVpwxoOOoJ
	rKKA9n2KvUrkjSaIuPyU11DmPIns1lb/En1Zw
X-Gm-Gg: Acq92OEUd4SGnV7KJS+tuIHrQS4uwqgN3viwKWxCSRecU0RL19UbCNIAB69K5UdM/uy
	or7ETjUjajwPrjj3Rfh3CdCu8Rkt29701IAhTcVIVeURs17c21TVmvvWTCdzEf0MVRN5zq3OqSK
	0HF1ftsZ+3jLFhNS6I0DWL0Gi3IDKO0d9j5QZY0AOdvb6plC3A4elTJIaf9n6rbo8XEbH4m8GDy
	RPBpZxvsXI0+nvLjwmxfWeYeljx8Xf7EpNG1SSOtKrT+YkdDs7b1F4f4kC7lyY9ca9Yz0XaaqzW
	i/g9JNWbbBF/nyuK/HY=
X-Received: by 2002:a05:7300:e58b:b0:2f2:5c68:5052 with SMTP id
 5a478bee46e88-304fa508e98mr4749567eec.13.1780297568834; Mon, 01 Jun 2026
 00:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529054218.5184-1-Ashish.Yadav@infineon.com>
 <20260529054218.5184-2-Ashish.Yadav@infineon.com> <20260529-partake-myself-baa76ed4e279@spud>
In-Reply-To: <20260529-partake-myself-baa76ed4e279@spud>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Mon, 1 Jun 2026 12:35:57 +0530
X-Gm-Features: AVHnY4KKIhJYyyCvubbTWvCZOWxKwkjn-0kbsOvszc7kwcg7g_uxuWN-ORBhaRQ
Message-ID: <CAJKbuCZ09AFKqJMB+uVLY1+PC1E6rGtw=RGMG7DF4_K85GLeeQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720/XDP730
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

Thanks for your time & feedback.

I will revert back the file name to infineon,xdp720.yaml.
I hope it will resolve the issues.

With Best Regards
  Ashish Yadav


On Fri, May 29, 2026 at 10:11=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Fri, May 29, 2026 at 11:12:17AM +0530, ASHISH YADAV wrote:
> > From: Ashish Yadav <ashish.yadav@infineon.com>
> >
> > Add documentation for the device tree binding of the XDP720/XDP730
> > eFuse Controllers.
> >
> > Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> > ---
> >  .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 59 --------------
> >  .../bindings/hwmon/pmbus/infineon,xdp730.yaml | 80 +++++++++++++++++++
>
> This rename just bloats out the diff, no thanks. Please do not do this,
> certainly not without a justification.
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
> >  2 files changed, 80 insertions(+), 59 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infin=
eon,xdp720.yaml
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infin=
eon,xdp730.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp=
720.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.ya=
ml
> > deleted file mode 100644
> > index 72bc3a5e7139..000000000000
> > --- a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yam=
l
> > +++ /dev/null
> > @@ -1,59 +0,0 @@
> > -# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > -%YAML 1.2
> > ----
> > -
> > -$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp720.yaml#
> > -$schema: http://devicetree.org/meta-schemas/core.yaml#
> > -
> > -title: Infineon XDP720 Digital eFuse Controller
> > -
> > -maintainers:
> > -  - Ashish Yadav <ashish.yadav@infineon.com>
> > -
> > -description: |
> > -  The XDP720 is an eFuse with integrated current sensor and digital
> > -  controller. It provides accurate system telemetry (V, I, P, T) and
> > -  reports analog current at the IMON pin for post-processing.
> > -
> > -  Datasheet:
> > -     https://www.infineon.com/assets/row/public/documents/24/49/infine=
on-xdp720-001-datasheet-en.pdf
> > -
> > -properties:
> > -  compatible:
> > -    enum:
> > -      - infineon,xdp720
> > -
> > -  reg:
> > -    maxItems: 1
> > -
> > -  infineon,rimon-micro-ohms:
> > -    description:
> > -      The value of the RIMON resistor, in micro ohms, required to enab=
le
> > -      the system overcurrent protection.
> > -
> > -  vdd-vin-supply:
> > -    description:
> > -      Supply for the VDD_VIN pin (pin 9), the IC controller power supp=
ly.
> > -      Typically connected to the input bus (VIN) through a 100 ohm / 1=
00 nF
> > -      RC filter.
> > -
> > -required:
> > -  - compatible
> > -  - reg
> > -  - vdd-vin-supply
> > -
> > -additionalProperties: false
> > -
> > -examples:
> > -  - |
> > -    i2c {
> > -        #address-cells =3D <1>;
> > -        #size-cells =3D <0>;
> > -
> > -        hwmon@11 {
> > -            compatible =3D "infineon,xdp720";
> > -            reg =3D <0x11>;
> > -            vdd-vin-supply =3D <&vdd_vin>;
> > -            infineon,rimon-micro-ohms =3D <1098000000>;  /* 1.098k ohm=
 */
> > -        };
> > -    };
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp=
730.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.ya=
ml
> > new file mode 100644
> > index 000000000000..fdbc577bccdd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yam=
l
> > @@ -0,0 +1,80 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,xdp730.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Infineon XDP720 / XDP730 Digital eFuse Controllers
> > +
> > +maintainers:
> > +  - Ashish Yadav <ashish.yadav@infineon.com>
> > +
> > +description: |
> > +  The XDP720 and XDP730 are PMBus-compliant digital eFuse controllers
> > +  with an integrated current sensor.  They provide accurate system
> > +  telemetry (V, I, P, T) and report analog current at the IMON pin for
> > +  post-processing.
> > +
> > +  Both parts share the same PMBus register map and direct-format
> > +  coefficients; they differ in the GIMON gain step exposed via the
> > +  TELEMETRY_AVG register (bit 10) and in the VDD_VIN pin number
> > +  (XDP720: pin 9, XDP730: pin 20).
> > +
> > +  Datasheets:
> > +    - XDP720: https://www.infineon.com/assets/row/public/documents/24/=
49/infineon-xdp720-001-datasheet-en.pdf
> > +    - XDP730: https://www.infineon.com/assets/row/public/documents/24/=
49/infineon-xdp730-001-datasheet-en.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - infineon,xdp720
> > +      - infineon,xdp730
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  infineon,rimon-micro-ohms:
> > +    description:
> > +      The value of the RIMON resistor, in micro ohms, required to enab=
le
> > +      the system overcurrent protection.
> > +
> > +  vdd-vin-supply:
> > +    description:
> > +      Supply for the VDD_VIN pin (XDP720 pin 9, XDP730 pin 20), the IC
> > +      controller power supply.  Typically connected to the input bus
> > +      (VIN) through a 100 ohm / 100 nF RC filter.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - vdd-vin-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        efuse@11 {
> > +            compatible =3D "infineon,xdp720";
> > +            reg =3D <0x11>;
> > +            vdd-vin-supply =3D <&vdd_vin>;
> > +            infineon,rimon-micro-ohms =3D <1098000000>;  /* 1.098k ohm=
 */
> > +        };
> > +    };
> > +
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        efuse@12 {
> > +            compatible =3D "infineon,xdp730";
> > +            reg =3D <0x12>;
> > +            vdd-vin-supply =3D <&vdd_vin>;
> > +            infineon,rimon-micro-ohms =3D <1098000000>;  /* 1.098k ohm=
 */
> > +        };
> > +    };
> > --
> > 2.39.5
> >
