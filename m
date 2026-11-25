Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795588773;
	b=sjlJdlvtOfzQQ8RXo6RLz+lF1e9rGdGaN3kKKIqpREbvudPTlg9cRF9e2hQMM8orxGTB
	 MQXGLunaw1RgE5U9kM5klX9SvQAa1wH+kGAVUsA/o3wGOVE/wjj1vsG1aFQAkqPqyi4Vl
	 oK7MRxi1Ka/RARh6Who3ofEGTHnBR1fIqaiWGADQglJlMc0sc4JVPMMEQELaQN39FLf7G
	 yUrf2VZpM74NheOlATZ4sHIqXYHi7lj70IMqV3C43H44dIU1qn6dFBgnQlWJUho1MxNQz
	 g/SYmABI/A2oWSPrhx4DDBfJvFSwl/B9ZD/oOEelL2el8CGCD5DaDQeE/nTOSvJpVVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2N0HpHcM8mF9ugP713fWJ2a14UxLxacvTfc17W7cvH4=;
	b=H++tTDRgUS5x1yiDX6f4En5zDfaNlKkEJFttaTSS66hA7GxtrDaYFISHd78H7pPYJlJy
	 FpMDkk9Qg/bSR16tMcoGT9MvZAtsuW5hvSW/sBRwSx/i1axliOHsB/K4vln4SFP8PZJxY
	 a3e3m0IgBGuFzD8xUg1v/8yFwOmy0u3xrQLNz0R6rpQDClmA4pV/U0wvFd7/aYjI2jUWJ
	 HOgplnhenqn5jB0qxHrmRs9ei8WdrfeocoswZQe+0PFBELW4v6szUprsTp1CIIlIBBVdv
	 4FTTgkiq5V5HocG2xGOfxwTbqgmOuv4WoLobmh2rPVyTRi7cbOqCatauOhWDi3vCJ7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LPFadlM7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CBF606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66CBF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LPFadlM7
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d21051042so15561566b.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 22:39:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795588772; cv=none;
        d=google.com; s=arc-20260327;
        b=fTPuKYgyeHUQu/Rez01oa8Y8hV/zpInUngt+SYbSA7sdnkxG/6ckOsYizmNaAg3zX4
         T01OWKGXvbKXROk7oyiCxOIL1NWl12bM8361/X3ZnPHpNbvz6BHHUxtS9CMUwyJ4F1fB
         nyVNrNnI6rhx+HhHM8nGaGI6MalgKuMn8akBg3z52P0F7wsAgX/iYFU4a6JOX2nctDgt
         YrhR5I6RJdBLI4nexLsSDdnNb0BbFtguBvfkVP7RT1cAEQVLZzkV5tTSAqtj0E72flbV
         wMLll0tHwCKqbkYwuryBIc2Dfjbtsn+uSqcW0om5zi7nAYOBwdu5PNRiQoD40jjMjLOu
         h1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2N0HpHcM8mF9ugP713fWJ2a14UxLxacvTfc17W7cvH4=;
        fh=feF9LIGRFW6qMemIk00b4un+44D7UY5M+ABVnnWHE1w=;
        b=lhaZWy0HiRO4fAegu0/yaSH+CBoGno+VP/BNosj4yagChzOblhKfhQiaFdiGv3MfhV
         LoSoSI6U9eaZNVGxKSFmdHPSPCGufQeiZu0BluspPS/cwY0xUGRsHphk3LYh4AI63ibo
         jMs80VPYUr58LAYOMfrTTmshj9YshdwMub5Mt/VVyBMU5XExdyjYwcbGYdYAOzZ++OcE
         qpRzx3QZBsHGrjF7qqGb9HrMe1aAE0GJAkesbpVoMc7KRDe56uN+3zp8FaKD5PGm4KWM
         OUfwWPyaaDGB7bB8mQKrK0fRn5wFD6sil8SIhkV9LKwh6RDxHXou4HhKQQ85056XbO7Y
         G4Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795588772; x=1796193572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2N0HpHcM8mF9ugP713fWJ2a14UxLxacvTfc17W7cvH4=;
        b=LPFadlM7D7rNGBOZeQd/sWVRJgc3bvkjZ3pLMilK44Z8frq4Ugre+QFyiFboIQswV8
         YrNNhYzkV4qvbRM84knIUHJR0CILbs+yNDEitcl3OdbaBZXhPCh/YQlQAH0YkiA48npn
         Pn0LWmTuz0d/c+MDjxzpccPK4E6ebq37sxCWXFemnU7XCPXy7ibGRlrjh6pz1KM8MVij
         2GLuLZUF7Hl6i1D2wnXPcYNQXy4TdxBLMXgZSW9suSj7EpPbdU/6joOmJ006A8sTwzho
         +a33KG6khNzi5RHqntKGyecQdzug66SaaLyh/8RbRM9rpmok7MvW+wDqKQJKl6WFmzIM
         y40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795588772; x=1796193572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2N0HpHcM8mF9ugP713fWJ2a14UxLxacvTfc17W7cvH4=;
        b=rX+Utq9gE/j1OJqsKueP8AXajaP9cw7nHKFhdfXSH48NN6ZC9WLtbyZ+pfCn5oLmhA
         BFbYiobZu42FyMe+aNP15vc1nb4mRvHxeeOJL7o80LitL3r4xeGzEmMuM7O9ifCPMj7x
         dnt4O7SYht/yRjtQmeCoKhpiebjLarbLzwSowsrm0udXv215/IEGEO+qFc3CZZuCtT5e
         o4LHcp/R+97Zcu8gkGAg977uq6V27TlvtNW0VA2UH1w2qSmLsKkongiv5SJTUams48v+
         wZbECIIOA+Hey4C+9/DWFkewDHmdumoM7BuosE26TIEDiY25uyTyguNLWyFZj4Ca59WR
         j5CQ==
X-Forwarded-Encrypted: i=1; AL+hErERTZL1iTwlJCZ9XxxaUtDTeYzhDdltLQfguPsRnnOQpL1FTuOcTcWL5qDULHrnCrzjKmmENgJltcau@vger.kernel.org
X-Gm-Message-State: APuU4Z8MRTNZ2YznDci3i2sglNNlRvuchlZJBkhY2tKYBwVGWJiyayQk
	nLTHkv1w0kUoSMUdBRHr7Ed+G4zHJrwfH6HXeKeanC3Cf51LO3AgXHxbNPt9zx+tNTbXM0U3gDh
	y7LupkM36szyVzft8FpB8jmBWZswb1HOFtYzmSDkPFg==
X-Gm-Gg: AZFdTZciO2TWg2U92fWb/u69BBUK8edK2JeSY8BijDeMIORXSHelRammIyRjEeZXPWV
	GCRee+xnS6Fj2nket68ZAVVLnQ+8THsaomBta4xwERq0nBgihljhWO5fnquvontZSwy/ri4oo2l
	lOh3QFpWDU7OdV7nYa75AJLHal/N+lYOGSo0N+7maj/XrJJJJIv7KXeZoph8/YRKwffS4ND79iw
	DiFfs/n0lCQ6rzj4Xbgl+WTfU+OYHBvuyw2Howw6ZHaXOVc6CEJ0B8zGP0JV884yM7Xwwhw/f+e
	TteP8QgaG4Ecq7K/RY1hcOFzueAu37ZGqg9BoOQLU5MP4XvR5d5KrAO2kA3UiXCwhv5N+PfhaYT
	f0B8l8Lhr9ifxW1hPwqNS3txxiRIeXZLDNP+I
X-Received: by 2002:a17:907:a890:b0:c4d:31c5:e30 with SMTP id
 a640c23a62f3a-c513ab12652mr1505328766b.49.1795588771543; Tue, 24 Nov 2026
 22:39:31 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793776192.git.zhoubinbin@loongson.cn> <c194b5248184779da500476281fd411fc80a98d6.1793776192.git.zhoubinbin@loongson.cn>
 <sashiko-outbox-196836@kernel.org> <20261119214532.GA757146-robh@kernel.org>
 <0009e3c5-dfff-4254-a06f-13c8664a1543@loongson.cn> <20261124134407.GC3404231-robh@kernel.org>
In-Reply-To: <20261124134407.GC3404231-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 25 Nov 2026 14:39:19 +0800
X-Gm-Features: Aa3M54rdaSaGyr7l6GQ5KvPJFYaTr3GJRENcNxHkmOtej3JVVHPOUUammhE2TCc
Message-ID: <CAMpQs4KRnVuZBZGtormXFK3X8n4KP_3bEr=OhwA-mHN72JRsgg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: serial: 8250: Add dedicated
 Loongson-2K3000 UART compatible
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, sashiko-reviews@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob:

On Tue, Nov 24, 2026 at 9:44=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Nov 24, 2026 at 02:58:40PM +0800, Binbin Zhou wrote:
> > Hi Rob:
> >
> > Sorry for the late reply.
> >
> > On 2026/11/20 05:45, Rob Herring wrote:
> > > On Wed, Nov 04, 2026 at 07:52:04AM +0000, sashiko-bot@kernel.org wrot=
e:
> > > > Thank you for your contribution! Sashiko AI review found 1 potentia=
l issue(s) to consider:
> > > > - [Low] dt-bindings: serial: 8250: duplicate ns16550a fallback bloc=
k for ls2k3000
> > > > --
> > > >
> > > > commit 71974153fe22bc00d365059be9198364c9cfaa86
> > > > Author: Binbin Zhou <zhoubinbin@loongson.cn>
> > > >
> > > > dt-bindings: serial: 8250: Add dedicated Loongson-2K3000 UART compa=
tible
> > > >
> > > > This commit documents the loongson,ls2k3000-uart compatible string =
with
> > > > ns16550a as a fallback so the driver can distinguish the Loongson-2=
K3000 UART
> > > > from earlier Loongson UARTs that require MCR/MSR signal inversion.
> > > >
> > > > > diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b=
/Documentation/devicetree/bindings/serial/8250.yaml
> > > > > index 01abd39509a7a..33c13c48ed56e 100644
> > > > > --- a/Documentation/devicetree/bindings/serial/8250.yaml
> > > > > +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> > > > > @@ -196,6 +196,9 @@ properties:
> > > > >                 - loongson,ls2k2000-uart
> > > > >             - const: loongson,ls2k1500-uart
> > > > >             - const: ns16550a
> > > > > +      - items:
> > > > > +          - const: loongson,ls2k3000-uart
> > > > > +          - const: ns16550a
> > > >
> > > > [Severity: Low]
> > > > This isn't a bug, but properties:compatible in
> > > > Documentation/devicetree/bindings/serial/8250.yaml already has a tw=
o-item
> > > > block with const: ns16550a as the fallback that includes the other =
base
> > > > Loongson UART compatibles:
> > > >
> > > >        - items:
> > > >            - enum:
> > > >                ...
> > > >                - loongson,ls2k0500-uart
> > > >                - loongson,ls2k1500-uart
> > > >            - const: ns16550a
> > > >
> > > > Could loongson,ls2k3000-uart be added to that existing enum instead=
 of adding
> > > > a separate two-item block?
> >
> > Let me briefly explain why Loongson UART `compatible` is necessary at t=
his
> > time.
> > First, as described in the driver, each `compatible` type defines diffe=
rent
> > driver data:
> > struct loongson_uart_ddata {
> >         bool has_frac;
> >         u8 mcr_invert;
> >         u8 msr_invert;
> > };
> > Since the Loongson-2k3000 has already fixed the hardware issues with
> > mcr/msr, we need a new `compatible` to correspond to the updated
> > `driver_data`.
> >
> > static const struct loongson_uart_ddata ls2k3000_uart_data =3D {
> >         .has_frac =3D true,
> >         .mcr_invert =3D 0,
> >         .msr_invert =3D 0,
> > };
> >
> > As for why a fallback to `ns16550a` is required in all cases, the DTS f=
iles
> > for the Loongson-2K1000 and similar devices were merged into the reposi=
tory
> > before `8250_loongson.c`, and this approach was used at the time to mai=
ntain
> > compatibility[1].
>
> No one is questioning what the compatibles are, just where you add the
> new schema entry. Use the existing one with the ns16550a fallback
> instead of a new oneOf entry:
>
>       - items:
>           - enum:
>               - altr,16550-FIFO32
>               - altr,16550-FIFO64
>               - altr,16550-FIFO128
>               - fsl,16550-FIFO64
>               - andestech,uart16550
>               - nxp,lpc1850-uart
>               - opencores,uart16550-rtlsvn105
>               - ti,da830-uart
>               - loongson,ls2k0500-uart
>               - loongson,ls2k1500-uart
>           - const: ns16550a

I=E2=80=99m very sorry; I misunderstood earlier. Also, after further
discussion with the hardware engineers, I discovered that the
Loongson-2K0300 should fallback to the Loongson-2K3000.

I will revise the patch.


>
> Rob



--=20
Thanks.
Binbin
