Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35165347C6
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 01:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776735229; cv=pass; b=AWVsWt++8kLsEKwIrAgFB6M70zeWxFKp8DNeMvts4/a2kxx6NHEPZx9/CI5pswcwBxcGQ/gBY8rY+g6A/ZcBCBOT2TJmfF0dsBuK0nwfRMFYW2PtCTuEuHYNu3jUHdsZTscatq/UFzk/hULwy8SLss36JlyJv8wnLyf6GUGW07A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776735229; c=relaxed/simple;
	bh=nHkj1QjXspoHZKgrKbPDM209L1xbKvEBwvYgNqWevRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g78F7w6Q+H6yucHORK2VrflV1qq9w4Mal3FKJYt/pZSIHvWnSktZmnxOcy/ciLtbmk+hRnMPxnvNlhiHhHeb8m+ByOG1Z+J97EWvZc4qLfCQ5xa+a7rqlOQArWXaJbGgQ50JI42MavN4Rt+OJ1V6SzoiigrTBHIAnxaDkekA/pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPzmqSXX; arc=pass smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPzmqSXX"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-67c250805ccso1208885eaf.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 18:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776735227; cv=none;
        d=google.com; s=arc-20240605;
        b=KT/p3F2QXXy6o0WzXtqrUb4SIlfBW+y4iFnrZ7VTwFM/ExM/owrVvToa37coLr66QD
         X7+SDq0fVOy/nmu+V2jXDBxZhb5ZTD9ytgTNsz2mTO4N8KBI2y7YH9ny1UvDTWyXSbm2
         DNRXWmfSMbcJXdl82d25PNdrek/V3Io2/krMsEXGmc8i8TIhS0H7QPTezgNy6Ue8aqYQ
         OS7pS53ib1UzLzAThaQdBYMBSJBSAfKtYR20Y/8kKcK+JoLJ86q4BgIm7pDH66MqaUXE
         TTVrBkAXy/VHJKr4I2gcABACI+hfq3JqKz+bu2cUiuoQvV3FnVD1C9v05O9G6BkajKkw
         CwPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2ro4c5Yj9UOYed9OjkB0PmZ4Fty4O5ffP4GqAvAQb7k=;
        fh=CwvVuhldBf+wMhWdgwxD//X6mQzPjYLOIjCPIzvMo0Y=;
        b=CpP69OPginyX0FCe6/QXkMtJdx6qA2m59uYqop+WcGqvq6+rW+i05TfkKukhPd82+z
         YrfkrliCBYLRX303MkOM7VqqTYClK5wGBxF0F4UVPBlYZCvVhbt9aJJDSRXnfRLPR+5q
         p7LKSgjq/70uS0yDV1MyB3o7oGOhzJ7jLjb+0V0xKs3kxBeTnj2LI/F4hppE0PgXFUk1
         0RronD9sb39hwQA5e3j/BTeCRtPckCtAHlsr3qyJqmIhQHXt/b1OjCRydjypQxHgVsKK
         zQLKm4+UmtMO4d7Pci5OL3lcZxMyKChQL17oAiwx8OO9/1fIGZ5oqUbZ9cUMRWwqLN9f
         ImJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776735227; x=1777340027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ro4c5Yj9UOYed9OjkB0PmZ4Fty4O5ffP4GqAvAQb7k=;
        b=XPzmqSXXCQtg0eK/jO11x5NROcMcox0NuViXNwgs9N+KmVDj0YmyljQ/knHhDD10kK
         dDQLUsy/CdsH2OklJsXLr+PFr0tA1wMrp41N9kypALL8ne9qLPXC24slG6m1sheJozRg
         c5nEw8lMO3eBa92EfVSkucOPznyGQgDrFFOMjXLyvqrQyQHwRMfhF1Bsd3Yhm9QI+OL1
         yNy/rocNpVzx4y5mns21paBJA7fPy9cdHYNft9QauuLAKRnQrl5xonBuTXFqbn6ZDyTH
         Ziw21CaLvGNPjC6ueXWfsxmezCJx6Kfilre6uju63Yz0/qb8/QIW+9Vr3lBRfrzJBzZB
         5dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776735227; x=1777340027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ro4c5Yj9UOYed9OjkB0PmZ4Fty4O5ffP4GqAvAQb7k=;
        b=gkMEprxtKCHZ1O1Zq2iqE2pgoZ+VWB34BCd2EAtX0EKYYfOYwmAQzyE+LrNUTBrJh4
         Je9beoXp6C5rFQdByM65/13RZrEKffWBerBfv8kU579cVPog6tuWH+OVBAxyt4OPEiZO
         Ke8dcWp2KsWgTZqUXdIzdNUlywfoy6Zcsg6kTB2njtHQTsQrQPGa4gXi76c8mJIgaHuY
         9ZDb3lLdFkVLbI99xjXhPo9/YINl3T3mQDuny2uQ2ySBa1uUc24nryRe6S/JUQpNjhCL
         qTakhN8znPr0/MYEbqZDIowNweTHFfjdvKvjsA7MZGoCEQD/99mPo/mLAFIBdEUPeaLU
         2R2w==
X-Forwarded-Encrypted: i=1; AFNElJ95qudZqS26NkBXE/wkfvjPTxh55HErTdTyR/b9kwaRnnwVS0UikCEX8jnEwLBaFTLs57yp446vMDsy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw63XXtsc/TpxdyaZJLFNBJurvekPtlNl2XHqdVGgsRzzFU2A4x
	dPV+ND40BzWJGuaAYY5i/Jn18uLydAAVR/xfMQTS3LoMDyEUqXoP9EyBYqRMKJne0Y9J5r5ocuQ
	plm/HRvKQJoPpUYK3tQtIiK9TveKfOis=
X-Gm-Gg: AeBDieth/4RO7AkkieIOH18GhEz1h7Ml66bj4sq/h3IZ9+uy3J4HauJHElkeGtMpphY
	FPfx4fw763m6B9s0JvJBFQblivZ/Q6/Jmk+iE2ynQejIZJDFwxsfih5pnuQGZa18r5V6R3gQfNW
	SqORQpKdrPTw30LkPFNRYa1VEJjygXD79RK8wQtM1jn21oxwqoXPLSz+jvWgxnPsJjq/6K8ilXS
	M3GI0sKSI3AILsZ+PV+q7Ck72TnUqVJpdp7t2HgUFL7WIp5vufkh8Lv3DfFHme1qK5uHD5+foe3
	OmLUJDvwb5y9KFpH
X-Received: by 2002:a05:6820:8c3:b0:67e:447e:d1a with SMTP id
 006d021491bc7-69462e21352mr8979705eaf.6.1776735227190; Mon, 20 Apr 2026
 18:33:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420023354.1192642-1-syyang@lontium.com> <20260420023354.1192642-2-syyang@lontium.com>
 <CAO9ioeWhWemzyF30t8KDJht6_59b1Y5+GrH9nYCeKuPwddVLHQ@mail.gmail.com>
In-Reply-To: <CAO9ioeWhWemzyF30t8KDJht6_59b1Y5+GrH9nYCeKuPwddVLHQ@mail.gmail.com>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Tue, 21 Apr 2026 09:33:34 +0800
X-Gm-Features: AQROBzBN_QwHqnaPP8ZW4aL0Yv-pDE7geB_VDmJoG9ke-1GZvesdJrXvLgHpc-c
Message-ID: <CAFQXuNbyH88Ab_LgfZknRxhK9QzN8Xe-G9NuRMuECZF_SrRpfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings:bridge Add LT7911EXC binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: syyang@lontium.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, rfoss@kernel.org, mripard@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, xmzhu@lontium.corp-partner.google.com, 
	tzimmermann@suse.de, rlyu@lontium.com, xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
4=E6=9C=8820=E6=97=A5=E5=91=A8=E4=B8=80 11:12=E5=86=99=E9=81=93=EF=BC=9A
>
> ote, your message didn't reach dri-devel. Please check why. You might
> need to switch to B4 Web relay submission, if there are any issues
> with the SMTP on your side.
>
> On Mon, 20 Apr 2026 at 05:34, <syyang@lontium.com> wrote:
> >
> > From: Sunyun Yang <syyang@lontium.com>
> >
> > -binding for lt7911exc.
>
> Less is more, but here please settle for slightly more information
> about the chip.
>

It will be modified in the next version.

> >
> > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > ---
> >  .../display/bridge/lontium,lt7911exc.yaml     | 91 +++++++++++++++++++
> >  1 file changed, 91 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/lo=
ntium,lt7911exc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,l=
t7911exc.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt=
7911exc.yaml
> > new file mode 100644
> > index 000000000000..54a73d41635a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt7911ex=
c.yaml
> > @@ -0,0 +1,91 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/lontium,lt7911exc.ya=
ml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Lontium LT7911EXC eDP to MIPI Bridge
> > +
> > +maintainers:
> > +  - Sunyun Yang <syyang@lontium.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - lontium,lt7911exc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: GPIO connected to RST_ pin.
> > +
> > +  vdd-supply:
> > +    description: Regulator for 1.2V MIPI phy power.
> > +
> > +  vcc-supply:
> > +    description: Regulator for 3.3V IO power.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Video port for mipi dsi output.
>
> MIPI, DSI
>
It will be use MIPI DSI,  in the next version.

> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Video port for eDP input.
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reset-gpios
> > +  - vdd-supply
> > +  - vcc-supply
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        mipi-bridge@41 {
> > +            compatible =3D "lontium,lt7911exc";
> > +            reg =3D <0x41>;
> > +            reset-gpios =3D <&gpy8 8 GPIO_ACTIVE_HIGH>;
>
> Reset pins are usually active low.
>
if reset pins use active low, lt7911exc_reset function needs to be modified=
 to:
static void lt7911exc_reset(struct lt7911exc *lt7911exc)
{
    gpiod_set_value_cansleep(lt7911exc->reset_gpio, 0);
    msleep(20);

    gpiod_set_value_cansleep(lt7911exc->reset_gpio, 1);
    msleep(20);

    gpiod_set_value_cansleep(lt7911exc->reset_gpio, 0);
    msleep(400);

    dev_dbg(lt7911exc->dev, "lt7911exc reset");
}

I think the two are essentially the same. Please confirm whether I
need to make the change?

> > +            vdd-supply =3D <&lt7911exc_1v2>;
> > +            vcc-supply =3D <&lt7911exc_3v3>;
> > +
> > +            ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                port@0 {
> > +                    reg =3D <0>;
> > +
> > +                    bridge_out: endpoint {
> > +                        remote-endpoint =3D <&panel_in>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg =3D <1>;
> > +
> > +                    bridge_in: endpoint {
> > +                        remote-endpoint =3D <&edp_out>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
>
> --
> With best wishes
> Dmitry
