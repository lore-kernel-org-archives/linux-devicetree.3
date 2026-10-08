Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100563CF046
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 06:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442519; cv=pass; b=RjObqNVD+Az0YlWJ62WppAxbKegOJ3DIF+gqfir8LzUcdwKUsBKZPqY2QNXrSUIbRcFdnkAqB51y7RaFrJyyPWSxgtEiPvlgmhOyJcz7uWc7lRpn7ZX/wAF/0sUeHVB2dUb50ZD9h65wec+92DEBuBuEgzkZnjXlSkRGg09OKxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442519; c=relaxed/simple;
	bh=LAU+lAaONCsbyhUKz3NVx/NrIoGX2BWhWJ83XVPrkW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QF1KTZAPMz3m2GpT8p8X7R+n5L0dBNqlikSNGm8WDofGpXaWRSyTccx3m1dGkL/D621PWCwnCYtrFXM0p4AWVfdKkgof6+0w7LjLnhxl0t+z37hLGkNNfp/a5vkUqn4sefL81eC4MxeAeFIqm/9WxSA5mWCJ176ywNkDtQJWr20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfA82dpf; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfA82dpf"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-881269371acso163522b3a.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 23:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791442517; cv=none;
        d=google.com; s=arc-20260327;
        b=BPcQV0oyvwatx1uXMHMPG6U1v8DekenJ8dtal1mKm74GQ03Xup7mVc7lufVsf8L1uO
         GiGXdf9d98dShUexV7XeZhM31bTKTKG2VQVaNdTyJU3Gp63ijCggpOVBZgdRI0mMcWju
         pEmzC3yKYx7j60VdNbYLQhEZ7RJLkG+jCXymJc4ZlSK/ByVTzBaQIXr/fH2WuFsW5SbA
         x8/MQKS+f43l2NoB+lQtZIGIQEZ5LUYaaSNWBv+qdqAaYNncDRLrdLUKHwckeYLO8a0H
         /rbgg6TqxlGnUQh5i8dFyPa7yxOYmVoUJKtsL8kQvIMojFhH595vaZrYGz84+i8apo5I
         k46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GwVHKedpjNUKuB2nBCCOQbetrG9q4vZVX+BP70vaR40=;
        fh=CysMMY9IPll46RrGcEd3n25UsaEbgvYFnYQt4umxXOU=;
        b=XquzC2V4bstOZ89GYBxQfJvl5YI/VC1tnJ3Ooc2qbmOwoSlYNz6LwZcTdnXgFntrLO
         gLVEfBzFlxKQWjrRfya+b3EgmUT3r05fkdPCT2BdusnOJ87sWJ3ozn/xs6ubOwciAwto
         fNqu4PHA607z+YNErg9bxL28dmwes7nTqQlFoI0wnJQhrE/xcKL6vNLC6T6+DPFfczJN
         qZ9l6o5qcpcZB9g+/Si56695IkmTYZFNqwFQqphKvGRweLnqXAgBijOfI2nsc1Xg2xJw
         17vzLY97+He68/3wpN43pN9M8ei0Yb7f/gLfL9sBOhl1+5uEND5JBakscRBxsjDjHImP
         nhvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791442517; x=1792047317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GwVHKedpjNUKuB2nBCCOQbetrG9q4vZVX+BP70vaR40=;
        b=JfA82dpfOuVdgDazmoj+VL39H28VT2HM/BiZqQZJLKkhrONqnBZQI1g2IBB/YAezCp
         6L2ubSBVe7N+kSpJVblp3DxCS3QFHffRp7ePqiVmBSfI1V/vjwFIBlMd1qJ4l4kBQIv4
         Opbe/QAL89fcInWCeq/8guMlRNDWPIlLPp2agXMGzHX3kkQg1o/eTc4BpI804+3EKajh
         I1+qVcp7TiVFxpRrFeQSiHHyhMZgA7R5+Cn4dfaxcaqdNZfUzVEnizuh5hm+2RT5/bQE
         6FHQm5V6Qstlbv1jjfx7+8ntKfjKbTlKdt4MagxOtQ1q7B+zXWjJEO8vL3ZYs4YpJ/lZ
         Dauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442517; x=1792047317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwVHKedpjNUKuB2nBCCOQbetrG9q4vZVX+BP70vaR40=;
        b=xi/cR7Pqok1S7OvFG9WynRwQVllSqYGcuflId7yFL1BIoUk2XuuKyfszSmISdKhj6D
         orFAEc+Jwwsf1nPqu7AeZHNofefQYNGYkpa5lTbPpiQFpdaclB1fbfVflHcGq1BQIoqe
         demyf1Mj2P05aekjnK2rpDClWQu5Om/Iri3rYx3vz3kGVelwAr2XbMHIx7tD8vYqXkn/
         V4Hfg17ZRWIiwoBnNsb+CCYOmQZaKMpiom8zQO8N8vCXjET5TdfMGxAK15Ouq2CN74tx
         KfC0CFerZYjL6KKb+9350GStclSnKs3vAz9Yo0/OgPWhKhxqOaS0J1HDHT0GHlq+QAzV
         z6/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzJiuzFVMJaQETNijIUUfp9ZdBK2agXrQZ63m13oAJAQ/CBtvTEZPNZC9gzAEZARt9byRVzkq5IRLHo@vger.kernel.org
X-Gm-Message-State: AFuF++n4xqx1RfQY2ICwO48v3ST0dCpjVDiUF9bf2fVa4rksnZWyWT09
	cmB1Dlq5sDFO9VHsxFRNlTC3sozZzusEZxrQSS7GZaqSlKPuvHpr0PkoQktCjUTz2mzQ52+bLgV
	IZLbvU8zLOfbC+H6bGI9NiXuBiSCkrcg=
X-Gm-Gg: AYBFou38Cn5EjKr3cPyFQBj7vi9aHQrOWzX3ZiaOx6VKVYMmEaafG1PFXfNY20B0UDI
	ahEemZyhfUZMoTZA28daDPrwSaJi1Tj1OGC8VCcyyoxeeNRi34MsywfXItELMMWtSz5IN8MpTWL
	AKSDkxL8bNko/mO3eFVKYFQYtnd4PjLfwG0x34HI2H+Dj8eqDNeR+vk5gM4iQhIGSv+Zus9+MRY
	73Q5+HuiqW+7Rks1HJaBHegad1lObBf/Vv6lbfirunQPv2mZxfCEcwDUCdESIMIwePMPvrcIzuG
	R3bHrvrY9KGVXwMBOqIf8nEx6HsE1q4zEU8yZIA7TfKC5bGF0GZlpQaCW03aE3TBn0d8i58=
X-Received: by 2002:a05:6a21:3e09:b0:3de:3bfb:dc65 with SMTP id
 adf61e73a8af0-3e14c5a1255mr1132038637.34.1791442517344; Wed, 07 Oct 2026
 23:55:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005202731.153971-1-pmazzini@gmail.com> <20261005202731.153971-4-pmazzini@gmail.com>
 <20261007211626.GA338242-robh@kernel.org>
In-Reply-To: <20261007211626.GA338242-robh@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Thu, 8 Oct 2026 07:54:59 +0100
X-Gm-Features: AclHuK9HNWmbYmgrwOCN8Dj1r6Aaf0O489JwabVju8_e_8zgAdvV8DQG3O2TPc8
Message-ID: <CAAxh=jsoFDfNGEtcWvxe5VNH-knf8LZg9aVh800LF9t-7m1qbA@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
To: Rob Herring <robh@kernel.org>, andre.przywara@arm.com
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

The B288 uses the same scheme as the A523, and the A733 queued for
7.4, which the shared pinctrl-sunxi-dt helper parses, so I'd rather
stay consistent with them.
Andre, what do you think?

Thanks,
Pablo

On Wed, Oct 7, 2026 at 10:16=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Oct 05, 2026 at 09:27:23PM +0100, Pablo Mazzini wrote:
> > The B288 driver takes its mux values from the DT, so allwinner,pinmux
> > becomes an allowed property here, required for this compatible only.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-=
a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4=
i-a10-pinctrl.yaml
> > index 45b7a0b6c626..b1f093d218f5 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pin=
ctrl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pin=
ctrl.yaml
> > @@ -39,6 +39,7 @@ properties:
> >        - allwinner,sun8i-a33-pinctrl
> >        - allwinner,sun8i-a83t-pinctrl
> >        - allwinner,sun8i-a83t-r-pinctrl
> > +      - allwinner,sun8i-b288-pinctrl
> >        - allwinner,sun8i-h3-pinctrl
> >        - allwinner,sun8i-h3-r-pinctrl
> >        - allwinner,sun8i-r40-pinctrl
> > @@ -120,6 +121,15 @@ patternProperties:
> >          $ref: /schemas/types.yaml#/definitions/uint32
> >          enum: [10, 20, 30, 40]
> >
> > +      allwinner,pinmux:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description:
> > +          Pinmux selector value, for each pin. Only used by SoCs whose
> > +          driver takes the mux values from the DT instead of an in-dri=
ver
> > +          table. Almost every time this value is the same for all pins=
, so
> > +          any array shorter than the number of pins will repeat the la=
st
> > +          value, to allow just specifying a single cell, for all cells=
.
>
> Perhaps new platforms should move to the common 'pinmux' property?
>
> Rob
