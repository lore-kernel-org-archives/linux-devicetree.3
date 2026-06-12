Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F9E320393
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 01:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781227082; cv=pass; b=P7tIkJEHiLWzm0KHgenROKuvS/grk5d6/Yi4AVt8Qv0gABpxfgF2/I9AF8fjbx4me5mpwOZmYTEH7nqNgyxykHOPULfEAjbEP+95Yi68LY26FtLSGlpwoRl/UWgGySN/M+jLPlvHLFUtqa+BJCc/2yFxnOb3hnb0oiFJXQ0mNSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781227082; c=relaxed/simple;
	bh=t7GTHFGykc4rC045w6v10ej+LKR7DhjEFNr7WnpCPqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7x6HX/aTuM0Y5y/Ti7iTxjjijPAu0aFGMqS5f6PjTrAnLLrD7YOFo8GKoCFgWtnwOTMsLiC6TULKazn+nsQjffP5sujHV/RJMO6W0pevYur1HUg5OrlD/EEA28wyn4ofPkRozthJEBaEw7Ttw9MbcAqrhiX0S/7U6wVQkdkn7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcTaLBMi; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcTaLBMi"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39664fe2dd8so3339211fa.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 18:18:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781227079; cv=none;
        d=google.com; s=arc-20240605;
        b=bX5jftVEINc5Kv7fAeoxPu7zJvWhmGLv0fLmB2uPIzoMzRkiDDyx4HJD0BXlnbSwp0
         Jfj2Y9DoDExmqYztmkHf9waQNIv5Dg97MDvSh6W1AZtZN+cnFo4SZHNC1c3RP3wPwTT0
         61uWIUH6lFJDcEXwNfPFRqHUJWW2FuubxCgQEC1Z/AB/HhWQOY6fhv4lWczILKDosGsM
         WCLfcNu6YLTBNizQ9SKJT6p3P5ogB6D/tQDdV/JyB0+357ipVA4AblsWC8UQVHqrEyj9
         DQhToI+CcZit++TAq8jED1dloWjEKK92lkNRdTjCirsUD08hgGhPBCRiBqxcE0wcuQtu
         xkgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cc3iMFUn//oP8yDxcu+EBcaVb7FwW2+8uzE8Fd2fpu8=;
        fh=9PJNzi9gyRV4FEmU2sog3J03oPNRbCC06YZGvNwAu/4=;
        b=H6wp1Hyz4R2/dgi/0ZjeXw2Q3AnO+U+MzdMNuM+GK6plgXm0ndbkwkSngtGNfotkLo
         qORsRO5p/AAIiw6c3ImZTEp8DO03XdupnFuWmO5EyfUIwmNZb87XKmzzcqXmi79N8T6J
         Cah1nKliC9oCxnAQWiUjG3WB4cC4hiIYFgMHlcPdOADUWYCbxlZwy6CvMfx44UGXTfRf
         5lPqC5LjWUrCEYlAI/OlO1T+iU0HMaO6NVlrlb6VAgg+jrSFHuQoH3NPdJzTNt3kWXbx
         KhhsMo+sLCPIYtqWIFJhw9BpZEuWzNoy0b24kV8z+fuwna0sBNlzZS/fT4Lu5x56e+6f
         M7zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781227079; x=1781831879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cc3iMFUn//oP8yDxcu+EBcaVb7FwW2+8uzE8Fd2fpu8=;
        b=bcTaLBMiM/WV2rwuRBFIeSH2/tVSOTY49ZZLYPXNC/83Rwznmuc18zDRSuD24M+ZO4
         NcahlrefkxUX2udV5mIb4viDCqQvk4OrdXxsESBsjqDcEC4oIm42dAbFOrktk/+uKtBZ
         rqK41F6CKBWQ3x+drX5cRfQeC4KwJv9M1Tc8xA7wzGcQRr3Clgsa/TSL8fB2e/EFGcIK
         EWGm2M6E80v3KXT8DK1MeOIbfEdYcf445iASMeeZ0hc7ugtITeEaJ7kqfgwTzpE0wsrJ
         ZcjJkxsn0fxcaNeZLbbo7WzUu8lvvR82148olXpvkXburMF3nyFw87hobdyrn08x7S3c
         r+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781227079; x=1781831879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cc3iMFUn//oP8yDxcu+EBcaVb7FwW2+8uzE8Fd2fpu8=;
        b=GVjq3areTx1Al3lb02lKB02YYO9gW+eHpriglJenzx0kfRmsmwq3G/N+VK28o0BQng
         WIhNOnYfLB9ELGsUL7jy4I4T9OrexMyd4lzxPoUZUhPics86y8BSSjzp/VyJ7DU/zYfm
         t1lphu01A/j+v9ikAFDyTZSM4rOkTJUwDIve1L0yN6FbI1PdQI2yzcuM+IwPE7+XuTEe
         46M2sjrBEDFbEQRxhe+M2cX/kEZSKCNWY3/y+ZqcgkW9Rlj+4xQhdz5xq4GQI0D8zJ67
         SOhNqMy5Bxe53og6Qkjf88wWuy9QRgTkrh2L11OfFVpKRBXOVDv5bZLltvsQ4UjeUVMy
         H8zQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CIVegYeXEUcTOgGSGaBohdryDJY6Mmfs72Ru1cOS6xy33l2CWYHfPO16nDLD2c4Mk8hEW6KBZfWAW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd+LPGlsCnJcvCjCpGuxRoqkBtYLLlMUM6DHy+SyzgvqdZLaRg
	XDdKlq777CzbzlC/ubmMYVryi6QDaxZIh1SJ3RXYZlQHD2axyvfkaG3Oxzt1cOsm/U9XiVnOovr
	yrBeY5sn12KKVK34gdNiRY8+Cq2Qr7E4=
X-Gm-Gg: Acq92OFQSaD9hzj223QMGP7PKRoR08Ym3dieH/F3J13nULvPe9OUqbYnU3aA+bqk5ia
	AiEv5ikcC61YbSpJHnzVppRGOJ076+hLIbtcwHad/US3HGUB924omexEodTBFnQ5oezYm71oAir
	STnPbofJjFyCE3NpOh4fB5gh/eeFOUdmkfMvG9VhwYZTEDOJCx+qLAl8ZDDWrjFgDgwhNHN4RBP
	CkIwKpchUeD8pTyumFva+QlQfZ2c9r8HYCJcJOZ+o12JG8BNIRgE/VGa5DC6Yo0KOH9bO/GRZhW
	+gCVRBSL
X-Received: by 2002:a2e:a99a:0:b0:396:7927:2d14 with SMTP id
 38308e7fff4ca-3992afbd66dmr1406371fa.8.1781227078553; Thu, 11 Jun 2026
 18:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-ventura2_initial_dts-v7-0-a61d8902bc5f@gmail.com>
 <20260611-ventura2_initial_dts-v7-2-a61d8902bc5f@gmail.com> <843dc0ff-a504-4237-b0f4-d92be07e2465@lunn.ch>
In-Reply-To: <843dc0ff-a504-4237-b0f4-d92be07e2465@lunn.ch>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 12 Jun 2026 09:19:28 +0800
X-Gm-Features: AVVi8CftlH_ekg-tghtfw6NJS5VaORcKvffCfG_52e7muOzHwhtMeakE4Fesdbk
Message-ID: <CAF7HswOi3fPMFppPoGmh0QELiPz4Po4cyWuDrEHLY2vNMyKE9g@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 11:57=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > +     /* Marvell 88E6393X EEPROM */
> > +     eeprom@50 {
> > +             compatible =3D "atmel,24c64";
> > +             reg =3D <0x50>;
> > +     };
>
> How is this on both a host I2C bus, and the switches I2C bus? Are you
> using multi-master? Is there a GPIO to hold the switch in reset while
> the host access the EEPROM?
>
>       Andrew
Hi Andrew,

Thanks for taking a look at this.

To answer your questions: No, we are not using multi-master.
The EEPROM is physically isolated by a hardware I2C multiplexer.
By default, the mux connects the EEPROM directly to the Marvell switch
for its routine operation and configuration loading. The BMC's I2C bus is
physically disconnected from the EEPROM during this time.

The BMC only gains access to this EEPROM for out-of-band firmware updates.
When an update is required, the BMC or CPLD asserts a reset to the switch,
toggles the I2C mux to route the EEPROM to the BMC, performs the flash,
and then restores the original routing before releasing the switch from res=
et.

Therefore, there is no runtime concurrent access or multi-master scenario
between the host and the switch.

Would you recommend adding a comment in the device tree to clarify this
hardware isolation, or is this explanation sufficient?

Best regards,
Kyle Hsieh
