Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6905158A5
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 22:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790028404; cv=pass; b=pT4f7ZN/Ae3FSRhb4tE5fz52p5XZvB2tuxZDQQSCh5E1HOG5pfRNOYnwQSKJBZyrQfqxaybVusiZDIXRF9z/pjO4jMlAkdIjBXTazGFhHI0EswKGkQWePMMv5yyxesYFvlyrqY8oALf0BpxIeKaN/6posh5b2gO6IDxe8HnK6Es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790028404; c=relaxed/simple;
	bh=1cCHGZg4oO6GfGJZo6/tDu3G/3YgfC3SD/e3SnMkwDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNgzErV7rmgJaipvvfsU4ysklKl5xZgdeXeevFCchpwBJgPqtlRmIjCyhzG/I73eLy6+5EBM7ADK3tupy1hqn8Uigc/+Vtqo3mh8lOQ3gpO5r4wpWOtw8smPNhe6XYqTv72mhuZ2Uw1rwf+m6V8PXb7mhOXBj25BAqXFZmkWQc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJ9GQUvV; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJ9GQUvV"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7daaso4674008a12.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790028400; cv=none;
        d=google.com; s=arc-20260327;
        b=mG1JAxKdhMiv/X8ohcP0f3LXF2pJBITqUU4hVs/3FhOAfWDx7r2zKZo8P+/oi6+qQn
         JVpsHfnL1GrIW3gbo2Qd/XD3iDGpMglZkmrl5ixXpr9eq4njIwM48wci8WnRPeWtccX3
         JIBaFNnZszrB3qXaJq6bDxx5fcsafQ6jcLIaZqb5pcYfKhjYe6jiKg9SGYu4uOBkHKqp
         unxJR2AdRyV4bX3v6/ssO4RrVcCs+ijZe5zQEXGIYcQpTcguMqdCzn8TudZlOCynNybN
         SfjkjDQd8IfGhXcYnE/jR6OmzfHvZvWLcJENTodOF0ZspuSCKZIKrR+NLWbUw8U2Yqrf
         0NRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ul89LQtzZYQQyjhHOC4Z4WmP7/rkXyEFD2EocIcLves=;
        fh=63QU/1HFPnNXKVBdChFeRaFsKuqV3+cWMYQQz34C3ko=;
        b=XJzTE85McxVVn+dTDpzwAtWoFmUHfRXJB5cuUx2lm80C7GlrvXpgnmEuPIwr7kjUOn
         FySGvUsPtx3O4tuShULIqlcejuwc86zoNl/GCGFqals/FbRI7Ffbx6b2r/DPBcBjIILn
         y3IZfUCNhT81acRC/gDmhEciUQvkY5YoMLDNaf1wbqaVAPTYNuC9qiujd5ukYiTPTOd5
         GazTkAWrPLfx7xDUPCXW6Oq62+UC+7Fq2NTMZhJnTY4mAQzWYGE5OWKcSq2cL7AhwpFZ
         he8xctFNn1IxA5sAZOk4K016gUc7KJCWH61DrV3CHtSxlMHYNwDmhL/SYAJNtSbLqGoO
         SZVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790028400; x=1790633200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ul89LQtzZYQQyjhHOC4Z4WmP7/rkXyEFD2EocIcLves=;
        b=kJ9GQUvVZYDV0DiCOWUhPfvXSa8tNDCi0V3H0y9QYvJteNNyZr5tfDZjb9CfNZpUVc
         kuKD0WclDHViMj/HpUswF+rjyKAQIkacbXi3VRsloG5WQ4iCr5rQFQjge+R42Ob3cPDF
         SZL5OiupviioBAjfRwr5H8xS+yGsuvSHThXJsn3VGG8rUL5pG+uiBEB02sbPoGUdEK0Z
         EN3VFNz959tUzg91nJbTe7htjy+HMQRGt1+zeb1XEd0UlLLtLzIcbY9M+4rwQGayWS4v
         bdtpVvN8R886eMRJJ7bQzrcWpttXk+EtsVgSVye1j2sTmXXmuWUVbOTpR7dO2vCoj1nh
         o5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790028400; x=1790633200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ul89LQtzZYQQyjhHOC4Z4WmP7/rkXyEFD2EocIcLves=;
        b=P+rfmj6kPuCQDG9P05CylW3jsXEQ7Gd+zw8RyMALquNMmt2excca7xI/A1zYq7kt0K
         fWHs7M/y0eoOw6zXdmfEfMbTPc+nuMJpTAMTsqZkvjEOVuzUsyIoHxb3KlDvI+754Jp4
         +PBIBQHqBOPzYCWX4I132HikV0tOP/4wIdYzLZ4UZKbDHwD2FPs9xOaP5mUtvumzCGqV
         H/orCLwuZCjAm2KJBPlrlUfpskgCBvCV8/c7Wj0Qzi7L8z+g2QcJcN+1GWI/QmkOQ5rQ
         /uFMjiMIkenUzk3uyt6sZGRRRk5por9AzTEwITg+q0SOpCcqZ5uXhXh10/EPRzRiTZne
         eKCQ==
X-Gm-Message-State: AFuF++nuVTEDBrJgAp/eEk47CgWv2iyG0D1B/uxfNtkkZjRwxHLe55Xx
	MGkjX6ochr98ofex68sxJipVl14XrEhzOaetcMTJ1Vcw/6GNESQpwcba834e094ovw70izT5S7m
	JJKm5E7l6aeqmh1NJWJoLUV+OChP49Ls=
X-Gm-Gg: AYBFou2Xund5jIIVxH5Uo67d4FHGRRFFa0L4VLK9AY4StudQmXjqaLpxxgGzSDGwH1/
	xQgiyR1rQC4WHi1FlDBiwsTl2iRsWkG1/VsdVMOF1X1d2VuQJMp2y/OKy40v3movav4bQJMCHX+
	e4oKBUKAAv/YMYrB6uh3kKbvFUBw+LsKf88yJmxRvv+XCkkTGDqt5Pq23YmdFMUvJviUFBr7Vpt
	+rWazCpgl10h75plREery1i8TwgUglFFPQhJFTM88WpWjmmTxYkZIGQrfXX171mhcUuetsP05PR
	bRKB0bJ9e0ngUQMLZNPJ3BQgNZH5HduLJC3Mk4mIsk5Mn7YLnTSiL9SR9C1dy1/Umx0Cyeueqqe
	KEoeDOQ166wDCOsYkCC6G2Gs+raVUhD1DSOGVJx7rQVpVivJiQJmmzfjt1JFDaaL2Rre6K3Csug
	8F634YYnfDx5v/j3anidtvfyH+VjAJNleTw4U53MT0kIX2DoMLzO/1BGPdiRVKFMdqkSoYWkoNA
	DS7
X-Received: by 2002:a17:907:9813:b0:c29:f5d5:5a90 with SMTP id
 a640c23a62f3a-c2a15810476mr995533666b.26.1790028399498; Mon, 21 Sep 2026
 15:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921214133.16519-1-rosenp@gmail.com> <20260921214133.16519-2-rosenp@gmail.com>
 <7980fee5-f70a-426d-8cdc-d51e15323852@gmail.com>
In-Reply-To: <7980fee5-f70a-426d-8cdc-d51e15323852@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 21 Sep 2026 15:06:28 -0700
X-Gm-Features: AcwNN1V2KB9rme8n-5tyXAxXcXiv23teUPiYe9CAfdPv50-_aVX1j-Zp6NK4YGs
Message-ID: <CAKxU2N-5E=GJF1PkcKzXJaj=kzf7duHnu8j=KZ1akgu+6Qg11A@mail.gmail.com>
Subject: Re: [PATCHv2 1/2] usb: bcma: add regulator support
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 2:59=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
>
> W dniu 21.09.2026 o 23:41, Rosen Penev pisze:
> > @@ -411,6 +422,14 @@ static int bcma_hcd_probe(struct bcma_device *core=
)
> >               return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_de=
sc),
> >                                    "error obtaining VCC GPIO");
> >
> > +     usb_dev->regulator =3D devm_regulator_get(dev, "vbus");
> > +     if (IS_ERR(usb_dev->regulator))
> > +             return dev_err_probe(dev, PTR_ERR(usb_dev->regulator), "e=
rror obtaining VBUS regulator");
>
> Did you test this for DT without VBUS? You seem to *require* regulator. S=
houldn't you make it optional?
Nope. Confusingly, devm_regulator_get_optional returns -ENODEV if a
regulator is missing, which means probe will fail.

I could remove the return but then I would need to guard all
regulator_en/disable calls with IS_ERR. Much cleaner to have a dummy
regulator.
>
>
> > +     err =3D regulator_enable(usb_dev->regulator);
> > +     if (err)
> > +             return dev_err_probe(dev, err, "error enabling VCC regula=
tor");
> > +
>
> Can't you use one of devm helpers that get and enable regulator for you?
nope. devm_regulator_get_enable_optional returns an int, not a
pointer. This driver requires management of the regulator in suspend
and resume paths.
