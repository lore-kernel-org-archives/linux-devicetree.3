Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0EE53B5ED
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985000; cv=pass; b=idis5GAfXHmEnwym3Cj6s+xsVLMQadp1eDOxzIoQyvltRjMzJthXl6bGhTwn/fAxUD+Wh74SDJafJMjtGpVCK954AV+nR0lPjdBkApUl6tL1QcWjWuxF6rXL+de2Hg5CrsrEHZ6lS7CWa3txZjYgnnZpKJOSB4MhGC67pKBtvEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985000; c=relaxed/simple;
	bh=IT0qggrd1mARJ6zH4Bx5bdn3EzKctPth4DH9TaUm78M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EY/vrqafQQzCX73YH+t2mcZAXxO5ZpIVDUoW3r2jJskd/3KC3QkfqE+R6YfFb2ROK7km/jRtu2c4K2OejACeI/8a2kVNRTAR2Zxi2orkCvx31dZPsTlJmd8qXcQISPc2K6IBOgrk8vxoj1fJfkpywTieJrrZJgP6l3le/cfeFE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=stl97STh; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="stl97STh"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so1455762a12.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791984990; cv=none;
        d=google.com; s=arc-20260327;
        b=LoW3buXkcdd7joIZYSzxYtYqPvGBiDpJOsGHYxmMAfgAaDuSt+yl3/UFdvN4PyQ89P
         mUZ3Hr6FwZb2opl/+K9j0XyQgBKz/HRhKoZXRc0of93/VRnGvwb0ggTRcAuTZ+sni4Kb
         SdAT/wQiSxf64i/+OcSiDr6cBAPc2DWTWbrMxIncsMaNIkJkRDidWa5+Ea5QPnxFfwWC
         nbyALj/x6jA1vjqiK3pzMUZlX7nhFoZF2FM5119T7HXlYp9zdAmm5ltT8VDMQMI/i+w4
         apFld+7hephENBijIHQLnH6iQ/n4bIPpHPBDG7EPV+0bzDgcB3M3GiVLjBY2M2WfZ2Ks
         RO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WzfJaWITDWTXbAq39l/2Sp3XytY3nCJV7TfZMBMIxVs=;
        fh=eAsx0wlQXVCE1F5UqZsfLmsJ53bopBhngz3dzLxiXdE=;
        b=KwIygShgNwm/qVoIUaZ8n25AfE8x0y0FHI5sRwyrqtTGcIbXP7y9fQ+Yad4Rsj4g1l
         YFiAPuPaaspOHfoI0WNhEWfAR0Bdh5CDwyf4t9fDURQPoH8Eszhiv89eNHUf2ZrYRYbi
         X61p9IgZ5q0kl7vSgeGt7KjzBlbPlSZVfJHW9yG2TIB/bhP5wdhafxFzJNF4nrt9XbhE
         FsD5o732DnfGrQm4LeQcZjWlJvdomJhFZy+tYwXXGdiBvnFLDmSU/lxKMp1nXLF8HBTu
         XsfTlPLRymhOH5z1wZbWEW+kk3ZrWDBspKiC+ya/Wbr+5zlgsFyEHeoRCq1Gq8ecBPyQ
         cJUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791984990; x=1792589790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WzfJaWITDWTXbAq39l/2Sp3XytY3nCJV7TfZMBMIxVs=;
        b=stl97SThMAAaKpod2Yo9NGY11Ms0uA2KmHC3Qq68BTZNwq3Nozbh/f2/qLMrAmqXOn
         5c3jcejjbE8lC60StZ16+ykubS3dxO4UA8mbaJAzXuJxyXtSlJsaq76+TwUBiP4e4r1e
         dU/C/3Hty3fh34T3Zs/9Fi2kMW1m25XJOHTiIQBU0lrnhQKzQG7rB5xV8L+ArmPMHkpU
         fiV8bpzGHqByTbO9WbfPvQ7BYcEA6kipWSS1PF7J6v/4Jq/o2Ubdc3KyRKFKqPBwQYIg
         5DWLtQ+eA6KjMnd+kEduCPoJ4pBsoSm8bJquOHX7RDzdfh02iwV4FkL1eENDmnG2DET+
         WBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984990; x=1792589790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WzfJaWITDWTXbAq39l/2Sp3XytY3nCJV7TfZMBMIxVs=;
        b=nnNomF3HI4eeaoMv0cgULhszVW1A2X5kyubbcmjpHb0W4J7+brAb7R5XwAE/rfeAIa
         +66JvM0oSHL4H8ufzJncsWDtfl0ID5xSRCBPLwaV4h/a1Yb9qW+lvlcpcrmRLff5edpj
         0JoNHa+ZiLfpl5U4cB9p2PpNMAHDVfwzmMJYtDiAr2ZHA2rBzB/fmH/qegEs/rIrBWRc
         p/he9uwOyw0UoyPHMZr86NvI5JEtZ/uQ6B4NHTLr5q9Qk56ekWs01QA/UANtY9PWgv1j
         2pxa8Gy7PFyyMFxb/NBGHen/0msZasQD/4WFrkqFgFvWwENv2hkjDPxrJGUrbAjFeU9J
         uPbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBZHcQb5O8sc7FHP0/yKceiFASnYAy+yRXuVj6cNO+kU5EJoGs5+fZ61jp9sVSR8WaCFlG/dWD/VZs@vger.kernel.org
X-Gm-Message-State: AFq9FYJQaNwwx+1VgtwwHlweDMcNBQdLJZaOPDF5UL+u2YsmNWpiUT3l
	7k2r9FHJfq4dlzunMiF1qHKzPlGAnTrxFp8KLiC7MDYLYhcqZazvV4JDLHnjo6p2rqm+kJU1QHY
	xXG0ECMnnZ7HUZQ3Bg5X+pREqE8MEPJE=
X-Gm-Gg: AYBFou1NGbvrQA9lAl/8cTqCb1/9WIlXD+ev1LIUuNW8Eq2Q2JBsG1QL1fHsygbB+ID
	UVO+0jGFaMUDgQU3bs2xko/p6eOCLWxIu2rItq3BTogkCoVUBuMuS9ollNAgqIbG29vUTHFAZdP
	Vf+4WaEylZ7WpVmdPvSBSB2Ixt12Dx97CSu8iJe+tDD+wwHk1fnxKNoFn9578JpBIpaQzbqzYwC
	oHJK3cXELikaf5eZqLSPMIoDyL931BpaFdLSLJahJbMk7BisRhh1LOWqS6iBZYT+ITgvqFGuUzz
	N/+X1WxqgN5EIjVjGnlDBvOSF9AXGbA0of3rchBkqQ5xH0T4mHz+FoxLkiBAa190aJN/py0IiCF
	YRWnL2A5F98p2KPBBqCX1GOQa61Be+T7ec1eQ2nw2plBQYIwNDxmkBHyjydjEVqpESyB1RaCJGA
	==
X-Received: by 2002:a05:6402:461a:b0:6b1:e37c:135f with SMTP id
 4fb4d7f45d1cf-6b1e37c1669mr5342555a12.3.1791984989802; Wed, 14 Oct 2026
 06:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261009184122.1378797-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <as5GXPcMKe-CBLXK@ashevche-desk.local>
In-Reply-To: <as5GXPcMKe-CBLXK@ashevche-desk.local>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 14 Oct 2026 14:36:03 +0100
X-Gm-Features: AclHuK-KZvXq9usDlegpOUwMj00FdeLieTauYj8tlmG7JTbxbS1FG7D7z0W2904
Message-ID: <CA+V-a8sec-ZzMKGZJeNA-iXw-Tkt9mcXv7OoziMtjeh23BjOsg@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] iio: adc: rzt2h: Wait for the analog part to stop
 after a forced stop
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for the review.

On Tue, Oct 13, 2026 at 3:55=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Fri, Oct 09, 2026 at 07:41:16PM +0100, Prabhakar wrote:
>
> > When ADCSR.ADST is cleared to forcibly stop a conversion, the analog pa=
rt
> > of the A/D converter can take up to 2 ADCLK cycles to stop operating.
> >
> > Wait for the write to ADCSR to complete and allow the analog part to st=
op
> > before reconfiguring or restarting the converter.
>
> ...
>
> > +     /*
> > +      * When a conversion is forcibly stopped, the analog part of the =
A/D
> > +      * converter takes up to 2 ADCLK cycles to stop operating. Read b=
ack
> > +      * ADCSR to make sure the write has reached the hardware before
> > +      * starting the delay.
> > +      */
> > +     readw(adc->base + RZT2H_ADCSR_REG);
> > +     ndelay(DIV_ROUND_UP(RZT2H_ADC_STOP_CYCLES * NSEC_PER_SEC,
> > +                         adc->adclk_rate));
>
> A single line (84 characters) is okay in this case.
>
>         ndelay(DIV_ROUND_UP(RZT2H_ADC_STOP_CYCLES * NSEC_PER_SEC, adc->ad=
clk_rate));
>
Ok, I will update it as above in the next version.

Cheers,
Prabhakar

> --
> With Best Regards,
> Andy Shevchenko
>
>
