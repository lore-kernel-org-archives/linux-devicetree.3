Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD6E3EEAC4
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 16:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780504829; cv=pass; b=sUOHqmYXdManji1T74AepMJebMrZvmAsnrKK2cUY372klL2RLAf7/ybI8vrmCRjEWkvEbJLNsm8Bp70s1Lxr3KrZWSO9pAC+oW1huLl7u2MGeyc8C6RQbl8VWqlzdyI/ombkLQfyhC7EyjjhBOYJxbzU2X2WBdWf51GA1wqi5aY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780504829; c=relaxed/simple;
	bh=eFUqVxv/9+80Nu9hearScbYWdYDMy+i5moXBBKkWcw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WHqpLjpqe/38PWdfi4sQyLGyztcYBolNm1ctl3+hJbolh6p/F1SI+QRexn1Y2tXQI4keeXTUcytSAfGuj+Andm2LV1B7vDJ6xNe33g9rQSBRVnYDFEVATDXs3Cp1xsfeybwCn+Jms9Aj1qowtDk3HGnp/TVA0o4GZ96QZ/AFhYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=UC3shjdA; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="UC3shjdA"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68ae265815aso2547397a12.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 09:40:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780504826; cv=none;
        d=google.com; s=arc-20240605;
        b=R1dVzlmJI+kiEKfre2pe3A/ftBFUTv5IytfC14b2C6/xcnU4OC8MOVtbgoNstWOZk3
         LNrGZXqUMnmjR/Pik8aSYF9f8chx5h1dncFSSpCsYIB7aeLHPSt+ugQSUufq+H2ONVAf
         KXoQOHGf4CLiAbZ5wnf5DfUgZDV7TB+mj8FP4acNp5k1ACsFfvBvj7DZ5zq39hd1GqZF
         rMMnfAjWq02vNK4aiGjvHrhtOHOa1kW3SX5loZp28zcibxiWhpx00e9z04UERUwGVLiV
         /lCwcMKpIinCx3vzB6piRGY6+Ik+9HjPjIZTjOjzSlNzRNWxbAa8BPIdHqWbTIU80kNC
         a43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pIETLp6KIfylYmsPsLeozIYxgNDP26FqYjHINKkCoJo=;
        fh=uTm5sKDExNyr8Igg+vbHOkMC1Hjxo9nSGQsOGa3l3/w=;
        b=htxiw7bfVXerQyU1FTuc2Lt8sM3RtYGCNrQdK6KJgih2++a3qZCkRBGg3E4O8fEgi9
         tCoXBum9RfW05MU7+FBvsa4YkzHvUg2JxiQRmDeLG6uDayEljN1+6067FdaGBEbcaXpt
         I5GD5NQtf7NQGIbwvMXFw6TgoN31mcTH5rLp5tC5zXGJyv2KPWkJPpEuU4bQhpCeVcfm
         kHKq/HZm5nJfu3JzY7Gz4zZLkOVpA4P/3hv/nGesGvWcuw3Oe5dLfszmCmSpFlZwJ9NR
         YBVvVJzUY/3ObrDyjnrG2kkBq2aJ7f8zwJzoV7SEKDuDNaty8FrZ8GtX5NMAMvu5NKQ2
         NK3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1780504826; x=1781109626; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pIETLp6KIfylYmsPsLeozIYxgNDP26FqYjHINKkCoJo=;
        b=UC3shjdAayfiqRfNjBff88uXqzcfQMtmEvLryFHpn2VR/AK0HgYwlp68xYj6V1H/0f
         8VBPS01r2NZI46nvX8aGyGJsSr14YOFjhlJpzgPrKgPGhNRaWHsksQkR9juWOB2bcray
         WhdKidALLgNmud9kj7K19t16idcQSfcW4fZVJWTKpOz/9h18S3SewtDx4aF7C1Kms4o9
         4Pwg98R0Z/vWfcYqosm0vyCzvGhNyC914iCnFeniWMthVdk3702fQ26Q3ZcZvtdVK8dG
         x/R+CzvEMn6hL1QXxBcMyJC3FamUZcK0dKkNFZX8qbA4mJCtmrsgmp5OYbIoxBdZpWrs
         VjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780504826; x=1781109626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIETLp6KIfylYmsPsLeozIYxgNDP26FqYjHINKkCoJo=;
        b=paMBdZ/1Ip+BQinF0wOEYLNSiLJQTwDDdNjbCVDLfnMc0Z6b8V3i1wnjL2crLpOGCX
         s7TE1b/Fxoc29YWV/4KzhrKL/3lC8Dyu1HNtDn5XmQ7ZshcpzVfL3Gw98odCNBeOQ1ET
         2iqd/hW6n+i7H//Bz0xRFQrXrfkVN7Wgyjfl5UScBhNyk/Tl/yxw8PKCNGwMcqMPuXlN
         iKGRlWh1iFgyWrlmCjM9g+FNq9sDsCuRH0P3VxpM/1y4gFwyCkkBI6i4WKTDljQZNNzc
         uX8tTcuRlbBowN+HRfUsWwybIG+UYQMUKiX4EDsqIZHrwpNo4QNCPrRT+/xdHJauVbXO
         MXeg==
X-Forwarded-Encrypted: i=1; AFNElJ+wjb35oQVGrTrCqFREX+7osTvOVosePMCq8P42mcqnUcPk5ASPmPFp8k1BvW75gMf6SsnVRzzNKO5t@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ11NbHcm9Hv3Un8EhIqQPbMb+1sr6Sjog2iAUDVduIia4RpOS
	upQLn/f8EuAS74uFJyHE3PduI7lHcyuVLH8yStV2GUdzmoe8r3xKBSdqz2rSF5xdCkePL9Me55V
	fUTEuOEUR3fmlqCLruufLbo3Sccvb7VC+c3hlG4vNFw==
X-Gm-Gg: Acq92OGh2rm0ooYcf+ALYg2NavhSn8xeql4SGXyMsaKkSZzMEOZzRbEIxm82T9Jh9gI
	pjEzEnkauFnn3cCEiE0vn7F50kB1p7FeGb8j4dT0FWbhvpxv7dNdl0J0oLPDXw+c3hpGcEzXEux
	iawOcHwDJkGgoDLHn+eVgv3baWhR3deigfD+GaaPIXd9LedaJrUkm2MciKpPCbIL3afhnZyPGiy
	yI4CWhg4xTnMFhbxqqjaMobQqplwl1+3rhGi4M0kolUnSeIfqpNzGuDSP6ShqL2nLnkEpEuTssf
	thIoQFWFTJ3Z5oyuiYDiB9q7g6urXyzsC4O1myT9RU7MEpkyTwggQIcOLjSa34YQLUOOrbKN61H
	dw8X5pv8=
X-Received: by 2002:a05:6402:2681:b0:683:93a2:dfb9 with SMTP id
 4fb4d7f45d1cf-68e6f2cbeecmr2236369a12.1.1780504825758; Wed, 03 Jun 2026
 09:40:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603110127.23930-1-naresh.solanki@9elements.com> <20260603-deskwork-perch-ae4eaf92368f@spud>
In-Reply-To: <20260603-deskwork-perch-ae4eaf92368f@spud>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Wed, 3 Jun 2026 22:10:14 +0530
X-Gm-Features: AVHnY4J_O1JkMI_4gzw8gRgkRgdM6PmCbsIr17Aw4fnyKw6IG6s36I5OjWTKSKg
Message-ID: <CABqG17jzv03U5=1zhVd57zDDWFXpt=mX030HVyLUpm5q0LRW1Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: isl68137: Add RAA228234 compatible
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Grant Peltier <grantpeltier93@gmail.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Patrick Rudolph <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"

Hi


On Wed, 3 Jun 2026 at 21:39, Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Jun 03, 2026 at 11:01:26AM +0000, Naresh Solanki wrote:
> > From: Patrick Rudolph <patrick.rudolph@9elements.com>
> >
> > Add the compatible string for the Renesas RAA228234 8-phase PWM
> > controller, which shares the same PMBus interface as the RAA228228.
>
> Given this, and what the driver change looks like, why is a fallback
> compatible not used?
Are you suggesting that the binding should use renesas,raa228228 as a
fallback compatible, similar to how renesas,raa228942 and
renesas,raa228943 fall back to renesas,raa228244? Or is there a
specific reason you'd expect it not to be used here?

Regards,
Naresh

>
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > ---
> >  Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > index 8216cdf758d8..2988bc6300ae 100644
> > --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > @@ -55,6 +55,7 @@ properties:
> >            - renesas,raa228004
> >            - renesas,raa228006
> >            - renesas,raa228228
> > +          - renesas,raa228234
> >            - renesas,raa228244
> >            - renesas,raa228246
> >            - renesas,raa229001
> > --
> > 2.43.0
> >
