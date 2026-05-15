Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC1D3CF030
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828295; cv=pass; b=Keqmr9hAIe4bRETzffoYIiRSnKApL7N5JA59BMleGPK/qYNXZMCi+fGck5gTAeFzA3pb+Wg9nP4VGzdH8Z8oZ8j0bF5gPEI36M2tETCa/vLemS8HxdIBAfPY+RJR8HGzP5m4ax1ewzGc8CZkprbGdIVDneDhbRgyrnbESa44C/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828295; c=relaxed/simple;
	bh=KUdg6NaWQDrpKtiYBBG7/RuYnu0UUwnrZH1VpFsFWGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WB0LTT02KOTA7fKtPy2SD0Op5BE9Ffmp4pKodN2orzS2E6pZMkVbEQgG7vIFzuWfwm6kDCSIZjSQ93whjDH1jL8egMQfKHigMIHC+t/We4nqHevbT4fkaTiB6zkJH6TuptMSgOzFocaDV9duZHBgp3EL4OGHVvVRJKWgpyPP70M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rRSog2b/; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rRSog2b/"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bcd3ac3307so32142815ad.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 23:58:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778828293; cv=none;
        d=google.com; s=arc-20240605;
        b=EXi0JTndJlHVnUYbXAB6ka5fJ7ECCWq68SeqJWLKMVhIC97Uv+qGZ+zLY5//caYy7+
         sSZtzEOPAbsp38fheLPw2pwTWE74cEYucK4BdDIbhzamT+NHHknP0dcG6dT/UWOsc7zG
         EAQ2G5IlJlBp+QQwyy8sgYvjg1mfUduMugltpb/0Yuz7kvuQmHOFDfdMWC9JAsIVmgF+
         E4Yi9/kMJMwrwuOGvBhsM/CZRdbxin0Lts9r6N2pNgpxgs4L/n+Q4IdlDxgL9lGlV1rz
         1u4rKmeXuP7eLiRtIEmbNyw/b+4s5AZzKjox7ktUpgnSFUGU7Twdp4LbvluD2NXOSwM+
         cMdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/eC1OtdjNZ3d+8g9rIjBdvZ8lfjkRUHKUFoBnIZ0sz4=;
        fh=PkC7qSlF7JJ276XxbD6ApWyWMYsr+lG3JlTu6hpAjjI=;
        b=INWoIS7/6XjrLFSV8qx6xVthqJfshjNA+fRMN2G2nNUsvRbQfDBGx/58wc7uyoIZk7
         4Hcxtw8ahMSput7rJinT2FxrR5QZBRkwXkCG+9bhajmjc0Phpp1nABeAQyuHdmswoV4r
         p15l5dk2PJHH2YJuquYaekbmkt0/r67J4S3c7niixcpN74AfbAuvLha8cfop921iprON
         86Ciu8K/uGkd5QNu1S3bpDHZ7xeEPiMGvuj1vl5/QXcjCwOB4z4H5RsO3wPI2FO9mIM0
         l5YQHsE+38Yd4v7Z9stYHw7esT8vNwT5i919CXJ+A42vRFV5GDonxNNP9dZXFOdQhlkJ
         82Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778828293; x=1779433093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eC1OtdjNZ3d+8g9rIjBdvZ8lfjkRUHKUFoBnIZ0sz4=;
        b=rRSog2b/+pQuwpnQ/FTF3867vyBaigU15HOz7TQnKvhhN/A+BCwFYjCHP5YOYv/0KR
         9DFgfTGr8syqiKSbQBYucUKHNt4swduGZrjWnHYm/Lao8/jl2ib1bFGBDqbsT3sF2UTe
         CooyVIP1t8ozAmIhXaepD4bDfOfYYrmz+Tg5z2e7GdV9+xVrwIdCy0rfOie1ahSfD+7V
         VwOVbmGFgD68N21MgQtPxuZtk3YC9Fi8MsnxLwCo01pcNwqGoBJiAO9z40sP66/sioGo
         plu1J3uZnmATruLxrSijHOW4rcwB4hS1gXiGbwg5B1fVKh5WHq6FCF4fspXiHc60XRlI
         bEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778828293; x=1779433093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/eC1OtdjNZ3d+8g9rIjBdvZ8lfjkRUHKUFoBnIZ0sz4=;
        b=rJibazJ74JnV51VpIH1fdZXy+fswZv8A7CL03fNq0qrVjb2gCsMuQonTDWf/y6ApIK
         kz8nBe8Z/d/L0PL51hN28o5ea3iq22vzedCKP2x4R0Fi/YyOTKxOpTwjLF0EU+Giaxqn
         Ckk82B0zl+Emnu4up77unQwIU4f9SJ0Xyoqgjm5+oMZg8vuAkdl0gle6I4pADhLPZywN
         vdibu5808zcNZEsr0pmvxmAqM7MkIfhGsq3BXUBZk3sfn1OJbeDPaLhK2qXzij1WS5hi
         QrFKmAbSX2tnscIUNGNllCQT04ai/6cAP2O6sSqjylX4Lyqlp9GVTGKi70GmXKynlckM
         uakQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LHq5RZBmMkP4rY82P8XFwcxBHDlikyW4oxdQGXl0MR5IMIwvwubXHp273c2JLLbYh4Qf5dXX9uHsU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5oaSqM4kyzB94Gaw4y8zCHT70omNqRy2KVJdu8ewa/Wv4EaVG
	57kTgLLO8M6TBU7mNamJy6oS4WeOzCxLCSHpwyNKr6LKph8Sy1knbCE2LAUmUOS8hAsT4gXTyml
	GXejyiEpMmkAUX3jU+OAv/8QCqKHbzDg=
X-Gm-Gg: Acq92OE/lUMpve0TSo3pc+zNSleH6rANhcjx7uFwkGSR4fTZl0f2lBmTeFxd9IARNCz
	QAtFYbIs/Or4HOwOyIMDZMcG8f2BZK9qDHSh0k36KegV4SfO7wSdfHjv6aXEzQw75CJf0dvw3aO
	mdV60ChVa1z0deomRhzUtgKkouTJD5YZ7l3pcZUswRCF+TXN3iBoRfQnqzcUHFstF1D9ttRT51a
	yORllkHuK6Mzhwn/j6sRWRPrT5VG4kRI7Qry3Fdp0B9//vAOgvbIK22fa4HxMIcz5AHbqvK2IJG
	pb6DUImRcafFB+wSiyFi1Bo1x6pFd0aM25QlpQ==
X-Received: by 2002:a17:902:bd0a:b0:2b2:4260:109 with SMTP id
 d9443c01a7336-2bd7e980363mr21178305ad.23.1778828293255; Thu, 14 May 2026
 23:58:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-3-phucduc.bui@gmail.com> <20260511220354.CCDCBC2BCB0@smtp.kernel.org>
In-Reply-To: <20260511220354.CCDCBC2BCB0@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 15 May 2026 13:58:01 +0700
X-Gm-Features: AVHnY4IkpWSudu6WWXvdLPvc-p7JcRPzpQsP4WMEAKh-EKbzc9nN8ZsT1I8ujWg
Message-ID: <CAABR9nHrBceHOoOR1ZqoBPjx2JyWBFKtYh_VNOoa8oeF4+St=w@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] arm: dts: renesas: r8a7740: Add clocks for FSI
To: sashiko@lists.linux.dev
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, May 12, 2026 at 5:03=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> Will adding the spu clock to the device tree without the corresponding dr=
iver
> support cause the common clock framework to automatically disable it duri=
ng
> system initialization?
>
> If the bootloader leaves the spu clock enabled, and the kernel disables i=
t
> because the driver hasn't claimed it yet, could this cause a regression w=
here
> the system hangs on subsequent register accesses by the fsi driver?

Yes, that is the current issue.

The SPU clock was already present in the DT, but since it was not managed b=
y
the FSI driver, the common clock framework could disable it after boot.

This change adds the SPU clock to the FSI clock handling so it stays enable=
d
while FSI is active.


> To maintain bisectability, should the driver be updated to manage the spu
> clock before or in the same commit as this device tree update? I see this
> regression was addressed in a later commit adding spu clock control in
> hw_startup/shutdown, but it may break bisectability here.

Reordering should not be necessary here, since this is a pre-existing issue
rather than a regression introduced by this patch.

The SPU clock node was already present in the DT previously, and the later
driver change simply adds the missing clock management support for it.

> > +             clock-names =3D "fck", "spu", "icka", "ickb", "xcka",
> > +                             "xckb";
>
> Does appending the external clocks (xcka and xckb) here without the inter=
nal
> dividers (diva and divb) violate the strict positional order defined in t=
he
> device tree binding schema?
>
> The dt-binding schema for renesas,sh_fsi2 defines the clocks property as =
an
> ordered list where the 5th and 6th items are the internal dividers, and t=
he
> 7th and 8th are the external clocks.
>
> Since dt-validate evaluates array items positionally, will it evaluate th=
e
> external clocks against the internal divider descriptions? Should the arr=
ay
> be padded with dummy elements (like <0>) to maintain the strict positiona=
l
> order?

No. These clocks are defined as optional, and the current schema does not
define fixed positional constraints for individual clock entries.

Best Regard,
Phuc
