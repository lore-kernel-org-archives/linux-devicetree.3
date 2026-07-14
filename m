Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB66370AFC
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 14:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037628; cv=pass; b=Nw/HUe0oth/RYJIYk8Qe4HegOfSQNkmKtVaa9YTOpE7AStdl6D8f7iqR5phGYz/VYnvRe2GtqiSVMWW8xxiEKlBoZiUcHAcZlWxRguAwHyQLkuqPYxwQnXDH+9IeLrQY0T/avhskDa6ygZdxovJOHbQUijhB18zgVycqvB2B3Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037628; c=relaxed/simple;
	bh=T9DIDFm3lzuegkQEDN325v2/6T2Fm7otzgZ6GevR3nE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtRn7vadtjs9ql4oG5c8VbsL6uM4nlzyaJhnm4x3pcfMeIBoGX1MsfJLjUHmSt/xuGrE8JdYv33PiPvV8e1Oiiuj/RYI5BG90ew92JyXAylhPDGTjc/b56btkvpZvP0kNPPkgH2m25QVsKW6kV9ocqzGacS7rq/yNGurwXY3QYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ibm/XjI/; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ibm/XjI/"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca88130e09aso2893073a12.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784037627; cv=none;
        d=google.com; s=arc-20260327;
        b=aleaz1RiZyVxMnIkeXnj5Wo+jcXE0KLLO/B9n7qmnzMRc2R94xOFsBL0lGeveYzJKr
         UfPkCps1f0ccvN6gLww4cEF6vVIK5Kwvt8r/T9NfcWJPRvl85xXw8sbPt73bJJuZHtDQ
         kjV+5nHU/BnNM8ELO/92lo6RkvUVJYQOvJlO1mABECU4ocV39NANSPqQAu53qhI4tSHH
         u6cCUKBugq5y0y1uvGtpymZsioHHiMC9reJFHqRbQLji58Fh6ih6ODqcRg+jzqliuaSO
         ojGDymFDxLewEb3MOkRTr7p+kCB4fIL/f1BzSzR167F3axJJfN0xCml558j1bIwliD1d
         TH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V2/KhXQ427CL5ieErbt2/8G6KNeA30GSlOdbiwIQ4Jc=;
        fh=rUhwfRhpshHTej8iPhBZGJErpltoQGPch0zRXmmbLG8=;
        b=oXg+Hn/50hnnt8Yt7lMEnzeRgoSgpW63SQ9KbKPFS6owWDh0G2x3CkP66G4BpVPBKX
         tJbMwvRpJRlJGTB1FAWi7Ge2FaKdyZddpEsB/yZ6RriovpkhC00w2WswoPnzfhu7eeGW
         3PXMQdmcpAGOcxPhSS2zGFkL7HWT3Ya4IQbE/UL81HVqFR3xMultFq6BLXJI4WRqev72
         hpqGjBs0YiqzzjIxepRe3f3FO8kjxd2xhLHDiodjx7JHB94ZjglZdU3+CsnmRufuKor+
         y7asyF0PxoyK3GjFHN/QUeySCpjU1y97hirdfu0RmrODHqoNkbDtxATlS55suT+Tb5YD
         hZEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784037627; x=1784642427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V2/KhXQ427CL5ieErbt2/8G6KNeA30GSlOdbiwIQ4Jc=;
        b=Ibm/XjI/UF9zGxfKyTvCLeNx0Z8KAuQRc5hxmnVoiqbgj12rW/N74Zc8//Z70MGCYc
         s32dsQpdaYE6UgSdO1VLG4Ly05kYJPcrDNYGj7H0P6SXqbUkg6sasau7TJeuMu0CYJA/
         4GWc8UxZ+z5hm4E2ur0j7iJJvdxU+jbFXCsSVWOZViELOWaKQJE4JNeBKY8+nsEZjy2N
         oodjSRD4rTxP73j2T3GmMEkb/VBD3+N2SS/28TfjxTnXDXjnskUXTiuYm6T0bw0Hk8Uv
         J0S1TuF/6wjGTXuN7UNconlyJMW6bodw0ltWL5uo8UmTxedVStJ5ErsdcCcRO21KOsY4
         klEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784037627; x=1784642427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V2/KhXQ427CL5ieErbt2/8G6KNeA30GSlOdbiwIQ4Jc=;
        b=ERj53ul78Vk06W7lp8K65g8ZxRSZfu9nZ0ZKq70I5NZ4KlPpmS7p9bIUNQPA/eGsUP
         kB0R/hnpTzT9IWyx97pZAmNFTQ8Y2ag/4ug/MhjKV4t14Ax6IhUcfGfRFLdFiCF4f55i
         Ek+xlfpYK3dIOR9ql/AUljwAzEf5YVFeoKgg4SLQZq4pGaI7E+utbZ0Au8dHOzKC8rAB
         ggaF/8cNFMWxTXB2Ra8zYJChtqZ/qnx6hHWKXG/MayweOmbT32uXNj2La6jON+jrhONV
         sXMu9In81ydjNsNVPL2Rg85YCruhYSUkhOEabi+cv8hX5Vr1SjzjsLsDjX7tIH8bmHnl
         kfzg==
X-Forwarded-Encrypted: i=1; AHgh+RpEdHiQEHcbvHWLdOsnvJSvVwM8lYtI32q/aEFUH9+NGWv00DDJB5DTjOUSg1jVOu0Fh5wD3vUo+VmQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyXIP1wDhYlwH44BlmDXy9iFldGzBrwNMNIUm+snbeybx0jRugP
	dKeUNvFO+qutWI7o4yqZdkYGayiWYJ5pv/tMlaCoc0FOA9ngKZtuUtmmOGATjf7HsrRAv60qas2
	0S/eWLOgvUCMHa81QHymohRarIOn/lcg=
X-Gm-Gg: AfdE7cmEE4iU+nRCmpTy2DLXYijgwoTbPDTeOI3vVe4jozVbrJc7ij3Q6D4lH6uDjoi
	KyEOt5WMOC5bnpGB4986JszYcunCDMpb8UM/dCN8Yhogd8zJ0Z1tFO8JPEZhqfsvhPXNzbG8AK3
	Yb4Myz8aLU7HPJSWaNzuWeKBX9kZqjyy3exFfw3r5XkyddHPoJ3b0sqnEmFZs+6sF67W32HeaL9
	W28arrJEfBFiezy6JEST+iDaz7QBgp7cTwyOtQ1tdGVr1VPee7tq9kjKDY9AQCkH4ejdosElXLL
	G+2jkOIk8ZSxNadhTcOXY+UaxDm0snBbXQzQU8kt
X-Received: by 2002:a05:6a20:72a8:b0:3c0:9c18:d5ad with SMTP id
 adf61e73a8af0-3c3572b5794mr2798444637.74.1784037626720; Tue, 14 Jul 2026
 07:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260617080031.99156-10-clamor95@gmail.com>
 <akeYWRF-wIlrHTF5@hovoldconsulting.com>
In-Reply-To: <akeYWRF-wIlrHTF5@hovoldconsulting.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 14 Jul 2026 17:00:15 +0300
X-Gm-Features: AUfX_mwnssZkuxVf2843X6HTYGv-SRm_VXHXZEuLPu7vTjXTmj8SvtNozHDr9W4
Message-ID: <CAPVz0n2EGy3uWwUfumvRxr2M_Z9ZMZ5f9=RO=S5vUsGk=ejcJQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/14] mfd: lm3533: Add support for VIN power supply
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 3 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 14:09 Johan=
 Hovold <johan@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jun 17, 2026 at 11:00:26AM +0300, Svyatoslav Ryhel wrote:
> > Add support for 2.7V-5.5V VIN power supply.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> > -static void lm3533_enable(struct lm3533 *lm3533)
> > +static int lm3533_enable(struct lm3533 *lm3533)
> >  {
> > +     int ret;
> > +
> > +     ret =3D regulator_enable(lm3533->vin_supply);
> > +     if (ret) {
> > +             dev_err(lm3533->dev, "failed to enable vin power supply\n=
");
> > +             return ret;
> > +     }
> > +
>
> No delay needed?
>

I have not found any in the datasheet, if you are aware of the delay
duration needed please elaborate.

> >       gpiod_set_value(lm3533->hwen, 1);
> > +
> > +     return 0;
> >  }
>
> Johan
