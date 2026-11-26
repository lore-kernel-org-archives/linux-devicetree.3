Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795699836;
	b=N0s3upuTeqySKDcdYIJGnfY1ME7iG6DaGEWC58m6TfKV1zj5RnqC2jvEjRmq4Ypt/SD8
	 eg0rhrQCAzq6oxc4/uTpLIDsPstxd63CpazLFThiuyl/VSMBakiSex04yzUFJDPJjRqAI
	 /iZJfgy+wqVC0ttEoiexL9tcmgXKCILJu/zKDlrMS3S8vOiHJyxAXz1KcPPl0kzv05tYG
	 RzANg3uxhhr2DbbPhIjJxPVnZLch6h/WIDmQrHKi7XRMs47FsNHHiTi642Cw8u7x7y5Xw
	 PiniM+5xbIn7Wyk6U0XK0krG+kRCmxetsKG66gShJNW/jIuVM7zp2f7XYRivHjdLhzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cpHsV5w2JYbXJ1AFl+wqh6QNZT0CRx63Sll+q8RneTQ=;
	b=0JVNOWjEpOgRGsfruHdng5ig8XsMafGpvZ3zGVXodJVAALQSTy3Va7z4w+wkKBGdzmOB
	 tkNm1bwfAsjB5PaC3wa4vbGfDgtUW2reB1abzRcg3qZRW422zDDQPGmxHkZ6hbbj43OBM
	 FAzlDG4jSK8VNrtZQUcOsLWelmZIdgmADfOviYAM+fhEW0DGhonUmj6L8MOlc8tS6jJ87
	 yVdsm21ceI3veH5QX651+uHLASeCBXJq1TQSvRFAUwlqnKPj8TK0YCBaYqzMQ8MlpdIbb
	 kL9D1ygjeOHWxiaJ8iCGkWaM9swu/kXu9bKKkyHyvmThjU1M8hRYDsuHjnxi0cNJurQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iz8oGwyO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAD6606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FAD6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iz8oGwyO
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso14873138eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:30:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699835; cv=none;
        d=google.com; s=arc-20260327;
        b=hpdBt+qVXlQIhTumtI3hdHe4EwhCVLnpdpZn/F5i+C7/phcuxcRfdkN3jZETbI7tce
         seqSHLQe2WwUQPU23J+yqITpV5z/ZqKlfSTp07Q54s21qtrRxZ7GYm9mSu2sd3mlcaFH
         QievM/hJUk+EK7EhHsPZoKmG+qiraaUAkojY0Jb5HietBkkQ/DYL9XA7FjVZdnHr+43A
         FZLU2H066q/XGqpJ4EiygCcYu3ev8ChIW01qkd3hH6KHLtgtKltJqEH/CSIvkK/ieccO
         MqEvqRgO26eibbMgoUdUT+mdpYnJ2ilE4GuczwUCGQ0yNK1G740hSH0Vm+TfGojUxElx
         dH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cpHsV5w2JYbXJ1AFl+wqh6QNZT0CRx63Sll+q8RneTQ=;
        fh=dQpiv4yn4/LDCNVEWjbqL5xgLgepFqmK3cwnV1MIZKc=;
        b=Umwexo8JWN3AEVyipydCIAN/bCS2fiul7buztH4jUyuBvkBl1vgKfgkKZpQhs2KIrh
         12PYRk6Os4dFDlkPEttc99nCF06t/GcM6RxAHkI73oQF+sYQLV7BhXVYzuyjFTDxr+8r
         ufa6FB3SxZGvIOBx9dTpT9f9gzUkIi2+ncjdwyZazdTq8NFywiUD2c6kAhvS5SuwtZ7V
         uNX0Q7VVrueCZ4id59QOwz3IOeemLbRbtiAeVIzXyudj2SQ9MGYEeiQaFQjN4/LWb+wO
         WWLPdUZeNxAh0L75hJKzX1yDyqXewUTTnAWwAE/zJytrXKVgHLfqf80YSR2xWy/OwKVw
         QHOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699835; x=1796304635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpHsV5w2JYbXJ1AFl+wqh6QNZT0CRx63Sll+q8RneTQ=;
        b=iz8oGwyOO09o4i5dWB91D4ghISsBxmFjH2tehPipI789M9ucTYLpa7LONDMVVl6ICL
         v6QuocHdAeNYP9nvTFW9XIXOBgQGaueGU2YlbdDOPj5vcjRZgbC8tm3zZxQ9omvYcXDi
         xB1pI6bJGoMuTKu37WkNP4tGErBsJVIZnBjisgqpvYrk/cF7dCP66d56rMov1NMAvlKM
         h85ENOl4S8WOzUZMZUA0MCIy5oGQ0AyLFlKk+AK1WfOvUS1/jSUjI/8rI33VxjXZ+mc3
         EAY74D0kL7j3CP0Z/HH5p80XtoxuTKyA6lmTbLid4SC68C1wk5YyGkNvgeHQVoZm6sd8
         b7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699835; x=1796304635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpHsV5w2JYbXJ1AFl+wqh6QNZT0CRx63Sll+q8RneTQ=;
        b=EoxX6FNoAwpHuKumroG1Kw//Ho+Zf5++gOJk4tXbr9hvfEy4mftcl/DJMvE0ELkHzJ
         8xNjf7M6fnvXE1FYKX1NVzTM+ThIDD5SBRaoEQrhJ7QcKqw7p+jTTeWix2X78NcSiF7B
         YwcGLH7lHIffCmnBY3IdqYWqDtnDivQp/Geb3Y61wxzMNT76ASSeSNbHpD6vrJh7tSq8
         JGqHEHUJqRpHGE/h0d1Fgy03wHbjiKa+0MZtnOVuRGvO48cLN7Al8Q056g0eSguyi1X1
         gf0MDjvBeAN5bKsm1ZW7B1Vn/0zt26xRSr6YZy//NrtFzDH/VjbcecpBBpuWb5+mePNj
         Z7KA==
X-Forwarded-Encrypted: i=1; AL+hErG9ihsmqccZzZ4CNIKodZZS903E5Q9h4T+KvaO+ygal/sAvhI9RWjXC7l8enzoZ/9bTb9sRK0BzlSdx@vger.kernel.org
X-Gm-Message-State: APuU4Z/oFpCuozb8nTfnXx2+BjY3MJ03GwBio9EO/o/4dBt86pn1zCmo
	IliBuCB2FzroiYxeuvQ3qzvGvsO2zcLCFVDB91xsnwAjEs3eS/9PwbC2P1HbiQ2Rr3/3PTHfcxu
	hSgaNnvOg4EKEJS6VCewBd1j8MGz62Gg=
X-Gm-Gg: AZFdTZcotAmXGmpgcOBmWXfvoI+g67dOJx6TfY3ggmsM7PI0naX3CWKZIdCM0ksmNAf
	RgZsmkuAEt7ywDcmQOhMjAxUdkkmyBwhWLbUDDl0xFgN0cWe2jhecnf//jX8kR4AW/GSLFQV1+x
	kJRGxNCeghzdi8++CkqLM3PIaXTsN6ZOErsFSYVOM3osiqqXVVzJhas5F1NtPdotdFZz564lPgX
	vXLdZK/NGg52MEIUbaKiYOsqFLFlWHRKKLjZXuV+QZq55xtoM7Vv3lkjXnUhLOWrWD3JvJnC6cT
	53fYVvNtdFVcm6QGKo9ca+OsQR2y0PdQVqg2NuIw8fIaosdZvOtWb7k5xraFvTqH0on2w3ZaL5S
	Qsay7lmbd9VqO6ZhjGlNx64mtQi9VhIemRbTO42XvvFuDJxlw2jnM3meeof3y3CW4EJgh+j/nx8
	FnfiSqxygUu/TOEALGXARTUmCqsTN6PjkLQB2nwHlIdPkDNt6oMu8=
X-Received: by 2002:a05:7300:4721:b0:386:da66:671f with SMTP id
 5a478bee46e88-386da66762cmr2781680eec.28.1795699835188; Thu, 26 Nov 2026
 05:30:35 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115090520.102216-1-clamor95@gmail.com> <20261115090520.102216-2-clamor95@gmail.com>
 <0670d537-0f9a-43dd-9d48-90272f04f1e2@sirena.org.uk> <20261126122936.GH38590@joneslee-macbookpro.roam.internal>
 <c0bc9e91-fe8d-4c0c-a6c0-f7c8d4d086a9@sirena.org.uk>
In-Reply-To: <c0bc9e91-fe8d-4c0c-a6c0-f7c8d4d086a9@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 15:30:22 +0200
X-Gm-Features: Aa3M54phpO9TY-BjFhMXHRwC2_FlICHLesKqjIioZHRgOyOaeZaLBv9530oQbas
Message-ID: <CAPVz0n3tpcEteSfU+51_FeJaYYMwz522h968nWHSw2gz6+336g@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] regulator: dt-bindings: maxim,max8907: Document
 LED support
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:2=
4 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 26, 2026 at 12:29:36PM +0000, Lee Jones wrote:
> > On Sun, 15 Nov 2026, Mark Brown wrote:
> >
> > > On Sun, Nov 15, 2026 at 11:05:18AM +0200, Svyatoslav Ryhel wrote:
> > > > The Maxim MAX8907 PMIC supports a single LED; document it.
> > >
> > > Acked-by: Mark Brown <broonie@kernel.org>
> >
> > You should just apply this, I think.
>
> Well, it doesn't apply so...  :/

Obviously, Lee did not pick up
https://lore.kernel.org/lkml/20261123150224.199601-1-clamor95@gmail.com/
