Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A944931D366
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 06:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776839791; cv=pass; b=cWqtLc0qMQI6T+E4vV1MU0ZZbgdVJppdvvHqlymjhNwD46B/fIwC2a9YydMNplxe4xggsv41G+0MZAqt3bD+irzBVU+Kn00kv/8R/n6p6JGFCU9D17IFqytQrJ/rtJ+GMLQZ+cqJxZ1+XEgM7Hxx9qZkzUw66FbxrF22N0GZcTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776839791; c=relaxed/simple;
	bh=wfavpjAJSZ7hjRrsG7wTFAHndOUYUXOJbTCj7dcdkBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opzjDKubvs2KvVxKy8ELN24Eh6XsYX/maolcw1BnwzYwNG5wZXOqDGhcaTX5VnwoTMFt4UMh/9919FfdsMbc89p8WlP5H9jxuVAPCqfPF7DSD6EmG1OIizPYyMRNhPcHfO3AygIp+/twiyVbHz1Q35AKdNozYwDQWx2GF5NkhKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IW9ucfVe; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IW9ucfVe"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43fe608cb92so3486714f8f.2
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 23:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776839788; cv=none;
        d=google.com; s=arc-20240605;
        b=iIgRue3tWij2nUxuaNYIVzozwvCSwY2eyHFeZxQKEQjgZGC8JOO1bVnW+/9C/MILRL
         CLFIArPVG2ws+xILrru1+5jJsvNRWM2VK+OszN/l6RG9FA4/2A7mMC4DRM+BMx6hBYdP
         JBOAyGU9f3zljAlV/f3gRuutlzCdZxSiknP78e4KPhb3W+jNNKiQxEOO0I6+lN4MP666
         xgnNHQUC5p8+xFRjHv0dtV3XkPpGm9HSSoXkEchVhXIupSPTrwHsmc1TwJRvxdSGmp8v
         B3t83DLWHU2x69SeoeEnaFON/QxrNHsbcReujUkiidXz5EaayojT2SsU/YTSKQeIlH4n
         4aZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eU0mpl2hFzbGd8K+Y1Yf6B7ztWaV8bpKCFESHc+BsSc=;
        fh=Kyn/EcPy7pzL07WB+brRgibtjsFLW6VxMLjZHF/vkao=;
        b=kCQKdnAbJ4wuveN2LRSRpCKsSwPYl81+VxX5tVDme5O7vqBa89WT4pyNWyJ+AsIiUm
         vPjL9P/2OWzU+NmEU3EVKSEVnCaFHLCrh77frTPdqyjurlfMi24Lvp0WYKy9ysQNMveE
         SVSBuOFINIYZgO1WN2tYs+A8628b1mLyXYDXsjmGFR0HSVs4K2Fp9g6abH6CtgHJGaDL
         J2VwCOwTISqPNILmM2DvYmt/mUy1d8MTVFyxbDPPvfOS3Nd2EbqNBD1DMFQ/YLphm6Zj
         CwVI/O6IKS9BA1Mf0X6ld/WetEaQ8EEWsmnPq5B6VhqVpmSfHqgGRC/vn2MlaquOmTuv
         90SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776839788; x=1777444588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eU0mpl2hFzbGd8K+Y1Yf6B7ztWaV8bpKCFESHc+BsSc=;
        b=IW9ucfVeT/mnGYgdSshb9A6jwQ0aWoPTd+/L0/mNQEziubP9LOAO80jXmXkMiUL8WI
         kTgrLMbtOFO3k6wNDQ9HWyEebrgoZSfR/ZXLVdqlibRJMXVlG4fZK3+8y9gah3L176Nq
         CcN1y+yITxuY93trrd1JfELQx+9CRkEr0FgrCyYL0liY9Qb+PoFe/mtbqBDwwelj1pHn
         IXx4sUuukSvCAvvDqYkhD2XxsWJeKYWr266+Sk0QSjUqOAZtcVkuO1/+2xjRWADy0xT3
         sujfqm3P7KJZ+UK8i+5hqMgLLiYnpGanQTrlVyP0fDoVD476g8fOwvglnao0htYh+wXj
         oXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776839788; x=1777444588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eU0mpl2hFzbGd8K+Y1Yf6B7ztWaV8bpKCFESHc+BsSc=;
        b=W993D2A2seFAT7KcmiNf4ApDrEQq+j59JxL6lm6nAjmH32F6EZ1y+c42vz5TJTe4qM
         sHaQXU5+l7uK0PrLiyik8YlVNBUg/iPG02b0loKnHnQ1z3vuVU2gXjubFQDCqkQ4cFPb
         uomr5YlvUD0dZ7Ux/7OCiAtVwKZuuYZW3qD5vjrV+8gsq+m/oXGSmYxE6uX1pZ9m4GA3
         b5hvLJt70cYcUpjdDYn5tHx/dY/noU9j9gMVJ5jMGTMd0GQ9kz4d3ziTHpwFosRpOLrl
         SbImPDfEQtdyBjhLpauHi5JduaZ1apEhkltHloBJTTE8XNPoNAMBN7Qem9snWA86eOdi
         rF9A==
X-Forwarded-Encrypted: i=1; AFNElJ8daQZJAdTbxCH5aSVpL7Kb47u45MX6If1lTRbn9BRjrEy580KxEk3pdTugSNqtqErj3tl2x578hKDz@vger.kernel.org
X-Gm-Message-State: AOJu0YzkOuQ/OlvCNuqB9aolSe2XQ+slmRyn4cbEKd1EKff9ngo+MbAg
	ODzjNwKc+s+XJSFSzF8RPiWYGUactwiUsLZqgV18cJAuZ/gfrOAP9t+/TjAAgaEx86IJACqgkFe
	ETk8qZhFAur4FWhV+XOQuZbjNa9qA7r0=
X-Gm-Gg: AeBDiev/HPzv2YYU6yQk61o+t6svTd7fYpleH/aDfXDUBIUbOgC5Q0roVevJnJpNWSA
	q23UeP21Fh9Ag/z2535NbZvyYw0j6QWz2zdXNFhjppG8dXDxS/IF8Wd279f0hB7mudpjirj9/GB
	vqx4SizD+n3nWmepnHuphUCeJw1c45TRV5NtDNMsK/+04ATnvdVySA16VGFyeHfELxLhUbSKhWn
	pJNRK7Yk+OjWChhqIn0xuo7Uc1z76kdGranU98V7lt4u8f7H5pDmJY5RB3jn0GmDbtw2BZ7sSEw
	kajHbNIlkTt0+qLFvSQ=
X-Received: by 2002:a5d:5f92:0:b0:43d:71f4:7ed5 with SMTP id
 ffacd0b85a97d-43fe3dc54famr32939529f8f.17.1776839787814; Tue, 21 Apr 2026
 23:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419093412.40796-1-clamor95@gmail.com> <20260419093412.40796-2-clamor95@gmail.com>
 <20260420-affection-ferocious-e28cd29f360a@spud> <aeZWgcARBqMQatrr@kekkonen.localdomain>
In-Reply-To: <aeZWgcARBqMQatrr@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Apr 2026 09:36:16 +0300
X-Gm-Features: AQROBzCUJhTnbg5bBGAy7L6DdQ6sPnv4p1g7vJBHYljdROCv4p5UQj1SToqiRiM
Message-ID: <CAPVz0n10Us=zU38v4ieqWXkQ2pXRKi=6M4i3k1Q5bJ4g2QQjgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Conor Dooley <conor@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 20 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:3=
8 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Conor,
>
> On Mon, Apr 20, 2026 at 05:20:28PM +0100, Conor Dooley wrote:
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - ti,lm3559
> > > +      - ti,lm3560
> >
> > What differentiates these devices to the point that fallback compatible=
s
> > are not suitable?
>
> Good question.
>
> It seems the currents are different albeit the register values themselves
> are the same. The driver doesn't seem to handle that properly right now, =
so
> it's a driver bug.
>
> I'd keep the compatibles as-is as the current limit applied should be as
> specified in DT.
>

This is a valid point. Unfortunately, I don't have device with lm3559
to adjust driver accordingly and test.

So, Conor, Sakari, what changes if any I should apply here in v3?

> --
> Kind regards,
>
> Sakari Ailus
