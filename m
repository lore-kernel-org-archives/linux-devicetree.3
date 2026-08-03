Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECF23845D5
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 08:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785744435; cv=pass; b=VSHwvKSzmfc8r5fdfx0llLORDUzogHU7GEZTB9edy5YwM9UXbUtclRwyzvOh5qpRNl7ohryFGV9gmgmDeZHEbIsjxfq2oBUc4FXX3VzFDtRcN8LlbkgyL9NM4o8QgWo9X6v9rh7GE+Xa0fwjeDkvYIJDPdM8H6qw9L9XMEuPAgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785744435; c=relaxed/simple;
	bh=CfjC2DgaSxdq9CwTBVQ+CQRbZiNezEc5R3GNUfzDETE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8oEysv2l/YLTEcnLeJps7sEr0Dl0/GByj06tQsD3fT/EwFU5vRn8W+0dkG/0NHdUTNe10jWbp/71MSC+uY6pkHgyRYcFcpx75HhbCHx3wZ5BleDtynFiOvGwYD0U3MwTKqFKSefWzVqzw+RNrUYOY407AcqKbvcoYD57X8tazw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKbgZsYE; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKbgZsYE"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b15c6fb864so2502326e87.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 01:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785744432; cv=none;
        d=google.com; s=arc-20260327;
        b=kVN5lWJKcgEhK1HhTlY42ksQbv00NkDd254lPcQCFWYYTxqsIs4qgFQRpHQHuQR6W8
         zng/zQaemW9PzanogFFeoh1yQwX4X19zrHZ4t7K7pJkHlZwpqHxVgMwJoP1mEw3P8nDM
         b7ca051AlQfRm6AjIgFTES8tIgPl80Ntjwsa6Ci+31RO7F3ldj3dv8vGn+uGcL0G0QML
         KmcrPiv5r3pvCyGJkKaWuEBj9xvL13g+8vHlh0ZS1uKwoW4rne+vt9ElNP9Fw5Kvl+DR
         gyidZMqxr/FXyBJ9GQJ5g9Z+FibqGqPHwNjvt/MBYYda4YlWkV0T1KH+mHypZle4ZhIy
         P2RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nSI9zqKop7etuUO6synP3KpeHcLdKVytIDMS9A4Kh4s=;
        fh=u3fIMVm766FIuHy6c3ofHhjXv1IU9SEu0PYkUMusWFw=;
        b=e53AEsy5Y320jyvcUtLjdUAi7Qewh9jrgVbiXXEDYCqqna1LzgfA87Vssluwaq3paq
         Kk09AKCo9lofP25ISI9fRLmxgxCZe+H0eCsYN38qjW/7qjs4cW2+WPqgqxtb6yjkcTpI
         Dgaz95zgGYpumsafvkU8hkmQUnmfCbhIH4BPOJubOqSpRzOkxPCU19win/aI2rPVeP6U
         Xa/+cg4mwEIA8Wanal+8Ko042tTBZiYUMT1OJIGbDo9r8dkUepZzyZZcrSLgxultyzMv
         kWyCieJJO1aH8dk5Psg4UcWY0zYB+mm2mX91u7XVynkAEk94uajtqO1qv3CmPjtmRBCt
         B1Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785744432; x=1786349232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nSI9zqKop7etuUO6synP3KpeHcLdKVytIDMS9A4Kh4s=;
        b=hKbgZsYEEv1DUC+BaphLWKnsJhwqhtwEwk8Xy+GLylNhaS+PAt8CdyURnumgPOxJWu
         zo34t10j3/OxeXTZUbm7B4ewGuyixKGSIdhra80b3O3Q8EQu5TrKlZsZP+7NCLfnxTB0
         g8m9KgPmpEGyazeWgNo6yOP9lAcGiXgnzg3GCheqqm1MB9Z6aRZBe6qlpcoCBe90PgJw
         7+ABzFBjRbSISUxct6uUIfnfYuNsXmoFFezva7jboicZc/WmjEsmDoUvibZFnI6VAMDH
         r7jbAmox5BYtNvP3byEFG/6mHP7X0F7X64D/m+lOQcedIYaf050pcjKV0A06aHnFDlvR
         5bUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785744432; x=1786349232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nSI9zqKop7etuUO6synP3KpeHcLdKVytIDMS9A4Kh4s=;
        b=gFDPEiUAuNJ5kWkRDtWQm/GMDeZRUTRNNwE/cUP78WZiy0/rSPGPy//R3kU3gNEGUK
         CGUNJsTkuOTeDJuxkRm7jG+o/h267dCZgfa5z9UFw3Kf0KOdMC4kaZ/2bof8YD5Ao5Mn
         FVSSMIpT4cl4Jh78YZuC8wlnhjQuZwYULy+Iyt5ZR9t+NIVUn4DhuaD0D3va91V3xpTO
         hbtUbFL5KN9TGdLeH7vk7z/On02oo69pYoavCn/fDTwQVFAh2aO4R/8nM6nKc40c9gpd
         GUlu7hOtcaqpvcGricODWlBbQqTJiWmI3sW1+kClL1aoBTldL8Zs9FkN89G3u55xZv7c
         LT1g==
X-Forwarded-Encrypted: i=1; AHgh+RqS1GWymJjf8JsBygZjYtAk61yCN6/QIAI5rQBJomA979+e6lIzYV6rsIBXVhTB+tiIiLw4hJqb3FG8@vger.kernel.org
X-Gm-Message-State: AOJu0YxqVDbFPq/vuBEJj8VI2a9+vhGm8anE78hqQx5SDXLpTPGeGI5m
	b4kVvsEgkQiQFnAGT/RzAh76KkW2B3O7cTUZxWaPbnjY9e9Cy6rRoXlvUPoFp3hxyZZzvDo2+7A
	XbjLpwnsqJbhrfcU6qmocUpC7PBfbNEY=
X-Gm-Gg: AR+sD126/r/ITtoRR5o7dR1gOd/jPFNwCaJiBWORkBKfKZ53ZVZyF+tJOzdvx30X3be
	1SZ+G3N6u8ci9Nu27YDzZwBV5s2QIVaRMrLunilvg+WKa4FxkJ0JWfsNxr2GG7Xfh/AXGSFaDEf
	6LYA7vVJZiUD3BYHZ8opRbU5Q3YGIeqJ6wT/OxZOxqyLPSW5LqzxkBAz1Wb+zzwjcFrXu9+pnG4
	tITuh/vZk5lSViYfnZ/BQDh4k4xtnM/nnaE2OSjitIjHmsERczn1shDabx0rorxr/mGxnfoIYYd
	ob+SLJ+tWube1ridTs87o3gJ2N/c7bdsaS/hXuy/hBIy8w==
X-Received: by 2002:a05:6512:3b88:b0:5b1:59de:8987 with SMTP id
 2adb3069b0e04-5b2e4f33084mr1761260e87.16.1785744431485; Mon, 03 Aug 2026
 01:07:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731-ti-ads112c04-driver-v2-0-aab0168c3c01@gmail.com>
 <20260731-ti-ads112c04-driver-v2-2-aab0168c3c01@gmail.com>
 <20260731112750.00002c37@gmail.com> <20260801235920.434c7cf9@jic23-huawei>
In-Reply-To: <20260801235920.434c7cf9@jic23-huawei>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Mon, 3 Aug 2026 16:09:02 +0800
X-Gm-Features: AUfX_mw5S-VZqLxsa5VDJFVOvLA1M6MFIvvqTdPT3jio-nOTJlAQnbpEnmBLP8E
Message-ID: <CAF7HswP-dyPmeDavygUy3f8i-xth0rgDFh63eHaGa5gcxaLr1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: ti-ads112c04: Add support for TI ADS112C04
To: Jonathan Cameron <jic23@kernel.org>
Cc: Joshua Crofts <joshua.crofts1@gmail.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,
Thank you for stepping in and providing the perspective!

On Sun, Aug 2, 2026 at 6:59=E2=80=AFAM Jonathan Cameron <jic23@kernel.org> =
wrote:
>
> On Fri, 31 Jul 2026 11:27:50 +0200
> Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> > On Fri, 31 Jul 2026 10:58:25 +0800
> > Kyle Hsieh <kylehsieh1995@gmail.com> wrote:
> > > diff --git a/drivers/iio/adc/ti-ads112c04.c b/drivers/iio/adc/ti-ads1=
12c04.c
> > > new file mode 100644
> > > index 000000000000..28d3be81934f
> > > --- /dev/null
> > > +++ b/drivers/iio/adc/ti-ads112c04.c
> >
> > Hi Kyle, quick review from me, comments inline. Additionally, please
> > check Sashiko's review as there are some move severe issues (mostly
> > I2C stuff), see it here:
> > https://sashiko.dev/#/patchset/20260731-ti-ads112c04-driver-v2-0-aab016=
8c3c01%40gmail.com
> Be careful with these.   Some may be misleading or the correct
> response may be in a very different place to sashiko suggests.
> For example we wouldn't typically bother to defend against nonsense
> interrupt types from DT, so if level isn't a plausible type then
> state what is as a comment in the DT.
Point well taken. I have reverted the IRQ flags parameter back to `0`
in the `devm_request_irq()`
call to let the driver naturally inherit the trigger type from the
device tree, rather than hardcoding
`IRQF_TRIGGER_FALLING` just to appease the bot's edge-case warning.
I've also made sure the expected edge-falling behavior is clearly
documented in the DT binding example.
>
> Also, multi master doesn't seems like something we should worry
> too much about.  That's not to say there isn't a better way to handle tha=
t
> transaction.
>
> > > +static int ads112c04_read_reg(struct i2c_client *client, u8 reg, u8 =
*val)
> > > +{
> > > +   u8 cmd =3D ADS112C04_CMD_RREG(reg);
> > > +   int ret;
> > > +
> > > +   ret =3D i2c_master_send(client, &cmd, 1);
> >
> > i2c_master_send returns either the amount of bytes sent or an error
> > code. If the device NACKs, the function will return 0 (zero bytes sent)
> > but this will be interpreted as success.
>
> This one is fun and not necessarily that simple. (I used to assume it was=
!)
> Mostly nacks will result in error codes, but there are other obscure
> reasons it might return 0.
>
> Anyhow, whatever the reason, agreed we annoyingly have to check these to =
see if
> they are not 0.
>
> Or, better, as per David's comment use the smbus command if that is possi=
ble.
Taking both your and David's advice, I have completely replaced the
raw `i2c_master_send/recv`
transfers with `i2c_smbus_read_byte_data`, `i2c_smbus_write_byte_data`, and
`i2c_smbus_read_word_data`.

This elegantly handles the transactions and completely side-steps the
headache of parsing
those obscure `0` return values from `i2c_master_send`.

Thanks again for the guidance!

Best regards,
Kyle Hsieh
> >
> > > +   if (ret < 0)
> > > +           return ret;
> > > +
> > > +   ret =3D i2c_master_recv(client, val, 1);
> > > +   return ret < 0 ? ret : 0;
> > > +}
