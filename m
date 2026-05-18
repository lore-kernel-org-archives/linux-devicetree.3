Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0C0389E03
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 21:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779139107; cv=pass; b=cq98+6kDlC0OrSNBVOOrlzXX4akz4kU5/NX9ivN7FcUyADPSLTugOgbyFPBktEh9EbmiNnx8utOkhEX6lHmUprNZXgWRfXzcGsXBahOk7+4wTQFFadbnB7ZVfTP3KOJ0k/mCdZvPDriS95SKm+MFqyTGzO0XqHcPjtDF2NQTZPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779139107; c=relaxed/simple;
	bh=4qUw43U2LYoI9+/R/PJBXjvbtL6mII2xem43FyU/rRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhVYmMiXg0tX/IMpl8L0Z7civCR5N8cBW4lPmyX7+OW3eN0bBzSJOo7EPzFoWNe61CtJsD3Gm0nwJ326AmmZMV0gf54390nZ/IJTAQ0vw3RP3M6cubckKpaMJsfEDzOgayOXwavWnabRI+YdwpHf4LsF0YnHW9rDpi40jhSoids=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n8JXKa7J; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8JXKa7J"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3939d2bd739so24532421fa.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:18:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779139104; cv=none;
        d=google.com; s=arc-20240605;
        b=OtnfSwZoUVIQNY5g+oQ5A+YHq8pD0cECWBpgBnkgSdaEMb/5c21SW0+GqGJHzGBADc
         sR8jdiZvoG1VUTJm+n4DFe7Kk35oSl1n3wk4wadP6T8QAOHsMeV9a2qvIf3WeIKwPnhT
         j7HGvU/YJAzFM0+rtQJzbVhFnBYfF16S4yOuAW7qpaTjSV6g97yvNZnl3/Ahf0sTD/nL
         L+wTp8z1Na4GoeF1V8QdiTQXmkZnNo8UM/WTg7yotYGqzMXDR2DZzRXDZNx38Ab+Zakz
         DflxPB3mNYrvB8DyB41CrVwgcYTzoY5YFxYRGkGljhDHkse1Db7XKyO2kTedDZ8P7bh4
         y/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nPd2OppDv9ew6wMyj8LXvgg1wtgj3b6TQdSWXMfEVvQ=;
        fh=vHgMkzOceGKpt7cP1mhLUtPjvAe0FBCwRyXeYVENnBA=;
        b=f+UNHmVZYY0zO3qmYPogLGewMw04klpWIdyXnxIDAAskTU/au1w7wjBGiToiwpNggd
         1e6702pMpsqUkXxpNElcMzvmOzLWAhTuQH0sF3rkAka/HIwAJCxAHwiFF1xEub1AYO9y
         NGy/G+5TPM+Ks1xWwX/W3jHSTJ3vgl1BiWl224/PBCfA5lCVRO2pJjBzsnF9LqYlvZmZ
         VIUJDGxxue5oWEDgbBK1KpHbtQz/Wyg0K0UR0dbJvdoONCwh6ZyC9gqJfMucZFcvmCgS
         qT0y13xvXrt9dqXhjNC4S13pLjFF2ByDtpUia1QRbd1gmGeS0wdZBxIZkyv4byhZvTkk
         /HUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779139104; x=1779743904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPd2OppDv9ew6wMyj8LXvgg1wtgj3b6TQdSWXMfEVvQ=;
        b=n8JXKa7JvAO+ffCYLdTVpySeZzFoZVeUtXKOg30D7UX5gmt6wIDgCeWHz0ys0O/d+K
         czO/s3bwkJDeXEYi1gQvPE72yka0bx4k6JZf5BKRgVV2zp8aaqLTlS5f6tqAJy7/+Ww9
         27HGv68coSSbnJzB897YX5fxbr2IDh+VYSUdjuNMM7QNO/Px5S/TCCHo0J75uZ/0zHwq
         FK2Wx3oSNJOGUm4wDm/hWbGGTXrC+t6PRDNwHg02ytCW6l1yiFNnt5Fw65QFs2TDchUL
         BCgtIYdknqhIk7gjH1lp0ZfKTGcG3H/VjwpYDNObJyd+HfPFw0fkA2L++lXEOymTnZ9p
         IulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779139104; x=1779743904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nPd2OppDv9ew6wMyj8LXvgg1wtgj3b6TQdSWXMfEVvQ=;
        b=ibl2UdcmEY82xbg79aak0Q3LMn4ehrgZ0L13bhp5ZvqRg5CUPQFT7VPXaQqcx2Ckqn
         Nr8eyL2AIGFMSTH7MZBOBfD/Yhwk2QmW/MYWhbmdlnhDmljK8t6EE5406ROJhrJOooQ2
         Lg94Ax5ZAMVI20pA0qqb2aGQmHhSD9mM3Zru9gfJm3g8tVNqpzHtzC8hzu9UIYKyiI6t
         SquzTF48FRJi1TDN6w2QHC3wb0EyMHq34cpHT+I8XEEIynD0GCBl7pyejLNHKXPxAEAk
         hDnX2qU69r3luccE+Nbx0ERwKPDiHY62W98nN1QQKXCuFYMh5/vAxTxw/5eKUY4QrLaF
         5uSg==
X-Forwarded-Encrypted: i=1; AFNElJ/cx2fgVdBVHJPs6MOlO0nPGzt5mBI1SJ2RmvWCeGNzsMote20PNEz/VBcoi8pMW2BZMS73HFfJOphh@vger.kernel.org
X-Gm-Message-State: AOJu0YxVYnQZcd7sr2EUplDhYlDJ5Ppo0pSALHMYbGPjI3gC3ahtAY5y
	36IA7n9LNssRp8O7iGSqsRy/rfBYDESHNGu60l3kCM4nKpMobLKnC+XkFfujkwX2Qn9arNS+ptm
	CFa7E3/41cyCOZDD1lrrOzfZnvQEQAFI=
X-Gm-Gg: Acq92OESNBRH7nxqjlVMPJcBZeAHD+VYvFN5fQgNIkHXf9CcKqOeUBGlm6zc9wk2SY2
	Gu6zz3jW1evz0YTp01QXleAyvqmoTc6dmNDdiHq+D7Zfc7XX4gClfFle7g5fauNIdswlWw7Bxwo
	BFl9aShFLYmS67YNrjhlJ8gWiuqDe6EDwXWNysLLHQ3hAeFfWM3jMqIMzHq2kXkzYFeoNLLc0tu
	9O+loOKv8duFMPGm77Z8BZ222yQfkgQDjI73aBgstrZyJVMAJ61GhgVfpZucCtE5qCbJwEc2LYW
	18Id1VnAihouYgzKNk622SuIFo7DugEdXCLyoDw=
X-Received: by 2002:a05:651c:439c:10b0:393:9773:9d8d with SMTP id
 38308e7fff4ca-39561d33099mr38846201fa.10.1779139103939; Mon, 18 May 2026
 14:18:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511174342.123820-1-piyushpatle228@gmail.com>
 <20260511174342.123820-3-piyushpatle228@gmail.com> <20260512130622.1f3f4d08@jic23-huawei>
 <20260512130809.5ab5eb90@jic23-huawei>
In-Reply-To: <20260512130809.5ab5eb90@jic23-huawei>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Tue, 19 May 2026 02:47:44 +0530
X-Gm-Features: AVHnY4IkPA2euuGf4uy-HpNCACUI-JapCUTXmjsQETWfi991mkr273OkQQB_1ZE
Message-ID: <CAMB+xkaOEVbc=nO0nSODJC6cmbGiXZ9C+WA8NEY8Lhj=3c89JQ@mail.gmail.com>
Subject: Re: [PATCH v8 v8 02/11] dt-bindings: iio: adc: hx711: add VSUP supply property
To: Jonathan Cameron <jic23@kernel.org>
Cc: ak@it-klinger.de, andriy.shevchenko@linux.intel.com, dlechner@baylibre.com, 
	nuno.sa@analog.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 5:38=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Tue, 12 May 2026 13:06:22 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
>
> > On Mon, 11 May 2026 23:13:27 +0530
> > Piyush Patle <piyushpatle228@gmail.com> wrote:
> >
> > > Document the optional VSUP supply used by the HX711 on-chip regulator=
.
> > >
> > > Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> >
> > I got curious given the driver doesn't yet turn this on and wanted
> > to just sanity check it via a datasheet.
> >
> > Why are we including this one but not dvdd-supply?  The suggested
> > wiring does connect them to the same supply but it's external to the
> > chip so in theory they might not be.  Curiously dvdd supply is allowed
> > to be 0.1 V lower than vsup-supply.
The HX711 does have a DVDD pin, but it is the output of the internal
LDO and is normally just bypassed to ground. VSUP is the rail supplied by
the board, so that was the one I documented here.
That said, dvdd-supply is already allowed for HX711 nodes by patch 04,
as only vref-supply is forbidden for HX711. So the binding does not block
a board from describing DVDD if needed.
The driver does not use DVDD for HX711 today, but explicit support can be
added later if there is a real user for it.
>
> I should have said, given there is nothing wrong with what you have here
> and the above is a possible additional change - applied to the testing
> branch of iio.git.
>
> Thanks,
>
> Jonathan
>
Thanks for applying patches 01-03.
> >
> > >  Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yam=
l b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> > > index 1ea60dff98d5..a8eaa1f18de5 100644
> > > --- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> > > +++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> > > @@ -33,6 +33,10 @@ properties:
> > >      description:
> > >        Analog supply voltage (AVDD).
> > >
> > > +  vsup-supply:
> > > +    description:
> > > +      Supply voltage for the on-chip regulator (VSUP).
> > > +
> > >    clock-frequency:
> > >      description:
> > >        Controls the SCK bit-bang timing. The value is used to derive =
the
> >
>
