Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D35A374186
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 17:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787332684; cv=pass; b=KNkdnGa2GU2Va5Ug6G1iR2dquDeUnkcmQokWQbkJzLJgbW34eXW4CfFmRUg3NzM8x7E4EyR4lbpT0fzHKFVacgJrR0qjfW9T104pUklv1h4eixeJR1NcjwLYgijgAwdaUnk6FP2ZU97lJaukpQ+/QVB1rRy+LLjQlskzU8G9/q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787332684; c=relaxed/simple;
	bh=5BJ6vl3jYvm8+eoq/n1Zi6s8dTJJsKX1H6HW/szWkrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vDQwTo513hTDlqc2SOKOHwQuIzWwt1M+cSWENZzPwjU6HrAAKN3wcNg28saqrxYqGOpreDYyXvo5FOVIR2rDSOR0PcZ93YoQY4iLALxV6uqdTfglvw9W2GbZU9RoMOl3UMJfTQtCN+cm19hxONAwK80YhWQSgXNAeG4vCQV7IfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=maLjoGnX; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="maLjoGnX"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so2127277a12.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787332680; cv=none;
        d=google.com; s=arc-20260327;
        b=jPP79ZIYsih7VveD40hBRgFTf11snH2wJs8otVK1/C9YL3RnwiPML8O8EDOhkCdA7a
         L+UN1XLrDJia9T+RgDvaPTYnaE6mKHAdD2hXHd8X+MUDaFvIaQcBv2Fi1QCk3bixx/rz
         bJ0SghKsE3CFz+V/mT7UKAOF7gD77SdSyeXA7kFlngQOzsE/9zdDfUKDbulJjFH6VCkb
         QtUmMw0XDV+a0+uU4SJ8YPODODx+fdvwx2x7BypA2bgF8rY4ayBzD5ptRrcAlixm57Xy
         1vfg8QFWm/4UqGQDBsLXDaaaGNzZcoD10rmtOSYNvQFbZb8YOPeiATVmYnqO/CGX+CB4
         KMpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a7EiPLlzbwPc3czPLxdKiQ9NmGH3ckuar+CTSrRgEhc=;
        fh=QWq8Gzhtgz48V/uAPP6N950OdDOsosIyN30y860ZTuA=;
        b=QUwks7Hv4K+CCt6l06JUVLD50tL0Kqr0Zir1Q1DQiuUiHbe+rEbzqbnD2CNe/tYh/7
         xQXLBlPHvLU8a+v0lFqTkNCKyKMc5HatH6MORCZ/l6+MpHuFYBuWKa4UPK+GcHoJvCPT
         i2svhBNjvApkP0jtYHX00FIDkG3ulELre9RunMq/3nPDPOOlhdImLO8FbTX0esCUp1jj
         QbpClzMil8pkY1ABGtAMINONWMlMMh+ZRAyZw95G3e9gGqkNG91y8yk3LcSO0b9X4+6p
         jq+ixhIRAMET+HSM+g7KONFFhMaph9CbYlv1kyGqmQKjWg9cFdRpUfEpKzDtvqiKh6dE
         aYqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1787332680; x=1787937480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a7EiPLlzbwPc3czPLxdKiQ9NmGH3ckuar+CTSrRgEhc=;
        b=maLjoGnX8NeDXb0U9RStFtcmOVOh+6O+5/nmhqaSGhOeV77KjEmpHapTDiF5ZapirU
         YueSAi2mGWQ/VmBWoriU4JH+k/1t5TB1zeBdsnJgPuHtmfi5r5XJ+y38mmKpVg3abePO
         8bnhalSaBxo34OUpJ+BTS1sPD2ErkTV10vLs8j60nXcIaOooLG+9bMg99As6t9g66AV6
         VySYhWNNMQjysFVenGOPlSXl1sT+mjNl8NAg8JFsS6d4FSQxQ4O34BUHz8m8cyzVSPgm
         qHYSyMp5a5qTXcIE8bLIL52862yI6d0Lm/SeCJJYv1iXRBCPOaYcRbo95fmFnK88bvrF
         oFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787332680; x=1787937480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a7EiPLlzbwPc3czPLxdKiQ9NmGH3ckuar+CTSrRgEhc=;
        b=AJl+Yc/YcZowemOA5AhCKHmWv6bNIsR2MMmBOjR80VAmPk/D6D/Ya2XVuKVEAY9cez
         qc+s+MoByMjPoz6KIc3NwytCgcGd+GEoDbsxfdEjDYYfGEsbl9Yb6y8/RS3+UjVF61yU
         dBnb0LWPexB80coczYATNQ7o/lg+3n7BQWKrW2pvGh4hSFmUtnB1KaqhRgmfiaSBNhTa
         UfUqbqBrdjYq0DN2yUrE4h9HXNmKzJR989Bhz4Kv5xobzXp/lA8rx5a9QbxWt3zQqkt0
         6sFUDHONRq0zNUvWBiuAbdWTHPiJEIRwp4j3AGZqY2O2caRT/GEohaVSbMUhjSLetknl
         z7UA==
X-Forwarded-Encrypted: i=1; AHgh+Rqr+NXQlPLocmc4rD4OWaFZHN0OTJG80NgiV2Brsq8QRqFN1oXCseEACSSNu9NFJxlCL5HZYrDhBRpO@vger.kernel.org
X-Gm-Message-State: AFuF++mDKEFJG3G+SrPOIXlGN51vMYriPicTMgwwiuHFPmcLnuIsH/zB
	K1ixhpuLURmaKAZh5yMz9DzKahrnJTMbI8xp1PC46NwMXRnLFuktkxJE+MfQ19CSSPTAW0VAEQI
	XS4WTBdEGU8Ytki7RuE26m80O1b+YAIifAw38uk2W5g==
X-Gm-Gg: AR+sD13KeJpl2JBuIIWnKYwZ/Q+dpRoPMPs5AyiPiaXCKNLaVLotOmPGElqTv3yDohH
	lQXHb7Mj/7tKJz+0eeyHg09yNK8RIM5nxHohaUGACHz662/wMVSDXrACXzzvODRNYPMu4niEB8X
	AdXip2VLK4N+RC49IzNDmcYr9A0AhTF78ANWq/d4SrJEAyGosIW0zFvZIWdjDRniAjnTIBL8+DQ
	guzsIA9uLBJjnPo3V1EqreUnzKbO9UMUPXv9sNao9INTMhc5wlS8I3DuzvceliAshkec9KallN6
	aj6VT89YTy4HzRhXV8BH1lYRBEXnKhWkJRkcQA/EQbbzeDkHc0HwDNVgVZOmaVpFv3/Fw0QjTWc
	G1w==
X-Received: by 2002:a17:907:d501:b0:c21:9cf4:e1b0 with SMTP id
 a640c23a62f3a-c246a30a9f5mr868392666b.3.1787332680302; Fri, 21 Aug 2026
 10:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-hd3ss3220-regulators-v1-0-405e5c4fb306@flipper.net>
 <20260821-hd3ss3220-regulators-v1-2-405e5c4fb306@flipper.net> <TY3PR01MB11346E91C25009FE7C45387F986A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346E91C25009FE7C45387F986A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 21 Aug 2026 21:17:43 +0400
X-Gm-Features: AcwNN1XgtySPeQ9oX-D97l_niNrZbC8_BAFYmBud5FSa8Z0I7DfTLaVwNVSieB4
Message-ID: <CAKTNdwFnvV_uvz640+Dw+HfJd7LfQ7ym9+JogyASi5t-ch8DOw@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: typec: hd3ss3220: Add support for supply regulators
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Aug 21, 2026 at 9:03=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
>
> Hi Alexey Charkov,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Alexey Charkov <alchark@flipper.net>
> > Sent: 21 August 2026 17:17
> > Subject: [PATCH 2/2] usb: typec: hd3ss3220: Add support for supply regu=
lators
> >
> > HD3SS3220 requires VDD5 input to be present 2ms before VCC33 is applied=
, or else it gets backpowered via
> > the 3.3V rail in a non-functional state and wedges the I2C bus, bringin=
g down all devices on it.
> >
> > Enable both regulators in the datasheet prescribed sequence if provided=
.
> >
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> >  drivers/usb/typec/hd3ss3220.c | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss322=
0.c index
> > d0de5a2488f9..b53455abc048 100644
> > --- a/drivers/usb/typec/hd3ss3220.c
> > +++ b/drivers/usb/typec/hd3ss3220.c
> > @@ -49,6 +49,9 @@
> >  #define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_UFP               BIT(4)
> >  #define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_DRP               (BIT(5) |=
 BIT(4))
> >
> > +/* Minimum time VDD5 has to be stable before VCC33 starts ramping up *=
/
> > +#define HD3SS3220_TVDD5V_PG_US                               2000
> > +
> >  struct hd3ss3220 {
> >       struct device *dev;
> >       struct regmap *regmap;
> > @@ -358,6 +361,31 @@ static irqreturn_t hd3ss3220_id_isr(int irq, void =
*dev_id)
> >       return IRQ_HANDLED;
> >  }
> >
> > +/*
> > + * Bring both supplies up in the order the datasheet asks for. Powerin=
g
> > +VCC33
> > + * first can back-power the device in a non-functioning state, which
> > +grounds
> > + * the I2C bus and takes both this device and any others on the same
> > +bus down  */ static int hd3ss3220_power_up(struct device *dev) {
> > +     int ret;
> > +
> > +     ret =3D devm_regulator_get_enable(dev, "vdd5");
>
> Maybe use optional API as existing dt users don't have this property defi=
ned in DT.

The optional API is explicitly for devices that can function without
the respective supply entirely, which is not the case here (both lines
have to be wired for the chip to work). If a board doesn't define this
supply in its DT the "normal" API will auto-assign a dummy regulator
and proceed.

I got called out by Mark once [1] trying to shoehorn the _optional
functions where they don't belong :)

[1] https://lore.kernel.org/all/agUoq2N_nE_Sz0Z_@sirena.co.uk/

> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to enable VDD5\n")=
;
> > +
> > +     /* Nothing to stagger against unless the board describes both rai=
ls */
> > +     if (device_property_present(dev, "vdd5-supply") &&
> > +         device_property_present(dev, "vcc33-supply"))
> > +             fsleep(HD3SS3220_TVDD5V_PG_US);
>
> No need for fsleep for the consumers that does not have vdd5 and vcc33.

Correct, hence the conditional.

> > +     ret =3D devm_regulator_get_enable(dev, "vcc33");
>
> Same here.

Best regards,
Alexey
