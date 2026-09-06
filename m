Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B7B345CAE
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 17:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788715357; cv=pass; b=FFF+g69YfzOvNFvoOPNpT/4sOrgdy7UZrTILZgq6bVDhS3PEumxkPJpvr3t0yOVFIqw80feIaXHd751fziArZNEkcvvDMWp4HgpXmPH5bBn9K/iAvxL/hKwth3fP/eXZugUVWfnJrXtdQs3HZaIC5fOliycKgMame15AA0/d8XU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788715357; c=relaxed/simple;
	bh=xlfHTmswkSpLXO/4f4jYBhuVejOLiGyJyM/ej83cLuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYHk0WogGvf32QVUyGP/FHdzhh9NiuZCXc/TP7SjsyTSUm2GepXqb9+4NwS+SN745GiGRnXr89FN8KRPWiyXuDLkZj2NJnJmFsGuey7DvLwm3vaBoJJGZfqHvnq9wNBtTjdA8CBOj6T8aq7r8E1aABgT18dyFJS7wrziWTxmwtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTvN/LN1; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTvN/LN1"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbee846deecso3473802a12.1
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 10:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788715355; cv=none;
        d=google.com; s=arc-20260327;
        b=Y0HAc5bjZH9cjb/2Rm4ZQjMPk/Kg0MDEHCmykvdwzc8s86BwWw8fAsBjpIrpCme/O4
         AnBBUeYBKKDNgNHkLILnx2OdUX+JBR31qEmpQWn6Ph3XzMuiypndB/uRQuc4kng5GYTp
         sMhtZkLdIqHm595dLDiexBcuqbY9kUwgWvXic2T1taX8NWRMYEqEmaJcB8DBLgn3cEXq
         EiMG/nU90aMZAKfEqe9JmANs9L9mcGvoXrti1biuCGFHdij4S8mbpBa+4jmp9nDL9hI5
         KjRAGvO2ennaqFGQrai9mkbqfBJaUfg6bDdGqjMcpNbKjR8xOp1YVjYTzUciFgetWiip
         EOYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F+vIa+Qy5L/8ukG4yH01NZv4BrUlQHr2FP5xxn3kwXw=;
        fh=b36f5qdsCKKypqTpjdowbJ4fuDqDYF2FgvJsGODRa7Q=;
        b=krJmO5geWyyu0W/O/ghp8pp6EQwAqRiWb9fbhNSJbZS8kVnQYfzDCFlpyIx5PxXI4J
         m4u+ynCNktTI4Fii3Nj+NWGeUpo0vZHrY5ayhqspBhf1qdtEhdyH0sK3ve5iV03eoxDn
         f8QWoCSdtMs+bj2ZO4y8ASiVT7mXECAs+TLZtm49MCtIeUPcHMQV9ewMRD/i9WIdBpUc
         UnTI4C0qgBY/V3DgSt09Zw0oQQm42QFaofqbbD6D0j7cmDBk6Qd3qDMqnnrZRuHZGMI+
         A0uLSrSBU7QMRgLNyTTFZN53/p3ewWHKdjfIo1eOymaGRxbu/Yy8K2IihB48shu2jLmC
         EbXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788715355; x=1789320155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F+vIa+Qy5L/8ukG4yH01NZv4BrUlQHr2FP5xxn3kwXw=;
        b=DTvN/LN1EdaERFqCd/Pf18xk3C2W9zOejXGnr4Zon7F3zor5rZQ344+GQ1BawH8Yia
         oxrLD6jEEaJ3VX4H9A0LkI7AjDZUBT/QzS5oBGB1SLqzR9dFcpoQQwfqMFrTwPEZaB1P
         0m3rvOHTFdLh9lLU4yfbJxyweFX42h5JIcRnl9ozmPY9sAFcxuGYjAFBsARs2CATPDls
         EhZJEkWhdvjriIJ3fwyBDu21MkwGTZDYmGjDktjCV4tKkevbckt6Pii2RruUjekLWGsV
         lYM1DxyvWC7EKZK+Cm7hvHm3hx8cVCRAWMfHElaWUrYSGogaVhj9sxCmEemyKJdrhxYS
         hjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788715355; x=1789320155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+vIa+Qy5L/8ukG4yH01NZv4BrUlQHr2FP5xxn3kwXw=;
        b=cC9praCgJuhTy6TYv0/ibgkaIK/nF1LIs4cRgGSOPZQHslHvrRYbXDLuyYYXfpos5P
         wJdBEmBYj0j7BP4KKTZRAsKd+ZvCPRV06aK4T9UlCafuzffEsYhjQEZc6rJBJthoocV5
         tHVxXxDFw7aHMWBnIxJ2lNRDHeh4cFrtKODWMbHThi+H+oYFG24iYJ9ojR5EPWsI9P/Y
         nZ0VI7oeKiJHmBzqbqyxXE1mGjBqFE83WsnvMcqcfGKJkxqgMtlijJPcyeQqaOWxRTJb
         HVzAQz8r6INXMBsKsPxvw1+smR+B0aTq9PLCsgT4J0amM7c45VrP9xdWgZAv7LW5rare
         YViA==
X-Gm-Message-State: AFuF++kFdovfS3+pEKyZ/5lK8keqvogYdvR+AfVKBVwkNP2KMymeVBg4
	9wWm7cv/EbtZDqyrEgFHVstJKiUwEBEEpTqPXnNvng4AgH68xyygDG4hhElfO8EACm5so2oHm1U
	K0+/tlTcti3pmFTAe0RUyR+lX1TG8W8o=
X-Gm-Gg: AYBFou0c8aFLkrg+5YrgVVactQgozmr52zhIgizZNcjxASEypSJbu/SmlJ+WS/6/AEK
	T+0Z/lzyyA0TYAD6vaStK4E4vnocsF4gLQSLwadPwsX5reKeuswW8PKzpdMCy06+gQIVABQylTW
	7Jbf2KP2XzvoKyaVeDPr6yTAZdqZ94BYNzBpHX8hB1C14seIFFzVXBo6t3WEomPZc2J8Z9fJz2n
	SschzKWfluYsoQ/GCLKzRHQl47QeMBoaLCxVAalD/0lyRfy+dWgR6zEmd3dpb+KeaiXFAFfDnBI
	dbUWBtrbA0eWb8zRvzhBGcqEejrei/Pg7k0bPbsjqTO7zCKyJmnDiNL3PcHtxlwTNEgLwTSaK8t
	XIg==
X-Received: by 2002:a05:6a20:e607:b0:3d3:ae50:97c6 with SMTP id
 adf61e73a8af0-3da3a154de6mr29258954637.19.1788715355297; Sun, 06 Sep 2026
 10:22:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095233.420823-1-clamor95@gmail.com> <20260721095233.420823-5-clamor95@gmail.com>
 <CAPVz0n2rhZk0fjM06u=C5H4LgVOsN6ACriO1o+byx0dyqTwGzQ@mail.gmail.com>
In-Reply-To: <CAPVz0n2rhZk0fjM06u=C5H4LgVOsN6ACriO1o+byx0dyqTwGzQ@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 6 Sep 2026 20:22:23 +0300
X-Gm-Features: AcwNN1XDTtBNxGlzLOpLQ3w1y2Et6HgHVsvlBacLuEsWHZNblAyHEWGt7R_cBqA
Message-ID: <CAPVz0n2mzwp-ffUu7tw5ojXgM=+G-PT3V9pHN--dT=dnYw5hHw@mail.gmail.com>
Subject: Re: [PATCH v10 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 19 =D1=81=D0=B5=D1=80=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:2=
0 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=B2=D1=82, 21 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:53 Sv=
yatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Add support for multimedia top button row of ASUS Transformer's Mobile
> > Dock keyboard. Driver is made that function keys (F1-F12) are used by
> > default which suits average Linux use better and with pressing
> > ScreenLock + AltGr function keys layout is switched to multimedia keys.
> > Only Dock keyboard input events are tracked for AltGr pressing.
> >
> > Co-developed-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/input/keyboard/Kconfig                |  10 +
> >  drivers/input/keyboard/Makefile               |   1 +
> >  .../input/keyboard/asus-transformer-ec-keys.c | 310 ++++++++++++++++++
> >  3 files changed, 321 insertions(+)
> >  create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
> >
>
> Hello Dmitry!
>
> May you please take a look? ATM only ACK on input patches left.
>
> Thank you!

Hello Dmitry!

May you please take a look? ATM only ACK on input patches left. I
would like this patch set to move forward.

Thank you!
