Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A5330BF4E
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 17:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779558329; cv=pass; b=IwXr01Nsee+LB/16AbBorlIbDdRa8C1NaXiVH6+dhlvNNA6fzbsNLb5mI512rULWggAqV8QUms3imBXUFsmd+1C4xzsBJXzAyu4Ge2BUkGdhnJq4GIps+Qb7iI2TMFTWj0RlajyO5VdPsZVvRqPUG8df6f5OE6HAi24eUNaDJbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779558329; c=relaxed/simple;
	bh=30qE2V9NVO+88aShbtnmqeHFmuLpQVCvOfMMZBUbTqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TeKTA8FQZ8d2w4ZEDl3Mp7TPpNAmuUZRkHRt7VowxuwwQAZ7n/2W02j6rLIkzmk3ghQr5CSbuom5Q0KWCogxUGdIVzG/KYlSEAx5YWyJgx/XIjLR4UTdv+RNvZxScDZx0gFvgH5yz2iITwAMjkeZ4lCwTAvC9dDGmulsxt3RzVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWjNp6Dw; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWjNp6Dw"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7d1bcb92072so34243017b3.1
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 10:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779558327; cv=none;
        d=google.com; s=arc-20240605;
        b=cMOhJpP7NMZWADZvDyWWcbnM0jm1YnCYU9s/VVbzSyEUegPeWl2rG1pyKg6TMQRKxC
         Un7LlM+qB2Jf64YYu2KVCxglblET+vr3zVFpsdzL5KOD8tFlgFhKuQY9Nmz2m2ncgtok
         rR6qqonq7hEl6hvVrDuJRor7WVjaIPhFsTqpnr/BwMa123+4RRMk9BOmCsROyyH1JcRy
         0QIKuLsn5SES+U9YxmbwcEwRH04sNWSYyFAnYl2z1/Cj4SutX1iYnonxomC4V5BCZ6Zj
         ke7o4YnD05hH81cu5WqaPMLvxeQuIYVV+4FOq9PtkfCR07hdv6P9seB3O8F1zZGIlsEL
         PvGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S30KCShoOk9+TF7BnTVcfhMPspLJom9j2jTzmoQx+Xk=;
        fh=bIc+2QVsn7A9rSxsXjVmh1gaWYe/dbWK9euAh8v8Mz4=;
        b=Mb8NjruuoTLvfZ6CH2LI3LQgdb5zAVTX0qA5zL+bgCYbZRdgo/OSMJChEAkpI/cuEs
         swY4tvq8URgF5ZOa5MvuSwzhAsQVeqPG5XjL8rURVVOrgdGedq3xlg1A6ji0uIvtMRu2
         MvZkFV1lZpbeJSrXlGbFoA/9pDl96LneRcPS86pXXHKTJbgRpu3aq+n+rBM/Ajlsxl0C
         2DllTIw6+JgqBUXXXZxg0xnCzRLqzDVC52NxhZtMXQMUWlli+t7tlphNdUDodsx3lmIU
         MBcii/JiGtG/GAjWhp3Xa7ww2BiSibv0ukyQpkDze7q9QsvaFLdUjSlBM/y1huo1uqz3
         T3wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779558327; x=1780163127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S30KCShoOk9+TF7BnTVcfhMPspLJom9j2jTzmoQx+Xk=;
        b=WWjNp6DwHH7aDKdiq4cI94OadOeRAcpyLQBJOzI6Ef9ISg0GvHjq1azOX1m0iSOl0M
         0Dd+O3MRspClVFh3H0dwsgiu6spfhb3zhKld+ovWl2CTUkStKKSbKkTIvFnLXv3nAJVR
         dUfYHuv3huZWZUGZmJPH0cVe/JXsXZ6n7J5n37WxD1D9U66yE8B7/v7VZtP7DCu2gb+B
         +xc4ZIS94MTJQuBEbEPYtMM8MN/zErUrPp+N/2cWXOBPoH4y7hjVRlsG8UczLg9ghse6
         jrymuNTZ5c/HbLFBoXi1xpxP9BEqrNsEgdDH672dUQ8948/vL5UsAaaPeE+eAHbsChWt
         SOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779558327; x=1780163127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S30KCShoOk9+TF7BnTVcfhMPspLJom9j2jTzmoQx+Xk=;
        b=SevG93tCTVaiwS2jgC98OnEcHi841pZBZrLueVItBXenYvYePglyMMx9/F5eDXzXAy
         rGxK2S+Ez4+fZ7+U6r0CYT5hB+j/nv8C7TT15EeWeJIgoOH71Ikhi/DuUQ3kdB9d9zO4
         /Fh5OGwYuzs96gr09qSgfoI+j9TZg2CJkOfdVLV2wQrjnK+Ed3PUqP6xFNZONLJ8Jxif
         5pl+SXEOjHMRBhCAUjPkxr36vn8NL2bfdNEAwHOWJrt8FZ3CbtbWoLIQOGmz0SUF0SE0
         Ux5g+tjD0/OGEq6P3/fih/HtZDsBwiMxacGQ3sW5pyKpNyypAcX2BMTGZz5eDYEYsf5v
         I7IQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TglLxfHlqpFqi3Hi8PGq+INZ7ruklmbOhxVrzRjzCbwRb2SFUh63iJ047YdD7fcGR19pzMI5m7W5F@vger.kernel.org
X-Gm-Message-State: AOJu0YyhgoiCfGV4gBUl6qecu/8STm901jwRULYJQ9pSdQzj2/rE6Wq1
	8+SzyUtVldTZ5Xm0IutxzPrxrJViRSoSMuee6F81Zsi76MEvN+O4ioYnvz+wnHtbUofE5L5/D/f
	mwexDvCAHWnSQ5/j81cMnf4w5lHPOA0Y=
X-Gm-Gg: Acq92OGoF9j8U7SNY7XnTqdop8ZWh3XIlE86BYx+OljnCn3dItAqG1cnIoLER33K/K4
	GfRGGUXobfUSAPB+lVuhRPW+5P+VnVMR4g/8eVMOkdueQCBCdOPef88sefdXy4SOj2VOjsXEeNz
	tXDdmo4vSlcweXcdyT/ANs/2nFNpAfzjJWbHkMw68oxQij0RbLm9O+luJSvbOULSoHQFe8X8ZJI
	Bfcq44tlX1hdT3v1pp/OfMdBR1y+XWtrvjloWv+RjeywtUWMpmtKkxgoH9OmZVPfQ5q81lhlASA
	ReuMPopyDaPAR1my2vpbyuG9N2jXfKTOkXkpRJ+d
X-Received: by 2002:a05:690c:48c4:b0:7bd:5cc4:3e5c with SMTP id
 00721157ae682-7d337dae355mr97303437b3.3.1779558326833; Sat, 23 May 2026
 10:45:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521170810.19702-1-challauday369@gmail.com> <20260522-passionate-fair-jellyfish-73b2ee@quoll>
In-Reply-To: <20260522-passionate-fair-jellyfish-73b2ee@quoll>
From: Uday Kiran <challauday369@gmail.com>
Date: Sat, 23 May 2026 23:15:15 +0530
X-Gm-Features: AVHnY4KKLnNMVSOZQqZWxyunj-wEHbZCmEdM2577reR9I9fHhYK8DkVmvOBbi2k
Message-ID: <CAAj-GBke+Jmt1m=qgTUBtZfCB6AVVmSHi_+S+wciEbvf0v_M0A@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: clock: via,vt8500: Convert to DT Schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 12:12=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> > +
> > +        plla: clock@200 {
> > +            compatible =3D "wm,wm8650-pll-clock";
> > +            reg =3D <0x200 0x04>;
> > +            clocks =3D <&ref25>;
> > +            #clock-cells =3D <0>;
> > +        };
> > +
> > +        clksdhc: clock {
>
> Entire binding is for part of other device, so where is the rest? This
> should not be done separately from the parent. And then example goes
> only to one place.

Thanks for the review Krzysztof.

And sorry, I initially converted the legacy clock/vt8500.txt binding direct=
ly to
YAML and missed that the clock nodes are actually child nodes of the PMC
device, which already has a separate binding documented in:

Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.txt

I'll rework this by splitting the conversion into two schemas:

via,vt8500-pmc.yaml for the PMC device itself
via,vt8500-clock.yaml for the clocks child node and the PLL/device clock ch=
ild
bindings

The clock binding example will retain the PMC hierarchy context, but the PM=
C
properties themselves will be described in the PMC schema instead of
duplicating them in the clock binding.

Regards,
Udaya Kiran Challa
