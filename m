Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3496A200C2
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066334; cv=pass; b=btjm5SUBFJ8tJiY32PlG2/R0oZELxMcdp8QiRQ7ep3DISF/LzG7xsi21uypv0ljJvSWvXkSZQpTlycVSxuwnL1t8a8w9eH4nfDtqauNSv3mwl6AsAbqs8X/y/Pjv2Q1sIfj6uD9UWYgFaePGO5/G3sm9bDbadbcprdSxT+vo8WA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066334; c=relaxed/simple;
	bh=1FXKnl20PJUiPS9posIRbFjif7nY77RGUWe3QN7ImXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wp+5TXlQewJKmal7fkX/I6zohTtea9a9ImCHcAwbV3Nzn5bL7Aif3pGsnG9swTS8tuX6S3ikJX1rxfUrj3zAt36PJZ8INs0O7jQlTZhmuBWYo2aNmuA6NOruQsWU0DtGF07FlUz55t2/uKH+ud24DL1p1CoLM42QjVwkj76G1bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frIqzcXN; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frIqzcXN"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9c6f1d1282so537542966b.3
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 00:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776066331; cv=none;
        d=google.com; s=arc-20240605;
        b=a41EznalfkxtSIv/nEkGBWSxm7mCHeuBX/+qIgjasVVqjehCzVAb8a3S4cbGTqAllV
         V1ekhCDSxvmjiVRV8sXNYNZkERjmvAD8RnLgPdztgfOu6br517WxTyOkoPypPqE7IG5A
         thPv0vlbOCoHqkg2WcsLOieKeYveOTkMQzEgb+3x9tn3rVG4L4b0CrHNKQbny0RxKuH3
         Oq+G9mMT+f2M3yQnJPVCIvnpM0rfI7PZXjMAZG1Zw7H8cGiQ+CjcU0HHSVF4FMQO4gGR
         G6pIUh39AHw+D+cFeGpd2rhkU7+mwYSxMI/TUtPyvPMPivK8TMq7hE3Gl72lhrr4VMkE
         Fq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NnqixEkGW+9Zp/P9ornTQQICok6llGoX22gpH2/U8VI=;
        fh=Pvr19huF4zT32lraznAKvM2dStouNaU3vhsftrLRJN0=;
        b=Mgq7+8mTmcIpaEj15zE7lHxFVZMRUiPbLe8WPx9e6BGfd7ZZYnsc5b8vDd78eLwlAI
         Fzyshwq9AoTaQBXFcTMjBY1ZsFk9Q8eFrOwuwXAeHTQA2qHtLjvWvusPmCT4Ap432SVJ
         sKQXskiGieth0T7kT0a9XSOj+cFvkwRpX61NLbEKnbxbYJuWcxd8Ncq5g1MNAx1X8XZG
         4q/HW8+CZZV9WnqZe1emVuMCh4OZDMlidEHxgFImquM+5TUWw4Ge4QzvdfBZHpUrZdgL
         aqLgVlO//4A0JD6oWNV19C0nUq0ELuZ9OAy2SI/al4y6fsyA0iKn9++DDUdmAcZ4+8KF
         +nBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066331; x=1776671131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnqixEkGW+9Zp/P9ornTQQICok6llGoX22gpH2/U8VI=;
        b=frIqzcXNCcZAlhm3iWOg856xjxW3dF7Hn1qF2+U7YubknI7pN2lexrB1YbJasci8Bs
         D8RLosGPBx1v9zDcLRBJjMa/OqdABHpSAwswrRZRJfT9InxqH3quP+Ssj2Ohg/8BMJAm
         OXiet8bFf1HF90HQKAAiyK3PIWIUllPKDbrZd186koE5aGXA2cPWn/MIVq9qkhQqBaLz
         jNN4pO9MgnWLT2hIvp98x8DMA2A9XNkW/BwYKCO+yw7SvuCAnKVYJgdoYOBkitBmqRGN
         G+AbCVWbsf0wfetlCb2Wb0MTDziAOx0Ttb5Iz+lvpDfqy7QXy/DGJc5VG5E1JfjEK9f1
         OkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066331; x=1776671131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NnqixEkGW+9Zp/P9ornTQQICok6llGoX22gpH2/U8VI=;
        b=lrmG6IsyIN+eplrUxUhoZeBppLWZSzC4LfpE74YzPTr24pmt7Ap51gJStH4WVZTab6
         9MQgk5A2suNRFvoQxXeULQjBfzs2qQx5yOuNnrPr0dZTTF8HaT/QlC1rnwcAsEv2vAKH
         x3jg8V1wL863V/T0UtOHrzSqlPxyazzRFVS/UzZpiGORxHRAkmo1U0Br5NtjPaJsV66p
         BlDfCX72jP6I5diIfKKyzN/3Ysg1Ceh3JNHbZagYOyiATcVmkC05LnBdlZHs4dXyc31B
         crV/fAXryqSqB62nd63NAz76tsYiYr660Gf+HSBDdEZemyWJqdsX8d0bcE0Y6HeqnDIt
         MAvw==
X-Forwarded-Encrypted: i=1; AFNElJ860I2JVADMHt6FiIm802lcLnLbEqSzf9VGtjzOTdCvGqYRBQgLJxItgn5zX2BV9Nj5C39Vj5WB2I41@vger.kernel.org
X-Gm-Message-State: AOJu0YzarCctC8q2jooQa1IyQX7Ux3N/aRh/gst048taij4X5QTGgx/B
	WM4/VWdka2U90v3bgr0IkCbJaFLnxEFWRiEDcBvRML5pRhxMDjMJKWJYsYKWIjII4ZgOb2rahvG
	XeXauhRj/gLMVN/NX3kkp7+HQzheJcpM=
X-Gm-Gg: AeBDiesjvv+5Q1u4QdNK6XXQywN4WAauuMMvLTCYczzaJGwcqC3jp06/zxfX03q0O4t
	8aOpposSlhtW1pkQGdABhIt5Y2KBnaiaETI9uKfySw0JSbEFQtZkm7w/VSbO2IXOd3M3wCCShus
	3haZPnqfkrSLNyMtWKsMDkL5vZ83cusZH6D8KUIdXrM0XzviR6UIPHevC/z4R7jR+1Xvm/Eipt+
	Z4R3hJ1j22kwVeedUP6bMFSTcZvI+e/E3zq3+QL4kf5vJLX3CmkUZTaYUVXropN72HswqI9FlL7
	IBpA90rqoJPvyfgvzLhmHgKSJVke5iYMUNiUgkKy35DJMfPjvUEhuApYsYinA4Ic18B7L2x6mvT
	hjMhDwuY=
X-Received: by 2002:a17:907:7256:b0:b73:2b08:ac70 with SMTP id
 a640c23a62f3a-b9d72ad9ef9mr661517066b.49.1776066331369; Mon, 13 Apr 2026
 00:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410-dev_ad5706r-v7-0-af93a4caa186@analog.com>
 <20260410-dev_ad5706r-v7-2-af93a4caa186@analog.com> <cdfb9deb-2439-413b-8c20-3c6ad6a81ce3@baylibre.com>
 <PH0PR03MB63515AAF92A4F2B6F7C26E70F1242@PH0PR03MB6351.namprd03.prod.outlook.com>
In-Reply-To: <PH0PR03MB63515AAF92A4F2B6F7C26E70F1242@PH0PR03MB6351.namprd03.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 10:44:54 +0300
X-Gm-Features: AQROBzCZ8NU3HcLs7SXQbD_oCz0l4yiFTm2pzR_sJZM7NsZ80XLspwkdW7zsXr8
Message-ID: <CAHp75Vf7Y3m11YahS7NGMZjoNQnBZtrN3bO+US5YUcU39HA9Bw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] iio: dac: ad5706r: Add support for AD5706R DAC
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
Cc: David Lechner <dlechner@baylibre.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	"Hennerich, Michael" <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	"Sa, Nuno" <Nuno.Sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 10:16=E2=80=AFAM Torreno, Alexis Czezar
<AlexisCzezar.Torreno@analog.com> wrote:

...

> > > +   /* Extract value from response (skip 2-byte command echo) */
> > > +   if (num_bytes =3D=3D AD5706R_SINGLE_BYTE_LEN)
> > > +           val =3D st->rx_buf[2];
> > > +   else if (num_bytes =3D=3D AD5706R_DOUBLE_BYTE_LEN)
> > > +           val =3D get_unaligned_be16(&st->rx_buf[2]);
> > > +   else
> > > +           return -EINVAL;
> > > +
> > > +   put_unaligned_be16(val, val_buf);
> >
> > Can't this all be simplified to memcpy(val_buf, &st->rx_buf[2], num_byt=
es); ?

Also note, num_bytes still needs validation.

> > Or the whole thing simplified to:
> >
> >       return spi_write_then_read(st->spi, reg_buf, 2, val_buf, num_byte=
s);
>
> as discussed above about mem* and spi_write_then_read



--=20
With Best Regards,
Andy Shevchenko
