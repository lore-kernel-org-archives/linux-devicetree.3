Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209743F0ABB
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102470; cv=pass; b=YcLFs+TPM7Ok1ZCzZARV4WdjLgjGjuwdc2eciwHt9+zD0QJtOnZSqCeaYDQz6sNC6uPI9pqSy6ARnAfwojTIjLcaWrneirnbDNGn+BIf2Fuss4ox7IJXiG1vgb7oRLBb5aYcSEcaxVYDnka5fPt4Il9mLVpTwVKqF0U4/k7NTQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102470; c=relaxed/simple;
	bh=YCrTVgxtNb3/Puhd+VuNFi+8Y/zMnTomZfUQA67oTaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r46Sg7KzTrLztmq0sp8ETfEdgGekBhybmM69GYUwiLPZGa32B8MJrRzEE+hg4KZt3/Toi2PXMsfrl0RrpMDo7rXoyCYBiiE9O9Xud4cZryEjMjRDrkAvDsdfVxkC57pNXghkdE1DC4bqK4XeJFBqQyjz/a4t55Nj6rLOkaaDLA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vgfd9sSR; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vgfd9sSR"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso1741784eec.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781102468; cv=none;
        d=google.com; s=arc-20240605;
        b=T43NAz3g8gPQ94c3sM0LsCeBEUFmns7BmDFGVieS7+RVNCJ/386T88E7H9dVk3WF35
         HceuCcjeZ7UM+ZLwmKLnYTp5136etBSb3GlZm9In9qzNDMPTuM9kY5XCz/oUH9HR9VqI
         AT9ds/j/OKsoPWwOGL87cVnVvqI8uXBopqfJ9keWoS6VxZVmgQ9Zzae8Zl5/4/WmHx2W
         1TDINx15YV1xdWOD6AYRzUOvi4wiOYuB3xA3w/+yLd4zPPHWaTTloAJigTupVsKryBuy
         P8mIeY3CFs+f4gJ/jeS2blIKrv9KyHGUeS1B6jsM8lvqp+MrYlmDu1x1NUcWT+vb8wif
         b37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pji6N0wT5lk6iw8ewt/c1NaXvzId0tCzXut761rthuw=;
        fh=AqDoEwi8ZLt3mX5YZJ3ZbUKwE2MnoIyX4r8o3JWfDSM=;
        b=Qr2EJSX99nn3apamb2fhLZR+XwixnztbD7yQnkwIj0e3N652L7/OYCd0ot0zs2fQ+h
         d4dvDqu6jBzPyhbB1Wh0X7TcNGCqBxwL3r9rbB4MCtMP7USAvlSUgk6oFMnBbF9CnJsW
         o3+nx2pJnf7FpUa243Vjl+GgUD36gGNoIS3rWnISo15ua16cG7AQKgiosPEilHdZil/Z
         Xa0+UbRWdu5QT8gdJvcqVqghMM/Yp1u8gBSNthOr+1IAiiC2Rw+ukBQae94jvfGwW2eU
         jA1STCnmGOIHPZNgb2TVNp0ytqxpdGM8QlaZyI252Ko7u+suezY9JxnK71rk7+5vPHCu
         UFzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102468; x=1781707268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pji6N0wT5lk6iw8ewt/c1NaXvzId0tCzXut761rthuw=;
        b=Vgfd9sSRIbk1PrSD2RgZpjXEoLqyOM46SOXwm3pspFkanQeV9n4y9HO3MvedRjXjqp
         1BEJVCKeyVVosa7InrIRhm67iKI1RCYWa3VzvMhcsCn/o+mxl+hbkJA9I35rZnf3TQqB
         E94GRyTNSV7osQqRMsmZ4gGekB25epjLVtln5NyyHQa/cDxTACpqsbMNayM3ogwSC+Qb
         wU16SIHJ5PgnE+ZYw2e7jrEvLZ/nCfJR3BwECDoUF8nZRovd1AH5ZaLjh6V8w4fR6/S8
         3qnVcvY40ulWhMRJpyG6Q+sjQjcYiGizwIq87WzPpfnVodfSbOk0aqZBSRpmZUEeD1G8
         4RZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102468; x=1781707268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pji6N0wT5lk6iw8ewt/c1NaXvzId0tCzXut761rthuw=;
        b=JSlkg9qNPXRULxVfU8rRpWQMmETvGWK6o5v9xqPZtUW9BIn3qJ8RHYVTEv59zxM6RX
         3dYAiY7LS3eKctQHFE2JtublnoxKFM6Z2Yzf5QvO7npFFyY/WoaAi7zRIrX3BaWKBqT/
         ZMSb6Fv6t9MNvdz0cl0LO12UAuSFkXUjLqCTYgqEfafvL83GDWbJfodtR0QSPA8Hjeqt
         D9T8v6WAf2VoeJhuNbMaX2YhyiSQD7K81SHIcEIo84isR3lltx+6JA/yQv10SyrnnIYC
         fPDkYHSyYduhj+xSRcHOdVCOms9b+/b4qS4owyRNi2mHqpLj1Z6eNYEJ+fxl7r57m+ku
         A+1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9quHtGcNSnECc4lzcHpr+QtCOycXo/X8xj+tNxSUW7IEuTdcEKzax9G8N7+CdQS1CALQk00s6NjO5N@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/h87bzbuYG16wd2r6/Ovy8lFfB3kqKsR79n4FpUsnDkBl0MiC
	PjW+mAIYpCFI0GD3cDJlW0c+e6ldwt/SyCFYjYuAtfMnGTcCcKsOzvEYzi+DVuQl/DEzVJxlNkV
	7kY1n3vUt3pLxF/+5B9CyubT0b7XCILE=
X-Gm-Gg: Acq92OHSdU8oWEwLrUAHek5kq8CVfBFMwSxYd5CtZcDS1ITFjAV+luezqgsF+foilmI
	chGmiZJ/sF/AP/UO+wCJnUM5kONEnJJRkcNsWe0v9sFL8fx9eBlRQExjeobkrA/Jl7JYLOIkwvA
	dc+RrTLcAoD6XIYw/o5WdszFftK4QS4goAzxdaWJIFDCvEf1V0YDKCAzLtL+Ux+ccpX3gh5U2zM
	sQ7O3M+bo6pSu4/cKJ8oafirKJjqmsYC2WuMObHX8JVdmdMUbpqnSiytY/vLzyITSR1ASrlabGG
	8qvd3vMiWXUvmkceoOU=
X-Received: by 2002:a05:7301:678e:b0:2de:c5ca:c1f3 with SMTP id
 5a478bee46e88-3077aeef992mr17016589eec.4.1781102468242; Wed, 10 Jun 2026
 07:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-11-clamor95@gmail.com>
 <aihm315UtdqJclhh@ashevche-desk.local>
In-Reply-To: <aihm315UtdqJclhh@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 10 Jun 2026 17:40:56 +0300
X-Gm-Features: AVVi8CcyvQrrDJA2ZF-oz3jxiSwxgRbJF6e_otLwcACmPvI2rKDir5j4hVf0fFQ
Message-ID: <CAPVz0n01ymfYGH+_MgfHvWqzg+tczLi8E-1q=rZ5cHu+uJrpdg@mail.gmail.com>
Subject: Re: [PATCH v4 10/14] mfd: lm3533: Set DMA mask
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 9 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 22:17=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Jun 06, 2026 at 07:57:34AM +0300, Svyatoslav Ryhel wrote:
> > Missing coherent_dma_mask assigning triggers the following warning in
> > dmesg:
> >
> > [    3.287872] platform lm3533-backlight.0: DMA mask not set
> >
> > Since this warning might be elevated to an error in the future, set
> > coherent_dma_mask to zero because both the core and cells do not utiliz=
e
> > DMA.
>
> Hmm... I am not sure about this. The entire kernel has only two drivers t=
hat
> do that, and thanks to their commit messages one of them pointed out to t=
he
> commit from 2018. So, if no other devices suffer from this, I think it ha=
s to
> be a better way of achieving the same.
>

If mfd framework warns that DMA mask is not set then this must be
addressed. Why then there is such warning at the first place if mask
can be just skipped. Then warning would be just a debug message. What
is warning today can become error tomorrow.

> --
> With Best Regards,
> Andy Shevchenko
>
>
