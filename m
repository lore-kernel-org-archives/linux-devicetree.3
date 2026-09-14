Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12E046984C
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387605; cv=pass; b=L/gm00Uq7EXhx/ZMbIQRKxuPqKE0zyTnh6cfvIr1sfn5D94KiU2JU5uNLTSuSe/pnnhi1uHa+JbILZ2N33j1NBZQzHkc4kjeAROjIVDX7eADGwaVfGhzu+5oydGRypd280L4TFPz0g9DDb6IfdHGWZwRdKEZnV+DXqJXV+FHvHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387605; c=relaxed/simple;
	bh=dAQLslpPj1WS5Id3+o7zx/jx5tvNIaiKqLwvi1h/rME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEuqKnPcCSztNn6/OA3K6nFW6yYzxpqtRsyma2FuFI46xTuOh63QFyLW4hmAWX+efcQsEWhG1IeoASlq4lmNodszHZ0Yuc9UijVnJc4f9I0T6xqTyVsMeJcA7gtZkLfus3/QpBeNA5AHeiWFq0W3/yL+IkqT+t902nuYavQlhLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tOh7BIal; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tOh7BIal"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78ffc0e2f23so489458137.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789387602; cv=none;
        d=google.com; s=arc-20260327;
        b=F4LM9JduU8LiEKOvMq1qcoi639hjYxcPHUQg4xytnNWuakH+/KvqgprDagveoR2A80
         bAW7hqWjsSjGzgVBDyID5Swy9Qb5xVbHQsHfwZJmezQyQriZG8NB1/rwudxc1PUHbtZe
         vteJrL3G3aUqmL3Q3NmqIrSrZe42N10yPec6snRUbqj1IiA3v0QmqIf8+9vQL2UXVXNa
         U/N7IgVHriVS6ZD1yvcVWTl25yZFf+O1QB7qShQ7zROC6LSQyE08jBchMH+nqrWFFuf/
         4kkanYcA6Skri4o4AEg3EFAlY73UT4HoWSAR7E9jUAVM8/V2BTnwZe8CRSSQsVVq2/zG
         0fJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W3f2wMp0p9GaB9K8wv/S8QvGH6qPT0Hv0ZLvGcfuJsk=;
        fh=GqUXrP7tbgpYYUPPyKq6N1c9RvJG4F0jn5l1NC/iI+0=;
        b=mycYScND4t6O5serKREQ4qcFB+3wtHfdWermBuxMeiRe6RxN8H8YmeIaWyU3RHB/Yh
         sx96wiUA4jKh6kWuYNBgIC4TJG1cRa/DWqVLqGSWBXFJHJFYRhnXFShruEU/MFQQSe/m
         6GIUGLXNwAg+b8rGPISm/1rrkXs9eYMxdunrntDsW0jKwBAlf8ThQSO+lSfUT/nNG0LD
         defy7OiNOdyNlkFAb0Ho6GAM4QSQ4QEsV1JrVdtVK6bdCceJFtYEeRQLiWwk0sIYpKlR
         kfeyGOuEhae7hnmnFFVzlXHtQDjOOXu3eciZM1K5tFNztUUbkr4tWh0Y/RizYJ8rDT1H
         6zvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789387602; x=1789992402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3f2wMp0p9GaB9K8wv/S8QvGH6qPT0Hv0ZLvGcfuJsk=;
        b=tOh7BIal907KpeyalA9IxDKn+1/7wDAmsBgNguT/QFRMlsY45vd8cmMLv/OgHjjJ6f
         Wdk5BLNf7UrKi2ecApOIWHe+x/AHmBLUVTbPnx5U2+JW+JrC8zcQJrXmTg5FcaUx/ki5
         z2kSsl4RduL/zKJEjhUa2Ke1iMrnJF2K+dXUzyhEW6nxH5kP2SP0dOArIdobvRgIgUk5
         ZN6bOUGvCO6JFW5mYSpOZMBbv0ohSZDpHMSLaYDpYHTm3/ScohGxcRJhgWXz/r4IRoPb
         ox7FSoFzMxGhpeg7Q4e9mu1CJUZkcVCAfnMSaXNKZfzAipiKrqc/nTgq3YAPyy0Vs65E
         J+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387602; x=1789992402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3f2wMp0p9GaB9K8wv/S8QvGH6qPT0Hv0ZLvGcfuJsk=;
        b=I33RlQ8WhqWoUMXGrXNlBRR5cNo5YbygI5mDbicHmvPhp4EFjSqxcGtganFmIwGBDz
         etzOAeYmAdKTVWCH4RZrmfiOnswyVCV64qfiBs8+c+IGCmIf1ao6avC+5cw8KdSKYRim
         cjBmWme+dRrX1fRxnQ/fSH22cVWtsbA/cchb/GancAMl1WQDWN/wi/tci93kTzN/HS5S
         i1vEC690y6qjLQgUHhYRqf8ClyoLZpw18/75Mfy9JDdJl3h29cOAJiQXUSZ2APtJHRMK
         I33pIS2OC1mLQraPwazElzAF5VIb4wtICff9ZuodR57bw4Z95e7MojI+JKfqqX3LrVUA
         XBgg==
X-Forwarded-Encrypted: i=1; AKwUvBzckslRVbT3CgBRCigO1AbqFFi6731Yfy/o3zLbZA+478VliJdVpfZGy6oM9gfiNR9xCD68gjdc9HDz@vger.kernel.org
X-Gm-Message-State: AFuF++lVAeDjvxaGaykQGiXztl+t1Bgkvc2shqW1PBRH3+bPReZIchgt
	P/iHWGEwhqPktAQ+zBA9vZTPXDDHFtc1sCgqSLqkodv1VAtmXVClEul70aDDtO/ha/qabaTdZ2v
	XsOnntFGJfKYIREXBxtbFDRYTtdgYr10=
X-Gm-Gg: AYBFou2iXSyNtRYdVx05c9CZ+4ZWI12mrx93TYwF2Grum8Qp8x1+eTkZiq+zgp+POnA
	lZ4ymRhmNzD5JgD0Jl2L33TvwNWigMh77hHrS/VtH0TGkJXFXw282tpkYX4PcKkAXrtqgTCmnDy
	fY1tzvpaNFAgiyBl75dyajRj3YqJcA878/JrwZ/hBXJMTqj9I4NTLZ05hEvHgLzjrJO5teYg0Sh
	jcHG/Uzj/FrrgHi4FuayTsxSBYTNCp8bjDbhYeNROU+JoBo6k6Yhp3d0nezJZ0XIMuIerYVHr0H
	sw6nMBS3bc0fLuYRxRO3IuucLpIn6fImlC4j7VzQVshTpXAvwltRpIl57aArqkrc4TOd
X-Received: by 2002:a05:6102:a50:b0:79c:23df:6fc1 with SMTP id
 ada2fe7eead31-79c23df7745mr548775137.2.1789387596957; Mon, 14 Sep 2026
 05:06:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
 <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com>
 <20260907-chimp-pectin-20f4ea3b772c@spud> <CAPBH0A9GZSD5R657xo1woijKfgS6gecUND4uabguaqUON2exXw@mail.gmail.com>
 <20260908-dinner-atrophy-757595146656@spud>
In-Reply-To: <20260908-dinner-atrophy-757595146656@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 14 Sep 2026 20:06:25 +0800
X-Gm-Features: AcwNN1WwTccuI-E0Tg8O_HU6Y7-t9R9kzYG63DP3-KVuGmrC7El7wKFW8D4dhcc
Message-ID: <CAPBH0A9yKhvDA_pda45Me1c0tXcSj3zLqLoFgUOQj3MES0Mk1A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
To: Conor Dooley <conor@kernel.org>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Grant Peltier <grant.peltier.jg@renesas.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=889=E6=97=A5=
=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:57=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Sep 08, 2026 at 02:31:40PM +0800, Colin Huang wrote:
> > Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=888=E6=
=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=881:01=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Mon, Sep 07, 2026 at 03:03:29PM +0800, Colin Huang wrote:
> > > > From: Colin Huang <u8813345@gmail.com>
> > > >
> > > > Add Device Tree compatible strings for Renesas RAA229639 and
> > > > RAA229640 PMBus devices.
> > >
> > > Driver change suggests fallback compatibles could be used.
> > > Why aren't they? If they can be, add them. Otherwise, explain why not=
 in
> > > your commit message.
> > >
> > > pw-bot: changes-requested
> > >
> > > Thanks,
> > > Conor.
> > >
> > Hi Conor
> >   Thanks for the review.
> >
> >   I didn't add a fallback compatible because I only have document for
> > RAA229639 and RAA229640
> >   and could not verify full DT level compatibility with any existing
> > supported devices. While both devices
> >   are handled by the existing raa_dmpvr2_2rail driver variant, I don't
> > have sufficient information to establish
> >   a compatible fallback relationship.
>
> Given that the match data table looks like this:
> static const struct of_device_id isl68137_of_match[] =3D {
>         { .compatible =3D "isil,isl68137", .data =3D (void *)raa_dmpvr1_2=
rail },
>         { .compatible =3D "renesas,isl68220", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68221", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl68222", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68223", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68224", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl68225", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68226", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl68227", .data =3D (void *)raa_dmpvr=
2_1rail },
>         { .compatible =3D "renesas,isl68229", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl68233", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl68239", .data =3D (void *)raa_dmpvr=
2_3rail },
>
>         { .compatible =3D "renesas,isl69222", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69223", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl69224", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69225", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69227", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl69228", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl69234", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69236", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69239", .data =3D (void *)raa_dmpvr=
2_3rail },
>         { .compatible =3D "renesas,isl69242", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69243", .data =3D (void *)raa_dmpvr=
2_1rail },
>         { .compatible =3D "renesas,isl69247", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69248", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69254", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69255", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69256", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "renesas,isl69259", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "isil,isl69260", .data =3D (void *)raa_dmpvr2_2=
rail },
>         { .compatible =3D "renesas,isl69268", .data =3D (void *)raa_dmpvr=
2_2rail },
>         { .compatible =3D "isil,isl69269", .data =3D (void *)raa_dmpvr2_3=
rail },
>         { .compatible =3D "renesas,isl69298", .data =3D (void *)raa_dmpvr=
2_2rail },
>
>         { .compatible =3D "renesas,raa228000", .data =3D (void *)raa_dmpv=
r2_hv },
>         { .compatible =3D "renesas,raa228004", .data =3D (void *)raa_dmpv=
r2_hv },
>         { .compatible =3D "renesas,raa228006", .data =3D (void *)raa_dmpv=
r2_hv },
>         { .compatible =3D "renesas,raa228228", .data =3D (void *)raa_dmpv=
r2_2rail_nontc },
>         { .compatible =3D "renesas,raa228244", .data =3D (void *)raa_dmpv=
r2_2rail_nontc },
>         { .compatible =3D "renesas,raa228246", .data =3D (void *)raa_dmpv=
r2_2rail_nontc },
>         { .compatible =3D "renesas,raa229001", .data =3D (void *)raa_dmpv=
r2_2rail },
>         { .compatible =3D "renesas,raa229004", .data =3D (void *)raa_dmpv=
r2_2rail },
>         { .compatible =3D "renesas,raa229621", .data =3D (void *)raa_dmpv=
r2_2rail },
>         { },
> };
>
> It's probably pretty safe to assume that a fallback would work here,
> given how many devices are served by the same data structures but
> maybe one of the Renesas folks on CC can confirm that for us.
> At the very least, you have documents for two devices and should be able
> to confirm if they're compatible with one another.
>
> Thanks,
> Conor.
>
Hi Conor,
  Thanks for the review.
  I found a very similar precedent here:
      Link: https://lore.kernel.org/r/20260325090208.857-2-dawei.liu.jy@ren=
esas.com
      RAA228942 and RAA228943 use renesas,raa228244 as fallback compatible

  Therefore, I plan to followthe same approach:
  RAA229639 and RAA229640 also use renesas,raa228244 as fallback compatible=
.

```
@@ -60,13 +60,13 @@ properties:
           - renesas,raa229001
           - renesas,raa229004
           - renesas,raa229621

       - items:
           - enum:
               - renesas,raa228942
               - renesas,raa228943
+              - renesas,raa229639
+              - renesas,raa229640
           - const: renesas,raa228244

   reg:
```
Does this look reasonable?

Best regards,
Colin Huang

> >
> >   I will clarify this in commit message in v2.
> >
> > Thanks.
> > Colin
> > > >
> > > > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml |=
 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl=
68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.ya=
ml
> > > > index 8216cdf758d8..3537c7ddfb09 100644
> > > > --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.y=
aml
> > > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.y=
aml
> > > > @@ -60,6 +60,8 @@ properties:
> > > >            - renesas,raa229001
> > > >            - renesas,raa229004
> > > >            - renesas,raa229621
> > > > +          - renesas,raa229639
> > > > +          - renesas,raa229640
> > > >
> > > >        - items:
> > > >            - enum:
> > > >
> > > > --
> > > > 2.34.1
> > > >
