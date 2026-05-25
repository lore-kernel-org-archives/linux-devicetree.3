Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF8B3F0AB1
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 14:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720236; cv=pass; b=bigEd8+YfmwZl5/dN2qGI+zo7Tt8YTHcqVUMa6Vt4UJV4th4ig015i3dWt378h8SioHMZci4Y91cNxq3LOzuIXj/mQIYbzqginwrE/iaPgp9QJF/Wey3FlTxOJ3BliBLLyDfu3IRQB767GN0Rjtr6pyND92UyMGiqOhS1350dpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720236; c=relaxed/simple;
	bh=P0e9QPe2YCkGR4KhiV4PcnTIW8nV8j6ZmRvQc7zuxx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W24WsBFENz03fgaus1ZpMgfgaL9roxEGYFAHc84OCt1U7V3xHIUZpJiFkjQeRDPvOF/QIzI8+aKSVwFzatidrOAkSuUCai44pWIGjvsXOY+CWT2XuM7fEpbWYSScARGtRns9XfhVku2aLI8P0m9u0xXj+ZECDL2LKA8HlYrD0es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/o1+SZV; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/o1+SZV"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3044857f09aso4706653eec.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 07:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779720234; cv=none;
        d=google.com; s=arc-20240605;
        b=IXZdfZWLrCDXvnM2K6NEyX6Ft9mKWCkigBmUZeFI1VXv6mnXFvxXee8oGfG+ct3Rku
         XXPmgjmYrYfvqq9y68x78EDJ3B1qrtocpzGVpBII5oz+yVO2Q1A3PKZekLD1xJNxvnWY
         7+ItzTgv+ilp3jw/wPjElXrvbf33+EWBehY9Hqc7Ev8WLfrWXEqpG0FRgXb4eqp0dbHI
         8XZ4bcovPb8V5ev1IRsaDe4cUSWSqbOTlu9fPyDccH8NSRL5CUApS+XLdz+WFjorXIDZ
         GNz8y0OXGrzWZ6Gk3icaVp4P3BaMdZMJiCDS0ZElXaGEr655/yLOzFJA6D8atgtVxzOz
         nA5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=71wO09jVP9qmCd1Qkiubx2/BEe+jWKIUN5BAIH24AdA=;
        fh=shwLRFEtdn6Jm1mt1ohTqMj0sUBW3P4d9elQJ869Q1o=;
        b=M5txJ0MMeuSjrVX54HHv7lJm4vHJUKdh7/T6960VyV2vIagk7lH0h7iEgQ72U6PGGB
         h0qQ4C8ZKKcHIRNamYugbFkIETy9vdyXpZ/5GodPFsQ01dZAmYUu4jf1VglxkIGwXmL2
         DjOGSjt/fYOe1JKNDTrD761JMj6mTa3xh6JlmCjhCpk7krpD6aId5H9t+F04AJZ32rq9
         qSfU0k4xplJ853d/NMyF2Xs1Hvz4EUJ/ZOUTHNGo1sfBFcPsFV3j76LhollZBTjLad15
         SbbK4I26TRJ33okF6EnMbNhToNQaLLVgrz1Q9a2fss3pKB7HD8Y65nlLQ9pO/j2DUN5O
         iOHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720234; x=1780325034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71wO09jVP9qmCd1Qkiubx2/BEe+jWKIUN5BAIH24AdA=;
        b=b/o1+SZVxx8jCQlCjooQ9+G1SIGr3V4E3+7dNCUDIHfz0BgsN8hSO5dfnKP39CVdNq
         Segiyvt4Y9J2ftQjoxYIz63NnQ/KqAuwr0KxZU8XeI2KQcTehxG0d5a1AB1j9V4oOqEw
         F9wOKzoSE/n9i7A14JD3SXmR2erEMoftfgfgsjEDqcCibXwy1rf+1SeMXOUKmy4vTE2D
         6EZoobGsRQ9RBSPhnKWe/AuCg1Jbm7Fw7pkvnQ1enWE9L9NrKHq6skBUedIl5vwQubE1
         tk0OakPVOS79iSIa+P1ekohDOXKFIu4LasK1GSNbqlOxv9WKjTynNB9LM097Dylpw5DJ
         fuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720234; x=1780325034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=71wO09jVP9qmCd1Qkiubx2/BEe+jWKIUN5BAIH24AdA=;
        b=TdT7Qajs8mBluqtf5pQc0T83hf4/xyvZE0t/YJdFEg+I5R5+HSVxsnRtRrIzIJBGCM
         XVjX92si39t3/2aXOYRR3/KtwobltlVd5AFiEQfpy+j0ryKQ/o1Vpa32hy++6AXaaYQb
         tEIdbdksLxq9LQ2mZzKqwFdY8qKVjaTmJ2oTdp5/r47UdFh9eIweyG/A//HZ3qshjumG
         52gLe251HTU5mfAkQRZlcPZ4Wx+Se1GXn/88Uwwdtc7BT8OWd2mFCR9jEDuXK8GlcN9D
         i39okanNG+Uz47BDDHYWyTCWqgDOioKRw8prbZMacuOqD1nzbqfNtXVptaYz05pbfO6X
         2s+A==
X-Forwarded-Encrypted: i=1; AFNElJ+ZLlVR5p10YOko3YBMXNPUvBWTAqx23sNjRVPsCEN099COwile5dNVdEwvBhZYj0eHHKHq8Z7ys1KQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzE3n6OtuRzcHgdwwAYbUdXnRYFpMMK1FB1lFWZdBBOi7FEYQKL
	IBxs12ox21zBvmE11DYlLgWuffwqYAlM58knWLFP3crhamTwDlKwJFZF3mJZ8da18eanqX7Hg4U
	wK/5b02GDEg0lDGg8vsCWboFfi1La+Jc=
X-Gm-Gg: Acq92OEGkMtBX0PdssN/WuL1w3K8EDJo7TDZNEBIpVhTnJnwOXTus2h78GsZdjPaGHC
	nGztdk7Q22u9AaXM6+PbGIvRC/+XKv0LRj+iB33tFUW+TNZWJ/xvLyjDeQrjJbmbAbmEWGsX9Z4
	llDwDIoCXbc46Wxb4h1H/ov5CXMr2aInOnWLaNRuotHxAg5aIQ1DEqKlIV6ZVYED4yMjcuYDq20
	pSBKcONa0USgK9FhZlyQAIVueoS+ENrkHQbyY4nXTl9K7sOPV/j1e3xIQFTLzjfD2GYp+dowzF/
	MCN8LRuf
X-Received: by 2002:a05:7301:198a:b0:2d8:7302:d3d with SMTP id
 5a478bee46e88-30448f4b600mr7027108eec.8.1779720233893; Mon, 25 May 2026
 07:43:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523083013.46372-1-clamor95@gmail.com> <20260523083013.46372-4-clamor95@gmail.com>
In-Reply-To: <20260523083013.46372-4-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 25 May 2026 17:43:42 +0300
X-Gm-Features: AVHnY4JqJNzX6TKO-WM02HYhrKkr3o1HkibMA_XK5sGKWAX5Jy68yUCNtw6-GnE
Message-ID: <CAPVz0n0jpnPFh0f=CWHufzZ+e24xsem5DFTKdFu6sczCLk08Fg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] usb: chipidea: tegra: Avoid controller/PHY init if
 bus is externally controlled
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Peter Chen <peter.chen@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 23 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:3=
0 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> If the USB controller and PHY are externally controlled, then the
> registration of the controller and the PHY initialization should be
> skipped, since these configurations must be done by the device that
> controls the bus to work correctly.
>
> Since USB PHY in Tegra controls clock gates required by the controller
> itself, Chipidea core PHY management is not suitable for Tegra.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 32 ++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
>

Hello there!

This patch is required because I could not find an acceptable way to
manually remove and add a platform device. I will explain the details
below and hope that someone can give me some suggestions on how to
handle this situation.

The Tegra USB controller is the root node, and it is bound and probed
automatically. This is perfectly fine for ordinary use cases. On the
other hand, the modem used in Tegra 3 devices requires the USB
controller to be registered at the exact moment when the modem is
ready to handle USB. If this window is not respected, the modem will
not expose the USB device, and all you get is a cascade of enumeration
failures.

The solution as I see it right now: The modem has a power sequencing
driver, and the USB controller can either be autoprobed and
unregistered in the pseq probe and then registered/unregistered in the
on/off sequences, or it can have a status =3D "reserved" set in the USB
node and manually register/unregister it during the pseq on/off
sequences. This would eliminate the need for this patch.

The problem I have faced is that I cannot properly and manually
control the USB controller driver to bind -> probe it and remove ->
unbind it from within powerseq.

Help is appreciated. Thanks!

Best regards,
Svyatoslav R.
