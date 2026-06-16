Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14E23DA7E0
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591138; cv=pass; b=Otuxll5h5GgaghWS48MI3Rs7qvUOEcxhBDKpnRF52rVhOKHJtCUSNsTn14OdWp9YNjcaVDarmRCRyflmSk6pOE7em3zgTBP+qPWoX5sFNEvdLFeK1XHqr8tn4vH0EMMtHW0doNYZ0PmioV+mbKw2jrTYKcVv0qVV8gaUottN6dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591138; c=relaxed/simple;
	bh=YZplQ6Ddkpj2GJX3+/D7fSo3HWc2/s74s4mdCUpbfxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sydOxfPEQh6o2n5dL5kG1oSlnMSPoxhILCL9mlNai+OSuFi5ZEhydq2vxjXIbAGZ6Og2+udJKSr7IObafF2nmCN38XM3LXm0uLKJdcvZ+wBF2W+9pRe/16+DsOg6gSbFzwhi8CbD5+Q5Rk0FJ2NKG2NEbquHVEG2xv7Y1RkDbS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9ppV8ZT; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9ppV8ZT"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304f590dd91so4773913eec.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 23:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781591137; cv=none;
        d=google.com; s=arc-20240605;
        b=bSIq+JVx5/baBCa/OU0jLmPGPI7SQNqc5PsAgPtbzp6aWs+ykRt4R3HV9BjOw4ppZG
         UJT/laf1k3pJ832gKjL25ZL2WYsNKa4u/G2/WFm3BqhYiORodA7GO2Utt2wvSqvVmQ8b
         0fzoZG3hPQhOeU/bRa9rJgNf5Hz1YZgVlL/B2hjum6HkNKQ2n1IT7oLaQwduuS4SImcj
         /KkWD6O8pLdljzkwUWAx0aH0VqMpNxT2wfT06yufCvNCjmdicZKxjamqGjfZUzm78PEB
         N4tqO/R5ipZTzzHHTjpPHntE7jCRLT1FZYD/G6I9r5A7BUU3hqVmXe5P7XD/Bn8+jfWA
         DKJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YZplQ6Ddkpj2GJX3+/D7fSo3HWc2/s74s4mdCUpbfxs=;
        fh=W+nsu7O/khHViCRh124r/CmO1jQpkUTW7fFlRak/whM=;
        b=MHcDNxu22yvXfAlJ7ypj0P8BU87DRJgOB7Xk+5is3yBqS7BCiHe1H1BEDhvC8rkTg9
         NlGMhKqh35DdlNR3vPrGmHfuxH5kTqbTKembbt7tpmw7ZUwDvK/4EXqMVQAhX5aMHi2s
         83axAq47EezqVhUEsaN/S+Oxl5S3l0w7nqOfXTS4YJs5AU7E/e7YoUa4euK8ZY/XRMl7
         sd3bJcJ1bkUreN+SKh0FWE47iwFWRmA5u2X/xpGV2C5FUyS9wQepCKshl6CalCcx7hl1
         +8WmYFf6UsCoDyVjg7SLd9i802QIptHuuO0KZRtL59Re4YkNgfK834tQiTE+mjTlNvQI
         ZcXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781591137; x=1782195937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZplQ6Ddkpj2GJX3+/D7fSo3HWc2/s74s4mdCUpbfxs=;
        b=Y9ppV8ZTAJsGkPvzOdot+jVkZSpot2S/5K09jxMR9cndK3snzxUex6zEB7RijV/MhE
         d676Jd5D5crvU0ByXtjIRIyE5cfGMsNrD1/DzdNguEPz7m81ogiQVNHOVS95V500qCQS
         KA/ZVzykUnB/4utvkfwbgYi43Paecnjt10/nYwU++LXJp+fExcaFT2+WRgsFYgipR0Lf
         VlHbTudjLw+ZFrzcKyh9QdAe7KNSHTL2kHa0GAp5bXbJbfGUDeQ2fUCHwnQ1M3g7qq10
         7tMes9ttSCCEwlUapmWdmWZKGAACmONaU9fNpepigCdqX5PDHzEjCNLcNt9brCLhSmdZ
         GQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781591137; x=1782195937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YZplQ6Ddkpj2GJX3+/D7fSo3HWc2/s74s4mdCUpbfxs=;
        b=bc8jEkjNE9bCSYdz3k1BMiNQwLnPlDVQLn2zSJAhVxcK5PpCLtopYSQUMQGGTWHeGu
         E81lWTXElC/MGERfhxL51d9QkMQJBsf8kEL1p1LiMQLZBJCfDQDP6ytD0GjaS7uCWcJA
         t2wZyaEGOVkCaqjHM8IZ7LWcVS3SJjigGMN3DzEsIRdqbkXeekPpwTtvb2M5awvMR79i
         EfM3XiBczUpPWMnqL8iswFRbxN5/6AClJpulPlmgDCO0EpluK76bp9j574tCx4T1iTUI
         ujm/afWRVjF9gRY12c1HgMWUP4P7DS6UySF1P6IiECBQYki8Jp3Wqiuxl1ScikdW7R9u
         AWAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xUYpbwJI8cl3v3FwLRaV4yciZzExp23UICEf2cjdwIBUe+5oA4zpI8Z1/dL6e3i1fR/G44sSR8U2z@vger.kernel.org
X-Gm-Message-State: AOJu0YxD8ZSc6Frm1eiRVHlXRSo1yNJrlLD9wBfk6h3cmB5aP/Ia21Jo
	xvFW72Q5sZNq6foUBjuMGpaw6e3YZBn8vKyKyCDHlI8fYBrsvT77Y3gH5/J3IcODDWgmYP8GxJ4
	RUpQX0N+40D3GQjvSGVN08nOlV97dkxs=
X-Gm-Gg: Acq92OFLPWn+7oDqi8gPBKIzUe1jG/Ter0Thu11GTDtmC5QDBG4KXcW/qsvm3ORPU/p
	YD3loqZ/kMlyv8T+KpbflfBqhRyHTgUe/mvNuZLKAQhpv+nx7T43dE6VfcSoWwzOHrw21k1+yOs
	oRpuS886S48bG0WMKhgbFAxcakWvCreEbvGhNUBhwF5Wn7x22WTlD2WoF9SzQy3XGBOR7PHNBLR
	yWv9+igcrVPMCpbxKDrYEGlEbvvAgshWaTVsmcLHoAdShACh2Dz93x5/+A9U8LAuj6VX1Xj7ngj
	jcGrneBL
X-Received: by 2002:a05:7300:2202:b0:304:5db8:da95 with SMTP id
 5a478bee46e88-30ba5f6dc2bmr1364047eec.23.1781591136757; Mon, 15 Jun 2026
 23:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528053203.9339-1-clamor95@gmail.com> <20260528053203.9339-5-clamor95@gmail.com>
 <ajDPtOyr8GJYaVYQ@google.com>
In-Reply-To: <ajDPtOyr8GJYaVYQ@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 16 Jun 2026 09:25:25 +0300
X-Gm-Features: AVVi8CfyBzDLnTjfR4jMIsriu_x6XwPfClLdZn_4ROEykRr_gBRt_FIINro_bck
Message-ID: <CAPVz0n2fnM6zYtP9bCtsY9mcLdce_R+1UPmMo0o4JRgjnhuhKA@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 16 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 07:2=
6 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Thu, May 28, 2026 at 08:32:00AM +0300, Svyatoslav Ryhel wrote:
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Add support for multimedia top button row of ASUS Transformer's Mobile
> > Dock keyboard. Driver is made that function keys (F1-F12) are used by
> > default which suits average Linux use better and with pressing
> > ScreenLock + AltGr function keys layout is switched to multimedia keys.
> > Since this only modifies codes sent by asus-ec-keys it doesn't affect
> > normal keyboards at all.
>
> I think using input handler to intercept ScreenLock + AltGr is quite
> awkward. I think this also passes the original key events (unless you
> make it a filter not a regular handler).
>
> I do not see benefit for reacting to AltGr+ScreenLock on other keyboards
> to activate the special mode on this one. So given the fact that you
> already mange the data stream when you split it into "serio" ports,
> maybe just intercept this key combo right there and create the input
> device and signal input events right there?
>

Though it seems awkward at a first glance, media keys are integrated
with a standard keyboard in a detachable dock. It is highly unlikely
that media keys will be used with a different keyboard then the one
that is integrated with dock. Additionally, the ScreenLock key has a
code specific to this driver and is not in general use, so even if any
standard keyboard has AltGr but none has ScreenLock specific to this
driver except the dock itself. Handler is also set as observer so it
should not interfere with work of other input devices.

> Thanks.
>
> --
> Dmitry
