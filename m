Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794301961;
	b=YbNz3QQi7f3A2XN2uOA5kIKJd32fZZbsRQA0kCn6M4HvOD2FlpwRFMf+XHw/MnCiHINI
	 JtpTliakJLK9lD8HUPmH7O+8eQ7dOeqcWJI3cgO2+ZqCcDkY+C+c26mbHlo9DGxAqFMEI
	 /HUaw053d4MD98Qq632pZSaY+EQr+6z+NbL8gNktrOmyP51yKuSpcQ+HM+XLy88hg6NQO
	 Sdww31owFZ39H9iBir5Zy4nl3qWzIXAEaSIyh8vwPOakmXu3jYzeg6P6M1V2anHhyDwar
	 kiVk8yWdulAaU/0omudKtJIVMoC/1F6c7t6J3Il7IBAE9xqay810ya8yxkXkryDAH4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CL+mYaY3tGDnGHrtpelaQSBbIHf49nURgXV9HJQUfY0=;
	b=QVd5HNoVWi6jYJ6pJQNkb2mwt88DCVFDvWohX1RC2FJnHOWSEVt8H6ZBpMCd5KHNzqyD
	 3cIEXB32N3gUUmaGKpTq4mcl0v7uniUAts/omA9p+eL/HukGVnWqxo047pJU1VKjakemm
	 tlkYem4hrAJUMRwNAMLukvUFqcBP6ItGr//MW2S/hEQlxEkQ5/40oXMF7823NdwulbNc6
	 lbVvo2XebF2f6ian0nEFMI1oXqw6WVToEfvZ+OwbpwO2MLNbVs/XpT4E+0T2qE8Ko6A9S
	 NQ7kw8tAEJD2y9g47OUQ+iUtJxWAwg4CwTMp/3h2+7nH26qaq00WTFAYa2y8HOws8Cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXKLOI63;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC98B606A32E
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC98B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXKLOI63
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b30477a320so13255727b3.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:12:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794301960; cv=none;
        d=google.com; s=arc-20260327;
        b=hy08TJWrRRyDFAsf9TawVcag0iRQAxgQLsmJWEl2vaR99bju4hrJ1iwhhxCWV2TzDZ
         DI6Lr7EcqL0GQuYMe6hunCcFcAhtycvydSNpjTMNz57ouZLJe2zJaLjGRsI6TnJZ/pWQ
         vSogmLmsTedqBHu1fU+w+GB+jYbLYeFkIJOMGlQ9wDlnOh3Er+MsuBl0rqyoaDJA8OaK
         y1jLqFGYeVmfpUQXVcDWKocDmx1BNCFp/ABQI908Te7TzUxcjGH1NJ4AFWRRkuHlRKBM
         4ZgWxdAN6KwYs5y01AYYSdTQJFWBrKbKG5OBlxWkBtKuy0hD7aQ7USpooHIFiCnM80bg
         hJmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CL+mYaY3tGDnGHrtpelaQSBbIHf49nURgXV9HJQUfY0=;
        fh=GFIzI76dfHCvbopOIn9SRfgB9tASOpZ8WbCjufj+sv0=;
        b=e/ZultkUIWq7D2b41EPSEaaVfez9PpYaRZqXvMwbehpZPTMlxa30KEB9OopfBwd4N2
         AKJ/vBc/qwAKEPJHGym2ZOvVH5q+0LORQqHNN677f7CdlQs8ELFsFbC6fseNNTfBQSsX
         HaK4Gvst70Kqdox+PT4QjYEO7bwr1oNrfNbu6h3VSyRRoXQL9KLVBLHGvucEvaeziVTU
         bovHz79Biw/8WVbJSFz1wJy+IH+80yIqZZgJMCmvGVIh1MtlxZyLWbcZoOuxzDyVAEq4
         eoDT3+7bQoU0m/R+kvQWadys7sIqvNzzzbTa1xGNjwLtyT7js+rSstHzZ9kBpBuLcZ+l
         0pkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794301960; x=1794906760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CL+mYaY3tGDnGHrtpelaQSBbIHf49nURgXV9HJQUfY0=;
        b=zXKLOI63QCscfYZHZY4+Myzicd3aopoC7ck6ONm/yWOwDd9HV1/45+T4CD9+NQGcTG
         SlNX7swBaKhRgHML4wPGgoeSBIi35vGBbJSSz4yimhH3cIFRhcjsbCyjb9Uu/ORVkgD6
         hsv+pqcRKb0uHQ/jo7P8JQs3ZK6hvlZjj1oof/XjmAN9/VfK/6x0zq58UrGVPVenk8Du
         3XU4RtAafPfiVRYCDA5qoTR7c7CTBlHqK+BsdQtwJe7rfa9Kr0DBbBdYZZ3bpmYeqIPY
         93hSDDNLGk1fNgdbjh4PX7UbjOYPTKMD1Lhw4NO63Yj/9bYTocSAjc6Wvo5ijvVNmQ+p
         jmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794301960; x=1794906760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CL+mYaY3tGDnGHrtpelaQSBbIHf49nURgXV9HJQUfY0=;
        b=c2An3ovDDKGC0c53Vt/+232yY//CW2EBbwytBkC/oYpYjm8L/BsUJ3kEMvzBRZVWJ5
         J0mUh0z++M4y73b71N8czGbnan4X8zE0UhO5mHSuAvbkeDnex+r0YC+T6N4gGGboP2qs
         0nihzfM1ib9L4TSQTRevnZPrislF8HwpGMQXz63uRjjDVYDj2Hx6s3vy9n1khzHgRSBV
         qJYW9udHzbxG0t7uqsTDH+BSxNVhdxvG6YWhTg5AMyz8lI4Mqh0tud8ZemURB1x7sChi
         lNjENM3dvVcVpktp0zpoLJmpAMwL/mE97KubU+hYvybUgcALh4zlgbZmsma5L39WmMit
         5ugA==
X-Forwarded-Encrypted: i=1; AL+hErFvjdVm8LPr5J+G/W7C1SsT1UnQmM1f7NRjzO0sHhTgukmL6Vu/Y4xEEf6QTPXp7hB6cNGqyMVRlZeP@vger.kernel.org
X-Gm-Message-State: APuU4Z8xl0eVvwvzEdMHd+uToQIWTtAlxm1IUzZ6POSWGfDRklNkIgFn
	g0F2IoPsVGpLnc9IKbmNjtdYI32WQY6JB9dvdGT2i+KAOPxMAmDFMcrtiuvHfD6pm6ja6r4XvnP
	yRhRpj38xwMIylMs1pYW9T3IvLX1HuMo=
X-Gm-Gg: AYBFou2jy5o7t9G3z1jVGaG5BTEOjYbbmumKTHpcus46Iji+IEQFaRxqyoOJoEEu1aj
	i9VYkkfn54b/WsEQFFCBpdpHzf0ODOVvqs67fMBQrKD1FlYfzeE3F7UjbTId9j174UarrCvD3r2
	QtFdujxw8kGzAPeemCtin+2/N6Ob/UQcZmsD5tPLzs6QoLR8TgykeDgipFEkJpw7VZj7H7IvDU3
	c/c0gOM2BQSll+Zc8ssCyvKxF0CyiqYIncRJ89aDJSW3R3bnTExLCUltSQzo5myz5FydiVljQdM
	BH84h/Qx8xrnYEpujk1nJ2CyqyHMwKoPNtQ7lQ3OlNgpAwlqAf1wNomElfa4OSr186Br7IUo+9u
	PekPknjn/vLe/iD0pYWUe/f2o9ALoHNq5FeWGG65+qtbyVZLJa5mcAoye8ptj5pRQjDU+lntgCs
	M6bmLkG8xlmsTowqRMkFH2oUATaGNOSH40Ipqmcah/PzNJ4ehYCO0O9VCCB0pTnv99A1HBI2kJG
	4rFZXEfwvwh9wDoxlEWqnNqwwCJxHqm6dEK8wec8w3J0TqLH8janWY9X/vTHWE=
X-Received: by 2002:a05:690c:1c:b0:8b0:a01e:2cc1 with SMTP id
 00721157ae682-8b392bd3a6bmr12222497b3.53.1794301959730; Tue, 10 Nov 2026
 01:12:39 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
 <20261104-fwnode-for-each-prop-v1-5-6e28fe1c72c4@oss.qualcomm.com>
 <auuhy40x1BMoW96-@ashevche-desk.local> <7sfr4ljlwbehal3or4dmy5jxbjz6ya2lf3dq3yptr54wym5tea@eqaexflmocih>
 <avICwdxyi-W1Y3PD@ashevche-desk.local> <ab73ez55exen3ew52svsxfinwsuatppdodu2e2zp6izjwwqwwu@2imxzxwclgtl>
In-Reply-To: <ab73ez55exen3ew52svsxfinwsuatppdodu2e2zp6izjwwqwwu@2imxzxwclgtl>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Nov 2026 11:12:02 +0200
X-Gm-Features: AclHuK-j7UjC7_2X91Fl0h3tqgy10rRsGsXGtMX-1tGj0PKndsOn6ITWu7Xe30s
Message-ID: <CAHp75VcwiGHB73ny8iSvXeFdjbTKUpnXZPS5iD7NwaMcJ6q-7A@mail.gmail.com>
Subject: Re: [PATCH 5/9] of: property: implement the .property_get_names()
 fwnode operation
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Mon, Nov 09, 2026 at 07:28:33PM +0200, Andy Shevchenko wrote:
> > On Mon, Nov 09, 2026 at 02:07:46PM +0100, Bartosz Golaszewski wrote:
> > > On Wed, Nov 04, 2026 at 11:21:15PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Nov 04, 2026 at 03:03:47PM +0100, Bartosz Golaszewski wrote=
:

...

> > > > > +               names[i] =3D kstrdup(prop->name, GFP_KERNEL);
> > > >
> > > > Can property be statically defined somewhere? We might want to also=
 optimize
> > > > these duplications with const variant (here or elsewhere, for fwnod=
e generic
> > > > path, I believe).
> > >
> > > Please rephrase because I'm not quite following what you're saying.
> >
> > Can prop->name come from something that is declared as
> >
> > static const ... foo =3D {
> >       ... .name =3D "bar";
> > };
>
> You can't know it for every instance of struct fwnode_handle, so the
> answer is: no.

I believe I misput my question. If there is any potential that *some*
of fwnodes use statically defined string literals for the property
name? If so, kstrdup_const() and friends may be a better choice here
to save some memory (which is getting more and more expensive these
days :-).

> PS: is there a way of using match_string() with non-const data?

Why? It's an input parameter, it returns an index. Whatever you
provide will be not modified.


--=20
With Best Regards,
Andy Shevchenko
