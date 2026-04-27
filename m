Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EC134B1B4
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 22:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777330081; cv=pass; b=O7ln9ItExd/32w9t3EIJGFA4+mPuvajuMj+D5PguEbn/aZSgQMDqYnFFPitE+bnOGrhpENkHDK59YV550N5s2tbruvvYjNQL5oUkTp8vKwwJRXfEJFovEV6+WPSnsVJCvvo8FW2w9179OpOYcKWdQ5PaGKALzA6Clvxw0pOg2Us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777330081; c=relaxed/simple;
	bh=g/DTIxvTg4VOQelNN5fyVayZnjVRxIBT5HWqH6MlSl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZGL0BIWbgERxxQ9q5BJRsTnNflLkvBa0UF9sIOqwxv9DHYNai+2p9gWTfO5AtgnCZhqu1KiIHg/gzY6afZMOTh0iqHNY8PM8HAlmujou63Epf+n2LqXrMeo827aIZD6o/I5eKqn94KfkzIes0izVOx1Xc2UggExvVLRYD0WX5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlRVkMkK; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlRVkMkK"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e91b06006so88676031fa.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 15:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777330078; cv=none;
        d=google.com; s=arc-20240605;
        b=YGQ7EMw/KmGwj3pv10bkf36mJZR5ZABnGfkumbRiYhWqAk1fynqyXkvIAneAwXC6EP
         ubLbY5d9ZWeekonXaQLOWSFXoummNN7AW1/pRt9Hk3MBKP0BcpUODF6/5GuduFPpUpLI
         RKDQdT6/VtOYTMnJQ/uDmAZ5lh29sIUWDiYH7SdVDaUODkcN0xXdMOiyGPgHFixjlpep
         WpWat+NagHr99kcLFN/KjVR1pYKMsH55j1rctRGZrSWz8A5eFt7TOL+9ohd0ElBhdw63
         Iz/vax20i5GaYxbEH1j8So8PhnM7J+ZPAEuAQoIk3sHSplHFhcR8i6TDUj1QGWED8QHC
         u46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MT+vOPM5y+vsBTPBmYGzlZIHZ/PNs3is/SMtj1uJPXQ=;
        fh=YSZ3Jp/N9/UD8p1UAKSjcpvcKur5CwCA+DgofCsR1Jw=;
        b=F6amXUEZ3EckJMHunw/0BEDGfFov95Udex2KNi3RYCtADC4Yb9uYbLE+LWNXWPARAH
         LS3WwrLR0Uz+sIB44jSng7QE2IUaGJ6ozDxJtAjPzjitTZ5GdE+xVpWBhTZ+g8VlfHFG
         SyMh5/cuHQoIXDXK9pKCs0wwxXTWeoH8bAjwO/6RN7GsUMae3lM39aFTv9Fa2lRmxGc8
         mfQgLp+p50V5yzVEqnxC5BXzQZ7QV6YMC7KJvMBZTGElHNWiKlaWfWLFUXTTkotlKG+4
         BHNHWovi3oTHzxuMB81XBqyQVL/EIcHNk7mFLPi7COTvrGDICZOX+sNSBFkH2iI9t2tA
         I5Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777330078; x=1777934878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MT+vOPM5y+vsBTPBmYGzlZIHZ/PNs3is/SMtj1uJPXQ=;
        b=XlRVkMkKX9lvflIP+Lcug6V8MSpmz+YS/uinPJCOhyRz/Jg3LnYm1pGZYU3b8Ikoe4
         P3xnfYYlaRqpqmMeygkprsa8D9ddLyifX1pWicvxg4czZ4WU9gShhkMHewt9SKgX209T
         LxoAzMJflxN5zXDGXm2xsAJRYl8Yb1sl1PMVPtP2ifkLzJ3sqJ5JJf5DnuKOg6iMS6Ne
         Ctrs40PG8B7SCQf96xvk9mXMu9LR0MWkQJLZ70IWYY+xyYHENmy92i7N2Oo9Sc+7qaIL
         Etb/VdB5D/IZ0CrKvjrIPVefrYzbC45L6IZVWsC9/ZG2Q9/UlssFEZhrcnMSRZ6hmLCw
         6Qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777330078; x=1777934878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MT+vOPM5y+vsBTPBmYGzlZIHZ/PNs3is/SMtj1uJPXQ=;
        b=a5F8yJRONq160oPPSQuvVjyqe0cA1cV4KAJq7VgOT8zMpt4c/0xSBVoAQrN9wrBqQI
         RwdOmtXMaqmK7+XVbodf3z8I55inuf+SWPj22gAwnCkVATj159waa0yLaeWCWHL361fC
         sUGrm693UF3+aAOwfzs+7eRQGDBT2ROODElHmFMDkNOv8TapHvs+eXyxF/eb1qq2khkG
         VhZD8J4x6CkHWTScrmWRZ85sbPcf4mHMNKW2DI8HX09Oar6wzrTwTKdTH5cC9+IC6Yo8
         PmkDE4D6ZEIvu9LNO1YNjuTlWzYnfVgGbIwFla/agInxo0CNDrsishL2rXoRNYG2GAva
         Nn7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8jCqc+W5L+V7ja8TLKk2EjQSricvQRwnU31SvZ1XvlijZSJH9cDGb6eqlxfexVawRlyBY38Dq6XlFj@vger.kernel.org
X-Gm-Message-State: AOJu0YyZqAUAryZEbuepvEEdzbDJhYmnqhYFaNptp//nnNEPO3y0Ra/5
	l9HkIBVrDGus6tNSKYERWyPt3D/Y/NJqkGpb7HdVVG8ier5lC9EgDXmkfO7BntLgpkF3RXJBjKt
	A2kZ1D6EdXGAX84JnpepqrTaGWZMbQnk=
X-Gm-Gg: AeBDiesNiHzPJCCGEHAffDIQt4QSU8Ynn2j8Y3r1hBzCkUoVsqSmUUG7PwawkTdbaiU
	lv/1PwZnYup5q8eoAPxiBXP2J3iKUQtOOMLLxLTX0T6pyxHRRWp6eHatzQGlXhy5Z6Czpi7GLAA
	RoV/KSSvs2DLWYRFz1iPTCCe+lAFWhc72fxx2D2NmQjb8MDz+jUnBilvQ6meONLsf5uY7/k8Jjv
	n/I4McjLA91kMobWejpo2pv32NNPPqKaj71ye9y1dxV0uB93fC+6CDZfCXby3d9GgbM2t6euCvA
	SqZkheHy144fvDi9amOA/EbkG7BMJlqZiAG92ncqsWR+XkRhTcqiSJVGEQXhFP12EhY7KYSoPO9
	EToE=
X-Received: by 2002:a05:651c:210e:b0:38e:a8ef:b48 with SMTP id
 38308e7fff4ca-39240f7078dmr980321fa.21.1777330077925; Mon, 27 Apr 2026
 15:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427100950.33936-1-piyushpatle228@gmail.com>
 <20260427100950.33936-5-piyushpatle228@gmail.com> <ae9t0WuhKgcPkfIt@ashevche-desk.local>
 <ae9vKxTrqe90OsCN@ashevche-desk.local>
In-Reply-To: <ae9vKxTrqe90OsCN@ashevche-desk.local>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Tue, 28 Apr 2026 04:17:20 +0530
X-Gm-Features: AVHnY4J9R0_pCv29MGfhvCpfnsK57dLabbazQ_SlPDKlna2tH2XmzkxQ9x28bGw
Message-ID: <CAMB+xkZ6bw1y2Awhka9Hw8WU94=NW=n8A256aez-14YC-oj_Lw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] iio: adc: hx711: introduce hx711_chip_info
 per-variant structure
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: ak@it-klinger.de, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 7:44=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Apr 27, 2026 at 05:08:17PM +0300, Andy Shevchenko wrote:
> > On Mon, Apr 27, 2026 at 03:39:35PM +0530, Piyush Patle wrote:
>
> ...
>
> > > +   chip_info =3D device_get_match_data(dev);
> > > +   if (!chip_info)
> > > +           return dev_err_probe(dev, -ENODEV, "missing match data\n"=
);
> >
> > Since we are here, it's not match data, it's driver data. "missing driv=
er data".
>
> And does it need property.h to be included?
>
property.h is already present in the driver

> Also check if dev_printk.h and errno.h are there (it may be that driver a=
lready
> uses device.h and err.h that cover these two).
platform_device.h pulls in device.h which covers dev_err_probe().
err.h covers the errno values. No new includes are needed for this patch.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
