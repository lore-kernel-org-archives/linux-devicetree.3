Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7996535F5E6
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 07:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776150742; cv=pass; b=BPcg++Yrjxov0Z6XRmZxex1LSpxMmKmZCP5P/esAeYy/8JZ+Mc9iRbeVLBxQwc1fZqziiBJ8kcu25hmMPZ9JIicAiaYTeywiuLNbdqphIyB/wPEF4KHgzyMhzhrCVmRDZDWp7uqE+ujH89ivTJYP0a+mQwd+Zp5kz6kh5VVi5JU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776150742; c=relaxed/simple;
	bh=W21hpU/zPwJ5KfRYuG7wgrTjSpZ+RFTg6vZLOJQgufQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EkFVjnsGBPfqeu46VS+oTMqwlObaMDTafAWcDC3IQ8aU6rmL+OSoUyDI1CIbrxohp2bqudmAkZ0+TiTlzDoY8ET4U/K926C8Zyr6MMyUnzQ//2PndytKl6cJuzQiWdDEZDBlUyYXMSgSZBHxAjAnx0llwwThzB74Xt53cwxkvCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khQqjzoQ; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khQqjzoQ"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-651b6a003f6so1343720d50.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 00:12:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776150737; cv=none;
        d=google.com; s=arc-20240605;
        b=jy9F1Pqo3IH6OmFkFGM9/0npugs8GNSQTzHLgOeT0uUZbvKEK6yswMlnyvthh55ANu
         XulJyhVyIRbI+q98eaG3ik7jXqiaa25qNi1aKduYJkxt/GMQ+AaP2VBA3Zjuu/z9dRR9
         J2CQuwHLzoGMEOP9XnJWDZzaMpjE+DRmttm6HKtP3S0gtzx8prOP5+OVb4Kq0iFy/tTy
         1zI60CuhMEN+oKbuvaLGiQBfDdPvE14C5F6GvRsdrXiIdMuT9uOPQZ+ymrEzgiK+zffh
         FYLeOGvjzNgTT5J2xN9dHah0t1UGnaqpNyTwQRazqlZtUAFuUBcovwrt+GRpuHCbMUZl
         /Wxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UEklUAX75lJKcC6L2ltl9qbkuGK/MzM9omGGWWVYxIk=;
        fh=lRLkQqFy0wqboXSZcDpifE6qeJGnv7zW1Lb5zzQaiTU=;
        b=SHI6Bi2M22UFJBB2cWXHIfnU69f05tIK9dj2I1WEbf+qq0UXGgKL4ve08DWnC6i5RD
         UPX4zFOrI3AYJ6EKH8zz+L9I7iNv6D02nAzERwktcxLLEBf0jFxxQehwh2RwiyWAQcva
         40nPo7ZANnnoIeqnQCZzccvFVgQnqlN0x4vPJ9Bj+n3s1DUb6dZeL3qUJ+sGESE/aScG
         lAEgh8LYKrWlN+zG2iNgtLu9Ctrnbh7JQ/mjHtWPjiW2+s5LCyvvAItE+PJ+imuy5NQ9
         4xfwGu+1/hm/R4VB1Hl8nNSy/5Po2VCUIgAV8iBigxz+lt6GsR4gVcLoJZQbuKDZ1RzN
         Z7nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776150737; x=1776755537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEklUAX75lJKcC6L2ltl9qbkuGK/MzM9omGGWWVYxIk=;
        b=khQqjzoQq+DR3kuTF5LN+G6Num4ZbX8vshpGYtsdYJGVCICVjn/vPkBPpmBdAsNyIt
         Klz5qZ+MPwSbLLBSIteQxGdSoBuIPg/FESdfIdn0ZkQnGiqd5+0gsFCoUr9HLR7GYIuQ
         YCmjQ23OBCb5QWz40hwzV7FkyVMil/l9b6Ya4ICK1BX/Q4a4sVp8x7jBk9WKzd6gyHqk
         KpErnBltj4LEMQbAxcYK6XOooYEQJInavuEWGQGqprVEVxq3zKkruIcRVQA2pW09YDoS
         hze6539HC6Vzj4hzB//7GZaXA84x5bs6iI/F9MYmgqdUXEHDKJGK5aAajsIE/4V7RPY3
         GfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776150737; x=1776755537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UEklUAX75lJKcC6L2ltl9qbkuGK/MzM9omGGWWVYxIk=;
        b=OjloPS0msVCsw2yYAajOTIR8LrPjr5L2FYf4EmWS0hB6S1mpPJgqRqsEgofXLUbVy8
         54Jq6j8UlztjeSmRyacgR0ki9QUHQV4DMwlEqVBku7Byi3HOlP2CdolXtWkgmyNVT376
         O7blpLPTjpSF2UzaGzkBoum4SIar3t3R8XfNHiD72L4+MMU/ivroqLTg+3zI7YCGvWKn
         2tNkdV3GhV/9xII4vH0lHrv0A9RrDIenDTUDOoX9VRk9VzgTKk0TxYt4evARQi3xMLWe
         h4t4LiFPrmLTwmgva7xdE/QUUyu2fixsjszt8tc9LdyIbUi9d7OaHHHc2pqdldpWXc6f
         lOUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9VTGZpX5aW4cbD8BaVqGa3UTlrVc7U7nCdB9DhQvpD2N8sCfHEkQrDvRnoAwZtSKLeId8xxo21V5sk@vger.kernel.org
X-Gm-Message-State: AOJu0YxWf6aGncvXxVIDJ7HHgaN9eniWSKxaBSKOH0pYeQ3HIJZQADoI
	7VB/K9UrzpjM3kH7VdxWBUhnGtQq0zSN2CKCpRG89T02IeLRKRrzgEayl2S1ZpoYYk4Onu4GVje
	ap2qb4wRTBk8866DRo8efwgArJbUtHtY=
X-Gm-Gg: AeBDietjcecfQPcpvGKa+31cBcmlElE389u26OIdPJQ2VmadnakGvyn9YB5pmAMMVqs
	vqI94L02wRoPNaxp696KjaT/JvH7GzG5jXs8BQEg8ft969DE6j3Ailm1KTkU/teLeu+oPiCARVR
	TS9J8kWy2srdEJY4sAyfBdLIxvLn3BC2pXGEhPB4HcrKpezkxpR/j61eSr15b4LjSt9QsuhgiYd
	K7PCeCpo8u/ZmKnU26mAyxcxScmPqrL+f49a8saEZLplMKo8qe+xxol/dzA2jvfJwhi9oZEJnxs
	BiWo+CXt
X-Received: by 2002:a05:690e:168b:b0:651:b5ab:3357 with SMTP id
 956f58d0204a3-651b5ab391dmr9912157d50.49.1776150737202; Tue, 14 Apr 2026
 00:12:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com> <f58ec12c-3957-4d44-b823-6a1ae1a1dd94@kernel.org>
In-Reply-To: <f58ec12c-3957-4d44-b823-6a1ae1a1dd94@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 14 Apr 2026 09:12:06 +0200
X-Gm-Features: AQROBzCH_H9-7w6mImHbEDf_ELHtA5AMJp2lwX6Y8iAqLMql_XXAAzAws0UviM4
Message-ID: <CABdCQ=NhTkGJUh_fKnZoQMzdpyO-UbV5zrSfiNVUC7bkSBifTA@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.dev>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El lun, 13 abr 2026 a las 10:07, Krzysztof Kozlowski
(<krzk@kernel.org>) escribi=C3=B3:
>
> On 13/04/2026 10:02, Iker Pedrosa wrote:
> > This series enables complete SD card support for the Spacemit K1-based
> > OrangePi RV2 board, including UHS (Ultra High Speed) modes for
> > high-performance SD card operation.
> >
> > Background
> >
> > The Spacemit K1 SoC includes an SDHCI controller capable of supporting
> > SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
> > currently lacks basic SD controller configuration, SDHCI driver
> > enhancements for voltage switching and tuning, and power management
> > infrastructure.
> >
> > Implementation
> >
> > The series enables SD card support through coordinated layers:
> >
> > - Hardware infrastructure (patches 1-2): Device tree bindings for volta=
ge
> > switching hardware and essential clock infrastructure.
> > - SDHCI driver enhancements (patches 3-7): Regulator framework
> > integration, pinctrl state switching for voltage domains, AIB register
> > programming, and comprehensive SDR tuning support for reliable UHS
> > operation.
> > - SoC and board integration (patches 8-10): Complete K1 SoC controller
> > definitions, PMIC power infrastructure, and OrangePi RV2 board enableme=
nt
> > with full UHS support.
> >
> > This transforms the OrangePi RV2 from having no SD card support to full
> > UHS-I capability, enabling high-performance storage up to 208MHz.
> >
> > Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> > Changes in v8:
> > - Resending the series as v8. The v7 submission failed due to an SMTP
> >   error during transit, which resulted in a broken thread on the mailin=
g
> >   list.
>
> Hm? Everything is here:
> https://lore.kernel.org/all/20260413-orangepi-sd-card-uhs-v7-1-16650f49c0=
22@gmail.com/
>
> You can send individual patches to fix up threading, use --in-reply-to.

My apologies for the noise and the rapid resend.

The reason for v8 was that the v7 cover letter (0/9) failed to reach
the mailing list due to an SMTP error on my end. This left the v7
thread "headless" in the archives without the changelog or the full
context of the series. I was attempting to fix the threading
immediately so that reviewers would have a complete set of patches to
look at, but I realize now that resending the entire series on the
same day was premature.

>
> > - No functional changes from v7.
> > - Link to v7: https://lore.kernel.org/r/20260413-orangepi-sd-card-uhs-v=
7-1-16650f49c022@gmail.com
> >
>
> You already sent it on 13th of April. And now v8 the same day. Wait a
> few days to allow people to actually review your code.
>
> It's BTW merge window, so big series should slow down.

I take your point regarding the merge window. I will step back and
wait for feedback on v8 once the window closes and you have more room
for reviews.

>
> Best regards,
> Krzysztof
