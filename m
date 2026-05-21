Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7E134E75C
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342443; cv=pass; b=ONtqTvPDQmmQfHA4r7N6pDBAA5z4GsKTu3kbpaj0cIda3KXEb4FxSxWX1QAUFF8obc1JGHvLQ7zHnOF6WCoRveLSmrH7Zt1q56NtrsDMHE26kOM6lOLQxqF3kAcbpZgAL3jEqzEcWWlbj8+EQZsG4l5zAN8GquYEIKcjGWT3pFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342443; c=relaxed/simple;
	bh=rvRNJypYuIaXcdpikXLL+TmH4qjgE66gRUyO8Jwy6pE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QmXHYBzyxvgqWDFOxP0A8P5+js0ArUA/9fNPR93EHI2rHQ1wiIwyjjzilDDKiIm9XZCpROZ2druFCvkQz+M7Bx8ZbGNIytfN14BU1uvslkveFgnDmlwYzstx+nNKq+txjeQd21scDLO9mLRa9SCjMOHvMto6hYbPLmYUs/fHonU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqiPlTMR; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqiPlTMR"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8b7105dfb35so73469566d6.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 22:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779342441; cv=none;
        d=google.com; s=arc-20240605;
        b=icezlYuSn4O8YGWohPK4HFBFNJf32qSoKaTfaGZbaWdilZoomxK3k+RzMBO1t3klJw
         p9MUcMy2T4RvcMRUMKIXixc8TMEsYrehHti/ip619PiEsuyQhhCB2PP+VT3O1WTEMMmN
         05UqKIHsMJ+4PWS0kGkuzPDpCkstY8x0mmw03PcJ6TkJaXjH/EU7uBcPTWzVjqSX6hMN
         SnenrReqVlI6K1uhmQd+i61W4Vl/pBl43qHLA/+rHLAatdae6ah9H/nlVxZuqhAODeKj
         JyPlk7+isQW0B4nWq3gOJT5ROIbyCXs7Me3E5aJVxs1bQ43DTAk9RQznVXWOVhRMTIKM
         0SGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w25KogIBywA1a93/rf1RBOgU5z4hh07df7N09bLqYmU=;
        fh=5rOjiLstywbx4H4gJXdfCf5US5jZXBP5YoE9FbyMqEM=;
        b=TytZ/mGe+6QA0AX7xOognLKsvH2KB+Dmp21X5vbXc+mMAArZR/2LeVjwCTnlwBcBGN
         hzScKjdb8kaydRXpaECfDd+6+ucolsnakpxqAjpqKtpXl+EN0ecblp25sgIN//WesAGd
         azTkwwL24gOlGu6ErNQu3/orhVNFkxJVQ76FDZ7k0kbYeVZM8J+yC0CxgFfMmzlJ9tCt
         GF/hUKzXTFEAT3M760wjOUi9ZtPBYQIwHNLdPuulax619W71+N5Zu2zPIZmJWWcF8j6H
         1NpTrSIz3vncKtW3TmVka99exgfxQhIJmNR2sDMEnqUnqnS3tqMqOqS07i5gtgfZzaID
         bT5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779342441; x=1779947241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w25KogIBywA1a93/rf1RBOgU5z4hh07df7N09bLqYmU=;
        b=EqiPlTMRrAaIc8qFky7sVocBjJblT7RqKTYG+Jfcn42rtPvYkZqxDs5uVEIexfSKrm
         yWMvp7y6UlOfKqNC00Lxw5sXNKCexJFggE8s61gcr7QxFh9lyzPxxf9gKNh1JIriHPPD
         MqxDHaLDj2lk5Jxw8IYMkZLRJ+Qhp2Lzo+zzTLRwQw6hzAMOXsaipIfLAVUStyl6PnJG
         BXjKJN13yFdT3f+tCUUMo7o2nxejTfyKIbKXkR71xOGhG6jxfh07eP8vBio5dbWG2f2x
         +e074yCCly78/lPKWGyV684uHD+X2I6DhHDhno7ds5zch59Pav+V20kddZfQRsg+YrRg
         Rf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779342441; x=1779947241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w25KogIBywA1a93/rf1RBOgU5z4hh07df7N09bLqYmU=;
        b=IAQXaXql/8L0Hd213HtNzk2OW6FXgLAcgGFme3wD2VqUdKOu6saN55Fa79kYPOXhK6
         vL2Kb/QwvgP772MWZk40btJTAD6ntUbIoTvEI9zoBVrhlqJO03eHThzHXSicq04dHcci
         cVPDIyGcVWdcE7PXgFdkYkkaWUR+DCXLlIFkEI5DYUnYfSlx3427ZXw56EH5RWTZbAQM
         PHUnsdPiskVtIrhNapl49RTUb59R2VWSXWhlm1+NBVylAIwOg3tRJLVTtleHtjXFE5/d
         g8Apgs+2G4WAd381Y/809vWldZbm3jNT9QL+dJTdzMpDEIBdYTipI6mNsJ0CGlvEuqvy
         C0mg==
X-Forwarded-Encrypted: i=1; AFNElJ8s3mN4ydZjZLDYdtIliGnDYswhXA5yOZCoi0IPCvfqjDOq2XBH1MTQq3FIku5QnJSA/vLksoR8PeA6@vger.kernel.org
X-Gm-Message-State: AOJu0YwbIPg0O7FgBDRiOtV3dG3pxEOIEny+5/y/YEzlF25c3PYyS/QF
	2J0Q3yZghxkjgqRHJpkUbfuNnB8lVmxeErZDsqSK26T7BA5NQGRa+0/g7BFQRNqeAOBZBifS+da
	SVN6WV/lD9r5krJJ7jw3DQ4U8gmig6QI=
X-Gm-Gg: Acq92OEy5e0kA6pn/NCbv3e0GrT8jM8A4rD6dpjvUkwxk2WJcorF3MgHDe3pLVF0Vdo
	F1VHT169ATdWA1ysFC94QuGRJiqF1C+lLyPZGHF5O+tNQHBlcFDnIf3zt28unZXqEWUdeuyS2Re
	inKO4VA93mIX5GbX0ahdaKxGII93POqdyjScnj2s/pSaOI7wFrarH239ioq5FyOnzB7i4+HgyJ4
	eCLwHcGAYSekTgVVvWnIUhUJaS9tRH/5IPotaBQoJ0nZUdMZglW/bgFuEtgeFoBpJT+4x4Xq7lz
	2gQMubST2M3bcJ4ZBu+O0mU04/M2lk3+4gym4oV5XTOZfHdKBQ==
X-Received: by 2002:a05:6214:4589:b0:8ac:b1ad:3a24 with SMTP id
 6a1803df08f44-8cc6e369142mr24275146d6.27.1779342441405; Wed, 20 May 2026
 22:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509193928.19030-1-manishbaing2789@gmail.com> <agnY16I4sYAdRd9T@monoceros>
In-Reply-To: <agnY16I4sYAdRd9T@monoceros>
From: Manish Baing <manishbaing2789@gmail.com>
Date: Thu, 21 May 2026 11:17:10 +0530
X-Gm-Features: AVHnY4KAzV-NI5cDZgO-6QHQZfraoFlbvvmbGV2Hd6qkCVQ1Ph4LlYmyO8Rq1VQ
Message-ID: <CAJvdc_enTOF=+1rumSz4FD5T1ME0fnJ+SVC+jMuOTMxzyx8P1Q@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: mfd: st,stmpe: fix PWM schema and drop
 legacy binding
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: lee@kernel.org, linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,
> If the patch was split into two, each touching just one of the files,
> there would be no need for merge coordination. Also logically it's two
> patches. Would you mind splitting?

That makes perfect sense. I will split this into a two-patch series
(one for the MFD YAML fix and one for the PWM TXT deletion) and submit
it shortly as v4.
Thanks for the feedback!

Thanks and Regards,
Manish


On Sun, May 17, 2026 at 8:35=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> Hello,
>
> On Sat, May 09, 2026 at 07:39:28PM +0000, Manish Baing wrote:
> > The st,stmpe-pwm binding is already covered by the MFD schema in
> > Documentation/devicetree/bindings/mfd/st,stmpe.yaml. However, the
> > PWM subnode was missing a 'required' properties block. This allowed
> > Device Tree nodes to pass validation even if the 'compatible'
> > string was omitted. This omission could lead to probe failures
> > at runtime.
> >
> > Fix the schema by adding the missing 'required' block and
> > remove the obsolete and redundant text binding file.
> >
> > Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
> > ---
> > Changes in v3:
> > - Added 'required' properties to the pwm subnode in st,stmpe.yaml
> >   to close a validation gap identified by the Sashiko.
> > - Updated commit message and description to reflect MFD subsystem chang=
es.
> >
> > Changes in v2:
> >  - Droppped the TXT file instead of converting to YAML, as the
> >    functionality is already covered by st,stmpe.yaml.
> >
> >  .../devicetree/bindings/mfd/st,stmpe.yaml      |  4 ++++
> >  .../devicetree/bindings/pwm/st,stmpe-pwm.txt   | 18 ------------------
>
> If the patch was split into two, each touching just one of the files,
> there would be no need for merge coordination. Also logically it's two
> patches. Would you mind splitting?
>
> Best regards
> Uwe
